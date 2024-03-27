import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./base.tsp";

namespace AriaService.Account;

using TypeSpec.Rest;
using TypeSpec.Http;

model Account {
    @key id: integer;

    /**
     * 별명
     */
    `alias`: string;

    /**
     * 은행 이름
     * @example KB국민, 신한 등
     */
    bank: string;

    /**
     * 계좌번호
     */
    accountNumber: string;

    /**
     * 예금주
     */
    accountHolder: string;
}

@route("/api/account")
@tag("account")
interface AccountService extends AriaResourceOperation<Account, Error> {}
