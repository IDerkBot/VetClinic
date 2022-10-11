using System.Linq;
using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;
using VetClinic.Views.Pages.EditPages;

namespace VetClinic.Views.Pages
{
    /// <summary>
    /// Interaction logic for ClientPage.xaml
    /// </summary>
    public partial class ClientPage : Page
    {
        public ClientPage()
        {
            InitializeComponent();
        }

        // private void ClientPage_OnLoaded(object sender, RoutedEventArgs e)
        // {
        //     DgClients.ItemsSource = VeterinaryEntities.GetContext().Clients.ToList();
        // }
        //
        // #region События на нажатие кнопок
        //
        // private void BtnDelete_OnClick(object sender, RoutedEventArgs e)
        // {
        //     var items = DgClients.SelectedItems.Cast<Client>().ToList();
        //     if (MessageBox.Show($"Вы действительно хотите удалить {items.Count} элементов", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) != MessageBoxResult.Yes) return;
        //     VeterinaryEntities.GetContext().Clients.RemoveRange(items);
        //     VeterinaryEntities.GetContext().SaveChanges();
        //     MessageBox.Show("Данные удалены!");
        // }
        //
        // private void BtnAdd_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new ClientEditPage());
        //
        // private void BtnEdit_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new ClientEditPage((sender as Button)?.DataContext as Client));
        //
        // private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        // {
        //     TbSearch.Text = "";
        //     DgClients.ItemsSource = VeterinaryEntities.GetContext().Clients.ToList();
        // }
        //
        // #endregion
        //
        // #region События изменений
        //
        // private void TbSearch_OnTextChanged(object sender, TextChangedEventArgs e)
        // {
        //     var searchText = TbSearch.Text;
        //     DgClients.ItemsSource = VeterinaryEntities.GetContext().Clients.Where(x => x.Fullname.ToLower().Contains(searchText)).ToList();
        // }
        //
        // #endregion
    }
}
