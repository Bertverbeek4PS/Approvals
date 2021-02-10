page 50200 ApprovalEntriesAPI
{
    PageType = API;
    Caption = 'approvalEntries';
    APIPublisher = '4PS';
    APIGroup = 'approvals';
    APIVersion = 'v1.0';
    EntityName = 'approvalEntries';
    EntitySetName = 'approvalEntries';
    SourceTable = "Approval Entry";
    DelayedInsert = true;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)

            {
                field(entryNo; rec."Entry No.")
                {
                    Caption = 'entryNo';

                }
                field(documentType; rec."Document Type")
                {
                    Caption = 'documentType';

                }
                field(documentNo; rec."Document No.")
                {
                    Caption = 'documentNo';

                }
                field(documentLineNo; rec."Document Line No.")
                {
                    Caption = 'documentLineNo';

                }
                field(approverID; rec."Approver ID")
                {
                    Caption = 'approverID';

                }
                field("recordIDToApprove"; rec."Record ID to Approve")
                {
                    Caption = 'RecordIDToApprive';
                }
                field(Status; rec.Status)
                {
                    Caption = 'Status';
                }
                field(SystemId; rec.SystemId)
                {
                    Caption = 'systemId';

                }
                field(SystemCreatedAt; rec.SystemCreatedAt)
                {
                    Caption = 'systemCreatedAt';

                }
                field(SystemCreatedBy; rec.SystemCreatedBy)
                {
                    Caption = 'systemCreatedBy';

                }
                field(SystemModifiedAt; rec.SystemModifiedAt)
                {
                    Caption = 'systemModifiedAt';

                }
                field(SystemModifiedBy; rec.SystemModifiedBy)
                {
                    Caption = 'systemModifiedBy';

                }
            }
        }
    }
    [ServiceEnabled]
    procedure approveEntry(var ActionContext: WebServiceActionContext)
    var
        ApprovalEntry: Record "Approval Entry" temporary;
        ApprovalPageOption: Option All,Hours,"All Except Hours";
    begin
        ApprovalEntry.ProcessDetailedApprovalEntries(rec, 0, true, ApprovalEntry, ApprovalPageOption::All);
        SetActionResponse(ActionContext, rec."SystemId");
    end;

    local procedure SetActionResponse(var ActionContext: WebServiceActionContext; InvoiceId: Guid)
    var
    begin
        SetActionResponse(ActionContext, Page::ApprovalEntriesAPI, InvoiceId);
    end;

    local procedure SetActionResponse(var ActionContext: WebServiceActionContext; PageId: Integer; DocumentId: Guid)
    var
    begin
        ActionContext.SetObjectType(ObjectType::Page);
        ActionContext.SetObjectId(PageId);
        ActionContext.AddEntityKey(rec.FieldNo(SystemId), DocumentId);
        ActionContext.SetResultCode(WebServiceActionResultCode::Updated);
    end;
}