using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace BTThucTap.Models;

public partial class Product
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public decimal? Price { get; set; }

    public int? ManufacturerId { get; set; }
    public int? Categoryid { get; set; }
    public string? ImageUrl { get; set; }
    [Display(Name = "Product Photo")]
    [NotMapped]
    [DataType(DataType.Upload)]
    [FileExtensions(Extensions = "jpg,png,gif,jpeg,bmp,svg")]
    public IFormFile ProductPhoto { get; set; }
    public virtual Manufacturer? Manufacturer { get; set; }
    public virtual Category? Category { get; set; }
    public virtual ICollection<SellReceiptDetail> SellReceiptDetails { get; set; } = new List<SellReceiptDetail>();

    public virtual ICollection<TAnhSp> TAnhSps { get; set; } = new List<TAnhSp>();

}
