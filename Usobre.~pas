unit Usobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxGIF, ExtCtrls, shellapi;

type
  TFsobre = class(TForm)
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsobre: TFsobre;

implementation

{$R *.dfm}

procedure TFsobre.Button1Click(Sender: TObject);
begin
close;
end;

procedure TFsobre.Label3Click(Sender: TObject);
begin
shellexecute(handle, 'open', pchar('http://www.abreuretto.com'),nil, nil, SW_SHOW);

end;

end.
