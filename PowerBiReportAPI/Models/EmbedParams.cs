﻿using Microsoft.PowerBI.Api.Models;
using System.Collections.Generic;

namespace PowerBiReportAPI.Models
{
    public class EmbedParams
    {
        public string Type { get; set; }
        public List<EmbedReport> EmbedReport { get; set; }
        public EmbedToken EmbedToken { get; set; }
    }
}
