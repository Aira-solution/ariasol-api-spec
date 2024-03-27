import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./base.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;

namespace AriaService.Auth;

@minLength(8) // 최소 8자
scalar Password extends string;

@format("email")
scalar Email extends string;

model SignInInfo {
    @key email: Email;
    password: Password;
}

model SignUpInfo is SignInInfo {
    nickname: string;
}

model User is SignUpInfo;

@route("/api/member")
@tag("auth")
interface AuthService {
    @post
    @route("sign-up")
    @createsResource(User)
    signUp(...SignUpInfo): void | Error;

    @post
    @route("sign-in")
    signIn(...SignInInfo): void | Error;

    @get
    @route("exists")
    exists(@query memberEmail: Email): boolean | Error;

    @post
    @route("verify-email")
    verifyEmail(@path code: string): {
        @body
        body: {
            message: string;

            /**
             * @example "asdf"
             */
            token: string;
        };
    } | Error;
}
