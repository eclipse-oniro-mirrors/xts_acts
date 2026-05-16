/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#include "PlayerNative.h"
#include "dfx/error/av_codec_sample_error.h"
#include <cstdint>
#include <multimedia/player_framework/native_averrors.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "playerNative"

struct CallbackContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
};

void Callback(void *asyncContext)
{
    uv_loop_s *loop = nullptr;
    CallbackContext *context = (CallbackContext *)asyncContext;
    napi_get_uv_event_loop(context->env, &loop);
    uv_work_t *work = new uv_work_t;
    work->data = context;
    uv_queue_work(
        loop, work, [](uv_work_t *work) {},
        [](uv_work_t *work, int status) {
            CallbackContext *context = (CallbackContext *)work->data;
            napi_handle_scope scope = nullptr;
            // 管理 napi_value 的生命周期，防止内存泄露
            napi_open_handle_scope(context->env, &scope);
            napi_value callback = nullptr;
            napi_get_reference_value(context->env, context->callbackRef, &callback);
            // 回调至UI侧
            napi_call_function(context->env, nullptr, callback, 0, nullptr, nullptr);
            napi_close_handle_scope(context->env, scope);
            delete context;
            delete work;
        });
}

napi_value PlayerNative::InitFd(napi_env env, napi_callback_info info)
{
    SampleInfo sampleInfo;
    size_t argc = 4;                // 参数个数，这里ArkTS往native测传递了两个参数，故此处赋值为4
    napi_value args[4] = {nullptr}; // napi_value类型数组，用于存储接收的ArkTS侧参数
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr); // 从info中获取参数信息到参数数组args[]

    int32_t two = 2;
    int32_t three = 3;
    napi_get_value_int32(env, args[0], &sampleInfo.inputFd);
    napi_get_value_int64(env, args[1], &sampleInfo.inputFileOffset);
    napi_get_value_int64(env, args[two], &sampleInfo.inputFileSize);

    AVCODEC_SAMPLE_LOGI("inputFilePath %{public}s", sampleInfo.inputFilePath.c_str());
    AVCODEC_SAMPLE_LOGI("inputFilePath %{public}ld", sampleInfo.inputFileSize);

    auto asyncContext = new CallbackContext();
    asyncContext->env = env;
    napi_create_reference(env, args[three], 1, &asyncContext->callbackRef);

    sampleInfo.playDoneCallback = &Callback;
    sampleInfo.playDoneCallbackData = asyncContext;
    int32_t ret = Player::GetInstance().Init(sampleInfo);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Flush(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("NativeStop");
    int32_t ret = Player::GetInstance().Flush();
    AVCODEC_SAMPLE_LOGD("NativeStop1");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::AudioFlush(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("AudioFlush");
    int32_t ret = Player::GetInstance().AudioFlush();
    AVCODEC_SAMPLE_LOGD("AudioFlush1");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::VideoFlush(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("VideoFlush");
    int32_t ret = Player::GetInstance().VideoFlush();
    AVCODEC_SAMPLE_LOGD("VideoFlush1");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::Stop(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("NativeStop");
    int32_t ret = Player::GetInstance().Stop();
    AVCODEC_SAMPLE_LOGD("NativeStop1");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioStop(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("NativeAudioStop");
    int32_t ret = Player::GetInstance().AudioStop();
    AVCODEC_SAMPLE_LOGD("NativeAudioStop1");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStop(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("NativeVideoStop");
    int32_t ret = Player::GetInstance().VideoStop();
    AVCODEC_SAMPLE_LOGD("NativeVideoStop1");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Release(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("NativeRelease in");
    int32_t ret = AV_ERR_OK;
    Player::GetInstance().StartRelease();
    AVCODEC_SAMPLE_LOGD("NativeRelease out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Reset(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("resetNative in");
    int32_t ret = Player::GetInstance().Reset();
    AVCODEC_SAMPLE_LOGD("resetNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::AudioReset(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("audioresetNative in");
    int32_t ret = Player::GetInstance().AudioReset();
    AVCODEC_SAMPLE_LOGD("audioresetNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::VideoReset(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("videoresetNative in");
    int32_t ret = Player::GetInstance().VideoReset();
    AVCODEC_SAMPLE_LOGD("videoresetNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Pause(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("PauseNative in");
    int32_t ret = Player::GetInstance().Pause();
    AVCODEC_SAMPLE_LOGD("PauseNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::AudioPause(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("AudioPauseNative in");
    int32_t ret = Player::GetInstance().AudioPause();
    AVCODEC_SAMPLE_LOGD("AudioPauseNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::VideoPause(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("VideoPauseNative in");
    int32_t ret = Player::GetInstance().VideoPause();
    AVCODEC_SAMPLE_LOGD("VideoPauseNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Resume(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("ResumeNative in");
    int32_t ret = Player::GetInstance().Resume();
    AVCODEC_SAMPLE_LOGD("ResumeNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::AudioResume(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("AudioResumeNative in");
    int32_t ret = Player::GetInstance().AudioResume();
    AVCODEC_SAMPLE_LOGD("AudioResumeNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::VideoResume(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("VideoResumeNative in");
    int32_t ret = Player::GetInstance().VideoResume();
    AVCODEC_SAMPLE_LOGD("VideoResumeNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Speed(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    double speed = 1.0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &speed);
    AVCODEC_SAMPLE_LOGD("SeekNative in");
    int32_t ret = Player::GetInstance().SetSpeed(speed);
    AVCODEC_SAMPLE_LOGD("SeekNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::SetAudioSpeed(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    double speed = 1.0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &speed);
    AVCODEC_SAMPLE_LOGD("SetAudioSpeedNative in");
    int32_t ret = Player::GetInstance().SetAudioSpeed(speed);
    AVCODEC_SAMPLE_LOGD("SetAudioSpeedNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::SetVideoSpeed(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    double speed = 1.0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &speed);
    AVCODEC_SAMPLE_LOGD("SetVideoSpeedNative in");
    int32_t ret = Player::GetInstance().SetVideoSpeed(speed);
    AVCODEC_SAMPLE_LOGD("SetVideoSpeedNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Configure(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("ConfigureNative in");
    int32_t ret = Player::GetInstance().Configure();
    AVCODEC_SAMPLE_LOGD("ConfigureNative out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Seek(napi_env env, napi_callback_info info)
{
    int32_t seekTime = 0;
    int32_t mode = 0;
    bool acc = false;
    size_t seekArgc = 3; // 参数个数，这里ArkTS往native测传递了两个参数，故此处赋值为4
    napi_value seekArgs[3] = {nullptr}; // napi_value类型数组，用于存储接收的ArkTS侧参数
    napi_get_cb_info(env, info, &seekArgc, seekArgs, nullptr, nullptr); // 从info中获取参数信息到参数数组args[]
    napi_get_value_int32(env, seekArgs[0], &seekTime);
    napi_get_value_int32(env, seekArgs[1], &mode);
    napi_get_value_bool(env, seekArgs[0], &acc);
    AVCODEC_SAMPLE_LOGI("Seek in");
    int32_t ret = Player::GetInstance().Seek(seekTime, mode, acc);
    AVCODEC_SAMPLE_LOGI("Seek out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::SeekAcc(napi_env env, napi_callback_info info)
{
    int32_t seekTime = 0;
    size_t seekArgc = 1; // 参数个数，这里ArkTS往native测传递了两个参数，故此处赋值为4
    napi_value seekArgs[1] = {nullptr}; // napi_value类型数组，用于存储接收的ArkTS侧参数
    napi_get_cb_info(env, info, &seekArgc, seekArgs, nullptr, nullptr); // 从info中获取参数信息到参数数组args[]
    napi_get_value_int32(env, seekArgs[0], &seekTime);
    AVCODEC_SAMPLE_LOGI("SeekAcc in");
    int32_t ret = Player::GetInstance().Seek(seekTime, 1);
    AVCODEC_SAMPLE_LOGI("SeekAcc out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::Start(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("Start in");
    int32_t ret = Player::GetInstance().Start1();
    AVCODEC_SAMPLE_LOGI("Start out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::CreatePrepare(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("CreatePrepare in");
    int32_t ret = Player::GetInstance().CreatePrepare();
    AVCODEC_SAMPLE_LOGI("CreatePrepare out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::CreateLppSet(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("CreateLppSet in");
    int32_t ret = Player::GetInstance().CreateLppSet();
    AVCODEC_SAMPLE_LOGI("CreateLppSet out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::SyncAudio(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("SyncAudio in");
    int32_t ret = Player::GetInstance().SyncAudio();
    AVCODEC_SAMPLE_LOGI("SyncAudio out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::CreateLppAudioStreamer(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("CreateLppAudioStreamer in");
    int32_t ret = Player::GetInstance().CreateLppAudioStreamer();
    AVCODEC_SAMPLE_LOGI("CreateLppAudioStreamer out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::CreateLppAudioStreamerNull(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("CreateLppAudioStreamerNull in");
    int32_t ret = Player::GetInstance().CreateLppAudioStreamerNull();
    AVCODEC_SAMPLE_LOGI("CreateLppAudioStreamerNull out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::CreateLppVideoStreamer(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("CreateLppVideoStreamer in");
    int32_t ret = Player::GetInstance().CreateLppVideoStreamer();
    AVCODEC_SAMPLE_LOGI("CreateLppVideoStreamer out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::CreateLppVideoStreamerNull(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("CreateLppVideoStreamer in");
    int32_t ret = Player::GetInstance().CreateLppVideoStreamerNull();
    AVCODEC_SAMPLE_LOGI("CreateLppVideoStreamer out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::AudioStreamerGetParameter(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerGetParameter in");
    int32_t ret = Player::GetInstance().AudioStreamerGetParameter();
    AVCODEC_SAMPLE_LOGI("AudioStreamerGetParameter out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioStreamerSetParameter(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetParameter in");
    int32_t ret = Player::GetInstance().AudioStreamerSetParameter();
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetParameter out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::AudioStreamerConfigure(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerConfigure in");
    int32_t ret = Player::GetInstance().AudioStreamerConfigure();
    AVCODEC_SAMPLE_LOGI("AudioStreamerConfigure out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}


napi_value PlayerNative::AudioSetErrorCallback(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioSetErrorCallback in");
    int32_t ret = Player::GetInstance().AudioSetErrorCallback();
    AVCODEC_SAMPLE_LOGI("AudioSetErrorCallback out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioStreamerSetCallbackCreateNull(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetCallbackCreateNull in");
    int32_t ret = Player::GetInstance().AudioStreamerSetCallbackCreateNull();
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetCallbackCreateNull out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioStreamerSetCallbackCreate(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetCallbackCreate in");
    int32_t ret = Player::GetInstance().AudioStreamerSetCallbackCreate();
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetCallbackCreate out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioStreamerSetDataNeededListener(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetDataNeededListener in");
    int32_t ret = Player::GetInstance().AudioStreamerSetDataNeededListener();
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetDataNeededListener out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioStreamerSetPositionUpdateListener(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetPositionUpdateListener in");
    int32_t ret = Player::GetInstance().AudioStreamerSetPositionUpdateListener();
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetPositionUpdateListener out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioStreamerSetCallback(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetCallback in");
    int32_t ret = Player::GetInstance().AudioStreamerSetCallback();
    AVCODEC_SAMPLE_LOGI("AudioStreamerSetCallback out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioSetInterruptListener(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioSetInterruptListener in");
    int32_t ret = Player::GetInstance().AudioSetInterruptListener();
    AVCODEC_SAMPLE_LOGI("AudioSetInterruptListener out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioSetEosCallback(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioSetEosCallback in");
    int32_t ret = Player::GetInstance().AudioSetEosCallback();
    AVCODEC_SAMPLE_LOGI("AudioSetEosCallback out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioSetOnDeviceChanged(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioSetOnDeviceChanged in");
    int32_t ret = Player::GetInstance().AudioSetOnDeviceChanged();
    AVCODEC_SAMPLE_LOGI("AudioSetOnDeviceChanged out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioreturnFrames(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioreturnFrames in");
    int32_t ret = Player::GetInstance().AudioreturnFrames();
    AVCODEC_SAMPLE_LOGI("AudioreturnFrames out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioCallbackDestroy(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioCallbackDestroy in");
    int32_t ret = Player::GetInstance().AudioCallbackDestroy();
    AVCODEC_SAMPLE_LOGI("AudioCallbackDestroy out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioDestroy(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioDestroy in");
    int32_t ret = Player::GetInstance().AudioDestroy();
    AVCODEC_SAMPLE_LOGI("AudioDestroy out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::AudioStreamerPrepare(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("AudioStreamerPrepare in");
    int32_t ret = Player::GetInstance().AudioStreamerPrepare();
    AVCODEC_SAMPLE_LOGI("AudioStreamerPrepare out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::VideoStreamerSetCallbackCreateNull(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetCallbackCreateNull in");
    int32_t ret = Player::GetInstance().VideoStreamerSetCallbackCreateNull();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetCallbackCreateNull out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetDataNeededListener(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetDataNeededListener in");
    int32_t ret = Player::GetInstance().VideoStreamerSetDataNeededListener();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetDataNeededListener out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetStreamChangedListener(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetStreamChangedListener in");
    int32_t ret = Player::GetInstance().VideoStreamerSetStreamChangedListener();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetStreamChangedListener out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetCallback(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetCallback in");
    int32_t ret = Player::GetInstance().VideoStreamerSetCallback();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetCallback out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetErrorCallback(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetErrorCallback in");
    int32_t ret = Player::GetInstance().VideoStreamerSetErrorCallback();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetErrorCallback out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetFirstFrameDecodedCallback(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetFirstFrameDecodedCallback in");
    int32_t ret = Player::GetInstance().VideoStreamerSetFirstFrameDecodedCallback();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetFirstFrameDecodedCallback out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetRenderStartCallback(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetRenderStartCallback in");
    int32_t ret = Player::GetInstance().VideoStreamerSetRenderStartCallback();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetRenderStartCallback out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetEosCallback(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetEosCallback in");
    int32_t ret = Player::GetInstance().VideoStreamerSetEosCallback();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetEosCallback out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerCallbackDestroy(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerCallbackDestroy in");
    int32_t ret = Player::GetInstance().VideoStreamerCallbackDestroy();
    AVCODEC_SAMPLE_LOGI("VideoStreamerCallbackDestroy out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerDestroy(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerDestroy in");
    int32_t ret = Player::GetInstance().VideoStreamerDestroy();
    AVCODEC_SAMPLE_LOGI("VideoStreamerDestroy out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerreturnFrames(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerreturnFrames in");
    int32_t ret = Player::GetInstance().VideoStreamerreturnFrames();
    AVCODEC_SAMPLE_LOGI("VideoStreamerreturnFrames out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetTargetStartFrame(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetTargetStartFrame in");
    int32_t ret = Player::GetInstance().VideoStreamerSetTargetStartFrame();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetTargetStartFrame out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerConfigure(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerConfigure in");
    int32_t ret = Player::GetInstance().VideoStreamerConfigure();
    AVCODEC_SAMPLE_LOGI("VideoStreamerConfigure out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::VideoStreamerSetParameter(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetParameter in");
    int32_t ret = Player::GetInstance().VideoStreamerSetParameter();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetParameter out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerGetParameter(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerGetParameter in");
    int32_t ret = Player::GetInstance().VideoStreamerGetParameter();
    AVCODEC_SAMPLE_LOGI("VideoStreamerGetParameter out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::VideoStreamerSetSurface(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetSurface in");
    int32_t ret = Player::GetInstance().VideoStreamerSetSurface();
    AVCODEC_SAMPLE_LOGI("VideoStreamerSetSurface out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::VideoStreamerPrepare(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("VideoStreamerPrepare in");
    int32_t ret = Player::GetInstance().VideoStreamerPrepare();
    AVCODEC_SAMPLE_LOGI("VideoStreamerPrepare out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::StartDecoder(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("StartDecoder in");
    int32_t ret = Player::GetInstance().StartDecoder();
    AVCODEC_SAMPLE_LOGI("StartDecoder out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::RenderFirstFrame(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("RenderFirstFrame in");
    int32_t ret = Player::GetInstance().RenderFirstFrame();
    AVCODEC_SAMPLE_LOGI("RenderFirstFrame out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::StartRender(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("StartRender in");
    int32_t ret = Player::GetInstance().StartRender();
    AVCODEC_SAMPLE_LOGI("StartRender out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PlayerNative::StartAudio(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGI("StartAudio in");
    int32_t ret = Player::GetInstance().StartAudio();
    AVCODEC_SAMPLE_LOGI("StartAudio out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::GetDurationTime(napi_env env, napi_callback_info info)
{
    napi_value result;
    int64_t duration = Player::GetInstance().GetDurationTime();
    napi_create_int64(env, duration, &result);
    return result;
}

napi_value PlayerNative::GetProgressTime(napi_env env, napi_callback_info info)
{
    napi_value result;
    int64_t progress = Player::GetInstance().GetProgressTime();
    napi_create_int64(env, progress, &result);
    return result;
}

napi_value PlayerNative::SetVolume(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    double volume = 0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &volume);
    AVCODEC_SAMPLE_LOGD("SetVolume in");
    int32_t ret = Player::GetInstance().SetVolume(volume);
    AVCODEC_SAMPLE_LOGD("SetVolume out");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value PlayerNative::GetCapability(napi_env env, napi_callback_info info)
{
    AVCODEC_SAMPLE_LOGD("IsLpp in");
    auto isLpp = Player::GetInstance().GetCapability();
    napi_value ret;
    if (isLpp) {
        napi_create_int32(env, 1, &ret);
    } else {
        napi_create_int32(env, 0, &ret);
    }
    AVCODEC_SAMPLE_LOGD("IsLpp out");
    return ret;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor classProp[] = {
        {"InitFdNative", nullptr, PlayerNative::InitFd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createLppSetNative", nullptr, PlayerNative::CreateLppSet, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"syncAudioNative", nullptr, PlayerNative::SyncAudio, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"createLppAudioNative", nullptr, PlayerNative::CreateLppAudioStreamer, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"createLppAudioNativeNull", nullptr, PlayerNative::CreateLppAudioStreamerNull, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"createLppVideoNative", nullptr, PlayerNative::CreateLppVideoStreamer, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"createLppVideoNativeNull", nullptr, PlayerNative::CreateLppVideoStreamerNull, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"audioStreamerConfigure", nullptr, PlayerNative::AudioStreamerConfigure, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AudioSetErrorCallback", nullptr, PlayerNative::AudioSetErrorCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AudioStreamerSetCallbackCreate", nullptr, PlayerNative::AudioStreamerSetCallbackCreate, nullptr, nullptr,
        nullptr, napi_default, nullptr},
        {"AudioStreamerSetCallbackCreateNull", nullptr, PlayerNative::AudioStreamerSetCallbackCreateNull, nullptr,
        nullptr, nullptr, napi_default, nullptr},
        {"AudioStreamerSetDataNeededListener", nullptr, PlayerNative::AudioStreamerSetDataNeededListener, nullptr,
        nullptr, nullptr, napi_default, nullptr},
        {"AudioStreamerSetPositionUpdateListener", nullptr, PlayerNative::AudioStreamerSetPositionUpdateListener,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioStreamerSetCallback", nullptr, PlayerNative::AudioStreamerSetCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AudioSetInterruptListener", nullptr, PlayerNative::AudioSetInterruptListener, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AudioSetEosCallback", nullptr, PlayerNative::AudioSetEosCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AudioSetOnDeviceChanged", nullptr, PlayerNative::AudioSetOnDeviceChanged, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AudioreturnFrames", nullptr, PlayerNative::AudioreturnFrames, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AudioCallbackDestroy", nullptr, PlayerNative::AudioCallbackDestroy, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AudioDestroy", nullptr, PlayerNative::AudioDestroy, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"audioSetParameterNative", nullptr, PlayerNative::AudioStreamerSetParameter, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"audioGetParameterNative", nullptr, PlayerNative::AudioStreamerGetParameter, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"audioPrepareNative", nullptr, PlayerNative::AudioStreamerPrepare, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"VideoStreamerSetCallbackCreateNull", nullptr, PlayerNative::VideoStreamerSetCallbackCreateNull, nullptr,
        nullptr, nullptr, napi_default, nullptr},
        {"VideoStreamerSetDataNeededListener", nullptr, PlayerNative::VideoStreamerSetDataNeededListener, nullptr,
        nullptr, nullptr, napi_default, nullptr},
        {"VideoStreamerSetStreamChangedListener", nullptr, PlayerNative::VideoStreamerSetStreamChangedListener,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"VideoStreamerSetCallback", nullptr, PlayerNative::VideoStreamerSetCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoStreamerSetErrorCallback", nullptr, PlayerNative::VideoStreamerSetErrorCallback, nullptr, nullptr,
        nullptr, napi_default, nullptr},
        {"VideoStreamerSetFirstFrameDecodedCallback", nullptr, PlayerNative::VideoStreamerSetFirstFrameDecodedCallback,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"VideoStreamerSetRenderStartCallback", nullptr, PlayerNative::VideoStreamerSetRenderStartCallback, nullptr,
        nullptr, nullptr, napi_default, nullptr},
        {"VideoStreamerSetEosCallback", nullptr, PlayerNative::VideoStreamerSetEosCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoStreamerCallbackDestroy", nullptr, PlayerNative::VideoStreamerCallbackDestroy, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoStreamerDestroy", nullptr, PlayerNative::VideoStreamerDestroy, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoStreamerreturnFrames", nullptr, PlayerNative::VideoStreamerreturnFrames, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoStreamerSetTargetStartFrame", nullptr, PlayerNative::VideoStreamerSetTargetStartFrame, nullptr,
        nullptr, nullptr, napi_default, nullptr},
        {"videoConfigureNative", nullptr, PlayerNative::VideoStreamerConfigure, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"videoStreamerSetParameter", nullptr, PlayerNative::VideoStreamerSetParameter, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"videoStreamerGetParameter", nullptr, PlayerNative::VideoStreamerGetParameter, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"videoSetSurfaceNative", nullptr, PlayerNative::VideoStreamerSetSurface, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"videoPrepareNative", nullptr, PlayerNative::VideoStreamerPrepare, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"flushNative", nullptr, PlayerNative::Flush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioFlushNative", nullptr, PlayerNative::AudioFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"videoFlushNative", nullptr, PlayerNative::VideoFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stopNative", nullptr, PlayerNative::Stop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStopNative", nullptr, PlayerNative::AudioStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"videoStopNative", nullptr, PlayerNative::VideoStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseNative", nullptr, PlayerNative::Release, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetNative", nullptr, PlayerNative::Reset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioResetNative", nullptr, PlayerNative::AudioReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"videoResetNative", nullptr, PlayerNative::VideoReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pauseNative", nullptr, PlayerNative::Pause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioPauseNative", nullptr, PlayerNative::AudioPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"videoPauseNative", nullptr, PlayerNative::VideoPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resumeNative", nullptr, PlayerNative::Resume, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioResumeNative", nullptr, PlayerNative::AudioResume, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"videoResumeNative", nullptr, PlayerNative::VideoResume, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"speedNative", nullptr, PlayerNative::Speed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setAudioSpeedNative", nullptr, PlayerNative::SetAudioSpeed, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"setVideoSpeedNative", nullptr, PlayerNative::SetVideoSpeed, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"configureNative", nullptr, PlayerNative::Configure, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seekNative", nullptr, PlayerNative::Seek, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seekAccNative", nullptr, PlayerNative::SeekAcc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDurationTime", nullptr, PlayerNative::GetDurationTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getProgressTime", nullptr, PlayerNative::GetProgressTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"startNative", nullptr, PlayerNative::Start, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createPrepareNative", nullptr, PlayerNative::CreatePrepare, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"startDecoderNative", nullptr, PlayerNative::StartDecoder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"renderFirstFrameNative", nullptr, PlayerNative::RenderFirstFrame, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"startRenderNative", nullptr, PlayerNative::StartRender, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"startAudioNative", nullptr, PlayerNative::StartAudio, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setVolumeNative", nullptr, PlayerNative::SetVolume, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCapability", nullptr, PlayerNative::GetCapability, nullptr, nullptr, nullptr, napi_default, nullptr},
    };

    NativeXComponentSample::PluginManager::GetInstance()->Export(env, exports);
    napi_define_properties(env, exports, sizeof(classProp) / sizeof(classProp[0]), classProp);
    return exports;
}
EXTERN_C_END

static napi_module PlayerModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "player",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterPlayerModule(void) { napi_module_register(&PlayerModule); }