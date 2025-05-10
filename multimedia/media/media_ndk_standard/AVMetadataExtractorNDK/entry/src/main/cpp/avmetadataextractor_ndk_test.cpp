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
#include <fcntl.h>
#include <hilog/log.h>
#include <string>
#include <sys/stat.h>
#include "napi/native_api.h"
#include <multimedia/player_framework/avmetadata_extractor.h>
#include <multimedia/player_framework/avmetadata_extractor_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_0777 0777
#define PARAM_END (-1)
#define LOG_MSG_TAG "AVMetadataExtractorNDK"
#define LOG(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGE(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGD(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))

bool SetPropertyString(napi_env env, napi_value obj, const std::string &key, const std::string &value)
{
    napi_value keyNapi = nullptr;
    napi_status status = napi_create_string_utf8(env, key.c_str(), NAPI_AUTO_LENGTH, &keyNapi);
    if (status != napi_ok) {
        return false;
    }

    napi_value valueNapi = nullptr;
    status = napi_create_string_utf8(env, value.c_str(), NAPI_AUTO_LENGTH, &valueNapi);
    if (status != napi_ok) {
        return false;
    }

    status = napi_set_property(env, obj, keyNapi, valueNapi);
    if (status != napi_ok) {
        return false;
    }

    return true;
}

bool SetPropertyDouble(napi_env env, napi_value &obj, const std::string &key, double value)
{
    napi_value keyNapi = nullptr;
    napi_status status = napi_create_string_utf8(env, key.c_str(), NAPI_AUTO_LENGTH, &keyNapi);
    if (status != napi_ok) {
        return false;
    }
    napi_value valueNapi = nullptr;
    status = napi_create_double(env, value, &valueNapi);
    if (status != napi_ok) {
        return false;
    }
    status = napi_set_property(env, obj, keyNapi, valueNapi);
    if (status != napi_ok) {
        return false;
    }
    return true;
}

bool SetPropertyInt(napi_env env, napi_value &obj, const std::string &key, int value)
{
    napi_value keyNapi = nullptr;
    napi_status status = napi_create_string_utf8(env, key.c_str(), NAPI_AUTO_LENGTH, &keyNapi);
    if (status != napi_ok) {
        return false;
    }
    napi_value valueNapi = nullptr;
    status = napi_create_int32(env, value, &valueNapi);
    if (status != napi_ok) {
        return false;
    }
    status = napi_set_property(env, obj, keyNapi, valueNapi);
    if (status != napi_ok) {
        return false;
    }
    return true;
}

static napi_value OhAvMetadataExtractorCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode avErrCode = AV_ERR_UNKNOWN;
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    if (mainExtractor != nullptr) {
        avErrCode = AV_ERR_OK;
    }
    napi_create_int32(env, avErrCode, &result);
    OH_AVMetadataExtractor_Release(mainExtractor);
    mainExtractor = nullptr;
    return result;
}

static napi_value OhAvMetadataExtractorSetFdPathSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value argv[1];
    int32_t fileDescribe = -1;
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[0], &fileDescribe);

    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();

    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fileDescribe, PARAM_0, PARAM_END);
    napi_create_int32(env, avErrCode, &result);

    OH_AVMetadataExtractor_Release(mainExtractor);
    mainExtractor = nullptr;

    return result;
}

static napi_value OhAvMetadataExtractorFetchMetadata(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value argv[1];
    int32_t fileDescribe = -1;
    OH_AVErrCode avErrCode = AV_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[0], &fileDescribe);

    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fileDescribe, PARAM_0, PARAM_END);
    if (avErrCode != AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
    }
    OH_AVFormat* avMetadata = OH_AVFormat_Create();

    avErrCode = OH_AVMetadataExtractor_FetchMetadata(mainExtractor, avMetadata);
    napi_create_int32(env, avErrCode, &result);

    OH_AVMetadataExtractor_Release(mainExtractor);
    OH_AVFormat_Destroy(avMetadata);
    mainExtractor = nullptr;

    return result;
}

void FetchAvMetadataFirstPart(napi_env env, OH_AVFormat* avMetadata, napi_value &jsMetadata)
{
    const char* out = nullptr;
    bool ret = false;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_ALBUM, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_ALBUM, out);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_ALBUM_ARTIST, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_ALBUM_ARTIST, out);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_ARTIST, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_ARTIST, out);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_AUTHOR, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_AUTHOR, out);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_DATE_TIME, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_DATE_TIME, out);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_DATE_TIME_FORMAT, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_DATE_TIME_FORMAT, out);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_COMPOSER, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_COMPOSER, out);
    }

    int64_t duration = 0;
    ret = OH_AVFormat_GetLongValue(avMetadata, OH_AVMETADATA_EXTRACTOR_DURATION, &duration);
    if (ret) {
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_DURATION, duration);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_GENRE, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_GENRE, out);
    }
}

void FetchAvMetadataSecondPart(napi_env env, OH_AVFormat* avMetadata, napi_value &jsMetadata)
{
    const char* out = nullptr;
    bool ret = false;
    int32_t hasAudio;
    ret = OH_AVFormat_GetIntValue(avMetadata, OH_AVMETADATA_EXTRACTOR_HAS_AUDIO, &hasAudio);
    if (ret) {
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_HAS_AUDIO, hasAudio);
    }

    int32_t hasVideo;
    ret = OH_AVFormat_GetIntValue(avMetadata, OH_AVMETADATA_EXTRACTOR_HAS_VIDEO, &hasVideo);
    if (ret) {
        out = std::to_string(hasVideo).c_str();
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_HAS_VIDEO, hasVideo);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_MIME_TYPE, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_MIME_TYPE, out);
    }

    int32_t trackCount;
    ret = OH_AVFormat_GetIntValue(avMetadata, OH_AVMETADATA_EXTRACTOR_TRACK_COUNT, &trackCount);
    if (ret) {
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_TRACK_COUNT, trackCount);
    }

    int32_t sampleRate;
    ret = OH_AVFormat_GetIntValue(avMetadata, OH_AVMETADATA_EXTRACTOR_SAMPLE_RATE, &sampleRate);
    if (ret) {
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_SAMPLE_RATE, sampleRate);
    }

    out = nullptr;
    ret = OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_TITLE, &out);
    if (ret && out) {
        SetPropertyString(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_TITLE, out);
    }

    int32_t videoHeight;
    ret = OH_AVFormat_GetIntValue(avMetadata, OH_AVMETADATA_EXTRACTOR_VIDEO_HEIGHT, &videoHeight);
    if (ret) {
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_VIDEO_HEIGHT, videoHeight);
    }

    int32_t videoWidth;
    ret = OH_AVFormat_GetIntValue(avMetadata, OH_AVMETADATA_EXTRACTOR_VIDEO_WIDTH, &videoWidth);
    if (ret) {
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_VIDEO_WIDTH, videoWidth);
    }
}

void FetchAvMetadataThirdPart(napi_env env, OH_AVFormat* avMetadata, napi_value &jsMetadata)
{
    bool ret = false;
    int32_t videoOrientation;
    ret = OH_AVFormat_GetIntValue(avMetadata, OH_AVMETADATA_EXTRACTOR_VIDEO_ORIENTATION, &videoOrientation);
    if (ret) {
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_VIDEO_ORIENTATION, videoOrientation);
    }

    int32_t hdrType;
    ret = OH_AVFormat_GetIntValue(avMetadata, OH_AVMETADATA_EXTRACTOR_VIDEO_IS_HDR_VIVID, &hdrType);
    if (ret) {
        SetPropertyInt(env, jsMetadata, OH_AVMETADATA_EXTRACTOR_VIDEO_IS_HDR_VIVID, hdrType);
    }

    napi_value location = nullptr;
    napi_create_object(env, &location);
    float latitude;
    bool retLatitude = OH_AVFormat_GetFloatValue(avMetadata, OH_AVMETADATA_EXTRACTOR_LOCATION_LATITUDE, &latitude);
    if (retLatitude) {
        SetPropertyDouble(env, location, OH_AVMETADATA_EXTRACTOR_LOCATION_LATITUDE, latitude);
    }

    float longitude;
    bool retLongitude = OH_AVFormat_GetFloatValue(avMetadata, OH_AVMETADATA_EXTRACTOR_LOCATION_LONGITUDE, &longitude);
    if (retLongitude) {
        SetPropertyDouble(env, location, OH_AVMETADATA_EXTRACTOR_LOCATION_LONGITUDE, longitude);
    }

    if (retLatitude || retLongitude) {
        napi_value keyNapi = nullptr;
        std::string key = "location";
        napi_create_string_utf8(env, key.c_str(), NAPI_AUTO_LENGTH, &keyNapi);
        napi_set_property(env, jsMetadata, keyNapi, location);
    }
}

static napi_value ohAvMetadataExtractorFetchMetadataAll(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value argv[1];
    int32_t fileDescribe = -1;
    OH_AVErrCode avErrCode = AV_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[0], &fileDescribe);

    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fileDescribe, PARAM_0, PARAM_END);
    if (avErrCode != AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
    }
    OH_AVFormat* avMetadata = OH_AVFormat_Create();

    avErrCode = OH_AVMetadataExtractor_FetchMetadata(mainExtractor, avMetadata);
    napi_value jsMetadata = nullptr;
    napi_status status = napi_create_object(env, &jsMetadata);
    if (status != napi_ok) {
        OH_AVFormat_Destroy(avMetadata);
        OH_AVMetadataExtractor_Release(mainExtractor);
        napi_throw_error(env, "EFAILED", "Create JavaScript object failed");
        return nullptr;
    }

    FetchAvMetadataFirstPart(env, avMetadata, jsMetadata);
    FetchAvMetadataSecondPart(env, avMetadata, jsMetadata);
    FetchAvMetadataThirdPart(env, avMetadata, jsMetadata);

    OH_AVFormat_Destroy(avMetadata);

    OH_AVMetadataExtractor_Release(mainExtractor);

    return jsMetadata;
}

static napi_value OhAvMetadataExtractorFetchAlbumCover(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value argv[1];
    int32_t fileDescribe = -1;
    OH_AVErrCode avErrCode = AV_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[0], &fileDescribe);

    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fileDescribe, PARAM_0, PARAM_END);
    if (avErrCode != AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
    }
    OH_PixelmapNative *pixelmapNative = nullptr;

    avErrCode = OH_AVMetadataExtractor_FetchAlbumCover(mainExtractor, &pixelmapNative);

    if (pixelmapNative == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, avErrCode, &result);
    }

    OH_AVMetadataExtractor_Release(mainExtractor);
    OH_PixelmapNative_Release(pixelmapNative);
    mainExtractor = nullptr;

    return result;
}

static napi_value OhAvMetadataExtractorRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVErrCode errCode = OH_AVMetadataExtractor_Release(mainExtractor);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAvMetadataExtractorReleaseTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVMetadataExtractor* mainExtractor = nullptr;
    OH_AVErrCode errCode = OH_AVMetadataExtractor_Release(mainExtractor);
    napi_create_int32(env, errCode, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ohAvMetadataExtractorCreate", nullptr, OhAvMetadataExtractorCreate, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"ohAvMetadataExtractorFetchMetadataAll", nullptr, ohAvMetadataExtractorFetchMetadataAll, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"ohAvMetadataExtractorFetchMetadata", nullptr, OhAvMetadataExtractorFetchMetadata, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ohAvMetadataExtractorSetFdPathSource", nullptr, OhAvMetadataExtractorSetFdPathSource, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"ohAvMetadataExtractorFetchAlbumCover", nullptr, OhAvMetadataExtractorFetchAlbumCover, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"ohAvMetadataExtractorRelease", nullptr, OhAvMetadataExtractorRelease, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"ohAvMetadataExtractorReleaseTwo", nullptr, OhAvMetadataExtractorReleaseTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "avmetadataextractorndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}