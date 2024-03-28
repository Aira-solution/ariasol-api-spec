import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace AriaService.Vendor;

model Vendor {
    /**
     * 이름
     */
    name: string;

    /**
     * 전화번호
     */
    phoneNumber: string;

    /**
     * 이메일
     */
    email: string;

    /**
     * 사업자 번호
     */
    businessNumber?: string;
}
