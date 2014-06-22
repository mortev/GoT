using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Data;

namespace GoT.Server.Utils
{
    public static class Logger
    {
        public static void LogError(string method, string errorCode, string errorMessage, string stackTrace)
        {
            using (var ctx = new GoTDataContext())
            {
                var logEntry = ctx.ErrorLogs.CreateObject();
                logEntry.Method = method;
                logEntry.ErrorCode = errorCode;
                logEntry.ErrorMessage = errorMessage;
                logEntry.Timestamp = DateTime.Now;
                logEntry.StackTrace = stackTrace;

                ctx.ErrorLogs.AddObject(logEntry);
                ctx.SaveChanges();
            }
        }
    }
}