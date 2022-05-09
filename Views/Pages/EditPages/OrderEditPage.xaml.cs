using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using VetClinic.Models;
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages.EditPages
{
    /// <summary>
    /// Interaction logic for OrderEditPage.xaml
    /// </summary>
    public partial class OrderEditPage : Page
    {
        private readonly Order _currentOrder;
        public OrderEditPage(Order selectedOrder = null)
        {
            InitializeComponent();
            LvMedications.ItemsSource = VeterinaryEntities.GetContext().Medications.ToList();
            LvServices.ItemsSource = VeterinaryEntities.GetContext().Services.ToList();
            CbClients.ItemsSource = VeterinaryEntities.GetContext().Clients.ToList();
            CbPets.ItemsSource = VeterinaryEntities.GetContext().Animals.ToList();
            _currentOrder = selectedOrder ?? new Order();
            DataContext = _currentOrder;
        }

        private void LvMedications_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CalculateSum();
        }

        private void LvServices_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CalculateSum();
        }

        private void CalculateSum()
        {
            var selectedMedications = LvMedications.SelectedItems.Cast<Medication>().ToList();
            var selectedServices = LvServices.SelectedItems.Cast<Service>().ToList();
            var sum1 = selectedMedications.Sum(x => x.Cost);
            var sum2 = selectedServices.Sum(x => x.Cost);
            var totalSum = sum1 + sum2;
            TbSum.Text = $"{totalSum}";
            _currentOrder.Medications = selectedMedications;
            _currentOrder.Services = selectedServices;
            _currentOrder.Sum = totalSum;
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            if (_currentOrder.ID == 0) VeterinaryEntities.GetContext().Orders.Add(_currentOrder);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные сохранены");
            PageManager.GoBack();
        }
    }
}
