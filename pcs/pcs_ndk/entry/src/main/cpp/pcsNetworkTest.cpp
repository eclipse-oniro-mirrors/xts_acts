/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <arpa/inet.h>
#include <js_native_api_types.h>
#include <netinet/in.h>
#include <cstdlib>
#include <sys/socket.h>
#include <unistd.h>
#include <cstdio>
#include <cerrno>
#include <cstring>

#define PARAM_5 5
#define PARAM_6000 6000
#define PARAM_6002 6002
#define PARAM_6004 6004
#define PARAM_8000 8000

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define FAILD (-1)
#define SIZE_10 10
#define SIZE_100 100

static napi_value Socket(napi_env env, napi_callback_info info)
{
    int result = socket(AF_INET, SOCK_STREAM, PARAM_0);
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Bind(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int sockfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
    struct sockaddr_in server = {PARAM_0};
    server.sin_family = AF_INET;
    server.sin_port = htons(PARAM_8000);
    server.sin_addr.s_addr = inet_addr("127.0.0.1");
    int ret = bind(sockfd, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&server)), sizeof(server));
    close(sockfd);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Listen(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int sockfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
    struct sockaddr_in local = {PARAM_0};
    local.sin_family = AF_INET;
    local.sin_port = htons(PARAM_6000);
    local.sin_addr.s_addr = inet_addr("192.168.59.65");
    bind(sockfd, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&local)), sizeof(local));
    int ret = listen(sockfd, PARAM_5);
    close(sockfd);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Connect(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = PARAM_1;
    if (fork() == PARAM_0) {
        int sockfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
        if (sockfd >= PARAM_0) {
            struct sockaddr_in local = {PARAM_0};
            local.sin_family = AF_INET;
            local.sin_port = htons(PARAM_6002);
            local.sin_addr.s_addr = inet_addr("127.0.0.1");
            bind(sockfd, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&local)), sizeof(local));
            listen(sockfd, PARAM_5);
            struct sockaddr_in clnAddr = {PARAM_0};
            socklen_t clnAddrLen = sizeof(clnAddr);
            accept(sockfd, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&clnAddr)), &clnAddrLen);
        }
        close(sockfd);
        _exit(PARAM_0);
    } else {
        int sock = socket(AF_INET, SOCK_STREAM, PARAM_0);
        if (sock >= PARAM_0) {
            struct sockaddr_in server = {PARAM_0};
            server.sin_family = AF_INET;
            server.sin_port = htons(PARAM_6002);
            server.sin_addr.s_addr = inet_addr("127.0.0.1");
            while (ret) {
                ret = connect(sock, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&server)),
                              sizeof(server));
            }
        }
        close(sock);
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Send(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = PARAM_1;
    if (fork() == PARAM_0) {
        int sockfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
        if (sockfd >= PARAM_0) {
            struct sockaddr_in local = {PARAM_0};
            local.sin_family = AF_INET;
            local.sin_port = htons(PARAM_6004);
            local.sin_addr.s_addr = inet_addr("127.0.0.1");
            bind(sockfd, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&local)), sizeof(local));
            listen(sockfd, PARAM_5);
            struct sockaddr_in clnAddr = {PARAM_0};
            socklen_t clnAddrLen = sizeof(clnAddr);
            accept(sockfd, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&clnAddr)), &clnAddrLen);
        }
        close(sockfd);
        _exit(PARAM_0);
    } else {
        int sock = socket(AF_INET, SOCK_STREAM, PARAM_0);
        if (sock >= PARAM_0) {
            struct sockaddr_in server = {PARAM_0};
            server.sin_family = AF_INET;
            server.sin_port = htons(PARAM_6004);
            server.sin_addr.s_addr = inet_addr("127.0.0.1");
            int conn = PARAM_1;
            while (conn) {
                conn = connect(sock, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&server)),
                               sizeof(server));
            }
            char sendBuf[] = "x";
            ret = send(sock, sendBuf, sizeof(sendBuf), PARAM_0);
        }
        close(sock);
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Recv(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param = PARAM_0;
    napi_get_value_int32(env, args[0], &param);

    int resultValue = FAILD;
    if (param == PARAM_UNNORMAL) {
        size_t dataLen = atoi("11");
        char buf[SIZE_10];
        resultValue = recv(PARAM_0, buf, dataLen, PARAM_0);
    } else {
        char buf[SIZE_100];
        int sockets[PARAM_2];
        socketpair(AF_UNIX, SOCK_STREAM, PARAM_0, sockets);
        send(sockets[PARAM_1], "x", PARAM_1, PARAM_0);
        resultValue = recv(sockets[PARAM_0], buf, sizeof buf, PARAM_0);
    }

    napi_value result = nullptr;

    napi_create_int32(env, resultValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"Socket", nullptr, Socket, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Listen", nullptr, Listen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Bind", nullptr, Bind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Connect", nullptr, Connect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Send", nullptr, Send, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Recv", nullptr, Recv, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "pcsNetworkTest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
