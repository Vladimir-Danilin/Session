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
using System.Windows.Shapes;

namespace Sission3
{
    /// <summary>
    /// Логика взаимодействия для Add_Raz.xaml
    /// </summary>
    public partial class Add_Raz : Window
    {
        private Разговоры _currentRaz = new Разговоры();
        public Add_Raz()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Session2Entities.GetContext().Разговоры.Add(_currentRaz);
        }
    }
}
