/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef DEMUXER_TEST_HELPER_H
#define DEMUXER_TEST_HELPER_H

#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avmemory.h>
#include <multimedia/player_framework/native_avbuffer.h>

// 结构体：封装初始化参数
struct DemuxerInitParams {
    const char *file;
    int *fd;
    OH_AVSource **source;
    OH_AVDemuxer **demuxer;
    OH_AVFormat **sourceFormat;
    int32_t *trackCount;
};

// 结构体：封装样本读取参数
struct SampleReadParams {
    OH_AVDemuxer *demuxer;
    OH_AVMemory *memory;
    int32_t trackIndex;
    OH_AVCodecBufferAttr *attr;
    bool *isEnd;
    int *frameCount;
};

// 结构体：封装轨道处理参数
struct TrackProcessParams {
    OH_AVDemuxer *demuxer;
    OH_AVSource *source;
    int32_t index;
    OH_AVMemory *memory;
    OH_AVCodecBufferAttr *attr;
    bool *isEnd;
    int *frameCount;
};

// 结构体：封装多轨道读取参数
struct MultiTrackParams {
    OH_AVDemuxer *demuxer;
    OH_AVSource *source;
    int32_t trackCount;
    OH_AVMemory *memory;
    bool *audioIsEnd;
    bool *videoIsEnd;
    int *audioFrame;
    int *videoFrame;
};

// 通用辅助函数：初始化媒体源和解复用器
int InitDemuxerWithFile(DemuxerInitParams *params);

// 通用辅助函数：选择所有轨道
int SelectAllTracks(OH_AVDemuxer *demuxer, int32_t trackCount);

// 通用辅助函数：读取并验证样本数据
int ReadAndValidateSamples(SampleReadParams *params);

// 通用辅助函数：执行 Seek 操作
int PerformSeek(OH_AVDemuxer *demuxer, int64_t timeMs, OH_AVSeekMode mode);

// 通用辅助函数：验证轨道格式
int ValidateTrackFormat(OH_AVFormat *trackFormat, int32_t expectedTrackType);

// 通用辅助函数：处理音频轨道
int ProcessAudioTrack(TrackProcessParams *params);

// 通用辅助函数：处理视频轨道
int ProcessVideoTrack(TrackProcessParams *params);

// 通用辅助函数：清理资源
void CleanupDemuxerResources(OH_AVSource **source, OH_AVDemuxer **demuxer,
    OH_AVFormat **sourceFormat, OH_AVFormat **trackFormat, OH_AVMemory **memory);

// 通用辅助函数：获取文件大小
int64_t GetFileSizeHelper(const char *fileName);

// 通用辅助函数：打开文件并创建源
int OpenFileAndCreateSource(const char *file, int *fd, OH_AVSource **source);

// 通用辅助函数：创建解复用器并获取轨道数
int CreateDemuxerAndGetTrackCount(OH_AVSource *source, OH_AVDemuxer **demuxer,
    OH_AVFormat **sourceFormat, int32_t *trackCount);

// 通用辅助函数：读取样本直到 EOS
int ReadSamplesUntilEOS(SampleReadParams *params);

// 通用辅助函数：验证帧数
int ValidateFrameCount(int actualCount, int expectedCount);

// 通用辅助函数：处理多轨道读取
int ProcessMultiTrackReading(MultiTrackParams *params);

#endif // DEMUXER_TEST_HELPER_H
