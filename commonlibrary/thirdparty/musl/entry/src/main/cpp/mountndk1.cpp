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

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_0777 0777
#define MPARAM_1 (-1)

static const char *TEMP_DIR1 = "/data/storage/el2/base/files/tmpdir1";
static const char *TEMP_DIR2 = "/data/storage/el2/base/files/tmpdir2";

static napi_value Mount(napi_env env, napi_callback_info info)
{
    int ret = MPARAM_1;
    do {
        ret = mkdir(TEMP_DIR1, PARAM_0777);
        if (ret == MPARAM_1) {
            break;
        }
        ret = mkdir(TEMP_DIR2, PARAM_0777);
        if (ret == MPARAM_1) {
            break;
        }
        ret = mount(TEMP_DIR1, TEMP_DIR2, "", MS_BIND, "");
        if (ret == MPARAM_1) {
            break;
        }
        umount(TEMP_DIR1);
    } while (PARAM_0);
    rmdir(TEMP_DIR1);
    rmdir(TEMP_DIR2);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Umount(napi_env env, napi_callback_info info)
{
    int ret = MPARAM_1;
    do {
        ret = mkdir(TEMP_DIR1, PARAM_0777);
        if (ret == MPARAM_1) {
            break;
        }
        ret = mkdir(TEMP_DIR2, PARAM_0777);
        if (ret == MPARAM_1) {
            break;
        }
        ret = mount(TEMP_DIR1, TEMP_DIR2, "", PARAM_0, "");
        if (ret == MPARAM_1) {
            break;
        }
        ret = umount(TEMP_DIR2);
        if (ret == MPARAM_1) {
            break;
        }
    } while (PARAM_0);
    rmdir(TEMP_DIR1);
    rmdir(TEMP_DIR2);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Umount2(napi_env env, napi_callback_info info)
{
    int ret = MPARAM_1;
    do {
        ret = mkdir(TEMP_DIR1, PARAM_0777);
        if (ret == MPARAM_1) {
            break;
        }
        ret = mkdir(TEMP_DIR2, PARAM_0777);
        if (ret == MPARAM_1) {
            break;
        }
        ret = mount(TEMP_DIR1, TEMP_DIR2, "", PARAM_0, "");
        if (ret == MPARAM_1) {
            break;
        }
        ret = umount2(TEMP_DIR2, PARAM_0);
        if (ret == MPARAM_1) {
            break;
        }
    } while (PARAM_0);
    rmdir(TEMP_DIR1);
    rmdir(TEMP_DIR2);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"mount", nullptr, Mount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umount", nullptr, Umount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umount2", nullptr, Umount2, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "mount1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
