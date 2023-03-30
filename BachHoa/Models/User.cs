namespace BachHoa.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            Orders = new HashSet<Order>();
        }

        [Key]
        public int user_id { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Email must be entered")]
        public string email { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "Password must be at least 6 characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string password { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Name must be entered")]
        public string name { get; set; }

        [Column(TypeName = "date")]
        [Required(ErrorMessage = "Date must be entered")]
        public DateTime? dob { get; set; }

        [StringLength(5)]
        [Required(ErrorMessage = "Gender must be entered")]
        public string gender { get; set; }

        [StringLength(255)]
        [Required(ErrorMessage = "Address must be entered")]
        public string address { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "phoneumber must be entered")]
        public string phonenumber { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
