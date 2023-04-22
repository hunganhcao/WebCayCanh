using System;
using System.Collections.Generic;

namespace BTThucTap.Models;

public partial class Category
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Product> MaSps { get; set; } = new List<Product>();
}
