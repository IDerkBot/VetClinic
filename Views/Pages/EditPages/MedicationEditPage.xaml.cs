using System.Windows;
using System.Windows.Controls;
using VetClinic.Models;
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages.EditPages
{
    /// <summary>
    /// Interaction logic for MedicationEditPage.xaml
    /// </summary>
    public partial class MedicationEditPage : Page
    {
        private readonly Medication _currentMedication;
        public MedicationEditPage(Medication selectedMedication = null)
        {
            InitializeComponent();
            _currentMedication = selectedMedication ?? new Medication();
            DataContext = _currentMedication;
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            if(_currentMedication.ID == 0) VeterinaryEntities.GetContext().Medications.Add(_currentMedication);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные сохранены!");
            PageManager.GoBack();
        }
    }
}
