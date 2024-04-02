using TypeSpec.Http;
using TypeSpec.Rest;

@error
model Error {
    errorCode?: int32;
    message: string;
}

@error
model StatusError<T> extends Error {
    @statusCode
    code: T;
}

interface AriaResourceOperation<Entity, Error> {
    @useAuth(BearerAuth)
    @post
    create(...Entity): (Entity & CreatedResponse) | Error;
    @useAuth(BearerAuth)
    @get
    list(): Entity[] | Error;
    @useAuth(BearerAuth)
    @delete
    delete(@path id: integer): void | Error;
    @useAuth(BearerAuth)
    @put
    put(@path id: integer): Entity | Error;
}
