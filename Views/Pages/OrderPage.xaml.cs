using System.Linq;
using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;
using VetClinic.Views.Pages.EditPages;

namespace VetClinic.Views.Pages
{
    /// <summary>
    /// Interaction logic for OrderPage.xaml
    /// </summary>
    public partial class OrderPage : Page
    {
        public OrderPage()
        {
            InitializeComponent();
        }

        private void OrderPage_OnLoaded(object sender, RoutedEventArgs e)
        {
            DgOrders.ItemsSource = VeterinaryEntities.GetContext().Orders.ToList();
        }

        #region События на нажатие кнопок

        private void BtnDelete_OnClick(object sender, RoutedEventArgs e)
        {
            var items = DgOrders.SelectedItems.Cast<Order>().ToList();
            if (MessageBox.Show($"Вы действительно хотите удалить {items.Count} элементов", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) != MessageBoxResult.Yes) return;
            VeterinaryEntities.GetContext().Orders.RemoveRange(items);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные удалены!");
        }

        private void BtnAdd_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new OrderEditPage());

        private void BtnEdit_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new OrderEditPage((sender as Button)?.DataContext as Order));

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            TbSearch.Text = "";
            DgOrders.ItemsSource = VeterinaryEntities.GetContext().Orders.ToList();
        }

        private void BtnMore_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new OrderInfoPage((sender as Button)?.DataContext as Order));

        #endregion

        #region События изменений

        private void TbSearch_OnTextChanged(object sender, TextChangedEventArgs e)
        {
            var searchText = TbSearch.Text;
            //DgOrders.ItemsSource = VeterinaryEntities.GetContext().Orders.Where(x => x.Fullname.ToLower().Contains(searchText)).ToList();
        }

        #endregion
    }
}
