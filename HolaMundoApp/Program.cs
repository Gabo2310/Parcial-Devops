var app = WebApplication.CreateBuilder(args).Build();

app.MapGet("/", () => "Hola Mundo desde C#!");

app.Run();
