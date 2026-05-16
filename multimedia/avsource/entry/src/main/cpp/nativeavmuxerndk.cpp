/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "node_api.h"
#include <fcntl.h>
#include <multimedia/player_framework/native_avcodec_audiodecoder.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avmuxer.h>
#include <unistd.h>
#include "hilog/log.h"

#define AUDIO_LOG_TAG "AVCODEC_TAGLOG"
#define AUDIO_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, AUDIO_LOG_DOMAIN, AUDIO_LOG_TAG, fmt, ##__VA_ARGS__)
#define MUNUSONE (-1)
#define ZEROVAL 0
#define ONEONEVAL 11
#define SUCCESS 0
#define FAIL (-1)
#define ONETWOVAL 12
#define ONEFIVEVAL 15
#define TWOTWOVAL 22
#define BIGVAL 44100
#define TWOVAL 2
#define PARAM_0666 0666

static napi_value OHAVMuxerCreate(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerCreate fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    int returnValue = FAIL;
    if (muxer != nullptr) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMuxer_Destroy(muxer);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerSetRotation(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerSetRotation fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVErrCode backInfo = OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_OK) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerSetFormat(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerSetFormat fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVFormat *fileFormat = OH_AVFormat_Create();
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);

    OH_AVFormat_SetStringValue(fileFormat, OH_MD_KEY_CREATION_TIME, "2024-12-28T01:23:45.000000Z");
    OH_AVErrCode backInfo = OH_AVMuxer_SetFormat(muxer, fileFormat);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_OK) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    OH_AVFormat_Destroy(fileFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerStart(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerStart fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVFormat_SetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_SAMPLE_RATE, BIGVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, TWOVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_ENABLE_MOOV_FRONT, 1);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVErrCode backInfo = OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_OK) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerStop(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerStop fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVFormat_SetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_SAMPLE_RATE, BIGVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, TWOVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_ENABLE_MOOV_FRONT, 1);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVErrCode backInfo = OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_OK) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerWriteSample(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONEONEVAL;
    attrInfo.size = ONEONEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    int trackId = audioTrackId;
    OH_AVMemory *sample = OH_AVMemory_Create(TWOTWOVAL);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_DEFAULT;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, PARAM_0666);
    LOG("OHAVMuxerWriteSample fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVFormat_SetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_SAMPLE_RATE, BIGVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, TWOVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_ENABLE_MOOV_FRONT, 1);
    OH_AVMuxer_AddTrack(muxer, &trackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    int backInfo = OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    int returnValue = FAIL;
    OH_AVMuxer_Stop(muxer);
    if (backInfo == AV_ERR_OK) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerWriteSampleBuffer(napi_env env, napi_callback_info info) {
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONEONEVAL;
    attrInfo.size = ONEONEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    int trackId = audioTrackId;
    OH_AVBuffer *sample = OH_AVBuffer_Create(TWOTWOVAL);
    OH_AVBuffer_SetBufferAttr(sample, &attrInfo);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_DEFAULT;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, PARAM_0666);
    LOG("OHAVMuxerWriteSampleBuffer fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVFormat_SetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_SAMPLE_RATE, BIGVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, TWOVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_ENABLE_MOOV_FRONT, 0);
    OH_AVMuxer_AddTrack(muxer, &trackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    int backInfo = OH_AVMuxer_WriteSampleBuffer(muxer, trackId, sample);
    int returnValue = FAIL;
    OH_AVMuxer_Stop(muxer);
    if (backInfo == AV_ERR_OK) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVBuffer_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerAddTrack(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerAddTrack fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVFormat_SetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_SAMPLE_RATE, BIGVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, TWOVAL);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_ENABLE_MOOV_FRONT, 1);
    int ret = OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (ret == AV_ERR_OK) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerDestroy(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerDestroy fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    int returnValue = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode desval = OH_AVMuxer_Destroy(muxer);
    if (desval == AV_ERR_OK) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerCreateAbnormal(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = MUNUSONE;
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    int returnValue = FAIL;
    if (muxer == nullptr) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerSetRotationAbnormal(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerSetRotationAbnormal fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVErrCode backInfo = OH_AVMuxer_SetRotation(nullptr, rotation);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_INVALID_VAL) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
        OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerSetFormatAbnormal(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerSetFormatAbnormal fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVFormat *fileFormat = OH_AVFormat_Create();
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);

    OH_AVFormat_SetStringValue(fileFormat, OH_MD_KEY_CREATION_TIME, "This is abnormal case");
    OH_AVErrCode backInfo = OH_AVMuxer_SetFormat(muxer, fileFormat);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_INVALID_VAL) { // Expected Returned AV_ERR_INVALID_VAL
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    OH_AVFormat_Destroy(fileFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerStartAbnormal(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerStartAbnormal fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVErrCode backInfo = OH_AVMuxer_Start(nullptr);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_INVALID_VAL) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerStopAbnormal(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerStopAbnormal fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVErrCode backInfo = OH_AVMuxer_Stop(nullptr);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_INVALID_VAL) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerWriteSampleAbnormal(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    LOG("OHAVMuxerWriteSampleAbnormal fd is %{public}d", fileDescribe);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVErrCode backInfo = OH_AVMuxer_WriteSample(nullptr, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (backInfo == AV_ERR_INVALID_VAL) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerAddTrackAbnormal(napi_env env, napi_callback_info info)
{
    OH_AVMuxer *muxer = nullptr;
    int audioTrackId = MUNUSONE;
    int32_t rotation = ZEROVAL;
    int trackId = audioTrackId;
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = ONETWOVAL;
    attrInfo.size = ONEFIVEVAL;
    attrInfo.offset = ZEROVAL;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVMemory *sample = OH_AVMemory_Create(ONEONEVAL);
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
	    O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVMuxer_SetRotation(muxer, rotation);
    int ret = OH_AVMuxer_AddTrack(nullptr, &audioTrackId, trackFormat);
    OH_AVMuxer_Start(muxer);
    OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    OH_AVMuxer_Stop(muxer);
    int returnValue = FAIL;
    if (ret == AV_ERR_INVALID_VAL) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    OH_AVMemory_Destroy(sample);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHAVMuxerDestroyAbnormal(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode desval = OH_AVMuxer_Destroy(nullptr);
    if (desval == AV_ERR_INVALID_VAL) {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHAVMuxerCreate", nullptr, OHAVMuxerCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerSetRotation", nullptr, OHAVMuxerSetRotation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerSetFormat", nullptr, OHAVMuxerSetFormat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerStart", nullptr, OHAVMuxerStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerStop", nullptr, OHAVMuxerStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerWriteSample", nullptr, OHAVMuxerWriteSample, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHAVMuxerWriteSampleBuffer", nullptr, OHAVMuxerWriteSampleBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerAddTrack", nullptr, OHAVMuxerAddTrack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerDestroy", nullptr, OHAVMuxerDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerCreateAbnormal", nullptr, OHAVMuxerCreateAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerSetRotationAbnormal", nullptr, OHAVMuxerSetRotationAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAVMuxerSetFormatAbnormal", nullptr, OHAVMuxerSetFormatAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAVMuxerStartAbnormal", nullptr, OHAVMuxerStartAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerStopAbnormal", nullptr, OHAVMuxerStopAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAVMuxerWriteSampleAbnormal", nullptr, OHAVMuxerWriteSampleAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAVMuxerAddTrackAbnormal", nullptr, OHAVMuxerAddTrackAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAVMuxerDestroyAbnormal", nullptr, OHAVMuxerDestroyAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},

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
    .nm_modname = "nativeavmuxer",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
