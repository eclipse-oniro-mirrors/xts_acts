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

#ifndef DRM_KIT_TEST_H
#define DRM_KIT_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>

#include <vector>
void addKernelEnhanceKitTest(std::vector<napi_property_descriptor>& descData);

napi_value CstandardLibrary_calloc(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_realloc(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_valloc(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_memalign(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_arena(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_ordblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_smblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_hblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_hblkhd(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_usmblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_fsmblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_uordblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_fordblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo_keepcost(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_arena(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_ordblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_smblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_hblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_hblkhd(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_usmblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_fsmblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_uordblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_fordblks(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_mallinfo2_keepcost(napi_env env, napi_callback_info info);
napi_value CstandardLibrary_malloc_check_from_ptr(napi_env env, napi_callback_info info);

#endif //DRM_KIT_TEST_H
