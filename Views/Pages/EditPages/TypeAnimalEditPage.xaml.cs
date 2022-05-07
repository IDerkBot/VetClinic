using System.Linq;
using System.Windows;
using System.Windows.Controls;
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages.EditPages
{
    /// <summary>
    /// Interaction logic for TypeAnimalEditPage.xaml
    /// </summary>
    public partial class TypeAnimalEditPage : Page
    {
        private TypeAnimal _currentTypeAnimal;
        public TypeAnimalEditPage(TypeAnimal selectedTypeAnimal = null)
        {
            InitializeComponent();
            LvItems.ItemsSource = VeterinaryEntities.GetContext().TypeAnimals.ToList();
            _currentTypeAnimal = selectedTypeAnimal ?? new TypeAnimal();
            DataContext = _currentTypeAnimal;
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            if (_currentTypeAnimal.ID == 0) VeterinaryEntities.GetContext().TypeAnimals.Add(_currentTypeAnimal);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные сохранены");
        }

        private void LvItems_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _currentTypeAnimal = (TypeAnimal)LvItems.SelectedItem;
            DataContext = _currentTypeAnimal;
        }
    }
}