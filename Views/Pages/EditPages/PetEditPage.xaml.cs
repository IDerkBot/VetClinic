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
using VetClinic.Models;
using VetClinic.Models.Entity;

namespace VetClinic.Views.Pages.EditPages
{
    /// <summary>
    /// Interaction logic for PetEditPage.xaml
    /// </summary>
    public partial class PetEditPage : Page
    {
        private readonly Animal _currentAnimal;
        public PetEditPage(Animal selectedAnimal = null)
        {
            InitializeComponent();
            CbTypeAnimal.ItemsSource = VeterinaryEntities.GetContext().TypeAnimals.ToList();
            CbClient.ItemsSource = VeterinaryEntities.GetContext().Clients.ToList();
            _currentAnimal = selectedAnimal ?? new Animal();
            DataContext = _currentAnimal;
        }

        private void CbTypeAnimal_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var typeAnimal = CbTypeAnimal.SelectedItem as TypeAnimal;
            CbTypeBreed.ItemsSource = VeterinaryEntities.GetContext().TypeBreeds
                    .Where(x => x.TypeAnimal.Title == typeAnimal.Title).ToList();
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            if (_currentAnimal.ID == 0) VeterinaryEntities.GetContext().Animals.Add(_currentAnimal);
            VeterinaryEntities.GetContext().SaveChanges();
            MessageBox.Show("Данные сохранены!");
            PageManager.GoBack();
        }
    }
}
