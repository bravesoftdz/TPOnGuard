{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{$W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

{$IFNDEF Win32}
  {$G+} {286 Instructions}
  {$N+} {Numeric Coprocessor}
  {$C MOVEABLE,DEMANDLOAD,DISCARDABLE}
{$ELSE}
  {$J+} {Assignable Typed Constants}                                   {!!.11}
{$ENDIF}

unit CODEGENU;

interface

uses
  {$IFDEF MSWINDOWS} Windows, Messages, {$ENDIF}
  {$IFDEF LINUX} Libc, {$ENDIF}
  {$IFDEF UsingCLX} Types, {$ENDIF}
  SysUtils, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, onguard, ogutil;

type
  TCodeGenFrm = class(TForm)
    GenerateBtn: TButton;
    CodeEd: TEdit;
    Label2: TLabel;
    CloseBtn: TBitBtn;
    CopySb: TSpeedButton;
    OgMakeCodes1: TOgMakeCodes;
    procedure CopySbClick(Sender: TObject);
    procedure GenerateBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CodeGenFrm: TCodeGenFrm;

implementation

{$R *.xfm}

procedure TCodeGenFrm.CopySbClick(Sender: TObject);
var
  OldSelStart : Integer;
begin
  OldSelStart := CodeEd.SelStart;
  CodeEd.SelStart := 0;
  CodeEd.SelLength := MaxInt;
  CodeEd.CopyToClipboard;
  CodeEd.SelStart := OldSelStart;
  CodeEd.SelLength := 0;
end;

procedure TCodeGenFrm.GenerateBtnClick(Sender: TObject);
const
  CKey : TKey = ($E5,$8F,$84,$D6,$92,$C9,$A4,$D8,$1A,$FA,$6F,$8D,$AB,$FC,$DF,$B4);
var
  Work : TCode;
begin
  {set default key to use}
  OgMakeCodes1.SetKey(CKey);
  if OgMakeCodes1.Execute then begin
    {get the code}
    OgMakeCodes1.GetCode(Work);
    {display the code}
    CodeEd.Text := OgUtil.BufferToHex(Work, SizeOf(Work));
  end;


end;

end.
