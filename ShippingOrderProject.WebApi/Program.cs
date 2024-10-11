using ShippingOrderProject.Infrastructure;
using ShippingOrderProject.Application;
using Hangfire;
using ShippingOrderProject.Application.Jobs;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddApplication();
builder.Services.AddInfrastructure(builder.Configuration);

// Add services to the container.
builder.Services.AddControllers();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Add Hangfire services
builder.Services.AddHangfire(config =>
    config.UseSqlServerStorage(builder.Configuration.GetConnectionString("SqlServer")));
builder.Services.AddHangfireServer();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Enable Hangfire Dashboard
app.UseHangfireDashboard();

RecurringJob.AddOrUpdate<CarrierReportJob>(
    "generate-daily-carrier-report",
    job => job.GenerateDailyCarrierReport(CancellationToken.None),
    Cron.Hourly);

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
