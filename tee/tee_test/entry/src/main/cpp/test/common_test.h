/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef __COMMON_TEST_H__
#define __COMMON_TEST_H__

#include <stdint.h>
#include <tee_client_type.h>

#ifdef __cplusplus
#include <string>
#endif

#define TEST_STR_LEN 256
#define STR_LEN 64
#define TEST_SIZE512 512
#define SIZE_16K ((16) * (1024))
// now not support 9999,so 9999 is invalid
#define TEEC_MEM_INVALID 9999
#define OFFSET100 100
#define OFFSET200 200
#define OFFSET300 300
#define SIZE10 10
#define SIZE20 20

// real path /data/app/el2/100/base/com.example.tee_test/haps/entry_test/files/534d4152-542d-4353-b919-d3016a171fc5.sec
#define TA_PATH "/data/storage/el2/base/haps/entry_test/files/534d4152-542d-4353-b919-d3016a171fc5.sec"

// real path /data/app/el2/100/base/com.example.tee_test/haps/entry_test/files/634d4152-542d-4353-b919-d3016a171fc5.sec
#define TA_PATH2 "/data/storage/el2/base/haps/entry_test/files/634d4152-542d-4353-b919-d3016a171fc5.sec"

#define CLIENTAPI_UUID_1                                                                                               \
    {                                                                                                                  \
        0x534d4152, 0x542d, 0x4353, { 0xb9, 0x19, 0xd3, 0x01, 0x6a, 0x17, 0x1f, 0xc5 }                                 \
    }

#define CLIENTAPI_UUID_2                                                                                               \
    {                                                                                                                  \
        0x634d4152, 0x542d, 0x4353, { 0xb9, 0x19, 0xd3, 0x01, 0x6a, 0x17, 0x1f, 0xc5 }                                 \
    }

#define UUID_TA_NOT_EXIST                                                                                              \
    {                                                                                                                  \
        0x534D4152, 0x542D, 0x4353, { 0x4C, 0x54, 0x2D, 0x54, 0x41, 0x2D, 0x53, 0x5B }                                 \
    }

typedef struct SessionContextPacket {
    TEEC_Context *context;
    TEEC_Session *session;
    TEEC_Operation *operation;
    TEEC_SharedMemory *sharedMem;
    uint32_t id;
    TEEC_Result ret;
} DatePacket;
#endif
