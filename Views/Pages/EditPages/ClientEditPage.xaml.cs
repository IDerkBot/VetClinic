using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages.EditPages
{
    /// <summary>
    /// Interaction logic for ClientEditPage.xaml
    /// </summary>
    public partial class ClientEditPage : Page
    {
        private readonly Client _currentClient;
        public ClientEditPage(Client selectedClient = null)
        {
            InitializeComponent();
            _currentClient = selectedClient ?? new Client();
            DataContext = _currentClient;
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            if(_currentClient.ID == 0) VeterinaryEntities.GetContext().Clients.Add(_currentClient);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные сохранены!");
            PageManager.GoBack();
        }
    }
}
