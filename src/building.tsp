import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./base.tsp";
import "./account.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace AriaService.Building;

model Building {
    @key
    id: integer;

    name: string;
    address: string;
    kind: "집합건물" | "오피스텔" | "공동주택" | "빌라" | "기타";

    /**
     * 완공일
     */
    completedAt: plainDate;

    createdAt: plainDate;
    updatedAt: plainDate;
    managementCompaniesId: integer[];

    /**
     * 빌딩에 대한 메모
     * @default ""
     */
    memo: string;

    /**
     * 관리비 계좌
     */
    feeAccount: Account.Account;
}
