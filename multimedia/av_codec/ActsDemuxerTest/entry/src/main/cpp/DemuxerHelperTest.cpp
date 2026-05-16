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

#include "include/DemuxerHelperTest.h"
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <iostream>

using namespace std;

int64_t GetFileSizeHelper(const char *fileName)
{
    int64_t fileSize = 0;
    if (fileName != nullptr) {
        struct stat fileStatus {};
        if (stat(fileName, &fileStatus) == 0) {
            fileSize = static_cast<int64_t>(fileStatus.st_size);
        }
    }
    return fileSize;
}

int OpenFileAndCreateSource(const char *file, int *fd, OH_AVSource **source)
{
    *fd = open(file, O_RDONLY);
    int64_t size = GetFileSizeHelper(file);
    if (*fd < 0 || size <= 0) {
        return -1;
    }
    
    *source = OH_AVSource_CreateWithFD(*fd, 0, size);
    if (*source == nullptr) {
        close(*fd);
        return -1;
    }
    
    return 0;
}

int CreateDemuxerAndGetTrackCount(OH_AVSource *source, OH_AVDemuxer **demuxer,
    OH_AVFormat **sourceFormat, int32_t *trackCount)
{
    *demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (*demuxer == nullptr) {
        return -1;
    }
    
    *sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (*sourceFormat == nullptr) {
        return -1;
    }
    
    if (!(OH_AVFormat_GetIntValue(*sourceFormat, OH_MD_KEY_TRACK_COUNT, trackCount))) {
        return -1;
    }
    
    return 0;
}

int InitDemuxerWithFile(DemuxerInitParams *params)
{
    if (OpenFileAndCreateSource(params->file, params->fd, params->source) != 0) {
        return -1;
    }
    
    if (CreateDemuxerAndGetTrackCount(*(params->source), params->demuxer, params->sourceFormat,
        params->trackCount) != 0) {
        close(*(params->fd));
        return -1;
    }
    
    return 0;
}

int SelectAllTracks(OH_AVDemuxer *demuxer, int32_t trackCount)
{
    for (int32_t index = 0; index < trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return -1;
        }
    }
    return 0;
}

int ReadAndValidateSamples(SampleReadParams *params)
{
    if (OH_AVDemuxer_ReadSample(params->demuxer, params->trackIndex, params->memory, params->attr) != AV_ERR_OK) {
        return -1;
    }
    
    if (params->attr->flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
        *(params->isEnd) = true;
        return 0;
    }
    
    (*(params->frameCount))++;
    return 0;
}

int PerformSeek(OH_AVDemuxer *demuxer, int64_t timeMs, OH_AVSeekMode mode)
{
    if (OH_AVDemuxer_SeekToTime(demuxer, timeMs, mode) != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

int ValidateTrackFormat(OH_AVFormat *trackFormat, int32_t expectedTrackType)
{
    if (trackFormat == nullptr) {
        return -1;
    }
    
    int32_t trackType = 0;
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &trackType))) {
        return -1;
    }
    
    if (trackType != expectedTrackType) {
        return -1;
    }
    
    return 0;
}

int ProcessAudioTrack(TrackProcessParams *params)
{
    if (OH_AVDemuxer_ReadSample(params->demuxer, params->index, params->memory, params->attr) != AV_ERR_OK) {
        return -1;
    }
    
    if (params->attr->flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
        *(params->isEnd) = true;
        cout << *(params->frameCount) << "    audio is end !!!!!!!!!!!!!!!" << endl;
    } else {
        (*(params->frameCount))++;
    }
    
    return 0;
}

int ProcessVideoTrack(TrackProcessParams *params)
{
    if (OH_AVDemuxer_ReadSample(params->demuxer, params->index, params->memory, params->attr) != AV_ERR_OK) {
        return -1;
    }
    
    if (params->attr->flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
        *(params->isEnd) = true;
        cout << *(params->frameCount) << "   video is end !!!!!!!!!!!!!!!" << endl;
    } else {
        (*(params->frameCount))++;
    }
    
    return 0;
}

void CleanupDemuxerResources(OH_AVSource **source, OH_AVDemuxer **demuxer,
    OH_AVFormat **sourceFormat, OH_AVFormat **trackFormat, OH_AVMemory **memory)
{
    if (trackFormat && *trackFormat != nullptr) {
        OH_AVFormat_Destroy(*trackFormat);
        *trackFormat = nullptr;
    }
    if (sourceFormat && *sourceFormat != nullptr) {
        OH_AVFormat_Destroy(*sourceFormat);
        *sourceFormat = nullptr;
    }
    if (memory && *memory != nullptr) {
        OH_AVMemory_Destroy(*memory);
        *memory = nullptr;
    }
    if (demuxer && *demuxer != nullptr) {
        OH_AVDemuxer_Destroy(*demuxer);
        *demuxer = nullptr;
    }
    if (source && *source != nullptr) {
        OH_AVSource_Destroy(*source);
        *source = nullptr;
    }
}

int ReadSamplesUntilEOS(SampleReadParams *params)
{
    bool isEnd = false;
    while (!isEnd) {
        if (OH_AVDemuxer_ReadSample(params->demuxer, params->trackIndex, params->memory, params->attr) != AV_ERR_OK) {
            return -1;
        }
        
        if (params->attr->flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            isEnd = true;
            break;
        }
        
        (*(params->frameCount))++;
    }
    return 0;
}

int ValidateFrameCount(int actualCount, int expectedCount)
{
    if (actualCount != expectedCount) {
        cout << "Frame count mismatch: expected=" << expectedCount
             << ", actual=" << actualCount << endl;
        return -1;
    }
    return 0;
}

struct SingleTrackParams {
    OH_AVDemuxer *demuxer;
    OH_AVSource *source;
    int32_t index;
    OH_AVMemory *memory;
    OH_AVCodecBufferAttr *attr;
    int32_t trackType;
    bool *audioIsEnd;
    bool *videoIsEnd;
    int *audioFrame;
    int *videoFrame;
};

// 辅助函数：处理单个轨道的读取
static int ProcessSingleTrack(const SingleTrackParams &params)
{
    TrackProcessParams videoParams = {params.demuxer, params.source, params.index, params.memory,
                                      params.attr, params.videoIsEnd, params.videoFrame};
    TrackProcessParams audioParams = {params.demuxer, params.source, params.index, params.memory,
                                      params.attr, params.audioIsEnd, params.audioFrame};
    
    if (params.trackType == 0) {
        return ProcessVideoTrack(&videoParams);
    } else {
        return ProcessAudioTrack(&audioParams);
    }
}

int ProcessMultiTrackReading(MultiTrackParams *params)
{
    OH_AVCodecBufferAttr attr;
    OH_AVFormat *trackFormat = nullptr;
    int32_t trackType = 0;
    
    while (!(*(params->audioIsEnd)) || !(*(params->videoIsEnd))) {
        for (int32_t index = 0; index < params->trackCount; index++) {
            if ((*(params->audioIsEnd) && index == 1) || (*(params->videoIsEnd) && index == 0)) {
                continue;
            }
            
            trackFormat = OH_AVSource_GetTrackFormat(params->source, index);
            if (trackFormat == nullptr) {
                return -1;
            }
            
            if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &trackType))) {
                OH_AVFormat_Destroy(trackFormat);
                return -1;
            }
            
            SingleTrackParams trackParams = {params->demuxer, params->source, index, params->memory, &attr,
                                             trackType, params->audioIsEnd, params->videoIsEnd,
                                             params->audioFrame, params->videoFrame};
            if (ProcessSingleTrack(trackParams) != 0) {
                OH_AVFormat_Destroy(trackFormat);
                return -1;
            }
            
            OH_AVFormat_Destroy(trackFormat);
            trackFormat = nullptr;
        }
    }
    
    return 0;
}
