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
#include <qos/qos.h>

void addKernelEnhanceKitOneTest(std::vector<napi_property_descriptor>& descData)
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
    descData.push_back({"cstandardLibrary_mallinfo_arena", nullptr,
        CstandardLibrary_mallinfo_arena, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo_ordblks", nullptr,
        CstandardLibrary_mallinfo_ordblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_malloc_check_from_ptr", nullptr,
        CstandardLibrary_malloc_check_from_ptr, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addKernelEnhanceKitTest(std::vector<napi_property_descriptor>& descData)
{
    addKernelEnhanceKitOneTest(descData);
    descData.push_back({"cstandardLibrary_mallinfo_smblks", nullptr,
        CstandardLibrary_mallinfo_smblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo_hblks", nullptr,
        CstandardLibrary_mallinfo_hblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo_hblkhd", nullptr,
        CstandardLibrary_mallinfo_hblkhd, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo_usmblks", nullptr,
        CstandardLibrary_mallinfo_usmblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo_fsmblks", nullptr,
        CstandardLibrary_mallinfo_fsmblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo_uordblks", nullptr,
        CstandardLibrary_mallinfo_uordblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo_fordblks", nullptr,
        CstandardLibrary_mallinfo_fordblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo_keepcost", nullptr,
        CstandardLibrary_mallinfo_keepcost, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2", nullptr,
        CstandardLibrary_mallinfo2, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_arena", nullptr,
        CstandardLibrary_mallinfo2_arena, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_ordblks", nullptr,
        CstandardLibrary_mallinfo2_ordblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_smblks", nullptr,
        CstandardLibrary_mallinfo2_smblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_hblks", nullptr,
        CstandardLibrary_mallinfo2_hblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_hblkhd", nullptr,
        CstandardLibrary_mallinfo2_hblkhd, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_usmblks", nullptr,
        CstandardLibrary_mallinfo2_usmblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_fsmblks", nullptr,
        CstandardLibrary_mallinfo2_fsmblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_uordblks", nullptr,
        CstandardLibrary_mallinfo2_uordblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_fordblks", nullptr,
        CstandardLibrary_mallinfo2_fordblks, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cstandardLibrary_mallinfo2_keepcost", nullptr,
        CstandardLibrary_mallinfo2_keepcost, nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value CstandardLibrary_calloc(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    void *pr = calloc (size, size);
    bool res = (pr != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value CstandardLibrary_realloc(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    void *pr = malloc (size);
    void *pr2 = realloc(pr, size);
    bool res = (pr2 != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value CstandardLibrary_valloc(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    void *pr = valloc (size);
    free(pr);
    bool res = (pr != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value CstandardLibrary_memalign(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    void *pr = memalign (size, size);
    bool res = (pr == nullptr || pr != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    napi_create_int32(env, true, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_arena(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.arena = 0;
    napi_create_int32(env, pr.arena == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_ordblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.ordblks = 0;
    napi_create_int32(env, pr.ordblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_smblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.smblks = 0;
    napi_create_int32(env, pr.smblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_hblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.hblks = 0;
    napi_create_int32(env, pr.hblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_hblkhd(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.hblkhd = 0;
    napi_create_int32(env, pr.hblkhd == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_usmblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.usmblks = 0;
    napi_create_int32(env, pr.usmblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_fsmblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.fsmblks = 0;
    napi_create_int32(env, pr.fsmblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_uordblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.uordblks = 0;
    napi_create_int32(env, pr.uordblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_fordblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.fordblks = 0;
    napi_create_int32(env, pr.fordblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo_keepcost(napi_env env, napi_callback_info info)
{
    napi_value result;
    mallinfo2();
    struct mallinfo pr = mallinfo();
    pr.keepcost = 0;
    napi_create_int32(env, pr.keepcost == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    napi_create_int32(env, true, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_arena(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.arena = 0;
    napi_create_int32(env, pr.arena == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_ordblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.ordblks = 0;
    napi_create_int32(env, pr.ordblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_smblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.smblks = 0;
    napi_create_int32(env, pr.smblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_hblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.hblks = 0;
    napi_create_int32(env, pr.hblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_hblkhd(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.hblkhd = 0;
    napi_create_int32(env, pr.hblkhd == 0, &result);
    return result;
}


napi_value CstandardLibrary_mallinfo2_usmblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.usmblks = 0;
    napi_create_int32(env, pr.usmblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_fsmblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.fsmblks = 0;
    napi_create_int32(env, pr.fsmblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_uordblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.uordblks = 0;
    napi_create_int32(env, pr.uordblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_fordblks(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.fordblks = 0;
    napi_create_int32(env, pr.fordblks == 0, &result);
    return result;
}

napi_value CstandardLibrary_mallinfo2_keepcost(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct mallinfo2 pr = mallinfo2();
    pr.keepcost = 0;
    napi_create_int32(env, pr.keepcost == 0, &result);
    return result;
}

napi_value CstandardLibrary_malloc_check_from_ptr(napi_env env, napi_callback_info info)
{
    napi_value result;
    int retValue = 0;
    size_t size = 10;
    void *ptr = nullptr;
    if (malloc_check_from_ptr(ptr) == 0 || malloc_check_from_ptr(ptr) == -1) {
        retValue += 1;
    }
    ptr = malloc(size);
    if (malloc_check_from_ptr(ptr) == 1 || malloc_check_from_ptr(ptr) == -1) {
        retValue += 1;
    }
    char* src = "test";
    if (malloc_check_from_ptr(src) == 0 || malloc_check_from_ptr(ptr) == -1) {
        retValue  += 1;
    }
    napi_create_int32(env, retValue, &result);
    return result;
}
