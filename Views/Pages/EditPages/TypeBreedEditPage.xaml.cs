using System.Linq;
using System.Windows;
using System.Windows.Controls;
using VetClinic.Models.Entity;
using MessageBox = System.Windows.MessageBox;

namespace VetClinic.Views.Pages.EditPages
{
    /// <summary>
    /// Interaction logic for TypeBreedEditPage.xaml
    /// </summary>
    public partial class TypeBreedEditPage : Page
    {
        private TypeBreed _currentTypeBreed;
        public TypeBreedEditPage()
        {
            InitializeComponent();
            CbTypesAnimal.ItemsSource = VeterinaryEntities.GetContext().TypeAnimals.ToList();
            _currentTypeBreed = new TypeBreed();
            DataContext = _currentTypeBreed;
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            _currentTypeBreed.Title = TbTitle.Text;
            if (_currentTypeBreed.ID == 0) VeterinaryEntities.GetContext().TypeBreeds.Add(_currentTypeBreed);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные сохранены!");
        }

        private bool _isEdit;
        private void LvItems_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (!_isEdit) return;
            _currentTypeBreed = (TypeBreed)LvItems.SelectedItem;
            DataContext = _currentTypeBreed;
        }

        private void CbTypesAnimal_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (LvItems.SelectedItem != null)
            {
                _currentTypeBreed = new TypeBreed
                {
                    TypeAnimal = CbTypesAnimal.SelectedItem as TypeAnimal
                };
                //DataContext = _currentTypeBreed;
                _isEdit = false;
                LvItems.SelectedItem = null;
            }
            var typeAnimal = (CbTypesAnimal.SelectedItem as TypeAnimal)?.Title;
            LvItems.ItemsSource = VeterinaryEntities.GetContext().TypeBreeds.Where(x => x.TypeAnimal.Title == typeAnimal).ToList();
            _isEdit = true;
        }
    }
}
