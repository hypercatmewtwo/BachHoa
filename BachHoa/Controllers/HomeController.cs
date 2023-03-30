using BachHoa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BachHoa.Controllers
{
    public class HomeController : Controller
    {
        Mydata data = new Mydata();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult Register()
        {
            return View();
        }

    }
}