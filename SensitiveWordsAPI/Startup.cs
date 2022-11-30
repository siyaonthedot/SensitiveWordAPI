using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SensitiveWordsAPI.DAL.Utility;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using SensitiveWordsAPI.BL.Service;
using SensitiveWordsAPI.Model;
using SensitiveWordsAPI.DAL.Repository;
using AutoMapper;
using System;
using Microsoft.AspNetCore.Http;
using Microsoft.Net.Http.Headers;

namespace SensitiveWordsAPI
{
    public class Startup
    {
        readonly string OriginsPolicy = "OriginsPolicy";
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
                      
            services.Configure<AppSettings>(Configuration.GetSection("AppSettings"));
            services.AddScoped<ICacheService, CacheService>();
            services.AddScoped<ISensiveWordsService, SensiveWordsService>(); 
            services.AddScoped<IWordsRepostitory, WordsRepostitory>();

            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

            services.AddCors(options =>
            {
                options.AddPolicy(name: OriginsPolicy,
                                  policy =>
                                  {
                                      policy.WithOrigins("https://flash.co.za",
                                                          "https://localhost:44350");
                                  });
            });

            services.AddControllers();
            services.AddRazorPages();


            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "Sensitive Words API",
                    Version = "v1",
                    Description = "CRUD API for Sensitive Words and Hashing Sensitive Words.",
                    Contact = new OpenApiContact
                    {
                        Name = "Flash",
                        Email = string.Empty,
                        Url = new Uri("https://flash.co.za/"),
                    },
                });
            });


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();

            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseRouting();
            app.UseCors(OriginsPolicy);
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers().RequireCors(OriginsPolicy);
            });

            app.UseSwagger();
            app.UseSwaggerUI();

        }




    }
    }
