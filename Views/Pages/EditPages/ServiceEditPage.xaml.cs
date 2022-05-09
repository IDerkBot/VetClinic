using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages.EditPages
{
    /// <summary>
    /// Interaction logic for ServiceEditPage.xaml
    /// </summary>
    public partial class ServiceEditPage : Page
    {
        private readonly Service _currentService;
        public ServiceEditPage(Service selectedService = null)
        {
            InitializeComponent();
            _currentService = selectedService ?? new Service();
            DataContext = _currentService;
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            if (_currentService.ID == 0) VeterinaryEntities.GetContext().Services.Add(_currentService);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные сохранены!");
            PageManager.GoBack();
        }
    }
}
