namespace BachHoa.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order_detail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int order_id { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int product_id { get; set; }

        [Column(TypeName = "money")]
        public decimal? price { get; set; }

        public int? quanitty { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }
    }
}
