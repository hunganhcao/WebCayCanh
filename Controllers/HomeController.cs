using BTThucTap.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using X.PagedList;
using Microsoft.AspNetCore.Authorization;

namespace BTThucTap.Controllers
{
    public class HomeController : Controller
    {
        QlbanCayContext db=new QlbanCayContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index(int? page)
        {
            int pageSize = 8;

            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.Products.OrderBy(x => x.Id).Take(pageSize).ToList();

            PagedList<Product> lst = new PagedList<Product>(lstsanpham, pageNumber, pageSize);
            return View(lst);

        }
        public IActionResult SPMenu(int? page)
        {
            int pageSize = 9;// so san pham tren 1 trang
            int pageNumber = page == null || page < 1 ? 1 : page.Value;
            //var lstsanpham = db.Products.AsNoTracking().OrderBy(x => x.Name);
            var products = db.Products.ToList();
            //return View(products.ToList());
            // bieu thua lamda
            PagedList<Product> pageList = new PagedList<Product>(products, pageNumber, pageSize);
            return View(pageList);
        }
        public IActionResult SanPhamTheoCategory(int maloai, int? page)
        {
            
            int pageSize = 9;// so san pham tren 1 trang
            int pageNumber = page == null || page < 1 ? 1 : page.Value;

            var lstsanpham = db.Products.Where(x=>x.Categoryid==maloai).ToList();
            //var lstsanpham = db.Options.Where(x => x.CategoryId == maloai).ToList();
            //var lstsanpham1 = db.Products.Where(x => x.Options == lstsanpham).OrderBy(x => x.Id).ToList();

            PagedList<Product> pageList = new PagedList<Product>(lstsanpham, pageNumber, pageSize);

            ViewBag.maloai = maloai;
            return View(pageList);
        }
        [HttpPost]
        public IActionResult SearchProducts(string price_range)
        {
            // split the price range string into price_from and price_to
            var rangeValues = price_range.Split('-');
            var price_from = decimal.Parse(rangeValues[0]);
            var price_to = decimal.Parse(rangeValues[1]);

            // search products based on price range
            var products = db.Products.Where(p => p.Price >= price_from && p.Price <= price_to).ToList();
            // return search results
            return View(products);
        }
        public IActionResult ChiTietSanPham(int maSp)
        {
            var sanpham = db.Products.SingleOrDefault(x => x.Id == maSp);
            var categories = db.Categories.Where(x => x.MaSps.Any(x => x.Id == maSp)).ToList();
            ViewBag.categories=categories;
            return View(sanpham);

        }
        public IActionResult UserDetails()
        {
            var securityToken = new JwtSecurityToken(Request.Cookies["token"]);
            var data = securityToken.Claims.First(c => c.Type == ClaimTypes.UserData).Value;

            Customer customer = Newtonsoft.Json.JsonConvert.DeserializeObject<Customer>(data);
            customer = db.Customers.First(c => c.Id == customer.Id);
            return View(customer);
        }
        public IActionResult ShoppingCart()
        {
            var securityToken = new JwtSecurityToken(Request.Cookies["token"]);
            var data = securityToken.Claims.First(c => c.Type == ClaimTypes.UserData).Value;

            Customer customer = Newtonsoft.Json.JsonConvert.DeserializeObject<Customer>(data);
            customer = db.Customers.First(c => c.Id == customer.Id);
            var cartDetails = db.CartDetails.Where(c => c.CustomerId == customer.Id).ToList();
            return View(cartDetails);
        }
        [HttpPut]
        [Authorize]
        [Route("api/cart/update")]
        public IActionResult UpdateCart(int amount, int productId)
        {
            if (amount < 0)
            {
                var cartDetail = db.CartDetails.First(c => c.ProductId == productId);
                db.CartDetails.Remove(cartDetail);
                db.SaveChanges();
            }
            else
            {
                var cartDetail = db.CartDetails.First(c => c.ProductId == productId);
                cartDetail.Amount = amount;
                db.SaveChanges();
            }
            return Ok("cart updated");
        }

        public Product GetProductById(int id)
        {
            return db.Products.Where(x=>x.Id==id).First();
        }

        [HttpGet]
        [Authorize]
        [Route("api/cart/total")]
        public float GetTotalMoney()
        {
            var securityToken = new JwtSecurityToken(Request.Cookies["token"]);
            var data = securityToken.Claims.First(c => c.Type == ClaimTypes.UserData).Value;

            Customer customer = Newtonsoft.Json.JsonConvert.DeserializeObject<Customer>(data);
            customer = db.Customers.First(c => c.Id == customer.Id);
            var cartDetails = db.CartDetails.Where(c => c.CustomerId == customer.Id).ToList();
            float res = 0f;
            foreach (var detail in cartDetails)
            {
                var product = db.Products.First(p => p.Id == detail.ProductId);
                res += (float)(detail.Amount * product.Price);
            }
            return res;
        }
        [HttpPost]
        [Authorize]
        [Route("api/add-to-cart")]
        public IActionResult AddToCart(int id)
        {
            // get user
            var securityToken = new JwtSecurityToken(Request.Cookies["token"]);
            var data = securityToken.Claims.First(c => c.Type == ClaimTypes.UserData).Value;

            Customer customer = Newtonsoft.Json.JsonConvert.DeserializeObject<Customer>(data);
            customer = db.Customers.First(c => c.Id == customer.Id);


            CartDetail cartDetail = new CartDetail();
            cartDetail.CustomerId = customer.Id;
            cartDetail.ProductId = id;
           
            cartDetail.Amount = 1;

            db.CartDetails.Add(cartDetail);
            db.SaveChangesAsync();
            return Ok("added to cart" + id);
        }
        [Authorize]
        [Route("api/checkout")]
        [HttpPost]
        public IActionResult CheckOut()
        {
            var securityToken = new JwtSecurityToken(Request.Cookies["token"]);
            var data = securityToken.Claims.First(c => c.Type == ClaimTypes.UserData).Value;

            Customer customer = Newtonsoft.Json.JsonConvert.DeserializeObject<Customer>(data);
            customer = db.Customers.First(c => c.Id == customer.Id);
            var cartDetails = db.CartDetails.Where(c => c.CustomerId == customer.Id).ToList();


            SellReceipt hd = new SellReceipt();
            hd.CustomerId = customer.Id;
            hd.Time = DateTime.Now;
            hd.Id = db.SellReceipts.Count() + 1;
            foreach(var ct in cartDetails)
            {
                var temp = new SellReceiptDetail();
                temp.SellReceiptId = hd.Id;
                temp.Amount = ct.Amount;
                temp.ProductId = ct.ProductId;
                hd.SellReceiptDetails.Add(temp);
            }
            
            if (cartDetails.Any())
            {
                db.RemoveRange(cartDetails);
            }
            db.SellReceipts.Add(hd);
            db.SaveChangesAsync();
            //  return Ok("Đã thanh toán");
            return RedirectToAction("Index", "Home");
        }
        
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}