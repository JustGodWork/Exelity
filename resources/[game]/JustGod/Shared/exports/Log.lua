--
--Created Date: 21:06 11/12/2022
--Author: JustGod
--Made with ❤
--
--File: [Log]
--
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

exports("Info", function(message, ...)
    Shared.Log:Info(message, ...);
end);

exports("Debug", function(message, ...)
    Shared.Log:Debug(message, ...);
end);

exports("Warn", function(message, ...)
    Shared.Log:Warn(message, ...);
end);

exports("Error", function(message, ...)
    Shared.Log:Error(message, ...);
end);

exports("Success", function(message, ...)
    Shared.Log:Success(message, ...);
end);