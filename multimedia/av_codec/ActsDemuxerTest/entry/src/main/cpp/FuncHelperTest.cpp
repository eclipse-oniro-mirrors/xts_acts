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

#include "include/FuncHelperTest.h"
#include "include/DemuxerHelperTest.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avmemory.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <random>
#include <iostream>
#include <string>

using namespace std;

const std::string HEVC_LIB_PATH = std::string(AV_CODEC_PATH) + "/libav_codec_hevc_parser.z.so";

// 全局变量定义
OH_AVSource *source = nullptr;
OH_AVDemuxer *demuxer = nullptr;
OH_AVFormat *sourceFormat = nullptr;
OH_AVFormat *trackFormat = nullptr;
OH_AVMemory *memory = nullptr;
int32_t g_trackCount = 0;

int GetSecureRandomInt(int max)
{
    static random_device rd;
    static mt19937 gen(rd());
    uniform_int_distribution<> dis(0, max - 1);
    return dis(gen);
}

int InitDemuxerSimple(const char *file, int &fd, int64_t &size)
{
    fd = open(file, O_RDONLY);
    size = GetFileSizeHelper(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        return -1;
    }
    
    return 0;
}

int SelectAllTracksSimple()
{
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return -1;
        }
    }
    return 0;
}

int ReadSamplesToPosition(int32_t trackIndex, int targetPos, int64_t &startPts)
{
    OH_AVCodecBufferAttr attr;
    int count = 0;
    bool isFirstFrame = true;
    bool isEnd = false;
    
    while (!isEnd && count < targetPos) {
        if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr) != AV_ERR_OK) {
            return -1;
        }
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            isEnd = true;
            break;
        }
        if (isFirstFrame) {
            startPts = attr.pts;
            isFirstFrame = false;
        }
        count++;
    }
    return 0;
}

bool ProcessSample4300(SampleProcessParams &params)
{
    if (OH_AVDemuxer_ReadSample(params.demuxer, params.index, params.memory, params.attr) != AV_ERR_OK) {
        return false;
    }

    if (params.count != params.pos) {
        if (params.attr->flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            *params.isEnd = true;
            cout << "is end !!!!!!!!!!!!!!!" << endl;
        }
        return true;
    }

    cout << params.count << " count == pos!!!!!!!!!" << endl;
    if (OH_AVDemuxer_UnselectTrackByID(params.demuxer, 0) != AV_ERR_OK) {
        return false;
    }
    if (OH_AVDemuxer_UnselectTrackByID(params.demuxer, 1) != AV_ERR_OK) {
        return false;
    }
    OH_AVErrCode readResult = OH_AVDemuxer_ReadSample(params.demuxer, params.index, params.memory, params.attr);
    if (readResult != AV_ERR_OPERATE_NOT_PERMIT) {
        return false;
    }
    *params.isEnd = true;
    return true;
}

void SetAudioValue(OH_AVCodecBufferAttr attr, bool &audioIsEnd, int &audioFrame, int &aKeyCount)
{
    if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
        audioIsEnd = true;
        cout << audioFrame << "    audio is end !!!!!!!!!!!!!!!" << endl;
    } else {
        audioFrame++;
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_SYNC_FRAME) {
            aKeyCount++;
        }
    }
}

void SetVideoValue(OH_AVCodecBufferAttr attr, bool &videoIsEnd, int &videoFrame, int &vKeyCount)
{
    if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
        videoIsEnd = true;
        cout << videoFrame << "   video is end !!!!!!!!!!!!!!!" << endl;
    } else {
        videoFrame++;
        cout << "video track !!!!!" << endl;
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_SYNC_FRAME) {
            vKeyCount++;
        }
    }
}

void SetVarValue(OH_AVCodecBufferAttr attr, const int &tarckType, bool &audioIsEnd, bool &videoIsEnd)
{
    if (tarckType == MEDIA_TYPE_AUD && (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS)) {
        audioIsEnd = true;
        cout << "audio is end !!!!!!!!!!!!!!!" << endl;
    }

    if (tarckType == MEDIA_TYPE_VID && (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS)) {
        videoIsEnd = true;
        cout << "video is end !!!!!!!!!!!!!!!" << endl;
    }
}

void SetFirstFrameFlag(bool &isFirstFrame)
{
    if (isFirstFrame) {
        isFirstFrame = false;
    }
}

void SetEndFlag(bool &audioIsEnd, bool &videoIsEnd)
{
    audioIsEnd = true;
    videoIsEnd = true;
}

int ProcessDualTrackLoop(DualTrackParams &params)
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    while (!(*params.audioIsEnd) || !(*params.videoIsEnd)) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            if (trackFormat == nullptr ||
                !(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType))) {
                return -1;
            }
            OH_AVFormat_Destroy(trackFormat);
            trackFormat = nullptr;
            if (((*params.audioIsEnd) && (tarckType == MEDIA_TYPE_AUD)) ||
                ((*params.videoIsEnd) && (tarckType == MEDIA_TYPE_VID))) {
                continue;
            }
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) {
                return -1;
            }
            if (tarckType == MEDIA_TYPE_AUD) {
                SetAudioValue(attr, *params.audioIsEnd, *params.audioFrame, *params.aKeyCount);
            } else if (tarckType == MEDIA_TYPE_VID) {
                SetVideoValue(attr, *params.videoIsEnd, *params.videoFrame, *params.vKeyCount);
            }
        }
    }
    return 0;
}

void InitTestResources()
{
    if (memory == nullptr) {
        memory = OH_AVMemory_Create(MEMORY_BUFFER_WIDTH * MEMORY_BUFFER_HEIGHT);
    }
}

void CleanupResources()
{
    CleanupDemuxerResources(&source, &demuxer, &sourceFormat, &trackFormat, &memory);
    g_trackCount = 0;
}
