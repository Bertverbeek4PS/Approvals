page 50201 UserSetupAPI
{
    PageType = API;
    Caption = 'userSetup';
    APIPublisher = '4PS';
    APIGroup = 'approvals';
    APIVersion = 'v1.0';
    EntityName = 'userSetup';
    EntitySetName = 'userSetup';
    SourceTable = "User Setup";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(userId; rec."User ID")
                {
                    Caption = 'User ID';

                }
                field(eMail; rec."E-Mail")
                {
                    Caption = 'E-mail';

                }
                field(employeeNo; rec."Employee No.")
                {
                    Caption = 'Employee No.';

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
}