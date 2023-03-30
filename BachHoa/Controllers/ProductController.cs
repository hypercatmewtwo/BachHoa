using BachHoa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BachHoa.Controllers
{
    public class ProductController : Controller
    {
        Mydata data = new Mydata();
        // GET: Product
        public ActionResult List()
        {
            var all_product = data.Products.Where(p => p.product_id == 1).ToList();
            return View(all_product);
        }
    }
}