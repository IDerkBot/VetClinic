using System.Linq;
using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages
{
    /// <summary>
    /// Interaction logic for AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public AuthorizationPage()
        {
            InitializeComponent();
        }

        private void BtnAuth_OnClick(object sender, RoutedEventArgs e)
        {
            var login = TbLogin.Text;
            var password = PbPassword.Password;
            if (VeterinaryEntities.GetContext().Users.Any(x => x.Login == login))
            {
                var user = VeterinaryEntities.GetContext().Users.Single(x => x.Login == login);
                if (user.Password == password)
                {
                    if (IsRemember.IsChecked == true) FileManager.SetConfig(new Config(user.Login, user.Password, true));
                    PageManager.Navigate(new MenuPage());
                }
            }
        }

        private void BtnReg_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new RegistrationPage());

        private void AuthorizationPage_OnLoaded(object sender, RoutedEventArgs e)
        {
            var config = FileManager.GetConfig();
            if (!config.RememberMe) return;
            TbLogin.Text = config.Login;
            PbPassword.Password = config.Password;
            IsRemember.IsChecked = true;
        }
    }
}
