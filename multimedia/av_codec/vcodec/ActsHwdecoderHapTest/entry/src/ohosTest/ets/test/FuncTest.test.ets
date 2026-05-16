/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import entry from 'libentry.so';

export default function FuncTest() {
  describe('FuncTest', () => {

    beforeAll(() => {
      entry.Func_Test_Prepare(0);
    })
    beforeEach(() => {

    })
    afterEach(() => {

    })
    afterAll(() => {

    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0200
     * @tc.number VIDEO_HWDEC_FUNCTION_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_0200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Func_Test(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0300
     * @tc.number VIDEO_HWDEC_FUNCTION_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_HWDEC_FUNCTION_0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0400
     * @tc.number VIDEO_HWDEC_FUNCTION_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_HWDEC_FUNCTION_0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0700
     * @tc.number VIDEO_HWDEC_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_0700', Level.LEVEL1, async (done: Function) => {
      const result = await entry.Func_Test(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0800
     * @tc.number VIDEO_HWDEC_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_0800', Level.LEVEL1, async (done: Function) => {
      const result = await entry.Func_Test(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0900
     * @tc.number VIDEO_HWDEC_FUNCTION_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_0900', Level.LEVEL1, async (done: Function) => {
      const result = await entry.Func_Test(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1000
     * @tc.number VIDEO_HWDEC_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_1000', Level.LEVEL1, async (done: Function) => {
      const result = await entry.Func_Test(6);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1100
     * @tc.number VIDEO_HWDEC_FUNCTION_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_1100', Level.LEVEL1, async (done: Function) => {
      const result = await entry.Func_Test(7);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1200
     * @tc.number VIDEO_HWDEC_FUNCTION_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Func_Test(8);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1300
     * @tc.number VIDEO_HWDEC_FUNCTION_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Func_Test(9);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1400
     * @tc.number VIDEO_HWDEC_FUNCTION_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Func_Test(10);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1600
     * @tc.number VIDEO_HWDEC_FUNCTION_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Func_Test(11);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1700
     * @tc.number VIDEO_HWDEC_FUNCTION_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Func_Test(12);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SURF_CHANGE_FUNC_001
     * @tc.number SURF_CHANGE_FUNC_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SURF_CHANGE_FUNC_001', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(13);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SURF_CHANGE_FUNC_002
     * @tc.number SURF_CHANGE_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SURF_CHANGE_FUNC_002', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(14);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SURF_CHANGE_FUNC_003
     * @tc.number SURF_CHANGE_FUNC_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SURF_CHANGE_FUNC_003', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(15);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SURF_CHANGE_FUNC_004
     * @tc.number SURF_CHANGE_FUNC_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SURF_CHANGE_FUNC_004', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(16);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   OUTPUT_DECS_FUNC_001
     * @tc.number OUTPUT_DECS_FUNC_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_001', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(17);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   OUTPUT_DECS_FUNC_002
     * @tc.number OUTPUT_DECS_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_002', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(18);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   OUTPUT_DECS_FUNC_003
     * @tc.number OUTPUT_DECS_FUNC_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_003', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(19);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   OUTPUT_DECS_FUNC_004
     * @tc.number OUTPUT_DECS_FUNC_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_004', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(20);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   OUTPUT_DECS_FUNC_005
     * @tc.number OUTPUT_DECS_FUNC_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_005', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(21);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   OUTPUT_DECS_FUNC_006
     * @tc.number OUTPUT_DECS_FUNC_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_006', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(22);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   OUTPUT_DECS_FUNC_007
     * @tc.number OUTPUT_DECS_FUNC_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_007', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Func_Test(23);
      expect(result).assertEqual(0);
      done();
    })
  })
}
