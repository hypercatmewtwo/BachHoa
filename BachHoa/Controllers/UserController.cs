using BachHoa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Management;
using System.Web.Mvc;

namespace BachHoa.Controllers
{
    public class UserController : Controller
    {
        Mydata data = new Mydata();
        // GET: User
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(FormCollection collection, User u)
        {
            var email = collection["email"];
            var password = collection["password"];
            var MatKhauXacNhan = collection["MatKhauXacNhan"];
            var name = collection["name"];
            var dob = string.Format("{0:MM/dd/yyyy}", collection["dob"]);
            var gender = collection["gender"];
            var address = collection["address"];
            var phonenumber = collection["phonenumber"];

            if (string.IsNullOrEmpty(MatKhauXacNhan))
            {
                ViewData["nhapMKXN"] = "phải nhập mật khẩu xác nhận!";
            }
            else
            {
                if (!password.Equals(MatKhauXacNhan))
                {
                    ViewData["MatKhauGongNhau"] = "mật khẩu và mật khẩu đăng nhập phải giống nhau";
                }
                else
                {
                    u.email = email;
                    u.password = password;
                    u.name = name;
                    u.dob = DateTime.Parse(dob);
                    u.gender = gender;
                    u.address = address;
                    u.phonenumber = phonenumber;
                    data.Users.Add(u);
                    data.SaveChanges();
                    return RedirectToAction("Login");
                }
            }
            return this.Register();
        }

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var name = collection["name"];
            var password = collection["password"];
            User u = data.Users.SingleOrDefault(n => n.name == name && n.password == password);
            if (u != null)
            {
                ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                Session["name"] = u;
            }
            else
            {
                ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return RedirectToAction("Index", "Home");
        }
    }
}