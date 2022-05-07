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
    /// Interaction logic for PetPage.xaml
    /// </summary>
    public partial class PetPage : Page
    {
        public PetPage()
        {
            InitializeComponent();
        }

        private void PetPage_OnLoaded(object sender, RoutedEventArgs e)
        {
            DgPets.ItemsSource = VeterinaryEntities.GetContext().Animals.ToList();
            CbTypes.ItemsSource = VeterinaryEntities.GetContext().Animals.GroupBy(x => x.TypeAnimal.Title)
                .Select(x => x.Key).ToList();
        }

        private void TbSearch_OnTextChanged(object sender, TextChangedEventArgs e)
        {
            var searchText = TbSearch.Text;
            DgPets.ItemsSource = VeterinaryEntities.GetContext().Animals.Where(x => x.Title.ToLower().Contains(searchText)).ToList();
        }

        private void BtnDelete_OnClick(object sender, RoutedEventArgs e)
        {
            
        }

        private void BtnAdd_OnClick(object sender, RoutedEventArgs e)
        {
            
        }
    }
}
