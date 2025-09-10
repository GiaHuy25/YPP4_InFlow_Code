var builder = DistributedApplication.CreateBuilder(args);

builder.AddProject<Projects.Manu>("Manu");

builder.Build().Run();