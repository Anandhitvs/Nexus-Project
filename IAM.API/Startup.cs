using IAM.API.AuthorizationMiddleWare;
using IAM.API.DIResolver;
using IAM.DAL.DBContext;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using SharedLibraries;
using SharedLibraries.Authentication.Handler;
using System.Collections.Generic;

namespace IAM.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public IConfiguration Configuration { get; }
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddMemoryCache();
            services.IAMDIResolver();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "IAM API", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "JWT Authorization header using the Bearer scheme."
                });
                c.EnableAnnotations();
                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                      new OpenApiSecurityScheme
                      {
                        Reference = new OpenApiReference
                          {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                          },
                          Scheme = "oauth2",
                          Name = "Bearer",
                          In = ParameterLocation.Header,

                        },
                        new List<string>()
                      }
                });
            });
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy",
                    builder => builder.AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader());
            });
            services.AddDbContext<IAMDBContext>(options =>
                options.UseSqlServer(this.Configuration.GetConnectionString("PMSNexus")), ServiceLifetime.Transient);

      //      services.AddDbContext<IAMDBContext>(options =>
       //         options.UseSqlServer(this.Configuration.GetConnectionString("AMSNexus")), ServiceLifetime.Transient);

            var appSettings = Configuration.GetSection(nameof(AppSettings)).Get<AppSettings>();
            services.AddSingleton(appSettings);
     
            //services.AddScoped<IAuthenticator, Authenticator>();
            services.AddAuthentication(ConstAuthMode.DYNAMIC_AUTH)
                .AddScheme<AuthenticationSchemeOptions, AuthHandler>(ConstAuthMode.DYNAMIC_AUTH, null)
                .AddJwtBearer();
        }
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseAuthentication();
            //app.UseCors("CorsPolicy");
            app.UseCors(x => x
            .AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader());
            //app.UseHttpsRedirection();
            app.UseMiddleware<CustomAuthorizationMiddleware>().UseMiddleware<LoggingMiddleware>();
            app.UseRouting();
           // app.UseMvc();
            app.UseSwagger();
            app.UseSwaggerUI(s =>
            {
                s.SwaggerEndpoint("/swagger/v1/swagger.json", "PMS Nexus Identiry Access Management");
            });
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}