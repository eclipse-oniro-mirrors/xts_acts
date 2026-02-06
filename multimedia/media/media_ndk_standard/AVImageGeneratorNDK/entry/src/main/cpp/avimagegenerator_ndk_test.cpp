/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <multimedia/player_framework/avimage_generator.h>
#include <multimedia/player_framework/avimage_generator_base.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/player_framework/native_averrors.h>
#include <fcntl.h>
#include <string>
#include <sys/stat.h>
#include "napi/native_api.h"

#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_7 7
#define AV_IMAGE_QUERY_NEXT_SYNC 0
#define AV_IMAGE_QUERY_PREVIOUS_SYNC 1
#define AV_IMAGE_QUERY_CLOSEST_SYNC 2
#define AV_IMAGE_QUERY_CLOSEST 3

static napi_value OhAvImageGeneratorCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVImageGenerator *mainGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode avErrCode = AV_ERR_OK;

    if (mainGenerator == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, avErrCode, &result);
    }

    OH_AVImageGenerator_Release(mainGenerator);
    mainGenerator = nullptr;

    return result;
}

// 设置有效本地描述
static napi_value OhAvImageGeneratorSetFdSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_1;
    napi_value argv[PARAM_1];
    int32_t fileDescribe = -1;
    int32_t fileSize = -1;
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[PARAM_0], &fileDescribe);

    OH_AVImageGenerator *mainGenerator = nullptr;

    if (mainGenerator == nullptr) {
        mainGenerator = OH_AVImageGenerator_Create();
    }

    OH_AVErrCode avErrCode = OH_AVImageGenerator_SetFDSource(mainGenerator, fileDescribe, PARAM_0, fileSize);
    napi_create_int32(env, avErrCode, &result);

    OH_AVImageGenerator_Release(mainGenerator);
    mainGenerator = nullptr;

    return result;
}

// 设置无效文件描述
static napi_value OhAVImageGeneratorSetFdPathSourceTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t fileSize = -1;

    OH_AVImageGenerator *mainGenerator = nullptr;

    if (mainGenerator == nullptr) {
        mainGenerator = OH_AVImageGenerator_Create();
    }

    OH_AVErrCode avErrCode = OH_AVImageGenerator_SetFDSource(mainGenerator, FAIL, PARAM_0, fileSize);
    napi_create_int32(env, avErrCode, &result);

    OH_AVImageGenerator_Release(mainGenerator);
    mainGenerator = nullptr;

    return result;
}

static napi_value OhAvImageGeneratorFetchFrameByTime(napi_env env, napi_callback_info info)
{
    OH_AVImageGenerator *mainGenerator = OH_AVImageGenerator_Create();
    napi_value result = nullptr;
    size_t argc = PARAM_3;
    napi_value argv[PARAM_3];
    int64_t timeUs = 0;
    int32_t options = AV_IMAGE_QUERY_CLOSEST_SYNC;
    int32_t fileDescribe = -1;
    int32_t fileSize = -1;
    OH_AVErrCode avErrCode = AV_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (argc < PARAM_3) {
        napi_create_int32(env, avErrCode, &result);
        return result;
    }

    napi_get_value_int32(env, argv[PARAM_0], &fileDescribe);
    napi_get_value_int64(env, argv[PARAM_1], &timeUs);

    napi_get_value_int32(env, argv[PARAM_2], &options);
    if (options < AV_IMAGE_QUERY_NEXT_SYNC || options > AV_IMAGE_QUERY_CLOSEST) {
        napi_create_int32(env, avErrCode, &result);
        return result;
    }

    avErrCode = OH_AVImageGenerator_SetFDSource(mainGenerator, fileDescribe, PARAM_0, fileSize);
    if (avErrCode != AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
        return result;
    }

    OH_PixelmapNative* pixelMap = nullptr;
    avErrCode = OH_AVImageGenerator_FetchFrameByTime(mainGenerator, timeUs,
        static_cast<OH_AVImageGenerator_QueryOptions>(options), &pixelMap);

    if (pixelMap == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, avErrCode, &result);
    }

    OH_AVImageGenerator_Release(mainGenerator);
    OH_PixelmapNative_Release(pixelMap);
    mainGenerator = nullptr;

    return result;
}

//设置正确指针进行释放
static napi_value OhAvImageGeneratorRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_AVImageGenerator *mainGenerator = nullptr;

    mainGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode avErrCode = OH_AVImageGenerator_Release(mainGenerator);
    napi_create_int32(env, avErrCode, &result);

    return result;
}

//设置空指针进行释放
static napi_value OhAvImageGeneratorReleaseTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVImageGenerator *tempGenerator = nullptr;
    OH_AVErrCode avErrCode = OH_AVImageGenerator_Release(tempGenerator);
    napi_create_int32(env, avErrCode, &result);

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OhAvImageGeneratorCreate", nullptr, OhAvImageGeneratorCreate,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvImageGeneratorSetFdSource", nullptr, OhAvImageGeneratorSetFdSource,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVImageGeneratorSetFdPathSourceTwo", nullptr, OhAVImageGeneratorSetFdPathSourceTwo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvImageGeneratorFetchFrameByTime", nullptr, OhAvImageGeneratorFetchFrameByTime,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvImageGeneratorRelease", nullptr, OhAvImageGeneratorRelease,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvImageGeneratorReleaseTwo", nullptr, OhAvImageGeneratorReleaseTwo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "avimagegeneratorndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}