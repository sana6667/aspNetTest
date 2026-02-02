
using Microsoft.EntityFrameworkCore;
using AspNetLoginApp; // для AppDbContext

var builder = WebApplication.CreateBuilder(args);

// Добавляем MVC
builder.Services.AddControllersWithViews();

// Регистрируем DbContext с MySQL (строка подключения берётся из appsettings.json или переменной окружения)
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(
        builder.Configuration.GetConnectionString("Default"),
        new MySqlServerVersion(new Version(8, 0, 36)) // версия сервера MySQL в контейнере
    )
);

var app = builder.Build();

// Продакшн-настройки ошибок/безопасности
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

// Авторизация нам пока не нужна (нет аутентификации), можно оставить, но не обязательно
// app.UseAuthorization();

// Маршрут по умолчанию — на страницу логина
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Account}/{action=Login}/{id?}"
);

app.Run();

