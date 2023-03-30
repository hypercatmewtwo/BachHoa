namespace BachHoa.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int order_id { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int user_id { get; set; }

        public DateTime? booking_date { get; set; }

        public DateTime? delivery_date { get; set; }

        public bool? status { get; set; }

        public virtual Order_detail Order_detail { get; set; }

        public virtual User User { get; set; }
    }
}
