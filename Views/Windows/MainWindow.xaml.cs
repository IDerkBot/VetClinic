using System;
using System.Windows;
using VetClinic.Models;
using VetClinic.Views.Pages;

namespace VetClinic.Views.Windows
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            PageManager.SetFrame(MainFrame);
            PageManager.Navigate(new MenuPage());
        }

        private void MainFrame_OnContentRendered(object sender, EventArgs e)
        {
            
        }

        private void BtnBack_OnClick(object sender, RoutedEventArgs e)
        {
            PageManager.GoBack();
        }
    }
}
