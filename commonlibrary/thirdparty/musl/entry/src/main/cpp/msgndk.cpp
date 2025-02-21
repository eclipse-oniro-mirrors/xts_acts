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
#include <cstring>
#include <js_native_api_types.h>
#include <sys/msg.h>


#define PARAM_1 1
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define PARAM_0 0
#define TEN 10
#define PARAM_3 3
#define PARAM_5 5
#define STATERROR (-100)
#define OPENERROR (-99)
#define MMAPERROR (-98)
#define TEST_SIZE 4096
#define FLAG 0666
static napi_value Msgget(napi_env env, napi_callback_info info)
{
    int msqid;
    msqid = msgget(IPC_PRIVATE, FLAG);
    int retVal = FAIL;
    if (msqid < PARAM_0) {
        retVal = FAIL;
    } else {
        retVal = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}

static napi_value Msgsnd(napi_env env, napi_callback_info info)
{
    int msqid;
    struct msgbuf buf;
    int sendlength;
    msqid = msgget(IPC_PRIVATE, FLAG);
    buf.mtype = PARAM_1;
    strcpy(buf.mtext, "AA");
    sendlength = sizeof(struct msgbuf) - sizeof(long);
    int ret = msgsnd(msqid, &buf, sendlength, PARAM_0);
    int retVal = FAIL;
    if (ret < PARAM_0) {
        retVal = FAIL;
    } else {
        retVal = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}
typedef struct {
    long mtype;
    char message[50];
} MSG_DATA;

static napi_value Msgrcv(napi_env env, napi_callback_info info)
{
    int msqid;
    msqid = msgget(IPC_PRIVATE, FLAG);
    MSG_DATA msginfo;
    bzero(&msginfo, sizeof(msginfo));
    int ret = msgrcv(msqid, &msginfo, sizeof(msginfo.message), PARAM_5, IPC_NOWAIT);
    int retVal = FAIL;
    if (ret == FAIL) {
        retVal = FAIL;
    } else {
        retVal = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}

static napi_value Msgctl(napi_env env, napi_callback_info info)
{
    int msqid;
    struct msqid_ds msgidInfo;
    struct msgbuf buf;
    int ret;
    int sendlength;
    msqid = msgget(IPC_PRIVATE, FLAG);

    buf.mtype = PARAM_1;
    strcpy(buf.mtext, "AS");
    sendlength = sizeof(struct msgbuf) - sizeof(long);
    ret = msgsnd(msqid, &buf, sendlength, PARAM_0);
    buf.mtype = PARAM_3;
    strcpy(buf.mtext, "SS");
    sendlength = sizeof(struct msgbuf) - sizeof(long);
    ret = msgsnd(msqid, &buf, sendlength, PARAM_0);
    ret = msgctl(msqid, IPC_STAT, &msgidInfo);
    int retVal = FAIL;
    if (ret < PARAM_0) {
        retVal = FAIL;
    } else {
        retVal = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"msgget", nullptr, Msgget, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"msgsnd", nullptr, Msgsnd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"msgrcv", nullptr, Msgrcv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"msgctl", nullptr, Msgctl, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "msgndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
