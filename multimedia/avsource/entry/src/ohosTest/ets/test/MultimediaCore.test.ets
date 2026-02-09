/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level } from '@ohos/hypium'
import MultimediaCore from 'libmultimediaCore.so'

export default function audioDecoderTest() {
  describe('MultimediaCoreTest', () => {

    /**
     * @tc.name   testMultimediaCoreAVFormatCreate001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0100
     * @tc.desc   OH_AVFormat_Create Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCreate001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreate();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCreateAudioFormat001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0200
     * @tc.desc   test OH_AVFormat_CreateAudioFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCreateAudioFormat001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateAudioFormatOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCreateAudioFormat002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0300
     * @tc.desc   test OH_AVFormat_CreateAudioFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCreateAudioFormat002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateAudioFormatTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCreateVideoFormat001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0400
     * @tc.desc   test OH_AVFormat_CreateVideoFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCreateVideoFormat001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateVideoFormatOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCreateVideoFormat002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0500
     * @tc.desc   test OH_AVFormat_CreateVideoFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCreateVideoFormat002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateVideoFormatTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatCopy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0600
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatCopy001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatCopy002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0700
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatCopy002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatCopy003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0800
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatCopy003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_0900
     * @tc.desc   test OH_AVFormat_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatDestroy001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatDumpInfo001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1000
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatDumpInfo001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatDumpInfo002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1100
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatDumpInfo002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1200
     * @tc.desc   test OH_AVFormat_GetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetBufferOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetBuffer002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1300
     * @tc.desc   test OH_AVFormat_GetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetBuffer002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetBufferTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetBuffer003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1400
     * @tc.desc   test OH_AVFormat_GetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetBuffer003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetBufferThree();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMultimediaCoreAVFormatGetBuffer004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1500
     * @tc.desc   test OH_AVFormat_GetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetBuffer004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetBufferFour();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMultimediaCoreAVFormatGetBuffer005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1600
     * @tc.desc   test OH_AVFormat_GetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetBuffer005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetBufferFive();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetDoubleValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1700
     * @tc.desc   test OH_AVFormat_GetDoubleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetDoubleValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetDoubleValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetDoubleValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1800
     * @tc.desc   test OH_AVFormat_GetDoubleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetDoubleValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetDoubleValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetDoubleValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1900
     * @tc.desc   test OH_AVFormat_GetDoubleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetDoubleValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetDoubleValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetDoubleValue004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2000
     * @tc.desc   test OH_AVFormat_GetDoubleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetDoubleValue004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetDoubleValueFour();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetDoubleValue005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2100
     * @tc.desc   test OH_AVFormat_GetDoubleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetDoubleValue005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetDoubleValueFive();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetFloatValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2200
     * @tc.desc   test OH_AVFormat_GetFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetFloatValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetFloatValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetFloatValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2300
     * @tc.desc   test OH_AVFormat_GetFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetFloatValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetFloatValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetFloatValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2400
     * @tc.desc   test OH_AVFormat_GetFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetFloatValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetFloatValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetFloatValue004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2500
     * @tc.desc   test OH_AVFormat_GetFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetFloatValue004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetFloatValueFour();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetFloatValue005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2600
     * @tc.desc   test OH_AVFormat_GetFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetFloatValue005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetFloatValueFive();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetIntValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2700
     * @tc.desc   test OH_AVFormat_GetIntValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetIntValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetIntValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetIntValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2800
     * @tc.desc   test OH_AVFormat_GetIntValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetIntValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetIntValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetIntValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_2900
     * @tc.desc   test OH_AVFormat_GetIntValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetIntValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetIntValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetIntValue004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3000
     * @tc.desc   test OH_AVFormat_GetIntValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetIntValue004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetIntValueFour();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetIntValue005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3100
     * @tc.desc   test OH_AVFormat_GetIntValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetIntValue005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetIntValueFive();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetLongValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3200
     * @tc.desc   test OH_AVFormat_GetLongValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetLongValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetLongValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetLongValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3300
     * @tc.desc   test OH_AVFormat_GetLongValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetLongValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetLongValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetLongValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3400
     * @tc.desc   test OH_AVFormat_GetLongValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetLongValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetLongValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetLongValue004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3500
     * @tc.desc   test OH_AVFormat_GetLongValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetLongValue004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetLongValueFour();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetLongValue005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3600
     * @tc.desc   test OH_AVFormat_GetLongValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetLongValue005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetLongValueFive();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetStringValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3700
     * @tc.desc   test OH_AVFormat_GetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetStringValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetStringValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetStringValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3800
     * @tc.desc   test OH_AVFormat_GetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetStringValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetStringValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetStringValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_3900
     * @tc.desc   test OH_AVFormat_GetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetStringValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetStringValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetStringValue004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4000
     * @tc.desc   test OH_AVFormat_GetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetStringValue004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetStringValueFour();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatGetStringValue005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4100
     * @tc.desc   test OH_AVFormat_GetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatGetStringValue005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatGetStringValueFive();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatSetBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4200
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatSetBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatSetBuffer002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4300
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatSetBuffer002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatSetBuffer003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4400
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatSetBuffer003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4500
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferFour();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetDoubleValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5600
     * @tc.desc   test OH_AVFormat_SetDoubleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetDoubleValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetDoubleValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetDoubleValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4700
     * @tc.desc   test OH_AVFormat_SetDoubleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetDoubleValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetDoubleValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetDoubleValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4800
     * @tc.desc   test OH_AVFormat_SetDoubleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetDoubleValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetDoubleValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetFloatValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_4900
     * @tc.desc   test OH_AVFormat_SetFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetFloatValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetFloatValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetFloatValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5000
     * @tc.desc   test OH_AVFormat_SetFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetFloatValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetFloatValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetFloatValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5100
     * @tc.desc   test OH_AVFormat_SetFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetFloatValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetFloatValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetIntValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5200
     * @tc.desc   test OH_AVFormat_SetIntValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetIntValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetIntValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetIntValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5300
     * @tc.desc   test OH_AVFormat_SetIntValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetIntValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetIntValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetIntValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5300
     * @tc.desc   test OH_AVFormat_SetIntValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetIntValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetIntValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetLongValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5500
     * @tc.desc   test OH_AVFormat_SetLongValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetLongValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetLongValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetLongValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5600
     * @tc.desc   test OH_AVFormat_SetLongValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetLongValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetLongValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetLongValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5700
     * @tc.desc   test OH_AVFormat_SetLongValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetLongValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetLongValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetStringValue001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5800
     * @tc.desc   test OH_AVFormat_SetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetStringValue001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.MultimediaCoreAVFormatSetStringValueOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetStringValue002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_5900
     * @tc.desc   test OH_AVFormat_SetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetStringValue002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.MultimediaCoreAVFormatSetStringValueTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetStringValue003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6000
     * @tc.desc   test OH_AVFormat_SetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetStringValue003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.MultimediaCoreAVFormatSetStringValueThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetStringValue004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6100
     * @tc.desc   test OH_AVFormat_SetStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetStringValue004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.MultimediaCoreAVFormatSetStringValueFour();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVMemoryCreate001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6200
     * @tc.desc   test OH_AVMemory_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVMemoryCreate001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVMemoryCreateOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVMemoryCreate002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6300
     * @tc.desc   test OH_AVMemory_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVMemoryCreate002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVMemoryCreateTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVMemoryDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6400
     * @tc.desc   test OH_AVMemory_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVMemoryDestroy001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVMemoryDestroyOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVMemoryDestroy002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6500
     * @tc.desc   test OH_AVMemory_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVMemoryDestroy002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVMemoryDestroyTwo();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testMultimediaCoreAVMemoryGetAddr001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6600
     * @tc.desc   test OH_AVMemory_GetAddr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVMemoryGetAddr001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVMemoryGetAddrOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVMemoryGetAddr002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6700
     * @tc.desc   test OH_AVMemory_GetAddr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVMemoryGetAddr002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVMemoryGetAddrTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVMemoryGetSize001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6800
     * @tc.desc   test OH_AVMemory_GetSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVMemoryGetSize001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVMemoryGetSizeOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVMemoryGetSize002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_6900
     * @tc.desc   test OH_AVMemory_GetSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVMemoryGetSize002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVMemoryGetSizeTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatCreateAudioFormat001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0100
     * @tc.desc   test OH_AVFormat_CreateAudioFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatCreateAudioFormat001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateAudioFormatAVC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatCreateAudioFormat002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0200
     * @tc.desc   test OH_AVFormat_CreateAudioFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatCreateAudioFormat002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateAudioFormatVORBIS();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCreateAudioFormat003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0300
     * @tc.desc   test OH_AVFormat_CreateAudioFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCreateAudioFormat003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateAudioFormatVORBISMPEG();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatCreateVideoFormat001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0400
     * @tc.desc   test OH_AVFormat_CreateVideoFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatCreateVideoFormat001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateVideoFormatHEVC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatCreateVideoFormat002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0500
     * @tc.desc   test OH_AVFormat_CreateVideoFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatCreateVideoFormat002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCreateVideoFormatMPEG4();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0600
     * @tc.desc   test OH_AVFormat_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDestroy001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDestroyVideoHEVC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDestroy002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0700
     * @tc.desc   test OH_AVFormat_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDestroy002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDestroyVideoMPEG4();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDestroy003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0800
     * @tc.desc   test OH_AVFormat_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDestroy003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDestroyAudioFLAC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDestroy004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_0900
     * @tc.desc   test OH_AVFormat_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDestroy004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDestroyAudioAAC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDestroy005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1000
     * @tc.desc   test OH_AVFormat_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDestroy005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDestroyAudioVORBIS();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDestroy006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1100
     * @tc.desc   test OH_AVFormat_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDestroy006', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDestroyAudioMPEG();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCopy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1200
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCopy001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyVideoHEVC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCopy002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1300
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCopy002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyVideoMPEG4();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCopy003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1400
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCopy003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyAudioAAC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCopy004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1500
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCopy004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyAudioFLAC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCopy005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1600
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCopy005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyAudioVORBIS();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatCopy006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1700
     * @tc.desc   test OH_AVFormat_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatCopy006', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatCopyAudioMPEG();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1800
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoARTIST();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_1900
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoALBUM();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2000
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoALBUMARTIST();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2100
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoDATE();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2200
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoCOMMENT();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2300
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo006', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoGENRE();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2400
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo007', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoCOPYRIGHT();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2500
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo008', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoLANGUAGE();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2600
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo009', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoDESCRIPTION();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatDumpInfo010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2700
     * @tc.desc   test OH_AVFormat_DumpInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatDumpInfo010', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatDumpInfoLYRICS();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2800
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2900
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer002', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_2900
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer003', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCoreMultimediaCoreAVFormatSetBuffer004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3000
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreMultimediaCoreAVFormatSetBuffer004', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3100
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer005', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3200
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer006', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3300
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer007', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(7);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3400
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer008', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3500
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer009', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3600
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer010', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer011
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3700
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer011', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer012
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3800
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer012', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer013
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_3900
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer013', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(13);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer014
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4000
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer014', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(14);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer015
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4100
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer015', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(15);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer016
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4200
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer016', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(16);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer017
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4300
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer017', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(17);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer018
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4400
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer018', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(18);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer019
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4500
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer019', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(19);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer020
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4600
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer020', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(20);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer021
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4700
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer021', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(21);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer022
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4800
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer022', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(22);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer023
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_4900
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer023', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(23);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer024
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5000
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer024', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(24);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer025
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5100
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer025', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer026
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5200
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer026', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(26);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer027
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5300
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer027', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(27);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer028
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5400
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer028', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(28);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer029
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5500
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer029', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(29);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer030
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5600
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer030', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(30);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer031
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5700
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer031', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(31);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer032
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5800
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer032', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(32);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer033
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_5900
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer033', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(33);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer034
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6000
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer034', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(34);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer035
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6100
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer035', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(35);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer036
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6200
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer036', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(36);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer037
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6300
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer037', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(37);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer038
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6400
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer038', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(38);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer039
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6500
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer039', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(39);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer040
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6600
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer040', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(40);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVFormatSetBuffer041
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6700
     * @tc.desc   test OH_AVFormat_SetBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVFormatSetBuffer041', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVFormatSetBufferAll(41);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferCreate001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6800
     * @tc.desc   test OH_AVBuffer_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferCreate001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_6900
     * @tc.desc   test OH_AVBuffer_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferDestroy001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferGetBufferAttr001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_7000
     * @tc.desc   test OH_AVBuffer_GetBufferAttr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferGetBufferAttr001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferGetBufferAttr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferSetBufferAttr001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_7100
     * @tc.desc   test OH_AVBuffer_SetBufferAttr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferSetBufferAttr001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferSetBufferAttr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferGetParameter001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_7200
     * @tc.desc   test OH_AVBuffer_GetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferGetParameter001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferGetParameter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferSetParameter001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_7300
     * @tc.desc   test OH_AVBuffer_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferSetParameter001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferSetParameter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferGetAddr001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_7400
     * @tc.desc   test OH_AVBuffer_GetAddr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferGetAddr001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferGetAddr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferGetCapacity001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_7500
     * @tc.desc   test OH_AVBuffer_GetCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferGetCapacity001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferGetCapacity();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultimediaCoreAVBufferGetNativeBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_CORE_1_7600
     * @tc.desc   test OH_AVBuffer_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultimediaCoreAVBufferGetNativeBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = MultimediaCore.multimediaCoreAVBufferGetNativeBuffer();
      expect(result).assertEqual(0);
      done();
    });
  })
}