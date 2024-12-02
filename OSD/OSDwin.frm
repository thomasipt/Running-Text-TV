VERSION 5.00
Begin VB.Form OSDwin 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   1305
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3540
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1305
   ScaleWidth      =   3540
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer 
      Enabled         =   0   'False
      Left            =   0
      Top             =   0
   End
   Begin VB.Timer ScrollTimer 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   480
      Top             =   0
   End
   Begin VB.Label text 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   48
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1080
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   270
   End
End
Attribute VB_Name = "OSDwin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public AnimateOSD As Boolean

'Private Const HWND_BOTTOM = 1
'Private Const HWND_NOTOPMOST = -2
'Private Const HWND_TOP = 0
Private Const HWND_TOPMOST = -1
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1

Private Declare Function GetActiveWindow Lib "user32" () As Long

Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Sub Form_Click()
Unload Me
End Sub

Private Sub Form_Load()
Me.Top = Screen.Height - Me.Height
Me.Left = 0
Width = Screen.Width

SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE

    If AnimateOSD Then
        Timer.Interval = 1500
    Else
        Timer.Interval = 4000
    End If
Timer.Enabled = True
End Sub

Private Sub ScrollTimer_Timer()
If text.Left > -text.Width Then
    text.Left = text.Left - KECEPATAN
Else
    text.Left = Screen.Width
End If
End Sub

Private Sub text_Click()
Unload Me
End Sub

Private Sub Timer_Timer()
Timer.Enabled = False
If AnimateOSD Then ScrollTimer.Enabled = True Else Unload Me
End Sub
