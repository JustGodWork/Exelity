---
--- @author Kadir#6666
--- Create at [20/04/2023] 17:00:58
--- Current project [Exelity-V1]
--- File name [Reports]
---

Shared.Events:OnNet(Enums.Administration.Client.ReportSetValue, function(reportId, key, value)

    if (Client.Admin == nil or type(reportId) ~= "number" or key == nil) then

        return

    end

    Client.Admin:SetReportValue(reportId, key, value)

end);

Shared.Events:OnNet(Enums.Administration.Client.ReportAdd, function(reportData)

    if (Client.Admin == nil or type(reportData) ~= "table") then

        return

    end

    Client.Admin:AddReport(reportData)

end);

Shared.Events:OnNet(Enums.Administration.Client.ReportRemove, function(reportIndex)

    if (Client.Admin == nil or type(reportIndex) ~= "number") then

        return

    end

    Client.Admin:RemoveReport(reportIndex)

end);