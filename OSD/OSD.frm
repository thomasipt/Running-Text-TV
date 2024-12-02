VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MENU PESAN"
   ClientHeight    =   2175
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5145
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2175
   ScaleWidth      =   5145
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Keluar"
      Default         =   -1  'True
      Height          =   375
      Left            =   2025
      TabIndex        =   4
      Top             =   1620
      Width           =   1095
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   50
      Left            =   225
      Max             =   1000
      Min             =   10
      TabIndex        =   3
      Top             =   1080
      Value           =   10
      Width           =   4695
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Animate (select if message doesnt fit screeen)"
      Height          =   255
      Left            =   165
      TabIndex        =   2
      Top             =   600
      Value           =   1  'Checked
      Width           =   3615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test OSD"
      Height          =   375
      Left            =   3885
      TabIndex        =   1
      Top             =   540
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   165
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   120
      Width           =   4815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Function OSD(xOSDtext As String, Optional xAnimateOSD As Boolean = True)
On Error Resume Next
Unload OSDwin
OSDwin.AnimateOSD = xAnimateOSD
OSDwin.text.Caption = xOSDtext
OSDwin.Show
End Function

Private Sub Command1_Click()
Text1 = Format(Text1, ">")
KECEPATAN = HScroll1.Value
OSD Text1.text, Check1.Value
End Sub

Private Sub Command2_Click()
End
End Sub

Private Sub HScroll1_Change()
KECEPATAN = HScroll1.Value
End Sub
