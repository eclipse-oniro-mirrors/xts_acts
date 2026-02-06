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

#ifndef VIDEO_CODEC_PLAYER_H
#define VIDEO_CODEC_PLAYER_H

#include <bits/alltypes.h>
#include <mutex>
#include <memory>
#include <atomic>
#include <thread>
#include <unistd.h>
#include <ohaudio/native_audiorenderer.h>
#include <ohaudio/native_audiostreambuilder.h>
#include <fstream>
#include "lpp_audio_streamer.h"
#include "lpp_video_streamer.h"
#include "video_decoder.h"
#include "audio_decoder.h"
#include "multimedia/player_framework/native_avbuffer.h"
#include "demuxer.h"
#include "sample_info.h"
#include "plugin_manager.h"
#include "video_encoder.h"

class Player {
public:
    Player(){};
    ~Player();
    
    static Player& GetInstance()
    {
        static Player player;
        return player;
    }

    int32_t Init(SampleInfo &sampleInfo);
    int32_t CreateLppSet();
    int32_t SyncAudio();
    int32_t CreateLppAudioStreamer();
    int32_t CreateLppAudioStreamerNull();
    int32_t AudioStreamerSetCallbackCreateNull();
    int32_t AudioStreamerSetCallbackCreate();
    int32_t AudioStreamerSetDataNeededListener();
    int32_t AudioStreamerSetPositionUpdateListener();
    int32_t AudioStreamerSetCallback();
    int32_t AudioSetEosCallback();
    int32_t AudioSetOnDeviceChanged();
    int32_t AudioreturnFrames();
    int32_t AudioCallbackDestroy();
    int32_t AudioDestroy();
    int32_t AudioSetInterruptListener();
    int32_t AudioStreamerConfigure();
    int32_t AudioStreamerSetParameter();
    int32_t AudioStreamerGetParameter();
    int32_t AudioStreamerPrepare();
    int32_t CreateLppVideoStreamer();
    int32_t CreateLppVideoStreamerNull();
    int32_t VideoStreamerSetCallbackCreateNull();
    int32_t VideoStreamerSetDataNeededListener();
    int32_t VideoStreamerSetStreamChangedListener();
    int32_t VideoStreamerSetCallback();
    int32_t VideoStreamerSetErrorCallback();
    int32_t VideoStreamerSetFirstFrameDecodedCallback();
    int32_t VideoStreamerSetRenderStartCallback();
    int32_t VideoStreamerSetEosCallback();
    int32_t VideoStreamerCallbackDestroy();
    int32_t VideoStreamerDestroy();
    int32_t VideoStreamerreturnFrames();
    int32_t VideoStreamerSetTargetStartFrame();
    int32_t VideoStreamerConfigure();
    int32_t VideoStreamerSetParameter();
    int32_t VideoStreamerGetParameter();
    int32_t VideoStreamerSetSurface();
    int32_t VideoStreamerPrepare();
    int32_t VideoSetErrorCallback();
    int32_t AudioSetErrorCallback();
    int32_t Start();
    int32_t Start1();
    int32_t Start2();
    int32_t AudioStop();
    int32_t VideoStop();
    int32_t Stop();
    int32_t Reset();
    int32_t AudioReset();
    int32_t VideoReset();
    int32_t Pause();
    int32_t AudioPause();
    int32_t VideoPause();
    int32_t Resume();
    int32_t AudioResume();
    int32_t VideoResume();
    int32_t SetSpeed(double speed);
    int32_t SetAudioSpeed(double speed);
    int32_t SetVideoSpeed(double speed);
    int32_t SetVolume(double volume);
    int32_t Configure();
    int32_t Flush();
    int32_t AudioFlush();
    int32_t VideoFlush();
    int32_t Seek(int64_t seekTime, int32_t mode, bool acc);
    int32_t Seek(int64_t seekTime, int32_t mode);
    int32_t CreatePrepare();
    int32_t StartDecoder();
    int32_t RenderFirstFrame();
    int32_t StartRender();
    int32_t StartAudio();
    void Release();
    void ReleaseDone();
    void StartRelease();
    int64_t GetDurationTime();
    int64_t GetProgressTime();
    int32_t GetCapability();

private:
    void VideoDecInputThread();
    void VideoDecOutputThread();
    void AudioDecInputThread();
    void AudioDecOutputThread();
    void LppDataNeededThread();
    void LppDataNeededThread1();
    void LppDataNeededThread2();
    void LppDataProducerThread();
    void LppVideoDataNeededThread();
    void SeekInner(int64_t seekTime, int32_t mode);
    void ReleaseThread();
    int32_t CreateAudioDecoder();
    int32_t CreateVideoDecoder();
    int64_t GetCurrentTime();
    bool Intercept();
    
    int64_t ReadToAudioTargetPts(int64_t pts);

    std::unique_ptr<VideoDecoder> videoDecoder_ = nullptr;
    std::shared_ptr<AudioDecoder> audioDecoder_ = nullptr;
    std::shared_ptr<LppAudioStreamer> lppAudioStreamer_ = nullptr;
    std::shared_ptr<LppVideoStreamer> lppVideoStreamer_ = nullptr;
    std::unique_ptr<Demuxer> demuxer_ = nullptr;
    std::unique_ptr<VideoEncoder> videoEncoder_ = nullptr;
    
    std::mutex mutex_;
    std::atomic<bool> isStarted_ { false };
    std::atomic<bool> isReleased_ { false };
    std::atomic<bool> isAudioDone { false };
    std::atomic<bool> isVideoDone { false };
    std::unique_ptr<std::thread> videoDecInputThread_ = nullptr;
    std::unique_ptr<std::thread> videoDecOutputThread_ = nullptr;
    std::unique_ptr<std::thread> audioDecInputThread_ = nullptr;
    std::unique_ptr<std::thread> audioDecOutputThread_ = nullptr;
    std::condition_variable doneCond_;
    std::mutex doneMutex;
    SampleInfo sampleInfo_;
    CodecUserData *videoDecContext_ = nullptr;
    CodecUserData *audioDecContext_ = nullptr;
    OH_AudioStreamBuilder* builder_ = nullptr;
    OH_AudioRenderer* audioRenderer_ = nullptr;
    
    LppUserData *lppContext_ = nullptr;
    // 等回调消费数据
    std::unique_ptr<std::thread> LppDataNeededThread_ = nullptr;
    // 生产数据，Max
    std::unique_ptr<std::thread> LppDataProducerThread_ = nullptr;
    void GetOneBuffer();
    
    LppUserData *lppVideoContext_ = nullptr;
    std::unique_ptr<std::thread> lppVideoDataNeededThread_ = nullptr;
    std::unique_ptr<std::thread> lppSeekThread_ = nullptr;
    
    int64_t progress = 0;
    int64_t nowTimeStamp = 0;
    int64_t audioTimeStamp = 0;
    int64_t writtenSampleCnt = 0;
    int64_t audioBufferPts = 0;
#ifdef DEBUG_DECODE
    std::ofstream audioOutputFile_; // for debug
#endif
    static constexpr int64_t MICROSECOND_TO_S = 1000000;
    static constexpr int64_t NANO_TO_S = 1000000000;
};

#endif // VIDEO_CODEC_PLAYER_H