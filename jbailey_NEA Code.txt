Imports MySql.Data.MySqlClient
Imports System.Text.RegularExpressions
Public Class Form1
    Public CU = New CurrentUser
    Public boolpub As Boolean = False
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.Size = New Size(Screen.PrimaryScreen.Bounds.Width / 3, Screen.PrimaryScreen.Bounds.Height / 2) 'sets the form to an appropriate size based on the resolution of the monitor it is on
        Me.AutoScroll = True
        LoginInput()
    End Sub


    Sub LoginInput() 'creates the username and password input boxes and the login button
        Dim usernameBox As New TextBox
        With usernameBox
            .Name = "usernameBox"
            .Font = New Font("Helvetica", 16)
            .TextAlign = HorizontalAlignment.Center
        End With
        Me.Controls.Add(usernameBox)
        Dim passwordBox As New TextBox
        With passwordBox
            .Name = "passwordBox"
            .Location = New Point(0, 50)
            .Font = New Font("Helvetica", 16)
            .TextAlign = HorizontalAlignment.Center
            .PasswordChar = "*"
        End With
        Me.Controls.Add(passwordBox)
        Dim loginButton As New Button
        With loginButton
            .Name = "loginButton"
            .Text = "LOGIN"
            .Size = New Size(0, 40)
            .Dock = DockStyle.Bottom
            .BackColor = Color.LightGreen
            .FlatStyle = FlatStyle.Flat
            .FlatAppearance.BorderSize = 0
        End With
        Me.Controls.Add(loginButton)
        AddHandler loginButton.Click, AddressOf LoginDatabaseCheck
    End Sub
    Sub LoginDatabaseCheck() 'checks the inputted login information against the database
        Dim c As CurrentUser = CU 'CU is the name for the public object for the current user
        Dim databaseconnection As New DatabaseConnection("ProjectManagementDB") 'calls upon the DatabaseConnection class
        Dim conn = databaseconnection.GetConnection
        conn.open
        Dim sql As String = "SELECT @USERNAME, @PASSWORD FROM userinformation WHERE `username` = @USERNAME AND `password` = @PASSWORD" 'sql, using parameters to prevent injection (this has been done in all user inputtable database entries)
        'this particular SQL query asks the database to give the username and password of the user logging in, provided the username and password inputter both match records.
        Dim cmd As New MySqlCommand(sql, conn)
        Dim check As Boolean 'boolean to check whether the username and password inputted match records
        cmd.Parameters.AddWithValue("@USERNAME", Me.Controls("usernameBox").Text)
        cmd.Parameters.AddWithValue("@PASSWORD", Me.Controls("passwordBox").Text)
        Dim reader = cmd.ExecuteReader
        With reader
            check = .Read() 'check is set to the value the query gives
        End With
        conn.close 'closes the connection as this is best practise
        If check = True Then 'if the inputted login info is correct...
            c.setusername(Me.Controls("usernameBox").Text)
            Me.Controls("usernameBox").Dispose()
            Me.Controls("passwordBox").Dispose()
            Me.Controls("loginButton").Dispose() 'disposes of all the items currently on screen
            c.setinfo() 'uses the current user object, and calls a subroutine within it which adds the data from the current users records into the class, so the program can access it without having to query the database each time.
            mainpage()
        Else
            Me.Controls("usernameBox").BackColor = Color.FromArgb(255, 247, 250)
            Me.Controls("passwordBox").BackColor = Color.FromArgb(255, 247, 250)
            Me.Controls("loginButton").BackColor = Color.FromArgb(225, 167, 160) 'makes the items on-screen red if the username and password don't match records
            MsgBox("Your username or password is incorrect")
        End If
    End Sub


    Sub mainpage()
        If boolpub = True Then
            disposer() 'clears the form, as every time a person returns to the main page, the screen will be emptied.
            showtoday()
        End If
    End Sub


    Sub topmenu()
        'MAIN MENU
        Dim m As New MenuStrip 'a menustrip is the strip of options along the top of the form, for easy access to functions without having to create extra buttons and find space for each one
        m.Name = "menu"
        Me.Controls.Add(m)
        Dim DoMenu As New ToolStripMenuItem("Do")
        Dim ViewMenu As New ToolStripMenuItem("View")
        Dim AccountMenu As New ToolStripMenuItem("Account")
        m.Items.Add(DoMenu)
        m.Items.Add(ViewMenu)
        m.Items.Add(AccountMenu)

        Dim s As New ToolStripSeparator
        Dim s2 As New ToolStripSeparator
        Dim s3 As New ToolStripSeparator
        Dim s4 As New ToolStripSeparator

        'MAIN MENU -> DO
        Dim add As New ToolStripMenuItem("Add New...")
        Dim search As New ToolStripMenuItem("Search For...")
        Dim logoff As New ToolStripMenuItem("Log Off") : AddHandler logoff.Click, AddressOf logclick
        Dim Ex As New ToolStripMenuItem("Exit") : AddHandler Ex.Click, AddressOf exitclick
        DoMenu.DropDownItems.Add(add)
        DoMenu.DropDownItems.Add(s)
        DoMenu.DropDownItems.Add(Search)
        DoMenu.DropDownItems.Add(s2)
        DoMenu.DropDownItems.Add(logoff)
        DoMenu.DropDownItems.Add(Ex)

        'MAIN MENU -> DO -> ADD
        Dim projectToDatabase As New ToolStripMenuItem("Project") : AddHandler projectToDatabase.Click, AddressOf aprojectadd
        Dim user As New ToolStripMenuItem("User") : AddHandler user.Click, AddressOf adduser
        Dim client As New ToolStripMenuItem("Client") : AddHandler client.Click, AddressOf addclient
        add.DropDownItems.Add(projectToDatabase)
        add.DropDownItems.Add(user)
        add.DropDownItems.Add(client)

        'MAIN MENU -> DO -> SEARCH
        Dim searchforcontact As New ToolStripMenuItem("Contact")
        Dim searchforproject As New ToolStripMenuItem("Project")
        search.DropDownItems.Add(searchforcontact)
        search.DropDownItems.Add(searchforproject) : AddHandler searchforproject.Click, AddressOf searchforprojectsub

        'MAIN MENU -> VIEW
        Dim todayBtn As New ToolStripMenuItem("Day")
        Dim weekBtn As New ToolStripMenuItem("Week")
        Dim mnthBtn As New ToolStripMenuItem("Calendar")
        Dim allcontacts As New ToolStripMenuItem("Show Contacts List")
        ViewMenu.DropDownItems.Add(todayBtn) : AddHandler todayBtn.Click, AddressOf showtoday
        ViewMenu.DropDownItems.Add(weekBtn) : AddHandler weekBtn.Click, AddressOf showweek
        ViewMenu.DropDownItems.Add(mnthBtn) : AddHandler mnthBtn.Click, AddressOf showmonth
        ViewMenu.DropDownItems.Add(s3)
        ViewMenu.DropDownItems.Add(allcontacts) : AddHandler allcontacts.Click, AddressOf showallcontacts

        'MAIN MENU -> ACCOUNT
        Dim MyInfo As New ToolStripMenuItem("My Information")
        Dim ChangePass As New ToolStripMenuItem("Change Password")
        AccountMenu.DropDownItems.Add(MyInfo) : AddHandler MyInfo.Click, AddressOf showaccountinfo
        AccountMenu.DropDownItems.Add(s4)
        AccountMenu.DropDownItems.Add(ChangePass) : AddHandler ChangePass.Click, AddressOf changepassword
    End Sub


    Sub searchforprojectsub()
        disposer()
        topmenu()
        Dim input As String
        Dim label As New Label
        With label
            .Location = New Point(0, 30)
            .Text = "Search for a project based on the following: You can either pick one of multiple fields to narrow your search."
        End With

        Dim datetimepick As New DateTimePicker
        With datetimepick
            .Name = "datetimepicker"
            .CustomFormat = "yyyy-MM-ss"
        End With
        Me.Controls.Add(datetimepick)

        showprojectsfromselection(Input)
    End Sub
    Sub showprojectsfromselection(m)
        Dim inp = m
        disposer()
        topmenu()
        Dim x As Integer = 0
        Dim y As Integer = 30
        Dim sql As String
        Select Case m
            Case "ProjectName"
                sql = "SELECT * FROM projects WHERE ProjectName CONTAINS(projectname, @projectname)"
            Case "Date"
                sql = "SELECT * FROM projects WHERE startdate = @startdate"
            Case "Group"
                sql = "SELECT * FROM projects WHERE ingroup = @ingroup"
            Case "ProjectNameAndGroup"
                sql = "SELECT * FROM projects WHERE ProjectName CONTAINS(projectname, @projectname) AND InGroup = @ingroup"
            Case "ProjectNameAndDate"
                sql = "SELECT * FROM projects WHERE ProjectName CONTAINS(projectname, @projectname) AND StartDate = @startDate"
            Case "groupanddate"
                sql = "SELECT * FROM projects WHERE InGroup = @InGroup AND StartDate = @StartDate"
        End Select


        Dim cntsql As String = "SELECT COUNT(*) from contacts"
                Dim databaseconnection As New DatabaseConnection("ProjectManagementDB")
                Dim cn = databaseconnection.GetConnection
                Dim reader
                Dim scale As Integer
                Using cmd As New MySqlCommand(cntsql, cn)
                    cmd.Connection.Open()
                    scale = Convert.ToInt32(cmd.ExecuteScalar)
                End Using
                Dim p As New ProgressBar
                With p
                    .Location = New Point(0, 25)
                    .Size = New Size(Me.Width - 20, 20)
                    .Value = 0
                End With
                Me.Controls.Add(p)
                Dim scaletemp = 100 / scale
                Dim scaleadd = scaletemp
                Using cmd As New MySqlCommand(sql, cn) 'an example of using the 'Using' function in VB.NET so that the connection doesn't need to be closed after we finish grabbing information from the db, it does this automatically
                    With cmd
                        reader = .ExecuteReader
                    End With
                    With reader
                        Dim f = 0
                Dim n(11) As String
                For i = 0 To scale - 1
                            p.Value = scaleadd
                            For Each item In .read.ToString
                        n(f) = item
                        f = f + 1
                            Next
                            f = 0
                            x = 0
                            For j = 0 To 11
                                Dim t As New TextBox
                                With t
                                    .Name = "ContactTB." & i & "." & j
                                    .Text = reader.item(j)
                                    If j = 2 Then
                                        .Size = New Size(50, 20)
                                    ElseIf j = 3 Or j = 4 Then
                                        .Size = New Size(70, 20)
                                    ElseIf j = 5 Then
                                        .Text = "Click to view note"
                                        .Size = New Size(100, 20)
                                    ElseIf j = 6 Then
                                        .Size = New Size(75, 20)
                                    ElseIf j = 7 Then
                                        .Size = New Size(160, 20)
                                    ElseIf j = 10 Then
                                        .Size = New Size(65, 20)
                                    ElseIf j = 0 Then
                                        .Size = New Size(140, 20)
                                    ElseIf j = 1 Then
                                        .Size = New Size(70, 20)
                                    Else
                                        .Size = New Size(Me.Width / 12, 20)
                                    End If
                                    If j = 0 Then
                                        .Location = New Point(0, y)
                                    Else
                                        .Location = New Point((Me.Controls("ContactTB." & i & "." & (j - 1)).Location.X) + (Me.Controls("ContactTB." & i & "." & (j - 1)).Width), y)
                                    End If
                                End With
                                If j = 5 Then
                                    AddHandler t.Click, AddressOf shownote
                                End If
                                Me.Controls.Add(t)
                                x += Me.Width / 12
                            Next
                            y += 20
                            scaleadd += scaletemp
                        Next
                        p.Hide()
                    End With
                End Using
    End Sub


    Sub projectclick(sender As Object, e As EventArgs)
        disposer()
        topmenu()
        Dim textbox As Button = sender
        Dim conn As New DatabaseConnection("projectmanagementdb")
        Dim cn = conn.GetConnection
        Dim sql = "SELECT * FROM projects WHERE ProjectID = @ProjectID"
        Dim cmd As New MySqlCommand(sql, cn)
        Dim reader
        With cmd
            .Connection.Open()
            .Parameters.AddWithValue("@ProjectID", textbox.Name.ToString)
            reader = .ExecuteReader
        End With
        Dim x = 0
        Dim y = 30
        Dim z = 0
        With reader
            For i = 0 To 6
                .read
                Dim t As New TextBox
                With t
                    .Text = reader.item(z).ToString
                    .Size = New Size(300, 20)
                    .Location = New Point(x, y)
                    If i = 3 Then
                        .Size = New Size(300, 100)
                        .Multiline = True
                        y += 80
                    End If

                End With
                Me.Controls.Add(t)
                y += 20
                z += 1
            Next
        End With
    End Sub


    Sub showtoday()
        disposer()
        topmenu()
        Dim count = getprojectcount("Today")
        Dim c As CurrentUser = CU
        Dim conn As New DatabaseConnection("projectmanagementdb")
        Dim cn = conn.GetConnection
        Dim sql = "SELECT ProjectName, CompletedStatus, Startdate, ProjectID FROM projects WHERE inGroup = @currentgroup And StartDate = @startdate"
        Dim cmd As New MySqlCommand(sql, cn)
        Dim reader
        With cmd
            .Connection.Open()
            .Parameters.AddWithValue("@startdate", Today.ToString("yyyy-MM-dd"))
            .Parameters.AddWithValue("@currentgroup", c.getmembergroup)
            reader = .ExecuteReader
        End With
        Dim x = 10
        Dim y = 30
        Dim xmax = Me.Width - 10
        Dim ymax = Me.Height - 100
        For i = 1 To count
            If reader.read Then
                Dim box As New Button
                With box
                    .Text = reader.item("ProjectName")
                    .Name = reader.item("ProjectID")
                    .FlatStyle = FlatStyle.Flat
                    .FlatAppearance.BorderSize = 0
                    If reader.item("CompletedStatus") = "Not Started" Then
                        .BackColor = Color.LightBlue
                    ElseIf reader.item("CompletedStatus") = "In Progress" Then
                        .BackColor = Color.LightYellow
                    ElseIf reader.item("CompletedStatus") = "Completed" Then
                        .BackColor = Color.LightGreen
                    Else
                        .BackColor = Color.LightPink
                    End If
                    If y < ymax Then
                        .Location = New Point(x, y)
                    Else
                        y = 30
                        x += box.Width
                        .Location = New Point(x, y)
                    End If
                    .Size = New Size(Me.Width / 10, Me.Height / 5)
                End With
                AddHandler box.Click, AddressOf projectclick
                Me.Controls.Add(box)
                y += Me.Height / 5
            End If
        Next
    End Sub


    Sub showweek()
        disposer()
        topmenu()
        Dim datetochoose
        Dim datetochoose2
        Dim myDate As Date = DateTime.Today
        Dim count = getprojectcount("Week")
        Dim c As CurrentUser = CU
        Dim sql
        Dim conn As New DatabaseConnection("projectmanagementdb")
        Dim cn = conn.GetConnection
        Dim cmd As New MySqlCommand(sql, cn)
        Dim reader
        With cmd
            datetochoose = Today.ToString("yyyy-MM-")
            datetochoose2 = (Convert.ToInt32(Today.ToString("dd") - myDate.DayOfWeek)).ToString
            .Parameters.AddWithValue("@week", (datetochoose & datetochoose2))
            datetochoose2 = (Convert.ToInt32(Today.ToString("dd") - myDate.DayOfWeek) + 7).ToString
            .Parameters.AddWithValue("@endweek", datetochoose & datetochoose2)
            sql = "Select ProjectName, Completedstatus, startdate, ProjectID FROM Projects WHERE Ingroup = @currentgroup And StartDate BETWEEN @week And @endweek"
            .Connection.Open()
            .CommandText = sql
            .Parameters.AddWithValue("@currentgroup", c.getmembergroup)
            reader = .ExecuteReader
        End With
        Dim x = 10
        Dim y = 30
        Dim xmax = Me.Width - 10
        Dim ymax = Me.Height - 100
        For i = 1 To count - 1
            If reader.read Then
                Dim box As New Button
                With box
                    .Text = reader.item("ProjectName")
                    .FlatStyle = FlatStyle.Flat
                    .Name = reader.item("ProjectID")
                    .FlatAppearance.BorderSize = 0
                    If reader.item("CompletedStatus") = "Not Started" Then
                        .BackColor = Color.LightBlue
                    ElseIf reader.item("CompletedStatus") = "In Progress" Then
                        .BackColor = Color.LightYellow
                    ElseIf reader.item("CompletedStatus") = "Completed" Then
                        .BackColor = Color.LightGreen
                    Else
                        .BackColor = Color.LightPink
                    End If
                    If y < ymax Then
                        .Location = New Point(x, y)
                    Else
                        y = 30
                        x += box.Width
                        .Location = New Point(x, y)
                    End If
                    .Size = New Size(Me.Width / 10, Me.Height / 5)
                End With
                AddHandler box.Click, AddressOf projectclick
                Me.Controls.Add(box)
                y += Me.Height / 5
            End If
        Next
    End Sub


    Sub showmonth()
        disposer()
        topmenu()
        Dim count = getprojectcount("Month")
        Dim c As CurrentUser = CU
        Dim conn As New DatabaseConnection("projectmanagementdb")
        Dim cn = conn.GetConnection
        Dim sql = "SELECT ProjectName, CompletedStatus, Startdate, ProjectID FROM projects WHERE inGroup = @currentgroup And MONTH(StartDate) = @month"
        Dim cmd As New MySqlCommand(sql, cn)
        Dim reader
        With cmd
            .Connection.Open()
            .Parameters.AddWithValue("@month", Today.ToString("MM"))
            .Parameters.AddWithValue("@currentgroup", c.getmembergroup)
            reader = .ExecuteReader
        End With
        Dim x = 10
        Dim y = 30
        Dim xmax = Me.Width - 10
        Dim ymax = Me.Height - 100
        For i = 1 To count - 1
            If reader.read Then
                Dim box As New Button
                With box
                    .Text = reader.item("ProjectName")
                    .Name = reader.item("ProjectID")
                    .FlatStyle = FlatStyle.Flat
                    .FlatAppearance.BorderSize = 0
                    If reader.item("CompletedStatus") = "Not Started" Then
                        .BackColor = Color.LightBlue
                    ElseIf reader.item("CompletedStatus") = "In Progress" Then
                        .BackColor = Color.LightYellow
                    ElseIf reader.item("CompletedStatus") = "Completed" Then
                        .BackColor = Color.LightGreen
                    Else
                        .BackColor = Color.LightPink
                    End If
                    If y < ymax Then
                        .Location = New Point(x, y)
                    Else
                        y = 30
                        x += box.Width
                        .Location = New Point(x, y)
                    End If
                    .Size = New Size(Me.Width / 10, Me.Height / 5)
                End With
                AddHandler box.Click, AddressOf projectclick
                Me.Controls.Add(box)
                y += Me.Height / 5
            End If
        Next
    End Sub


    Function getprojectcount(scaletosearch) '''''''''''''''''''''''''
        Dim searchscale = scaletosearch
        Dim dateToChoose As String
        Dim dateToChoose2 As String
        Dim myDate As Date = DateTime.Today
        Dim scale As Integer
        Dim conn As New DatabaseConnection("projectmanagementdb")
        Dim cn = conn.GetConnection
        Dim sql As String
        Dim cmd = New MySqlCommand(sql, cn)
        With cmd
            .Connection.Open()
            If scaletosearch = "Today" Then
                dateToChoose = Today.ToString("yyyy-MM-dd")
                .Parameters.AddWithValue("@date", dateToChoose)
                sql = "Select COUNT(*) FROM Projects WHERE startDate = @date"
            ElseIf scaletosearch = "Week" Then
                dateToChoose = Today.ToString("yyyy-MM-")
                dateToChoose2 = (Convert.ToInt32(Today.ToString("dd") - myDate.DayOfWeek)).ToString
                .Parameters.AddWithValue("@week", (dateToChoose & dateToChoose2))
                dateToChoose2 = (Convert.ToInt32(Today.ToString("dd") - myDate.DayOfWeek) + 7).ToString
                .Parameters.AddWithValue("@endweek", dateToChoose & dateToChoose2)
                sql = "Select COUNT(*) FROM Projects WHERE StartDate BETWEEN @week And @endweek"
            ElseIf scaletosearch = "Month" Then
                dateToChoose = Today.ToString("yyyy")
                dateToChoose2 = Today.ToString("MM")
                .Parameters.AddWithValue("@month", dateToChoose2)
                .Parameters.AddWithValue("@year", dateToChoose)
                sql = "Select COUNT(*) FROM Projects WHERE MONTH(startDate) = @month And YEAR(startDate) = @year"
            End If
            .CommandText = sql
            scale = Convert.ToInt32(.ExecuteScalar)
            .Connection.Close()
        End With
        Return scale
    End Function


    Sub showallcontacts()
        Dim answer As MsgBoxResult = MsgBox("This may take a While, And it could cause low-spec systems to crash. ARE YOU SURE you want to load ALL CONTACTS from the database? You can use the 'Do' option in the menubar to search for contacts instead.", vbYesNo)
        If answer = vbNo Then
            Exit Sub
        End If
        disposer()
        topmenu()
        Dim x As Integer = 0
        Dim y As Integer = 30
        Dim sql As String = "SELECT * FROM contacts ORDER BY FirstName"
        Dim cntsql As String = "SELECT COUNT(*) from contacts"
        Dim databaseconnection As New DatabaseConnection("ProjectManagementDB")
        Dim cn = databaseconnection.GetConnection
        Dim reader
        Dim scale As Integer
        Using cmd As New MySqlCommand(cntsql, cn)
            cmd.Connection.Open()
            scale = Convert.ToInt32(cmd.ExecuteScalar)
        End Using
        Dim p As New ProgressBar
        With p
            .Location = New Point(0, 25)
            .Size = New Size(Me.Width - 20, 20)
            .Value = 0
        End With
        Me.Controls.Add(p)
        Dim scaletemp = 100 / scale
        Dim scaleadd = scaletemp
        Using cmd As New MySqlCommand(sql, cn) 'an example of using the 'Using' function in VB.NET so that the connection doesn't need to be closed after we finish grabbing information from the db, it does this automatically
            With cmd
                reader = .ExecuteReader
            End With
            With reader
                Dim f = 0
                Dim m(11) As String
                For i = 0 To scale - 1
                    p.Value = scaleadd
                    For Each item In .read.ToString
                        m(f) = item
                        f = f + 1
                    Next
                    f = 0
                    x = 0
                    For j = 0 To 11
                        Dim t As New TextBox
                        With t
                            .Name = "ContactTB." & i & "." & j
                            .Text = reader.item(j)
                            If j = 2 Then
                                .Size = New Size(50, 20)
                            ElseIf j = 3 Or j = 4 Then
                                .Size = New Size(70, 20)
                            ElseIf j = 5 Then
                                .Text = "Click to view note"
                                .Size = New Size(100, 20)
                            ElseIf j = 6 Then
                                .Size = New Size(75, 20)
                            ElseIf j = 7 Then
                                .Size = New Size(160, 20)
                            ElseIf j = 10 Then
                                .Size = New Size(65, 20)
                            ElseIf j = 0 Then
                                .Size = New Size(140, 20)
                            ElseIf j = 1 Then
                                .Size = New Size(70, 20)
                            Else
                                .Size = New Size(Me.Width / 12, 20)
                            End If
                            If j = 0 Then
                                .Location = New Point(0, y)
                            Else
                                .Location = New Point((Me.Controls("ContactTB." & i & "." & (j - 1)).Location.X) + (Me.Controls("ContactTB." & i & "." & (j - 1)).Width), y)
                            End If
                        End With
                        If j = 5 Then
                            AddHandler t.Click, AddressOf shownote
                        End If
                        Me.Controls.Add(t)
                        x += Me.Width / 12
                    Next
                    y += 20
                    scaleadd += scaletemp
                Next
                p.Hide()
            End With
        End Using
    End Sub
    Sub shownote()
        MsgBox("Temporary - will be changed")
    End Sub


    Public Function GetRandomInt(ByVal Min As Integer, ByVal Max As Integer) As Integer
        Dim Generator As System.Random = New System.Random()
        Return Generator.Next(Min, Max)
    End Function

    Sub showaccountinfo()
        disposer()
        topmenu()
        Dim c As CurrentUser = CU
        Dim i(7) As String
        Dim mdn As String
        Dim tleadboo As Boolean
        Dim m As New Label
        m.Text = "Your information."
        m.Location = New Point(20, 30)
        Me.Controls.Add(m)
        If c.getteamleader() = 0 Then
            tleadboo = False
        Else
            tleadboo = True
        End If
        If c.getmiddlename = Nothing Then
            mdn = ""
        End If
        i(0) = "Your Username:   " & c.getusername()
        i(1) = "Your Name:   " & c.getfirstname & " " & mdn & " " & c.getlastname
        i(2) = "Your Email:   " & c.getemail()
        i(3) = "Your Phone Number:   " & c.getphone()
        i(4) = "Member Of:   " & c.getmembergroup()
        i(5) = "Are You A Team Leader?:   " & tleadboo
        i(6) = "Current Access Level (0|1|2):   " & c.getAccessLevel()
        i(7) = "Your Business Location:   " & c.getlocatedat()
        Dim y = 50
        Dim x = 20
        For j = 0 To 7
            Dim l As New TextBox
            l.Enabled = False
            l.BackColor = Color.White
            l.Text = i(j)
            l.Size = New Size(230, 20)
            l.Location = New Point(x, y)
            Me.Controls.Add(l)
            y += 20
        Next
    End Sub


    Sub aprojectadd()
        disposer()
        topmenu()
        Dim c As CurrentUser = CU
        Dim t
        t = c.getAccessLevel()
        If t = 0 Then
            MsgBox("Sorry, you need to be a team leader to do this.")
            Exit Sub
        Else
            Dim label As New Label
            With label
                .Text = "Add A Project Below - This Will be added under your group unless selected otherwise."
                .Location = New Point(15, 25)
                .Size = New Size(500, 20)
            End With
            Me.Controls.Add(label)
            Dim x = 20
            Dim y = 50
            For i = 0 To 1
                Dim dt As New DateTimePicker
                With dt
                    .Location = New Point(x, y)
                    .Name = "Datepicker" & i
                    .Format = DateTimePickerFormat.Custom
                    .CustomFormat = "yyyy-MM-dd"
                    .Size = New Size(100, 200)
                    If i = 0 Then
                        .Enabled = False
                    End If
                End With
                Me.Controls.Add(dt)
                y += 20
            Next
            Dim tb As New TextBox
            With tb
                .Location = New Point(x, y)
                .Name = "textbox"
                .Size = New Size(100, 200)
            End With
            Me.Controls.Add(tb)
            y += 20
            Dim membergroup As New ComboBox
            With membergroup
                .Location = New Point(x, y)
                .Text = c.getmembergroup()
                .Enabled = False
                .Name = "membergroupbox"
                .Size = New Size(100, 200)
            End With
            AddHandler membergroup.Click, AddressOf populategroupdropdown
            Me.Controls.Add(membergroup)
            y += 20
            Dim compstat As New TextBox
            With compstat
                .Name = "compstat"
                .Location = New Point(x, y)
                .Text = "Not Started"
                .Size = New Size(100, 200)
                .Enabled = False
            End With
            Me.Controls.Add(compstat)
            y += 20
            Dim ch As New CheckBox
            With ch
                .Location = New Point(membergroup.Location.X + membergroup.Width, membergroup.Location.Y)
            End With
            Me.Controls.Add(ch)
            AddHandler ch.CheckedChanged, AddressOf checkchange
            Dim mltb As New TextBox
            With mltb
                .Name = "note"
                .Multiline = True
                .Size = New Size(200, 50)
                .Location = New Point(x, y)
            End With
            Me.Controls.Add(mltb)
            Dim count As New Label
            With count
                .Name = "cntlbl"
                .Text = "0/255"
                .Location = New Point(mltb.Location.X + mltb.Width - 30, mltb.Location.Y + mltb.Height)
            End With
            Me.Controls.Add(count)
            AddHandler mltb.TextChanged, AddressOf countchars
            Dim b As New Button
            With b
                .Location = New Point(mltb.Location.X, mltb.Location.Y + mltb.Height)
            End With
            Me.Controls.Add(b)
            AddHandler b.Click, AddressOf addprojectDB
        End If
    End Sub
    Function projectIDGetter()
        Dim r(9) As String
        Dim num As String
        For i = 0 To 9
            If i = 0 Then
                r(i) = GetRandomInt(1, 9).ToString
            Else
                r(i) = GetRandomInt(0, 9).ToString
            End If
            System.Threading.Thread.Sleep(10)
            num = num & r(i)
        Next
        Dim sql As String = "SELECT projects.ProjectID, contacts.contactID from projects, contacts WHERE ProjectID = @projID OR ContactID = @projID"
        Dim databaseconnection As New DatabaseConnection("ProjectManagementDB")
        Dim cn = databaseconnection.GetConnection
        Dim reader
        Using cmd As New MySqlCommand(sql, cn) 'an example of using the 'Using' function in VB.NET so that the connection doesn't need to be closed after we finish grabbing information from the db, it does this automatically
            With cmd
                .Connection.Open()
                .Parameters.AddWithValue("@projID", num)
                reader = .ExecuteReader
            End With
            With reader
                .read
                If .read = True Then
                    projectIDGetter() 'creates another projectID if the generated ID is already the same as an ID that exists.
                ElseIf .read = False Then
                    Return num
                End If
            End With
        End Using
    End Function
    'this function will ALWAYS return a value, so this suggestion has been ignored. The if statements make sure that the function is not left until a projectID has been generated.
    Sub addprojectDB()
        Dim l As DateTimePicker = Me.Controls("datepicker1")
        Dim n As TextBox = Me.Controls("note")
        Dim c As CurrentUser = CU
        If Me.Controls("textbox").Text = Nothing Then
            MsgBox("You need to give your project a name.")
            Me.Controls("textbox").BackColor = Color.FromArgb(255, 237, 240)
        ElseIf n.Text.Length > 255 Then
            n.BackColor = Color.FromArgb(255, 237, 240)
            MsgBox("Your note is too long!")
        Else
            Dim PID As String = projectIDGetter()
            Dim sql As String = "INSERT INTO projects(projectName, projectID, InGroup, notes, completedStatus, createDate, startdate) VALUES(@projectname, @projectID, @ingroup, @note, @completedstatus, @createdate, @startdate)"
            Dim databaseconnection As New DatabaseConnection("ProjectManagementDB")
            Dim cn = databaseconnection.GetConnection
            Dim reader
            Using cmd As New MySqlCommand(sql, cn)
                With cmd
                    .Connection.Open()
                    .Parameters.AddWithValue("@projectname", Me.Controls("textbox").Text)
                    .Parameters.AddWithValue("@projectID", PID)
                    .Parameters.AddWithValue("@InGroup", Me.Controls("membergroupbox").Text)
                    .Parameters.AddWithValue("@note", n.Text)
                    .Parameters.AddWithValue("@completedStatus", Me.Controls("compstat").Text)
                    .Parameters.AddWithValue("@Createdate", Me.Controls("datepicker0").Text)
                    .Parameters.AddWithValue("@startdate", Me.Controls("datepicker1").Text)
                    reader = .ExecuteReader
                End With
                With reader
                    .read
                End With
            End Using
            MsgBox("Project has been added to the database.")

            Dim a As MsgBoxResult = MsgBox("Would you like to add another project now?", vbYesNo)
            If a = vbYes Then
                disposer()
                aprojectadd()
            Else
                For i = 0 To 9
                    disposer()
                    mainpage()
                Next
            End If
        End If
    End Sub
    Sub countchars(sender As Object, e As EventArgs)
        Dim mltb As TextBox = sender
        Dim count As Label = Me.Controls("cntlbl")
        count.Text = mltb.Text.Length & "/255"
        If mltb.Text.Length > 255 Then
            count.ForeColor = Color.Red
        End If
        If mltb.Text.Length <= 255 Then
            count.ForeColor = Color.Black
        End If
    End Sub
    Sub checkchange(sender As Object, e As EventArgs)
        Dim s As CheckBox = sender
        If s.Checked = True Then
            Me.Controls("membergroupbox").Enabled = True
        ElseIf s.Checked = False Then
            Me.Controls("membergroupbox").Enabled = False
        End If
    End Sub


    Sub addclient()
        disposer()
        topmenu()
        Dim label As New Label
        With label
            .Location = New Point(20, 30)
            .Text = "Add a new clien+t below. The client will be associated with the currently logged in user"
            .Size = New Size(300, 20)
        End With
        Me.Controls.Add(label)
        Dim titles As New titles
        Dim c As CurrentUser = CU
        Dim x = 20
        Dim y = 50
        Dim bus As New TextBox
        With bus
            .Location = New Point(x, y)
            .Name = "businessname"
        End With
        y += 20
        Me.Controls.Add(bus)
        Dim drop As New ComboBox
        Dim list As List(Of String) = titles.gettitles
        For Each item In list
            drop.Items.Add(item)
        Next
        drop.Location = New Point(x, y)
        drop.Name = "titlebox"
        Me.Controls.Add(drop)
        y += 20
        For i = 0 To 8
            If i = 2 Then
                Dim mltb As New TextBox
                With mltb
                    .Name = "clienttb" & i
                    .Multiline = True
                    .Size = New Size(200, 50)
                    .Location = New Point(x, y)
                End With
                y += 50
                Me.Controls.Add(mltb)
                Dim count As New Label
                With count
                    .Name = "cntlbl"
                    .Text = "0/255"
                    .Location = New Point(mltb.Location.X + mltb.Width - 30, mltb.Location.Y + mltb.Height)
                End With
                Me.Controls.Add(count)
                AddHandler mltb.TextChanged, AddressOf countchars
            Else
                Dim t As New TextBox
                With t
                    .Name = "clienttb" & i
                    .Location = New Point(x, y)
                    If i = 8 Then
                        .Enabled = False
                        .Text = CU.getusername
                    End If
                End With
                Me.Controls.Add(t)
                y += 20
            End If
        Next

        Dim button As New Button 'a button to click when all information is entered
        With button
            .Location = New Point(x, y)
            .Name = "clientbutton"
        End With
        Me.Controls.Add(button)
        AddHandler button.Click, AddressOf addclientDB
    End Sub
    Sub addclientDB()
        Dim c As CurrentUser = CU
        Dim businessname As TextBox = Me.Controls("businessname")
        Dim titlebox As ComboBox = Me.Controls("titlebox")
        For i = 0 To 8
            If (Me.Controls("clienttb" & i).Text = "") Or (businessname.Text = "") Or (titlebox.Text = "") Then
                MsgBox("One or more fields have not been filled in.")
                Exit Sub
            End If
        Next
        Dim ID = projectIDGetter()
        Dim reader
        Dim sql = "INSERT INTO contacts(BusinessName, ContactID, Title, FirstName, LastName, Notes, Phone, Email, NumAndStreet, City, Postcode, Addedby) VALUES(@businessname, @contactID, @title, @firstname, @lastname, @notes, @phone, @email, @numandstreet, @city, @postcode, @addedby)"
        Dim conn = New DatabaseConnection("projectmanagementdb")
        Dim cn = conn.GetConnection
        Using cmd = New MySqlCommand(sql, cn)
            With cmd
                .Parameters.AddWithValue("@Businessname", businessname.Text)
                .Parameters.AddWithValue("@contactID", Convert.ToInt64(ID))
                .Parameters.AddWithValue("@title", titlebox.Text)
                .Parameters.AddWithValue("@FirstName", Me.Controls("clienttb0").Text)
                .Parameters.AddWithValue("@LastName", Me.Controls("clienttb1").Text)
                .Parameters.AddWithValue("@Notes", Me.Controls("clienttb2").Text)
                .Parameters.AddWithValue("@Phone", Me.Controls("clienttb3").Text)
                .Parameters.AddWithValue("@Email", Me.Controls("clienttb4").Text)
                .Parameters.AddWithValue("@NumAndStreet", Me.Controls("clienttb5").Text)
                .Parameters.AddWithValue("@City", Me.Controls("clienttb6").Text)
                .Parameters.AddWithValue("@Postcode", Me.Controls("clienttb7").Text)
                .Parameters.AddWithValue("@AddedBy", c.getusername)
                .Connection.Open()
                reader = .ExecuteReader()
            End With
            With reader
                .read
            End With
            Dim val As MsgBoxResult = MsgBox("Client Added. Would you like to add another contact now?", vbYesNo)
            If val = vbYes Then
                disposer()
                addclient()
            Else
                disposer()
                mainpage()
            End If
        End Using
    End Sub



    Sub adduser()
        disposer()
        topmenu()
        Dim c As CurrentUser = CU
        If c.getAccessLevel = 0 Or c.getAccessLevel = 1 Then 'this line means that only access level 2 users (administrators) can add a user to the database, preventing any random person from doing so
            MsgBox("Sorry,. You don't have permission to do this. You must be an Administrator")
        Else
            For Each item In Me.Controls.OfType(Of TextBox)
                item.Dispose()
            Next
            Dim label As New Label
            With label
                .Text = "Add a user below"
                .Location = New Point(15, 25)
            End With
            Me.Controls.Add(label)
            Dim x = 20
            Dim y = 50
            For i = 0 To 9 'creates 10 textboxes which can be filled in to add a new user to the database with all the information required.
                If i = 4 Then 'makes the 4th box a date time picker to pick a date of birth easily.
                    Dim dtpicker As New DateTimePicker
                    dtpicker.Location = New Point(x, y)
                    dtpicker.Name = "useraddtb" & i
                    dtpicker.Format = DateTimePickerFormat.Custom
                    dtpicker.CustomFormat = "yyyy-MM-dd"
                    dtpicker.Size = New Size(200, 200)
                    Me.Controls.Add(dtpicker)
                ElseIf i = 9 Then
                    Dim dropgroup As New ComboBox
                    dropgroup.Location = New Point(x, y)
                    dropgroup.Size = New Size(100, 200)
                    dropgroup.Name = "useraddtb" & i
                    Me.Controls.Add(dropgroup)
                    AddHandler dropgroup.Click, AddressOf populategroupdropdown
                Else
                    Dim textbox As New TextBox
                    With textbox
                        .Name = "useraddtb" & i 'by naming all the textboxes the same thing, it makes it easier for the text to be extracted later on in the program, as well as easy disposal of all textboxes and pickers at once.
                        If i = 0 Then
                            .Enabled = False
                        End If
                        .Location = New Point(x, y)
                        .Size = New Size(200, 200)
                    End With
                    Me.Controls.Add(textbox)
                End If
                y += 20
            Next
            Dim tick As New CheckBox 'a tickbox which will ask whether the user is a teamleader or not. The teamleader being tocked or not will affect the accesslevel of the user - if teamleader is true, accesslevel = 1, else, it is 0.
            With tick
                .Location = New Point(x, y)
                .Name = "tickbox"
            End With
            Me.Controls.Add(tick)
            y += 20
            Dim nb As New Button 'a button to click when all information is entered
            With nb
                .Location = New Point(x, y)
                .Name = "nb"
            End With
            Me.Controls.Add(nb)
            AddHandler nb.Click, AddressOf adduserDB 'when button clicked, go to the sub to add the TB information to the DB
        End If
    End Sub


    Sub populategroupdropdown(sender As Object, e As EventArgs)
        Dim d As ComboBox = sender 'The name of the box which has the selection of a group
        d.Items.Clear()
        Dim sql As String = "SELECT * FROM groups"
        Dim cntsql As String = "SELECT COUNT(*) from groups"
        Dim databaseconnection As New DatabaseConnection("ProjectManagementDB")
        Dim cn = databaseconnection.GetConnection
        Dim reader
        Dim scale As Integer
        Using cmd As New MySqlCommand(cntsql, cn)
            cmd.Connection.Open()
            scale = Convert.ToInt32(cmd.ExecuteScalar)
        End Using
        Using cmd As New MySqlCommand(sql, cn) 'an example of using the 'Using' function in VB.NET so that the connection doesn't need to be closed after we finish grabbing information from the db, it does this automatically
            With cmd
                reader = .ExecuteReader
            End With
            With reader
                For i = 1 To scale
                    .read
                    d.Items.Add(.item("groupname")) 'for every item being read from the DB, it will be added to the list to be shown in the combobox afterwards
                Next
            End With
        End Using
        d.Items.Add("New Group...")
        AddHandler d.TextChanged, AddressOf shouldcreategroup
    End Sub
    Sub shouldcreategroup(sender As Object, e As EventArgs)
        Dim d As ComboBox = sender
        If d.Text = "New Group..." Then
            Dim t As New TextBox
            With t
                .Name = "grouptextbox"
                .Size = New Size(d.Width, d.Height)
                .Location = New Point(d.Location.X + d.Width, d.Location.Y)
            End With
            Me.Controls.Add(t)
            Dim bt As New Button
            With bt
                .Text = "Add"
                .Name = "tbtn"
                .Size = New Size(d.Width / 2, d.Height)
                .Location = New Point(t.Location.X + t.Width, t.Location.Y)
            End With
            AddHandler bt.Click, AddressOf addgrptodb
            Me.Controls.Add(bt)
        End If
        Dim b As New Button
    End Sub
    Sub addgrptodb(sender As Object, e As EventArgs)
        Dim b As Button = sender
        Dim d As ComboBox = Me.Controls("useraddtb9")
        Dim sql As String = "INSERT INTO groups(groupname) VALUES(@grpinsert)"
        Dim databaseconnection As New DatabaseConnection("ProjectManagementDB")
        Dim cn = databaseconnection.GetConnection
        Using cmd As New MySqlCommand(sql, cn)
            With cmd
                .Connection.Open()
                .Parameters.AddWithValue("@grpinsert", Me.Controls("grouptextbox").Text.ToString)
            End With
            Dim reader = cmd.ExecuteReader
            With reader
                .Read()
            End With
        End Using
        MsgBox("Group Added")
        b.Dispose()
        Me.Controls("grouptextbox").Dispose()
    End Sub

    Sub adduserDB(sender As Object, e As EventArgs)
        Dim bool As Boolean = False 'set the boolean false so when the button is clicked, if all fields have been filled in, the program will run, even in previously there were missing boxes.
        Dim phonebool As Boolean = False
        Dim emailcheck As Boolean = False
        Dim s As String = Me.Controls("useraddtb1").Text
        Dim ss1 As Char
        For i = 1 To 9
            Me.Controls("useraddtb" & i).BackColor = Color.White 'makes all the fields white so that when the button is clicked, only the blank fields are made red.
            If Me.Controls("useraddtb" & i).Text = Nothing And i <> 2 Then 'if one of the textboxes (created in the previous sub) is blank, it will turn red, and set a boolean variable to true which will prevent the add user function running further
                Me.Controls("useraddtb" & i).BackColor = Color.FromArgb(255, 237, 240)
                bool = True
            End If
        Next
        Try
            Convert.ToInt64(Me.Controls("useraddtb6").Text)
        Catch ex As Exception
            phonebool = True
        End Try
        If bool = True Then 'we dont want to add null data to the database other than the 'middle name' value, which can be null, therefore, we need to check whether all the textboxes have been filled in.
            MsgBox("One or more fields haven't been filled!")
        ElseIf phonebool = True Then
            MsgBox("Phone Number not valid. Please Check It!")
        ElseIf Not Me.Controls("useraddtb5").ToString.Length = 9 * 5 Then
            MsgBox("National Insurance Number not valid. Please Check It!")
            Dim regexstr As New Regex("@+(.+)+") 'using regex to ensure that the email entered is in a valid format (must have one or more @'s, and must have one or more '.'s, 1 or more times.)
            If regexstr.IsMatch(Me.Controls("useraddtb7").Text) Then 'checks the input against the regular expression
                emailcheck = True
            Else
                MsgBox("Email not valid. Please Check It!")
            End If
        ElseIf bool = False And phonebool = False And emailcheck = False Then
            ss1 = s.Substring(0, 1).ToLower
            Me.Controls("useraddtb0").Text = ss1 & Me.Controls("useraddtb3").Text
            Dim t As CheckBox = Me.Controls("tickbox")
            Dim currntmpvar(10) As String
            For i = 0 To 10
                If i < 10 Then
                    currntmpvar(i) = Me.Controls("useraddtb" & i).Text
                    Me.Controls("useraddtb" & i).Enabled = False
                Else
                    If t.Checked = True Then
                        currntmpvar(i) = 1
                    Else
                        currntmpvar(i) = 0
                    End If
                End If
            Next
            Dim databaseconnection As New DatabaseConnection("ProjectManagementDB") 'calls upon the DatabaseConnection class
            Dim conn = databaseconnection.GetConnection
            conn.open
            Dim sql As String = "INSERT INTO userinformation (username, membergroup, isteamleader, accesslevel) VALUES (@username, @membergroup, @mbint, @accesslevel);  INSERT INTO staffinformation (username, firstname, middlename, lastname, dateofbirth, nationalinsurance, phone, email, locatedat) VALUES (@username, @firstname, @middlename, @lastname, @dateofbirth, @nationalinsurance, @phone, @email, @locatedat);"
            Dim cmd As New MySqlCommand(sql, conn)
            For i = 0 To 10
                Select Case i
                    Case 0
                        cmd.Parameters.AddWithValue("@username", currntmpvar(i).ToLower)
                    Case 1
                        Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(currntmpvar(i))
                        cmd.Parameters.AddWithValue("@firstname", currntmpvar(i))
                    Case 2
                        Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(currntmpvar(i))
                        cmd.Parameters.AddWithValue("@middlename", currntmpvar(i))
                    Case 3
                        Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(currntmpvar(i))
                        cmd.Parameters.AddWithValue("@lastname", currntmpvar(i))
                    Case 4
                        cmd.Parameters.AddWithValue("@dateofbirth", Me.Controls("useraddtb4").Text.ToString)
                    Case 5
                        currntmpvar(i).ToUpper()
                        cmd.Parameters.AddWithValue("@nationalinsurance", currntmpvar(i).ToUpper)
                    Case 6
                        cmd.Parameters.AddWithValue("@phone", Convert.ToInt64(Me.Controls("useraddtb6").Text))
                    Case 7
                        cmd.Parameters.AddWithValue("@email", currntmpvar(i))
                    Case 8
                        cmd.Parameters.AddWithValue("@locatedat", currntmpvar(i))
                    Case 9
                        cmd.Parameters.AddWithValue("@membergroup", currntmpvar(i))
                    Case Else
                        cmd.Parameters.AddWithValue("@mbint", Convert.ToInt64(currntmpvar(i)))
                        cmd.Parameters.AddWithValue("@accesslevel", Convert.ToInt64(currntmpvar(i)))
                End Select
            Next
            Dim reader = cmd.ExecuteReader
            With reader
                .Read()
            End With
            MsgBox("User has been added. When this user first logs in, they will be asked to change their password and verify their information before having access to data.")
            Dim a As MsgBoxResult = MsgBox("Would you like to create a new user now?", vbYesNo)
            If a = vbYes Then
                disposer()
                aprojectadd()
            Else
                For i = 0 To 9
                    disposer()
                    mainpage()
                Next
            End If
        End If
    End Sub
    Public Sub logclick()
        Dim c As CurrentUser = CU
        c.LogOffClear() 'calls the object sub which
        disposer() 'clears all items on the form
        LoginInput()
    End Sub
    Sub disposer() 'disposes of all the items in the form
        For i As Integer = Me.Controls.Count - 1 To 0 Step -1
            Me.Controls(i).Dispose()
        Next
    End Sub
    Sub exitclick(sender As Object, e As EventArgs)
        Dim c As CurrentUser = CU
        c.LogOffClear()
        disposer()
        Me.Close()
    End Sub
    Public Sub changepassword()
        disposer()
        topmenu()
        Dim x = 20
        Dim y = 50
        Dim l As New Label
        l.Size = New Size(600, 15)
        l.Location = New Point(x, y - 20)
        l.Text = "Enter a new password below. You'll need to log in again after you've done this. IT IS CASE SENSITIVE!"
        Me.Controls.Add(l)
        For i = 0 To 1
            Dim t As New TextBox
            With t
                .Location = New Point(x, y)
                .Name = "passtb" & i
                .PasswordChar = "*"
            End With
            y = y + 20
            Me.Controls.Add(t)
        Next
        Dim b As New Button
        With b
            .Location = New Point(x, y)
            .Name = "passcheckbtn"
        End With
        Me.Controls.Add(b)
        AddHandler b.Click, AddressOf pwset
    End Sub
    Sub pwset()
        Dim pw1 As TextBox = Me.Controls("passtb0")
        Dim pw2 As TextBox = Me.Controls("passtb1")
        Dim c As CurrentUser = CU
        If pw1.Text.Length < 8 Then
            MsgBox("Your password needs to be 8 characters or more.")
            pw1.BackColor = Color.FromArgb(255, 237, 240)
            Exit Sub 'exits the sub prematurely if the passwords entered are not more than 8 characters.
        End If
        If Not pw1.Text = pw2.Text Then
            MsgBox("Your passwords do not match.")
            pw1.BackColor = Color.FromArgb(255, 237, 240)
            pw1.BackColor = Color.FromArgb(255, 237, 240)
            Exit Sub
        End If
        Dim databaseconnection As New DatabaseConnection("ProjectManagementDB") 'calls upon the DatabaseConnection class
        Dim conn = databaseconnection.GetConnection
        conn.open
        Dim sql As String = "UPDATE `userinformation` SET `Password`= @password WHERE username = @username"
        'the above SQL query draws data from multiple tables at once, demonstrating multi-table selection from a database
        Dim cmd As New MySqlCommand(sql, conn)
        cmd.Parameters.AddWithValue("@password", pw2.Text)
        cmd.Parameters.AddWithValue("@username", c.getusername)
        Dim reader = cmd.ExecuteReader
        With reader 'sets the values in this class to the values grabbed from the database
            .Read()
        End With
        MsgBox("Your password has been changed. You now need to log in again.")
        conn.close
        logclick()
    End Sub
End Class


Class CurrentUser
    Private Username As String 'the username of the current user
    Private passwordtemp As String
    Private firstname As String
    Private middlename As String
    Private lastname As String
    Private AccessLevel As String 'the level of access which a user has eg. can they add new users to the database?
    Private membergroup As String 'the group which the staff member works within (The business has multiple groups within it which different members of staff work within, eg. the orange group is responsible for the most important operations)
    Private isTeamLeader As Boolean '0 false 1 true in DB, sets whether the member can add projects for their group.
    Private phone As String 'The phone number of the staff member currently logged in
    Private email As String 'the email address of the staff member currently logged in
    Private locatedAt As String 'the locatedin entry is in the database simply to define where the user is generally based, eg. London, Bradford, etc.
    Public Sub setusername(usernamein)
        Username = usernamein
    End Sub
    Public Function getusername()
        Return Username
    End Function
    Public Function getmembergroup()
        Return membergroup
    End Function
    Public Function getAccessLevel()
        Return AccessLevel
    End Function
    Public Function getfirstname()
        Return firstname
    End Function
    Public Function getmiddlename()
        Return middlename
    End Function
    Public Function getlastname()
        Return lastname
    End Function
    Public Function getteamleader()
        Return isTeamLeader
    End Function
    Public Function getphone()
        Return phone
    End Function
    Public Function getemail()
        Return email
    End Function
    Public Function getlocatedat()
        Return locatedAt
    End Function
    Public Sub LogOffClear()
        Username = ""
        firstname = ""
        middlename = ""
        lastname = ""
        AccessLevel = ""
        membergroup = ""
        isTeamLeader = False
        phone = ""
        email = ""
        locatedAt = ""
    End Sub
    Public Sub setinfo()
        Dim databaseconnection As New DatabaseConnection("ProjectManagementDB") 'calls upon the DatabaseConnection class
        Dim conn = databaseconnection.GetConnection
        conn.open
        Dim sql As String = "SELECT userinformation.membergroup, userinformation.password, userinformation.isteamleader, userinformation.accesslevel, staffinformation.Firstname, staffinformation.Middlename, staffinformation.Lastname, staffinformation.phone, staffinformation.email, staffinformation.locatedat FROM userinformation, staffinformation WHERE staffinformation.username = @username AND userinformation.username = @username"
        'the above SQL query draws data from multiple tables at once, demonstrating multi-table selection from a database
        Dim cmd As New MySqlCommand(sql, conn)
        cmd.Parameters.AddWithValue("@username", Username)
        Dim reader = cmd.ExecuteReader
        With reader 'sets the values in this class to the values grabbed from the database
            .Read()
            Dim passwordtemp = (.Item("Password").ToString)
            If passwordtemp = Nothing Or passwordtemp = "" Then
                Form1.boolpub = False
                MsgBox("You need to set a password before you can access your account.")
                Form1.changepassword()
            Else
                Form1.boolpub = True
            End If
            If Form1.boolpub = True Then
                membergroup = (.Item("membergroup").ToString)
                If (.Item("isteamleader")) = 0 Then
                    isTeamLeader = False
                Else
                    isTeamLeader = True
                End If
                firstname = (.Item("firstname").ToString)
                If (.Item("middlename").ToString) <> Nothing Then
                    middlename = (.Item("middlename").ToString)
                End If
                lastname = (.Item("lastname").ToString)
                phone = (.Item("phone").ToString)
                email = (.Item("email").ToString)
                locatedAt = (.Item("locatedat").ToString)
                AccessLevel = (.Item("accesslevel").ToString)
            End If
        End With
        cmd.Parameters.Clear()
        conn.close
    End Sub
End Class


Class titles 'an object which stores titles, can be used anywhere in the program and made as it could be used in the future
    Private mr As String = "Mr"
    Private mrs As String = "Mrs"
    Private ms As String = "Ms"
    Private dr As String = "Dr"
    Private mister As String = "Mister"
    Private master As String = "Master"
    Private prof As String = "Prof"
    Public Function gettitles()
        Dim a As New List(Of String)
        a.Add(mr)
        a.Add(mrs)
        a.Add(ms)
        a.Add(dr)
        a.Add(mister)
        a.Add(master)
        a.Add(prof)
        Return a
    End Function
End Class


Class DatabaseConnection 'an object which allows the connection to any database - theoretically, this program could use 2 seperate databases, perhaps one for client side resources, and one for business side users and projects. This could be implemented in a future revision to make the object more useful.
    Private Connection As MySqlConnection
    Private Database As String
    Private Sub ConnectToDatabase()
        Dim ConnectionString = "server=localhost;user id=root;;database=" & Database 'Will use the variable 'Database' to connect to the DB
        'IT IS NOT GOOD PRACTISE TO USE THE DATABASE LOGGED IN AS ROOT! THIS PROJECT WOULD BE MODIFIED BEFORE BEING FULLY DEPLOYED!
        Connection = New MySqlConnection(ConnectionString) 'Variable it will use to connect to the database
    End Sub
    Public Sub New(DatabaseToUse) 'The paramater is the database we are going to be using
        Database = DatabaseToUse
        ConnectToDatabase()
    End Sub
    Public Function GetConnection()
        Return Connection 'returns the connection to the database to wherever we called it.
    End Function
End Class
