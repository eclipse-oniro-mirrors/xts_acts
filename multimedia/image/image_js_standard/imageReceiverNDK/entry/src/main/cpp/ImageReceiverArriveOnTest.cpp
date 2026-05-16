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

#include "napi/native_api.h"
#include <hilog/log.h>
#include "native_color_space_manager/native_color_space_manager.h"
#include <multimedia/image_framework/image/image_native.h>
#include <multimedia/image_framework/image/image_receiver_native.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <native_buffer/buffer_common.h>
#include <cstdint>
#include <unistd.h>
#include <string>
#include <thread>
#include <chrono>
#include <mutex>
#include <memory>
#include <vector>
#include <condition_variable>

#include "ohcamera/camera.h"
#include "ohcamera/camera_input.h"
#include "ohcamera/capture_session.h"
#include "ohcamera/photo_output.h"
#include "ohcamera/preview_output.h"
#include "ohcamera/video_output.h"
#include "ohcamera/camera_manager.h"

#undef LOG_DOMAIN
#define LOG_DOMAIN 0x3200

#undef LOG_TAG
#define LOG_TAG "MY_TAG"

#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 480
#define IMAGE_CAPACITY 2
#define MAX_PATH_SIZE 1024
#define UNSUPPORTED_CAMERA_FORMAT (-1)

#define DECLARE_NAPI_FUNCTION(name, func)                                                                              \
    {                                                                                                                  \
        (name), nullptr, (func), nullptr, nullptr, nullptr, napi_default, nullptr                                      \
    }

static constexpr int32_t NUM_0 = 0;
static constexpr int32_t NUM_1 = 1;
static constexpr int32_t NUM_2 = 2;
static constexpr int32_t NUM_3 = 3;
static constexpr int32_t NUM_4 = 4;
static constexpr int32_t TEST_TYPE_PREVIEW = 0;
static constexpr int32_t TEST_TYPE_PHOTO = 1;
static constexpr int32_t DESIRED_FORMAT_UNSPECIFIED = -1;

static const char *MYDATA_KEY_ID  = "callBackId";
static const char *MYDATA_KEY_NUM  = "num";
static const char *MYDATA_KEY_STR  = "str";
static const char *MYDATA_KEY_BOOL = "callbackTriggered";
static int32_t g_myDataIndex = NUM_0;

std::string BoolToString(bool value)
{
    return value ? "true" : "false";
}

struct ImageInfoForJs {
    int32_t format = 0;
    int32_t colorSpace = 0;
    bool strideAlignedRet = false;
};

struct PixelMapInfo {
    uint32_t width = 0;
    uint32_t height = 0;
    int32_t pixelFormat = 0;
    bool isHdr = false;
};

struct CameraContext {
    Camera_Input* cameraInput = nullptr;
    Camera_CaptureSession* captureSession = nullptr;
    Camera_Manager* cameraManager = nullptr;
};

class MyData {
public:
    MyData() {}
    MyData(int32_t id, uint32_t n, std::string s, bool callbackTriggered):callBackId_(id), num_(n), s_(s),
        callbackTriggered_(callbackTriggered) {}
    ~MyData() {}
    void CallbackModifyCallBackId(int32_t id)
    {
        callBackId_ = id;
    }

    void CallBackModifyUserData()
    {
        callbackTriggered_ = true;
    }

    void PrintMyData(std::string tag)
    {
        OH_LOG_INFO(LOG_APP,
            "UserData %{public}s: callBackId: %{public}d, num: %{public}u, str: %{public}s, Triggered: %{public}s, addr: %{public}p!",
            tag.c_str(), callBackId_, num_, s_.c_str(), BoolToString(callbackTriggered_).c_str(), this);
    }

    int32_t callBackId_ = NUM_0;
    uint32_t num_ = NUM_0;
    std::string s_;
    bool callbackTriggered_ = false;
    ImageInfoForJs imageInfo_;
    PixelMapInfo pixelMapInfo_;
};
std::mutex g_mtx;
std::condition_variable g_condVar;
std::vector<std::shared_ptr<MyData>> g_myDataVector;
using CallbackFunc = void(*)(OH_ImageReceiverNative*, void*);
static CameraContext g_cameraCtx;

napi_value getJsResult(napi_env env, int result)
{
    napi_value resultNapi = nullptr;
    napi_create_int32(env, result, &resultNapi);
    return resultNapi;
}

static void SetUint32NamedProperty(napi_env env, napi_value object, const char* key, uint32_t value)
{
    napi_value temp = nullptr;
    napi_create_uint32(env, value, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

static int32_t GetInt32NamedProperty(napi_env env, napi_value object, const char* key)
{
    napi_value temp = nullptr;
    int32_t ulResult = NUM_0;
    napi_get_named_property(env, object, key, &temp);
    napi_get_value_int32(env, temp, &ulResult);
    return ulResult;
}

static char* GetStringNamedProperty(napi_env env, napi_value object, const char* key)
{
    napi_value temp = nullptr;
    char* result = nullptr;
    napi_status status = napi_get_named_property(env, object, key, &temp);
    size_t uriSize = NUM_0;
    status = napi_get_value_string_utf8(env, temp, nullptr, NUM_0, &uriSize);

    result = static_cast<char*>(std::malloc(uriSize + NUM_1));
    if (result == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Memory allocation failed for property: %{public}s", key);
        return nullptr;
    }

    status = napi_get_value_string_utf8(env, temp, result, uriSize + NUM_1, nullptr);
    if (status != napi_ok) {
        OH_LOG_ERROR(LOG_APP, "Failed to get string value for property: %{public}s", key);
        std::free(result);
        return nullptr;
    }
    return result;
}

static bool GetBoolNamedProperty(napi_env env, napi_value object, const char* key)
{
    napi_value temp = nullptr;
    bool ulResult = NUM_0;
    napi_get_named_property(env, object, key, &temp);
    napi_get_value_bool(env, temp, &ulResult);
    return ulResult;
}

MyData* GetMyData(int32_t myDataIndex)
{
    try {
        return g_myDataVector.at(myDataIndex).get();
    } catch (const std::out_of_range& e) {
        OH_LOG_ERROR(LOG_APP, "GetMyData error is: %{public}s!", e.what());
        return nullptr;
    }
}

std::unique_ptr<char[]> ConvertUint64ToChar(uint64_t value)
{
    std::string strValue = std::to_string(value);
    auto charBuffer = std::make_unique<char[]>(strValue.size() + 1);
    std::copy(strValue.begin(), strValue.end(), charBuffer.get());
    charBuffer[strValue.size()] = '\0';

    return charBuffer;
}

void ReleaseCameraContext(CameraContext& ctx)
{
    if (ctx.captureSession) {
        OH_CaptureSession_Stop(ctx.captureSession);
        OH_CaptureSession_Release(ctx.captureSession);
        ctx.captureSession = nullptr;
    }
    if (ctx.cameraInput) {
        OH_CameraInput_Close(ctx.cameraInput);
        OH_CameraInput_Release(ctx.cameraInput);
        ctx.cameraInput = nullptr;
    }
    if (ctx.cameraManager) {
        OH_Camera_DeleteCameraManager(ctx.cameraManager);
        ctx.cameraManager = nullptr;
    }
}

bool SetCaptureSessionColorSpace(Camera_CaptureSession* session, bool isHdr)
{
    if (session == nullptr) {
        OH_LOG_ERROR(LOG_APP, "SetCaptureSessionColorSpace: session is nullptr");
        return false;
    }

    OH_NativeBuffer_ColorSpace* colorSpaces = nullptr;
    uint32_t colorSpaceCount = 0;
    Camera_ErrorCode ret = OH_CaptureSession_GetSupportedColorSpaces(session, &colorSpaces, &colorSpaceCount);
    if (ret != CAMERA_OK || colorSpaces == nullptr || colorSpaceCount == 0) {
        OH_LOG_ERROR(LOG_APP, "GetSupportedColorSpaces failed, ret=%{public}d", ret);
        return false;
    }

    OH_NativeBuffer_ColorSpace desiredColorSpace = isHdr ? OH_NativeBuffer_ColorSpace::OH_COLORSPACE_BT2020_HLG_LIMIT :
                                                           OH_NativeBuffer_ColorSpace::OH_COLORSPACE_BT709_LIMIT;
    bool found = false;
    for (uint32_t i = 0; i < colorSpaceCount; ++i) {
        OH_LOG_INFO(LOG_APP, "Supported color space[%{public}d]: %{public}d", i, colorSpaces[i]);
        if (colorSpaces[i] == desiredColorSpace) {
            found = true;
            break;
        }
    }

    if (!found) {
        OH_LOG_ERROR(LOG_APP, "Desired color space %{public}d not supported by session", desiredColorSpace);
        desiredColorSpace = OH_NativeBuffer_ColorSpace::OH_COLORSPACE_SRGB_FULL;
    }

    ret = OH_CaptureSession_SetActiveColorSpace(session, desiredColorSpace);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "SetColorSpace failed, ret=%{public}d", ret);
    }
    OH_LOG_INFO(LOG_APP, "Set color space to %{public}d successfully", desiredColorSpace);
    return true;
}

bool InitCameraManagerAndInput(Camera_Manager*& cameraManager, Camera_Device*& cameras, uint32_t& size,
    Camera_Input*& cameraInput)
{
    cameraManager = nullptr;
    cameras = nullptr;
    size = 0;
    cameraInput = nullptr;
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager);
    if (cameraManager == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_Camera_GetCameraManager failed.");
        return false;
    }
    ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    if (cameras == nullptr || size < 1 || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameras failed.");
        return false;
    }

    for (uint32_t i = 0; i < size; ++i) {
        OH_LOG_INFO(LOG_APP, "Camera[%{public}u]: id=%{public}s, position=%{public}d, type=%{public}d, "
            "connectionType=%{public}d", i, cameras[i].cameraId, cameras[i].cameraPosition, cameras[i].cameraType,
            cameras[i].connectionType);
    }

    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[0], &cameraInput);
    if (cameraInput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCameraInput failed.ret:%{public}d", ret);
        return false;
    }

    g_cameraCtx.cameraManager = cameraManager;
    g_cameraCtx.cameraInput = cameraInput;
    return true;
}

bool GetCameraOutputCapability(Camera_Manager* cameraManager, Camera_Device* cameras, uint32_t cameraDeviceIndex,
    Camera_SceneMode sceneMode, Camera_OutputCapability*& capability)
{
    capability = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager, &cameras[cameraDeviceIndex], sceneMode, &capability);
    if (capability == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode failed.");
        return false;
    }
    return true;
}

const Camera_Profile* FindProfile(const Camera_OutputCapability* capability, int desiredFormat, bool isPreview)
{
    OH_LOG_INFO(LOG_APP, "FindProfile: isPreview=%{public}s, desiredFormat=%{public}d",
        isPreview ? "true" : "false", desiredFormat);
    int size = isPreview ? capability->previewProfilesSize : capability->photoProfilesSize;
    Camera_Profile **profiles = isPreview ? capability->previewProfiles : capability->photoProfiles;
    for (int i = 0; i < size; i++) {
        Camera_Format format = profiles[i]->format;
        OH_LOG_INFO(LOG_APP, "Profile[%{public}d]: format=%{public}d, width=%{public}d, height=%{public}d, ",
            i, profiles[i]->format, profiles[i]->size.width, profiles[i]->size.height);
        if (desiredFormat != -1 && format == desiredFormat) {
            OH_LOG_INFO(LOG_APP, "Selected profile[%{public}d] for format: %{public}d", i, format);
            return profiles[i];
        }
    }
    OH_LOG_INFO(LOG_APP, "No profile found for desired format or not specified, use default: format=%{public}d.",
        profiles[0]->format);
    return profiles[0];
}

static bool GetSurfaceIdFromReceiver(OH_ImageReceiverNative* receiver, std::unique_ptr<char[]>& surfaceID_c)
{
    uint64_t surfaceID = 0;
    Image_ErrorCode errCode = OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &surfaceID);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "imageReceiverTest get image receiver surfaceID failed, errCode: %{public}d.", errCode);
        return false;
    }
    surfaceID_c = ConvertUint64ToChar(surfaceID);
    OH_LOG_INFO(LOG_APP, "imageReceiverTest surfaceID_c: %{public}s.", surfaceID_c.get());
    return true;
}

Camera_CaptureSession* CreateConfigSession(Camera_Manager* cameraManager, Camera_Input* cameraInput,
    Camera_SceneMode sessionMode)
{
    Camera_CaptureSession* captureSession = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCaptureSession failed.");
        return nullptr;
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, static_cast<Camera_SceneMode>(sessionMode));
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetSessionMode failed.");
        return nullptr;
    }
    ret = OH_CaptureSession_BeginConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_BeginConfig failed.");
        return nullptr;
    }
    ret = OH_CaptureSession_AddInput(captureSession, cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddInput failed.");
        return nullptr;
    }
    g_cameraCtx.captureSession = captureSession;
    return captureSession;
}

static bool CreatePhotoOutput(Camera_Manager* cameraManager, const Camera_Profile* photoProfile, char* str,
    Camera_PhotoOutput*& photoOutput)
{
    Camera_ErrorCode ret = OH_CameraManager_CreatePhotoOutput(cameraManager, photoProfile, str, &photoOutput);
    if (photoProfile == nullptr || photoOutput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePhotoOutput failed.");
        return false;
    }
    return true;
}

static bool CreatePreviewOutput(Camera_Manager* cameraManager, const Camera_Profile* previewProfile,
    const char* surfaceId, Camera_PreviewOutput*& previewOutput)
{
    Camera_ErrorCode ret = OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, surfaceId, &previewOutput);
    if (previewProfile == nullptr || previewOutput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePreviewOutput failed.");
        return false;
    }
    return true;
}

static bool StartPreviewSession(Camera_CaptureSession* captureSession, Camera_PreviewOutput* previewOutput,
    int32_t desiredFormat)
{
    Camera_ErrorCode ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPreviewOutput failed.");
        return false;
    }
    bool isHdr = (desiredFormat == Camera_Format::CAMERA_FORMAT_YCBCR_P010 ||
                  desiredFormat == Camera_Format::CAMERA_FORMAT_YCRCB_P010);
    SetCaptureSessionColorSpace(captureSession, isHdr);

    ret = OH_CaptureSession_CommitConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_CommitConfig failed.");
        return false;
    }

    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Start failed.");
        return false;
    }
    OH_LOG_INFO(LOG_APP, "OH_CaptureSession_Start SUCC!");
    return true;
}

static bool StartPhotoPreviewSession(Camera_CaptureSession* captureSession, Camera_PhotoOutput* photoOutput,
    Camera_PreviewOutput* previewOutput)
{
    Camera_ErrorCode ret = OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPhotoOutput/PreviewOutput failed.");
        return false;
    }
    SetCaptureSessionColorSpace(captureSession, false);
    ret = OH_CaptureSession_CommitConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_CommitConfig failed.");
        return false;
    }
    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Start failed.");
        return false;
    }
    return true;
}

static bool DoPhotoCapture(Camera_PhotoOutput* photoOutput)
{
    Camera_ErrorCode ret = OH_PhotoOutput_Capture(photoOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_PhotoOutput_Capture failed.");
        return false;
    }
    OH_LOG_INFO(LOG_APP, "OH_PhotoOutput_Capture SUCC!");
    return true;
}

bool NDKCameraTest(char *str, int32_t desiredFormat)
{
    Camera_Manager *cameraManager = nullptr;
    Camera_Device *cameras = nullptr;
    uint32_t size = 0;
    Camera_Input *cameraInput = nullptr;
    if (!InitCameraManagerAndInput(cameraManager, cameras, size, cameraInput)) {
        return false;
    }

    Camera_OutputCapability *cameraOutputCapability = nullptr;
    if (!GetCameraOutputCapability(cameraManager, cameras, 0, Camera_SceneMode::NORMAL_VIDEO, cameraOutputCapability)) {
        return false;
    }

    const Camera_Profile *previewProfile = FindProfile(cameraOutputCapability, desiredFormat, true);
    Camera_PreviewOutput *previewOutput = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, str, &previewOutput);
    if (previewProfile == nullptr || previewOutput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePreviewOutput failed.");
        return false;
    }

    ret = OH_CameraInput_Open(cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_open failed.");
        return false;
    }

    Camera_CaptureSession *captureSession = CreateConfigSession(cameraManager, cameraInput,
        Camera_SceneMode::NORMAL_VIDEO);
    if (captureSession == nullptr) {
        return false;
    }
    if (!StartPreviewSession(captureSession, previewOutput, desiredFormat)) {
        return false;
    }
    return true;
}

Image_ErrorCode InitReceiverOptions(OH_ImageReceiverOptions *&options)
{
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "InitReceiverOptions create image receiver options failed, errCode: %{public}d.",
            errCode);
        return IMAGE_BAD_PARAMETER;
    }

    Image_Size imgSize;
    imgSize.width = IMAGE_WIDTH;
    imgSize.height = IMAGE_HEIGHT;
    errCode = OH_ImageReceiverOptions_SetSize(options, imgSize);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "InitReceiverOptions set image receiver options size failed, errCode: %{public}d.",
            errCode);
        OH_ImageReceiverOptions_Release(options);
        return errCode;
    }

    errCode = OH_ImageReceiverOptions_SetCapacity(options, IMAGE_CAPACITY);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "InitReceiverOptions set image receiver options capacity failed, errCode: %{public}d.",
            errCode);
        OH_ImageReceiverOptions_Release(options);
        return errCode;
    }

    Image_Size imgSizeRead;
    errCode = OH_ImageReceiverOptions_GetSize(options, &imgSizeRead);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "InitReceiverOptions get image receiver options size failed, errCode: %{public}d.",
            errCode);
        OH_ImageReceiverOptions_Release(options);
        return errCode;
    }

    if (imgSizeRead.width != IMAGE_WIDTH || imgSizeRead.height != IMAGE_HEIGHT) {
        OH_LOG_ERROR(LOG_APP, "InitReceiverOptions get image receiver options size failed, width: %{public}d, height:\
            %{public}d.", imgSizeRead.width, imgSizeRead.height);
        OH_ImageReceiverOptions_Release(options);
        return IMAGE_BAD_PARAMETER;
    }

    int32_t capacity = NUM_0;
    errCode = OH_ImageReceiverOptions_GetCapacity(options, &capacity);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "InitReceiverOptions get image receiver options capacity failed, errCode: %{public}d.",
            errCode);
        OH_ImageReceiverOptions_Release(options);
        return errCode;
    }

    if (capacity != IMAGE_CAPACITY) {
        OH_LOG_ERROR(LOG_APP, "InitReceiverOptions get image receiver options capacity failed, capacity: %{public}d.",
            capacity);
        OH_ImageReceiverOptions_Release(options);
        return IMAGE_BAD_PARAMETER;
    }

    return IMAGE_SUCCESS;
}

bool NDKCameraPhotoOutput(char *str, int32_t desiredFormat, OH_ImageReceiverNative* receiver)
{
    Camera_Manager *cameraManager = nullptr;
    Camera_Device *cameras = nullptr;
    uint32_t size = 0;
    Camera_Input *cameraInput = nullptr;
    if (!InitCameraManagerAndInput(cameraManager, cameras, size, cameraInput)) {
        return false;
    }

    Camera_OutputCapability *cameraOutputCapability = nullptr;
    if (!GetCameraOutputCapability(cameraManager, cameras, 0, Camera_SceneMode::NORMAL_PHOTO, cameraOutputCapability)) {
        return false;
    }
    const Camera_Profile *photoProfile = FindProfile(cameraOutputCapability, desiredFormat, false);
    Camera_PhotoOutput *photoOutput = nullptr;
    if (!CreatePhotoOutput(cameraManager, photoProfile, str, photoOutput)) {
        return false;
    }

    std::unique_ptr<char[]> surfaceID_c;
    if (!GetSurfaceIdFromReceiver(receiver, surfaceID_c)) {
        return false;
    }
    OH_LOG_INFO(LOG_APP, "SurfaceID for PhotoOutput: %{public}s", surfaceID_c.get());
    const Camera_Profile *previewProfile = cameraOutputCapability->previewProfiles[0];
    Camera_PreviewOutput *previewOutput = nullptr;
    if (!CreatePreviewOutput(cameraManager, previewProfile, surfaceID_c.get(), previewOutput)) {
        return false;
    }

    Camera_ErrorCode ret = OH_CameraInput_Open(cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_open failed.");
        return false;
    }

    Camera_CaptureSession *captureSession = CreateConfigSession(cameraManager, cameraInput,
        Camera_SceneMode::NORMAL_PHOTO);
    if (captureSession == nullptr) {
        return false;
    }
    if (!StartPhotoPreviewSession(captureSession, photoOutput, previewOutput)) {
        return false;
    }
    return DoPhotoCapture(photoOutput);
}

PixelMapInfo GetPixelMapImageInfo(OH_PixelmapNative *pixelMap)
{
    PixelMapInfo info;
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    if (OH_PixelmapImageInfo_Create(&imageInfo) != IMAGE_SUCCESS) {
        return info;
    }

    if (OH_PixelmapNative_GetImageInfo(pixelMap, imageInfo) == IMAGE_SUCCESS) {
        OH_PixelmapImageInfo_GetWidth(imageInfo, &info.width);
        OH_PixelmapImageInfo_GetHeight(imageInfo, &info.height);
        OH_PixelmapImageInfo_GetPixelFormat(imageInfo, &info.pixelFormat);
        OH_PixelmapImageInfo_GetDynamicRange(imageInfo, &info.isHdr);
    } else {
        OH_LOG_ERROR(LOG_APP, "GetPixelMapImageInfo: GetImageInfo failed");
    }

    OH_PixelmapImageInfo_Release(imageInfo);
    return info;
}

Image_ErrorCode DecodePixelMap(OH_NativeBuffer *nativeBuffer, OH_PixelmapNative **pixelmap)
{
    if (nativeBuffer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "DecodePixelMap: invalid input params");
        return IMAGE_BAD_PARAMETER;
    }

    Image_ErrorCode ret =  OH_PixelmapNative_CreatePixelmapFromNativeBuffer(nativeBuffer, pixelmap);
    if (ret != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "DecodePixelMap: OH_PixelmapNative_CreatePixelmapFromNativeBuffer failed, errCode: "
            "%{public}d", ret);
    }

    return ret;
}

bool CheckStrideAligned(const OH_ImageBufferData& imageBufferData, Image_Size imgSize, OH_NativeBuffer_Format format)
{
    if (format == OH_NativeBuffer_Format::NATIVEBUFFER_PIXEL_FMT_BLOB) {
        OH_LOG_INFO(LOG_APP, "Blob format no need to check stride aligned.");
        return true;
    }

    OH_LOG_INFO(LOG_APP, "Image buffer data: numStride=%{public}d", imageBufferData.numStride);
    OH_LOG_INFO(LOG_APP, "Image buffer data: rowStride[0]=%{public}zu, rowStride[1]=%{public}zu",
        imageBufferData.rowStride[0], imageBufferData.rowStride[1]);
    OH_LOG_INFO(LOG_APP, "Image buffer data: pixelStride[0]=%{public}zu, pixelStride[1]=%{public}zu",
        imageBufferData.pixelStride[0], imageBufferData.pixelStride[1]);

    int32_t pixelStrideY = NUM_0;
    int32_t pixelStrideUV = NUM_0;
    switch (format) {
        case OH_NativeBuffer_Format::NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP:
            pixelStrideY = NUM_1;
            pixelStrideUV = NUM_2;
            break;
        case OH_NativeBuffer_Format::NATIVEBUFFER_PIXEL_FMT_YCBCR_P010:
        case OH_NativeBuffer_Format::NATIVEBUFFER_PIXEL_FMT_YCRCB_P010:
            pixelStrideY = NUM_2;
            pixelStrideUV = NUM_4;
    }
    OH_LOG_INFO(LOG_APP, "CheckStrideAligned: format=%{public}d, pixelStrideY=%{public}d, pixelStrideUV=%{public}d",
        format, pixelStrideY, pixelStrideUV);
    bool isYAligned = (imageBufferData.rowStride[0] >= imgSize.width) &&
                      (imageBufferData.rowStride[1] >= imgSize.width) &&
                      (imageBufferData.pixelStride[0] >= pixelStrideY) &&
                      (imageBufferData.pixelStride[1] >= pixelStrideUV);
    return isYAligned;
}

void ExtractImageInfo(OH_ImageNative *image, MyData* myData)
{
    Image_Size imgSize;
    Image_ErrorCode sizeErr = OH_ImageNative_GetImageSize(image, &imgSize);
    if (sizeErr == IMAGE_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "PhotoOutput image size: width=%{public}d, height=%{public}d", imgSize.width,
            imgSize.height);
    } else {
        OH_LOG_ERROR(LOG_APP, "GetImageSize failed, errCode: %{public}d", sizeErr);
    }
    OH_NativeBuffer_Format format;
    Image_ErrorCode errCode = OH_ImageNative_GetFormat(image, &format);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "GetFormat failed, errCode: %{public}d", errCode);
        return;
    }
    myData->imageInfo_.format = format;

    int32_t colorSpaceName;
    errCode = OH_ImageNative_GetColorSpace(image, &colorSpaceName);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "GetColorSpace failed, errCode: %{public}d", errCode);
        return;
    }
    myData->imageInfo_.colorSpace = static_cast<int32_t>(colorSpaceName);

    OH_ImageBufferData imageBufferData;
    errCode = OH_ImageNative_GetBufferData(image, &imageBufferData);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "GetBufferData failed, errCode: %{public}d", errCode);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Image format: %{public}d, ColorSpace: %{public}d, BufferSize: %{public}zu",
        format, static_cast<int>(colorSpaceName), imageBufferData.bufferSize);
    myData->imageInfo_.strideAlignedRet = CheckStrideAligned(imageBufferData, imgSize, format);

    OH_PixelmapNative *pixelmap = nullptr;
    if (format == OH_NativeBuffer_Format::NATIVEBUFFER_PIXEL_FMT_BLOB ||
        format == OH_NativeBuffer_Format::NATIVEBUFFER_PIXEL_FMT_YCBCR_P010 ||
        format == OH_NativeBuffer_Format::NATIVEBUFFER_PIXEL_FMT_YCRCB_P010) {
        OH_LOG_INFO(LOG_APP, "Image format no need to decode.");
        return;
    } else {
        Image_ErrorCode ret = DecodePixelMap(imageBufferData.nativeBuffer, &pixelmap);
        if (ret != IMAGE_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "DecodePixelMap failed, errCode: %{public}d", ret);
            return;
        }
    }

    PixelMapInfo info = GetPixelMapImageInfo(pixelmap);
    myData->pixelMapInfo_ = info;
    OH_PixelmapNative_Release(pixelmap);
    pixelmap = nullptr;
}

static void ImageArriveOnCallback_01(OH_ImageReceiverNative *receiver, void *userData)
{
    OH_LOG_INFO(LOG_APP, "ImageArriveOnCallback_01 IN");
    std::lock_guard<std::mutex> lock(g_mtx);
    MyData* myData = static_cast<MyData*>(userData);
    if (userData != nullptr && myData != nullptr) {
        OH_LOG_INFO(LOG_APP, "ImageArriveOnCallback_01 triggered successfully.");
        myData->PrintMyData("before");
        myData->CallbackModifyCallBackId(NUM_1);
        myData->CallBackModifyUserData();
        myData->PrintMyData("after");
    }

    OH_ImageNative *image = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverNative_ReadNextImage(receiver, &image);
    if (errCode != IMAGE_SUCCESS || image == nullptr) {
        OH_LOG_ERROR(LOG_APP, "ImageArriveOnCallback_01 ReadNextImage failed, errCode: %{public}d.", errCode);
        g_condVar.notify_all();
        return;
    }

    ExtractImageInfo(image, myData);
    OH_ImageNative_Release(image);
    g_condVar.notify_all();
    return;
}

static void ImageArriveOnCallback_02(OH_ImageReceiverNative *receiver, void *userData)
{
    OH_LOG_INFO(LOG_APP, "ImageArriveOnCallback_02 IN");
    std::lock_guard<std::mutex> lock(g_mtx);
    MyData* myData = static_cast<MyData*>(userData);
    if (userData != nullptr && myData != nullptr) {
        OH_LOG_INFO(LOG_APP, "ImageArriveOnCallback_02 triggered successfully.");
        myData->PrintMyData("before");
        myData->CallbackModifyCallBackId(NUM_2);
        myData->CallBackModifyUserData();
        myData->PrintMyData("after");
    }
    g_condVar.notify_all();
    return;
}

static void ImageArriveOnCallback_03(OH_ImageReceiverNative *receiver, void *userData)
{
    OH_LOG_INFO(LOG_APP, "ImageArriveOnCallback_03 IN");
    std::lock_guard<std::mutex> lock(g_mtx);
    MyData* myData = static_cast<MyData*>(userData);
    if (userData != nullptr && myData != nullptr) {
        OH_LOG_INFO(LOG_APP, "ImageArriveOnCallback_03 triggered successfully.");
        myData->PrintMyData("before");
        myData->CallbackModifyCallBackId(NUM_3);
        myData->CallBackModifyUserData();
        myData->PrintMyData("after");
    }
    g_condVar.notify_all();
    return;
}

static void NativeOnCallback(OH_ImageReceiverNative *receiver)
{
    std::lock_guard<std::mutex> lock(g_mtx);
    MyData *myData = GetMyData(g_myDataIndex);

    OH_LOG_INFO(LOG_APP, "NativeOnCallback triggered successfully.");
    myData->PrintMyData("before");
    myData->CallbackModifyCallBackId(NUM_4);
    myData->CallBackModifyUserData();
    myData->PrintMyData("after");
    g_condVar.notify_all();
    return;
}

static void SetMyDataBaseProperties(napi_env env, napi_value object, const MyData* userData)
{
    napi_value temp = nullptr;
    napi_create_int32(env, userData->callBackId_, &temp);
    napi_set_named_property(env, object, MYDATA_KEY_ID, temp);

    napi_create_int32(env, userData->num_, &temp);
    napi_set_named_property(env, object, MYDATA_KEY_NUM, temp);

    napi_create_string_utf8(env, (const char *)(userData->s_.c_str()), NAPI_AUTO_LENGTH, &temp);
    napi_set_named_property(env, object, MYDATA_KEY_STR, temp);

    napi_get_boolean(env, userData->callbackTriggered_, &temp);
    napi_set_named_property(env, object, MYDATA_KEY_BOOL, temp);

    napi_value imageInfoObj = nullptr;
    napi_create_object(env, &imageInfoObj);
    SetUint32NamedProperty(env, imageInfoObj, "format", static_cast<uint32_t>(userData->imageInfo_.format));
    SetUint32NamedProperty(env, imageInfoObj, "colorSpace", static_cast<uint32_t>(userData->imageInfo_.colorSpace));
    napi_get_boolean(env, userData->imageInfo_.strideAlignedRet, &temp);
    napi_set_named_property(env, imageInfoObj, "strideAlignedRet", temp);
    napi_set_named_property(env, object, "imageInfo", imageInfoObj);
    napi_value pixelMapInfoObj = nullptr;
    napi_create_object(env, &pixelMapInfoObj);
    SetUint32NamedProperty(env, pixelMapInfoObj, "width", static_cast<uint32_t>(userData->pixelMapInfo_.width));
    SetUint32NamedProperty(env, pixelMapInfoObj, "height", static_cast<uint32_t>(userData->pixelMapInfo_.height));
    SetUint32NamedProperty(env, pixelMapInfoObj, "pixelFormat",
        static_cast<uint32_t>(userData->pixelMapInfo_.pixelFormat));
    napi_get_boolean(env, userData->pixelMapInfo_.isHdr, &temp);
    napi_set_named_property(env, pixelMapInfoObj, "isHdr", temp);

    napi_set_named_property(env, object, "pixelMapInfo", pixelMapInfoObj);
}

static bool CheckSupportFormat(int32_t desiredFormat, int32_t testType)
{
    Camera_Manager *cameraManager = nullptr;
    Camera_Device *cameras = nullptr;
    uint32_t size = 0;
    Camera_Input *cameraInput = nullptr;
    if (!InitCameraManagerAndInput(cameraManager, cameras, size, cameraInput)) {
        return false;
    }

    Camera_OutputCapability *cameraOutputCapability = nullptr;
    Camera_SceneMode sceneMode = (testType == TEST_TYPE_PREVIEW) ? Camera_SceneMode::NORMAL_VIDEO :
                                                                   Camera_SceneMode::NORMAL_PHOTO;
    if (!GetCameraOutputCapability(cameraManager, cameras, 0, sceneMode, cameraOutputCapability)) {
        return false;
    }

    bool isPreview = (testType == TEST_TYPE_PREVIEW);
    const Camera_Profile *previewProfile = FindProfile(cameraOutputCapability, desiredFormat, isPreview);
    if (previewProfile == nullptr) {
        OH_LOG_ERROR(LOG_APP, "CheckSupportFormat: FindProfile returned nullptr for format %{public}d.",
            desiredFormat);
        return false;
    }

    return previewProfile->format == desiredFormat;
}

static napi_value createReceiver(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions* options = nullptr;
    Image_ErrorCode errCode = InitReceiverOptions(options);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "createReceiver InitReceiverOptions failed, errCode: %{public}d.", errCode);
        OH_ImageReceiverOptions_Release(options);
        return getJsResult(env, errCode);
    }

    OH_ImageReceiverNative *receiver = nullptr;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    OH_ImageReceiverOptions_Release(options);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "createReceiver create image receiver failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }

    napi_value result;
    napi_create_external(env, reinterpret_cast<void *>(receiver), nullptr, nullptr, &result);
    return result;
}

static napi_value nativeOn(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {nullptr};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        OH_LOG_ERROR(LOG_APP, "nativeOn, the input parameters are smaller than the required parameters");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImageReceiverNative *receiver = reinterpret_cast<OH_ImageReceiverNative *>(ptr);

    int32_t callBackId = GetInt32NamedProperty(env, argValue[NUM_0], MYDATA_KEY_ID);
    int32_t num = GetInt32NamedProperty(env, argValue[NUM_1], MYDATA_KEY_NUM);
    char *str = GetStringNamedProperty(env, argValue[NUM_1], MYDATA_KEY_STR);
    bool callbackTriggered = GetBoolNamedProperty(env, argValue[NUM_1], MYDATA_KEY_BOOL);
    std::shared_ptr<MyData> userData = std::make_shared<MyData>(NUM_0, num, str, callbackTriggered);
    g_myDataVector.push_back(userData);
    std::free(str);

    Image_ErrorCode errCode = OH_ImageReceiverNative_On(receiver, NativeOnCallback);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "on image receiver on failed, errCode: %{public}d.", errCode);
        OH_ImageReceiverNative_Release(receiver);
        return getJsResult(env, errCode);
    }

    return getJsResult(env, errCode);
}

static napi_value imageArriveOn(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {nullptr};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        OH_LOG_ERROR(LOG_APP, "imageArriveOn, the input parameters are smaller than the required parameters");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImageReceiverNative *receiver = reinterpret_cast<OH_ImageReceiverNative *>(ptr);

    int32_t callBackId = GetInt32NamedProperty(env, argValue[NUM_1], MYDATA_KEY_ID);
    int num = GetInt32NamedProperty(env, argValue[NUM_1], MYDATA_KEY_NUM);
    char *str = GetStringNamedProperty(env, argValue[NUM_1], MYDATA_KEY_STR);
    bool callbackTriggered = GetBoolNamedProperty(env, argValue[NUM_1], MYDATA_KEY_BOOL);
    std::shared_ptr<MyData> userData = std::make_shared<MyData>(NUM_0, num, str, callbackTriggered);
    g_myDataVector.push_back(userData);
    void* userDataPtr = userData.get();
    std::free(str);

    CallbackFunc selectedCallback;
    switch (callBackId) {
        case NUM_1:
            selectedCallback = ImageArriveOnCallback_01;
            break;
        case NUM_2:
            selectedCallback = ImageArriveOnCallback_02;
            break;
        case NUM_3:
            selectedCallback = ImageArriveOnCallback_03;
            break;
        default:
            OH_LOG_INFO(LOG_APP, "imageArriveOn invalid callback ID");
            return getJsResult(env, IMAGE_BAD_PARAMETER);
    }
    Image_ErrorCode errCode = OH_ImageReceiverNative_OnImageArrive(receiver, selectedCallback, userDataPtr);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "imageArriveOn image receiver on failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }

    return getJsResult(env, errCode);
}

static napi_value waitForCondition(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {nullptr};
    size_t argCount = NUM_3;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        OH_LOG_ERROR(LOG_APP, "waitForCondition, the input parameters are smaller than the required parameters");
        return result;
    }

    int32_t callBackId = NUM_0;
    napi_get_value_int32(env, argValue[NUM_0], &callBackId);
    int32_t userNum = NUM_0;
    napi_get_value_int32(env, argValue[NUM_1], &userNum);
    napi_get_value_int32(env, argValue[NUM_2], &g_myDataIndex);
    OH_LOG_INFO(LOG_APP, "waitForCondition callBackId: %{public}d, userNum: %{public}d.", callBackId, userNum);
    try {
        MyData *userData = GetMyData(g_myDataIndex);
        OH_LOG_INFO(LOG_APP, "waitForCondition myDataIndex: %{public}d.", g_myDataIndex);
        OH_LOG_INFO(LOG_APP, "waitForCondition sleep start!");
        std::unique_lock<std::mutex> lock(g_mtx);
        if (!g_condVar.wait_for(lock, std::chrono::seconds(1), [userData, callBackId, userNum] {
            bool ret = (userData->callbackTriggered_ == true && userData->callBackId_ == callBackId &&
                userData->num_ == userNum);
            userData->PrintMyData("waitForCondition userData wait_for");
            return ret;
        })) {
            OH_LOG_ERROR(LOG_APP, "waitForCondition timed out waiting for condition!");
            return getJsResult(env, IMAGE_SUCCESS);
        } else {
            OH_LOG_INFO(LOG_APP, "waitForCondition condition met!");
            napi_value object = nullptr;
            napi_create_object(env, &object);
            SetMyDataBaseProperties(env, object, userData);
            return object;
        }
    } catch (const std::out_of_range& e) {
        OH_LOG_ERROR(LOG_APP, "waitForCondition error: %{public}s!", e.what());
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }
}

static bool ParseImageReceiverTestArgs(napi_env env, napi_callback_info info, void*& receiver, void*& previewReceiver,
    int32_t& desiredFormat, int32_t& testType, napi_value* argValue, size_t& argCount)
{
    napi_get_undefined(env, &argValue[NUM_0]);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        OH_LOG_ERROR(LOG_APP, "imageReceiverTest, the input parameters are smaller than the required parameters");
        return false;
    }
    napi_get_value_external(env, argValue[NUM_0], &receiver);

    if (argCount >= NUM_4) {
        napi_get_value_external(env, argValue[NUM_3], &previewReceiver);
    } else {
        previewReceiver = nullptr;
    }
    desiredFormat = DESIRED_FORMAT_UNSPECIFIED;
    if (argCount >= NUM_2) {
        napi_get_value_int32(env, argValue[NUM_1], &desiredFormat);
    }
    testType = TEST_TYPE_PREVIEW;
    if (argCount >= NUM_3) {
        napi_get_value_int32(env, argValue[NUM_2], &testType);
    }
    return true;
}

static napi_value imageReceiverTest(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_4] = {nullptr};
    size_t argCount = NUM_4;
    napi_get_undefined(env, &result);

    void* receiver = nullptr;
    void* previewReceiver = nullptr;
    int32_t desiredFormat = DESIRED_FORMAT_UNSPECIFIED;
    int32_t testType = TEST_TYPE_PREVIEW;
    if (!ParseImageReceiverTestArgs(env, info, receiver, previewReceiver, desiredFormat, testType, argValue, argCount)) {
        return result;
    }

    std::unique_ptr<char[]> surfaceID_c;
    if (!GetSurfaceIdFromReceiver(reinterpret_cast<OH_ImageReceiverNative*>(receiver), surfaceID_c)) {
        OH_ImageReceiverNative_Release(reinterpret_cast<OH_ImageReceiverNative*>(receiver));
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }

    if (argCount >= NUM_3) {
        if (!CheckSupportFormat(desiredFormat, testType)) {
            OH_LOG_ERROR(LOG_APP, "imageReceiverTest desiredFormat %{public}d is not supported.", desiredFormat);
            return getJsResult(env, UNSUPPORTED_CAMERA_FORMAT);
        }
    }

    bool testResult = false;
    if (testType == TEST_TYPE_PHOTO) {
        OH_LOG_INFO(LOG_APP, "imageReceiverTest start NDKCameraPhotoOutput.");
        testResult = NDKCameraPhotoOutput(surfaceID_c.get(), desiredFormat,
                                          reinterpret_cast<OH_ImageReceiverNative*>(previewReceiver));
    } else {
        OH_LOG_INFO(LOG_APP, "imageReceiverTest start NDKCameraTest.");
        testResult = NDKCameraTest(surfaceID_c.get(), desiredFormat);
    }

    if (!testResult) {
        OH_LOG_ERROR(LOG_APP, "imageReceiverTest camera operation failed.");
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value nativeOff(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_1] = {nullptr};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        OH_LOG_ERROR(LOG_APP, "nativeOff, the input parameters are smaller than the required parameters");
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImageReceiverNative *receiver = reinterpret_cast<OH_ImageReceiverNative *>(ptr);

    Image_ErrorCode errCode = OH_ImageReceiverNative_Off(receiver);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "nativeOff image receiver off failed, errCode: %{public}d.", errCode);
    }
    return getJsResult(env, errCode);
}

static napi_value imageArriveOff(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {nullptr};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        OH_LOG_ERROR(LOG_APP, "imageArriveOff, the input parameters are smaller than the required parameters");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImageReceiverNative *receiver = reinterpret_cast<OH_ImageReceiverNative *>(ptr);
    int32_t callBackId = NUM_0;
    napi_get_value_int32(env, argValue[NUM_1], &callBackId);

    CallbackFunc selectedCallback;
    switch (callBackId) {
        case NUM_1:
            selectedCallback = ImageArriveOnCallback_01;
            break;
        case NUM_2:
            selectedCallback = ImageArriveOnCallback_02;
            break;
        case NUM_3:
            selectedCallback = ImageArriveOnCallback_03;
            break;
        default:
            selectedCallback = nullptr;
    }
    Image_ErrorCode errCode = OH_ImageReceiverNative_OffImageArrive(receiver, selectedCallback);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "imageArriveOff image receiver off failed, errCode: %{public}d.", errCode);
    }
    return getJsResult(env, errCode);
}

static napi_value imageArriveOn_Error(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {nullptr};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        OH_LOG_ERROR(LOG_APP, "imageArriveOn_Error, the input parameters are smaller than the required parameters");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImageReceiverNative *receiver = reinterpret_cast<OH_ImageReceiverNative *>(ptr);
    bool flag = false;
    napi_get_value_bool(env, argValue[NUM_1], &flag);

    Image_ErrorCode errCode;
    if (flag) {
        errCode = OH_ImageReceiverNative_OnImageArrive(nullptr, ImageArriveOnCallback_01, nullptr);
    } else {
        errCode = OH_ImageReceiverNative_OnImageArrive(receiver, nullptr, nullptr);
    }
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "imageArriveOn_Error image receiver on failed, errCode: %{public}d.", errCode);
    } else {
        OH_LOG_INFO(LOG_APP, "imageArriveOn_Error image receiver on SUCC.");
    }
    OH_ImageReceiverNative_Release(receiver);
    return getJsResult(env, errCode);
}

static napi_value imageArriveOff_Error(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_OffImageArrive(nullptr, nullptr);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "imageArriveOff_Error image receiver off failed, errCode: %{public}d.", errCode);
    } else {
        OH_LOG_INFO(LOG_APP, "imageArriveOff_Error image receiver off succ!");
    }
    return getJsResult(env, errCode);
}

static napi_value releaseImageReceiver(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_1] = {nullptr};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        OH_LOG_ERROR(LOG_APP, "releaseImageReceiver, the input parameters are smaller than the required parameters");
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImageReceiverNative *receiver = reinterpret_cast<OH_ImageReceiverNative *>(ptr);
    if (receiver != nullptr) {
        Image_ErrorCode errCode = OH_ImageReceiverNative_Release(receiver);
        if (errCode != IMAGE_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "releaseImageReceiver release image receiver failed, errCode: %{public}d.", errCode);
        }
    } else {
        OH_LOG_INFO(LOG_APP, "releaseImageReceiver image receive is nullptr!");
    }
    OH_LOG_INFO(LOG_APP, "releaseImageReceiver ReleaseCameraContext IN");
    ReleaseCameraContext(g_cameraCtx);
    g_myDataVector.clear();
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value CreateErrResultObj(napi_env env, int err1, int err2)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    napi_value val1;
    napi_value val2;
    napi_create_int32(env, err1, &val1);
    napi_create_int32(env, err2, &val2);
    napi_set_named_property(env, resultObj, "err1", val1);
    napi_set_named_property(env, resultObj, "err2", val2);
    return resultObj;
}

static napi_value testGetFormatNullptr(napi_env env, napi_callback_info info)
{
    OH_NativeBuffer_Format format;
    Image_ErrorCode err1 = OH_ImageNative_GetFormat(nullptr, &format);

    OH_ImageNative *dummyImage = nullptr;
    Image_ErrorCode err2 = OH_ImageNative_GetFormat(dummyImage, nullptr);

    return CreateErrResultObj(env, err1, err2);
}

static napi_value testGetColorSpaceNullptr(napi_env env, napi_callback_info info)
{
    int32_t colorSpace;
    Image_ErrorCode err1 = OH_ImageNative_GetColorSpace(nullptr, &colorSpace);
    OH_ImageNative *dummyImage = nullptr;
    Image_ErrorCode err2 = OH_ImageNative_GetColorSpace(dummyImage, nullptr);

    return CreateErrResultObj(env, err1, err2);
}

static napi_value testGetBufferDataNullptr(napi_env env, napi_callback_info info)
{
    OH_ImageBufferData bufferData;
    Image_ErrorCode err1 = OH_ImageNative_GetBufferData(nullptr, &bufferData);
    OH_ImageNative *dummyImage = nullptr;
    Image_ErrorCode err2 = OH_ImageNative_GetBufferData(dummyImage, nullptr);

    return CreateErrResultObj(env, err1, err2);
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createReceiver", createReceiver),
        DECLARE_NAPI_FUNCTION("nativeOn", nativeOn),
        DECLARE_NAPI_FUNCTION("nativeOff", nativeOff),
        DECLARE_NAPI_FUNCTION("imageArriveOn", imageArriveOn),
        DECLARE_NAPI_FUNCTION("imageArriveOff", imageArriveOff),
        DECLARE_NAPI_FUNCTION("imageReceiverTest", imageReceiverTest),
        DECLARE_NAPI_FUNCTION("waitForCondition", waitForCondition),
        DECLARE_NAPI_FUNCTION("imageArriveOn_Error", imageArriveOn_Error),
        DECLARE_NAPI_FUNCTION("imageArriveOff_Error", imageArriveOff_Error),
        DECLARE_NAPI_FUNCTION("releaseImageReceiver", releaseImageReceiver),
        DECLARE_NAPI_FUNCTION("testGetFormatNullptr", testGetFormatNullptr),
        DECLARE_NAPI_FUNCTION("testGetColorSpaceNullptr", testGetColorSpaceNullptr),
        DECLARE_NAPI_FUNCTION("testGetBufferDataNullptr", testGetBufferDataNullptr)
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
    .nm_modname = "ArriveOnNdk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterArriveOnNdkModule(void)
{
    napi_module_register(&demoModule);
}