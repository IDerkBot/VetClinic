using System.Linq;
using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages
{
    /// <summary>
    /// Interaction logic for RegistrationPage.xaml
    /// </summary>
    public partial class RegistrationPage : Page
    {
        public RegistrationPage()
        {
            InitializeComponent();
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            if (VeterinaryEntities.GetContext().Users.Any(x => x.Login == TbLogin.Text))
            {
                MessageBox.Show("Данный пользователь уже существует!");
                return;
            }

            if (PbPassword.Password == PbConfirmPassword.Password)
            {
                VeterinaryEntities.GetContext().Users.Add(new User
                {
                    Login = TbLogin.Text,
                    Password = PbPassword.Password
                });
                VeterinaryEntities.GetContext().SaveChanges();
                MessageBox.Show("Вы успешно зарегистрировались!");
                PageManager.GoBack();
            }
            else
                MessageBox.Show("Пароли не совпадают!");
        }
    }
}
