using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CNPM.Models;

namespace CNPM.Controllers
{
    public class CTHDsController : Controller
    {
        private CNPMEntities db = new CNPMEntities();

        // GET: CTHDs
        public ActionResult Index()
        {
            var cTHDs = db.CTHDs.Include(c => c.HoaDon).Include(c => c.SanPham);
            return View(cTHDs.ToList());
        }

        // GET: CTHDs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTHD cTHD = db.CTHDs.Find(id);
            if (cTHD == null)
            {
                return HttpNotFound();
            }
            return View(cTHD);
        }

        // GET: CTHDs/Create
        public ActionResult Create()
        {
            ViewBag.mahd = new SelectList(db.HoaDons, "MaHD", "DiaChiGiao");
            ViewBag.masp = new SelectList(db.SanPhams, "MaSP", "maloai");
            return View();
        }

        // POST: CTHDs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "mahd,masp,SoLuong,DonGia,ThanhTien")] CTHD cTHD)
        {
            if (ModelState.IsValid)
            {
                db.CTHDs.Add(cTHD);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.mahd = new SelectList(db.HoaDons, "MaHD", "DiaChiGiao", cTHD.mahd);
            ViewBag.masp = new SelectList(db.SanPhams, "MaSP", "maloai", cTHD.masp);
            return View(cTHD);
        }

        // GET: CTHDs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTHD cTHD = db.CTHDs.Find(id);
            if (cTHD == null)
            {
                return HttpNotFound();
            }
            ViewBag.mahd = new SelectList(db.HoaDons, "MaHD", "DiaChiGiao", cTHD.mahd);
            ViewBag.masp = new SelectList(db.SanPhams, "MaSP", "maloai", cTHD.masp);
            return View(cTHD);
        }

        // POST: CTHDs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "mahd,masp,SoLuong,DonGia,ThanhTien")] CTHD cTHD)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cTHD).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.mahd = new SelectList(db.HoaDons, "MaHD", "DiaChiGiao", cTHD.mahd);
            ViewBag.masp = new SelectList(db.SanPhams, "MaSP", "maloai", cTHD.masp);
            return View(cTHD);
        }

        // GET: CTHDs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTHD cTHD = db.CTHDs.Find(id);
            if (cTHD == null)
            {
                return HttpNotFound();
            }
            return View(cTHD);
        }

        // POST: CTHDs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CTHD cTHD = db.CTHDs.Find(id);
            db.CTHDs.Remove(cTHD);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
