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

#include "KernelEnhanceKitTest.h"
#include <malloc.h>
#include <cstdio>
#include <cstdlib>
#include <qos/qos.h>

void addKernelEnhanceKitTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"cstandardLibrary_calloc", nullptr,
        CstandardLibrary_calloc, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_realloc", nullptr,
        CstandardLibrary_realloc, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_valloc", nullptr,
        CstandardLibrary_valloc, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_memalign", nullptr,
        CstandardLibrary_memalign, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo", nullptr,
        CstandardLibrary_mallinfo, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2", nullptr,
        CstandardLibrary_mallinfo2, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_malloc_check_from_ptr", nullptr,
        CstandardLibrary_malloc_check_from_ptr, nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value CstandardLibrary_calloc(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool res = true;
    size_t size = 10;
    void *pr = calloc(size, size);
    if (pr == nullptr) {
        res = false;
    } else {
        free(pr);
    }
    napi_create_int32(env, res, &result);
    return result;
}

napi_value CstandardLibrary_realloc(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    void *pr = malloc(size);
    if (pr == nullptr) {
        napi_create_int32(env, false, &result);
        return result;
    }

    bool res = true;
    void *pr2 = realloc(pr, size);
    if (pr2 == nullptr) {
        free(pr);
        res = false;
    } else {
        free(pr2);
    }

    napi_create_int32(env, res, &result);
    return result;
}

napi_value CstandardLibrary_valloc(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    bool res = true;
    void *pr = valloc (size);
    if (pr == nullptr) {
        res = false;
    } else {
        free(pr);
    }
    napi_create_int32(env, res, &result);
    return result;
}

napi_value CstandardLibrary_memalign(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    bool res = true;
    void *pr = memalign(size, size);
    if (pr == nullptr) {
        res = false;
    } else {
        free(pr);
    }
    napi_create_int32(env, res, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 mi2 = mallinfo2();
    bool b2 = mi2.arena >= 0 || mi2.ordblks >= 0 || mi2.smblks >= 0 || mi2.hblks >= 0 || mi2.hblkhd >= 0 ||
              mi2.usmblks >= 0 || mi2.fsmblks >= 0 || mi2.uordblks >= 0 || mi2.fordblks >= 0 || mi2.keepcost >= 0;

    struct mallinfo mi1 = mallinfo();
    bool b1 = mi1.arena >= 0 || mi1.ordblks >= 0 || mi1.smblks >= 0 || mi1.hblks >= 0 || mi1.hblkhd >= 0 ||
              mi1.usmblks >= 0 || mi1.fsmblks >= 0 || mi1.uordblks >= 0 || mi1.fordblks >= 0 || mi1.keepcost >= 0;

    napi_create_int32(env, b1 && b2, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 mi2 = mallinfo2();
    bool b2 = mi2.arena >= 0 || mi2.ordblks >= 0 || mi2.smblks >= 0 || mi2.hblks >= 0 || mi2.hblkhd >= 0 ||
              mi2.usmblks >= 0 || mi2.fsmblks >= 0 || mi2.uordblks >= 0 || mi2.fordblks >= 0 || mi2.keepcost >= 0;
    
    napi_create_int32(env, b2, &result);
    return result;
}

napi_value CstandardLibrary_malloc_check_from_ptr(napi_env env, napi_callback_info info)
{
    napi_value result;
    int retValue = 0;
    size_t size = 10;
    void *ptr = nullptr;
    int res = malloc_check_from_ptr(ptr);
    if (res == 0 || res == -1) {
        retValue += 1;
    } else if (res == 1) {
        retValue += 0;
    } else {
        perror("malloc_check_from_ptr failed");
        return nullptr;
    }

    ptr = malloc(size);
    if (ptr == nullptr) {
        perror("malloc failed");
        return nullptr;
    }
    res = malloc_check_from_ptr(ptr);
    if (res == 1 || res == -1) {
        retValue += 1;
    } else if (res == 0) {
        retValue += 0;
    } else {
        perror("malloc_check_from_ptr failed");
        return nullptr;
    }

    char* src = "test";
    res = malloc_check_from_ptr(src);
    if (res == 0 || res == -1) {
        retValue += 1;
    } else if (res == 1) {
        retValue += 0;
    } else {
        printf("heap string is %s\n", src);
        perror("malloc_check_from_ptr failed");
        return nullptr;
    }

    napi_create_int32(env, retValue, &result);
    return result;
}
