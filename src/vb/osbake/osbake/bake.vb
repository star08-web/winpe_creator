Public Class bake
    Private logwnd As New TextBox()
    Private strResults As String
    Private intStop As Integer

    Private swWriter As System.IO.StreamWriter

    Private thrdCMD As System.Threading.Thread

    Private Delegate Sub Update()
    Private uFin As New Update(AddressOf UpdateText)
    Private Sub Prompt()

        Dim procCMDWin As New Process

        AddHandler procCMDWin.OutputDataReceived,
      AddressOf CMDOutput

        procCMDWin.StartInfo.RedirectStandardOutput = True
        procCMDWin.StartInfo.RedirectStandardInput = True
        procCMDWin.StartInfo.CreateNoWindow = True

        procCMDWin.StartInfo.UseShellExecute = False


        procCMDWin.StartInfo.FileName = "cmd.exe"
        procCMDWin.StartInfo.Arguments = "/c bake.cmd"
        procCMDWin.StartInfo.WorkingDirectory = "c:\windows_setup\app"

        procCMDWin.Start()

        procCMDWin.BeginOutputReadLine()

        swWriter = procCMDWin.StandardInput

        Do Until (procCMDWin.HasExited)
        Loop

        procCMDWin.Dispose()

    End Sub
    Private Sub UpdateText()

        logwnd.Text += strResults

        logwnd.SelectionStart =
      logwnd.TextLength - 1

        logwnd.Focus()

        intStop = logwnd.SelectionStart

        logwnd.ScrollToCaret()

    End Sub
    Private Sub CMDOutput(ByVal Sender As Object,
   ByVal OutputLine As DataReceivedEventArgs)

        strResults = OutputLine.Data & Environment.NewLine

        Invoke(uFin)

    End Sub
    Private Sub logwnd_KeyDown(ByVal sender As System.Object,
   ByVal e As System.Windows.Forms.KeyEventArgs)

        Select Case e.KeyCode

            Case Keys.Enter

                e.Handled = True

                logwnd.SelectionStart = intStop
                logwnd.SelectionLength = logwnd.TextLength - 1

                Dim cmdToSend = logwnd.SelectedText

                swWriter.WriteLine(cmdToSend & Environment.NewLine)

            Case Keys.Left, Keys.Right, Keys.Back

                If (logwnd.SelectionStart < intStop) Then

                    e.SuppressKeyPress = True

                End If

            Case Keys.Home

                logwnd.SelectionStart = intStop

                e.SuppressKeyPress = True

            Case Keys.End

                logwnd.SelectionStart = logwnd.TextLength - 1

                e.SuppressKeyPress = True

            Case Else

                If ((e.KeyValue < 32) Or (e.KeyValue > 127)) Then

                    e.SuppressKeyPress = True

                End If

        End Select

    End Sub
    Private Sub bake_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        logwnd.Multiline = True
        logwnd.Height = 200
        logwnd.Dock = DockStyle.Fill
        logwnd.ScrollBars = ScrollBars.Both
        logwnd.BackColor = Color.Black
        logwnd.ForeColor = Color.LightGray

        AddHandler logwnd.KeyDown, AddressOf logwnd_KeyDown
        Me.Controls.Add(logwnd)

        thrdCMD = New System.Threading.Thread(AddressOf Prompt)

        thrdCMD.IsBackground = True

        thrdCMD.Start()

    End Sub

    Private Sub bake_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        swWriter.Dispose()
    End Sub
End Class