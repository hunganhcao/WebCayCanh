﻿namespace webMalefashion.Models; 

public class Account {
    public Account(string? email, string? password, string? role) {
        Email = email;
        Password = password;
        Role = role;
    }

    public string? Email { get; set; }
    public string? Password { get; set; }
    public string? Role { get; set; }
}