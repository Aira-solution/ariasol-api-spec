import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./lessee.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace AriaService.Room;

model Room {
    /**
     * id.
     * unique
     */
    @key
    id: integer;

    /**
     * 빌딩 id
     */
    buildingId: integer;

    /**
     * 방 이름 (ex. 101호)
     */
    name: string;

    /**
     * 층
     * 0일 수 없음. 지하 1층은 -1, 지하 2층은 -2, 지상 1층은 1, 지상 2층은 2
     */
    floor: integer;

    /**
     * 공급면적
     */
    areaSupply: decimal;

    /**
     * 전용면적
     */
    areaExclusive: decimal;

    /**
     * 임차인 정보. 없을 수도 있음.
     */
    lessee?: Lessee.Lessee;

    createdAt: string;
    updatedAt: string;
}
