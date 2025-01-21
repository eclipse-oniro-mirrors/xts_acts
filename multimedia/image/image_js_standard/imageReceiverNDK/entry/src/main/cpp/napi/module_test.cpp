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

#include "napi/native_api.h"
#include "camera_manager_ndk.h"
#include "image_receiver_module_test.h"
#include <js_native_api.h>
#include "camera.h"
#include <cstring>
#include "hilog/log.h"

static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_4 = 4;

static NDKCamera* ndkCamera_ = nullptr;
static ImageReceiverModuleTest* imageReceiverTest_ = nullptr;

struct Capture_Setting {
    int32_t quality;
    int32_t rotation;
    int32_t location;
    bool mirror;
    int32_t latitude;
    int32_t longitude;
    int32_t altitude;
};

static napi_value InitCamera(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    size_t typeLen = 0;
    char* surfaceId = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    surfaceId = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[0], surfaceId, typeLen + 1, &typeLen);

    int32_t  cameraDeviceIndex;
    napi_get_value_int32(env, args[1], &cameraDeviceIndex);

    ndkCamera_ = new NDKCamera(surfaceId);
    imageReceiverTest_ = new ImageReceiverModuleTest();
    napi_create_int32(env, CAMERA_OK, &result);
    return result;
}

static napi_value VideoOutputStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->VideoOutputStart();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetSupportedCameras(napi_env env, napi_callback_info info)
{
    ndkCamera_->GetSupportedCameras();

    napi_value cameraInfo = nullptr;
    napi_create_object(env, &cameraInfo);

    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->cameras_->cameraPosition, &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraPosition", jsValue);

    napi_create_int32(env, ndkCamera_->cameras_->cameraType, &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraType", jsValue);

    napi_create_int32(env, ndkCamera_->cameras_->connectionType, &jsValue);
    napi_set_named_property(env, cameraInfo, "connectionType", jsValue);

    napi_create_string_utf8(env, ndkCamera_->cameras_->cameraId, sizeof(ndkCamera_->cameras_->cameraId) + 1, &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraId", jsValue);

    return cameraInfo;
}


static napi_value CreateCameraInput(napi_env env, napi_callback_info info)
{
    napi_value result;
    Camera_ErrorCode ret = ndkCamera_->CreateCameraInput();
    napi_create_int32(env, ret, &result);
    return result;
}

static Camera_Position GetPosition(int position)
{
    switch (position) {
        case 1:
            return Camera_Position::CAMERA_POSITION_BACK;
        case 2: // 2:Camera_Position::CAMERA_POSITION_FRONT
            return Camera_Position::CAMERA_POSITION_FRONT;
        default:
            return Camera_Position::CAMERA_POSITION_UNSPECIFIED;
    }
}

static Camera_Type GetType(int type)
{
    switch (type) {
        case 1:
            return Camera_Type::CAMERA_TYPE_WIDE_ANGLE;
        case 2: // 2:Camera_Type::CAMERA_TYPE_ULTRA_WIDE
            return Camera_Type::CAMERA_TYPE_ULTRA_WIDE;
        case 3: // 3:Camera_Type::CAMERA_TYPE_TELEPHOTO
            return Camera_Type::CAMERA_TYPE_TELEPHOTO;
        case 4: // 4:Camera_Type::CAMERA_TYPE_TRUE_DEPTH
            return Camera_Type::CAMERA_TYPE_TRUE_DEPTH;
        default:
            return Camera_Type::CAMERA_TYPE_DEFAULT;
    }
}

static napi_value CreateCameraInputWithPositionAndType(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int x;
    napi_get_value_int32(env, args[0], &x);

    napi_valuetype valuetype1;
    napi_typeof(env, args[0], &valuetype1);
    int y;
    napi_get_value_int32(env, args[1], &y);

    Camera_Position position = GetPosition(x);
    Camera_Type type = GetType(y);
    Camera_ErrorCode ret = ndkCamera_->CreateCameraInputWithPositionAndType(position, type);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetSupportedOutputCapability(napi_env env, napi_callback_info info)
{
    ndkCamera_->GetSupportedOutputCapability();

    napi_value cameraOutputCapability = nullptr;
    napi_create_object(env, &cameraOutputCapability);

    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->cameraOutputCapability_->previewProfilesSize, &jsValue);
    napi_set_named_property(env, cameraOutputCapability, "previewProfilesSize", jsValue);

    napi_create_int32(env, ndkCamera_->cameraOutputCapability_->photoProfilesSize, &jsValue);
    napi_set_named_property(env, cameraOutputCapability, "photoProfilesSize", jsValue);

    napi_create_int32(env, ndkCamera_->cameraOutputCapability_->videoProfilesSize, &jsValue);
    napi_set_named_property(env, cameraOutputCapability, "videoProfilesSize", jsValue);

    napi_create_int32(env, ndkCamera_->cameraOutputCapability_->metadataProfilesSize, &jsValue);
    napi_set_named_property(env, cameraOutputCapability, "metadataProfilesSize", jsValue);

    return cameraOutputCapability;
}

static napi_value CreatePreviewOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CreatePreviewOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static void OnBufferAvaliable(OH_ImageReceiverNative*)
{
    OH_ImageNative *image = nullptr;
    imageReceiverTest_->GetImageReceiverLatestImage(&image);
    if (image != nullptr) {
        imageReceiverTest_->DumpImageInfo(image);
        imageReceiverTest_->ReleaseImage(image);
    }
    return;
}

static napi_value CreatePhotoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    size_t argc = 4;
    napi_value args[NUM_4] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t width = 0;
    int32_t height = 0;
    int32_t capacity = 0;
    napi_get_value_int32(env, args[NUM_0], &width);
    napi_get_value_int32(env, args[NUM_1], &height);
    napi_get_value_int32(env, args[NUM_2], &capacity);

    Image_ErrorCode res = imageReceiverTest_->CreateImageReceiver(width, height, capacity);
    if (res != IMAGE_SUCCESS) {
        napi_create_int32(env, res, &result);
        return result;
    }
    res = imageReceiverTest_->RegisterImageReceiverListener(OnBufferAvaliable);
    if (res != IMAGE_SUCCESS) {
        napi_create_int32(env, res, &result);
        return result;
    }
    res = imageReceiverTest_->VerifyImageReceiver();
    if (res != IMAGE_SUCCESS) {
        napi_create_int32(env, res, &result);
        return result;
    }
    uint64_t id = 0;
    res = imageReceiverTest_->GetImageReceiverSurfaceId(&id);
    if (res != IMAGE_SUCCESS) {
        napi_create_int32(env, res, &result);
        return result;
    }
    std::string surfaceId = std::to_string(id);

    Camera_ErrorCode ret = ndkCamera_->CreatePhotoOutput(surfaceId.c_str());
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value CreateVideoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    size_t videoIdLen = 0;
    char* videoId = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &videoIdLen);
    videoId = new char[videoIdLen + 1];
    napi_get_value_string_utf8(env, args[0], videoId, videoIdLen + 1, &videoIdLen);
    Camera_ErrorCode ret = ndkCamera_->CreateVideoOutput(videoId);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CreateMetadataOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CreateMetadataOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value IsCameraMuted(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->IsCameraMuted();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraInputOpen(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CameraInputOpen();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraInputClose(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CameraInputClose();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraInputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CameraInputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PreviewOutputStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PreviewOutputStart();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PreviewOutputStop(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PreviewOutputStop();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PreviewOutputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PreviewOutputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PhotoOutputCapture(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PhotoOutputCapture();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PhotoOutputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PhotoOutputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value IsMirrorSupported(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->IsMirrorSupported();
    napi_get_boolean(env, ndkCamera_->IsMirror_, &result);
    return result;
}

static napi_value VideoOutputStop(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->VideoOutputStop();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value VideoOutputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->VideoOutputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MetadataOutputStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->MetadataOutputStart();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MetadataOutputStop(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->MetadataOutputStop();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MetadataOutputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->MetadataOutputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddInput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddInput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemoveInput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemoveInput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddPreviewOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddPreviewOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddPhotoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddPhotoOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddVideoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddVideoOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddMetadataOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddMetadataOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemovePreviewOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemovePreviewOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemovePhotoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemovePhotoOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemoveVideoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemoveVideoOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemoveMetadataOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemoveMetadataOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionStart();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionStop(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionStop();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionBegin(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionBegin();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionCommitConfig(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionCommitConfig();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CreateSession(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CreateSession();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionHasFlash(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionHasFlash();
    napi_get_boolean(env, ndkCamera_->HasFlash_, &result);
    return result;
}

static napi_value SessionIsFlashModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t flashMode;
    napi_get_value_int32(env, args[0], &flashMode);

    ndkCamera_->SessionIsFlashModeSupported(flashMode);
    napi_get_boolean(env, ndkCamera_->IsFlashMode_, &result);
    return result;
}

static napi_value SessionGetFlashMode(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetFlashMode();
    Camera_FlashMode flashMode = ndkCamera_->flashMode_;
    napi_create_int32(env, flashMode, &result);
    return result;
}

static napi_value SessionSetFlashMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t flashMode;
    napi_get_value_int32(env, args[0], &flashMode);
    Camera_ErrorCode ret = ndkCamera_->SessionSetFlashMode(flashMode);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionIsExposureModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t exposureMode;
    napi_get_value_int32(env, args[0], &exposureMode);

    ndkCamera_->SessionIsExposureModeSupported(exposureMode);
    napi_get_boolean(env, ndkCamera_->IsExposureMode_, &result);
    return result;
}

static napi_value SessionGetExposureMode(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetExposureMode();
    Camera_ExposureMode exposureMode = ndkCamera_->exposureMode_;
    napi_create_int32(env, exposureMode, &result);
    return result;
}

static napi_value SessionSetExposureMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t exposureMode;
    napi_get_value_int32(env, args[0], &exposureMode);
    Camera_ErrorCode ret = ndkCamera_->SessionSetExposureMode(exposureMode);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetMeteringPoint(napi_env env, napi_callback_info info)
{
    ndkCamera_->SessionGetMeteringPoint();
    Camera_Point point = ndkCamera_->point_;
    napi_value Point = nullptr;
    napi_create_object(env, &Point);

    napi_value jsValue = nullptr;
    napi_create_double(env, point.x, &jsValue);
    napi_set_named_property(env, Point, "x", jsValue);

    napi_create_double(env, point.y, &jsValue);
    napi_set_named_property(env, Point, "y", jsValue);

    return Point;
}

static napi_value SessionSetMeteringPoint(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value value = nullptr;
    napi_get_named_property(env, args[0], "x", &value);
    double x;
    napi_get_value_double(env, value, &x);

    napi_get_named_property(env, args[0], "y", &value);
    double y;
    napi_get_value_double(env, value, &y);

    Camera_ErrorCode ret = ndkCamera_->SessionSetMeteringPoint(x, y);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetExposureBiasRange(napi_env env, napi_callback_info info)
{
    ndkCamera_->SessionGetExposureBiasRange();
    napi_value exposureBias = nullptr;
    napi_create_object(env, &exposureBias);

    napi_value jsValue = nullptr;

    napi_create_double(env, ndkCamera_->minExposureBias_, &jsValue);
    napi_set_named_property(env, exposureBias, "minExposureBias", jsValue);

    napi_create_double(env, ndkCamera_->maxExposureBias_, &jsValue);
    napi_set_named_property(env, exposureBias, "maxExposureBias", jsValue);

    return exposureBias;
}

static napi_value SessionSetExposureBias(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double exposureBias;
    napi_get_value_double(env, args[0], &exposureBias);
    Camera_ErrorCode ret = ndkCamera_->SessionSetExposureBias(exposureBias);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetExposureBias(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetExposureBias();
    double exposureBias = ndkCamera_->exposureBias_;
    napi_create_double(env, exposureBias, &result);
    return result;
}

static napi_value SessionIsFocusModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t focusMode;
    napi_get_value_int32(env, args[0], &focusMode);

    ndkCamera_->SessionIsFocusModeSupported(focusMode);
    napi_get_boolean(env, ndkCamera_->isFocusSupported_, &result);
    return result;
}

static napi_value SessionGetFocusMode(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetFocusMode();
    Camera_FocusMode focusMode = ndkCamera_->focusMode_;
    napi_create_int32(env, focusMode, &result);
    return result;
}

static napi_value SessionSetFocusMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t focusMode;
    napi_get_value_int32(env, args[0], &focusMode);
    Camera_ErrorCode ret = ndkCamera_->SessionSetFocusMode(focusMode);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionSetFocusPoint(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value value = nullptr;
    napi_get_named_property(env, args[0], "x", &value);
    double x;
    napi_get_value_double(env, value, &x);

    napi_get_named_property(env, args[0], "y", &value);
    double y;
    napi_get_value_double(env, value, &y);

    Camera_ErrorCode ret = ndkCamera_->SessionSetFocusPoint(x, y);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetFocusPoint(napi_env env, napi_callback_info info)
{
    ndkCamera_->SessionGetFocusPoint();
    Camera_Point point = ndkCamera_->focusPoint_;
    napi_value Point = nullptr;
    napi_create_object(env, &Point);

    napi_value jsValue = nullptr;
    napi_create_double(env, point.x, &jsValue);
    napi_set_named_property(env, Point, "x", jsValue);

    napi_create_double(env, point.y, &jsValue);
    napi_set_named_property(env, Point, "y", jsValue);

    return Point;
}

static napi_value SessionGetZoomRatioRange(napi_env env, napi_callback_info info)
{
    ndkCamera_->SessionGetZoomRatioRange();

    napi_value zoomRatio = nullptr;
    napi_create_object(env, &zoomRatio);

    napi_value jsValue = nullptr;

    napi_create_double(env, ndkCamera_->minZoom_, &jsValue);
    napi_set_named_property(env, zoomRatio, "minZoom", jsValue);

    napi_create_double(env, ndkCamera_->maxZoom_, &jsValue);
    napi_set_named_property(env, zoomRatio, "maxZoom", jsValue);

    return zoomRatio;
}

static napi_value SessionGetZoomRatio(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetZoomRatio();
    napi_create_double(env, ndkCamera_->zoom_, &result);
    return result;
}

static napi_value SessionSetZoomRatio(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double zoomRatio;
    napi_get_value_double(env, args[0], &zoomRatio);
    Camera_ErrorCode ret = ndkCamera_->SessionSetZoomRatio(zoomRatio);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionIsVideoStabilizationModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t videoStabilizationMode;
    napi_get_value_int32(env, args[0], &videoStabilizationMode);
    ndkCamera_->SessionIsVideoStabilizationModeSupported(videoStabilizationMode);
    napi_get_boolean(env, ndkCamera_->isVideoSupported_, &result);
    return result;
}

static napi_value SessionGetVideoStabilizationMode(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetVideoStabilizationMode();
    Camera_VideoStabilizationMode videoMode = ndkCamera_->videoMode_;
    napi_create_int32(env, videoMode, &result);
    return result;
}

static napi_value SessionSetVideoStabilizationMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t videoStabilizationMode;
    napi_get_value_int32(env, args[0], &videoStabilizationMode);
    Camera_ErrorCode ret = ndkCamera_->SessionSetVideoStabilizationMode(videoStabilizationMode);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetCameraCallbackCode(napi_env env, napi_callback_info info)
{
    napi_value result;

    CameraCallbackCode status  = ndkCamera_->cameraCallbackCode_;
    napi_create_int32(env, status, &result);
    return result;
}

static napi_value GetCaptureParam(napi_env env, napi_value captureConfigValue, Capture_Setting *config)
{
    napi_value value = nullptr;
    napi_get_named_property(env, captureConfigValue, "quality", &value);
    napi_get_value_int32(env, value, &config->quality);

    napi_get_named_property(env, captureConfigValue, "rotation", &value);
    napi_get_value_int32(env, value, &config->rotation);

    napi_get_named_property(env, captureConfigValue, "mirror", &value);
    napi_get_value_bool(env, value, &config->mirror);

    napi_get_named_property(env, captureConfigValue, "latitude", &value);
    napi_get_value_int32(env, value, &config->latitude);

    napi_get_named_property(env, captureConfigValue, "longitude", &value);
    napi_get_value_int32(env, value, &config->longitude);

    napi_get_named_property(env, captureConfigValue, "altitude", &value);
    napi_get_value_int32(env, value, &config->altitude);

    return 0;
}

static void SetConfig(Capture_Setting settings, Camera_PhotoCaptureSetting* photoSetting, Camera_Location* location)
{
    if (photoSetting == nullptr || location == nullptr) {
        return;
    }
    photoSetting->quality = static_cast<Camera_QualityLevel>(settings.quality);
    photoSetting->rotation = static_cast<Camera_ImageRotation>(settings.rotation);
    photoSetting->mirror = settings.mirror;
    location->altitude = settings.altitude;
    location->latitude = settings.latitude;
    location->longitude = settings.longitude;
    photoSetting->location = location;
}

static napi_value TakePictureWithSettings(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    Camera_PhotoCaptureSetting photoSetting;
    Capture_Setting setting_inner;
    Camera_Location* location = new Camera_Location;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    GetCaptureParam(env, args[0], &setting_inner);
    SetConfig(setting_inner, &photoSetting, location);

    napi_value result;
    Camera_ErrorCode ret = ndkCamera_->TakePictureWithPhotoSettings(photoSetting);
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "initCamera", nullptr, InitCamera, nullptr, nullptr, nullptr, napi_default, nullptr },

        { "getSupportedCameras", nullptr, GetSupportedCameras, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createCameraInput", nullptr, CreateCameraInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createCameraInputWithPositionAndType", nullptr, CreateCameraInputWithPositionAndType, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getSupportedOutputCapability", nullptr, GetSupportedOutputCapability, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "createPreviewOutput", nullptr, CreatePreviewOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createPhotoOutput", nullptr, CreatePhotoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createVideoOutput", nullptr, CreateVideoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createMetadataOutput", nullptr, CreateMetadataOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createSession", nullptr, CreateSession, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "isCameraMuted", nullptr, IsCameraMuted, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputOpen", nullptr, CameraInputOpen, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputClose", nullptr, CameraInputClose, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputRelease", nullptr, CameraInputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStart", nullptr, PreviewOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStop", nullptr, PreviewOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputRelease", nullptr, PreviewOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "photoOutputCapture", nullptr, PhotoOutputCapture, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "photoOutputRelease", nullptr, PhotoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "isMirrorSupported", nullptr, IsMirrorSupported, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputStart", nullptr, VideoOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputStop", nullptr, VideoOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputRelease", nullptr, VideoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputStart", nullptr, MetadataOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputStop", nullptr, MetadataOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputRelease", nullptr, MetadataOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStop", nullptr, PreviewOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddInput", nullptr, SessionAddInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionRemoveInput", nullptr, SessionRemoveInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddPreviewOutput", nullptr, SessionAddPreviewOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionAddPhotoOutput", nullptr, SessionAddPhotoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddVideoOutput", nullptr, SessionAddVideoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddMetadataOutput", nullptr, SessionAddMetadataOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemovePreviewOutput", nullptr, SessionRemovePreviewOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemovePhotoOutput", nullptr, SessionRemovePhotoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemoveVideoOutput", nullptr, SessionRemoveVideoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemoveMetadataOutput", nullptr, SessionRemoveMetadataOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionStart", nullptr, SessionStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionStop", nullptr, SessionStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionBegin", nullptr, SessionBegin, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionCommitConfig", nullptr, SessionCommitConfig, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRelease", nullptr, SessionRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionHasFlash", nullptr, SessionHasFlash, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsFlashModeSupported", nullptr, SessionIsFlashModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetFlashMode", nullptr, SessionGetFlashMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFlashMode", nullptr, SessionSetFlashMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsExposureModeSupported", nullptr, SessionIsExposureModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetExposureMode", nullptr, SessionGetExposureMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetExposureMode", nullptr, SessionSetExposureMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetMeteringPoint", nullptr, SessionGetMeteringPoint, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetMeteringPoint", nullptr, SessionSetMeteringPoint, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetExposureBiasRange", nullptr, SessionGetExposureBiasRange, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetExposureBias", nullptr, SessionSetExposureBias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetExposureBias", nullptr, SessionGetExposureBias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsFocusModeSupported", nullptr, SessionIsFocusModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetFocusMode", nullptr, SessionGetFocusMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFocusMode", nullptr, SessionSetFocusMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFocusPoint", nullptr, SessionSetFocusPoint, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetFocusPoint", nullptr, SessionGetFocusPoint, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetZoomRatioRange", nullptr, SessionGetZoomRatioRange, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetZoomRatio", nullptr, SessionGetZoomRatio, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetZoomRatio", nullptr, SessionSetZoomRatio, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsVideoStabilizationModeSupported", nullptr, SessionIsVideoStabilizationModeSupported,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetVideoStabilizationMode", nullptr, SessionGetVideoStabilizationMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetVideoStabilizationMode", nullptr, SessionSetVideoStabilizationMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "getCameraCallbackCode", nullptr, GetCameraCallbackCode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "takePictureWithSettings", nullptr, TakePictureWithSettings, nullptr, nullptr, nullptr,
            napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
