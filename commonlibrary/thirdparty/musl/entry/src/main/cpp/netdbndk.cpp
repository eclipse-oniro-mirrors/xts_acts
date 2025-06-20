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
#include <cerrno>
#include <cstring>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <netdb.h>
#include <sys/inotify.h>
#include <uv.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_8192 8192
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
#define ONEVAL 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define MINUSTHR (-3)
#define MAX_NAMBER 1024
#define PARAM_4 4
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define TRUE 1
#define LENGTH 64
#define EIGHTY 80
#define BUFLEN 256
#define FLAG 127

static napi_value GetProtoEnt(napi_env env, napi_callback_info info)
{
    struct protoent *getInfo = nullptr;
    getInfo = getprotoent();
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetProtoByName(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = LENGTH, strResult = PARAM_0;
    char proto_name[LENGTH] = {0};

    napi_get_value_string_utf8(env, args[0], proto_name, length, &strResult);
    struct protoent *getInfo = nullptr;
    getInfo = getprotobyname(proto_name);
    napi_value result = nullptr;
    if (getInfo != nullptr) {
        napi_create_string_utf8(env, getInfo->p_name, NAPI_AUTO_LENGTH, &result);
    } else {
        napi_create_string_utf8(env, "null", NAPI_AUTO_LENGTH, &result);
    }
    return result;
}
static napi_value Hstrerror(napi_env env, napi_callback_info info)
{
    const char *ret = hstrerror(PARAM_1);
    napi_value result;
    if (strcmp(ret, "Unknown error nnn")) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value Herror(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    herror("herror");
    napi_value result;
    if (errno == ERRON_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value GetProtoByNumber(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero = PARAM_0;
    napi_get_value_int32(env, args[0], &valueZero);
    struct protoent *getInfo = nullptr;
    getInfo = getprotobynumber(valueZero);
    napi_value result = nullptr;
    if (getInfo != nullptr) {
        napi_create_string_utf8(env, getInfo->p_name, NAPI_AUTO_LENGTH, &result);
    } else {
        napi_create_string_utf8(env, "null", NAPI_AUTO_LENGTH, &result);
    }
    return result;
}
static napi_value GetNameInfo(napi_env env, napi_callback_info info)
{
    char hostname[128] = {PARAM_0};
    char serverName[128] = {PARAM_0};
    sockaddr_in addR_dst = {PARAM_0};
    memset(&addR_dst, PARAM_0, sizeof(addR_dst));
    addR_dst.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &addR_dst.sin_addr.s_addr);
    int getInfo = getnameinfo((sockaddr *)&addR_dst, sizeof(addR_dst), hostname, sizeof(hostname), serverName,
                              sizeof(serverName), PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetHostEnt(napi_env env, napi_callback_info info)
{
    hostent *getInfo = nullptr;
    sethostent(TRUE);
    getInfo = gethostent();
    int ret = FAIL;
    if (getInfo == nullptr) {
        ret = SUCCESS;
    }
    endhostent();
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetServEnt(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    setservent(TRUE);
    int ret = FAIL;
    getservent();
    if (errno == NO_ERR) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetNetEnt(napi_env env, napi_callback_info info)
{
    netent *getInfo = nullptr;
    getInfo = getnetent();
    int ret = FAIL;
    if (getInfo == nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetNetByAddr(napi_env env, napi_callback_info info)
{
    netent *getInfo = nullptr;
    errno = NO_ERR;
    getInfo = getnetbyaddr(FLAG, AF_INET);
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetNetByName(napi_env env, napi_callback_info info)
{
    netent *getInfo = nullptr;
    errno = NO_ERR;
    getInfo = getnetbyname("loopback");
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetServByName(napi_env env, napi_callback_info info)
{
    servent *getInfo = nullptr;
    errno = NO_ERR;
    getInfo = getservbyname("http", "tcp");
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetServByPort(napi_env env, napi_callback_info info)
{
    servent *getInfo = nullptr;
    errno = NO_ERR;
    getInfo = getservbyport(htons(EIGHTY), "tcp");
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetHostByName(napi_env env, napi_callback_info info)
{
    hostent *getInfo = nullptr;
    errno = NO_ERR;
    getInfo = gethostbyname("127.0.0.1");
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetHostByAddr(napi_env env, napi_callback_info info)
{
    hostent *getInfo = nullptr;
    errno = NO_ERR;
    const char *add = "127.0.0.1";
    in_addr addr = {PARAM_0};
    inet_pton(AF_INET, add, &addr);
    getInfo = gethostbyaddr((const char *)&addr, sizeof(addr), AF_INET);
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetHostByNameR(napi_env env, napi_callback_info info)
{
    int getInfo;
    errno = NO_ERR;
    char buf[1024] = "\0";
    hostent hostInfo;
    hostent *pHost = nullptr;
    int type;
    getInfo = gethostbyname_r("127.0.0.1", &hostInfo, buf, sizeof(buf), &pHost, &type);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetHostByAddrR(napi_env env, napi_callback_info info)
{
    int getInfo;
    errno = NO_ERR;
    in_addr_t address = inet_addr("127.0.0.1");
    hostent hostBuf;
    hostent *hostResult = nullptr;
    char buffer[2048];
    int errNum = PARAM_0;
    getInfo = gethostbyaddr_r(&address, PARAM_4, AF_INET, &hostBuf, buffer, sizeof(buffer), &hostResult, &errNum);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetHostByName2(napi_env env, napi_callback_info info)
{
    hostent *getInfo = nullptr;
    errno = NO_ERR;
    getInfo = gethostbyname2("127.0.0.1", AF_INET);
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetHostByName2R(napi_env env, napi_callback_info info)
{
    int getInfo;
    errno = NO_ERR;
    int err;
    int buf_len = PARAM_8192;
    hostent hBuf;
    hostent *ret = nullptr;
    char buf[buf_len];
    memset(buf, PARAM_0, buf_len);
    getInfo = gethostbyname2_r("127.0.0.1", AF_INET, &hBuf, buf, buf_len, &ret, &err);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value Sethostent(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    sethostent(ONEVAL);
    gethostent();
    endhostent();
    napi_value result;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Setnetent(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    const char *netname = nullptr;
    napi_value result = nullptr;
    netent *ne = nullptr;
    setnetent(ONEVAL);
    while (ONEVAL) {
        ne = getnetent();
        if (!ne)
            break;
        if (strcmp(ne->n_name, netname) == PARAM_0) {
            setnetent(PARAM_0);
            endnetent();
            napi_create_int32(env, ONEVAL, &result);
            return result;
        }
    }
    setnetent(PARAM_0);
    endnetent();
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Setprotoent(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    endprotoent();
    napi_value result = nullptr;
    protoent *getval = getprotoent();
    if (getval == nullptr) {
        napi_create_int32(env, MINUSONE, &result);
    }
    char buf[MAX_NAMBER] = {PARAM_0};
    strcpy(buf, getval->p_name);
    setprotoent(PARAM_0);
    getval = getprotoent();
    if (getval == nullptr) {
        napi_create_int32(env, MINUSTWO, &result);
    }
    if (strcmp(getval->p_name, buf)) {
        napi_create_int32(env, MINUSTHR, &result);
    } else {
        napi_create_int32(env, errno, &result);
    }
    return result;
}

static napi_value Setservent(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    char **p = nullptr;
    struct servent *serv = nullptr;
    napi_value result;
    setservent(ONEVAL);
    while ((serv = getservent()) != nullptr) {
        for (p = serv->s_aliases; *p != nullptr; p++)
            ;
    }
    endservent();
    if (errno == PARAM_0) {
        napi_create_int32(env, errno, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static napi_value EndServEnt(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    endservent();
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value EndProToEnt(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    endprotoent();
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value EndNetEnt(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    endnetent();
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value EndHostEnt(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    endhostent();
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

napi_value GaiStrerror(napi_env env, napi_callback_info info)
{
    const char *value = gai_strerror(EAI_BADFLAGS);
    int ret = FAIL;
    if (value != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value Freeaddrinfo(napi_env env, napi_callback_info info)
{
    struct addrinfo *ai, hint;
    hint.ai_flags = AI_PASSIVE;
    hint.ai_family = AF_UNSPEC;
    getaddrinfo("127.0.0.1", nullptr, &hint, &ai);
    errno = NO_ERR;
    try{
        freeaddrinfo(ai);
    }
    catch(...)
    {
        errno = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

napi_value Getaddrinfo(napi_env env, napi_callback_info info)
{
    struct addrinfo hint, *ai;
    hint.ai_flags = AI_PASSIVE;
    hint.ai_family = AF_UNSPEC;
    int ret = getaddrinfo("127.0.0.1", nullptr, &hint, &ai);
    freeaddrinfo(ai);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"hstrerror", nullptr, Hstrerror, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"herror", nullptr, Herror, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getProtoEnt", nullptr, GetProtoEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getProtoByName", nullptr, GetProtoByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getProtoByNumber", nullptr, GetProtoByNumber, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNameInfo", nullptr, GetNameInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostEnt", nullptr, GetHostEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getServEnt", nullptr, GetServEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNetEnt", nullptr, GetNetEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNetByAddr", nullptr, GetNetByAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNetByName", nullptr, GetNetByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getServByName", nullptr, GetServByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getServByPort", nullptr, GetServByPort, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByName", nullptr, GetHostByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByAddr", nullptr, GetHostByAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByNameR", nullptr, GetHostByNameR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByAddrR", nullptr, GetHostByAddrR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByName2", nullptr, GetHostByName2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByName2R", nullptr, GetHostByName2R, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sethostent", nullptr, Sethostent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setnetent", nullptr, Setnetent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setprotoent", nullptr, Setprotoent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setservent", nullptr, Setservent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endservent", nullptr, EndServEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endprotoent", nullptr, EndProToEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endnetent", nullptr, EndNetEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endhostent", nullptr, EndHostEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gaiStrerror", nullptr, GaiStrerror, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"freeaddrinfo", nullptr, Freeaddrinfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfo", nullptr, Getaddrinfo, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "netdb",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
