using System;
using System.Collections.Generic;

namespace BTThucTap.Models;

public partial class SellReceipt
{
    public int Id { get; set; }

    public int? StaffId { get; set; }

    public DateTime? Time { get; set; }

    public int? CustomerId { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual ICollection<SellReceiptDetail> SellReceiptDetails { get; set; } = new List<SellReceiptDetail>();

    public virtual Staff? Staff { get; set; }
}
