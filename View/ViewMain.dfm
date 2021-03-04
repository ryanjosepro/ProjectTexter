object WindowMain: TWindowMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Texter'
  ClientHeight = 558
  ClientWidth = 836
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LblText: TLabel
    Left = 8
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Texto'
  end
  object LblResult: TLabel
    Left = 8
    Top = 297
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object LblTotWithSpaces: TLabel
    Left = 8
    Top = 238
    Width = 156
    Height = 13
    Caption = 'Total Caracteres (com espa'#231'os):'
  end
  object LblTotLetters: TLabel
    Left = 452
    Top = 239
    Width = 61
    Height = 13
    Caption = 'Total Letras:'
  end
  object LblTotNumbers: TLabel
    Left = 602
    Top = 239
    Width = 73
    Height = 13
    Caption = 'Total N'#250'meros:'
  end
  object LblTotWithoutSpaces: TLabel
    Left = 230
    Top = 238
    Width = 156
    Height = 13
    Caption = 'Total Caracteres (sem espa'#231'os):'
  end
  object MemoText: TMemo
    Left = 8
    Top = 26
    Width = 817
    Height = 206
    ScrollBars = ssBoth
    TabOrder = 0
    OnChange = MemoTextChange
  end
  object MemoResult: TMemo
    Left = 8
    Top = 316
    Width = 817
    Height = 224
    ScrollBars = ssBoth
    TabOrder = 13
  end
  object CheckWpp55: TCheckBox
    Left = 443
    Top = 293
    Width = 30
    Height = 17
    Caption = '55'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object CheckWpp62: TCheckBox
    Left = 491
    Top = 295
    Width = 30
    Height = 13
    Caption = '62'
    Checked = True
    State = cbChecked
    TabOrder = 12
  end
  object BtnUppercase: TButton
    Left = 8
    Top = 257
    Width = 81
    Height = 34
    Action = ActUppercase
    TabOrder = 1
  end
  object BtnLowercase: TButton
    Left = 95
    Top = 257
    Width = 81
    Height = 34
    Action = ActLowercase
    TabOrder = 2
  end
  object BtnCapitalized: TButton
    Left = 182
    Top = 257
    Width = 81
    Height = 34
    Action = ActCapitalized
    TabOrder = 3
  end
  object BtnWppLink: TButton
    Left = 443
    Top = 258
    Width = 81
    Height = 34
    Action = ActWhatsapp
    TabOrder = 10
  end
  object BtnLetters: TButton
    Left = 269
    Top = 257
    Width = 81
    Height = 34
    Action = ActLetters
    TabOrder = 4
  end
  object BtnNumbers: TButton
    Left = 356
    Top = 257
    Width = 81
    Height = 34
    Action = ActNumbers
    TabOrder = 5
  end
  object BtnNoBreaklines: TButton
    Left = 530
    Top = 257
    Width = 81
    Height = 34
    Action = ActNoBreaklines
    TabOrder = 6
  end
  object SpeedButton8: TButton
    Left = 617
    Top = 257
    Width = 81
    Height = 34
    TabOrder = 7
  end
  object SpeedButton1: TButton
    Left = 704
    Top = 257
    Width = 81
    Height = 34
    TabOrder = 8
  end
  object BtnCopyText: TButton
    Left = 791
    Top = 257
    Width = 34
    Height = 34
    Action = ActCopyToText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object Actions: TActionList
    Left = 720
    Top = 480
    object ActUppercase: TAction
      Caption = 'Uppercase'
      OnExecute = ActUppercaseExecute
    end
    object ActLowercase: TAction
      Caption = 'Lowercase'
      OnExecute = ActLowercaseExecute
    end
    object ActCapitalized: TAction
      Caption = 'Capitalized'
      OnExecute = ActCapitalizedExecute
    end
    object ActLetters: TAction
      Caption = 'Letters'
      OnExecute = ActLettersExecute
    end
    object ActNumbers: TAction
      Caption = 'Numbers'
      OnExecute = ActNumbersExecute
    end
    object ActWhatsapp: TAction
      Caption = 'Whatsapp Link'
      OnExecute = ActWhatsappExecute
    end
    object ActNoBreaklines: TAction
      Caption = 'No Breakelines'
      OnExecute = ActNoBreaklinesExecute
    end
    object ActCopyToText: TAction
      Caption = #8593
      OnExecute = ActCopyToTextExecute
    end
    object ActEsc: TAction
      Caption = 'ActEsc'
      ShortCut = 27
      OnExecute = ActEscExecute
    end
  end
end
