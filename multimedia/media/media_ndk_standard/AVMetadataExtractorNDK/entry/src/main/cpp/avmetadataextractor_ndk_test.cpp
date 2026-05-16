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
#include <multimedia/player_framework/avmetakeys.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_9999 9999
#define PARAM_0777 0777
#define PARAM_END (-1)
#define LOG_MSG_TAG "AVMetadataExtractorNDK"
#define LOG(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGE(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGD(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))

const int32_t ORIGIN_WIDTH = 1024;
const int32_t ORIGIN_HEIGHT = 1280;

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

static napi_value OhAvMetadataExtractorPixelMapParamsCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode avErrCode = AV_ERR_OK;
    OH_AVMetadataExtractor_OutputParam* outputParams = OH_AVMetadataExtractor_OutputParam_Create();
    LOGE("outputParams %{public}p", outputParams);
    if (outputParams != nullptr) {
        avErrCode = AV_ERR_OK;
    } else {
        avErrCode = AV_ERR_UNKNOWN;
    }
    napi_create_int32(env, avErrCode, &result);
    OH_AVMetadataExtractor_OutputParam_Destroy(outputParams);
    outputParams = nullptr;
    return result;
}

static napi_value OhAvMetadataExtractorPixelMapParamsSetSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value argv[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t width;
    napi_get_value_int32(env, argv[PARAM_0], &width);
    int32_t height;
    napi_get_value_int32(env, argv[PARAM_1], &height);
    OH_AVMetadataExtractor_OutputParam* outputParams = OH_AVMetadataExtractor_OutputParam_Create();
    bool ret = OH_AVMetadataExtractor_OutputParam_SetSize(outputParams, width, height);
    OH_AVMetadataExtractor_OutputParam_Destroy(outputParams);
    napi_get_boolean(env, ret, &result);
    return result;
}

static bool CheckPixelMap(OH_PixelmapNative *pixelmapNative, int32_t width, int32_t height)
{
    if (pixelmapNative == nullptr) {
        LOGE("pixelmapNative is nullptr");
        return false;
    }
    LOG("CheckPixelMap width %{public}d, height %{public}d", width, height);
    bool ret = true;
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    OH_PixelmapNative_GetImageInfo(pixelmapNative, imageInfo);
    uint32_t pixelMapWidth;
    uint32_t pixelMapHeight;
    OH_PixelmapImageInfo_GetWidth(imageInfo, &pixelMapWidth);
    OH_PixelmapImageInfo_GetHeight(imageInfo, &pixelMapHeight);
    LOG("pixelMapWidth %{public}d, pixelMapHeight %{public}d", pixelMapWidth, pixelMapHeight);
    if (width < 0) {
        ret = ret && (pixelMapWidth == ORIGIN_WIDTH);
        LOG("width < 0, check ret %{public}d", ret);
    }
    if (height < 0) {
        ret = ret && (pixelMapHeight == ORIGIN_HEIGHT);
        LOG("height < 0, check ret %{public}d", ret);
    }
    if (width == 0 || height == 0) {
        ret = ret && (pixelMapWidth * ORIGIN_HEIGHT == pixelMapHeight * ORIGIN_WIDTH);
        LOG("width == 0 || height == 0, check ret %{public}d", ret);
    }
    if (width > ORIGIN_WIDTH || height > ORIGIN_HEIGHT) {
        ret = ret && (pixelMapWidth == ORIGIN_WIDTH && pixelMapHeight == ORIGIN_HEIGHT);
        LOG("width > ORIGIN_WIDTH || height > ORIGIN_HEIGHT, check ret %{public}d", ret);
    } else {
        if (width > 0 && width <= ORIGIN_WIDTH) {
            ret = ret && (pixelMapWidth == static_cast<uint32_t>(width));
            LOG("width > 0 && width <= ORIGIN_WIDTH, check ret %{public}d", ret);
        }
        if (height > 0 && height <= ORIGIN_HEIGHT) {
            ret = ret && (pixelMapHeight == static_cast<uint32_t>(height));
            LOG("height > 0 && height <= ORIGIN_HEIGHT, check ret %{public}d", ret);
        }
    }
    OH_PixelmapImageInfo_Release(imageInfo);
    return ret;
}

static napi_value OhAvMetadataExtractorFetchFrameByTime(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 5;
    napi_value args[PARAM_5] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = -1;
    napi_get_value_int32(env, args[PARAM_0], &fd);
    int64_t timeUs;
    napi_get_value_int64(env, args[PARAM_1], &timeUs);
    int32_t option;
    napi_get_value_int32(env, args[PARAM_2], &option);
    int32_t width;
    int32_t height;
    napi_get_value_int32(env, args[PARAM_3], &width);
    napi_get_value_int32(env, args[PARAM_4], &height);
    OH_AVMedia_SeekMode QueryOption = static_cast<OH_AVMedia_SeekMode>(option);
    LOGE("fd %{public}d, timeUs %{public}lld, QueryOption %{public}d", fd, timeUs, QueryOption);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fd, PARAM_0, PARAM_END);
    if (avErrCode != AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
        LOG("avErrCode %{public}d", avErrCode);
    }
    OH_AVMetadataExtractor_OutputParam* outputParams = OH_AVMetadataExtractor_OutputParam_Create();
    OH_AVMetadataExtractor_OutputParam_SetSize(outputParams, width, height);
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_AVErrCode errCode = OH_AVMetadataExtractor_FetchFrameByTime(mainExtractor,
        timeUs, QueryOption, outputParams, &pixelmapNative);
    if (errCode != AV_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        LOG("errCode %{public}d", errCode);
    } else {
        bool checkResult = CheckPixelMap(pixelmapNative, width, height);
        if (!checkResult) {
            napi_create_int32(env, FAIL, &result);
            LOG("CheckPixelMap failed");
        } else {
            napi_create_int32(env, errCode, &result);
            LOG("errCode %{public}d", errCode);
        }
    }
    OH_PixelmapNative_Release(pixelmapNative);
    OH_AVMetadataExtractor_OutputParam_Destroy(outputParams);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return result;
}
static void GetStringMetaData(struct OH_AVFormat *avMetadata, napi_env env, napi_value &JsMetadata, const char* key)
{
    const char* out = nullptr;
    bool ret = false;
    ret = OH_AVFormat_GetStringValue(avMetadata, key, &out);
    std::string result = std::string(key) + " : %{public}s";
    LOG(result.c_str(), out);
    if (ret && out) {
        napi_value valueNapi = nullptr;
        napi_create_string_utf8(env, out, NAPI_AUTO_LENGTH, &valueNapi);
        napi_set_named_property(env, JsMetadata, key, valueNapi);
    }
}

static void GetLongMetaData(struct OH_AVFormat *avMetadata, napi_env env, napi_value &JsMetadata, const char* &key)
{
    const char* out = nullptr;
    bool ret = false;
    int64_t value = 0;
    ret = OH_AVFormat_GetLongValue(avMetadata, key, &value);
    std::string result = std::string(key) + " : %{public}d";
    LOG(result.c_str(), value);
    if (ret) {
        napi_value valueNapi = nullptr;
        napi_create_int64(env, value, &valueNapi);
        napi_set_named_property(env, JsMetadata, key, valueNapi);
    }
}

static void GetDoubleMetaData(struct OH_AVFormat *avMetadata, napi_env env, napi_value &JsMetadata, const char* &key)
{
    const char* out = nullptr;
    bool ret = false;
    double value = 0;
    ret = OH_AVFormat_GetDoubleValue(avMetadata, key, &value);
    std::string result = std::string(key) + " : %{public}d";
    LOG(result.c_str(), value);
    if (ret) {
        napi_value valueNapi = nullptr;
        napi_create_double(env, value, &valueNapi);
        napi_set_named_property(env, JsMetadata, key, valueNapi);
    }
}

static void GetIntMetaData(struct OH_AVFormat *avMetadata, napi_env env, napi_value &JsMetadata, const char* &key)
{
    const char* out = nullptr;
    bool ret = false;
    int32_t value = 0;
    ret = OH_AVFormat_GetIntValue(avMetadata, key, &value);
    std::string result = std::string(key) + " : %{public}d";
    LOG(result.c_str(), value);
    if (ret) {
        napi_value valueNapi = nullptr;
        napi_create_int32(env, value, &valueNapi);
        napi_set_named_property(env, JsMetadata, key, valueNapi);
    }
}

static void CreateMediaDescription(struct OH_AVFormat *avMetadata, napi_env env, napi_value &JsMetadata)
{
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_TRACK_INDEX);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_TRACK_TYPE);
    GetLongMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_BITRATE);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_WIDTH);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_HEIGHT);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_CHANNEL_COUNT);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_SAMPLE_RATE);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_SAMPLE_DEPTH);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_HDR_TYPE);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_ORIGINAL_WIDTH);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_ORIGINAL_HEIGHT);
    
    GetStringMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_MIME_TYPE);
    GetStringMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_LANGUAGE);
    GetStringMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_TRACK_NAME);
    GetLongMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_DURATION);
    GetDoubleMetaData(avMetadata, env, JsMetadata, OH_AVMETA_KEY_FRAME_RATE);
}

static napi_value OhAvMetadataExtractorGetTrackDescription(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    uint32_t index = -1;
    size_t argc = 2;
    napi_value argv[PARAM_2];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[PARAM_0], &fd);
    napi_get_value_uint32(env, argv[PARAM_1], &index);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    if (!mainExtractor) {
        napi_throw_error(env, "EFAILED", "Create metadata extractor failed");
        return nullptr;
    }
    LOGE("set fd %{public}d", fd);
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fd, PARAM_0, PARAM_END);
    if (avErrCode != AV_ERR_OK) {
        LOGE("SetFDSource for metadata extractor failed, %{public}d", avErrCode);
        napi_throw_error(env, "EFAILED", "SetFDSource for metadata extractor failed");
        return nullptr;
    }
    LOGE("SetFDSource for metadata extractor success");
    OH_AVFormat* avMetadata = OH_AVFormat_Create();
    avMetadata = OH_AVMetadataExtractor_GetTrackDescription(mainExtractor, index);
    if (avMetadata == nullptr) {
        LOGE("GetTrackDescription for metadata extractor failed");
        napi_throw_error(env, "EFAILED", "GetTrackDescription for metadata extractor failed");
        return nullptr;
    }
    LOGE("GetTrackDescription for metadata extractor success");
    napi_value JsMetadata = nullptr;
    napi_status status = napi_create_object(env, &JsMetadata);
    CreateMediaDescription(avMetadata, env, JsMetadata);
    OH_AVFormat_Destroy(avMetadata);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return JsMetadata;
}

static napi_value OhAvMetadataExtractorFetchFileMetadata(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[PARAM_1];
    int32_t fileDescribe = -1;
    OH_AVErrCode avErrCode = AV_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[PARAM_0], &fileDescribe);

    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fileDescribe, PARAM_0, PARAM_END);
    OH_AVFormat* avMetadata = OH_AVFormat_Create();

    avErrCode = OH_AVMetadataExtractor_FetchMetadata(mainExtractor, avMetadata);
    napi_value jsMetadata = nullptr;
    napi_status status = napi_create_object(env, &jsMetadata);
    int32_t trackCount = 0;
    OH_AVFormat_GetIntValue(avMetadata, OH_MD_KEY_TRACK_COUNT, &trackCount);
    LOG("track_count %{public}d", trackCount);
    SetPropertyInt(env, jsMetadata, "track_count", trackCount);
    const char* mimeType = nullptr;
    OH_AVFormat_GetStringValue(avMetadata, OH_AVMETADATA_EXTRACTOR_MIME_TYPE, &mimeType);
    SetPropertyString(env, jsMetadata, "mimeType", mimeType);

    OH_AVMetadataExtractor_Release(mainExtractor);
    OH_AVFormat_Destroy(avMetadata);
    return jsMetadata;
}

static napi_value OhAvMetadataExtractorGetCustomInfo(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    size_t argc = 1;
    napi_value argv[PARAM_1];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[PARAM_0], &fd);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    if (!mainExtractor) {
        napi_throw_error(env, "EFAILED", "Create metadata extractor failed");
        return nullptr;
    }
    LOGE("set fd %{public}d", fd);
    
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fd, PARAM_0, PARAM_END);
    if (avErrCode != AV_ERR_OK) {
        LOGE("SetFDSource for metadata extractor failed, %{public}d", avErrCode);
        napi_throw_error(env, "EFAILED", "SetFDSource for metadata extractor failed");
        return nullptr;
    }
    OH_AVFormat* avMetadata = OH_AVMetadataExtractor_GetCustomInfo(mainExtractor);

    uint32_t keyCount = OH_AVFormat_GetKeyCount(avMetadata);
    LOGE("keyCount %{public}d", keyCount);
    if (keyCount == 0) {
        OH_AVFormat_Destroy(avMetadata);
        OH_AVMetadataExtractor_Release(mainExtractor);
        return nullptr;
    }

    napi_value jsMetadata = nullptr;
    napi_status status = napi_create_object(env, &jsMetadata);
    const char* out = nullptr;
    for (int i = 0; i < keyCount; i++) {
        bool ret = OH_AVFormat_GetKey(avMetadata, i, &out);
        LOGE("key %{public}s", out);
        if (ret) {
            const char* value = nullptr;
            ret = OH_AVFormat_GetStringValue(avMetadata, "com.openharmony.video.sei.h_log", &value);
            LOG("value %{public}s", value);
            if (ret && value) {
                napi_value valueNapi = nullptr;
                napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &valueNapi);
                napi_set_named_property(env, jsMetadata, "com.openharmony.video.sei.h_log", valueNapi);
            }
        }
    }
    OH_AVFormat_Destroy(avMetadata);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return jsMetadata;
}

static napi_value OhAvMetadataExtractorGetRefTrackMetaData(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    uint32_t index = -1;
    size_t argc = 2;
    napi_value argv[PARAM_2];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_get_value_int32(env, argv[PARAM_0], &fd);
    napi_get_value_uint32(env, argv[PARAM_1], &index);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    LOGE("set fd %{public}d", fd);
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_SetFDSource(mainExtractor, fd, PARAM_0, PARAM_END);
    if (avErrCode != AV_ERR_OK) {
        LOGE("SetFDSource for metadata extractor failed, %{public}d", avErrCode);
        napi_throw_error(env, "EFAILED", "SetFDSource for metadata extractor failed");
        return nullptr;
    }
    LOGE("SetFDSource for metadata extractor success");
    OH_AVFormat* avMetadata = OH_AVFormat_Create();
    avMetadata = OH_AVMetadataExtractor_GetTrackDescription(mainExtractor, index);
    if (avMetadata == nullptr) {
        LOGE("GetTrackDescription for metadata extractor failed");
        napi_throw_error(env, "EFAILED", "GetTrackDescription for metadata extractor failed");
        return nullptr;
    }
    LOGE("GetTrackDescription for metadata extractor success");
    napi_value JsMetadata = nullptr;
    napi_status status = napi_create_object(env, &JsMetadata);
    int32_t* trackIds = nullptr;
    size_t trackIdsSize = 0;
    OH_AVFormat_GetIntBuffer(avMetadata, OH_AVMETA_KEY_REF_TRACK_IDS, &trackIds, &trackIdsSize);
    LOGE("ref_track_ids %{public}d", trackIdsSize);
    if (trackIdsSize != 0) {
        napi_value trackIdsArray = nullptr;
        napi_create_array(env, &trackIdsArray);
        napi_value type = nullptr;
        for (size_t i = 0; i < trackIdsSize; i++) {
            napi_create_uint32(env, static_cast<uint32_t>(trackIds[i]), &type);
            napi_set_element(env, trackIdsArray, i, type);
        }
        napi_set_named_property(env, JsMetadata, "ref_track_ids", trackIdsArray);
    }
    const char* trackRefType = nullptr;
    OH_AVFormat_GetStringValue(avMetadata, OH_AVMETA_KEY_TRACK_REF_TYPE, &trackRefType);
    LOGE("trackRefType %{public}s", trackRefType);
    SetPropertyString(env, JsMetadata, "trackRefType", trackRefType == nullptr ? "" : trackRefType);
    OH_AVFormat_Destroy(avMetadata);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return JsMetadata;
}

static napi_value OhAVMetadataExtractorOutputParamsSetSizeError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool ret = OH_AVMetadataExtractor_OutputParam_SetSize(nullptr, 0, 0);
    napi_get_boolean(env, ret, &result);
    return result;
}

static napi_value OhAVMetadataExtractorFetchFrameByTimeError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value argv[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t params = 0;
    napi_get_value_int32(env, argv[PARAM_0], &params);
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_AVMetadataExtractor_OutputParam* outputParams = OH_AVMetadataExtractor_OutputParam_Create();
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVErrCode errCode;
    if (params == 0) {
        errCode = OH_AVMetadataExtractor_FetchFrameByTime(nullptr,
            0, OH_AVMEDIA_SEEK_NEXT_SYNC, outputParams, &pixelmapNative);
    } else if (params == 1) {
        errCode = OH_AVMetadataExtractor_FetchFrameByTime(mainExtractor,
            0, OH_AVMEDIA_SEEK_NEXT_SYNC, nullptr, &pixelmapNative);
    } else {
        errCode = OH_AVMetadataExtractor_FetchFrameByTime(mainExtractor,
            0, OH_AVMEDIA_SEEK_NEXT_SYNC, outputParams, nullptr);
    }
    napi_create_int32(env, errCode, &result);
    OH_AVMetadataExtractor_OutputParam_Destroy(outputParams);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return result;
}

static napi_value OhAVMetadataExtractorGetTrackDescriptionError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value argv[PARAM_1];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t params = -1;
    napi_get_value_int32(env, argv[PARAM_0], &params);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVFormat* avMetadata = nullptr;
    if (params == 0) {
        avMetadata = OH_AVMetadataExtractor_GetTrackDescription(nullptr, 0);
    } else {
        avMetadata = OH_AVMetadataExtractor_GetTrackDescription(mainExtractor, PARAM_9999);
    }
    napi_create_int32(env, avMetadata == nullptr ? AV_ERR_INVALID_VAL : AV_ERR_OK, &result);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return result;
}

static napi_value OhAVMetadataExtractorGetCustomInfoError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVFormat* avMetadata = OH_AVMetadataExtractor_GetCustomInfo(nullptr);
    napi_create_int32(env, avMetadata == nullptr ? AV_ERR_INVALID_VAL : AV_ERR_OK, &result);
    return result;
}

static napi_value OhAvMetadataExtractorSetUrlMediaSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = 0;
    napi_get_value_string_utf8(env, args[PARAM_0], nullptr, 0, &length);
    char *url = new char[length + 1];
    napi_get_value_string_utf8(env, args[PARAM_0], url, length + 1, &length);

    OH_AVHttpHeader *header = OH_AVHttpHeader_Create();
    OH_AVMediaSource *mediaSource = OH_AVMediaSource_CreateWithUrl(url, header);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_SetMediaSource(mainExtractor, mediaSource);
    delete[] url;
    url = nullptr;
    napi_create_int32(env, avErrCode, &result);
    OH_AVHttpHeader_Destroy(header);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return result;
}

static napi_value OhAvMetadataExtractorSetFdMediaSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 3;
    napi_value args[PARAM_3];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t fd = -1;
    int64_t offset = 0;
    int64_t length = 0;
    napi_get_value_int32(env, args[PARAM_0], &fd);
    napi_get_value_int64(env, args[PARAM_1], &offset);
    napi_get_value_int64(env, args[PARAM_2], &length);
    OH_AVMediaSource *mediaSource = OH_AVMediaSource_CreateWithFd(fd, offset, length);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_SetMediaSource(mainExtractor, mediaSource);
    napi_create_int32(env, avErrCode, &result);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return result;
}
static int32_t DataSourceReadAtCallback(OH_AVBuffer *buffer, int32_t length, int64_t pos)
{
    return 0;
}
static napi_value OhAvMetadataExtractorSetDataSourceMediaSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVDataSource dataSource = { 1024, &DataSourceReadAtCallback };
    OH_AVMediaSource *mediaSource = OH_AVMediaSource_CreateWithDataSource(&dataSource);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_SetMediaSource(mainExtractor, mediaSource);
    napi_create_int32(env, avErrCode, &result);
    OH_AVMetadataExtractor_Release(mainExtractor);
    return result;
}

typedef struct OHAVMetadataExtractorUserData {
    OHAVMetadataExtractorUserData();
    OHAVMetadataExtractorUserData(const OHAVMetadataExtractorUserData &other) = delete;
    OHAVMetadataExtractorUserData& operator=(const OHAVMetadataExtractorUserData &other) = delete;
    ~OHAVMetadataExtractorUserData();
    OH_AVMetadataExtractor* mainExtractor = nullptr;
    OH_AVMetadataExtractor_OutputParam* outputParams = nullptr;
    bool testResult = false;
    int32_t thumbnailWidth = 0;
    int32_t thumbnailHeight = 0;
} OHAVMetadataExtractorUserData;

OHAVMetadataExtractorUserData::OHAVMetadataExtractorUserData()
{
}

OHAVMetadataExtractorUserData::~OHAVMetadataExtractorUserData()
{
    if (outputParams) {
        OH_AVMetadataExtractor_OutputParam_Destroy(outputParams);
        outputParams = nullptr;
    }
    if (mainExtractor) {
        OH_AVMetadataExtractor_Release(mainExtractor);
        mainExtractor = nullptr;
    }
}

static void OHAVMetadataExtractorOnFrameFetchedImpl(OH_AVMetadataExtractor* extractor,
    const OH_AVMetadataExtractor_FrameInfo* frameInfo, OH_AVErrCode code, void* userData)
{
    LOG("OHAVMetadataExtractorOnFrameFetchedImpl code %{public}d", code);
    OHAVMetadataExtractorUserData* data = reinterpret_cast<OHAVMetadataExtractorUserData*>(userData);
    if (data == nullptr) {
        LOG("OHAVMetadataExtractorOnFrameFetchedImpl userData is nullptr");
        return;
    }
    if (frameInfo->image == nullptr) {
        return;
    }
    bool checkResult = CheckPixelMap(frameInfo->image, data->thumbnailWidth, data->thumbnailHeight);
    data->testResult = checkResult;
    return;
}

static napi_value OhAVMetadataExtractorFetchFramesByTimes(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 8;
    napi_value argv[8];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int64_t offset = 0;
    int32_t fileDescribe = -1;
    int64_t fileSize = 0;
    napi_get_value_int32(env, argv[PARAM_0], &fileDescribe);
    napi_get_value_int64(env, argv[PARAM_1], &offset);
    napi_get_value_int64(env, argv[PARAM_2], &fileSize);
    int32_t width;
    int32_t height;
    napi_get_value_int32(env, argv[PARAM_3], &width);
    napi_get_value_int32(env, argv[PARAM_4], &height);
    int32_t option;
    napi_get_value_int32(env, argv[PARAM_5], &option);
    uint32_t typeSize = 0;
    napi_get_array_length(env, argv[PARAM_6], &typeSize);
    int64_t *timeUs = static_cast<int64_t *>(malloc((typeSize + 1) * sizeof(int64_t)));
    if (timeUs == nullptr) {
        LOGE("OhAVMetadataExtractorFetchFrames malloc timeUs failed");
        return result;
    }
    int64_t num = 0;
    for (size_t i = 0; i < typeSize; i++) {
        napi_value item1;
        napi_get_element(env, argv[PARAM_6], i, &item1);
        napi_get_value_int64(env, item1, &num);
        timeUs[i] = num;
    }
    OHAVMetadataExtractorUserData *userData = new OHAVMetadataExtractorUserData();
    userData->mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVMetadataExtractor_SetFDSource(userData->mainExtractor, fileDescribe, offset, fileSize);
    userData->outputParams = OH_AVMetadataExtractor_OutputParam_Create();
    OH_AVMetadataExtractor_OutputParam_SetSize(userData->outputParams, width, height);
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_FetchFramesByTimes(userData->mainExtractor,
        timeUs, typeSize, static_cast<OH_AVMedia_SeekMode>(option), userData->outputParams,
        OHAVMetadataExtractorOnFrameFetchedImpl, userData);
    LOG("OhAVMetadataExtractorFetchFrames avErrCode %{public}d", avErrCode);
    napi_create_int32(env, avErrCode, &result);
    free(timeUs);
    delete userData;
    userData = nullptr;
    return result;
}

static void OHAVMetadataExtractorOnFrameFetchedImplErr(OH_AVMetadataExtractor* extractor,
    const OH_AVMetadataExtractor_FrameInfo* frameInfo, OH_AVErrCode code, void* userData)
{
    LOG("OHAVMetadataExtractorOnFrameFetchedImpl code %{public}d", code);
    OHAVMetadataExtractorUserData* data = reinterpret_cast<OHAVMetadataExtractorUserData*>(userData);
    if (data == nullptr) {
        LOG("OHAVMetadataExtractorOnFrameFetchedImpl userData is nullptr");
        return;
    }
    if (frameInfo->requestTimeUs == -1) {
        return;
    }
    bool checkResult = CheckPixelMap(frameInfo->image, data->thumbnailWidth, data->thumbnailHeight);
    data->testResult = checkResult;
    return;
}

static napi_value OhAVMetadataExtractorFetchFramesByTimesErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 8;
    napi_value argv[8];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int64_t offset = 0;
    int32_t fileDescribe = -1;
    int64_t fileSize = 0;
    napi_get_value_int32(env, argv[PARAM_0], &fileDescribe);
    napi_get_value_int64(env, argv[PARAM_1], &offset);
    napi_get_value_int64(env, argv[PARAM_2], &fileSize);
    int32_t width;
    int32_t height;
    napi_get_value_int32(env, argv[PARAM_3], &width);
    napi_get_value_int32(env, argv[PARAM_4], &height);
    int32_t option;
    napi_get_value_int32(env, argv[PARAM_5], &option);
    uint32_t typeSize = 0;
    napi_get_array_length(env, argv[PARAM_6], &typeSize);
    int64_t *timeUs = static_cast<int64_t *>(malloc((typeSize + 1) * sizeof(int64_t)));
    if (timeUs == nullptr) {
        LOGE("OhAVMetadataExtractorFetchFrames malloc timeUs failed");
        return result;
    }
    int64_t num = 0;
    for (size_t i = 0; i < typeSize; i++) {
        napi_value item1;
        napi_get_element(env, argv[PARAM_6], i, &item1);
        napi_get_value_int64(env, item1, &num);
        timeUs[i] = num;
    }
    OHAVMetadataExtractorUserData *userData = new OHAVMetadataExtractorUserData();
    userData->mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVMetadataExtractor_SetFDSource(userData->mainExtractor, fileDescribe, offset, fileSize);
    userData->outputParams = OH_AVMetadataExtractor_OutputParam_Create();
    OH_AVMetadataExtractor_OutputParam_SetSize(userData->outputParams, width, height);
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_FetchFramesByTimes(userData->mainExtractor,
        timeUs, typeSize, static_cast<OH_AVMedia_SeekMode>(option), userData->outputParams,
        OHAVMetadataExtractorOnFrameFetchedImplErr, userData);
    int32_t res = 1;
    if (avErrCode == AV_ERR_SERVICE_DIED) {
        res = 0;
    }
    LOG("OhAVMetadataExtractorFetchFrames avErrCode %{public}d", avErrCode);
    napi_create_int32(env, res, &result);
    free(timeUs);
    delete userData;
    userData = nullptr;
    return result;
}

static void OHAVMetadataExtractorOnFrameFetchedImplErr1(OH_AVMetadataExtractor* extractor,
    const OH_AVMetadataExtractor_FrameInfo* frameInfo, OH_AVErrCode code, void* userData)
{
    LOG("OHAVMetadataExtractorOnFrameFetchedImpl code %{public}d", code);
    OHAVMetadataExtractorUserData* data = reinterpret_cast<OHAVMetadataExtractorUserData*>(userData);
    if (data == nullptr) {
        LOG("OHAVMetadataExtractorOnFrameFetchedImpl userData is nullptr");
        return;
    }
    if (frameInfo->actualTimeUs == -1) {
        return;
    }
    bool checkResult = CheckPixelMap(frameInfo->image, data->thumbnailWidth, data->thumbnailHeight);
    data->testResult = checkResult;
    return;
}

static napi_value OhAVMetadataExtractorFetchFramesByTimesErr1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 8;
    napi_value argv[8];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int64_t offset = 0;
    int32_t fileDescribe = -1;
    int64_t fileSize = 0;
    napi_get_value_int32(env, argv[PARAM_0], &fileDescribe);
    napi_get_value_int64(env, argv[PARAM_1], &offset);
    napi_get_value_int64(env, argv[PARAM_2], &fileSize);
    int32_t width;
    int32_t height;
    napi_get_value_int32(env, argv[PARAM_3], &width);
    napi_get_value_int32(env, argv[PARAM_4], &height);
    int32_t option;
    napi_get_value_int32(env, argv[PARAM_5], &option);
    uint32_t typeSize = 0;
    napi_get_array_length(env, argv[PARAM_6], &typeSize);
    int64_t *timeUs = static_cast<int64_t *>(malloc((typeSize + 1) * sizeof(int64_t)));
    if (timeUs == nullptr) {
        LOGE("OhAVMetadataExtractorFetchFrames malloc timeUs failed");
        return result;
    }
    int64_t num = 0;
    for (size_t i = 0; i < typeSize; i++) {
        napi_value item1;
        napi_get_element(env, argv[PARAM_6], i, &item1);
        napi_get_value_int64(env, item1, &num);
        timeUs[i] = num;
    }
    OHAVMetadataExtractorUserData *userData = new OHAVMetadataExtractorUserData();
    userData->mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVMetadataExtractor_SetFDSource(userData->mainExtractor, fileDescribe, offset, fileSize);
    userData->outputParams = OH_AVMetadataExtractor_OutputParam_Create();
    OH_AVMetadataExtractor_OutputParam_SetSize(userData->outputParams, width, height);
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_FetchFramesByTimes(userData->mainExtractor,
        timeUs, typeSize, static_cast<OH_AVMedia_SeekMode>(option), userData->outputParams,
        OHAVMetadataExtractorOnFrameFetchedImplErr1, userData);
    int32_t res = 1;
    if (avErrCode == AV_ERR_SERVICE_DIED) {
        res = 0;
    }
    LOG("OhAVMetadataExtractorFetchFrames avErrCode %{public}d", avErrCode);
    napi_create_int32(env, res, &result);
    free(timeUs);
    delete userData;
    userData = nullptr;
    return result;
}

static void OHAVMetadataExtractorOnFrameFetchedImplErr2(OH_AVMetadataExtractor* extractor,
    const OH_AVMetadataExtractor_FrameInfo* frameInfo, OH_AVErrCode code, void* userData)
{
    LOG("OHAVMetadataExtractorOnFrameFetchedImpl code %{public}d", code);
    OHAVMetadataExtractorUserData* data = reinterpret_cast<OHAVMetadataExtractorUserData*>(userData);
    if (data == nullptr) {
        LOG("OHAVMetadataExtractorOnFrameFetchedImpl userData is nullptr");
        return;
    }
    if (frameInfo->result == 0) {
        return;
    }
    bool checkResult = CheckPixelMap(frameInfo->image, data->thumbnailWidth, data->thumbnailHeight);
    data->testResult = checkResult;
    return;
}

static napi_value OhAVMetadataExtractorFetchFramesByTimesErr2(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 8;
    napi_value argv[8];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int64_t offset = 0;
    int32_t fileDescribe = -1;
    int64_t fileSize = 0;
    napi_get_value_int32(env, argv[PARAM_0], &fileDescribe);
    napi_get_value_int64(env, argv[PARAM_1], &offset);
    napi_get_value_int64(env, argv[PARAM_2], &fileSize);
    int32_t width;
    int32_t height;
    napi_get_value_int32(env, argv[PARAM_3], &width);
    napi_get_value_int32(env, argv[PARAM_4], &height);
    int32_t option;
    napi_get_value_int32(env, argv[PARAM_5], &option);
    uint32_t typeSize = 0;
    napi_get_array_length(env, argv[PARAM_6], &typeSize);
    int64_t *timeUs = static_cast<int64_t *>(malloc((typeSize + 1) * sizeof(int64_t)));
    if (timeUs == nullptr) {
        LOGE("OhAVMetadataExtractorFetchFrames malloc timeUs failed");
        return result;
    }
    int64_t num = 0;
    for (size_t i = 0; i < typeSize; i++) {
        napi_value item1;
        napi_get_element(env, argv[PARAM_6], i, &item1);
        napi_get_value_int64(env, item1, &num);
        timeUs[i] = num;
    }
    OHAVMetadataExtractorUserData *userData = new OHAVMetadataExtractorUserData();
    userData->mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVMetadataExtractor_SetFDSource(userData->mainExtractor, fileDescribe, offset, fileSize);
    userData->outputParams = OH_AVMetadataExtractor_OutputParam_Create();
    OH_AVMetadataExtractor_OutputParam_SetSize(userData->outputParams, width, height);
    OH_AVErrCode avErrCode = OH_AVMetadataExtractor_FetchFramesByTimes(userData->mainExtractor,
        timeUs, typeSize, static_cast<OH_AVMedia_SeekMode>(option), userData->outputParams,
        OHAVMetadataExtractorOnFrameFetchedImplErr2, userData);
    int32_t res = 1;
    if (avErrCode == AV_ERR_SERVICE_DIED) {
        res = 0;
    }
    LOG("OhAVMetadataExtractorFetchFrames avErrCode %{public}d", avErrCode);
    napi_create_int32(env, res, &result);
    free(timeUs);
    delete userData;
    userData = nullptr;
    return result;
}

static napi_value OHAVMetadataExtractorUserDataGetTestResult(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    OHAVMetadataExtractorUserData *data = reinterpret_cast<OHAVMetadataExtractorUserData *>(ptr);
    napi_get_boolean(env, data->testResult, &result);
    delete data;
    data = nullptr;
    return result;
}

static napi_value OhAVMetadataExtractorCancelAllFetchFrames(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVMetadataExtractor_CancelAllFetchFrames(mainExtractor);
    napi_create_int32(env, 0, &result);
    return result;
}
static napi_value OhAvMetadataExtractorSetMediaSourceError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value argv[PARAM_1];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t params = -1;
    napi_get_value_int32(env, argv[PARAM_0], &params);
    OH_AVErrCode errCode;
    OH_AVMetadataExtractor* mainExtractor = OH_AVMetadataExtractor_Create();
    OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
    OH_AVMediaSource* mediaSource = OH_AVMediaSource_CreateWithUrl("http://example.com/video.mp4", header);
    if (params == 0) {
        errCode = OH_AVMetadataExtractor_SetMediaSource(nullptr, mediaSource);
    } else {
        errCode = OH_AVMetadataExtractor_SetMediaSource(mainExtractor, nullptr);
    }
    OH_AVHttpHeader_Destroy(header);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NAPI_OH_AVMetadataExtractorFetchState(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t faile = 0;
    int32_t succeeded = 1;
    int32_t canceled = 2;
    int32_t res = 1;
    if (OH_AVMetadataExtractor_FetchState::OH_AVMETADATA_EXTRACTOR_FETCH_FAILED == faile &&
        OH_AVMetadataExtractor_FetchState::OH_AVMETADATA_EXTRACTOR_FETCH_SUCCEEDED == succeeded &&
        OH_AVMetadataExtractor_FetchState::OH_AVMETADATA_EXTRACTOR_FETCH_CANCELED == canceled) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_OH_AVMediaSeekMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t previous = 1;
    int32_t closestsync = 2;
    int32_t closest = 3;
    int32_t res = 1;
    if (OH_AVMedia_SeekMode::OH_AVMEDIA_SEEK_PREVIOUS_SYNC == previous &&
        OH_AVMedia_SeekMode::OH_AVMEDIA_SEEK_CLOSEST_SYNC == closestsync &&
        OH_AVMedia_SeekMode::OH_AVMEDIA_SEEK_CLOSEST == closest) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
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
        {"OhAvMetadataExtractorPixelMapParamsCreate", nullptr, OhAvMetadataExtractorPixelMapParamsCreate, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAvMetadataExtractorPixelMapParamsSetSize", nullptr, OhAvMetadataExtractorPixelMapParamsSetSize, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAvMetadataExtractorFetchFrameByTime", nullptr, OhAvMetadataExtractorFetchFrameByTime, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OhAvMetadataExtractorGetCustomInfo", nullptr, OhAvMetadataExtractorGetCustomInfo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OhAvMetadataExtractorGetTrackDescription", nullptr, OhAvMetadataExtractorGetTrackDescription, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAvMetadataExtractorFetchFileMetadata", nullptr, OhAvMetadataExtractorFetchFileMetadata, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OhAvMetadataExtractorGetRefTrackMetaData", nullptr, OhAvMetadataExtractorGetRefTrackMetaData, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorOutputParamsSetSizeError", nullptr, OhAVMetadataExtractorOutputParamsSetSizeError,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorFetchFrameByTimeError", nullptr, OhAVMetadataExtractorFetchFrameByTimeError, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorGetTrackDescriptionError", nullptr, OhAVMetadataExtractorGetTrackDescriptionError,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorGetCustomInfoError", nullptr, OhAVMetadataExtractorGetCustomInfoError, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAvMetadataExtractorSetUrlMediaSource", nullptr, OhAvMetadataExtractorSetUrlMediaSource, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAvMetadataExtractorSetFdMediaSource", nullptr, OhAvMetadataExtractorSetFdMediaSource, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAvMetadataExtractorSetDataSourceMediaSource", nullptr, OhAvMetadataExtractorSetDataSourceMediaSource,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorFetchFramesByTimes", nullptr, OhAVMetadataExtractorFetchFramesByTimes, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorFetchFramesByTimesErr", nullptr, OhAVMetadataExtractorFetchFramesByTimesErr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorFetchFramesByTimesErr1", nullptr, OhAVMetadataExtractorFetchFramesByTimesErr1, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorFetchFramesByTimesErr2", nullptr, OhAVMetadataExtractorFetchFramesByTimesErr2, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OHAVMetadataExtractorUserDataGetTestResult", nullptr, OHAVMetadataExtractorUserDataGetTestResult, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorCancelAllFetchFrames", nullptr, OhAVMetadataExtractorCancelAllFetchFrames, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorSetMediaSourceError", nullptr, OhAvMetadataExtractorSetMediaSourceError, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMetadataExtractorFetchState", nullptr, NAPI_OH_AVMetadataExtractorFetchState, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVMediaSeekMode", nullptr, NAPI_OH_AVMediaSeekMode, nullptr,
            nullptr, nullptr, napi_default, nullptr},
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