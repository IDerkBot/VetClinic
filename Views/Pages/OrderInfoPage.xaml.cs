using System;
using System.Collections.Generic;
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
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages
{
    /// <summary>
    /// Interaction logic for OrderInfoPage.xaml
    /// </summary>
    public partial class OrderInfoPage : Page
    {
        private readonly Order _currentOrder;
        public OrderInfoPage(Order selectedOrder)
        {
            InitializeComponent();
            _currentOrder = selectedOrder;
            DataContext = _currentOrder;
        }

        private void OrderInfoPage_OnLoaded(object sender, RoutedEventArgs e)
        {
            LvServices.ItemsSource = VeterinaryEntities.GetContext().Orders.Single(x => x.ID == _currentOrder.ID)
                .Services.ToList();
            LvMedications.ItemsSource = VeterinaryEntities.GetContext().Orders.Single(x => x.ID == _currentOrder.ID)
                .Medications.ToList();
        }
    }
}
