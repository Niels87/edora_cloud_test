var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Configure the HTTP request pipeline.
/* if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
} */

app.UseHttpsRedirection();

app.MapGet("/myendpoint", () =>
{
    return "Answer from myendpoint";
});
// .WithName("GetWeatherForecast");

app.Run();
