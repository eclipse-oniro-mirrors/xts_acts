/*
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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
#include <js_native_api.h>
#include <multimedia/player_framework/avplayer.h>
#include <multimedia/player_framework/avmedia_source.h>
#include "multimedia/player_framework/avplayer_base.h"
#include "multimedia/player_framework/native_averrors.h"
#include <string>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <hilog/log.h>
#include <map>
#include <fstream>
#include <cstring>
#include "multimedia/player_framework/native_avcodec_base.h"
#include <fcntl.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

#define LOG_MSG_TAG "AVPlayerNDK"

#define LOG(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGE(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define ONEVAL 1
#define SUCCESS 0
#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5

std::string g_filePath;
const int64_t MAX_COUNT = 999999999;
const int64_t FILE_LENGTH = 1894335;
const char *VIDEO_SOURCE = "/data/storage/el2/base/files/H264_AAC.mp4";

void OnSurfaceCreatedCB(OH_NativeXComponent *component, void *window);
void OnSurfaceDestroyedCB(OH_NativeXComponent *component, void *window);

class SampleRenderer {
public:
    explicit SampleRenderer(std::string &id) { this->id_ = id; }
    ~SampleRenderer() {}
    static SampleRenderer *GetInstance(std::string &id)
    {
        if (instance_.find(id) == instance_.end()) {
            SampleRenderer *instance = new SampleRenderer(id);
            instance_[id] = instance;
            return instance;
        } else {
            return instance_[id];
        }
    }
    static void Release(std::string &id)
    {
        SampleRenderer *render = SampleRenderer::GetInstance(id);
        if (render != nullptr) {
            instance_.erase(instance_.find(id));
        }
    }
    void RegisterCallback(OH_NativeXComponent *nativeXComponent)
    {
        renderCallback_.OnSurfaceCreated = OnSurfaceCreatedCB;
        renderCallback_.OnSurfaceDestroyed = OnSurfaceDestroyedCB;
        OH_NativeXComponent_RegisterCallback(nativeXComponent, &renderCallback_);
    }

public:
    static std::unordered_map<std::string, SampleRenderer *> instance_;
    std::string id_;

private:
    OH_NativeXComponent_Callback renderCallback_;
};
std::unordered_map<std::string, SampleRenderer *> SampleRenderer::instance_;

class SampleManager {
public:
    ~SampleManager()
    {
        LOG("Callback ~PluginManager");
        for (auto iter = nativeXComponentMap_.begin(); iter != nativeXComponentMap_.end(); ++iter) {
            if (iter->second != nullptr) {
                delete iter->second;
                iter->second = nullptr;
            }
        }
        nativeXComponentMap_.clear();
        for (auto iter = pluginRenderMap_.begin(); iter != pluginRenderMap_.end(); ++iter) {
            if (iter->second != nullptr) {
                delete iter->second;
                iter->second = nullptr;
            }
        }
        pluginRenderMap_.clear();
    }
    static SampleManager *GetInstance() { return &SampleManager::pluginManager_; }
    void SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent)
    {
        if (nativeXComponent == nullptr) {
            return;
        }
        surfaceId_ = &id;
        nativeXComponentMap_[id] = nativeXComponent;
    }
    void SetNativeWindow(OHNativeWindow *nativeWindow, uint64_t width, uint64_t height)
    {
        nativeWindow_ = nativeWindow;
        height_ = height;
        width_ = width;
    }
    void Export(napi_env env, napi_value exports)
    {
        LOG("Call PluginManager::Export");
        if ((env == nullptr) || (exports == nullptr)) {
            LOG("PluginManager %{public}s", "Export: env or exports is null");
            return;
        }
        napi_value exportInstance = nullptr;
        if (napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance) != napi_ok) {
            LOG("PluginManager %{public}s", "Export: napi_get_named_property fail");
            return;
        }
        OH_NativeXComponent *nativeXComponent = nullptr;
        if (napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent)) != napi_ok) {
            LOG("PluginManager %{public}s", "Export: napi_unwrap fail");
            return;
        }
        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
        uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
        int32_t nativeXComponentid = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
        if (nativeXComponentid != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
            LOG("PluginManager Export: OH_NativeXComponent_GetXComponentId fail");
            return;
        }
        LOG("Call PluginManager::Export surfaceID=%{public}s", idStr);
        std::string id(idStr);
        auto context = SampleManager::GetInstance();
        if ((context != nullptr) && (nativeXComponent != nullptr)) {
            context->SetNativeXComponent(id, nativeXComponent);
            auto render = context->GetRender(id);
            if (render != nullptr) {
                render->RegisterCallback(nativeXComponent);
            }
        }
    }
    SampleRenderer *GetRender(std::string &id)
    {
        if (pluginRenderMap_.find(id) == pluginRenderMap_.end()) {
            SampleRenderer *instance = SampleRenderer::GetInstance(id);
            pluginRenderMap_[id] = instance;
            return instance;
        }
        return pluginRenderMap_[id];
    }

public:
    static SampleManager pluginManager_;
    std::unordered_map<std::string, SampleRenderer *> pluginRenderMap_;
    std::unordered_map<std::string, OH_NativeXComponent *> nativeXComponentMap_;
    std::string *surfaceId_;
    OHNativeWindow *nativeWindow_ = nullptr;
    uint64_t height_;
    uint64_t width_;
    OH_NativeXComponent_Callback renderCallback_;
};
SampleManager SampleManager::pluginManager_;

void OnSurfaceCreatedCB(OH_NativeXComponent *component, void *window)
{
    LOG("OnSurfaceCreatedCB");
    if ((component == nullptr) || (window == nullptr)) {
        return;
    }
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    if (OH_NativeXComponent_GetXComponentId(component, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    uint64_t width;
    uint64_t height;
    OH_NativeXComponent_GetXComponentSize(component, window, &width, &height);
    auto context = SampleManager::GetInstance();
    OHNativeWindow *nativeWindow = static_cast<OHNativeWindow *>(window);
    if ((context != nullptr) && (nativeWindow != nullptr)) {
        context->SetNativeWindow(nativeWindow, width, height);
    }
}
void OnSurfaceDestroyedCB(OH_NativeXComponent *component, void *window)
{
    LOG("OnSurfaceDestroyedCB");
    if ((component == nullptr) || (window == nullptr)) {
        return;
    }
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    if (OH_NativeXComponent_GetXComponentId(component, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    std::string id(idStr);
    SampleRenderer::Release(id);
}

typedef struct NdkAVPlayerUser {
    using OnInfoFunc = std::function<void(OH_AVPlayer *player, OH_AVFormat *infoBody)>;
    using StateChangeFunc = std::function<void()>;
    NdkAVPlayerUser();
    NdkAVPlayerUser(const NdkAVPlayerUser &other) = delete;
    NdkAVPlayerUser& operator=(const NdkAVPlayerUser &other) = delete;
    ~NdkAVPlayerUser();
    void InitAVPlayer(int32_t fd, int64_t offset, int64_t size);
    void InitAVPlayer(const char *url);
    void OnStateChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnSuperResolutionCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void HandleOnInfoStateChange(OH_AVPlayer *player, AVPlayerState state);
    void InitAVDataSource(int64_t size);
    void RegisterTrackChangeCb();
    void OnTrackChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void InitAVPlayerByMediaSource(int32_t fd, int64_t offset, int64_t size);
    void InitAVPlayerByMediaSource(const char* url);
    void InitAVPlayerByMediaSource();
    void InitAVPlayerByMediaSourceLoader(const char* url);
    void RespondHeader(int64_t uuid);
    void FinishLoading(int64_t uuid);
    void RespondData(int64_t uuid, int64_t requestedOffset, int64_t requestedLength);
    std::map<uint32_t, OnInfoFunc> onInfoFuncs_;
    std::map<uint32_t, StateChangeFunc> stateChangeFuncs_;
    OH_AVPlayer *player = nullptr;
    int32_t errorCode = AV_ERR_OK;
    int32_t callbackError = AV_ERR_OK;
    AVPlayerState avState = AV_IDLE;
    int32_t state = -1;
    int32_t stateChangeReason = -1;
    int32_t isEnableSuperResolution = -1;
    int32_t width = -1;
    int32_t height = -1;
    OH_AVDataSource *dataSource;
    OH_AVFormat* playbackInfoFormat = nullptr;
    int32_t trackCount = -1;
    int32_t trackIndex = -1;
    int32_t isTrackSelect = -1;
    int32_t selectedTrackIndex = -1;
    OH_AVMediaSource *mediaSource = nullptr;
    OH_AVHttpHeader *headers = nullptr;
    OH_AVMediaSourceLoader* loader = nullptr;
    int64_t uuid = 0;
    std::map<int64_t, OH_AVMediaSourceLoadingRequest*> requests_;
    bool needHeader = true;
    int64_t respondDataCount = MAX_COUNT;
    AVLoadingRequestError loadingError = AV_LOADING_ERROR_SUCCESS;
    int32_t fd = -1;
    int64_t fileOffset = 0;
    int64_t fileSize = 0;
    OH_AVPlaybackStrategy *playbackStrategy = nullptr;
    OH_AVFormat* trackFormat = nullptr;
    int32_t isLoaderClosed = 0;
    OH_AVSeiMessageArray* message = nullptr;
    int playbackposition = -1;
} NdkAVPlayerUser;
static void AVPlayerOnInfoCallbackImpl(OH_AVPlayer *player, AVPlayerOnInfoType type, OH_AVFormat *infoBody,
    void *userData)
{
    NdkAVPlayerUser *user = reinterpret_cast<NdkAVPlayerUser *>(userData);
    if (user == nullptr || player == nullptr) {
        LOGE("AVPlayerOnInfoCallbackImpl user is nullptr");
        return;
    }
    LOG("OnInfo type %{public}d", type);
    if (user->onInfoFuncs_.count(type) > 0) {
        user->onInfoFuncs_[type](player, infoBody);
    } else {
        LOG("OnInfo: no member func, type %{public}d", type);
    }
    return;
}
static void AVPlayerOnErrorCallbackImpl(OH_AVPlayer *player, int32_t errorCode, const char *errorMsg, void *userData)
{
    LOG("AVPlayerOnErrorCallbackImpl errorCode: %{public}d ,errorMsg: %{public}s",
        errorCode, errorMsg == nullptr ? "unknown" : errorMsg);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(userData);
    if (ndkAVPlayerUser == nullptr || player == nullptr) {
        LOGE("AVPlayerOnErrorCallbackImpl ndkAVPlayerUser or player is nullptr");
        return;
    }
    ndkAVPlayerUser->callbackError = errorCode;
}
static int64_t AVMediaSourceLoaderOnSourceOpenedCallbackImpl(OH_AVMediaSourceLoadingRequest* request, void *userData)
{
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(userData);
    ndkAVPlayerUser->uuid++;
    ndkAVPlayerUser->requests_.emplace(ndkAVPlayerUser->uuid, request);
    return ndkAVPlayerUser->uuid;
}
static void AVMediaSourceLoaderOnSourceReadCallbackImpl(int64_t uuid, int64_t requestedOffset,
    int64_t requestedLength, void *userData)
{
    LOG("AVMediaSourceLoaderOnSourceReadCallbackImpl length: %{public}lld ,position: %{public}lld",
        requestedLength, requestedOffset);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(userData);
    if (ndkAVPlayerUser->requests_.find(uuid) == ndkAVPlayerUser->requests_.end()) {
        LOGE("AVMediaSourceLoaderOnSourceReadCallbackImpl request not found for uuid: %{public}lld", uuid);
        return;
    }
    if (ndkAVPlayerUser->needHeader) {
        ndkAVPlayerUser->RespondHeader(uuid);
        return;
    }
    if (ndkAVPlayerUser->respondDataCount == 0) {
        ndkAVPlayerUser->FinishLoading(uuid);
    } else {
        ndkAVPlayerUser->respondDataCount--;
        if (ndkAVPlayerUser->loadingError == AV_LOADING_ERROR_NOT_READY) {
            ndkAVPlayerUser->loadingError = AV_LOADING_ERROR_SUCCESS;
            ndkAVPlayerUser->FinishLoading(uuid);
            return;
        }
        LOG("Responding data for uuid: %{public}lld, offset: %{public}lld, length: %{public}lld",
            uuid, requestedOffset, requestedLength);
        ndkAVPlayerUser->RespondData(uuid, requestedOffset, requestedLength);
        if (requestedOffset + requestedLength >= ndkAVPlayerUser->fileOffset &&
            ndkAVPlayerUser->loadingError == AV_LOADING_ERROR_SUCCESS) {
            ndkAVPlayerUser->FinishLoading(uuid);
        }
    }
}
static void AVMediaSourceLoaderOnSourceClosedCallbackImpl(int64_t uuid, void *userData)
{
    LOG("AVMediaSourceLoaderOnSourceClosedCallbackImpl uuid: %{public}lld", uuid);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(userData);
    ndkAVPlayerUser->requests_.erase(uuid);
    ndkAVPlayerUser->needHeader = true;
    ndkAVPlayerUser->isLoaderClosed = 1;
}
int32_t DataSourceReadAtCallback(OH_AVBuffer *buffer, int32_t length, int64_t pos)
{
    return 0;
}

NdkAVPlayerUser::NdkAVPlayerUser()
{
    onInfoFuncs_ = {
        { AV_INFO_TYPE_STATE_CHANGE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnStateChangeCb(player, infoBody); } },
        { AV_INFO_TYPE_SUPER_RESOLUTION_CHANGED,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnSuperResolutionCb(player, infoBody); } },
    };
    player = OH_AVPlayer_Create();
}

NdkAVPlayerUser::~NdkAVPlayerUser()
{
    if (player != nullptr) {
        OH_AVPlayer_Release(player);
        player = nullptr;
    }
    if (playbackInfoFormat != nullptr) {
        OH_AVFormat_Destroy(playbackInfoFormat);
        playbackInfoFormat = nullptr;
    }
    if (loader != nullptr) {
        OH_AVMediaSourceLoader_Destroy(loader);
        loader = nullptr;
    }
    if (headers != nullptr) {
        OH_AVHttpHeader_Destroy(headers);
        headers = nullptr;
    }
    if (playbackStrategy != nullptr) {
        OH_AVPlaybackStrategy_Destroy(playbackStrategy);
        playbackStrategy = nullptr;
    }
    if (trackFormat != nullptr) {
        OH_AVFormat_Destroy(trackFormat);
    }
    mediaSource = nullptr;
}

void NdkAVPlayerUser::RespondHeader(int64_t targetUuid)
{
    OH_AVMediaSourceLoadingRequest* request = requests_[targetUuid];
    const char* redirectUrl = nullptr;
    OH_AVMediaSourceLoadingRequest_GetUrl(request, &redirectUrl);
    if (headers == nullptr) {
        OH_AVMediaSourceLoadingRequest_GetHttpHeader(request, &headers);
    }
    OH_AVHttpHeader_AddRecord(headers, "content-length", "1894335");
    OH_AVMediaSourceLoadingRequest_RespondHeader(request, targetUuid, headers, redirectUrl);
    needHeader = false;
}

void NdkAVPlayerUser::FinishLoading(int64_t targetUuid)
{
    OH_AVMediaSourceLoadingRequest* request = requests_[targetUuid];
    OH_AVMediaSourceLoadingRequest_FinishLoading(request, targetUuid, loadingError);
}

void NdkAVPlayerUser::RespondData(int64_t targetUuid, int64_t requestedOffset, int64_t requestedLength)
{
    OH_AVMediaSourceLoadingRequest* request = requests_[targetUuid];
    if (requestedLength <= 0) {
        return;
    }
    uint8_t *fileBuffer = new uint8_t[requestedLength];
    if (!fileBuffer) {
        LOGE("Failed to allocate memory");
        return;
    }
    ssize_t bytesRead = pread(fd, fileBuffer, requestedLength, fileOffset + requestedOffset);
    if (bytesRead < 0) {
        LOGE("read failed, error: %{public}s", strerror(errno));
        delete[] fileBuffer;
        return;
    }
    for (int i = 0; i < bytesRead; i++) {
        LOG("fileBuffer [%{public}d]: %{public}d", i, fileBuffer[i]);
    }

    if (bytesRead > 0) {
        LOG("Read %{public}d bytes from file", bytesRead);
        uint64_t dataSize = static_cast<uint64_t>(bytesRead);
        LOG("Responding with dataSize: %{public}llu", dataSize);
        int32_t ret = OH_AVMediaSourceLoadingRequest_RespondData(request, targetUuid, requestedOffset,
                                                   fileBuffer, dataSize);
        LOG("OH_AVMediaSourceLoadingRequest_RespondData ret:%{public}d", ret);
    } else {
        LOGE("No data read from file");
    }

    delete[] fileBuffer;
}

void NdkAVPlayerUser::RegisterTrackChangeCb()
{
    onInfoFuncs_.emplace(
        AV_INFO_TYPE_TRACKCHANGE,
        [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnTrackChangeCb(player, infoBody); }
    );
}

void NdkAVPlayerUser::OnTrackChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    LOG("AVPlayerOnInfoType AV_INFO_TYPE_TRACKCHANGE");
    int32_t index = -1;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_TRACH_CHANGE_INFO_TRACK_INDEX, &index);
    int32_t isSelect = -1;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_TRACH_CHANGE_INFO_TRACK_SELECTED, &isSelect);
    LOG("OH_PLAYER_TRACKCHANGE_INDEX value: %{public}d", index);
    this->selectedTrackIndex = index;
    this->isTrackSelect = isSelect;
}

void NdkAVPlayerUser::OnStateChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    LOG("AVPlayerOnInfoType AV_INFO_TYPE_STATE_CHANGE");
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_STATE, &this->state);
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_STATE_CHANGE_REASON, &this->stateChangeReason);
    LOG("AV_INFO_TYPE_STATE_CHANGE  state: %{public}d ,stateChangeReason: %{public}d",
        this->state, this->stateChangeReason);
    this->avState = static_cast<AVPlayerState>(this->state);
    HandleOnInfoStateChange(player, this->avState);
}

void NdkAVPlayerUser::HandleOnInfoStateChange(OH_AVPlayer *player, AVPlayerState state)
{
    if (player == nullptr) {
        return;
    }
    int32_t ret = -1;
    switch (state) {
    case AV_IDLE: {
        LOG("HandleOnInfoStateChange AVPlayerState AV_IDLE");
        break;
    }
    case AV_INITIALIZED: {
        LOG("HandleOnInfoStateChange AVPlayerState AV_INITIALIZED");
        if (this->stateChangeFuncs_.count(AV_INITIALIZED) > 0) {
            this->stateChangeFuncs_[AV_INITIALIZED]();
        }
        auto context = SampleManager::GetInstance();
        ret = OH_AVPlayer_SetVideoSurface(player, context->nativeWindow_);
        LOG("HandleOnInfoStateChange OH_AVPlayer_SetVideoSurface ret:%{public}d", ret);
        ret = OH_AVPlayer_Prepare(player);
        LOG("HandleOnInfoStateChange OH_AVPlayer_Prepare ret:%{public}d", ret);
        break;
    }
    case AV_PREPARED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_PREPARED");
        if (this->stateChangeFuncs_.count(AV_PREPARED) > 0) {
            this->stateChangeFuncs_[AV_PREPARED]();
        }
        ret = OH_AVPlayer_Play(player);
        LOG("HandleOnInfoStateChange OH_AVPlayer_Play ret:%{public}d", ret);
        break;
    case AV_PLAYING:
        if (this->stateChangeFuncs_.count(AV_PLAYING) > 0) {
            this->stateChangeFuncs_[AV_PLAYING]();
        }
        LOG("HandleOnInfoStateChange AVPlayerState AV_PLAYING");
        break;
    case AV_PAUSED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_PAUSED");
        break;
    case AV_STOPPED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_STOPPED");
        break;
    case AV_COMPLETED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_COMPLETED");
        ret = OH_AVPlayer_Stop(player);
        if (ret != AV_ERR_OK) {
            LOGE("player %{public}s", "HandleOnInfoStateChange OH_AVPlayer_Stop error");
        }
        break;
    case AV_ERROR:
        LOG("HandleOnInfoStateChange AVPlayerState AV_ERROR");
        break;
    case AV_RELEASED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_RELEASED");
        break;
    default:
        break;
    }
}
void NdkAVPlayerUser::OnSuperResolutionCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    LOG("AVPlayerOnInfoType AV_INFO_TYPE_SUPER_RESOLUTION_CHANGED");
    (void)player;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_SUPER_RESOLUTION_ENABLE_STATE, &this->isEnableSuperResolution);
    LOG("OH_PLAYER_SUPER_RESOLUTION_ENABLE_STATE value: %{public}d", this->isEnableSuperResolution);
}
void NdkAVPlayerUser::InitAVPlayer(int32_t descriptor, int64_t offset, int64_t size)
{
    if (player == nullptr) {
        LOGE("InitAVPlayer player is nullptr");
        return;
    }
    LOG("InitAVPlayer SetOnInfoCallback");
    OH_AVPlayer_SetOnInfoCallback(player, AVPlayerOnInfoCallbackImpl, this);
    OH_AVPlayer_SetOnErrorCallback(player, AVPlayerOnErrorCallbackImpl, this);
    OH_AVPlayer_SetFDSource(player, descriptor, offset, size);
}
void NdkAVPlayerUser::InitAVPlayer(const char *url)
{
    if (player == nullptr) {
        LOGE("InitAVPlayer player is nullptr");
        return;
    }
    LOG("InitAVPlayer SetOnInfoCallback");
    OH_AVPlayer_SetOnInfoCallback(player, AVPlayerOnInfoCallbackImpl, this);
    OH_AVPlayer_SetOnErrorCallback(player, AVPlayerOnErrorCallbackImpl, this);
    OH_AVPlayer_SetURLSource(player, url);
}
void NdkAVPlayerUser::InitAVPlayerByMediaSource(int32_t fileDescriptor, int64_t offset, int64_t size)
{
    if (player == nullptr) {
        LOGE("InitAVPlayerByMediaSource player is nullptr");
        return;
    }
    LOG("InitAVPlayerByMediaSource SetOnInfoCallback");
    OH_AVPlayer_SetOnInfoCallback(player, AVPlayerOnInfoCallbackImpl, this);
    OH_AVPlayer_SetOnErrorCallback(player, AVPlayerOnErrorCallbackImpl, this);
    mediaSource = OH_AVMediaSource_CreateWithFd(fileDescriptor, offset, size);
    OH_AVPlayer_SetMediaSource(player, mediaSource);
}
void NdkAVPlayerUser::InitAVPlayerByMediaSource()
{
    if (player == nullptr) {
        LOGE("InitAVPlayerByMediaSource player is nullptr");
        return;
    }
    LOG("InitAVPlayerByMediaSource SetOnInfoCallback");
    OH_AVPlayer_SetOnInfoCallback(player, AVPlayerOnInfoCallbackImpl, this);
    OH_AVPlayer_SetOnErrorCallback(player, AVPlayerOnErrorCallbackImpl, this);
    OH_AVDataSource dataSource = { fileSize, &DataSourceReadAtCallback };
    mediaSource = OH_AVMediaSource_CreateWithDataSource(&dataSource);
    OH_AVPlayer_SetMediaSource(player, mediaSource);
}
void NdkAVPlayerUser::InitAVPlayerByMediaSourceLoader(const char* url)
{
    if (player == nullptr) {
        LOGE("InitAVPlayerByMediaSourceLoader player is nullptr");
        return;
    }
    LOG("InitAVPlayerByMediaSourceLoader SetOnInfoCallback");
    OH_AVPlayer_SetOnInfoCallback(player, AVPlayerOnInfoCallbackImpl, this);
    OH_AVPlayer_SetOnErrorCallback(player, AVPlayerOnErrorCallbackImpl, this);
    headers = OH_AVHttpHeader_Create();
    mediaSource = OH_AVMediaSource_CreateWithUrl(url, headers);
    loader = OH_AVMediaSourceLoader_Create();
    OH_AVMediaSourceLoader_SetSourceOpenCallback(loader, AVMediaSourceLoaderOnSourceOpenedCallbackImpl, this);
    OH_AVMediaSourceLoader_SetSourceReadCallback(loader, AVMediaSourceLoaderOnSourceReadCallbackImpl, this);
    OH_AVMediaSourceLoader_SetSourceCloseCallback(loader, AVMediaSourceLoaderOnSourceClosedCallbackImpl, this);
    OH_AVMediaSource_SetMediaSourceLoader(mediaSource, loader);
    OH_AVPlayer_SetMediaSource(player, mediaSource);
}
void NdkAVPlayerUser::InitAVPlayerByMediaSource(const char* url)
{
    if (player == nullptr) {
        LOGE("InitAVPlayerByMediaSource player is nullptr");
        return;
    }
    LOG("InitAVPlayerByMediaSource by url");
    OH_AVPlayer_SetOnInfoCallback(player, AVPlayerOnInfoCallbackImpl, this);
    OH_AVPlayer_SetOnErrorCallback(player, AVPlayerOnErrorCallbackImpl, this);
    headers = OH_AVHttpHeader_Create();
    mediaSource = OH_AVMediaSource_CreateWithUrl(url, headers);
    OH_AVMediaSource_SetMimeType(mediaSource, "application/m3u8");
    errorCode = OH_AVPlayer_SetMediaSource(player, mediaSource);
    LOG("InitAVPlayerByMediaSource Set media source result: %{public}d", errorCode);
}
void NdkAVPlayerUser::InitAVDataSource(int64_t size)
{
    if (player == nullptr) {
        LOGE("InitAVDataSource player is nullptr");
        return;
    }
}

static int32_t Getint32NamedProperty(napi_env env, napi_value object, const char* key)
{
    napi_value temp = nullptr;
    int32_t ulResult = 0;
    napi_get_named_property(env, object, key, &temp);
    napi_get_value_int32(env, temp, &ulResult);
    return ulResult;
}

static int64_t Getint64NamedProperty(napi_env env, napi_value object, const char* key)
{
    napi_value temp = nullptr;
    int64_t ulResult = 0;
    napi_get_named_property(env, object, key, &temp);
    napi_get_value_int64(env, temp, &ulResult);
    return ulResult;
}

static void ExtractFileDescriptor(napi_env env, napi_value object, int32_t &fd, int64_t &offset, int64_t &size)
{
    fd = Getint32NamedProperty(env, object, "fd");
    offset = Getint64NamedProperty(env, object, "offset");
    size = Getint64NamedProperty(env, object, "size");
}

static void SetInt32NamedProperty(napi_env env, napi_value object, const char* key, int32_t value)
{
    napi_value temp = nullptr;
    napi_create_int32(env, value, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

static void SetUInt32NamedProperty(napi_env env, napi_value object, const char* key, uint32_t value)
{
    napi_value temp = nullptr;
    napi_create_uint32(env, value, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

static void SetUserDataProperty(napi_env env, napi_value object, const char* key, NdkAVPlayerUser **avPlayerUser)
{
    napi_value temp = nullptr;
    napi_create_external(env, reinterpret_cast<void *>(*avPlayerUser), nullptr, nullptr, &temp);
    napi_set_named_property(env, object, "userData", temp);
    return;
}

static void SetUtf8NamedProperty(napi_env env, napi_value object, const char* key, const char *value)
{
    napi_value temp = nullptr;
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

static void SetDoubleNamedProperty(napi_env env, napi_value object, const char* key, double value)
{
    napi_value temp = nullptr;
    napi_create_double(env, value, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

static void SetInt64NamedProperty(napi_env env, napi_value object, const char* key, int64_t value)
{
    napi_value temp = nullptr;
    napi_create_int64(env, value, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

static bool SetPropertyString(napi_env env, napi_value &obj, const std::string &key, const std::string &value)
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

static void GetStringMetaData(struct OH_AVFormat *avMetadata, napi_env env, napi_value &JsMetadata, const char* &key)
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
    GetStringMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_CODEC_MIME);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_TRACK_TYPE);
    GetLongMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_BITRATE);
    GetDoubleMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_FRAME_RATE);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_WIDTH);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_HEIGHT);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_VIDEO_IS_HDR_VIVID);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_AUD_CHANNEL_COUNT);
    GetIntMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_AUD_SAMPLE_RATE);
    GetStringMetaData(avMetadata, env, JsMetadata, OH_MD_KEY_LANGUAGE);
}

static napi_value NAPI_TestSetVideoSuperResolution(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    bool isEnableSuperResolution = false;
    napi_get_value_bool(env, args[PARAM_1], &isEnableSuperResolution);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_INITIALIZED,
            [ndkAVPlayerUser]() {
                ndkAVPlayerUser->playbackStrategy = OH_AVPlaybackStrategy_Create();
                OH_AVErrCode ret = OH_AVPlaybackStrategy_SetSuperResolutionEnable(ndkAVPlayerUser->playbackStrategy,
                    true);
                LOG("SetSuperResolutionEnable ret:%{public}d", ret);
                ret = OH_AVPlayer_SetPlaybackStrategy(ndkAVPlayerUser->player, ndkAVPlayerUser->playbackStrategy);
                LOG("SetPlaybackStrategy ret:%{public}d", ret);
            }
        },
        { AV_PREPARED,
            [ndkAVPlayerUser, isEnableSuperResolution]() {
                ndkAVPlayerUser->errorCode = OH_AVPlayer_SetVideoSuperResolutionEnable(
                    ndkAVPlayerUser->player, isEnableSuperResolution);
                LOG("SetVideoSuperResolutionEnable in PREPARED ret:%{public}d", ndkAVPlayerUser->errorCode);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    SetInt32NamedProperty(env, result, "result", SUCCESS);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_CheckSuperResolutionState(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    bool expectValue;
    napi_get_value_bool(env, args[PARAM_1], &expectValue);
    int backParam = -1;
    LOG("NAPI_CheckAVPlayer isEnableSuperResolution: %{public}d", ndkAVPlayerUser->isEnableSuperResolution);
    LOG("NAPI_CheckAVPlayer expectValue: %{public}d", expectValue);
    LOG("NAPI_CheckAVPlayer errorCode: %{public}d", ndkAVPlayerUser->errorCode);
    napi_create_int32(env, ndkAVPlayerUser->errorCode, &result);
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    return result;
}

static napi_value NAPI_CheckAVPlayer(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    int backParam = -1;
    LOG("NAPI_CheckAVPlayer avState: %{public}d", ndkAVPlayerUser->avState);
    if (ndkAVPlayerUser != nullptr && ndkAVPlayerUser->avState == AV_STOPPED) {
        backParam = 0;
        delete ndkAVPlayerUser;
        ndkAVPlayerUser = nullptr;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value NAPI_TestSetVideoSuperResolutionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode errorCode = OH_AVPlayer_SetVideoSuperResolutionEnable(nullptr, false);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestSetTargetVideoWindowSizeError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode errorCode = OH_AVPlayer_SetTargetVideoWindowSize(nullptr, 720, 480);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestGetPlaybackInfoError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVFormat* format = OH_AVPlayer_GetPlaybackInfo(nullptr);
    OH_AVErrCode errorCode = (format == nullptr) ? AV_ERR_INVALID_VAL : AV_ERR_OK;
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestGetPlaybackPositionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_AVPlayer_GetPlaybackPosition(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value NAPI_TestSetTargetVideoWindowSize(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    size_t argc = 3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    int32_t width;
    int32_t height;
    napi_get_value_int32(env, args[PARAM_1], &width);
    napi_get_value_int32(env, args[PARAM_2], &height);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->width = width;
    ndkAVPlayerUser->height = height;
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_INITIALIZED,
            [ndkAVPlayerUser]() {
                ndkAVPlayerUser->playbackStrategy = OH_AVPlaybackStrategy_Create();
                OH_AVErrCode ret = OH_AVPlaybackStrategy_SetSuperResolutionEnable(
                    ndkAVPlayerUser->playbackStrategy, true);
                LOG("SetSuperResolutionEnable ret:%{public}d", ret);
                ret = OH_AVPlayer_SetPlaybackStrategy(ndkAVPlayerUser->player, ndkAVPlayerUser->playbackStrategy);
                LOG("SetPlaybackStrategy ret:%{public}d", ret);
                ret = OH_AVPlayer_SetVideoSuperResolutionEnable(ndkAVPlayerUser->player, true);
                LOG("SetVideoSuperResolutionEnable in INITIALIZED ret:%{public}d", ret);
                ndkAVPlayerUser->errorCode = OH_AVPlayer_SetTargetVideoWindowSize(ndkAVPlayerUser->player,
                    ndkAVPlayerUser->width, ndkAVPlayerUser->height);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    SetInt32NamedProperty(env, result, "result", SUCCESS);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_CheckErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    napi_create_int32(env, ndkAVPlayerUser->errorCode, &result);
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    return result;
}

static napi_value NAPI_CheckCallbackErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    LOG("NAPI_CheckCallbackErrorCode isLoaderClosed: %{public}d", ndkAVPlayerUser->isLoaderClosed);
    if (ndkAVPlayerUser->isLoaderClosed == PARAM_1) {
        napi_create_int32(env, ndkAVPlayerUser->callbackError, &result);
        delete ndkAVPlayerUser;
        ndkAVPlayerUser = nullptr;
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value NAPI_ReleaseUserData(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    return result;
}

static napi_value NAPI_TestSetDataSource(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t bufsize = 0;
    napi_get_value_string_utf8(env, args[PARAM_0], nullptr, 0, &bufsize);
    char *filePath = new char[bufsize + 1];
    napi_get_value_string_utf8(env, args[PARAM_0], filePath, bufsize + 1, nullptr);
    g_filePath = std::string(filePath, bufsize);
    int64_t size = 0;
    napi_get_value_int64(env, args[PARAM_1], &size);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->InitAVDataSource(size);
    delete[] filePath;
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_TestGetPlaybackInfo(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PREPARED,
            [ndkAVPlayerUser]() {
                ndkAVPlayerUser->playbackInfoFormat = OH_AVPlayer_GetPlaybackInfo(ndkAVPlayerUser->player);
                LOG("GetPlaybackInfo playbackInfoFormat:%{public}p", ndkAVPlayerUser->playbackInfoFormat);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_CheckPlaybackInfo(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    LOG("NAPI_CheckAVPlayer avState: %{public}d", ndkAVPlayerUser->avState);
    napi_create_object(env, &result);
    GetStringMetaData(ndkAVPlayerUser->playbackInfoFormat, env, result, OH_PLAYER_SERVER_IP_ADDRESS);
    GetIntMetaData(ndkAVPlayerUser->playbackInfoFormat, env, result, OH_PLAYER_IS_DOWNLOADING);
    GetLongMetaData(ndkAVPlayerUser->playbackInfoFormat, env, result, OH_PLAYER_BUFFER_DURATION);
    GetLongMetaData(ndkAVPlayerUser->playbackInfoFormat, env, result, OH_PLAYER_DOWNLOAD_RATE);
    GetLongMetaData(ndkAVPlayerUser->playbackInfoFormat, env, result, OH_PLAYER_AVG_DOWNLOAD_RATE);
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    return result;
}

static napi_value NAPI_TestGetTrackCount(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    bool nullAvPlayer = false;
    napi_get_value_bool(env, args[PARAM_1], &nullAvPlayer);
    int32_t trackCount = -1;
    if (nullAvPlayer) {
        trackCount = OH_AVPlayer_GetTrackCount(nullptr);
        napi_create_int32(env, trackCount, &result);
    } else {
        NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
        ndkAVPlayerUser->stateChangeFuncs_ = {
            { AV_PREPARED,
                [ndkAVPlayerUser]() {
                    ndkAVPlayerUser->trackCount = OH_AVPlayer_GetTrackCount(ndkAVPlayerUser->player);
                    LOG("NAPI_TestGetTrackCount after prepare trackCount:%{public}d", ndkAVPlayerUser->trackCount);
                }
            },
        };
        ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
        napi_create_object(env, &result);
        SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
        SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    }
    return result;
}

static napi_value NAPI_CheckTrackCount(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    LOG("NAPI_CheckTrackCount trackCount: %{public}d", ndkAVPlayerUser->trackCount);
    napi_create_int32(env, ndkAVPlayerUser->trackCount, &result);
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    return result;
}

static napi_value NAPI_TestGetTrackFormat(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    int32_t trackIndex = 0;
    napi_get_value_int32(env, args[PARAM_1], &trackIndex);
    bool nullAvPlayer = false;
    napi_get_value_bool(env, args[PARAM_2], &nullAvPlayer);
    LOG("NAPI_TestGetTrackFormat trackIndex:%{public}d, nullAvPlayer:%{public}d", trackIndex, nullAvPlayer);
    OH_AVFormat* trackFormat = nullptr;
    if (nullAvPlayer) {
        trackFormat = OH_AVPlayer_GetTrackFormat(nullptr, trackIndex);
        LOG("NAPI_TestGetTrackFormat with null player");
        if (trackFormat != nullptr) {
            LOG("NAPI_TestGetTrackFormat trackFormat:%{public}p", trackFormat);
            OH_AVFormat_Destroy(trackFormat);
        } else {
            napi_get_undefined(env, &result);
        }
    } else {
        NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
        ndkAVPlayerUser->stateChangeFuncs_ = {
            { AV_PREPARED,
                [ndkAVPlayerUser, trackIndex]() {
                    ndkAVPlayerUser->trackFormat = OH_AVPlayer_GetTrackFormat(ndkAVPlayerUser->player, trackIndex);
                    LOG("OH_AVPlayer_GetTrackFormat after prepare");
                }
            },
        };
        ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
        napi_create_object(env, &result);
        SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
        SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    }
    return result;
}
static napi_value NAPI_TestGetSubtitleTrackFormat(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    int32_t trackIndex = 0;
    napi_get_value_int32(env, args[PARAM_1], &trackIndex);
    int32_t subfd = 0;
    int64_t suboffset;
    int64_t subsize;
    ExtractFileDescriptor(env, args[PARAM_2], subfd, suboffset, subsize);
    LOG("NAPI_TestGetTrackFormat trackIndex:%{public}d", trackIndex);
    OH_AVFormat* trackFormat = nullptr;
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PLAYING,
            [ndkAVPlayerUser, trackIndex]() {
                ndkAVPlayerUser->trackFormat = OH_AVPlayer_GetTrackFormat(ndkAVPlayerUser->player, trackIndex);
                LOG("OH_AVPlayer_GetTrackFormat after prepare");
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    ndkAVPlayerUser->errorCode = OH_AVPlayer_AddFdSubtitleSource(ndkAVPlayerUser->player, subfd, suboffset, subsize);
    LOG("NAPI_TestGetSubtitleTrackFormat AddFdSubtitleSource ret: %{public}d", ndkAVPlayerUser->errorCode);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_CheckTrackFormat(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_undefined(env, &result);
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    if (ndkAVPlayerUser->trackFormat != nullptr) {
        napi_create_object(env, &result);
        CreateMediaDescription(ndkAVPlayerUser->trackFormat, env, result);
    }
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    return result;
}

static napi_value NAPI_OHAvPlayerPlayVideo(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_CheckPlaybackPosition(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    int32_t currentPosition = OH_AVPlayer_GetPlaybackPosition(ndkAVPlayerUser->player);
    LOG("NAPI_CheckPlaybackPosition currentPosition: %{public}d", currentPosition);
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    napi_create_int32(env, currentPosition, &result);
    return result;
}

static napi_value NAPI_TestTrackChange(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    int32_t trackIndex = 0;
    napi_get_value_int32(env, args[PARAM_1], &trackIndex);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->RegisterTrackChangeCb();
    ndkAVPlayerUser->trackIndex = trackIndex;
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PREPARED,
            [ndkAVPlayerUser]() {
                OH_AVPlayer_SelectTrack(ndkAVPlayerUser->player, ndkAVPlayerUser->trackIndex);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_CheckTrackChange(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    int backParam = -1;
    LOG("NAPI_CheckTrackChange selectedTrackIndex: %{public}d, isTrackSelect: %{public}d",
        ndkAVPlayerUser->selectedTrackIndex, ndkAVPlayerUser->isTrackSelect);
    if (ndkAVPlayerUser != nullptr && ndkAVPlayerUser->isTrackSelect == PARAM_1) {
        backParam = ndkAVPlayerUser->selectedTrackIndex;
    }
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value NAPI_TestMediaSourceWithFd(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->InitAVPlayerByMediaSource(fd, offset, size);
    SetInt32NamedProperty(env, result, "result", 0);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_TestMediaSourceWithUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t bufsize = 0;
    napi_get_value_string_utf8(env, args[PARAM_0], nullptr, 0, &bufsize);
    char *url = new char[bufsize + 1];
    napi_get_value_string_utf8(env, args[PARAM_0], url, bufsize + 1, nullptr);
    LOG("NAPI_TestMediaSourceWithUrl url=%{public}s", url);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->InitAVPlayerByMediaSource(url);
    delete[] url;
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_TestSetDataSourceDelegate(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    size_t argc = 3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t respondDataCount = 0;
    napi_get_value_int64(env, args[PARAM_0], &respondDataCount);
    uint32_t loadingErr = 0;
    napi_get_value_uint32(env, args[PARAM_1], &loadingErr);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ExtractFileDescriptor(env, args[PARAM_2], ndkAVPlayerUser->fd, ndkAVPlayerUser->fileOffset,
        ndkAVPlayerUser->fileSize);
    LOG("NAPI_TestSetDataSourceDelegate respondDataCount=%{public}lld, loadingErr=%{public}u,"
        " fd=%{public}d, offset=%{public}lld, size=%{public}lld",
        respondDataCount, loadingErr, ndkAVPlayerUser->fd, ndkAVPlayerUser->fileOffset, ndkAVPlayerUser->fileSize);
    ndkAVPlayerUser->respondDataCount = respondDataCount;
    ndkAVPlayerUser->loadingError = static_cast<AVLoadingRequestError>(loadingErr);
    ndkAVPlayerUser->InitAVPlayerByMediaSourceLoader("https://xxx/xx.mp4");
    SetInt32NamedProperty(env, result, "result", 0);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_TestAVHttpHeaderDestroyError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode errorCode = OH_AVHttpHeader_Destroy(nullptr);
    LOGE("NAPI_TestAVHttpHeaderDestroyError errorCode=%{public}d", errorCode);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVHttpHeaderAddRecordError(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int headerType;
    int stringType;
    napi_get_value_int32(env, args[PARAM_0], &headerType);
    napi_get_value_int32(env, args[PARAM_1], &stringType);
    OH_AVErrCode errorCode;
    if (headerType == PARAM_1) {
        errorCode = OH_AVHttpHeader_AddRecord(nullptr, "content-length", "1894335");
    } else if (stringType == 0) {
        OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
        errorCode = OH_AVHttpHeader_AddRecord(header, "", "");
        OH_AVHttpHeader_Destroy(header);
    } else {
        OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
        errorCode = OH_AVHttpHeader_AddRecord(header, nullptr, nullptr);
        OH_AVHttpHeader_Destroy(header);
    }
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVHttpHeaderGetCount(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
    OH_AVHttpHeader_AddRecord(header, "content-length", "1894335");
    OH_AVHttpHeader_AddRecord(header, "content-type", "video/mp4");
    uint32_t count = 0;
    OH_AVHttpHeader_GetCount(header, &count);
    OH_AVHttpHeader_Destroy(header);
    napi_create_int32(env, count, &result);
    return result;
}

static napi_value NAPI_TestAVHttpHeaderGetCountError(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[PARAM_0], &param);
    OH_AVErrCode errorCode;
    if (param == 0) {
        uint32_t count = 0;
        errorCode = OH_AVHttpHeader_GetCount(nullptr, &count);
    } else {
        OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
        errorCode = OH_AVHttpHeader_GetCount(header, nullptr);
        OH_AVHttpHeader_Destroy(header);
    }
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVHttpHeaderGetRecord(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t headerType = 0;
    int index;
    int32_t stringType = 0;
    napi_get_value_int32(env, args[PARAM_0], &headerType);
    napi_get_value_int32(env, args[PARAM_1], &index);
    napi_get_value_int32(env, args[PARAM_2], &stringType);
    OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
    OH_AVHttpHeader_AddRecord(header, "content-length", "1894335");
    OH_AVHttpHeader_AddRecord(header, "content-type", "video/mp4");
    const char* key = nullptr;
    const char* value = nullptr;
    OH_AVErrCode errorCode;
    if (headerType == PARAM_1) {
        errorCode = OH_AVHttpHeader_GetRecord(nullptr, 0, &key, &value);
    } else if (index == PARAM_1) {
        errorCode = OH_AVHttpHeader_GetRecord(header, -1, &key, &value);
    } else if (stringType == PARAM_1) {
        errorCode = OH_AVHttpHeader_GetRecord(header, 0, nullptr, nullptr);
    } else {
        errorCode = OH_AVHttpHeader_GetRecord(header, 0, &key, &value);
        if (strcmp(key, "content-length") != 0 || strcmp(value, "1894335") != 0) {
            errorCode = AV_ERR_INVALID_VAL;
        }
    }
    OH_AVHttpHeader_Destroy(header);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestMediaSourceCreateWithUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t stringType = 0;
    int32_t headerType = 0;
    napi_get_value_int32(env, args[PARAM_0], &stringType);
    napi_get_value_int32(env, args[PARAM_1], &headerType);
    OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
    OH_AVHttpHeader_AddRecord(header, "content-length", "1894335");
    OH_AVMediaSource* mediaSource = nullptr;
    if (stringType == PARAM_1) {
        mediaSource = OH_AVMediaSource_CreateWithUrl("", header);
    } else if (stringType == PARAM_2) {
        mediaSource = OH_AVMediaSource_CreateWithUrl(nullptr, header);
    } else if (headerType == PARAM_1) {
        mediaSource = OH_AVMediaSource_CreateWithUrl("http://example.com/video.mp4", nullptr);
    } else {
        mediaSource = OH_AVMediaSource_CreateWithUrl("http://example.com/video.mp4", header);
    }
    OH_AVErrCode errorCode = (mediaSource == nullptr) ? AV_ERR_INVALID_VAL : AV_ERR_OK;
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestMediaSourceCreateWithFD(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    OH_AVMediaSource* mediaSource = OH_AVMediaSource_CreateWithFd(fd, offset, size);
    OH_AVErrCode errorCode = (mediaSource == nullptr) ? AV_ERR_INVALID_VAL : AV_ERR_OK;
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestMediaSourceCreateWithDataSource(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t dataType = 0;
    napi_get_value_int32(env, args[PARAM_0], &dataType);
    int32_t fd;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_1], fd, offset, size);
    OH_AVMediaSource* mediaSource = nullptr;
    if (dataType == PARAM_1) {
        mediaSource = OH_AVMediaSource_CreateWithDataSource(nullptr);
    } else {
        OH_AVDataSource dataSource = { size, &DataSourceReadAtCallback };
        mediaSource = OH_AVMediaSource_CreateWithDataSource(&dataSource);
    }
    OH_AVErrCode errorCode = (mediaSource == nullptr) ? AV_ERR_INVALID_VAL : AV_ERR_OK;
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestMediaSourceSetMimeType(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t sourceType = 0;
    int32_t stringType = 0;
    napi_get_value_int32(env, args[PARAM_0], &sourceType);
    napi_get_value_int32(env, args[PARAM_1], &stringType);
    OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
    OH_AVMediaSource* mediaSource = OH_AVMediaSource_CreateWithUrl("http://example.com/video.mp4", header);
    OH_AVErrCode errorCode;
    if (sourceType == PARAM_1) {
        errorCode = OH_AVMediaSource_SetMimeType(nullptr, "application/m3u8");
    } else if (stringType == PARAM_1) {
        errorCode = OH_AVMediaSource_SetMimeType(mediaSource, "");
    } else if (stringType == PARAM_2) {
        errorCode = OH_AVMediaSource_SetMimeType(mediaSource, nullptr);
    } else {
        errorCode = OH_AVMediaSource_SetMimeType(mediaSource, "application/m3u8");
    }
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVPlayerSetMediaSource(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t headerType = 0;
    int32_t dataSourceType = 0;
    napi_get_value_int32(env, args[PARAM_0], &headerType);
    napi_get_value_int32(env, args[PARAM_0], &dataSourceType);
    OH_AVMediaSource* mediaSource = OH_AVMediaSource_CreateWithUrl("http://example.com/video.mp4", nullptr);
    OH_AVPlayer* player = OH_AVPlayer_Create();
    const char* mimeType = nullptr;
    OH_AVErrCode errorCode;
    if (headerType == PARAM_1) {
        errorCode = OH_AVPlayer_SetMediaSource(nullptr, mediaSource);
    } else if (dataSourceType == PARAM_1) {
        errorCode = OH_AVPlayer_SetMediaSource(player, nullptr);
    } else {
        errorCode = OH_AVPlayer_SetMediaSource(player, mediaSource);
    }
    OH_AVPlayer_Release(player);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVMediaSourceLoaderDestroyError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode errorCode = OH_AVMediaSourceLoader_Destroy(nullptr);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TesAVMediaSourceSetMediaSourceLoaderError(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t params = 0;
    napi_get_value_int32(env, args[PARAM_0], &params);
    OH_AVMediaSource* mediaSource = OH_AVMediaSource_CreateWithUrl("http://example.com/video.mp4", nullptr);
    OH_AVMediaSourceLoader* loader = OH_AVMediaSourceLoader_Create();
    OH_AVErrCode errorCode;
    if (params == 0) {
        errorCode = OH_AVMediaSource_SetMediaSourceLoader(mediaSource, nullptr);
    } else {
        errorCode = OH_AVMediaSource_SetMediaSourceLoader(nullptr, loader);
    }
    OH_AVMediaSourceLoader_Destroy(loader);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVMetaSourceLoadingRequestGetUrlError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* url = nullptr;
    OH_AVErrCode errorCode = OH_AVMediaSourceLoadingRequest_GetUrl(nullptr, &url);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVMediaSourceLoaderSetSourceOpenCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t params = 0;
    napi_get_value_int32(env, args[PARAM_0], &params);
    OH_AVMediaSourceLoader* loader = OH_AVMediaSourceLoader_Create();
    OH_AVErrCode errorCode;
    if (params == 0) {
        errorCode = OH_AVMediaSourceLoader_SetSourceOpenCallback(nullptr,
            [](OH_AVMediaSourceLoadingRequest* request, void* userData) -> int64_t { return 0; }, nullptr);
    } else if (params == PARAM_1) {
        errorCode = OH_AVMediaSourceLoader_SetSourceOpenCallback(loader, nullptr, nullptr);
    } else {
        errorCode = OH_AVMediaSourceLoader_SetSourceOpenCallback(loader,
            [](OH_AVMediaSourceLoadingRequest* request, void* userData) -> int64_t { return 0; }, nullptr);
    }
    OH_AVMediaSourceLoader_Destroy(loader);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVMediaSourceLoaderSetSourceReadCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t params = 0;
    napi_get_value_int32(env, args[PARAM_0], &params);
    OH_AVMediaSourceLoader* loader = OH_AVMediaSourceLoader_Create();
    OH_AVErrCode errorCode;
    if (params == 0) {
        errorCode = OH_AVMediaSourceLoader_SetSourceReadCallback(nullptr,
            [](int64_t uuid, int64_t requestedOffset, int64_t requestedLength, void *userData) {}, nullptr);
    } else if (params == PARAM_1) {
        errorCode = OH_AVMediaSourceLoader_SetSourceReadCallback(loader, nullptr, nullptr);
    } else {
        errorCode = OH_AVMediaSourceLoader_SetSourceReadCallback(loader,
            [](int64_t uuid, int64_t requestedOffset, int64_t requestedLength, void *userData) {}, nullptr);
    }
    OH_AVMediaSourceLoader_Destroy(loader);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVMediaSourceLoaderSetSourceCloseCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t params = 0;
    napi_get_value_int32(env, args[PARAM_0], &params);
    OH_AVMediaSourceLoader* loader = OH_AVMediaSourceLoader_Create();
    OH_AVErrCode errorCode;
    if (params == 0) {
        errorCode = OH_AVMediaSourceLoader_SetSourceCloseCallback(nullptr,
            [](int64_t uuid, void *userData) {}, nullptr);
    } else if (params == PARAM_1) {
        errorCode = OH_AVMediaSourceLoader_SetSourceCloseCallback(loader, nullptr, nullptr);
    } else {
        errorCode = OH_AVMediaSourceLoader_SetSourceCloseCallback(loader,
            [](int64_t uuid, void *userData) {}, nullptr);
    }
    OH_AVMediaSourceLoader_Destroy(loader);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static napi_value NAPI_TestAVMediaSourceLoadingRequestGetHttpHeaderError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVHttpHeader* header = nullptr;
    OH_AVErrCode errorCode = OH_AVMediaSourceLoadingRequest_GetHttpHeader(nullptr, &header);
    napi_create_int32(env, errorCode, &result);
    return result;
}

static void AVPlayerOnError(OH_AVPlayer *player, int32_t, const char *errorMsg)
{
}

static void AVPlayerOnInfo(OH_AVPlayer *player, AVPlayerOnInfoType infoType, int32_t extra)
{
}

static napi_value OhAVPlayerSetPlaybackRange(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 4;
    napi_value args[PARAM_4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    int64_t start;
    napi_get_value_int64(env, args[PARAM_1], &start);
    int64_t end;
    napi_get_value_int64(env, args[PARAM_2], &end);
    bool closestRange;
    napi_get_value_bool(env, args[PARAM_3], &closestRange);

    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PREPARED,
            [ndkAVPlayerUser, start, end, closestRange]() {
                ndkAVPlayerUser->errorCode = OH_AVPlayer_SetPlaybackRange(ndkAVPlayerUser->player,
                    start, end, closestRange);
                LOG("NAPI_OhAVPlayerSetPlaybackRange called in prepared state, errorCode: %{public}d",
                    ndkAVPlayerUser->errorCode);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}
static napi_value OhAVPlayerSetMediaMuted(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int type = 1;
    napi_get_value_int32(env, args[PARAM_0], &type);
    OH_MediaType mediaType = static_cast<OH_MediaType>(type);
    bool muted;
    napi_get_value_bool(env, args[PARAM_1], &muted);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_2], fd, offset, size);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PREPARED,
            [ndkAVPlayerUser, mediaType, muted]() {
                ndkAVPlayerUser->errorCode = OH_AVPlayer_SetMediaMuted(ndkAVPlayerUser->player, mediaType, muted);
                LOG("OH_AVPlayer_SetMediaMuted called in prepared state, errorCode: %{public}d",
                    ndkAVPlayerUser->errorCode);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value OhAVPlayerAddURLSubtitleSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char url[1024];
    napi_get_value_string_utf8(env, args[PARAM_0], url, sizeof(url), nullptr);
    const char *urlStr = url;
    LOG("OhAVPlayerAddURLSubtitleSource url=%{public}s", urlStr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_1], fd, offset, size);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PREPARED,
            [ndkAVPlayerUser, url]() {
                ndkAVPlayerUser->errorCode = OH_AVPlayer_AddUrlSubtitleSource(ndkAVPlayerUser->player, url);
                LOG("OH_AVPlayer_SetMediaMuted called in prepared state, errorCode: %{public}d",
                    ndkAVPlayerUser->errorCode);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value OhAVPlayerAddFDSubtitleSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    int32_t subtitleFd = 0;
    int64_t subtitleOffset = 0;
    int64_t subtitleSize = 0;
    ExtractFileDescriptor(env, args[PARAM_1], subtitleFd, subtitleOffset, subtitleSize);

    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PREPARED,
            [ndkAVPlayerUser, subtitleFd, subtitleOffset, subtitleSize]() {
                ndkAVPlayerUser->errorCode = OH_AVPlayer_AddFdSubtitleSource(ndkAVPlayerUser->player, subtitleFd,
                    subtitleOffset, subtitleSize);
                LOG("OH_AVPlayer_AddFdSubtitleSource called in prepared state, errorCode: %{public}d",
                    ndkAVPlayerUser->errorCode);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value OhAVPlayerIsSeekContinuousSupported(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    bool isSupported = OH_AVPlayer_IsSeekContinuousSupported(player);
    if (isSupported) {
        napi_create_int32(env, ONEVAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    OH_AVPlayer_ReleaseSync(player);
    return result;
}

static napi_value OhAVPlayerSelectTrackWithMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t trackIndex = -1;
    int32_t switchMode = 0;
    napi_get_value_int32(env, args[PARAM_0], &trackIndex);
    napi_get_value_int32(env, args[PARAM_1], &switchMode);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_2], fd, offset, size);
    AVPlayerTrackSwitchMode switchType = static_cast<AVPlayerTrackSwitchMode>(switchMode);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PREPARED,
            [ndkAVPlayerUser, trackIndex, switchType]() {
                ndkAVPlayerUser->errorCode = OH_AVPlayer_SelectTrackWithMode(
                    ndkAVPlayerUser->player,
                    trackIndex,
                    switchType);
                LOG("OH_AVPlayer_SelectTrackWithMode called in prepared state, errorCode: %{public}d",
                    ndkAVPlayerUser->errorCode);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

void TestOH_AVPlayerOnAmplitudeUpdateCallback(OH_AVPlayer *player, double* amp, uint32_t count, void *userData)
{
    if (player == nullptr || amp == nullptr || count <= 0 || userData == nullptr) {
        return;
    }
}

static napi_value OhAVPlayerSetAmplitudeUpdateCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    int userData = 0;
    if (player == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlayer_SetAmplitudeUpdateCallback(player, TestOH_AVPlayerOnAmplitudeUpdateCallback, &userData);
        if (errCode == AV_ERR_OK) {
            void* pValue = &userData;
            if (pValue != nullptr) {
                errCode = AV_ERR_OK;
                LOG("P_value %{public}p", pValue);
                LOG("p_value (actual value): %{public}d", *(static_cast<int*>(pValue)));
            } else {
                errCode = AV_ERR_INVALID_STATE;
                LOG("p_value %{public}d", pValue);
            }
        } else {
            LOG("errCode %{public}d", errCode);
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, errCode, &result);
    return result;
}

void TestOH_AVPlayerOnSeiMessageReceived(OH_AVPlayer *player, OH_AVSeiMessageArray* message,
    int playbackposition, void *userData)
{
    if (player == nullptr || message == nullptr || playbackposition <= 0 || userData == nullptr) {
        return;
    }
}

static napi_value OhAVPlayerSetSeiReceivedCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t typeSize = 0;
    napi_get_array_length(env, args[PARAM_0], &typeSize);
    int32_t *typeList = static_cast<int32_t *>(malloc((typeSize + 1) * sizeof(int32_t)));
    if (typeList == nullptr) {
        return nullptr;
    }
    int32_t num = 0;
    for (size_t i = 0; i < typeSize; i++) {
        napi_value item1;
        napi_get_element(env, args[PARAM_0], i, &item1);
        napi_get_value_int32(env, item1, &num);
        typeList[i] = num;
        LOG("typeList[%{public}zu]=%{public}d", i, typeList[i]);
    }

    int32_t typeNum;
    napi_get_value_int32(env, args[PARAM_1], &typeNum);

    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    int32_t userData;
    OH_AVErrCode errCode = OH_AVPlayer_SetSeiReceivedCallback(player, const_cast<const int32_t*>(typeList), typeNum,
        TestOH_AVPlayerOnSeiMessageReceived, (void*)&userData);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    free(typeList);
    typeList = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static void AVPlayerOnSeiMessageReceivedCallbackImpl(OH_AVPlayer *player, OH_AVSeiMessageArray* message,
    int playbackposition, void *userData)
{
    LOG("AVPlayerOnSeiMessageReceivedCallbackImpl called, playbackPosition: %{public}d", playbackposition);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(userData);
    if (ndkAVPlayerUser != nullptr) {
        ndkAVPlayerUser->message = message;
        ndkAVPlayerUser->playbackposition = playbackposition;
    }
}

static napi_value OhAVPlayerSetSeiReceivedCallbackWithUserData(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    int32_t typeList[] = {5};
    OH_AVPlayer_SetSeiReceivedCallback(ndkAVPlayerUser->player, typeList, 1,
        AVPlayerOnSeiMessageReceivedCallbackImpl, ndkAVPlayerUser);
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_CheckSeiMessageGetCount(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    int backParam = FAIL;
    if (ndkAVPlayerUser->message != nullptr) {
        uint32_t length = OH_AVSeiMessage_GetSeiCount(ndkAVPlayerUser->message);
        LOG("NAPI_CheckSeiMessageReceived length=%{public}u", length);
        if (length > 0) {
            backParam = length;
        }
    }
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value GetSeiData(struct OH_AVFormat *seiMessage, napi_env env)
{
    if (seiMessage != nullptr) {
        napi_value seiObject = nullptr;
        napi_create_object(env, &seiObject);
        int32_t out = 0;
        bool ret = OH_AVFormat_GetIntValue(seiMessage, OH_PLAYER_SEI_PAYLOAD_TYPE, &out);
        if (ret && out == PARAM_5) {
            LOG("NAPI_CheckSeiMessageReceived payloadType=%{public}d", out);
            napi_value payloadType = nullptr;
            napi_create_int32(env, out, &payloadType);
            napi_set_named_property(env, seiObject, "payloadType", payloadType);
        }
        uint8_t *addr = nullptr;
        size_t size = 0;
        ret = OH_AVFormat_GetBuffer(seiMessage, OH_PLAYER_SEI_PAYLOAD_CONTENT, &addr, &size);
        if (ret && size > 0 && addr != nullptr) {
            LOG("NAPI_CheckSeiMessageReceived payload size=%{public}zu", size);
            napi_value payloadsize = nullptr;
            napi_create_int32(env, static_cast<int32_t>(size), &payloadsize);
            napi_set_named_property(env, seiObject, "payloadsize", payloadsize);
        }
        OH_AVFormat_Destroy(seiMessage);
        return seiObject;
    }
    return nullptr;
}

static napi_value CheckSeiMessageGetSEI(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    int32_t index = 0;
    napi_get_value_int32(env, args[PARAM_1], &index);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    if (index >= 0) {
        OH_AVFormat* seiMessage = OH_AVSeiMessage_GetSei(ndkAVPlayerUser->message, index);
        napi_create_int32(env, seiMessage != nullptr ? SUCCESS : FAIL, &result);
        return result;
    }
    napi_create_array(env, &result);
    if (ndkAVPlayerUser->message != nullptr) {
        uint32_t length = OH_AVSeiMessage_GetSeiCount(ndkAVPlayerUser->message);
        LOG("NAPI_CheckSeiMessageReceived length=%{public}u", length);
        for (int i = 0; i < length; i++) {
            OH_AVFormat* seiMessage = OH_AVSeiMessage_GetSei(ndkAVPlayerUser->message, i);
            napi_value seiObject = GetSeiData(seiMessage, env);
            if (seiObject != nullptr) {
                napi_set_element(env, result, i, seiObject);
            }
        }
    }
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    return result;
}

static napi_value OhAVPlaybackStrategyCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    if (strategy != nullptr) {
        backParam = SUCCESS;
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAVPlayerSetPlaybackStrategy(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_INITIALIZED,
            [ndkAVPlayerUser]() {
                ndkAVPlayerUser->playbackStrategy = OH_AVPlaybackStrategy_Create();
                ndkAVPlayerUser->errorCode = OH_AVPlayer_SetPlaybackStrategy(
                    ndkAVPlayerUser->player,
                    ndkAVPlayerUser->playbackStrategy);
                LOG("OH_AVPlayer_SetPlaybackStrategy called in initialized state, errorCode: %{public}d",
                    ndkAVPlayerUser->errorCode);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value OhAVPlaybackStrategySetSuperResolutionEnable(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    bool enabled;
    napi_get_value_bool(env, args[PARAM_0], &enabled);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetSuperResolutionEnable(strategy, enabled);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetPreferHDR(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    bool enabled;
    napi_get_value_bool(env, args[PARAM_0], &enabled);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetPreferredHdr(strategy, enabled);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetPreferredHeight(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    uint32_t height;
    napi_get_value_uint32(env, args[PARAM_0], &height);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetPreferredHeight(strategy, height);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetPreferredWidth(napi_env env, napi_callback_info info)
{
    LOG("OhAVPlaybackStrategySetPreferredWidth start");
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    LOG(" OhAVPlaybackStrategySetPreferredWidth argc %{public}d", argc);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    LOG(" OhAVPlaybackStrategySetPreferredWidth args[PARAM_0] %{public}d", args[PARAM_0]);
    uint32_t width;
    napi_get_value_uint32(env, args[PARAM_0], &width);
    LOG("OhAVPlaybackStrategySetPreferredWidth width %{public}d", width);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetPreferredWidth(strategy, width);
        LOG("OhAVPlaybackStrategySetPreferredWidth errCode %{public}d", errCode);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetPreferredBufferDuration(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    uint32_t bufferDuration;
    napi_get_value_uint32(env, args[PARAM_0], &bufferDuration);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetPreferredBufferDuration(strategy, bufferDuration);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetMutedMediaType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    int32_t mediaType = 1;
    napi_get_value_int32(env, args[PARAM_0], &mediaType);
    OH_MediaType mutedMediaType = static_cast<OH_MediaType>(mediaType);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetMutedMediaType(strategy, mutedMediaType);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetPreferredAudioLanguage(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    char audioLanguage[64] = {0};
    napi_get_value_string_utf8(env, args[PARAM_0], audioLanguage, sizeof(audioLanguage), nullptr);
    const char* audioLangPtr = audioLanguage;
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetPreferredAudioLanguage(strategy, audioLangPtr);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetPreferredSubtitleLanguage(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    char subtitleLanguage[64] = {0};
    napi_get_value_string_utf8(env, args[PARAM_0], subtitleLanguage, sizeof(subtitleLanguage), nullptr);
    const char* subtitleLangPtr = subtitleLanguage;
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetPreferredSubtitleLanguage(strategy, subtitleLangPtr);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetShowFirstFrameOnPrepare(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    bool showFirstFrameOnPrepare;
    napi_get_value_bool(env, args[PARAM_0], &showFirstFrameOnPrepare);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetShowFirstFrameOnPrepare(strategy, showFirstFrameOnPrepare);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetPreferredBufferDurationForPlaying(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    double buffer;
    napi_get_value_double(env, args[PARAM_0], &buffer);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetPreferredBufferDurationForPlaying(strategy, buffer);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetThresholdForAutoQuickPlay(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    double threshold;
    napi_get_value_double(env, args[PARAM_0], &threshold);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetThresholdForAutoQuickPlay(strategy, threshold);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OhAVPlaybackStrategySetKeepDecodingOnMute(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    bool keep;
    napi_get_value_bool(env, args[PARAM_0], &keep);
    if (strategy == nullptr) {
        errCode = AV_ERR_INVALID_VAL;
    } else {
        errCode = OH_AVPlaybackStrategy_SetKeepDecodingOnMute(strategy, keep);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NAPI_Global_SetPlaybackRate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t fd = 0;
    int64_t offset;
    int64_t size;
    ExtractFileDescriptor(env, args[PARAM_0], fd, offset, size);
    double rate = 0;
    napi_get_value_double(env, args[PARAM_1], &rate);

    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    ndkAVPlayerUser->stateChangeFuncs_ = {
        { AV_PREPARED,
            [ndkAVPlayerUser, rate]() {
                ndkAVPlayerUser->errorCode = OH_AVPlayer_SetPlaybackRate(ndkAVPlayerUser->player, rate);
                LOG("OH_AVPlayer_SetPlaybackRate called in prepared state, errorCode: %{public}d",
                    ndkAVPlayerUser->errorCode);
            }
        },
    };
    ndkAVPlayerUser->InitAVPlayer(fd, offset, size);
    napi_create_object(env, &result);
    SetInt32NamedProperty(env, result, "result", ndkAVPlayerUser->errorCode);
    SetUserDataProperty(env, result, "userData", &ndkAVPlayerUser);
    return result;
}

static napi_value NAPI_Global_CheckPlaybackRate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[PARAM_0], &ptr);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(ptr);
    float rate = 0.0;
    ndkAVPlayerUser->errorCode = OH_AVPlayer_GetPlaybackRate(ndkAVPlayerUser->player, &rate);
    LOG("NAPI_Global_CheckPlaybackRate rate=%{public}f", rate);
    napi_create_double(env, rate, &result);
    delete ndkAVPlayerUser;
    ndkAVPlayerUser = nullptr;
    return result;
}

static napi_value NAPI_Global_OhAVPlayerSetPlaybackStrategyError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t type = 0;
    napi_get_value_int32(env, args[PARAM_0], &type);
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    if (type == 0) {
        errCode = OH_AVPlayer_SetPlaybackStrategy(nullptr, strategy);
    } else if (type == PARAM_1) {
        errCode = OH_AVPlayer_SetPlaybackStrategy(player, nullptr);
    } else {
        errCode = OH_AVPlayer_SetPlaybackStrategy(player, strategy);
    }
    OH_AVPlaybackStrategy_Destroy(strategy);
    OH_AVPlayer_Release(player);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NAPI_TestAVPlayerSetMediaSourceStateError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVMediaSource *mediaSource = OH_AVMediaSource_CreateWithUrl("http://example.com/video.mp4", nullptr);
    OH_AVErrCode errCode = AV_ERR_INVALID_VAL;
    OH_AVPlayer_SetMediaSource(player, mediaSource);
    errCode = OH_AVPlayer_SetMediaSource(player, mediaSource);
    OH_AVPlayer_Release(player);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NAPI_TestAVPlayerGetPlaybackRateError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    float rate = 0.0;
    OH_AVErrCode errCode = OH_AVPlayer_GetPlaybackRate(nullptr, &rate);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NAPI_AVPlayerSetAmplitudeUpdateCallbackError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode errCode = OH_AVPlayer_SetAmplitudeUpdateCallback(nullptr,
        nullptr, nullptr);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NAPI_AVLoadingRequestError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t resource = 2;
    int32_t handle = 3;
    int32_t denied = 4;
    int32_t timeout = 5;
    int32_t failed = 6;
    int32_t success = 0;
    int32_t notReady = 1;
    int32_t res = 1;
    if (AVLoadingRequestError::AV_LOADING_ERROR_NO_RESOURCE == resource &&
        AVLoadingRequestError::AV_LOADING_ERROR_INVALID_HANDLE == handle &&
        AVLoadingRequestError::AV_LOADING_ERROR_ACCESS_DENIED == denied &&
        AVLoadingRequestError::AV_LOADING_ERROR_ACCESS_TIMEOUT == timeout &&
        AVLoadingRequestError::AV_LOADING_ERROR_AUTHORIZE_FAILED == failed &&
        AVLoadingRequestError::AV_LOADING_ERROR_SUCCESS == success &&
        AVLoadingRequestError::AV_LOADING_ERROR_NOT_READY == notReady) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVHttpHeaderDestroy(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
    OH_AVErrCode errorCode = OH_AVHttpHeader_Destroy(header);
    int32_t res = 1;
    if (errorCode == AV_ERR_OK) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVHttpHeaderDestroyError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVHttpHeader* header = nullptr;
    OH_AVErrCode errorCode = OH_AVHttpHeader_Destroy(header);
    int32_t res = 1;
    if (errorCode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVHttpHeaderCreate(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVHttpHeader* header = OH_AVHttpHeader_Create();
    int32_t res = 1;
    if (header != nullptr) {
        res = 0;
    }
    OH_AVHttpHeader_Destroy(header);
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVPlayerTrackSwitchMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t smooth = 0;
    int32_t segment = 1;
    int32_t closest = 2;
    int32_t res = 1;
    if (AVPlayerTrackSwitchMode::AV_TRACK_SWITCH_MODE_SMOOTH == smooth &&
        AVPlayerTrackSwitchMode::AV_TRACK_SWITCH_MODE_SEGMENT == segment &&
        AVPlayerTrackSwitchMode::AV_TRACK_SWITCH_MODE_CLOSEST == closest) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVPlayerSeekMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t continuous = 3;
    int32_t res = 1;
    if (AVPlayerSeekMode::AV_SEEK_CONTINUOUS == continuous) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVErrCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int64_t unsupported = 5410003;
    int64_t permitted = 5411012;
    int64_t enabled = 5410004;
    int32_t res = 1;
    if (OH_AVErrCode::AV_ERR_SUPER_RESOLUTION_UNSUPPORTED == unsupported &&
        OH_AVErrCode::AV_ERR_IO_CLEARTEXT_NOT_PERMITTED == permitted &&
        OH_AVErrCode::AV_ERR_SUPER_RESOLUTION_NOT_ENABLED == enabled) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OhAVPlayerSetMediaMutedErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int type = 1;
    napi_value args[PARAM_3] = {nullptr};
    OH_MediaType mediaType = static_cast<OH_MediaType>(type);
    bool muted;
    napi_get_value_bool(env, args[PARAM_1], &muted);
    OH_AVErrCode errCode = OH_AVPlayer_SetMediaMuted(nullptr, mediaType, muted);
    int32_t res = 1;
    if (errCode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OhAVPlayerSetMediaMutedErr1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    int type = 1;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_MediaType mediaType = static_cast<OH_MediaType>(type);
    bool muted;
    napi_get_value_bool(env, args[PARAM_1], &muted);
    NdkAVPlayerUser *ndkAVPlayerUser = new NdkAVPlayerUser();
    AVPlayerState state = AVPlayerState::AV_IDLE;
    OH_AVErrCode getStateErr = OH_AVPlayer_GetState(ndkAVPlayerUser->player, &state);
    if (getStateErr != AV_ERR_OK) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    OH_AVErrCode errCode = OH_AVPlayer_SetMediaMuted(ndkAVPlayerUser->player, mediaType, muted);
    int32_t res = 1;
    if (errCode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OhAVPlayerSetSeiReceivedCallbackErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t typeSize = 0;
    napi_get_array_length(env, args[PARAM_0], &typeSize);
    int32_t *typeList = static_cast<int32_t *>(malloc((typeSize + 1) * sizeof(int32_t)));
    if (typeList == nullptr) {
        return nullptr;
    }
    int32_t num = 0;
    for (size_t i = 0; i < typeSize; i++) {
        napi_value item1;
        napi_get_element(env, args[PARAM_0], i, &item1);
        napi_get_value_int32(env, item1, &num);
        typeList[i] = num;
        LOG("typeList[%{public}zu]=%{public}d", i, typeList[i]);
    }
    int32_t typeNum;
    napi_get_value_int32(env, args[PARAM_1], &typeNum);
    int backParam = FAIL;
    int32_t userData;
    OH_AVErrCode errCode = OH_AVPlayer_SetSeiReceivedCallback(nullptr, const_cast<const int32_t*>(typeList), typeNum,
        TestOH_AVPlayerOnSeiMessageReceived, (void*)&userData);
    int32_t res = 1;
    if (errCode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    free(typeList);
    typeList = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVMediaSourceLoaderCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVMediaSourceLoader* loader = OH_AVMediaSourceLoader_Create();
    int32_t res = 1;
    if (loader != nullptr) {
        res = 0;
    }
    OH_AVMediaSourceLoader_Destroy(loader);
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVPlaybackStrategyDestoy(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVPlaybackStrategy *strategy = OH_AVPlaybackStrategy_Create();
    OH_AVErrCode errCode = OH_AVPlaybackStrategy_Destroy(strategy);
    int32_t res = 1;
    if (errCode == AV_ERR_OK) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value NAPI_AVPlaybackStrategyDestoyErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVPlaybackStrategy *strategy = nullptr;
    OH_AVErrCode errCode = OH_AVPlaybackStrategy_Destroy(strategy);
    int32_t res = 1;
    if (errCode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testSetVideoSuperResolution", nullptr, NAPI_TestSetVideoSuperResolution, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"checkAVPlayer", nullptr, NAPI_CheckAVPlayer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkSuperResolutionState", nullptr, NAPI_CheckSuperResolutionState, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testSetVideoSuperResolutionError", nullptr, NAPI_TestSetVideoSuperResolutionError, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testSetTargetVideoWindowSize", nullptr, NAPI_TestSetTargetVideoWindowSize, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"releaseUserData", nullptr, NAPI_ReleaseUserData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetTargetVideoWindowSizeError", nullptr, NAPI_TestSetTargetVideoWindowSizeError, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testSetDataSource", nullptr, NAPI_TestSetDataSource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkPlaybackInfo", nullptr, NAPI_CheckPlaybackInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetPlaybackInfo", nullptr, NAPI_TestGetPlaybackInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetPlaybackInfoError", nullptr, NAPI_TestGetPlaybackInfoError, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testGetTrackCount", nullptr, NAPI_TestGetTrackCount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetTrackFormat", nullptr, NAPI_TestGetTrackFormat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"playVideo", nullptr, NAPI_OHAvPlayerPlayVideo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkPlaybackPosition", nullptr, NAPI_CheckPlaybackPosition, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testGetPlaybackPositionError", nullptr, NAPI_TestGetPlaybackPositionError, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testTrackChange", nullptr, NAPI_TestTrackChange, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkTrackChange", nullptr, NAPI_CheckTrackChange, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMediaSourceWithFd", nullptr, NAPI_TestMediaSourceWithFd, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testMediaSourceWithUrl", nullptr, NAPI_TestMediaSourceWithUrl, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testSetDataSourceDelegate", nullptr, NAPI_TestSetDataSourceDelegate, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testAVHttpHeaderDestroyError", nullptr, NAPI_TestAVHttpHeaderDestroyError, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testAVHttpHeaderAddRecordError", nullptr, NAPI_TestAVHttpHeaderAddRecordError, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testAVHttpHeaderGetCount", nullptr, NAPI_TestAVHttpHeaderGetCount, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testAVHttpHeaderGetCountError", nullptr, NAPI_TestAVHttpHeaderGetCountError, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testAVHttpHeaderGetRecord", nullptr, NAPI_TestAVHttpHeaderGetRecord, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaSourceCreateWithUrl", nullptr, NAPI_TestMediaSourceCreateWithUrl, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaSourceCreateWithFD", nullptr, NAPI_TestMediaSourceCreateWithFD, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaSourceCreateWithDataSource", nullptr, NAPI_TestMediaSourceCreateWithDataSource, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testMediaSourceSetMimeType", nullptr, NAPI_TestMediaSourceSetMimeType, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testAVPlayerSetMediaSource", nullptr, NAPI_TestAVPlayerSetMediaSource, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testAVMediaSourceLoaderDestroyError", nullptr, NAPI_TestAVMediaSourceLoaderDestroyError, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testAVMediaSourceSetMediaSourceLoaderError", nullptr, NAPI_TesAVMediaSourceSetMediaSourceLoaderError, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testAVMetaSourceLoadingRequestGetUrlError", nullptr, NAPI_TestAVMetaSourceLoadingRequestGetUrlError, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testAVMediaSourceLoaderSetSourceOpenCallback", nullptr, NAPI_TestAVMediaSourceLoaderSetSourceOpenCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAVMediaSourceLoaderSetSourceReadCallback", nullptr, NAPI_TestAVMediaSourceLoaderSetSourceReadCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAVMediaSourceLoaderSetSourceCloseCallback", nullptr, NAPI_TestAVMediaSourceLoaderSetSourceCloseCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAVMediaSourceLoadingRequestGetHttpHeaderError", nullptr,
            NAPI_TestAVMediaSourceLoadingRequestGetHttpHeaderError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlayerSetPlaybackRange", nullptr, OhAVPlayerSetPlaybackRange, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"OhAVPlayerSetMediaMuted", nullptr, OhAVPlayerSetMediaMuted, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlayerAddURLSubtitleSource", nullptr, OhAVPlayerAddURLSubtitleSource, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OhAVPlayerAddFDSubtitleSource", nullptr, OhAVPlayerAddFDSubtitleSource, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OhAVPlayerIsSeekContinuousSupported", nullptr, OhAVPlayerIsSeekContinuousSupported, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OhAVPlayerSelectTrackWithMode", nullptr, OhAVPlayerSelectTrackWithMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OhAVPlayerSetAmplitudeUpdateCallback", nullptr, OhAVPlayerSetAmplitudeUpdateCallback, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OhAVPlayerSetSeiReceivedCallback", nullptr, OhAVPlayerSetSeiReceivedCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OhAVPlayerSetSeiReceivedCallbackWithUserData", nullptr, OhAVPlayerSetSeiReceivedCallbackWithUserData, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategyCreate", nullptr, OhAVPlaybackStrategyCreate, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"OhAVPlayerSetPlaybackStrategy", nullptr, OhAVPlayerSetPlaybackStrategy, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OhAVPlaybackStrategySetSuperResolutionEnable", nullptr, OhAVPlaybackStrategySetSuperResolutionEnable,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetPreferHDR", nullptr, OhAVPlaybackStrategySetPreferHDR, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OhAVPlaybackStrategySetPreferredHeight", nullptr, OhAVPlaybackStrategySetPreferredHeight, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetPreferredWidth", nullptr, OhAVPlaybackStrategySetPreferredWidth, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetPreferredBufferDuration", nullptr, OhAVPlaybackStrategySetPreferredBufferDuration,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetMutedMediaType", nullptr, OhAVPlaybackStrategySetMutedMediaType, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetPreferredAudioLanguage", nullptr, OhAVPlaybackStrategySetPreferredAudioLanguage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetPreferredSubtitleLanguage", nullptr, OhAVPlaybackStrategySetPreferredSubtitleLanguage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetShowFirstFrameOnPrepare", nullptr, OhAVPlaybackStrategySetShowFirstFrameOnPrepare,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetPreferredBufferDurationForPlaying", nullptr,
            OhAVPlaybackStrategySetPreferredBufferDurationForPlaying, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetThresholdForAutoQuickPlay", nullptr, OhAVPlaybackStrategySetThresholdForAutoQuickPlay,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAVPlaybackStrategySetKeepDecodingOnMute", nullptr, OhAVPlaybackStrategySetKeepDecodingOnMute, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"checkErrorCode", nullptr, NAPI_CheckErrorCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkTrackCount", nullptr, NAPI_CheckTrackCount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkTrackFormat", nullptr, NAPI_CheckTrackFormat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkCallbackErrorCode", nullptr, NAPI_CheckCallbackErrorCode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"checkSeiMessageGetCount", nullptr, NAPI_CheckSeiMessageGetCount, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"checkSeiMessageGetSEI", nullptr, CheckSeiMessageGetSEI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setPlaybackRate", nullptr, NAPI_Global_SetPlaybackRate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkPlaybackRate", nullptr, NAPI_Global_CheckPlaybackRate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetSubtitleTrackFormat", nullptr, NAPI_TestGetSubtitleTrackFormat, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OhAVPlayerSetPlaybackStrategyError", nullptr, NAPI_Global_OhAVPlayerSetPlaybackStrategyError, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testAVPlayerSetMediaSourceStateError", nullptr, NAPI_TestAVPlayerSetMediaSourceStateError, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testAVPlayerGetPlaybackRateError", nullptr, NAPI_TestAVPlayerGetPlaybackRateError, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AVPlayerSetAmplitudeUpdateCallbackError", nullptr, NAPI_AVPlayerSetAmplitudeUpdateCallbackError, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AVLoadingRequestError", nullptr, NAPI_AVLoadingRequestError, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVHttpHeaderDestroy", nullptr, NAPI_AVHttpHeaderDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVHttpHeaderDestroyError", nullptr, NAPI_AVHttpHeaderDestroyError, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVHttpHeaderCreate", nullptr, NAPI_AVHttpHeaderCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVPlayerTrackSwitchMode", nullptr, NAPI_AVPlayerTrackSwitchMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVPlayerSeekMode", nullptr, NAPI_AVPlayerSeekMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVErrCode", nullptr, NAPI_AVErrCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVPlayerSetMediaMutedErr", nullptr, OhAVPlayerSetMediaMutedErr, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVPlayerSetMediaMutedErr1", nullptr, OhAVPlayerSetMediaMutedErr1, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVPlayerSetSeiReceivedCallbackErr", nullptr, OhAVPlayerSetSeiReceivedCallbackErr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AVMediaSourceLoaderCreate", nullptr, NAPI_AVMediaSourceLoaderCreate, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AVPlaybackStrategyDestoy", nullptr, NAPI_AVPlaybackStrategyDestoy, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVPlaybackStrategyDestoyErr", nullptr, NAPI_AVPlaybackStrategyDestoyErr, nullptr, nullptr, nullptr,
            napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    SampleManager::GetInstance()->Export(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "avplayerndk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
