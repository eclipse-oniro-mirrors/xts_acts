/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "ImageOHImageSourceInfoCreateTest.h"
#include <cstdlib>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <cstddef>
#include <cstdint>
#include <native_color_space_manager/native_color_space_manager.h>
#include <ohcamera/camera.h>
#include <ohcamera/camera_input.h>
#include <ohcamera/camera_manager.h>
#include <ohcamera/capture_session.h>
#include <ohcamera/photo_output.h>
#include <ohcamera/preview_output.h>
#include <string>
#include <thread>
#include <multimedia/image_framework/image_mdk.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image/image_receiver_native.h>
#include <multimedia/image_framework/image/image_native.h>
#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)
#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"
#define IMAGE_NULL_STRING ""
#define EFFECT_SUCCESS 0
#define EFFECT_ERROR_PARAM_INVALID 401
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9
#define CASE_INDEX_10 10
#define CASE_INDEX_11 11
#define IMAGE_EFFECT_2 2
#define IMAGE_EFFECT_100 100
#define IMAGE_EFFECT_100F 100.f
#define IMAGE_EFFECT_50F 50.f
#define IMAGE_EFFECT_100D 100.0
#define IMAGE_EFFECT_1000 1000
#define IMAGE_EFFECT_1024 1024
#define IMAGE_EFFECT_1048576 1048576
#define IMAGE_EFFECT_1073741824 1073741824
#define IMAGE_EFFECT_1080 1080
#define IMAGE_EFFECT_1920 1920
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401
#define IMAGE_EFFECT_1722514390000 1722514390000
#define PIXELMAP_TEST_DATA_SIZE 2400
#define LOG_DOMAIN 0x0000
#define LOG_TAG "OHCreatePixelmapNativeNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define IMAGE_BUFFER_SIZE (1920 * 1080 * 4)
#define IMAGE_DATA_LENGTH (-2400)
#define IMAGE_DEFAULT_BUFFER 10000
static Camera_Manager *cameraManager = nullptr;
static Camera_Input *cameraInput = nullptr;
static Camera_Device *cameras = nullptr;
static Camera_Profile *previewProfile = nullptr;
static Camera_Profile *photoProfile = nullptr;
static Camera_PreviewOutput *previewOutput = nullptr;
static Camera_PhotoOutput *photoOutput = nullptr;
static Camera_CaptureSession *captureSession = nullptr;
#define NEED_SLEEP_SECONDS 1
#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 480
#define IMAGE_CAPACITY 2
#define MAX_PATH_SIZE 1024
#define UNSUPPORTED_CAMERA_FORMAT (-1)
static constexpr int32_t NUM_0 = 0;
static void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    LOGI("CameraManagerStatusCallback is called");
}

static CameraManager_Callbacks *GetCameraManagerListener()
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
}

static void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    LOGI("OnCameraInput errorCode: %{public}d", errorCode);
}

static CameraInput_Callbacks *GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}

static bool IsSupportedSceneMode(Camera_Device camera, Camera_SceneMode sceneMode)
{
    Camera_SceneMode *sceneModes = nullptr;
    uint32_t sceneModeSize = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedSceneModes(&camera, &sceneModes, &sceneModeSize);
    if (sceneModes == nullptr || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_GetSupportedSceneModes failed.");
        return false;
    }
    for (uint32_t index = 0; index < sceneModeSize; index++) {
        LOGI("scene mode = %{public}u ", sceneModes[index]);
        if (sceneModes[index] == sceneMode) {
            return true;
        }
    }
    return false;
}

static void CreateAndOpenCamera()
{
    uint32_t size = 0;
    uint32_t cameraDeviceIndex = 0;
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager);
    LOGI("OH_Camera_GetCameraManager failed. %{public}d", ret);
    if (cameraManager == nullptr || ret != CAMERA_OK) {
        LOGI("OH_Camera_GetCameraManager failed.");
        return;
    }
    ret = OH_CameraManager_RegisterCallback(cameraManager, GetCameraManagerListener());
    if (ret != CAMERA_OK) {
        LOGI("OH_CameraManager_RegisterCallback failed.");
    }
    ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    if (cameras == nullptr || size == 0 || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_GetSupportedCameras failed. %{public}d", ret);
        return;
    }
    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[cameraDeviceIndex], &cameraInput);
    if (cameraInput == nullptr || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_CreateCameraInput failed. %{public}d", ret);
        return;
    }
    ret = OH_CameraInput_RegisterCallback(cameraInput, GetCameraInputListener());
    if (ret != CAMERA_OK) {
        LOGI("OH_CameraInput_RegisterCallback failed.");
    }
    ret = OH_CameraInput_Open(cameraInput);
    if (ret != CAMERA_OK) {
        LOGI("OH_CameraInput_open failed.");
        return;
    }
    LOGI("camer input 创建成功");
}

static void CreatePhotoOutput(const char *surfaceID)
{
    const Camera_Device camera = cameras[0];
    Camera_OutputCapability *cameraOutputCapability = nullptr;
    bool isSupported = IsSupportedSceneMode(camera, Camera_SceneMode::NORMAL_PHOTO);
    if (!isSupported) {
        LOGI("NORMAL_PHOTO is not supported.");
    }
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager, &camera, Camera_SceneMode::NORMAL_PHOTO, &cameraOutputCapability);
    if (cameraOutputCapability == nullptr || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_GetSupportedCameraOutputCapability failed.");
    }
    if (cameraOutputCapability->previewProfiles == nullptr) {
        LOGI("previewProfiles == null");
    } else {
        previewProfile = cameraOutputCapability->previewProfiles[0];
    }
    if (cameraOutputCapability->photoProfiles == nullptr) {
        LOGI("photoProfiles == null");
    } else {
        photoProfile = cameraOutputCapability->photoProfiles[0];
    }
    Camera_ErrorCode preCode =
        OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, surfaceID, &previewOutput);
    if (cameraOutputCapability == nullptr || preCode != CAMERA_OK) {
        LOGI("OH_CameraManager_CreatePreviewOutput failed. %{public}d  %{public}s", preCode, surfaceID);
    }
    Camera_ErrorCode photoSurface =
        OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, photoProfile, &photoOutput);
    if (cameraOutputCapability == nullptr || photoSurface != CAMERA_OK) {
        LOGI("OH_CameraManager_CreatePhotoOutputWithoutSurface failed.");
    }
}

static void CreateCaptureSession()
{
    if (cameraManager == nullptr) {
        LOGI("cameraManager is nullptr.");
    }
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_SetSessionMode failed.");
    }
    ret = OH_CaptureSession_BeginConfig(captureSession);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_BeginConfig failed.");
    }
    ret = OH_CaptureSession_AddInput(captureSession, cameraInput);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_AddInput failed.");
    }
    ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_AddPreviewOutput failed.");
    }
    ret = OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_AddPhotoOutput failed.");
    }
    ret = OH_CaptureSession_CommitConfig(captureSession);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_CommitConfig failed.");
    }
    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_Start failed.");
    }
    LOGI("camera session start end");
}
static OH_ImageReceiverNative *receiver = nullptr;
static OH_ImageReceiverOptions *options = nullptr;
napi_value OHImageSourceInfoCreateTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_ImageSource_Info *ImageInfo = nullptr;
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ImageSourceInfo_Create(&ImageInfo);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, errorCode, &result);
    return result;
}
napi_value OHImageNativeGetFormatTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageReceiverNative_On start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageReceiverNative_On error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ImageReceiverOptions *options = nullptr;
    OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver = nullptr;
    OH_ImageReceiverNative_Create(options, &receiver);
    uint64_t surfaceId = 0;
    OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &surfaceId);
    LOGI("surfaceId is:%{public}d", surfaceId);
    auto myImageReceiverCallback = [](OH_ImageReceiverNative *receiver) {
        LOGI("ImageReceiverNativeCTest buffer available.");
    };
    Image_ErrorCode errCode = OH_ImageReceiverNative_On(receiver, myImageReceiverCallback);
    std::string surfaceIDStr = std::to_string(surfaceId);
    const char *constCharPtr = surfaceIDStr.c_str();
    CreateAndOpenCamera();
    CreatePhotoOutput(constCharPtr);
    CreateCaptureSession();
    std::this_thread::sleep_for(std::chrono::seconds(NEED_SLEEP_SECONDS));
    OH_ImageNative *image = nullptr;
    errCode = OH_ImageReceiverNative_ReadLatestImage(receiver, &image);
    if (errCode != IMAGE_SUCCESS) {
        LOGI("ImageReceiverNativeCTest get image receiver next image failed, errCode: %{public}d.", errCode);
    }
    OH_NativeBuffer_Format format;
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ImageNative_GetFormat(image, &format);
        break;
    case CASE_INDEX_2:
        image = nullptr;
        errorCode = OH_ImageNative_GetFormat(image, &format);
        break;
    default:
        break;
    }
    if (captureSession != nullptr) {
        OH_CaptureSession_Release(captureSession);
    }
    if (photoOutput != nullptr) {
        OH_PhotoOutput_Release(photoOutput);
    }
    if (image != nullptr) {
        errCode = OH_ImageNative_Release(image);
    }
    if (receiver != nullptr) {
        errCode = OH_ImageReceiverNative_Release(receiver);
    }
    if (options != nullptr) {
        errCode = OH_ImageReceiverOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    LOGI("OH_ImageReceiverNative_On end");
    return result;
}
napi_value OHImageNativeGetBufferDataTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageReceiverNative_On start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageReceiverNative_On error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ImageReceiverOptions *options = nullptr;
    OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver = nullptr;
    OH_ImageReceiverNative_Create(options, &receiver);
    uint64_t surfaceId = 0;
    OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &surfaceId);
    LOGI("surfaceId is:%{public}d", surfaceId);
    auto myImageReceiverCallback = [](OH_ImageReceiverNative *receiver) {
        LOGI("ImageReceiverNativeCTest buffer available.");
    };
    Image_ErrorCode errCode = OH_ImageReceiverNative_On(receiver, myImageReceiverCallback);
    std::string surfaceIDStr = std::to_string(surfaceId);
    const char *constCharPtr = surfaceIDStr.c_str();
    CreateAndOpenCamera();
    CreatePhotoOutput(constCharPtr);
    CreateCaptureSession();
    std::this_thread::sleep_for(std::chrono::seconds(NEED_SLEEP_SECONDS));
    OH_ImageNative *image = nullptr;
    OH_ImageBufferData imageBufferData;
    errCode = OH_ImageReceiverNative_ReadLatestImage(receiver, &image);
    if (errCode != IMAGE_SUCCESS) {
        LOGI("ImageReceiverNativeCTest get image receiver next image failed, errCode: %{public}d.", errCode);
    }
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ImageNative_GetBufferData(image, &imageBufferData);
        break;
    case CASE_INDEX_2:
        errorCode = OH_ImageNative_GetBufferData(nullptr, &imageBufferData);
        break;
    default:
        break;
    }
    if (captureSession != nullptr) {
        OH_CaptureSession_Release(captureSession);
    }
    if (photoOutput != nullptr) {
        OH_PhotoOutput_Release(photoOutput);
    }
    if (image != nullptr) {
        errCode = OH_ImageNative_Release(image);
    }
    if (receiver != nullptr) {
        errCode = OH_ImageReceiverNative_Release(receiver);
    }
    if (options != nullptr) {
        errCode = OH_ImageReceiverOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    LOGI("OH_ImageReceiverNative_On end");
    return result;
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
napi_value OHImageNativeGetColorSpaceTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageReceiverNative_On start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageReceiverNative_On error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = InitReceiverOptions(options);
    LOGI("InitReceiverOptions is:%{public}d", errCode);
    OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver = nullptr;
    OH_ImageReceiverNative_Create(options, &receiver);
    uint64_t surfaceId = 0;
    OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &surfaceId);
    LOGI("surfaceId is:%{public}d", surfaceId);
    auto myImageReceiverCallback = [](OH_ImageReceiverNative *receiver) {
        LOGI("ImageReceiverNativeCTest buffer available.");
    };
    errCode = OH_ImageReceiverNative_On(receiver, myImageReceiverCallback);
    std::string surfaceIDStr = std::to_string(surfaceId);
    const char *constCharPtr = surfaceIDStr.c_str();
    CreateAndOpenCamera();
    CreatePhotoOutput(constCharPtr);
    CreateCaptureSession();
    std::this_thread::sleep_for(std::chrono::seconds(NEED_SLEEP_SECONDS));
    OH_ImageNative *image = nullptr;
    int32_t colorSpaceName ;
    errCode = OH_ImageReceiverNative_ReadNextImage(receiver, &image);
    if (errCode != IMAGE_SUCCESS) {
        LOGI("ImageReceiverNativeCTest get image receiver next image failed, errCode: %{public}d.", errCode);
    }
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        LOGI("OH_ImageReceiverNative_ReadLatestImage get image ,  %{public}p.", image);
        errorCode = OH_ImageNative_GetColorSpace(image, &colorSpaceName);
        break;
    case CASE_INDEX_2:
        errorCode = OH_ImageNative_GetColorSpace(nullptr, &colorSpaceName);
        break;
    default:
        break;
    }
    if (captureSession != nullptr) {
        OH_CaptureSession_Release(captureSession);
    }
    if (photoOutput != nullptr) {
        OH_PhotoOutput_Release(photoOutput);
    }
    if (image != nullptr) {
        errCode = OH_ImageNative_Release(image);
    }
    if (receiver != nullptr) {
        errCode = OH_ImageReceiverNative_Release(receiver);
    }
    if (options != nullptr) {
        errCode = OH_ImageReceiverOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    LOGI("OH_ImageReceiverNative_On end");
    return result;
}
napi_value OHPixelmapNativeReadPixelsTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    uint8_t *data = nullptr;
    size_t dataLength = 0;
    const int height = 30;
    const int width = 20;
    dataLength = PIXELMAP_TEST_DATA_SIZE;
    data = (uint8_t *)malloc(dataLength);
    Image_ErrorCode code;
    OH_Pixelmap_InitializationOptions *ops;
    code = OH_PixelmapInitializationOptions_Create(&ops);
    code = OH_PixelmapInitializationOptions_SetWidth(ops, width);
    code = OH_PixelmapInitializationOptions_SetHeight(ops, height);
    code = OH_PixelmapInitializationOptions_SetPixelFormat(ops, PIXEL_FORMAT_BGRA_8888);
    code = OH_PixelmapInitializationOptions_SetAlphaType(ops, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    uint8_t *buffer;
    uint8_t *destination;
    size_t bufferSize = 0;
    size_t imageBufferSize = 0;
    bufferSize = IMAGE_BUFFER_SIZE;
    imageBufferSize = IMAGE_BUFFER_SIZE;
    buffer = (uint8_t *)malloc(bufferSize);
    destination = (uint8_t *)malloc(imageBufferSize);
    code = OH_PixelmapNative_CreatePixelmap(data, dataLength, ops, &pixelmap);
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_PixelmapNative_ReadPixels(pixelmap, destination, &imageBufferSize);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, errorCode, &result);
    return result;
}
napi_value OHPixelmapNativeWritePixelsTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    uint8_t *data = nullptr;
    size_t dataLength = 0;
    const int height = 30;
    const int width = 20;
    dataLength = PIXELMAP_TEST_DATA_SIZE;
    data = (uint8_t *)malloc(dataLength);
    Image_ErrorCode code;
    OH_Pixelmap_InitializationOptions *ops;
    code = OH_PixelmapInitializationOptions_Create(&ops);
    code = OH_PixelmapInitializationOptions_SetWidth(ops, width);
    code = OH_PixelmapInitializationOptions_SetHeight(ops, height);
    code = OH_PixelmapInitializationOptions_SetPixelFormat(ops, PIXEL_FORMAT_BGRA_8888);
    code = OH_PixelmapInitializationOptions_SetAlphaType(ops, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    uint8_t *buffer;
    uint8_t *destination;
    size_t bufferSize = 0;
    size_t imageBufferSize = 0;
    bufferSize = IMAGE_BUFFER_SIZE;
    imageBufferSize = IMAGE_BUFFER_SIZE;
    buffer = (uint8_t *)malloc(bufferSize);
    destination = (uint8_t *)malloc(imageBufferSize);
    code = OH_PixelmapNative_CreatePixelmap(data, dataLength, ops, &pixelmap);
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_PixelmapNative_ReadPixels(pixelmap, destination, &imageBufferSize);
        errorCode = OH_PixelmapNative_WritePixels(pixelmap, destination, imageBufferSize);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, errorCode, &result);
    return result;
}
napi_value OHImageNativeGetBufferDataValueTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageReceiverNative_On start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageReceiverNative_On error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ImageReceiverOptions *options = nullptr;
    OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver = nullptr;
    OH_ImageReceiverNative_Create(options, &receiver);
    uint64_t surfaceId = 0;
    OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &surfaceId);
    LOGI("surfaceId is:%{public}d", surfaceId);
    auto myImageReceiverCallback = [](OH_ImageReceiverNative *receiver) {
        LOGI("ImageReceiverNativeCTest buffer available.");
    };
    Image_ErrorCode errCode = OH_ImageReceiverNative_On(receiver, myImageReceiverCallback);
    std::string surfaceIDStr = std::to_string(surfaceId);
    const char *constCharPtr = surfaceIDStr.c_str();
    CreateAndOpenCamera();
    CreatePhotoOutput(constCharPtr);
    CreateCaptureSession();
    std::this_thread::sleep_for(std::chrono::seconds(NEED_SLEEP_SECONDS));
    OH_ImageNative *image = nullptr;
    OH_ImageBufferData imageBufferData;
    errCode = OH_ImageReceiverNative_ReadLatestImage(receiver, &image);
    if (errCode != IMAGE_SUCCESS) {
        LOGI("ImageReceiverNativeCTest get image receiver next image failed, errCode: %{public}d.", errCode);
    }
    errCode = OH_ImageNative_GetBufferData(image, &imageBufferData);
    int code;
    switch (index) {
    case CASE_INDEX_1:
        if (imageBufferData.nativeBuffer != nullptr && imageBufferData.bufferSize > 0) {
            code = EFFECT_SUCCESS;
        } else {
            code = EFFECT_ERROR_PARAM_INVALID;
        }
        break;
    case CASE_INDEX_2:
        if (imageBufferData.bufferSize > 0) {
            code = EFFECT_SUCCESS;
        } else {
            code = EFFECT_ERROR_PARAM_INVALID;
        }
        break;
    case CASE_INDEX_3:
        if (imageBufferData.pixelStride != nullptr && imageBufferData.numStride > 0) {
            code = EFFECT_SUCCESS;
        } else {
            code = EFFECT_ERROR_PARAM_INVALID;
        }
        break;
    case CASE_INDEX_4:
        if (imageBufferData.numStride > 0) {
            code = EFFECT_SUCCESS;
        } else {
            code = EFFECT_ERROR_PARAM_INVALID;
        }
        break;
    case CASE_INDEX_5:
        if (imageBufferData.rowStride != nullptr && imageBufferData.numStride > 0) {
            code = EFFECT_SUCCESS;
        } else {
            code = EFFECT_ERROR_PARAM_INVALID;
        }
        break;
    case CASE_INDEX_6:
        if (imageBufferData.nativeBuffer != nullptr) {
            code = EFFECT_SUCCESS;
        } else {
            code = EFFECT_ERROR_PARAM_INVALID;
        }
        break;
    default:
        break;
    }
    if (captureSession != nullptr) {
        OH_CaptureSession_Release(captureSession);
    }
    if (photoOutput != nullptr) {
        OH_PhotoOutput_Release(photoOutput);
    }
    if (image != nullptr) {
        errCode = OH_ImageNative_Release(image);
    }
    if (receiver != nullptr) {
        errCode = OH_ImageReceiverNative_Release(receiver);
    }
    if (options != nullptr) {
        errCode = OH_ImageReceiverOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    LOGI("OH_ImageReceiverNative_On end");
    return result;
}