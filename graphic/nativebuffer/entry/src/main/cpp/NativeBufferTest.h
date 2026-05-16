/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef NATIVEBUFFER_NATIVEBUFFER_H
#define NATIVEBUFFER_NATIVEBUFFER_H

#include "napi/native_api.h"
#include <native_buffer/native_buffer.h>
#include <native_buffer/graphic_error_code.h>
#include <common/log_common.h>
#include <common/native_common.h>

#define FAIL (-1)
#define NUMBER_MINUS_1 (-1)
#define NUMBER_0 0
#define NUMBER_1 1
#define NUMBER_2 2
#define NUMBER_3 3
#define NUMBER_4 4
#define NUMBER_5 5
#define NUMBER_6 6
#define NUMBER_7 7
#define NUMBER_8 8
#define NUMBER_9 9
#define NUMBER_10 10
#define NUMBER_11 11
#define NUMBER_12 12
#define NUMBER_13 13
#define NUMBER_14 14
#define NUMBER_15 15
#define NUMBER_16 16
#define NUMBER_17 17
#define NUMBER_18 18
#define NUMBER_19 19
#define NUMBER_20 20
#define NUMBER_32 32
#define NUMBER_50 50
#define NUMBER_60 60
#define NUMBER_100 100
#define NUMBER_200 200
#define NUMBER_256 256
#define NUMBER_500 500
#define NUMBER_1000 1000
#define NUMBER_1001 1001
#define NUMBER_1002 1002
#define NUMBER_2001 2001
#define NUMBER_2002 2002
#define NUMBER_2999 2999
#define NUMBER_3000 3000
#define NUMBER_3001 3001
#define NUMBER_3002 3002
#define NUMBER_3003 3003
#define NUMBER_4001 4001
#define NUMBER_4002 4002
#define NUMBER_4003 4003
#define NUMBER_5000 5000
#define NUMBER_5001 5001
#define NUMBER_5002 5002
#define NUMBER_5003 5003
#define NUMBER_6001 6001
#define NUMBER_6002 6002
#define NUMBER_6003 6003
#define NUMBER_7001 7001
#define NUMBER_7002 7002
#define NUMBER_8001 8001
#define NUMBER_8002 8002
#define NUMBER_8003 8003
#define NUMBER_10000 10000
#define NUMBER_65536 65536
#define NUMBER_65537 65537
#define NUMBER_100000000 100000000
#define NUMBER_0X001 0x001
#define ERRORCODE_0 0
#define ERRORCODE_30001000 30001000
#define ERRORCODE_40001000 40001000
#define ERRORCODE_40301000 40301000
#define ERRORCODE_40601000 40601000
#define ERRORCODE_41202000 41202000
#define ERRORCODE_41203000 41203000
#define ERRORCODE_41206000 41206000
#define ERRORCODE_41207000 41207000
#define ERRORCODE_41208000 41208000
#define ERRORCODE_41209000 41209000
#define ERRORCODE_41210000 41210000
#define ERRORCODE_41211000 41211000
#define ERRORCODE_41212000 41212000
#define ERRORCODE_50102000 50102000
#define ERRORCODE_50002000 50002000
#define ERRORCODE_50007000 50007000
#define ERRORCODE_50401000 50401000
#define ERRORCODE_60001000 60001000
#define ERRORCODE_60002000 60002000

napi_value OHNativeBufferAlloc(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReference(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReferenceAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnreference(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnreferenceAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetConfig(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMap(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnmap(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnmapAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetSeqNum(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetSeqNumAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocAbormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocMuch(napi_env env, napi_callback_info info);
napi_value OHNativeBufferFromNativeWindowBufferNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferFromNativeWindowBufferNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetConfigNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetConfigNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetSeqNumNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetSeqNumNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeMapNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeMapPlanesNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapPlanesAbNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapPlanesNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeReferenceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeUnreferenceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReferenceNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReferenceMax(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnreferenceNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeUnmapNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnmapNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetColorSpaceFirst(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetColorSpaceNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetColorSpaceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetColorSpaceAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetColorSpaceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetMetadataValueFirst(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetDynamicMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetDynamicMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetDynamicMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetDynamicMetadataValue(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValueTimes(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetStaticMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetStaticMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetStaticMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetStaticMetadataValue(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetMetadataValue4(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetMetadataValue(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetNullMetadataValue(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValueNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetMetadataValueAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetMetadataValueNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferY8Y16USAGEandAlloc(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFence0ms(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFence100ms(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFence5000ms(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFenceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFenceAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValueEnumTraversal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValueREGION(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedNull01(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedNull02(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedAbnormal01(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedAbnormal02(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedMultipleCalls(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndGetConfilgNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndGetConfilgNull(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndGetConfilgMultipleCalls01(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndGetConfilgMultipleCalls02(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAll(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndUnmap(napi_env env, napi_callback_info info);
napi_value OHNativeBufferWriteToParcelNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferWriteToParcelNull(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReadFromParcelNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReadFromParcelNull(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReadFromParcelAbnnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferWriteAndReadParcelMultipleCalls(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapPlanesNormal1(napi_env env, napi_callback_info info);
napi_value OHNativeErrorCodeCover(napi_env env, napi_callback_info info);
#endif //NATIVEBUFFER_NATIVEBUFFER_H
