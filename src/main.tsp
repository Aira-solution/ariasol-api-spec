import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./account.tsp";
import "./auth.tsp";
import "./building.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

@service({
  title: "Aria Service",
})
@server("http://ariasol.co.kr", "production")
@server("http://localhost:8080", "development")
namespace AriaService;
