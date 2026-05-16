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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import hevcswDecoderNapi from "libentry.so"
import Utils, { Log } from './Util.test';

const fileArr = [
  "1920_1080_30.h265",
  "hash_val.json"
]

export default function abilityTest() {
  describe('actsHevcswDecoderTest', () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   VideoDecodeSyncSs265Func0010Test
     * @tc.number VideoDecodeSyncSs265Func0010Test
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoDecodeSyncSs265Func0010Test', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(0);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   VideoDecodeSyncSs265Func0020Test
     * @tc.number VideoDecodeSyncSs265Func0020Test
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VideoDecodeSyncSs265Func0020Test', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(1);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   VideoSwdecH265BlankFrame0010Test
     * @tc.number VideoSwdecH265BlankFrame0010Test
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VideoSwdecH265BlankFrame0010Test', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(2);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0100
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0100', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(3);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0200
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0200', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(4);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0300
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0300', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(5);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0400
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0400', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(6);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0500
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0500', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(7);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0600
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0600', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(8);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0700
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0700', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(9);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0800
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0800', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(10);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0900
     * @tc.number SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0900', Level.LEVEL1, async (done: Function) => {
      const result: number = await hevcswDecoderNapi.runFuncTest(11);
      expect(result).assertEqual(0)
      done();
    })
  })
}