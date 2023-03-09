using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using SendGrid;
using System.Net;
using System.Configuration;
using System.Diagnostics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using static SuSiparis.Models.IdentityModels;
using Twilio;
using SendGrid.Helpers.Mail;
using Twilio.Clients;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Rest.Api.V2010.Account.Call;
using System.Net.Mail;

namespace SuSiparis
{
    public class IdentityConfig
    {
        public class ApplicationUserStore : UserStore<ApplicationUser>
        {
            public ApplicationUserStore(ApplicationDbContext context) : base(context)
            {

            }
        }
        public class ApplicationUserManager : UserManager<ApplicationUser>
        {
            public ApplicationUserManager(IUserStore<ApplicationUser> store) : base(store)
            {

            }
            public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options, IOwinContext context)
            {
                var store = new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>());
                var manager = new ApplicationUserManager(store);


                return manager;
            }

        }
        public class ApplicationSignInManager : SignInManager<ApplicationUser, string>
        {
            public ApplicationSignInManager(ApplicationUserManager userManager, IAuthenticationManager authenticationManager)
                : base(userManager, authenticationManager)
            {
            }

            public static ApplicationSignInManager Create(IdentityFactoryOptions<ApplicationSignInManager> options, IOwinContext context)
            {
                return new ApplicationSignInManager(context.GetUserManager<ApplicationUserManager>(), context.Authentication);
            }
        }
        public class EmailService : IIdentityMessageService
        {

            public async Task SendAsync(IdentityMessage message)
            {
                await configSendGridasync(message);
            }
            public async Task configSendGridasync(IdentityMessage message)
            {
                MailAddress from = new MailAddress("");
                MailAddress to = new MailAddress(message.Destination);
                MailMessage mailMessage = new MailMessage(from,to);
                mailMessage.Subject = message.Subject;
                mailMessage.Body = message.Body;
                mailMessage.IsBodyHtml = true;
                try
                {
                    using (var client = new SmtpClient())
                    {
                        client.EnableSsl = true;
                        client.Host = "";
                        client.Port = "";
                        client.UseDefaultCredentials = false;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.Credentials = new NetworkCredential("", "");

                        await client.SendMailAsync(mailMessage);
                    }
                }
                catch (Exception)
                {
                    await Task.FromResult(0);
                }
            }

        }
        public class SmsService : IIdentityMessageService
        {
            public Task SendAsync(IdentityMessage message)
            {
                var Twilio = new TwilioRestClient(
                   ConfigurationManager.AppSettings["SMSSID"],
                   ConfigurationManager.AppSettings["SMSAuthToken"]
                );
                TwilioClient.Init(ConfigurationManager.AppSettings["SMSSID"], ConfigurationManager.AppSettings["SMSAuthToken"]);
                var result = UserDefinedMessageResource.Create(message.Body,
                    ConfigurationManager.AppSettings["SMSPhoneNumber"],
                   message.Destination);
                return Task.FromResult(0);
            }
        }



    }
}
