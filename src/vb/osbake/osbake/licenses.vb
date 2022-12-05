Public Class licenses
    Private Sub licenses_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim lic As New Uri("https://star08-web.github.io/osbake/osbake.licenses")
        WebView.Source = lic
    End Sub
End Class