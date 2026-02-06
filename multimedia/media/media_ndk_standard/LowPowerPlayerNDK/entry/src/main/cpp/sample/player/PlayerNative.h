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

#ifndef VIDEO_CODEC_SAMPLE_PLAYER_NATIVE_H
#define VIDEO_CODEC_SAMPLE_PLAYER_NATIVE_H

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <memory>
#include <uv.h>
#include "napi/native_api.h"
#include "Player.h"
#include "dfx/error/av_codec_sample_error.h"
#include "av_codec_sample_log.h"
#include "plugin_manager.h"

class PlayerNative {
public:
    static napi_value InitFd(napi_env env, napi_callback_info info);
    static napi_value CreateLppSet(napi_env env, napi_callback_info info);
    static napi_value SyncAudio(napi_env env, napi_callback_info info);
    static napi_value CreateLppAudioStreamer(napi_env env, napi_callback_info info);
    static napi_value CreateLppAudioStreamerNull(napi_env env, napi_callback_info info);
    static napi_value CreateLppVideoStreamer(napi_env env, napi_callback_info info);
    static napi_value CreateLppVideoStreamerNull(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerSetParameter(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerGetParameter(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerConfigure(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerSetCallbackCreateNull(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerSetCallbackCreate(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerSetDataNeededListener(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerSetPositionUpdateListener(napi_env env, napi_callback_info info);
    static napi_value AudioSetErrorCallback(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerSetCallback(napi_env env, napi_callback_info info);
    static napi_value AudioSetInterruptListener(napi_env env, napi_callback_info info);
    static napi_value AudioSetEosCallback(napi_env env, napi_callback_info info);
    static napi_value AudioSetOnDeviceChanged(napi_env env, napi_callback_info info);
    static napi_value AudioreturnFrames(napi_env env, napi_callback_info info);
    static napi_value AudioCallbackDestroy(napi_env env, napi_callback_info info);
    static napi_value AudioDestroy(napi_env env, napi_callback_info info);
    static napi_value AudioStreamerPrepare(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetCallbackCreateNull(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetDataNeededListener(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetStreamChangedListener(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetCallback(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetErrorCallback(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetFirstFrameDecodedCallback(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetRenderStartCallback(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetEosCallback(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerCallbackDestroy(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerDestroy(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerreturnFrames(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetTargetStartFrame(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerConfigure(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetParameter(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerGetParameter(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerSetSurface(napi_env env, napi_callback_info info);
    static napi_value VideoStreamerPrepare(napi_env env, napi_callback_info info);
    static napi_value Flush(napi_env env, napi_callback_info info);
    static napi_value AudioFlush(napi_env env, napi_callback_info info);
    static napi_value VideoFlush(napi_env env, napi_callback_info info);
    static napi_value Stop(napi_env env, napi_callback_info info);
    static napi_value AudioStop(napi_env env, napi_callback_info info);
    static napi_value VideoStop(napi_env env, napi_callback_info info);
    static napi_value Release(napi_env env, napi_callback_info info);
//     reset pause resume speed seek 多实例 变分辨率
    static napi_value Reset(napi_env env, napi_callback_info info);
    static napi_value AudioReset(napi_env env, napi_callback_info info);
    static napi_value VideoReset(napi_env env, napi_callback_info info);
    static napi_value Pause(napi_env env, napi_callback_info info);
    static napi_value AudioPause(napi_env env, napi_callback_info info);
    static napi_value VideoPause(napi_env env, napi_callback_info info);
    static napi_value Resume(napi_env env, napi_callback_info info);
    static napi_value AudioResume(napi_env env, napi_callback_info info);
    static napi_value VideoResume(napi_env env, napi_callback_info info);
    static napi_value Speed(napi_env env, napi_callback_info info);
    static napi_value SetAudioSpeed(napi_env env, napi_callback_info info);
    static napi_value SetVideoSpeed(napi_env env, napi_callback_info info);
    static napi_value Seek(napi_env env, napi_callback_info info);
    static napi_value Configure(napi_env env, napi_callback_info info);
    static napi_value SeekAcc(napi_env env, napi_callback_info info);
    static napi_value SetVolume(napi_env env, napi_callback_info info);
    static napi_value Start(napi_env env, napi_callback_info info);
    static napi_value CreatePrepare(napi_env env, napi_callback_info info);
    static napi_value StartDecoder(napi_env env, napi_callback_info info);
    static napi_value RenderFirstFrame(napi_env env, napi_callback_info info);
    static napi_value StartRender(napi_env env, napi_callback_info info);
    static napi_value StartAudio(napi_env env, napi_callback_info info);
    static napi_value GetDurationTime(napi_env env, napi_callback_info info);
    static napi_value GetProgressTime(napi_env env, napi_callback_info info);
    static napi_value GetCapability(napi_env env, napi_callback_info info);
};
#endif // VIDEO_CODEC_SAMPLE_PLAYER_NATIVE_H