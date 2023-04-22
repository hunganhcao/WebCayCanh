using System;
using System.Collections.Generic;

namespace BTThucTap.Models;

public partial class Position
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Permission> Permissions { get; set; } = new List<Permission>();

    public virtual ICollection<Staff> Staff { get; set; } = new List<Staff>();
}
