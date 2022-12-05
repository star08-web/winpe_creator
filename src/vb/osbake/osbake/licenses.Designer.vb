<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class licenses
    Inherits System.Windows.Forms.Form

    'Form esegue l'override del metodo Dispose per pulire l'elenco dei componenti.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Richiesto da Progettazione Windows Form
    Private components As System.ComponentModel.IContainer

    'NOTA: la procedura che segue è richiesta da Progettazione Windows Form
    'Può essere modificata in Progettazione Windows Form.  
    'Non modificarla mediante l'editor del codice.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.WebView = New Microsoft.Web.WebView2.WinForms.WebView2()
        CType(Me.WebView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'WebView
        '
        Me.WebView.AllowExternalDrop = True
        Me.WebView.CreationProperties = Nothing
        Me.WebView.DefaultBackgroundColor = System.Drawing.Color.White
        Me.WebView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.WebView.Location = New System.Drawing.Point(0, 0)
        Me.WebView.Name = "WebView"
        Me.WebView.Size = New System.Drawing.Size(800, 450)
        Me.WebView.TabIndex = 0
        Me.WebView.ZoomFactor = 1.0R
        '
        'licenses
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 15.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(800, 450)
        Me.Controls.Add(Me.WebView)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Name = "licenses"
        Me.Text = "licenses"
        CType(Me.WebView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents WebView As Microsoft.Web.WebView2.WinForms.WebView2
End Class
