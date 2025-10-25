unit JD.ListControllerEditors;

interface

uses
  System.Contnrs, System.Classes, System.TypInfo,
  DesignEditors, DesignIntf,
  uListItemBase;

type
  TItemClassProperty = class(TClassProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure Register;

implementation

uses
  JD.ListController;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TListItemBaseClass), TJDListController, 'ItemClass', TItemClassProperty);
end;

{ TItemClassProperty }

function TItemClassProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TItemClassProperty.GetValues(Proc: TGetStrProc);
var
  List: TStringList;
  I: Integer;
begin
  List := TStringList.Create;
  try
    GetRegisteredListItemClasses(List);
    for I := 0 to List.Count - 1 do
      Proc(List[I]);
  finally
    List.Free;
  end;

end;

end.
