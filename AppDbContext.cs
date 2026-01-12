using Microsoft.EntityFrameworkCore;
using AspNetLoginApp.Models;

namespace AspNetLoginApp
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
        public DbSet<User> Users { get; set; } = null!;
    }
}

