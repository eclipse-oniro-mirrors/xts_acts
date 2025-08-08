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
#include <multimedia/image_framework/image/image_native.h>
#include <multimedia/image_framework/image/image_receiver_native.h>
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

#define DECLARE_NAPI_FUNCTION(name, func)                                                                              \
    {                                                                                                                  \
        (name), nullptr, (func), nullptr, nullptr, nullptr, napi_default, nullptr                                      \
    }

static constexpr int32_t NUM_0 = 0;
static constexpr int32_t NUM_1 = 1;
static constexpr int32_t NUM_2 = 2;
static constexpr int32_t NUM_3 = 3;
static constexpr int32_t NUM_4 = 4;

static const char *MYDATA_KEY_ID  = "callBackId";
static const char *MYDATA_KEY_NUM  = "num";
static const char *MYDATA_KEY_STR  = "str";
static const char *MYDATA_KEY_BOOL = "callbackTriggered";
static int32_t g_myDataIndex = NUM_0;

std::string BoolToString(bool value)
{
    return value ? "true" : "false";
}

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
};
std::mutex g_mtx;
std::condition_variable g_condVar;
std::vector<std::shared_ptr<MyData>> g_myDataVector;
using CallbackFunc = void(*)(OH_ImageReceiverNative*, void*);

napi_value getJsResult(napi_env env, int result)
{
    napi_value resultNapi = nullptr;
    napi_create_int32(env, result, &resultNapi);
    return resultNapi;
}

static int32_t Getint32NamedProperty(napi_env env, napi_value object, const char* key)
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

MyData* GetMyData(size_t myDataIndex)
{
    try {
        return g_myDataVector.at(g_myDataIndex).get();
    } catch (const std::out_of_range& e) {
        OH_LOG_ERROR(LOG_APP, "GetMyData error is: %{public}s!", e.what());
        return nullptr;
    }
}

void NDKCamera(char *str)
{
    Camera_Manager *cameraManager = nullptr;
    Camera_Device *cameras = nullptr;
    Camera_OutputCapability *cameraOutputCapability = nullptr;
    Camera_PreviewOutput *previewOutput = nullptr;
    const Camera_Profile *previewProfile = nullptr;
    uint32_t size = NUM_0;
    uint32_t cameraDeviceIndex = NUM_0;
    char *previewSurfaceId = str;
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager);
    if (cameraManager == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_Camera_GetCameraManager failed.");
    }

    Camera_Input *cameraInput = nullptr;
    ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    for (int index = NUM_0; index < size; index++) {
        OH_LOG_INFO(LOG_APP, "cameraId  =  %{public}s ", cameras[index].cameraId);
        OH_LOG_INFO(LOG_APP, "cameraPosition  =  %{public}d ", cameras[index].cameraPosition);
        OH_LOG_INFO(LOG_APP, "cameraType  =  %{public}d ", cameras[index].cameraType);
        OH_LOG_INFO(LOG_APP, "connectionType  =  %{public}d ", cameras[index].connectionType);
    }
    if (cameras == nullptr || size < NUM_0 || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameras failed.");
    }
    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[NUM_0], &cameraInput);
    if (cameraInput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCameraInput failed.ret:%{public}d", ret);
    }

    ret = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager, &cameras[cameraDeviceIndex],
                                                              &cameraOutputCapability);
    if (cameraOutputCapability == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameraOutputCapability failed.");
    }
    if (cameraOutputCapability->previewProfilesSize < NUM_0) {
        OH_LOG_ERROR(LOG_APP, "previewProfilesSize == null");
    }
    previewProfile = cameraOutputCapability->previewProfiles[NUM_0];
    ret = OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, previewSurfaceId, &previewOutput);
    if (previewProfile == nullptr || previewOutput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePreviewOutput failed.");
    }

    ret = OH_CameraInput_Open(cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_open failed.");
    }

    Camera_CaptureSession *captureSession = nullptr;
    ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetSessionMode failed.");
    }

    ret = OH_CaptureSession_BeginConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_BeginConfig failed.");
    }

    ret = OH_CaptureSession_AddInput(captureSession, cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddInput failed.");
    }

    ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPreviewOutput failed.");
    }

    ret = OH_CaptureSession_CommitConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_CommitConfig failed.");
    }

    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Start failed.");
    } else {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_Start SUCC!");
    }
    return;
}

std::unique_ptr<char[]> ConvertUint64ToChar(uint64_t value)
{
    std::string strValue = std::to_string(value);
    auto charBuffer = std::make_unique<char[]>(strValue.size() + 1);
    std::copy(strValue.begin(), strValue.end(), charBuffer.get());
    charBuffer[strValue.size()] = '\0';

    return charBuffer;
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

    int32_t callBackId = Getint32NamedProperty(env, argValue[NUM_0], MYDATA_KEY_ID);
    int32_t num = Getint32NamedProperty(env, argValue[NUM_1], MYDATA_KEY_NUM);
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

    int32_t callBackId = Getint32NamedProperty(env, argValue[NUM_1], MYDATA_KEY_ID);
    int num = Getint32NamedProperty(env, argValue[NUM_1], MYDATA_KEY_NUM);
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

            napi_value temp = nullptr;
            napi_create_int32(env, userData->callBackId_, &temp);
            napi_set_named_property(env, object, MYDATA_KEY_ID, temp);
            napi_create_int32(env, userData->num_, &temp);
            napi_set_named_property(env, object, MYDATA_KEY_NUM, temp);

            napi_create_string_utf8(env, (const char *)(userData->s_.c_str()), NAPI_AUTO_LENGTH, &temp);
            napi_set_named_property(env, object, MYDATA_KEY_STR, temp);

            napi_get_boolean(env, userData->callbackTriggered_, &temp);
            napi_set_named_property(env, object, MYDATA_KEY_BOOL, temp);
            return object;
        }
    } catch (const std::out_of_range& e) {
        OH_LOG_ERROR(LOG_APP, "waitForCondition error: %{public}s!", e.what());
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }
}

static napi_value imageReceiverTest(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {nullptr};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        OH_LOG_ERROR(LOG_APP, "imageReceiverTest, the input parameters are smaller than the required parameters");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImageReceiverNative *receiver = reinterpret_cast<OH_ImageReceiverNative *>(ptr);

    uint64_t surfaceID = NUM_0;
    Image_ErrorCode errCode = OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &surfaceID);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "imageReceiverTest get image receiver surfaceID failed, errCode: %{public}d.",
            errCode);
        OH_ImageReceiverNative_Release(receiver);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "imageReceiverTest get image receiver surfaceID: %{public}llu.", surfaceID);
    auto surfaceID_c = ConvertUint64ToChar(surfaceID);
    NDKCamera(surfaceID_c.get());
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
        g_myDataVector.clear();
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "releaseImageReceiver image receive is nullptr!");
    g_myDataVector.clear();
    return getJsResult(env, IMAGE_SUCCESS);
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
        DECLARE_NAPI_FUNCTION("releaseImageReceiver", releaseImageReceiver)
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