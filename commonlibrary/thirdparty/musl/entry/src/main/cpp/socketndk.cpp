/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <cstdlib>
#include <cstring>
#include <js_native_api_types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/un.h>
#include <unistd.h>

#define PARAM_5 5
#define ONEVAL 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define TWOVAL 2
#define FIVEVAL 5
#define VALUE9898 9898
#define VALUE1234 1234
#define PARAM_6000 6000
#define PARAM_8000 8000

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_1024 1024
#define SIZE_4096 4096
#define SIZE_8192 8192
#define PORT_E 8000
#define PORT_X 6000

#define MY_SOCK_PATH "/data/storage/el2/base/files"

static napi_value Socket(napi_env env, napi_callback_info info)
{
    int result = socket(AF_INET, SOCK_STREAM, PARAM_0);
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Socketpair(napi_env env, napi_callback_info info)
{
    int fb[2];
    int result = socketpair(AF_INET, SOCK_STREAM, PARAM_0, fb);
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}
static napi_value Sendmsg(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct msghdr msg = {PARAM_0};
    struct sockaddr_in addr = {PARAM_0};
    int sockfd = socket(AF_INET, SOCK_DGRAM, PARAM_0);
    if (sockfd == MINUSONE) {
        napi_create_int32(env, sockfd, &result);
    }
    if (connect(sockfd, (struct sockaddr *)&addr, sizeof(addr)) == MINUSONE) {
        napi_create_int32(env, MINUSTWO, &result);
    }
    int retval = sendmsg(sockfd, &msg, PARAM_0);
    if (retval == MINUSONE) {
        napi_create_int32(env, TWOVAL, &result);
    }
    return result;
}

static napi_value Send(napi_env env, napi_callback_info info)
{
    struct sockaddr_in addr = {PARAM_0};
    int sockfd = socket(AF_INET, SOCK_DGRAM, PARAM_0);
    int sign = connect(sockfd, (struct sockaddr *)&addr, sizeof(addr));
    char sendBuf[] = "x";
    int sendRet = send(sockfd, sendBuf, sizeof(sendBuf), PARAM_0);
    napi_value result = nullptr;
    if (sockfd == MINUSONE) {
        napi_create_int32(env, PARAM_0, &result);
    }
    if (sign == MINUSONE) {
        napi_create_double(env, MINUSTWO, &result);
    } else {
        napi_create_double(env, sendRet, &result);
    }
    return result;
}

static napi_value Sendto(napi_env env, napi_callback_info info)
{
    struct sockaddr_in addr = {PARAM_0};
    int sockfd = socket(AF_INET, SOCK_DGRAM, PARAM_0);
    int sign = connect(sockfd, (struct sockaddr *)&addr, sizeof(addr));
    char sendBuf[] = "it is a test";
    int sendRet = sendto(sockfd, sendBuf, sizeof(sendBuf), PARAM_0, nullptr, PARAM_0);
    napi_value result = nullptr;
    if (sockfd == MINUSONE) {
        napi_create_int32(env, PARAM_0, &result);
    }
    if (sign == MINUSONE) {
        napi_create_double(env, MINUSTWO, &result);
    } else {
        napi_create_double(env, sendRet, &result);
    }
    return result;
}

static napi_value Sendmmsg(napi_env env, napi_callback_info info)
{
    int sockfd = PARAM_0;
    struct sockaddr_in addr = {PARAM_0};
    struct mmsghdr msg[2];
    int retval = PARAM_0;
    sockfd = socket(AF_INET, SOCK_DGRAM, PARAM_0);
    napi_value result = nullptr;
    if (sockfd == MINUSONE) {
        napi_create_int32(env, sockfd, &result);
    }
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    addr.sin_port = htons(VALUE1234);
    if (connect(sockfd, (struct sockaddr *)&addr, sizeof(addr)) == MINUSONE) {
        napi_create_int32(env, MINUSONE, &result);
    }
    retval = sendmmsg(sockfd, msg, TWOVAL, PARAM_0);
    napi_create_int32(env, retval, &result);
    return result;
}

static napi_value Setsockopt(napi_env env, napi_callback_info info)
{
    int sfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
    int reuse = ONEVAL;
    napi_value result = nullptr;
    int setval = setsockopt(sfd, SOL_SOCKET, SO_REUSEADDR, &reuse, sizeof(reuse));
    napi_create_int32(env, setval, &result);
    return result;
}

static napi_value Shutdown(napi_env env, napi_callback_info info)
{
    int sd = socket(AF_INET, SOCK_STREAM, PARAM_0);
    struct sockaddr_in server_addr = {PARAM_0};
    bzero(&server_addr, sizeof(server_addr));
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(VALUE9898);
    server_addr.sin_family = AF_INET;
    bind(sd, (struct sockaddr *)(&server_addr), sizeof(server_addr));
    listen(sd, FIVEVAL);
    napi_value result = nullptr;
    int shuval = shutdown(sd, PARAM_0);
    napi_create_int32(env, shuval, &result);
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
        size_t data_len = atoi("11");
        char buf[SIZE_10];
        resultValue = recv(PARAM_0, buf, data_len, PARAM_0);
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

static napi_value Recvfrom(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param = PARAM_0;
    napi_get_value_int32(env, args[0], &param);

    int resultValue = FAILD;
    if (param == PARAM_UNNORMAL) {
        size_t data_len = atoi("11");
        char buf[SIZE_10];
        resultValue = recvfrom(PARAM_0, buf, data_len, PARAM_0, nullptr, nullptr);
    }

    napi_value result = nullptr;

    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Recvmsg(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param = PARAM_0;
    napi_get_value_int32(env, args[0], &param);

    int resultValue = FAILD;
    if (param == PARAM_UNNORMAL) {
        struct msghdr msgRev = {PARAM_0};
        resultValue = recvmsg(PARAM_0, &msgRev, PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Recvmmsg(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param = PARAM_0;
    napi_get_value_int32(env, args[0], &param);

    int resultValue = FAILD;
    if (param == PARAM_UNNORMAL) {
        struct mmsghdr msg[SIZE_10];
        resultValue = recvmmsg(PARAM_0, msg, SIZE_10, PARAM_0, PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Connect(napi_env env, napi_callback_info info)
{
    int sockfd = socket(PARAM_1, PARAM_1, PARAM_1);
    struct sockaddr_in serv_addr = {PARAM_0};
    socklen_t addrlen = sizeof(serv_addr);
    int backResult = connect(sockfd, (struct sockaddr *)(&serv_addr), addrlen);
    napi_value result = nullptr;
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value Bind(napi_env env, napi_callback_info info)
{
    int sfd = PARAM_0;
    struct sockaddr_un myAddr = {PARAM_0};
    sfd = socket(AF_UNIX, SOCK_STREAM, PARAM_0);
    memset(&myAddr, PARAM_0, sizeof(struct sockaddr_un));
    myAddr.sun_family = AF_UNIX;
    strncpy(myAddr.sun_path, MY_SOCK_PATH, sizeof(myAddr.sun_path) - PARAM_1);
    int ret = bind(sfd, (struct sockaddr *)&myAddr, sizeof(struct sockaddr_un));
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Listen(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (fork() == PARAM_0) {
        int sock = socket(AF_INET, SOCK_STREAM, PARAM_0);
        struct sockaddr_in server = {PARAM_0};
        server.sin_family = AF_INET;
        server.sin_port = htons(PARAM_6000);
        server.sin_addr.s_addr = inet_addr("192.168.59.65");
        int ret = PARAM_1;
        while (ret) {
            ret = connect(sock, (struct sockaddr *)&server, sizeof(server));
        }
        close(sock);
        _exit(PARAM_0);
    } else {
        int sockfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
        struct sockaddr_in local = {PARAM_0};
        local.sin_family = AF_INET;
        local.sin_port = htons(PARAM_6000);
        local.sin_addr.s_addr = inet_addr("192.168.59.65");
        bind(sockfd, (struct sockaddr *)&local, sizeof(local));
        int ret = listen(sockfd, PARAM_5);
        close(sockfd);
        napi_create_int32(env, ret, &result);
        return result;
    }
}
static napi_value Getpeername(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (fork() == PARAM_0) {
        int sock = socket(AF_INET, SOCK_STREAM, PARAM_0);
        struct sockaddr_in server = {PARAM_0};
        server.sin_family = AF_INET;
        server.sin_port = htons(PARAM_8000);
        server.sin_addr.s_addr = inet_addr("192.168.59.65");
        int ret = PARAM_1;
        while (ret) {
            ret = connect(sock, (struct sockaddr *)&server, sizeof(server));
        }
        close(sock);
        _exit(PARAM_0);

    } else {
        int sockfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
        struct sockaddr_in local = {PARAM_0};
        local.sin_family = AF_INET;
        local.sin_port = htons(PARAM_8000);
        local.sin_addr.s_addr = inet_addr("192.168.59.65");
        bind(sockfd, (struct sockaddr *)&local, sizeof(local));
        listen(sockfd, PARAM_5);
        struct sockaddr_in clnAddr = {PARAM_0};
        socklen_t clnAddrLen = sizeof(clnAddr);
        int sClient = accept(sockfd, (struct sockaddr *)&clnAddr, &clnAddrLen);
        struct sockaddr addr = {PARAM_0};
        socklen_t addrLen = sizeof(addr);
        int ret = getpeername(sClient, &addr, &addrLen);
        close(sockfd);
        napi_create_int32(env, ret, &result);
        return result;
    }
}

static napi_value Getsockname(napi_env env, napi_callback_info info)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
    struct sockaddr_in local = {PARAM_0};
    struct sockaddr sa = {PARAM_0};
    int len = sizeof(struct sockaddr_in);
    local.sin_family = AF_INET;
    local.sin_port = htons(PARAM_8000);
    local.sin_addr.s_addr = inet_addr("192.168.59.65");
    bind(sockfd, (struct sockaddr *)&local, sizeof(local));
    socklen_t *addrlen = (socklen_t *)&len;
    int ret = getsockname(sockfd, &sa, addrlen);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Getsockopt(napi_env env, napi_callback_info info)
{
    int optval = PARAM_0;
    int optlen = PARAM_0;
    int sockfd = socket(AF_INET, SOCK_STREAM, PARAM_0);
    int ret = getsockopt(sockfd, SOL_SOCKET, SO_DEBUG, &optval, (socklen_t *)(&optlen));
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"socket", nullptr, Socket, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"socketpair", nullptr, Socketpair, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sendmsg", nullptr, Sendmsg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sendmmsg", nullptr, Sendmmsg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sendto", nullptr, Sendto, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"send", nullptr, Send, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setsockopt", nullptr, Setsockopt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"shutdown", nullptr, Shutdown, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"recv", nullptr, Recv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"recvfrom", nullptr, Recvfrom, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"recvmsg", nullptr, Recvmsg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"recvmmsg", nullptr, Recvmmsg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"bind", nullptr, Bind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"connect", nullptr, Connect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"listen", nullptr, Listen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getpeername", nullptr, Getpeername, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getsockname", nullptr, Getsockname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getsockopt", nullptr, Getsockopt, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "socket",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
