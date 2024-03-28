import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace AriaService.Lessee;

model Lessee {
    @key
    id: integer;

    // 여러 방에 같은 임차인이 있을 수 있음.

    /**
     * 임차인 이름
     *
     * @minLength 1
     */
    @minLength(1)
    name: string;

    /**
     * 사업자 등록번호
     *
     * @pattern ^[0-9]{3}-[0-9]{2}-[0-9]{5}$
     */
    @pattern("^[0-9]{3}-[0-9]{2}-[0-9]{5}$")
    businessRegistrationNumber: string;

    /**
     * 사업자명
     */
    @minLength(1)
    businessName: string;

    /**
     * 휴대폰 번호
     */
    @format("phone")
    @pattern("^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$")
    phone: string;

    /**
     * 이메일
     */
    @format("email")
    email: string;

    /**
     * 비상연락처
     */
    @format("phone")
    emergencyContact: string;

    createdAt: plainDate;
    updatedAt: plainDate;
}
