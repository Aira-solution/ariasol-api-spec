import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace AriaService.RoomMetering;

model CreateRoomMeteringRequest {
    /*
    * 방 ID
    */
    roomId: integer;

    /*
    * 계량 값
    */
    metering: integer;
}

model UpdateRoomMeteringRequest {
    /*
    * 요청의 고유 식별자
    */
    id: integer;

    /*
    * 계량 값
    */
    metering: integer;
}

model UpdateRoomMeteringGroupRequest {
    /*
    * 계량 날짜
    */
    meteringAt: string | null;

    /*
    * 계량 유형
    */
    meteringType: string | null;
}

model RoomMeteringResponses {
    /*
    * 응답의 고유 식별자
    */
    id: integer;

    /*
    * 계량이 이루어진 건물 ID
    */
    buildingId: integer;

    /*
    * 계량 날짜
    */
    meteringAt: string;

    /*
    * 계량 유형
    */
    type: string;

    /*
    * 각 방의 계량 목록
    */
    roomMeterings: RoomMeteringResponse[];
}

model RoomMeteringResponse {
    /*
    * 방 ID
    */
    roomId: integer;

    /*
    * 계량 ID
    */
    meteringId: integer;

    /*
    * 계량 값
    */
    metering: integer;
}

model RoomMeteringGroupResponse {
    /*
    * 계량 그룹의 고유 식별자
    */
    id: integer;

    /*
    * 건물 ID
    */
    buildingId: integer;

    /*
    * 계량 날짜
    */
    meteringAt: string;

    /*
    * 계량 유형
    */
    type: string;
}

model RoomMeteringSummaryResponses {
    /*
    * 그룹 ID별 계량 요약 목록
    * Record - key = 그룹 ID
    */
    response: Record<RoomMeteringSummaryResponse[]>;
}

model RoomMeteringSummaryResponse {
    /*
    * 방 ID
    */
    roomId: integer;

    /*
    * 방 이름
    */
    roomName: string;

    /*
    * 계량 그룹 ID, 선택 사항
    */
    meteringGroupId: integer | null;

    /*
    * 방 계량 ID, 선택 사항
    */
    roomMeteringId: integer | null;

    /*
    * 계량 값, 선택 사항
    */
    metering: integer | null;

    /*
    * 계량 유형, 선택 사항
    */
    meteringType: string | null;

    /*
    * 계량 날짜, 선택 사항
    */
    meteringAt: string | null;
}

@route("/api/building/{buildingId}/roomMeteringGroup")
@tag("room-metering-group")
interface RoomMeteringGroupService {
    @useAuth(BearerAuth)
    @get
    findRoomMeteringGroups(@path buildingId: integer) : (RoomMeteringGroupResponse[]) | Error;

    @useAuth(BearerAuth)
    @patch
    @route("/{meteringGroupId}")
    updateRoomMeteringGroup(@path buildingId: integer, @path meteringGroupId: integer, ...UpdateRoomMeteringGroupRequest) : void | Error;

    @useAuth(BearerAuth)
    @post
    @route("/{meteringAt}/{meteringType}")
    saveRoomMeterings(@path buildingId: integer, @path meteringAt: string, @path meteringType: string, @body reqeust: CreateRoomMeteringRequest[]) : (RoomMeteringResponses) | Error;

    @useAuth(BearerAuth)
    @get
    @route("/roomMetering")
    findRoomMeteringSummary(@path buildingId: integer, @query({format:"multi"}) roomMeteringGroupIds: integer[]) : (RoomMeteringSummaryResponses) | Error;

    @useAuth(BearerAuth)
    @patch
    @route("/{meteringGroupId}/roomMetering")
    updateRoomMeterings(@path buildingId: integer, @path meteringGroupId: integer, @body request: UpdateRoomMeteringRequest[]) : void | Error;
}