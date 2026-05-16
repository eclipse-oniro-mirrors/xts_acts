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
#include "include/FuncTest.h"
#include "include/VideodecApi11Sample.h"
#include <iostream>
#include <string>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include <hilog/log.h>

using namespace std;
using namespace OHOS;
using namespace Media;

OH_AVCapability* g_capHevc = nullptr;
std::string g_codecNameHevc = "";

namespace {
const string DEFAULT_TAG = "ActsHevcswDecoderTest";
constexpr size_t FORMAT_PUBLIC_RESERVED = 25;
constexpr size_t PRINTF_BUFFER_SIZE = 1024;
constexpr int ERROR_CODE_NEGATIVE_ONE = -1;
constexpr int ERROR_CODE_NEGATIVE_TWO = -2;
constexpr int SUCCESS_CODE = 0;
constexpr int32_t DEFAULT_WIDTH = 1920;
constexpr int32_t DEFAULT_HEIGHT = 1080;
constexpr int32_t DEFAULT_FRAME_RATE = 30;
constexpr int32_t ONE = 1;
constexpr int32_t TWO = 2;
constexpr int32_t THREE = 3;
constexpr double RATION = 0.5;
constexpr double RATION1 = 0.01;

}

const char* const OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30 =
    "/data/storage/el2/base/files/1920_1080_30.h265";

void HevcSwdecFuncNdkTest::SetUpTestCase()
{
    g_capHevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, SOFTWARE);
    g_codecNameHevc = OH_AVCapability_GetName(g_capHevc);
    cout << "g_codecNameHevc: " << g_codecNameHevc << endl;
}

void HevcSwdecFuncNdkTest::TearDownTestCase() {}
void HevcSwdecFuncNdkTest::SetUp() {}
void HevcSwdecFuncNdkTest::TearDown() {}

void ConvertToPublic(const char* fmt, char* out, size_t outSize)
{
    const char* p = fmt;
    char* q = out;

    while (*p && static_cast<size_t>(q - out) < outSize - FORMAT_PUBLIC_RESERVED) {
        // 格式起点：% 但不是 %{public}
        if (*p == '%' && *(p + 1) != '{') {
            p++; // 跳过%
            // 写入 %{public}
            SafeMemcpy(q, outSize - (q - out), "%{public}", outSize - (q - out) - 1);
            q += strlen("%{public}");
            // 拷贝所有格式修饰符（如 03、-20、.2、ll、h 等）
            while (*p && strchr("0123456789.+-hlLjzt", *p)) {
                *q++ = *p++;
            }
            // 最终的类型符号（s d f p x c g u l 等等）
            if (*p) {
                *q++ = *p++;
            }

            continue;
        }
        // 普通字符
        *q++ = *p++;
    }

    *q = '\0';
}

void OHPrintf(const char* fmt, ...)
{
    char fmtPublic[PRINTF_BUFFER_SIZE];
    ConvertToPublic(fmt, fmtPublic, sizeof(fmtPublic));

    va_list args;
    va_start(args, fmt);
    OH_LOG_VPrint(LOG_APP, LOG_DEBUG, LOG_DOMAIN, DEFAULT_TAG.c_str(), fmtPublic, args);
    va_end(args);
}

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len)
{
    if (!dst || !src) {
        return ERROR_CODE_NEGATIVE_ONE;
    }
    if (len == 0) {
        return SUCCESS_CODE; // 空操作直接返回成功
    }
    if (len > dstSize) {
        return ERROR_CODE_NEGATIVE_TWO;
    }
    // 处理重叠情况的安全复制
    unsigned char* dstPtr = (unsigned char*)dst;
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    if (dstPtr == srcPtr) {
        return SUCCESS_CODE; // 源和目标相同，无需复制
    }
    // 判断是否有重叠以及重叠类型
    if (dstPtr < srcPtr) {
        // 正向复制：目标在源前面，或者不重叠
        for (size_t i = 0; i < len; ++i) {
            dstPtr[i] = srcPtr[i];
        }
    } else if (dstPtr > srcPtr) {
        // 反向复制：目标在源后面，有重叠
        for (size_t i = len; i > 0; --i) {
            dstPtr[i - 1] = srcPtr[i - 1];
        }
    }
    return SUCCESS_CODE;
}

int VideoDecodeSyncSs265Func0010Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        shared_ptr<VDecAPI11Sample> vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enbleSyncMode = 1;
        if (vDecSample->CreateVideoDecoder(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
            return -1;
        };
        if (vDecSample->StartVideoDecoder() != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoDecodeSyncSs265Func0020Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        shared_ptr<VDecAPI11Sample> vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;
        vDecSample->enbleSyncMode = 1;
        if (vDecSample->CreateVideoDecoder(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
            return -1;
        }
        if (vDecSample->StartVideoDecoder() != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

 int VideoSwdecH265BlankFrame0010Test()
 {
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->enbleBlankFrame = 1;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0010Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->retentionModeSet = true;
        vDecSample->decoderSpeedSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultRetentionMode = OH_FRAME_RETENTION_MODE_FULL;
        vDecSample->defaultDecoderSpeed = ONE;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0020Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->retentionModeSet = true;
        vDecSample->decoderSpeedSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultRetentionMode = OH_FRAME_RETENTION_MODE_FULL;
        vDecSample->defaultDecoderSpeed = RATION;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0030Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->retentionModeSet = true;
        vDecSample->decoderSpeedSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultRetentionMode = OH_FRAME_RETENTION_MODE_ADAPTIVE;
        vDecSample->defaultDecoderSpeed = THREE;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0040Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->retentionModeSet = true;
        vDecSample->decoderSpeedSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultRetentionMode = OH_FRAME_RETENTION_MODE_ADAPTIVE;
        vDecSample->defaultDecoderSpeed = ONE;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0050Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->retentionModeSet = true;
        vDecSample->decoderSpeedSet = true;
        vDecSample->retentionRatioSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultRetentionMode = OH_FRAME_RETENTION_MODE_FULL;
        vDecSample->defaultDecoderSpeed = ONE;
        vDecSample->defaultRetentionRadio = RATION;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0060Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->retentionModeSet = true;
        vDecSample->decoderSpeedSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultRetentionMode = OH_FRAME_RETENTION_MODE_UNIFORM;
        vDecSample->defaultDecoderSpeed = THREE;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0070Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->retentionModeSet = true;
        vDecSample->decoderSpeedSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultRetentionMode = OH_FRAME_RETENTION_MODE_UNIFORM;
        vDecSample->defaultDecoderSpeed = ONE;
        vDecSample->defaultRetentionRadio = RATION1;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0080Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->decoderSpeedSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultDecoderSpeed = TWO;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}

int VideoSwdecH265Speed0090Test()
{
    HevcSwdecFuncNdkTest::SetUpTestCase();
    if (g_capHevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = OHOS::Media::HevcSwdecFuncNdkTest::INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->decoderSpeedSet = true;
        vDecSample->retentionRatioSet = true;
        vDecSample->enableHash = false;
        vDecSample->defaultDecoderSpeed = TWO;
        vDecSample->defaultRetentionRadio = RATION;
        if (vDecSample->RunVideoDec(g_codecNameHevc) != AV_ERR_OK) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount != AV_ERR_OK) {
            return -1;
        }
        return 0;
    }
    return 0;
}