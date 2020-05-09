object WindowMain: TWindowMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Texter'
  ClientHeight = 558
  ClientWidth = 719
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
  object BtnUppercase: TSpeedButton
    Left = 8
    Top = 257
    Width = 81
    Height = 34
    Action = ActUppercase
  end
  object BtnLowercase: TSpeedButton
    Left = 95
    Top = 257
    Width = 81
    Height = 34
    Action = ActLowercase
  end
  object BtnCapitalized: TSpeedButton
    Left = 182
    Top = 257
    Width = 81
    Height = 34
    Action = ActCapitalized
  end
  object SpeedButton4: TSpeedButton
    Left = 269
    Top = 257
    Width = 81
    Height = 34
  end
  object SpeedButton5: TSpeedButton
    Left = 356
    Top = 257
    Width = 81
    Height = 34
  end
  object SpeedButton6: TSpeedButton
    Left = 443
    Top = 257
    Width = 81
    Height = 34
  end
  object SpeedButton7: TSpeedButton
    Left = 530
    Top = 257
    Width = 81
    Height = 34
  end
  object SpeedButton8: TSpeedButton
    Left = 617
    Top = 257
    Width = 81
    Height = 34
  end
  object MemoText: TMemo
    Left = 8
    Top = 27
    Width = 690
    Height = 224
    TabOrder = 0
  end
  object MemoResult: TMemo
    Left = 8
    Top = 316
    Width = 690
    Height = 224
    TabOrder = 1
  end
  object Actions: TActionList
    Left = 648
    Top = 488
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
  end
end
