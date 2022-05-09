using System.Linq;
using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;
using VetClinic.Views.Pages.EditPages;

namespace VetClinic.Views.Pages
{
    /// <summary>
    /// Interaction logic for ServicePage.xaml
    /// </summary>
    public partial class ServicePage : Page
    {
        public ServicePage()
        {
            InitializeComponent();
        }

        private void ServicePage_OnLoaded(object sender, RoutedEventArgs e)
        {
            DgService.ItemsSource = VeterinaryEntities.GetContext().Services.ToList();
        }

        #region События на нажатие кнопок

        private void BtnDelete_OnClick(object sender, RoutedEventArgs e)
        {
            var items = DgService.SelectedItems.Cast<Service>().ToList();
            if (MessageBox.Show($"Вы действительно хотите удалить {items.Count} элементов", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) != MessageBoxResult.Yes) return;
            VeterinaryEntities.GetContext().Services.RemoveRange(items);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные удалены!");
        }

        private void BtnAdd_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new ServiceEditPage());

        private void BtnEdit_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new ServiceEditPage((sender as Button)?.DataContext as Service));

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            TbSearch.Text = "";
            DgService.ItemsSource = VeterinaryEntities.GetContext().Clients.ToList();
        }

        #endregion

        #region События изменений

        private void TbSearch_OnTextChanged(object sender, TextChangedEventArgs e)
        {
            var searchText = TbSearch.Text;
            DgService.ItemsSource = VeterinaryEntities.GetContext().Services.Where(x => x.Title.ToLower().Contains(searchText)).ToList();
        }

        #endregion
    }
}
