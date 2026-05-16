/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import entry from 'libentry.so';

export default function SqrFuncTest() {
  describe('SqrFuncTest', () => {
    beforeAll(() => {
      entry.Sqr_Func_Test_Prepare(0);
    })
    beforeEach(() => {
      
    })
    afterEach(() => {
      entry.Sqr_Func_Test_Prepare(3)
    })
    afterAll(() => {

    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_001
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_001", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_002
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_002", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_003
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_003", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_004
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_004", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_005
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_005", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_006
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_006", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_007
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_007", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(6);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_008
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_008
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_008", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(7);
      expect(result).assertEqual(0);
      done();
    })


    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_009
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_009
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_009", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(8);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_010
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_010", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(9);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_011
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_011
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_011", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(10);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_012
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_012
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_012", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(11);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_013
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_013
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_013", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(12);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_014
     * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_014
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_SQR_FUNC_014", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Sqr_Func_Test(13);
      expect(result).assertEqual(0);
      done();
    })
  })
}