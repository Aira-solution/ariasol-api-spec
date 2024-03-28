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
    @minLength(1)
    name: string;

    /**
     * 전화번호
     */
    @pattern(
        "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$",
        "전화번호 형식이 올바르지 않습니다."
    )
    phoneNumber: string;

    /**
     * 이메일
     */
    @format("email")
    email: string;

    /**
     * 사업자 번호
     */
    @pattern(
        "^[0-9]{10}$ | ^[0-9]{3}-[0-9]{2}-[0-9]{5}$",
        "사업자 번호 형식이 올바르지 않습니다."
    )
    businessNumber?: string;
}
