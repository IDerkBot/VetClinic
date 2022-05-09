using System.Linq;
using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;
using VetClinic.Views.Pages.EditPages;

namespace VetClinic.Views.Pages
{
    /// <summary>
    /// Interaction logic for MedicationsPage.xaml
    /// </summary>
    public partial class MedicationsPage : Page
    {
        public MedicationsPage()
        {
            InitializeComponent();
        }

        private void MedicationsPage_OnLoaded(object sender, RoutedEventArgs e)
        {
            DgMedications.ItemsSource = VeterinaryEntities.GetContext().Medications.ToList();
        }

        #region События на нажатие кнопок

        private void BtnDelete_OnClick(object sender, RoutedEventArgs e)
        {
            var items = DgMedications.SelectedItems.Cast<Medication>().ToList();
            if (MessageBox.Show($"Вы действительно хотите удалить {items.Count} элементов", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) != MessageBoxResult.Yes) return;
            VeterinaryEntities.GetContext().Medications.RemoveRange(items);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные удалены!");
        }

        private void BtnAdd_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new MedicationEditPage());

        private void BtnEdit_OnClick(object sender, RoutedEventArgs e) => PageManager.Navigate(new MedicationEditPage((sender as Button)?.DataContext as Medication));

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            TbSearch.Text = "";
            DgMedications.ItemsSource = VeterinaryEntities.GetContext().Medications.ToList();
        }

        #endregion

        #region События изменений

        private void TbSearch_OnTextChanged(object sender, TextChangedEventArgs e)
        {
            var searchText = TbSearch.Text;
            DgMedications.ItemsSource = VeterinaryEntities.GetContext().Medications.Where(x => x.Title.ToLower().Contains(searchText)).ToList();
        }

        #endregion
    }
}
