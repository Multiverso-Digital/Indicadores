unit Usplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RxGIF, jpeg;

type
  TFSplash = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation

uses Uprincipal;

{$R *.dfm}

procedure TFSplash.Button1Click(Sender: TObject);
begin
  Form1:=TForm1.create(self);
  Form1.showModal;
  Form1.free;
end;

end.
