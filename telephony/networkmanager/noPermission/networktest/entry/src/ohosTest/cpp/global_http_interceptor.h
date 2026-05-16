/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef HTTPREQUEST_GLOBAL_HTTP_INTERCEPTOR_H
#define HTTPREQUEST_GLOBAL_HTTP_INTERCEPTOR_H
#include <cstddef>
#include <cstdint>

#include "network/netstack/http_interceptor.h"

// Request interceptor group ID enumeration
typedef enum {
    REQUEST_GROUP0_MODIFY_URL = 0,
    REQUEST_GROUP1_MODIFY_METHOD = 1,
    REQUEST_GROUP2_MODIFY_BODY = 2,
    REQUEST_GROUP3_MODIFY_HEADERS = 3,
    REQUEST_GROUP4_MODIFY_ABORT = 4,
    REQUEST_GROUP10_READONLY_URL = 10,
    REQUEST_GROUP11_READONLY_METHOD = 11,
    REQUEST_GROUP12_READONLY_HEADERS = 12,
    REQUEST_GROUP13_READONLY_BODY = 13,
    REQUEST_GROUP14_READONLY_ABORT = 14
} RequestInterceptorGroupId;

// Response interceptor group ID enumeration
typedef enum {
    RESPONSE_GROUP0_MODIFY_BODY = 0,
    RESPONSE_GROUP1_MODIFY_RESPONSE_CODE = 1,
    RESPONSE_GROUP2_MODIFY_HEADERS = 2,
    RESPONSE_GROUP3_MODIFY_ABORT = 3,
    RESPONSE_GROUP10_READONLY_BODY = 10,
    RESPONSE_GROUP11_READONLY_RESPONSE_CODE = 11,
    RESPONSE_GROUP12_READONLY_HEADERS = 12,
    RESPONSE_GROUP13_READONLY_ABORT = 13
} ResponseInterceptorGroupId;

int32_t AddReadOnlyRequestInterceptor(int32_t groupId, int32_t enabled);
int32_t AddReadOnlyResponseInterceptor(int32_t groupId, int32_t enabled);
int32_t AddWritableRequestInterceptor(int32_t groupId, int32_t enabled);
int32_t AddWritableResponseInterceptor(int32_t groupId, int32_t enabled);
int32_t StopAllInterceptor(int32_t groupId);
int32_t StartAllInterceptor(int32_t groupId);
int32_t RemoveAllInterceptor(int32_t groupId);
int32_t RemoveRequestInterceptor(int32_t groupId);
int32_t RemoveResponseInterceptor(int32_t groupId);
#endif // HTTPREQUEST_GLOBAL_HTTP_INTERCEPTOR_H
