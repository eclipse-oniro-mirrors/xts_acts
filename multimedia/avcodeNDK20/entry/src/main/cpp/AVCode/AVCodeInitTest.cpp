/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


#include "AVCode/AVCode_Test.h"
#include "common/Common.h"
#include "napi/native_api.h"
#include <cstdint>
#include <js_native_api_types.h>
#include <napi/native_api.h>

namespace {
static const uint32_t MAX_NAME_LENGTH = 1024;
}
EXTERN_C_START

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumOHAudioChannelLayout1", EnumOHAudioChannelLayout1));
    desc.push_back(XL("EnumOHAudioChannelLayout2", EnumOHAudioChannelLayout2));
    desc.push_back(XL("EnumOHAudioChannelLayout3", EnumOHAudioChannelLayout3));
    desc.push_back(XL("EnumOHAudioChannelLayout4", EnumOHAudioChannelLayout4));
    desc.push_back(XL("EnumOHAudioChannelLayout5", EnumOHAudioChannelLayout5));
    desc.push_back(XL("EnumOHAudioChannelLayout6", EnumOHAudioChannelLayout6));
    desc.push_back(XL("EnumOHAudioChannelLayout7", EnumOHAudioChannelLayout7));
    desc.push_back(XL("EnumOHAudioChannelLayout8", EnumOHAudioChannelLayout8));
    desc.push_back(XL("EnumOHAudioChannelLayout9", EnumOHAudioChannelLayout9));
    desc.push_back(XL("EnumOHAudioChannelLayout10", EnumOHAudioChannelLayout10));
    desc.push_back(XL("EnumOHAudioChannelLayout11", EnumOHAudioChannelLayout11));
    desc.push_back(XL("EnumOHAudioChannelLayout12", EnumOHAudioChannelLayout12));
    desc.push_back(XL("EnumOHAudioChannelLayout13", EnumOHAudioChannelLayout13));
    desc.push_back(XL("EnumOHAudioChannelLayout14", EnumOHAudioChannelLayout14));
    desc.push_back(XL("EnumOHAudioChannelLayout15", EnumOHAudioChannelLayout15));
    desc.push_back(XL("EnumOHAudioChannelLayout16", EnumOHAudioChannelLayout16));
    desc.push_back(XL("EnumOHAudioChannelLayout17", EnumOHAudioChannelLayout17));
    desc.push_back(XL("EnumOHAudioChannelLayout18", EnumOHAudioChannelLayout18));
    desc.push_back(XL("EnumOHAudioChannelLayout19", EnumOHAudioChannelLayout19));
    desc.push_back(XL("EnumOHAudioChannelLayout20", EnumOHAudioChannelLayout20));
    desc.push_back(XL("EnumOHAudioChannelLayout21", EnumOHAudioChannelLayout21));
    desc.push_back(XL("EnumOHAudioChannelLayout22", EnumOHAudioChannelLayout22));
    desc.push_back(XL("EnumOHAudioChannelLayout23", EnumOHAudioChannelLayout23));
    desc.push_back(XL("EnumOHAudioChannelLayout24", EnumOHAudioChannelLayout24));
    desc.push_back(XL("EnumOHAudioChannelLayout25", EnumOHAudioChannelLayout25));
    desc.push_back(XL("EnumOHAudioChannelLayout26", EnumOHAudioChannelLayout26));
    desc.push_back(XL("EnumOHAudioChannelLayout27", EnumOHAudioChannelLayout27));
    desc.push_back(XL("EnumOHAudioChannelLayout28", EnumOHAudioChannelLayout28));
    desc.push_back(XL("EnumOHAudioChannelLayout29", EnumOHAudioChannelLayout29));
    desc.push_back(XL("EnumOHAudioChannelLayout30", EnumOHAudioChannelLayout30));
    desc.push_back(XL("EnumOHAudioChannelLayout31", EnumOHAudioChannelLayout31));
    desc.push_back(XL("EnumOHAudioChannelLayout32", EnumOHAudioChannelLayout32));
    desc.push_back(XL("EnumOHAudioChannelLayout33", EnumOHAudioChannelLayout33));
    desc.push_back(XL("EnumOHAudioChannelLayout34", EnumOHAudioChannelLayout34));
    desc.push_back(XL("EnumOHAudioChannelLayout35", EnumOHAudioChannelLayout35));
    desc.push_back(XL("EnumOHAudioChannelLayout36", EnumOHAudioChannelLayout36));
    desc.push_back(XL("EnumOHAudioChannelLayout37", EnumOHAudioChannelLayout37));
    desc.push_back(XL("EnumOHAudioChannelLayout38", EnumOHAudioChannelLayout38));
    desc.push_back(XL("EnumOHAudioChannelLayout39", EnumOHAudioChannelLayout39));
    desc.push_back(XL("EnumOHAudioChannelLayout40", EnumOHAudioChannelLayout40));
    desc.push_back(XL("EnumOHAudioChannelLayout41", EnumOHAudioChannelLayout41));
    desc.push_back(XL("EnumOHAudioChannelLayout42", EnumOHAudioChannelLayout42));
    desc.push_back(XL("EnumOHAudioChannelLayout43", EnumOHAudioChannelLayout43));
    desc.push_back(XL("EnumOHAudioChannelLayout44", EnumOHAudioChannelLayout44));
    desc.push_back(XL("EnumOHAudioChannelLayout45", EnumOHAudioChannelLayout45));
    desc.push_back(XL("EnumOHAudioChannelLayout46", EnumOHAudioChannelLayout46));
    desc.push_back(XL("EnumOHAudioChannelLayout47", EnumOHAudioChannelLayout47));
    desc.push_back(XL("EnumOHAudioChannelLayout48", EnumOHAudioChannelLayout48));
}

static void InitPush2(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumOHAudioChannelSet1", EnumOHAudioChannelSet1));
    desc.push_back(XL("EnumOHAudioChannelSet2", EnumOHAudioChannelSet2));
    desc.push_back(XL("EnumOHAudioChannelSet3", EnumOHAudioChannelSet3));
    desc.push_back(XL("EnumOHAudioChannelSet4", EnumOHAudioChannelSet4));
    desc.push_back(XL("EnumOHAudioChannelSet5", EnumOHAudioChannelSet5));
    desc.push_back(XL("EnumOHAudioChannelSet6", EnumOHAudioChannelSet6));
    desc.push_back(XL("EnumOHAudioChannelSet7", EnumOHAudioChannelSet7));
    desc.push_back(XL("EnumOHAudioChannelSet8", EnumOHAudioChannelSet8));
    desc.push_back(XL("EnumOHAudioChannelSet9", EnumOHAudioChannelSet9));
    desc.push_back(XL("EnumOHAudioChannelSet10", EnumOHAudioChannelSet10));
    desc.push_back(XL("EnumOHAudioChannelSet11", EnumOHAudioChannelSet11));
    desc.push_back(XL("EnumOHAudioChannelSet12", EnumOHAudioChannelSet12));
    desc.push_back(XL("EnumOHAudioChannelSet13", EnumOHAudioChannelSet13));
    desc.push_back(XL("EnumOHAudioChannelSet14", EnumOHAudioChannelSet14));
    desc.push_back(XL("EnumOHAudioChannelSet15", EnumOHAudioChannelSet15));
    desc.push_back(XL("EnumOHAudioChannelSet16", EnumOHAudioChannelSet16));
    desc.push_back(XL("EnumOHAudioChannelSet17", EnumOHAudioChannelSet17));
    desc.push_back(XL("EnumOHAudioChannelSet18", EnumOHAudioChannelSet18));
    desc.push_back(XL("EnumOHAudioChannelSet19", EnumOHAudioChannelSet19));
    desc.push_back(XL("EnumOHAudioChannelSet20", EnumOHAudioChannelSet20));
    desc.push_back(XL("EnumOHAudioChannelSet21", EnumOHAudioChannelSet21));
    desc.push_back(XL("EnumOHAudioChannelSet22", EnumOHAudioChannelSet22));
    desc.push_back(XL("EnumOHAudioChannelSet23", EnumOHAudioChannelSet23));
    desc.push_back(XL("EnumOHAudioChannelSet24", EnumOHAudioChannelSet24));
    desc.push_back(XL("EnumOHAudioChannelSet25", EnumOHAudioChannelSet25));
    desc.push_back(XL("EnumOHAudioChannelSet26", EnumOHAudioChannelSet26));
    desc.push_back(XL("EnumOHAudioChannelSet27", EnumOHAudioChannelSet27));
    desc.push_back(XL("EnumOHAudioChannelSet28", EnumOHAudioChannelSet28));
    desc.push_back(XL("EnumOHAudioChannelSet29", EnumOHAudioChannelSet29));
    desc.push_back(XL("EnumOHAudioChannelSet30", EnumOHAudioChannelSet30));
    desc.push_back(XL("EnumAmbAttributeSet1", EnumAmbAttributeSet1));
    desc.push_back(XL("EnumAmbAttributeSet2", EnumAmbAttributeSet2));
    desc.push_back(XL("EnumAmbAttributeSet3", EnumAmbAttributeSet3));
    desc.push_back(XL("EnumAmbAttributeSet4", EnumAmbAttributeSet4));
    desc.push_back(XL("EnumAmbAttributeSet5", EnumAmbAttributeSet5));
    desc.push_back(XL("EnumAmbAttributeSet6", EnumAmbAttributeSet6));
    desc.push_back(XL("EnumAmbAttributeSet7", EnumAmbAttributeSet7));
    desc.push_back(XL("EnumAmbAttributeSet8", EnumAmbAttributeSet8));
}

static void InitPush3(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumAudioChannelSet1", EnumAudioChannelSet1));
    desc.push_back(XL("EnumAudioChannelSet2", EnumAudioChannelSet2));
    desc.push_back(XL("EnumAudioChannelSet3", EnumAudioChannelSet3));
    desc.push_back(XL("EnumAudioChannelSet4", EnumAudioChannelSet4));
    desc.push_back(XL("EnumAudioChannelSet5", EnumAudioChannelSet5));
    desc.push_back(XL("EnumAudioChannelSet6", EnumAudioChannelSet6));
    desc.push_back(XL("EnumAudioChannelSet7", EnumAudioChannelSet7));
    desc.push_back(XL("EnumAudioChannelSet8", EnumAudioChannelSet8));
    desc.push_back(XL("EnumAudioChannelSet9", EnumAudioChannelSet9));
    desc.push_back(XL("EnumAudioChannelSet10", EnumAudioChannelSet10));
    desc.push_back(XL("EnumAudioChannelSet11", EnumAudioChannelSet11));
    desc.push_back(XL("EnumAudioChannelSet12", EnumAudioChannelSet12));
    desc.push_back(XL("EnumAudioChannelSet13", EnumAudioChannelSet13));
    desc.push_back(XL("EnumAudioChannelSet14", EnumAudioChannelSet14));
    desc.push_back(XL("EnumAudioChannelSet15", EnumAudioChannelSet15));
    desc.push_back(XL("EnumAudioChannelSet16", EnumAudioChannelSet16));
    desc.push_back(XL("EnumAudioChannelSet17", EnumAudioChannelSet17));
    desc.push_back(XL("EnumAudioChannelSet18", EnumAudioChannelSet18));
    desc.push_back(XL("EnumAudioChannelSet19", EnumAudioChannelSet19));
    desc.push_back(XL("EnumAudioChannelSet20", EnumAudioChannelSet20));
    desc.push_back(XL("EnumAudioChannelSet21", EnumAudioChannelSet21));
    desc.push_back(XL("EnumAudioChannelSet22", EnumAudioChannelSet22));
    desc.push_back(XL("EnumAudioChannelSet23", EnumAudioChannelSet23));
    desc.push_back(XL("EnumAudioChannelSet24", EnumAudioChannelSet24));
    desc.push_back(XL("EnumAudioChannelSet25", EnumAudioChannelSet25));
    desc.push_back(XL("EnumAudioChannelSet26", EnumAudioChannelSet26));
    desc.push_back(XL("EnumAudioChannelSet27", EnumAudioChannelSet27));
    desc.push_back(XL("EnumAudioChannelSet28", EnumAudioChannelSet28));
    desc.push_back(XL("EnumAudioChannelSet29", EnumAudioChannelSet29));
    desc.push_back(XL("EnumAudioChannelSet30", EnumAudioChannelSet30));
    desc.push_back(XL("EnumAudioChannelLayout1", EnumAudioChannelLayout1));
    desc.push_back(XL("EnumAudioChannelLayout2", EnumAudioChannelLayout2));
    desc.push_back(XL("EnumAudioChannelLayout3", EnumAudioChannelLayout3));
    desc.push_back(XL("EnumAudioChannelLayout4", EnumAudioChannelLayout4));
    desc.push_back(XL("EnumAudioChannelLayout5", EnumAudioChannelLayout5));
    desc.push_back(XL("EnumAudioChannelLayout6", EnumAudioChannelLayout6));
    desc.push_back(XL("EnumAudioChannelLayout7", EnumAudioChannelLayout7));
    desc.push_back(XL("EnumAudioChannelLayout8", EnumAudioChannelLayout8));
    desc.push_back(XL("EnumAudioChannelLayout9", EnumAudioChannelLayout9));
    desc.push_back(XL("EnumAudioChannelLayout10", EnumAudioChannelLayout10));
    desc.push_back(XL("EnumAudioChannelLayout11", EnumAudioChannelLayout11));
    desc.push_back(XL("EnumAudioChannelLayout12", EnumAudioChannelLayout12));
    desc.push_back(XL("EnumAudioChannelLayout13", EnumAudioChannelLayout13));
    desc.push_back(XL("EnumAudioChannelLayout14", EnumAudioChannelLayout14));
    desc.push_back(XL("EnumAudioChannelLayout15", EnumAudioChannelLayout15));
    desc.push_back(XL("EnumAudioChannelLayout16", EnumAudioChannelLayout16));
    desc.push_back(XL("EnumAudioChannelLayout17", EnumAudioChannelLayout17));
    desc.push_back(XL("EnumAudioChannelLayout18", EnumAudioChannelLayout18));
}

static void InitPush4(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumAudioChannelLayout19", EnumAudioChannelLayout19));
    desc.push_back(XL("EnumAudioChannelLayout20", EnumAudioChannelLayout20));
    desc.push_back(XL("EnumAudioChannelLayout21", EnumAudioChannelLayout21));
    desc.push_back(XL("EnumAudioChannelLayout22", EnumAudioChannelLayout22));
    desc.push_back(XL("EnumAudioChannelLayout23", EnumAudioChannelLayout23));
    desc.push_back(XL("EnumAudioChannelLayout24", EnumAudioChannelLayout24));
    desc.push_back(XL("EnumAudioChannelLayout25", EnumAudioChannelLayout25));
    desc.push_back(XL("EnumAudioChannelLayout26", EnumAudioChannelLayout26));
    desc.push_back(XL("EnumAudioChannelLayout27", EnumAudioChannelLayout27));
    desc.push_back(XL("EnumAudioChannelLayout28", EnumAudioChannelLayout28));
    desc.push_back(XL("EnumAudioChannelLayout29", EnumAudioChannelLayout29));
    desc.push_back(XL("EnumAudioChannelLayout30", EnumAudioChannelLayout30));
    desc.push_back(XL("EnumAudioChannelLayout31", EnumAudioChannelLayout31));
    desc.push_back(XL("EnumAudioChannelLayout32", EnumAudioChannelLayout32));
    desc.push_back(XL("AVCodeAVBufferDestroyErrInvalidVal", AVCodeAVBufferDestroyErrInvalidVal));
    desc.push_back(XL("AVCodeAVBufferDestroyErrOperateNotPermit", AVCodeAVBufferDestroyErrOperateNotPermit));
    desc.push_back(XL("AVCodeAVBufferGetBufferAttrErrInvalidVal", AVCodeAVBufferGetBufferAttrErrInvalidVal));
    desc.push_back(XL("AVCodeAVBufferSetBufferAttrErrInvalidVal", AVCodeAVBufferSetBufferAttrErrInvalidVal));
    desc.push_back(XL("AVCodeAVBufferSetParameterErrInvalidVal", AVCodeAVBufferSetParameterErrInvalidVal));
    desc.push_back(
        XL("AVCodeOHAVCapabilityGetAudioSupportedSampleRates", AVCodeOHAVCapabilityGetAudioSupportedSampleRates));
    desc.push_back(XL("AVCodeOHAVCapabilityGetAudioChannelCountRange", AVCodeOHAVCapabilityGetAudioChannelCountRange));
    desc.push_back(XL("AVCodeOHAudioCodecDestroyAVErrInvalidState", AVCodeOHAudioCodecDestroyAVErrInvalidState));
    desc.push_back(XL("AVCodeOHAudioCodecRegisterCallback", AVCodeOHAudioCodecRegisterCallback));
    desc.push_back(XL("AVCodeOHAudioCodecPrepareInvalidState", AVCodeOHAudioCodecPrepareInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderDestroySuccess", AVCodeOHAudioDecoderDestroySuccess));
    desc.push_back(XL("AVCodeOHAudioDecoderDestroyInvalidVal", AVCodeOHAudioDecoderDestroyInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderConfigureUnsupport", AVCodeOHAudioDecoderConfigureUnsupport));
    desc.push_back(XL("AVCodeOHAudioDecoderConfigureInvalidVal", AVCodeOHAudioDecoderConfigureInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderPrepareUnsupport", AVCodeOHAudioDecoderPrepareUnsupport));
    desc.push_back(XL("AVCodeOHAudioDecoderPrepareInvalidVal", AVCodeOHAudioDecoderPrepareInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderStartInvalidState", AVCodeOHAudioDecoderStartInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderStartInvalidVal", AVCodeOHAudioDecoderStartInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderStopInvalidState", AVCodeOHAudioDecoderStopInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderStopInvalidVal", AVCodeOHAudioDecoderStopInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderFlushInvalidVal", AVCodeOHAudioDecoderFlushInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderFlushInvalidState", AVCodeOHAudioDecoderFlushInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderResetInvalidVal", AVCodeOHAudioDecoderResetInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderSetParameterInvalidVal", AVCodeOHAudioDecoderSetParameterInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderPushInputDataInvalidVal", AVCodeOHAudioDecoderPushInputDataInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderPushInputDataInvalidState", AVCodeOHAudioDecoderPushInputDataInvalidState));
    desc.push_back(
        XL("AVCodeOHAudioDecoderPushFreeOutputDataInvalidVal", AVCodeOHAudioDecoderPushFreeOutputDataInvalidVal));
    desc.push_back(
        XL("AVCodeOHAudioDecoderPushFreeOutputDataInvalidState", AVCodeOHAudioDecoderPushFreeOutputDataInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderIsValidInvalidVal", AVCodeOHAudioDecoderIsValidInvalidVal));
}

static void InitPush5(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVCodeOHAudioEncoderDestroySuccess", AVCodeOHAudioEncoderDestroySuccess));
    desc.push_back(XL("AVCodeOHAudioEncoderDestroyInvalidVal", AVCodeOHAudioEncoderDestroyInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderConfigureUnsupport", AVCodeOHAudioEncoderConfigureUnsupport));
    desc.push_back(XL("AVCodeOHAudioEncoderConfigureInvalidVal", AVCodeOHAudioEncoderConfigureInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderPrepareUnsupport", AVCodeOHAudioEncoderPrepareUnsupport));
    desc.push_back(XL("AVCodeOHAudioEncoderPrepareInvalidVal", AVCodeOHAudioEncoderPrepareInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderStartInvalidState", AVCodeOHAudioEncoderStartInvalidState));
    desc.push_back(XL("AVCodeOHAudioEncoderStartInvalidVal", AVCodeOHAudioEncoderStartInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderStopInvalidState", AVCodeOHAudioEncoderStopInvalidState));
    desc.push_back(XL("AVCodeOHAudioEncoderStopInvalidVal", AVCodeOHAudioEncoderStopInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderFlushInvalidVal", AVCodeOHAudioEncoderFlushInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderFlushInvalidState", AVCodeOHAudioEncoderFlushInvalidState));
    desc.push_back(XL("AVCodeOHAudioEncoderResetInvalidVal", AVCodeOHAudioEncoderResetInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderSetParameterInvalidVal", AVCodeOHAudioEncoderSetParameterInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderPushInputDataInvalidVal", AVCodeOHAudioEncoderPushInputDataInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderPushInputDataInvalidState", AVCodeOHAudioEncoderPushInputDataInvalidState));
    desc.push_back(
        XL("AVCodeOHAudioEncoderPushFreeOutputDataInvalidVal", AVCodeOHAudioEncoderPushFreeOutputDataInvalidVal));
    desc.push_back(
        XL("AVCodeOHAudioEncoderPushFreeOutputDataInvalidState", AVCodeOHAudioEncoderPushFreeOutputDataInvalidState));
    desc.push_back(XL("AVCodeOHAudioEncoderIsValidInvalidVal", AVCodeOHAudioEncoderIsValidInvalidVal));
    desc.push_back(XL("AVCodeOHAudioCodecSetParameterInvalidVal", AVCodeOHAudioCodecSetParameterInvalidVal));
    desc.push_back(
        XL("AVCodeOHAudioCodecSetParameterOperateNotPermit", AVCodeOHAudioCodecSetParameterOperateNotPermit));
    desc.push_back(
        XL("AVCodeOHAudioCodecSetParameterOperateInvalidState", AVCodeOHAudioCodecSetParameterOperateInvalidState));
    desc.push_back(XL("AVCodeOHAudioCodecSetParameterOperateUnknown", AVCodeOHAudioCodecSetParameterOperateUnknown));
    desc.push_back(XL("AVCodeOHAudioCodecPushInputBufferInvalidVal", AVCodeOHAudioCodecPushInputBufferInvalidVal));
}

static void InitPush6(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumMPEGProfile1", EnumMPEGProfile1));
    desc.push_back(XL("EnumMPEGProfile2", EnumMPEGProfile2));
    desc.push_back(XL("EnumMPEGProfile3", EnumMPEGProfile3));
    desc.push_back(XL("EnumMPEGProfile4", EnumMPEGProfile4));
    desc.push_back(XL("EnumMPEGProfile5", EnumMPEGProfile5));
    desc.push_back(XL("EnumMPEGProfile6", EnumMPEGProfile6));
    desc.push_back(XL("EnumMPEGProfile7", EnumMPEGProfile7));
    desc.push_back(XL("EnumMPEGProfile8", EnumMPEGProfile8));
    desc.push_back(XL("EnumMPEGProfile9", EnumMPEGProfile9));
    desc.push_back(XL("EnumMPEGProfile10", EnumMPEGProfile10));
    desc.push_back(XL("EnumMPEGProfile11", EnumMPEGProfile11));
    desc.push_back(XL("EnumMPEGProfile12", EnumMPEGProfile12));
    desc.push_back(XL("EnumMPEGProfile13", EnumMPEGProfile13));
    desc.push_back(XL("EnumMPEGProfile14", EnumMPEGProfile14));
    desc.push_back(XL("EnumMPEGProfile15", EnumMPEGProfile15));
    desc.push_back(XL("EnumMPEGProfile16", EnumMPEGProfile16));
    desc.push_back(XL("EnumMPEGProfile17", EnumMPEGProfile17));
    desc.push_back(XL("EnumMPEGProfile18", EnumMPEGProfile18));
    desc.push_back(XL("EnumMPEGProfile19", EnumMPEGProfile19));
    desc.push_back(XL("EnumMPEGProfile20", EnumMPEGProfile20));
    desc.push_back(XL("EnumMPEGProfile21", EnumMPEGProfile21));
    desc.push_back(XL("EnumOHH263Profile1", EnumOHH263Profile1));
    desc.push_back(XL("EnumOHH263Profile2", EnumOHH263Profile2));
    desc.push_back(XL("EnumOHAVOutputFormat1", EnumOHAVOutputFormat1));
    desc.push_back(XL("EnumOHAVOutputFormat2", EnumOHAVOutputFormat2));
    desc.push_back(XL("EnumOHAVOutputFormat3", EnumOHAVOutputFormat3));
    desc.push_back(XL("EnumOHAVOutputFormat4", EnumOHAVOutputFormat4));
    desc.push_back(XL("EnumOHAVOutputFormat5", EnumOHAVOutputFormat5));
    desc.push_back(XL("EnumOHAVOutputFormat6", EnumOHAVOutputFormat6));
    desc.push_back(XL("EnumOHAVOutputFormat7", EnumOHAVOutputFormat7));
    desc.push_back(XL("EnumOHAVColorPrimary1", EnumOHAVColorPrimary1));
    desc.push_back(XL("EnumOHAVColorPrimary2", EnumOHAVColorPrimary2));
    desc.push_back(XL("EnumOHAVColorPrimary3", EnumOHAVColorPrimary3));
    desc.push_back(XL("EnumOHAVColorPrimary4", EnumOHAVColorPrimary4));
    desc.push_back(XL("EnumOHAVColorPrimary5", EnumOHAVColorPrimary5));
    desc.push_back(XL("EnumOHAVColorPrimary6", EnumOHAVColorPrimary6));
    desc.push_back(XL("EnumOHAVColorPrimary7", EnumOHAVColorPrimary7));
    desc.push_back(XL("EnumOHAVColorPrimary8", EnumOHAVColorPrimary8));
}

static void InitPush7(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumAudioChannelSet30", EnumAudioChannelSet30));
    desc.push_back(XL("EnumAudioChannelSet31", EnumAudioChannelSet31));
    desc.push_back(XL("EnumAudioChannelSet32", EnumAudioChannelSet32));
    desc.push_back(XL("EnumAudioChannelSet33", EnumAudioChannelSet33));
    desc.push_back(XL("EnumAudioChannelSet34", EnumAudioChannelSet34));
    desc.push_back(XL("EnumAudioChannelSet35", EnumAudioChannelSet35));
    desc.push_back(XL("EnumAudioChannelSet36", EnumAudioChannelSet36));
    desc.push_back(XL("EnumAudioChannelSet37", EnumAudioChannelSet37));
    desc.push_back(XL("EnumAudioChannelSet38", EnumAudioChannelSet38));
    desc.push_back(XL("EnumAudioChannelSet39", EnumAudioChannelSet39));
    desc.push_back(XL("EnumAudioChannelSet40", EnumAudioChannelSet40));
    desc.push_back(XL("EnumAudioChannelSet41", EnumAudioChannelSet41));
    desc.push_back(XL("EnumAudioChannelSet42", EnumAudioChannelSet42));
    desc.push_back(XL("EnumAudioChannelSet43", EnumAudioChannelSet43));
    desc.push_back(XL("EnumAudioChannelSet44", EnumAudioChannelSet44));
    desc.push_back(XL("EnumAudioChannelSet45", EnumAudioChannelSet45));
    desc.push_back(XL("EnumAudioChannelSet46", EnumAudioChannelSet46));
    desc.push_back(XL("EnumAudioChannelSet47", EnumAudioChannelSet47));
    desc.push_back(XL("EnumAudioChannelSet48", EnumAudioChannelSet48));
    desc.push_back(XL("EnumAudioChannelSet49", EnumAudioChannelSet49));
    desc.push_back(XL("EnumAudioChannelSet50", EnumAudioChannelSet50));
    desc.push_back(XL("EnumOHTransferCharacteristic1", EnumOHTransferCharacteristic1));
    desc.push_back(XL("EnumOHTransferCharacteristic2", EnumOHTransferCharacteristic2));
    desc.push_back(XL("EnumOHTransferCharacteristic3", EnumOHTransferCharacteristic3));
    desc.push_back(XL("EnumOHTransferCharacteristic4", EnumOHTransferCharacteristic4));
    desc.push_back(XL("EnumOHTransferCharacteristic5", EnumOHTransferCharacteristic5));
    desc.push_back(XL("EnumOHTransferCharacteristic6", EnumOHTransferCharacteristic6));
    desc.push_back(XL("EnumOHTransferCharacteristic7", EnumOHTransferCharacteristic7));
    desc.push_back(XL("EnumOHTransferCharacteristic8", EnumOHTransferCharacteristic8));
    desc.push_back(XL("EnumOHTransferCharacteristic9", EnumOHTransferCharacteristic9));
    desc.push_back(XL("EnumOHTransferCharacteristic10", EnumOHTransferCharacteristic10));
    desc.push_back(XL("EnumOHTransferCharacteristic11", EnumOHTransferCharacteristic11));
    desc.push_back(XL("EnumOHTransferCharacteristic12", EnumOHTransferCharacteristic12));
    desc.push_back(XL("EnumOHTransferCharacteristic13", EnumOHTransferCharacteristic13));
    desc.push_back(XL("AVCodeOHAudioDecoderSetCallbackInvalidVal", AVCodeOHAudioDecoderSetCallbackInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderSetCallbackInvalidVal", AVCodeOHAudioEncoderSetCallbackInvalidVal));
    desc.push_back(XL("AVCodeOHAVDataSource", AVCodeOHAVDataSource));
}

static void InitPush8(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumOHMatrixCoefficient1", EnumOHMatrixCoefficient1));
    desc.push_back(XL("EnumOHMatrixCoefficient2", EnumOHMatrixCoefficient2));
    desc.push_back(XL("EnumOHMatrixCoefficient3", EnumOHMatrixCoefficient3));
    desc.push_back(XL("EnumOHMatrixCoefficient4", EnumOHMatrixCoefficient4));
    desc.push_back(XL("EnumOHMatrixCoefficient5", EnumOHMatrixCoefficient5));
    desc.push_back(XL("EnumOHMatrixCoefficient6", EnumOHMatrixCoefficient6));
    desc.push_back(XL("EnumOHMatrixCoefficient7", EnumOHMatrixCoefficient7));
    desc.push_back(XL("EnumOHMatrixCoefficient8", EnumOHMatrixCoefficient8));
    desc.push_back(XL("EnumOHMatrixCoefficient9", EnumOHMatrixCoefficient9));
    desc.push_back(XL("EnumOHMatrixCoefficient10", EnumOHMatrixCoefficient10));
    desc.push_back(XL("EnumOHBitsPerSample1", EnumOHBitsPerSample1));
    desc.push_back(XL("EnumOHBitsPerSample2", EnumOHBitsPerSample2));
    desc.push_back(XL("EnumOHBitsPerSample3", EnumOHBitsPerSample3));
    desc.push_back(XL("EnumOHBitsPerSample4", EnumOHBitsPerSample4));
    desc.push_back(XL("EnumOHBitsPerSample5", EnumOHBitsPerSample5));
    desc.push_back(XL("EnumOHBitsPerSample6", EnumOHBitsPerSample6));
    desc.push_back(XL("EnumOHBitsPerSample7", EnumOHBitsPerSample7));
    desc.push_back(XL("EnumOHCoreHdrType1", EnumOHCoreHdrType1));
    desc.push_back(XL("EnumOHCoreHdrType2", EnumOHCoreHdrType2));
    desc.push_back(XL("EnumAACPROFILEHE", EnumAACPROFILEHE));
    desc.push_back(XL("EnumAACPROFILEHE1", EnumAACPROFILEHE1));
    desc.push_back(XL("EnumHEVCProfile1", EnumHEVCProfile1));
    desc.push_back(XL("EnumHEVCProfile2", EnumHEVCProfile2));
    desc.push_back(XL("EnumVVCProfile1", EnumVVCProfile1));
    desc.push_back(XL("EnumVVCProfile2", EnumVVCProfile2));
    desc.push_back(XL("EnumVVCProfile3", EnumVVCProfile3));
    desc.push_back(XL("EnumVVCProfile4", EnumVVCProfile4));
    desc.push_back(XL("EnumVVCProfile5", EnumVVCProfile5));
    desc.push_back(XL("EnumVVCProfile6", EnumVVCProfile6));
    desc.push_back(XL("EnumVVCProfile7", EnumVVCProfile7));
    desc.push_back(XL("EnumVVCProfile8", EnumVVCProfile8));
    desc.push_back(XL("EnumVVCProfile9", EnumVVCProfile9));
    desc.push_back(XL("EnumVVCProfile10", EnumVVCProfile10));
    desc.push_back(XL("EnumVVCProfile11", EnumVVCProfile11));
    desc.push_back(XL("EnumVVCProfile12", EnumVVCProfile12));
    desc.push_back(XL("EnumVVCProfile13", EnumVVCProfile13));
    desc.push_back(XL("EnumVVCProfile14", EnumVVCProfile14));
    desc.push_back(XL("EnumVVCProfile15", EnumVVCProfile15));
    desc.push_back(XL("EnumOHScalingMode1", EnumOHScalingMode1));
    desc.push_back(XL("EnumOHScalingMode2", EnumOHScalingMode2));
}


static void InitPushAVCLevel(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("OH_AVCLevelTest1", OH_AVCLevelTest1));
    desc.push_back(XL("OH_AVCLevelTest2", OH_AVCLevelTest2));
    desc.push_back(XL("OH_AVCLevelTest3", OH_AVCLevelTest3));
    desc.push_back(XL("OH_AVCLevelTest4", OH_AVCLevelTest4));
    desc.push_back(XL("OH_AVCLevelTest5", OH_AVCLevelTest5));
    desc.push_back(XL("OH_AVCLevelTest6", OH_AVCLevelTest6));
    desc.push_back(XL("OH_AVCLevelTest7", OH_AVCLevelTest7));
    desc.push_back(XL("OH_AVCLevelTest8", OH_AVCLevelTest8));
    desc.push_back(XL("OH_AVCLevelTest9", OH_AVCLevelTest9));
    desc.push_back(XL("OH_AVCLevelTest10", OH_AVCLevelTest10));
    desc.push_back(XL("OH_AVCLevelTest11", OH_AVCLevelTest11));
    desc.push_back(XL("OH_AVCLevelTest12", OH_AVCLevelTest12));
    desc.push_back(XL("OH_AVCLevelTest13", OH_AVCLevelTest13));
    desc.push_back(XL("OH_AVCLevelTest14", OH_AVCLevelTest14));
    desc.push_back(XL("OH_AVCLevelTest15", OH_AVCLevelTest15));
    desc.push_back(XL("OH_AVCLevelTest16", OH_AVCLevelTest16));
    desc.push_back(XL("OH_AVCLevelTest17", OH_AVCLevelTest17));
    desc.push_back(XL("OH_AVCLevelTest18", OH_AVCLevelTest18));
    desc.push_back(XL("OH_AVCLevelTest19", OH_AVCLevelTest19));
    desc.push_back(XL("OH_AVCLevelTest20", OH_AVCLevelTest20));
    desc.push_back(XL("OH_HEVCLevelTest1", OH_HEVCLevelTest1));
    desc.push_back(XL("OH_HEVCLevelTest2", OH_HEVCLevelTest2));
    desc.push_back(XL("OH_HEVCLevelTest3", OH_HEVCLevelTest3));
    desc.push_back(XL("OH_HEVCLevelTest4", OH_HEVCLevelTest4));
    desc.push_back(XL("OH_HEVCLevelTest5", OH_HEVCLevelTest5));
    desc.push_back(XL("OH_HEVCLevelTest6", OH_HEVCLevelTest6));
    desc.push_back(XL("OH_HEVCLevelTest7", OH_HEVCLevelTest7));
    desc.push_back(XL("OH_HEVCLevelTest8", OH_HEVCLevelTest8));
    desc.push_back(XL("OH_HEVCLevelTest9", OH_HEVCLevelTest9));
    desc.push_back(XL("OH_HEVCLevelTest10", OH_HEVCLevelTest10));
    desc.push_back(XL("OH_HEVCLevelTest11", OH_HEVCLevelTest11));
    desc.push_back(XL("OH_HEVCLevelTest12", OH_HEVCLevelTest12));
    desc.push_back(XL("OH_HEVCLevelTest13", OH_HEVCLevelTest13));
}

static void InitPushOH_VVCLevelTest(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("OH_VVCLevelTest1", OH_VVCLevelTest1));
    desc.push_back(XL("OH_VVCLevelTest2", OH_VVCLevelTest2));
    desc.push_back(XL("OH_VVCLevelTest3", OH_VVCLevelTest3));
    desc.push_back(XL("OH_VVCLevelTest4", OH_VVCLevelTest4));
    desc.push_back(XL("OH_VVCLevelTest5", OH_VVCLevelTest5));
    desc.push_back(XL("OH_VVCLevelTest6", OH_VVCLevelTest6));
    desc.push_back(XL("OH_VVCLevelTest7", OH_VVCLevelTest7));
    desc.push_back(XL("OH_VVCLevelTest8", OH_VVCLevelTest8));
    desc.push_back(XL("OH_VVCLevelTest9", OH_VVCLevelTest9));
    desc.push_back(XL("OH_VVCLevelTest10", OH_VVCLevelTest10));
    desc.push_back(XL("OH_VVCLevelTest11", OH_VVCLevelTest11));
    desc.push_back(XL("OH_VVCLevelTest12", OH_VVCLevelTest12));
    desc.push_back(XL("OH_VVCLevelTest13", OH_VVCLevelTest13));
    desc.push_back(XL("OH_VVCLevelTest14", OH_VVCLevelTest14));
    desc.push_back(XL("OH_VVCLevelTest15", OH_VVCLevelTest15));
}

static void InitPushOH_MPEG4LevelTest(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("OH_MPEG4Level1", OH_MPEG4Level1));
    desc.push_back(XL("OH_MPEG4Level2", OH_MPEG4Level2));
    desc.push_back(XL("OH_MPEG4Level3", OH_MPEG4Level3));
    desc.push_back(XL("OH_MPEG4Level4", OH_MPEG4Level4));
    desc.push_back(XL("OH_MPEG4Level5", OH_MPEG4Level5));
    desc.push_back(XL("OH_MPEG4Level6", OH_MPEG4Level6));
    desc.push_back(XL("OH_MPEG4Level7", OH_MPEG4Level7));
    desc.push_back(XL("OH_MPEG4Level8", OH_MPEG4Level8));
    desc.push_back(XL("OH_MPEG4Level9", OH_MPEG4Level9));
    desc.push_back(XL("OH_MPEG4Level10", OH_MPEG4Level10));
}

static void InitPushOH_VideoDecoderFunctionTest(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("OH_VideoDecoder_DestroyTest", OH_VideoDecoder_DestroyTest));
    desc.push_back(XL("OH_VideoDecoder_SetCallbackTest", OH_VideoDecoder_SetCallbackTest));
    desc.push_back(XL("OH_VideoDecoder_RegisterCallbackTest", OH_VideoDecoder_RegisterCallbackTest));
    desc.push_back(XL("OH_VideoDecoder_SetSurfaceTest", OH_VideoDecoder_SetSurfaceTest));
    desc.push_back(XL("OH_VideoDecoder_StartTest", OH_VideoDecoder_StartTest));
    desc.push_back(XL("OH_VideoDecoder_StopTest", OH_VideoDecoder_StopTest));
    desc.push_back(XL("OH_VideoDecoder_FlushTest", OH_VideoDecoder_FlushTest));
    desc.push_back(XL("OH_VideoDecoder_ResetTest", OH_VideoDecoder_ResetTest));
    desc.push_back(XL("OH_VideoDecoder_SetParameterTest", OH_VideoDecoder_SetParameterTest));
    desc.push_back(XL("OH_VideoDecoder_PushInputDataTest", OH_VideoDecoder_PushInputDataTest));
    desc.push_back(XL("OH_VideoDecoder_RenderOutputDataTest", OH_VideoDecoder_RenderOutputDataTest));
    desc.push_back(XL("OH_VideoDecoder_FreeOutputDataTest", OH_VideoDecoder_FreeOutputDataTest));
    desc.push_back(XL("OH_VideoDecoder_PushInputBufferTest", OH_VideoDecoder_PushInputBufferTest));
    desc.push_back(XL("OH_VideoDecoder_RenderOutputBufferTest", OH_VideoDecoder_RenderOutputBufferTest));
    desc.push_back(XL("OH_VideoDecoder_RenderOutputBufferAtTimeTest", OH_VideoDecoder_RenderOutputBufferAtTimeTest));
    desc.push_back(XL("OH_VideoDecoder_FreeOutputBufferTest", OH_VideoDecoder_FreeOutputBufferTest));
    desc.push_back(XL("OH_VideoDecoder_QueryInputBufferTest", OH_VideoDecoder_QueryInputBufferTest));
    desc.push_back(XL("OH_VideoDecoder_QueryOutputBufferTest", OH_VideoDecoder_QueryOutputBufferTest));
    desc.push_back(XL("OH_VideoDecoder_SetDecryptionConfigTest", OH_VideoDecoder_SetDecryptionConfigTest));
}

static void InitPushOH_VideoEncoderFunctionTest(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("OH_VideoEncoder_SetCallbackTest", OH_VideoEncoder_SetCallbackTest));
    desc.push_back(XL("OH_VideoEncoder_RegisterCallbackTest", OH_VideoEncoder_RegisterCallbackTest));
    desc.push_back(XL("OH_VideoEncoder_RegisterParameterCallbackTest", OH_VideoEncoder_RegisterParameterCallbackTest));
    desc.push_back(XL("OH_VideoEncoder_PrepareTest", OH_VideoEncoder_PrepareTest));
    desc.push_back(XL("OH_VideoEncoder_SetParameterTest", OH_VideoEncoder_SetParameterTest));
    desc.push_back(XL("OH_VideoEncoder_PushInputDataTest", OH_VideoEncoder_PushInputDataTest));
    desc.push_back(XL("OH_VideoEncoder_PushInputBufferTest", OH_VideoEncoder_PushInputBufferTest));
    desc.push_back(XL("OH_VideoEncoder_PushInputParameterTest", OH_VideoEncoder_PushInputParameterTest));
    desc.push_back(XL("OH_VideoEncoder_FreeOutputBufferTest", OH_VideoEncoder_FreeOutputBufferTest));
    desc.push_back(XL("OH_VideoEncoder_QueryInputBufferTest", OH_VideoEncoder_QueryInputBufferTest));
    desc.push_back(XL("OH_VideoEncoder_QueryOutputBufferTest", OH_VideoEncoder_QueryOutputBufferTest));
    desc.push_back(XL("OH_VideoEncoder_IsValidTest", OH_VideoEncoder_IsValidTest));
}

static void InitPushOH_AVDemuxeFunctionTest(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("OH_AVDemuxer_DestroyTest", OH_AVDemuxer_DestroyTest));
    desc.push_back(XL("OH_AVDemuxer_SelectTrackByIDTest", OH_AVDemuxer_SelectTrackByIDTest));
    desc.push_back(XL("OH_AVDemuxer_UnselectTrackByIDTest", OH_AVDemuxer_UnselectTrackByIDTest));
    desc.push_back(XL("OH_AVDemuxer_ReadSampleTest", OH_AVDemuxer_ReadSampleTest));
    desc.push_back(XL("OH_AVDemuxer_ReadSampleBufferTest", OH_AVDemuxer_ReadSampleBufferTest));
    desc.push_back(XL("OH_AVDemuxer_SeekToTimeTest", OH_AVDemuxer_SeekToTimeTest));
    desc.push_back(XL("OH_AVDemuxer_SetMediaKeySystemInfoCallbackTest",
                      OH_AVDemuxer_SetMediaKeySystemInfoCallbackTest));
    desc.push_back(XL("OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallbackTest",
                      OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallbackTest));
    desc.push_back(XL("OH_AVDemuxer_GetMediaKeySystemInfoTest", OH_AVDemuxer_GetMediaKeySystemInfoTest));
    desc.push_back(XL("OH_AVMuxer_WriteSampleBufferTest", OH_AVMuxer_WriteSampleBufferTest));
    desc.push_back(XL("OH_AVSource_DestroyTest", OH_AVSource_DestroyTest));
    desc.push_back(XL("OH_AVCencInfo_DestroyTest", OH_AVCencInfo_DestroyTest));
    desc.push_back(XL("OH_AVCencInfo_SetAlgorithmTest", OH_AVCencInfo_SetAlgorithmTest));
    desc.push_back(XL("OH_AVCencInfo_SetKeyIdAndIvTest", OH_AVCencInfo_SetKeyIdAndIvTest));
    desc.push_back(XL("OH_AVCencInfo_SetSubsampleInfoTest", OH_AVCencInfo_SetSubsampleInfoTest));
    desc.push_back(XL("OH_AVCencInfo_SetModeTest", OH_AVCencInfo_SetModeTest));
    desc.push_back(XL("OH_AVCencInfo_SetAVBufferTest", OH_AVCencInfo_SetAVBufferTest));
    desc.push_back(XL("OH_AVDemuxer_ReadSampleBufferTestNotPermit", OH_AVDemuxer_ReadSampleBufferTestNotPermit));
    desc.push_back(XL("OH_AVDemuxer_SeekToTimeTestNotPermit", OH_AVDemuxer_SeekToTimeTestNotPermit));
    desc.push_back(XL("OH_AVMuxer_SetRotationNotPermit", OH_AVMuxer_SetRotationNotPermit));
    desc.push_back(XL("OH_AVMuxer_SetFormatNotPermit", OH_AVMuxer_SetFormatNotPermit));
    desc.push_back(XL("OH_AVMuxer_AddTrackNotPermit", OH_AVMuxer_AddTrackNotPermit));
    desc.push_back(XL("OH_AVMuxer_StartNotPermit", OH_AVMuxer_StartNotPermit));
    desc.push_back(XL("OH_AVMuxer_WriteSampleNotPermit", OH_AVMuxer_WriteSampleNotPermit));
    desc.push_back(XL("OH_AVMuxer_WriteSampleBufferNotPermit", OH_AVMuxer_WriteSampleBufferNotPermit));
    desc.push_back(XL("OH_AVMuxer_StopNotPermit", OH_AVMuxer_StopNotPermit));
    desc.push_back(XL("WriteMp4File", WriteMp4File));
}

static void InitPushOH_AVErrCodeTest(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("OH_AVErrCodeTest1", OH_AVErrCodeTest1));
    desc.push_back(XL("OH_AVErrCodeTest2", OH_AVErrCodeTest2));
    desc.push_back(XL("OH_AVErrCodeTest3", OH_AVErrCodeTest3));
    desc.push_back(XL("OH_AVErrCodeTest4", OH_AVErrCodeTest4));
    desc.push_back(XL("OH_AVErrCodeTest5", OH_AVErrCodeTest5));
    desc.push_back(XL("OH_AVErrCodeTest6", OH_AVErrCodeTest6));
    desc.push_back(XL("OH_AVErrCodeTest7", OH_AVErrCodeTest7));
    desc.push_back(XL("OH_AVErrCodeTest8", OH_AVErrCodeTest8));
    desc.push_back(XL("OH_AVErrCodeTest9", OH_AVErrCodeTest9));
    desc.push_back(XL("OH_AVErrCodeTest10", OH_AVErrCodeTest10));
    desc.push_back(XL("OH_AVErrCodeTest12", OH_AVErrCodeTest12));
    desc.push_back(XL("OH_AVErrCodeTest13", OH_AVErrCodeTest13));
    desc.push_back(XL("OH_AVErrCodeTest14", OH_AVErrCodeTest14));
    desc.push_back(XL("OH_AVErrCodeTest15", OH_AVErrCodeTest15));
    desc.push_back(XL("OH_AVErrCodeTest16", OH_AVErrCodeTest16));
    desc.push_back(XL("OH_AVErrCodeTest17", OH_AVErrCodeTest17));
    desc.push_back(XL("OH_AVErrCodeTest18", OH_AVErrCodeTest18));
    desc.push_back(XL("OH_AVFormat_SetIntValueTest", OH_AVFormat_SetIntValueTest));
    desc.push_back(XL("VideoEncoder_QueryOutputBuffer", VideoEncoder_QueryOutputBuffer));
    desc.push_back(XL("VideoEncoder_QueryInputBuffer", VideoEncoder_QueryInputBuffer));
    desc.push_back(XL("VideoDecoder_AVDecodeSync", VideoDecoder_AVDecodeSync));
}

static void InitPushOH_VideoEncoderFunction2Test(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncoder_FreeOutputBuffer", VideoEncoder_FreeOutputBuffer_Test));
    desc.push_back(XL("VideoEncoder_RegisterParameterCallback", VideoEncoder_RegisterParameterCallback_Test));
    desc.push_back(XL("VideoEncoder_SetParameter", VideoEncoder_SetParameter_Test));
    desc.push_back(XL("VideoEncoder_NotifyEndOfStream", VideoEncoder_NotifyEndOfStream_Test));
    desc.push_back(XL("VideoEncoder_PushInputData", VideoEncoder_PushInputData_Test));
    desc.push_back(XL("VideoEncoder_PushInputBuffer", VideoEncoder_PushInputBuffer_Test));
    desc.push_back(XL("VideoEncoder_PushInputParameter", VideoEncoder_PushInputParameter_Test));
    desc.push_back(XL("VideoEncoder_QueryInputBuffer1", VideoEncoder_QueryInputBuffer_Test));
    desc.push_back(XL("VideoEncoder_QueryInputBuffer2", VideoEncoder_QueryInputBuffer_Test2));
    desc.push_back(XL("VideoEncoder_QueryInputBuffer3", VideoEncoder_QueryInputBuffer_Test3));
    desc.push_back(XL("VideoEncoder_QueryOutputBuffer1", VideoEncoder_QueryOutputBuffer_Test));
    desc.push_back(XL("VideoEncoder_QueryOutputBuffer2", VideoEncoder_QueryOutputBuffer_Test2));
    desc.push_back(XL("VideoEncoder_QueryOutputBuffer3", VideoEncoder_QueryOutputBuffer_Test3));
    desc.push_back(XL("VideoDecoder_SetSurface", VideoDecoder_SetSurface_Test));
    desc.push_back(XL("VideoDecoder_SetParameter", VideoDecoder_SetParameter_Test));
    desc.push_back(XL("VideoDecoder_PushInputData", VideoDecoder_PushInputData_Test));
    desc.push_back(XL("VideoDecoder_RenderOutputData", VideoDecoder_RenderOutputData_Test));
    desc.push_back(XL("VideoDecoder_FreeOutputData", VideoDecoder_FreeOutputData_Test));
    desc.push_back(XL("VideoDecoder_PushInputBuffer", VideoDecoder_PushInputBuffer_Test));
    desc.push_back(XL("VideoDecoder_RenderOutputBuffer", VideoDecoder_RenderOutputBuffer_Test));
    desc.push_back(XL("VideoDecoder_RenderOutputBufferAtTime", VideoDecoder_RenderOutputBufferAtTime_Test));
    desc.push_back(XL("VideoDecoder_FreeOutputBuffer", VideoDecoder_FreeOutputBuffer_Test));
    desc.push_back(XL("VideoDecoder_QueryInputBuffer", VideoDecoder_QueryInputBuffer_Test));
    desc.push_back(XL("VideoDecoder_QueryInputBuffer2", VideoDecoder_QueryInputBuffer_Test2));
    desc.push_back(XL("VideoDecoder_QueryInputBuffer3", VideoDecoder_QueryInputBuffer_Test3));
    desc.push_back(XL("VideoDecoder_QueryOutputBuffer1", VideoDecoder_QueryOutputBuffer_Test));
    desc.push_back(XL("VideoDecoder_QueryOutputBuffer2", VideoDecoder_QueryOutputBuffer_Test2));
    desc.push_back(XL("VideoDecoder_QueryOutputBuffer3", VideoDecoder_QueryOutputBuffer_Test3));
    desc.push_back(XL("VideoDecoder_Configure", VideoDecoder_Configure_Test));
    desc.push_back(XL("VideoDecoder_Prepare", VideoDecoder_Prepare_Test));
    desc.push_back(XL("VideoDecoder_Start", VideoDecoder_Start_Test));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    InitPush4(desc);
    InitPush5(desc);
    InitPush6(desc);
    InitPush7(desc);
    InitPush8(desc);
    InitPushAVCLevel(desc);
    InitPushOH_VVCLevelTest(desc);
    InitPushOH_MPEG4LevelTest(desc);
    InitPushOH_VideoDecoderFunctionTest(desc);
    InitPushOH_VideoEncoderFunctionTest(desc);
    InitPushOH_AVDemuxeFunctionTest(desc);
    InitPushOH_AVErrCodeTest(desc);
    InitPushOH_VideoEncoderFunction2Test(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "avcode",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
