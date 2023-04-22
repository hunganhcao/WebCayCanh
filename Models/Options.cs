using System;
using System.Collections.Generic;
namespace BTThucTap.Models
{
    public partial class Options
    {
        public int MaSp { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; } = null!;

        public virtual Product Product { get; set; } = null!;
    }
}
