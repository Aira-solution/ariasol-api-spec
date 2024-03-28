import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./base.tsp";
import "./account.tsp";
import "./vendor.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace AriaService.Building;

model Building {
    @key
    id: integer;

    name: string;

    /**
     * 건물 도로명 주소
     */
    address: string;

    /**
     * 건물 지번 주소
     */
    lotAddress: string;

    /**
     * 법정동 코드
     * 참조: https://www.code.go.kr/stdcode/regCodeL.do
     */
    @maxLength(10)
    bjdongCode: string;

    /**
     * 번
     */
    @maxLength(4)
    bonbun: string;

    /**
     * 지
     */
    @maxLength(4)
    bubun: string;

    /**
     * 주용도 코드
     * 참고: https://www.code.go.kr/stdcode/normalCodeL.do
     * doc 폴더에서도 확인 가능
     */
    @minLength(5)
    @maxLength(5)
    mainPurposeCode: string;

    /**
     * 주용도 코드명
     */
    mainPurposeName: string;

    /**
     * 허가일
     */
    permitAt: plainDate;

    /**
     * 사용승인일
     */
    useAt: plainDate;

    /**
     * 착공일
     */
    startAt: plainDate;

    createdAt: plainDate;
    updatedAt: plainDate;
    vendors: Vendor.Vendor[];

    /**
     * 빌딩에 대한 메모
     * @default ""
     */
    memo: string;

    /**
     * 관리비 계좌
     */
    feeAccount: Account.Account;

    /**
     * 관리비 입금일
     */
    feeDepositDay: plainDate;

    /**
     * 지상층수
     */
    floorCount: integer;

    /**
     * 지하층수
     */
    basementCount: integer;
}
