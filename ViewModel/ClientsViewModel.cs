using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using VetClinic.Commands;
using VetClinic.Models.Entity;
using VetClinic.ViewModel.Base;

namespace VetClinic.ViewModel
{
    public class ClientsViewModel : Base.ViewModel
    {
        public ClientsViewModel()
        {
            #region Commands

            CloseApplicationCommand =
                new LambdaCommand(OnCloseApplicationCommandExecuted, CanCloseApplicationCommandExecuted);

            #endregion
        }
        public List<Client> Clients
        {
            get
            {
                return VeterinaryEntities.GetContext().Clients.ToList();
            }
        }

        #region Commands

        #region CloseApplicationCommand

        public ICommand CloseApplicationCommand { get; }

        private void OnCloseApplicationCommandExecuted(object p)
        {
            Application.Current.Shutdown();
        }

        private bool CanCloseApplicationCommandExecuted(object p) => true;

        #endregion

        #endregion
    }
}