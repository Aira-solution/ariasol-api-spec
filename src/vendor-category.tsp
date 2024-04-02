import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace AriaService.VendorCategory;

model VendorCategory {
    /*
    * 이름
    */
    @minLength(1)
    @maxLength(30)
    name: string;
}

model UpdateVendorCateogry is VendorCategory;

model CreateVendorCateogry is VendorCategory;

model VendorCategoryResponse is VendorCategory {
    id: integer;
}

@route("/api/vendor-category")
@tag("vendor-category")
interface VendorCategoryService extends AriaResourceOperation<VendorCategoryResponse, Error> {
    @useAuth(BearerAuth)
    @post
    create(...CreateVendorCateogry) : (VendorCategoryResponse) | Error;

    @useAuth(BearerAuth)
    @put
    put(@path id: integer, ...UpdateVendorCateogry) : (VendorCategoryResponse) | Error;

    @useAuth(BearerAuth)
    @delete
    delete(@path id: integer) : void | Error;
}