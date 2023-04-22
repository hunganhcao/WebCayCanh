﻿using BTThucTap.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis.Options;
using Microsoft.EntityFrameworkCore;
using NuGet.Versioning;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;

using X.PagedList;

namespace BTThucTap.Areas.Admin.Controllers
{
   
        [Area("admin")]
        [Route("admin")]

        public class HomeAdminController : Controller
        {
            QlbanCayContext db = new QlbanCayContext();
            private readonly IWebHostEnvironment _webHost;
            public HomeAdminController(IWebHostEnvironment webHost)
            {
                _webHost = webHost;
            }

            [Route("")]
            [Route("index")]
            [Route("admin/homeadmin")]
            public IActionResult Index(string? token)
            {
                if (token == null) return Unauthorized();
                if (CheckTokenIsValid(token))
                {
                    var securityToken = new JwtSecurityToken(Request.Cookies["token"]);
                    var data = securityToken.Claims.First(c => c.Type == ClaimTypes.UserData).Value;

                    Customer customer = Newtonsoft.Json.JsonConvert.DeserializeObject<Customer>(data);
                    customer = db.Customers.First(c => c.Id == customer.Id);
                    if (customer.Role == "User") return Unauthorized();

                    return View();
                }
                return Unauthorized();
            }

            public static long GetTokenExpirationTime(string token)
            {
                var handler = new JwtSecurityTokenHandler();
                var jwtSecurityToken = handler.ReadJwtToken(token);
                var tokenExp = jwtSecurityToken.Claims.First(claim => claim.Type.Equals("exp")).Value;
                var ticks = long.Parse(tokenExp);
                return ticks;
            }

            public static bool CheckTokenIsValid(string token)
            {
                var tokenTicks = GetTokenExpirationTime(token);
                var tokenDate = DateTimeOffset.FromUnixTimeSeconds(tokenTicks).UtcDateTime;

                var now = DateTime.Now.ToUniversalTime();

                var valid = tokenDate >= now;

                return valid;
            }
            [Route("danhmucsanpham")]
            public IActionResult DanhMucSanPham(int? page)
            {
                
                int pageSize = 6;
                int pageNumber = page == null || page < 0 ? 1 : page.Value;
                var lstSanPham = db.Products.AsNoTracking().OrderBy(x => x.Id);
               
                PagedList<Product> lst = new PagedList<Product>(lstSanPham, pageNumber, pageSize);

                return View(lst);
            }
        [Route("danhmuchoadon")]
        public IActionResult DanhMucHoaDon(int? page)
        {

            int pageSize = 6;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstHoaDon = db.SellReceipts.AsNoTracking().OrderBy(x => x.Id);

            PagedList<SellReceipt> lst = new PagedList<SellReceipt>(lstHoaDon, pageNumber, pageSize);

            return View(lst);
        }


        [Route("DanhSachNhanVien")]
            public IActionResult DanhSachNhanVien(int? page)
            {
                var lstNhanVien = db.Staff.ToList();

                return View(lstNhanVien);
            }

            [Route("ThemSanPham")]
            [HttpGet]
            public IActionResult ThemSanPham()
            {
            ViewBag.CategoryId = new SelectList(db.Categories.ToList(), "Id", "Name");
            ViewBag.ManufacturerId = new SelectList(db.Manufacturers.ToList(), "Id", "Name");
            Product product = new Product();

            //product.Options.Add(new Option() { ProductId = 1 });
            product.Id = db.Products.Count()+1;
            return View(product);
           
            }
            [Route("ThemSanPham")]
            [HttpPost]
            [ValidateAntiForgeryToken]
            public IActionResult ThemSanPham(Product sanPham)
            {
                _ = UploadFile(sanPham.ProductPhoto);
                string uniqueFileName = sanPham.ProductPhoto.FileName;
                sanPham.ImageUrl = uniqueFileName;
            //sanPham.ImageUrl = sanPham.ProductPhoto.FileName;
                    db.Products.Add(sanPham);
                    db.SaveChanges();
                    return RedirectToAction("DanhMucSanPham");
            }

            [Route("SuaSanPham")]
            [HttpGet]
            public IActionResult SuaSanPham(int id)
            {
                ViewBag.CategoryId = new SelectList(db.Categories.ToList(), "Id", "Name");
                ViewBag.ManufacturerId = new SelectList(db.Manufacturers.ToList(), "Id", "Name");
                Product product = db.Products.Where(a => a.Id == id).FirstOrDefault();
                return View(product);
            }
            [Route("SuaSanPham")]
            [HttpPost]
            public IActionResult SuaSanPham(Product sanPham)
            {
            
            //List<Option> options = db.Options.Where(d => d.ProductId == sanPham.Id).ToList();
            //db.Options.RemoveRange(options);
            //db.SaveChanges();

            ////sanPham.Options.RemoveAll(n => n.Id == sanPham.Id);
           
                if (sanPham.ProductPhoto != null)
                {
                    _ = UploadFile(sanPham.ProductPhoto);
                    string uniqueFileName = sanPham.ProductPhoto.FileName;
                    sanPham.ImageUrl = uniqueFileName;
                }

           

            db.Attach(sanPham);
            db.Entry(sanPham).State = EntityState.Modified;
         

            db.SaveChanges();
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }

            [Route("XoaSanPham")]
            [HttpGet]
            public IActionResult XoaSanPham(int id)
            {
            TempData["Message"] = "";
            //var option = db.Options.Where(x => x.ProductId == id).ToList();
            //if (option.Count > 0)
            //{
            //    TempData["Message"] = "Không xóa được sản phẩm này ";
            //    return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            //}
            var manufacter = db.Manufacturers.Where(x => x.Id == id);
            if (manufacter.Any())
            {
                db.RemoveRange(manufacter);
            }
            var category = db.Categories.Where(x => x.Id == id);
            if (category.Any())
            {
                db.RemoveRange(category);
            }
            db.Remove(db.Products.Find(id));
            db.SaveChanges();
            TempData["Message"] = "Sản phầm này đã được xóa";
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }

            [Route("ChiTietSanPham")]
            [HttpGet]
            public IActionResult ChiTietSanPham(int id)
            {
                Product product = db.Products
                    .Where(a => a.Id == id)
                    .FirstOrDefault();
                return View(product);
            }
            [Route("ChitietHoaDon")]
            [HttpGet]
            public IActionResult ChiTietHoaDon(int id)
            {
                var hoadon = db.SellReceiptDetails.Where(a=>a.SellReceiptId==id).ToList();
                return View(hoadon);
            }
            private async Task<bool> UploadFile(IFormFile ufile)
            {
                if (ufile != null && ufile.Length > 0)
                {
                    var fileName = Path.GetFileName(ufile.FileName);
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\Tree_template\img\product", fileName);
                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        await ufile.CopyToAsync(fileStream);
                    }
                    return true;
                }
                return false;
            }
        }
    
}
