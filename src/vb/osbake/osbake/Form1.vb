Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        log.Text = "Osbake V 4.0.0"
        log.Text = log.Text + "
"
        log.Text = log.Text + "©️ 2022/23 Star08-web"
        log.Text = log.Text + "
"
        log.Text = log.Text + "☑️ Ready to bake"
    End Sub

    Private Sub MetroButton3_Click(sender As Object, e As EventArgs) Handles MetroButton3.Click
        Process.Start("explorer.exe", "C:\windows_setup\app\iso")
        log.Text = log.Text + "
"
        log.Text = log.Text + "Opened Iso Folder"
    End Sub

    Private Sub MetroButton4_Click(sender As Object, e As EventArgs) Handles MetroButton4.Click
        Process.Start("explorer.exe", "C:\windows_setup\app\appcomponent")
        log.Text = log.Text + "
"
        log.Text = log.Text + "Opened Extras Folder"
    End Sub

    Private Sub MetroButton1_Click(sender As Object, e As EventArgs) Handles MetroButton1.Click
        about.Show()
    End Sub
End Class
