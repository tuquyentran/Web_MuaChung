using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CNPM.Models;

namespace CNPM.Controllers
{
    public class ShoppingCartController : Controller
    {
        CNPMEntities db = new CNPMEntities();
        // GET: ShoppingCart, chuẩn bị dữ liệu cho View
        public ActionResult ShowCart()
        {
            if (Session["Cart"] == null)
                return View("ShowCart");
            Cart _cart = Session["Cart"] as Cart;
            return View(_cart);
        }
        // Tạo mới giỏ hàng, nguồn được lấy từ Session
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }
        // Thêm sản phẩm vào giỏ hàng
        public ActionResult AddToCart(string id)
        {
            // lấy sản phẩm theo id
            var _pro = db.SanPhams.SingleOrDefault(s => s.MaSP == id);
            if (_pro != null)
            {
                GetCart().Add_Product_Cart(_pro);
            }
            return RedirectToAction("ShowCart", "ShoppingCart");
        }
        // Cập nhật số lượng và tính lại tổng tiền
        public ActionResult Update_Cart_Quantity(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            string id_pro = Request.Form["idPro"];
            int _quantity = int.Parse(Request.Form["carQuantity"]);
            cart.Update_quantity(id_pro, _quantity);

            return RedirectToAction("ShowCart", "ShoppingCart");
        }
        // Xóa dòng sản phẩm trong giỏ hàng
        public ActionResult RemoveCart(string id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartItem(id);

            return RedirectToAction("ShowCart", "ShoppingCart");
        }

        // Các phương thức cho thanh toán
        public ActionResult CheckOut(FormCollection form)
        {
            try
            {
                Cart cart = Session["Cart"] as Cart;
                HoaDon _order = new HoaDon();
                _order.NgayDat = DateTime.Now;
                _order.DiaChiGiao = form["AddressDeliverry"];
                _order.makh = int.Parse(form["CodeCustomer"]);
                db.HoaDons.Add(_order);
                foreach (var item in cart.Items)
                {
                    // lưu dòng sản phẩm vào chi tiết hóa đơn
                    CTHD _order_detail = new CTHD();
                    _order_detail.mahd = _order.MaHD;
                    _order_detail.masp = item._product.MaSP;
                    _order_detail.DonGia = (double)item._product.GiaBan;
                    _order_detail.SoLuong = item._quantity;
                    db.CTHDs.Add(_order_detail);
                }
                db.SaveChanges();
                cart.ClearCart();
                return RedirectToAction("CheckOut_Success", "ShoppingCart");
            }
            catch
            {
                return Content("Có sai sót! Xin kiểm tra lại thông tin"); ;
            }
        }

        // Thông báo thanh toán thành công
        public ActionResult CheckOut_Success()
        {
            return View();
        }

        // PTTT
        public ActionResult PTThanhToan()
        {
            return View();
        }

        // Thông báo thanh toán thành công
        public ActionResult ThanhToan()
        {
            return View();
        }

    }
}
