using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;

namespace VetClinic.Views.Pages
{
    /// <summary>
    /// Interaction logic for MenuPage.xaml
    /// </summary>
    public partial class MenuPage : Page
    {
        public MenuPage()
        {
            InitializeComponent();
        }

        private void BtnPets_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new PetPage());

        private void BtnClients_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new ClientPage());

        private void BtnServices_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new ServicePage());

        private void BtnMedications_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new MedicationsPage());

        private void BtnOrders_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new OrderPage());
    }
}
