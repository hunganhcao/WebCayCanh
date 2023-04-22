using System;
using System.Collections.Generic;

namespace BTThucTap.Models;

public partial class TAnhSp
{
    public int MaSp { get; set; }

    public string TenFileAnh { get; set; } = null!;

    public short? ViTri { get; set; }

    public virtual Product MaSpNavigation { get; set; } = null!;
}
