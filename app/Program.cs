
using Microsoft.EntityFrameworkCore;
using AspNetLoginApp; // для AppDbContext

var builder = WebApplication.CreateBuilder(args);
// Добавляем MVC
builder.Services.AddControllersWithViews();


// 1. Берём connection string из переменной окружения (EKS)
// если её нет — fallback на appsettings.json
var connectionString =
    Environment.GetEnvironmentVariable("CONNECTION_STRING") 
    ?? builder.Configuration.GetConnectionString("Default");

// 2. Регистрируем DbContext
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(
        connectionString,
        new MySqlServerVersion(new Version(8, 0, 36))
    )
);

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Account}/{action=Login}/{id?}"
);

app.Run();

