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

#include "AVSession/AVSession_Test.h"
#include "common/Common.h"
#include <multimedia/av_session/native_avqueueitem.h>
#include <multimedia/av_session/native_avsession.h>
#include <multimedia/av_session/native_avsession_errors.h>

static int32_t g_trueValue = PARAM_1;
static int32_t g_falseValue = PARAM_0;
static int32_t g_errorCode401 = PARAM_401;

napi_value AVMediaDescriptionBuilderCreateSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder **builderPtr = &builder;
    int32_t createResult = OH_AVSession_AVMediaDescriptionBuilder_Create(builderPtr);
    napi_value retValue;
    if (createResult == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderCreateInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder **builderPtr = nullptr;
    int32_t createResult = OH_AVSession_AVMediaDescriptionBuilder_Create(builderPtr);
    napi_value retValue;
    if (createResult == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderDestroySuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder **builderPtr = &builder;
    OH_AVSession_AVMediaDescriptionBuilder_Create(builderPtr);
    int32_t destroyResult = OH_AVSession_AVMediaDescriptionBuilder_Destroy(builder);
    napi_value retValue;
    if (destroyResult == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder **builderPtr = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(builderPtr);
    int32_t destroyResult = OH_AVSession_AVMediaDescriptionBuilder_Destroy(builder);
    napi_value retValue;
    if (destroyResult == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetAssetIdSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *assetId = "assetId001";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetAssetId(builder, assetId);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetAssetIdInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *assetId = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetAssetId(builder, assetId);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetTitleSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *title = "title001";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetTitle(builder, title);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetTitleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *title = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetTitle(builder, title);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetSubTitleSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *subtitle = "subtitle001";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetSubTitle(builder, subtitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetSubTitleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *subtitle = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetSubTitle(builder, subtitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetArtistSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *artist = "artist001";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetArtist(builder, artist);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetArtistInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *artist = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetArtist(builder, artist);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetAlbumCoverUriSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *albumCoverUri = "http://example.com/albumCover001.jpg";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetAlbumCoverUri(builder, albumCoverUri);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetAlbumCoverUriInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *albumCoverUri = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetAlbumCoverUri(builder, albumCoverUri);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetMediaTypeSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *mediaType = "mediaType001";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetMediaType(builder, mediaType);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetMediaTypeInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *mediaType = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetMediaType(builder, mediaType);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetLyricContentSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *lyricContent = "lyricContent001";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetLyricContent(builder, lyricContent);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetLyricContentInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *lyricContent = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetLyricContent(builder, lyricContent);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetDurationSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    int32_t duration = 3000;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetDuration(builder, duration);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetDurationInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    int32_t duration = -1;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetDuration(builder, duration);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetMediaUriSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *mediaUri = "http://example.com/media001.mp4";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetMediaUri(builder, mediaUri);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetMediaUriInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *mediaUri = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetMediaUri(builder, mediaUri);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetStartPositionSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    int32_t startPosition = 1000;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetStartPosition(builder, startPosition);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetStartPositionInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    int32_t startPosition = -1;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetStartPosition(builder, startPosition);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetMediaSizeSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    int32_t mediaSize = 5000000;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetMediaSize(builder, mediaSize);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetMediaSizeInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    int32_t mediaSize = -1;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetMediaSize(builder, mediaSize);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetAlbumTitleSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *albumTitle = "albumTitle001";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetAlbumTitle(builder, albumTitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetAlbumTitleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *albumTitle = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetAlbumTitle(builder, albumTitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetAppNameSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *appName = "appName001";
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetAppName(builder, appName);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderSetAppNameInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    const char *appName = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_SetAppName(builder, appName);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderGenerateAVMediaDescriptionSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionBuilderGenerateAVMediaDescriptionInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    int32_t result = OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetAssetIdSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *assetId = "assetId001";
    OH_AVSession_AVMediaDescriptionBuilder_SetAssetId(builder, assetId);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getAssetId = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetAssetId(avMediaDescription, &getAssetId);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetAssetIdInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getAssetId = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetAssetId(avMediaDescription, &getAssetId);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetTitleSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *title = "title001";
    OH_AVSession_AVMediaDescriptionBuilder_SetTitle(builder, title);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getTitle = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetTitle(avMediaDescription, &getTitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetTitleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getTitle = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetTitle(avMediaDescription, &getTitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetSubTitleSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *subTitle = "subTitle001";
    OH_AVSession_AVMediaDescriptionBuilder_SetSubTitle(builder, subTitle);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getSubTitle = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetSubtitle(avMediaDescription, &getSubTitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetSubTitleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getSubTitle = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetSubtitle(avMediaDescription, &getSubTitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetArtistSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *artist = "artist001";
    OH_AVSession_AVMediaDescriptionBuilder_SetArtist(builder, artist);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getArtist = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetArtist(avMediaDescription, &getArtist);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetArtistInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getArtist = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetArtist(avMediaDescription, &getArtist);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetAlbumCoverUriSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *albumCoverUri = "albumCoverUri001";
    OH_AVSession_AVMediaDescriptionBuilder_SetAlbumCoverUri(builder, albumCoverUri);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getAlbumCoverUri = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetAlbumCoverUri(avMediaDescription, &getAlbumCoverUri);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetAlbumCoverUriInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getAlbumCoverUri = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetAlbumCoverUri(avMediaDescription, &getAlbumCoverUri);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetMediaTypeSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *mediaType = "mediaType001";
    OH_AVSession_AVMediaDescriptionBuilder_SetMediaType(builder, mediaType);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getMediaType = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetMediaType(avMediaDescription, &getMediaType);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetMediaTypeInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getMediaType = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetMediaType(avMediaDescription, &getMediaType);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetLyricContentSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *lyricContent = "lyricContent001";
    OH_AVSession_AVMediaDescriptionBuilder_SetLyricContent(builder, lyricContent);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getLyricContent = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetLyricContent(avMediaDescription, &getLyricContent);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetLyricContentInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getLyricContent = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetLyricContent(avMediaDescription, &getLyricContent);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetDurationSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    int32_t duration = 1000000;
    OH_AVSession_AVMediaDescriptionBuilder_SetDuration(builder, duration);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    int32_t getDuration = 0;
    int32_t result = OH_AVSession_AVMediaDescription_GetDuration(avMediaDescription, &getDuration);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetDurationInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    int32_t getDuration = 0;
    int32_t result = OH_AVSession_AVMediaDescription_GetDuration(avMediaDescription, &getDuration);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetMediaUriSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *mediaUri = "mediaUri001";
    OH_AVSession_AVMediaDescriptionBuilder_SetMediaUri(builder, mediaUri);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getMediaUri = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetMediaUri(avMediaDescription, &getMediaUri);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetMediaUriInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getMediaUri = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetMediaUri(avMediaDescription, &getMediaUri);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetStartPositionSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    int32_t startPosition = 1000;
    OH_AVSession_AVMediaDescriptionBuilder_SetStartPosition(builder, startPosition);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    int32_t getStartPosition = 0;
    int32_t result = OH_AVSession_AVMediaDescription_GetStartPosition(avMediaDescription, &getStartPosition);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetStartPositionInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    int32_t getStartPosition = 0;
    int32_t result = OH_AVSession_AVMediaDescription_GetStartPosition(avMediaDescription, &getStartPosition);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetMediaSizeSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    int32_t mediaSize = 5000000;
    OH_AVSession_AVMediaDescriptionBuilder_SetMediaSize(builder, mediaSize);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    int32_t getMediaSize = 0;
    int32_t result = OH_AVSession_AVMediaDescription_GetMediaSize(avMediaDescription, &getMediaSize);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetMediaSizeInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    int32_t getMediaSize = 0;
    int32_t result = OH_AVSession_AVMediaDescription_GetMediaSize(avMediaDescription, &getMediaSize);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetAlbumTitleSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *albumTitle = "albumTitle001";
    OH_AVSession_AVMediaDescriptionBuilder_SetAlbumTitle(builder, albumTitle);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getAlbumTitle = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetAlbumTitle(avMediaDescription, &getAlbumTitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetAlbumTitleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getAlbumTitle = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetAlbumTitle(avMediaDescription, &getAlbumTitle);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetAppNameSuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    const char *appName = "appName001";
    OH_AVSession_AVMediaDescriptionBuilder_SetAppName(builder, appName);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    char *getAppName = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetAppName(avMediaDescription, &getAppName);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionGetAppNameInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    char *getAppName = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_GetAppName(avMediaDescription, &getAppName);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionDestroySuccess(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &avMediaDescription);
    int32_t result = OH_AVSession_AVMediaDescription_Destroy(avMediaDescription);
    napi_value retValue;
    if (result == AVQUEUEITEM_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMediaDescriptionDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVSession_AVMediaDescription *avMediaDescription = nullptr;
    int32_t result = OH_AVSession_AVMediaDescription_Destroy(avMediaDescription);
    napi_value retValue;
    if (result == AVQUEUEITEM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}