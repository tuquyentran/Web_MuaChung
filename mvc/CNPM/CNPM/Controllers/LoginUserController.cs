using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CNPM.Models;

namespace CNPM.Controllers
{
    public class LoginUserController : Controller
    {
        CNPMEntities db = new CNPMEntities();
        // GET: LoginUser
        // Phương thức tạo view cho Login
        public ActionResult Index(int chon)
        {
            Session["chon"] = chon;
            return View();
        }
        // Xử lý tìm kiếm ID, password trong AdminUser và thông báo
        [HttpPost]
        public ActionResult LoginAcount(TaiKhoan _user, string chon)
        {
            var check = db.TaiKhoans.Where(s => s.ID == _user.ID && s.MK == _user.MK).FirstOrDefault();
            if (check == null)
            {
                ViewBag.ErrorInfo = "Sai Info";
                return View("Index");
            }
            else
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                Session["ID"] = _user.ID;
                Session["MK"] = _user.MK;

                Session["chon"] = chon;
                if (chon.ToString() == "1")
                    return RedirectToAction("Index", "SanPhams");
                else if (chon.ToString() == "2")
                    return RedirectToAction("Index", "LoaiSPs");
                else if (chon.ToString() == "3")
                    return RedirectToAction("Index", "KhachHangs");
                else if (chon.ToString() == "4")
                    return RedirectToAction("Index", "HoaDons");
                else if (chon.ToString() == "5")
                    return RedirectToAction("RegisterUser", "LoginUser");
                else
                    return RedirectToAction("SPList", "SanPhams");
            }
        }

        // Regíter
        [HttpGet]
        public ActionResult RegisterUser()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegisterUser(TaiKhoan _user)
        {
            if (ModelState.IsValid)
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                db.TaiKhoans.Add(_user);
                db.SaveChanges();
            }
            else
            {
                ViewBag.ErrorRegister = "ID này đã có rồi !!!";
            }

            return View();
        }

    }
}