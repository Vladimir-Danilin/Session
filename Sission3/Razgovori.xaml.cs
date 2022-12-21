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

namespace Sission3
{
    /// <summary>
    /// Логика взаимодействия для Razgovori.xaml
    /// </summary>
    public partial class Razgovori : Window
    {
        public Razgovori()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DGridRazgovori.ItemsSource = Session2Entities.GetContext().Разговоры.ToList();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Add_Raz ADD = new Add_Raz();
            ADD.Show();
        }
    }
}
