namespace BachHoa.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            Order_detail = new HashSet<Order_detail>();
        }

        [Key]
        public int product_id { get; set; }

        [StringLength(255)]
        public string name { get; set; }

        public int? price { get; set; }

        [Column(TypeName = "text")]
        public string net_weight { get; set; }

        [Column(TypeName = "date")]
        public DateTime? expried { get; set; }

        [StringLength(500)]
        public string desciption { get; set; }

        [StringLength(255)]
        public string ingredient { get; set; }

        [StringLength(500)]
        public string guide { get; set; }

        [StringLength(255)]
        public string preserved { get; set; }

        [StringLength(255)]
        public string factory { get; set; }

        [StringLength(255)]
        public string brand { get; set; }

        public int category_id { get; set; }

        [StringLength(255)]
        public string image { get; set; }

        public int? quantity { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order_detail> Order_detail { get; set; }
    }
}
