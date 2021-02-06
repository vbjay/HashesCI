Imports UnitsNet
Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        MessageBox.Show($"A meter is {Length.FromMeters(1).LightYears} light years.{vbCrLf}{ThisAssembly.Git.Sha}")

    End Sub
End Class
