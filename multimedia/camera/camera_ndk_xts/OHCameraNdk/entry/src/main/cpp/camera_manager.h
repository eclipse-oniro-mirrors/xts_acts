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

#ifndef OHCAMERANDK_CAMERA_MANAGER_H
#define OHCAMERANDK_CAMERA_MANAGER_H

#include <ohcamera/camera.h>
#include <ohcamera/camera_manager.h>
#include "hilog/log.h"

#define CAMERA_LOG_TAG "CAMERA_TAGLOG"
#define CAMERA_LOG_DOMAIN 0x00000
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)

typedef enum CameraCallbackCode {
    CAMERA_INPUT_STATUS = 1,
    PREVIEW_ON_FRAME_START = 2,
    PREVIEW_ON_FRAME_END = 3,
    PREVIEW_ON_ERROR = 4,
    PHOTO_ON_FRAME_START = 5,
    PHOTO_ON_FRAME_SHUTTER = 6,
    PHOTO_ON_FRAME_END = 7,
    PHOTO_ON_ERROR = 8,
    VIDEO_ON_FRAME_START = 9,
    VIDEO_ON_FRAME_END = 10,
    VIDEO_ON_ERROR = 11,
    SESSION_ON_FOCUS_STATE_CHANGE = 14,
    SESSION_ON_ERROR = 15,
    CAMERA_MANAGER_STATUS = 16,
    NO_RECEIVED = 10086,
} CameraCallbackCode;
typedef enum UseCaseCode {
    PARAMETER_OK = 0,     // 参数正常
    PARAMETER1_ERROR = 1, // 参数1异常
    PARAMETER2_ERROR = 2, // 参数2异常
    PARAMETER3_ERROR = 3, // 参数3异常
    PARAMETER4_ERROR = 4, // 参数4异常
} UseCaseCode;
class NDKCamera {
public:
    NDKCamera(char *str, int index);
    ~NDKCamera(void);

    bool isMirror_;         // 是否支持镜像拍照
    bool hasFlash_;         // 检测是否有闪关灯
    bool isFlashMode_;      // 检测闪光灯模式是否支持
    bool isExposureMode_;   // 是否支持曝光模式的结果。
    float minExposureBias_; // 曝光补偿的最小值。
    float maxExposureBias_; // 曝光补偿的最大值。
    float exposureBias_;    // 当前的曝光补偿。
    bool isFocusSupported_;
    float minZoom_;
    float maxZoom_;
    float zoom_;
    bool isVideoSupported_;
    Camera_FlashMode flashMode_;
    Camera_ExposureMode exposureMode_; // 获取当前曝光模式。
    Camera_Point point_;               // 焦点
    Camera_FocusMode focusMode_;       // 聚焦模式
    Camera_Point focusPoint_;          // 焦点
    Camera_VideoStabilizationMode videoMode_;
    Camera_Device *cameras_;                          // 记录支持的Camera_Device列表。
    Camera_OutputCapability *cameraOutputCapability_; // 特定相机和特定模式支持的输出功能
    // callback
    static CameraCallbackCode cameraCallbackCode_; // 回调码

    Camera_ErrorCode GetSupportedCameras(int useCaseCode);          // 获取支持相机的描述
    Camera_ErrorCode CreatePreviewOutput(int useCaseCode);          // 创建预览输出实例
    Camera_ErrorCode GetSupportedOutputCapability(int useCaseCode); // 获取特定相机和特定模式支持的输出功能
    Camera_ErrorCode CameraDeleteCameraManager(int useCaseCode);                          // 删除CameraManager实例
    Camera_ErrorCode CameraManagerDeleteSupportedCameras(int useCaseCode);                // 删除支持的相机。
    Camera_ErrorCode CreateCameraInput(int useCaseCode);                                  // 创建相机输入实例。
    Camera_ErrorCode CreateSession(int useCaseCode);                                      // 创建捕获会话实例。
    Camera_ErrorCode CreateMetadataOutput(int useCaseCode);                               // 创建捕获会话实例。
    Camera_ErrorCode CameraInputOpen(int useCaseCode);                                    // 打开相机。
    Camera_ErrorCode CameraInputClose(int useCaseCode);                                   // 关闭相机。
    Camera_ErrorCode CameraInputRelease(int useCaseCode);                                 // 释放相机输入实例。
    Camera_ErrorCode CameraManagerDeleteSupportedCameraOutputCapability(int useCaseCode); // 删除支持的输出功能。
    Camera_ErrorCode CreateCameraInputWithPositionAndType(Camera_Position position, Camera_Type type,
                                                          int useCaseCode); // 创建具有位置和类型的相机输入实例。
    Camera_ErrorCode CreatePhotoOutput(char *photoSurfaceId, int useCaseCode);    // 创建一个拍照输出实例。
    Camera_ErrorCode CreateVideoOutput(char *videoId, int useCaseCode);           // 创建一个录像输出实例。
    Camera_ErrorCode AddVideoOutput(int useCaseCode);                             // 添加录像输出。
    Camera_ErrorCode VideoOutputStart(int useCaseCode);                           // 开始录像输出。
    Camera_ErrorCode VideoOutputStop(int useCaseCode);                            // 停止录像输出。
    Camera_ErrorCode SessionAddInput(int useCaseCode);                            // 添加相机输入。。
    Camera_ErrorCode VideoOutputRelease(int useCaseCode);                         // 释放录像输出。。
    Camera_ErrorCode SessionRemoveVideoOutput(int useCaseCode);                   // 删除录像输出。。
    Camera_ErrorCode SessionRemoveInput(int useCaseCode);                         // 删除相机输入。。
    Camera_ErrorCode SessionAddPreviewOutput(int useCaseCode);                    // 添加预览输出。。
    Camera_ErrorCode SessionAddPhotoOutput(int useCaseCode);                      // 添加拍照输出。。
    Camera_ErrorCode SessionBegin(int useCaseCode);                               // 开始捕获会话配置。。
    Camera_ErrorCode SessionCommitConfig(int useCaseCode);                        // 提交捕获会话配置。
    Camera_ErrorCode SessionStart(int useCaseCode);                               // 启动捕获会话配置。
    Camera_ErrorCode SessionStop(int useCaseCode);                                // 停止捕获会话。
    Camera_ErrorCode SessionRelease(int useCaseCode);                             // 释放捕获会话。
    Camera_ErrorCode IsCameraMuted(int useCaseCode);                              // 确定相机是否静音。
    Camera_ErrorCode SessionGetExposureBias(int useCaseCode);                     // 获取当前曝光补偿。
    Camera_ErrorCode SessionGetExposureBiasRange(int useCaseCode);                // 获取当前曝光补偿区间。
    Camera_ErrorCode SessionGetExposureMode(int useCaseCode);                     // 获取当前曝光补偿区间。
    Camera_ErrorCode SessionSetExposureBias(float exposureBias, int useCaseCode); // 设置曝光补偿。
    Camera_ErrorCode SessionIsExposureModeSupported(uint32_t mode, int useCaseCode); // 检查是否支持指定的曝光模式
    Camera_ErrorCode SessionSetExposureMode(uint32_t mode, int useCaseCode);         // 设置曝光模式
    Camera_ErrorCode SessionIsFlashModeSupported(uint32_t mode, int useCaseCode); // 检测闪光灯模式是否支持
    Camera_ErrorCode SessionSetFlashMode(uint32_t mode, int useCaseCode);         // 设置闪光灯模式
    Camera_ErrorCode SessionIsVideoStabilizationModeSupported(uint32_t mode,
                                                              int useCaseCode); // 检查是否支持指定的录像防抖模式
    Camera_ErrorCode SessionIsFocusModeSupported(uint32_t mode, int useCaseCode); // 检查是否支持指定的聚焦模式
    Camera_ErrorCode SessionSetVideoStabilizationMode(uint32_t mode, int useCaseCode); // 设置录像防抖模式
    Camera_ErrorCode SessionHasFlash(int useCaseCode);                                 // 检测是否有闪关灯
    Camera_ErrorCode SessionGetFlashMode(int useCaseCode);                             // 获取当前闪光灯模式
    Camera_ErrorCode SessionGetFocusMode(int useCaseCode);                             // 获取当前聚焦模式
    Camera_ErrorCode SessionGetFocusPoint(int useCaseCode);                            // 获取当前聚焦模式。
    Camera_ErrorCode SessionGetMeteringPoint(int useCaseCode);                         // 获取当前测量点。
    Camera_ErrorCode SessionGetZoomRatio(int useCaseCode);                             // 获取当前缩放比例。
    Camera_ErrorCode SessionGetZoomRatioRange(int useCaseCode);         // 获取所有支持的缩放比例范围。
    Camera_ErrorCode SessionGetVideoStabilizationMode(int useCaseCode); // 获取当前录像防抖模式。
    Camera_ErrorCode SessionRemovePreviewOutput(int useCaseCode);       // 删除预览输出。
    Camera_ErrorCode SessionRemovePhotoOutput(int useCaseCode);         // 删除拍照输出。
    Camera_ErrorCode SessionSetZoomRatio(float zoom, int useCaseCode);  // 设置缩放比例。
    Camera_ErrorCode SessionSetFocusPoint(double point_x, double point_y, int useCaseCode);    // 设置聚焦模式。
    Camera_ErrorCode SessionSetMeteringPoint(double point_x, double point_y, int useCaseCode); // 设置聚焦模式。
    Camera_ErrorCode PreviewOutputStart(int useCaseCode);                                      // 开始预览输出
    Camera_ErrorCode PreviewOutputStop(int useCaseCode);                                       // 停止预览输出
    Camera_ErrorCode PreviewOutputRelease(int useCaseCode);                                    // 停止预览输出
    Camera_ErrorCode IsMirrorSupported(int useCaseCode);  // 检查是否支持镜像拍照
    Camera_ErrorCode PhotoOutputCapture(int useCaseCode); // 拍摄照片
    Camera_ErrorCode PhotoOutputRelease(int useCaseCode); // 释放拍照输出
    Camera_ErrorCode TakePictureWithPhotoSettings(Camera_PhotoCaptureSetting photoSetting,
                                                  int useCaseCode); // 使用捕获设置捕获拍照
    // RegisterCallback
    Camera_ErrorCode CameraManagerRegisterCallback(int useCaseCode);  // 注册相机状态更改事件回调。
    Camera_ErrorCode PreviewOutputRegisterCallback(int useCaseCode);  // 注册预览输出更改事件回调。
    Camera_ErrorCode CameraInputRegisterCallback(int useCaseCode);    // 注册相机输入更改事件回调。
    Camera_ErrorCode CaptureSessionRegisterCallback(int useCaseCode); // 注册捕获会话事件回调
    Camera_ErrorCode VideoOutputRegisterCallback(int useCaseCode);    // 注册录像输出更改事件回调
    Camera_ErrorCode PhotoOutputRegisterCallback(int useCaseCode);    // 注册拍照输出更改事件回调
    // UnRegisterCallback。
    Camera_ErrorCode CameraManagerUnRegisterCallback(int useCaseCode);  // 注销预览输出更改事件回调
    Camera_ErrorCode CaptureSessionUnRegisterCallback(int useCaseCode); // 注销捕获会话事件回调
    Camera_ErrorCode CameraInputUnRegisterCallback(int useCaseCode);    // 注销相机输入更改事件回调。
    Camera_ErrorCode PhotoOutputUnRegisterCallback(int useCaseCode);    // 注销拍照输出更改事件回调
    Camera_ErrorCode PreviewOutputUnRegisterCallback(int useCaseCode);  //
    Camera_ErrorCode VideoOutputUnRegisterCallback(int useCaseCode);    // 注销录像输出更改事件回调
    // Get callback
    CameraManager_Callbacks *GetCameraManagerListener(void);   // 相机状态监听
    PreviewOutput_Callbacks *GetPreviewOutputListener(void);   // 预览输出更改事件监听
    CameraInput_Callbacks *GetCameraInputListener(void);       // 注册相机输入更改事件监听
    CaptureSession_Callbacks *GetCaptureSessionRegister(void); // 注册捕获会话事件监听
    VideoOutput_Callbacks *GetVideoOutputListener(void);       // 注册录像监听
    PhotoOutput_Callbacks *GetPhotoOutputListener(void);       // 注册拍照输出监听

private:
    Camera_Manager *cameraManager_; // CameraManager实例。
    Camera_CaptureSession *captureSession_;
    uint32_t size_; // 记录支持的Camera_Device列表的大小。
    const Camera_Profile *profile_;
    const Camera_VideoProfile *vProfile_;
    Camera_PreviewOutput *previewOutput_; // 预览输出实例
    Camera_PhotoOutput *photoOutput_;
    Camera_VideoOutput *videoOutput_;
    const Camera_MetadataObjectType *metaDataObjectType_; // 用于创建Camera_MetadataOutput
    Camera_MetadataOutput *metadataOutput_;
    Camera_Input *cameraInput_;
    bool *isCameraMuted_;    // 确定相机是否静音。
    char *previewSurfaceId_; // 用于创建Camera_PreviewOutput。
    Camera_ErrorCode ret_;   // 错误码
    float step_;             // 每个级别之间的曝光补偿阶梯

    volatile bool valid_; // CameraManager实例是否存在。
};


#endif // OHCAMERANDK_CAMERA_MANAGER_H
