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

export default function StateTest() {
  describe('StateTest', () => {

    beforeAll(() => {
    })

    beforeEach(() => {
      entry.State_Test_Prepare(2);
    })
    afterEach(() => {
      entry.State_Test_Prepare(3);
    })
    afterAll(() => {
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0100
     * @tc.number VIDEO_HWDEC_STATE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0101
     * @tc.number VIDEO_HWDEC_STATE_0101
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0101', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0200
     * @tc.number VIDEO_HWDEC_STATE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0300
     * @tc.number VIDEO_HWDEC_STATE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0400
     * @tc.number VIDEO_HWDEC_STATE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0500
     * @tc.number VIDEO_HWDEC_STATE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0600
     * @tc.number VIDEO_HWDEC_STATE_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(6);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0700
     * @tc.number VIDEO_HWDEC_STATE_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(7);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0800
     * @tc.number VIDEO_HWDEC_STATE_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(8);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0900
     * @tc.number VIDEO_HWDEC_STATE_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(9);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1000
     * @tc.number VIDEO_HWDEC_STATE_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(10);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1100
     * @tc.number VIDEO_HWDEC_STATE_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(11);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1200
     * @tc.number VIDEO_HWDEC_STATE_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(12);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1300
     * @tc.number VIDEO_HWDEC_STATE_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(13);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1400
     * @tc.number VIDEO_HWDEC_STATE_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(14);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1500
     * @tc.number VIDEO_HWDEC_STATE_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(15);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1600
     * @tc.number VIDEO_HWDEC_STATE_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(16);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1700
     * @tc.number VIDEO_HWDEC_STATE_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(17);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1800
     * @tc.number VIDEO_HWDEC_STATE_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(18);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1900
     * @tc.number VIDEO_HWDEC_STATE_1900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(19);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2000
     * @tc.number VIDEO_HWDEC_STATE_2000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(20);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2100
     * @tc.number VIDEO_HWDEC_STATE_2100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(21);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2200
     * @tc.number VIDEO_HWDEC_STATE_2200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(22);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2300
     * @tc.number VIDEO_HWDEC_STATE_2300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(23);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2400
     * @tc.number VIDEO_HWDEC_STATE_2400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(24);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2500
     * @tc.number VIDEO_HWDEC_STATE_2500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(25);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2600
     * @tc.number VIDEO_HWDEC_STATE_2600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(26);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2700
     * @tc.number VIDEO_HWDEC_STATE_2700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(27);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2800
     * @tc.number VIDEO_HWDEC_STATE_2800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(28);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2900
     * @tc.number VIDEO_HWDEC_STATE_2900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(29);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3000
     * @tc.number VIDEO_HWDEC_STATE_3000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(30);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3100
     * @tc.number VIDEO_HWDEC_STATE_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(31);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3200
     * @tc.number VIDEO_HWDEC_STATE_3200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(32);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3300
     * @tc.number VIDEO_HWDEC_STATE_3300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(33);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3400
     * @tc.number VIDEO_HWDEC_STATE_3400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.State_Test(34);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3500
     * @tc.number VIDEO_HWDEC_STATE_3500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3500', Level.LEVEL1, async (done: Function) => {
      const result = await entry.State_Test(35);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3600
     * @tc.number VIDEO_HWDEC_STATE_3600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3600', Level.LEVEL1, async (done: Function) => {
      const result = await entry.State_Test(36);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3700
     * @tc.number VIDEO_HWDEC_STATE_3700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3700', Level.LEVEL1, async (done: Function) => {
      const result = await entry.State_Test(37);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3800
     * @tc.number VIDEO_HWDEC_STATE_3800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3800', Level.LEVEL1, async (done: Function) => {
      const result = await entry.State_Test(38);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3900
     * @tc.number VIDEO_HWDEC_STATE_3900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3900', Level.LEVEL1, async (done: Function) => {
      const result = await entry.State_Test(39);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_4000
     * @tc.number VIDEO_HWDEC_STATE_4000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_4000', Level.LEVEL1, async (done: Function) => {
      const result = await entry.State_Test(40);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_4100
     * @tc.number VIDEO_HWDEC_STATE_4100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_4100', Level.LEVEL1, async (done: Function) => {
      const result = await entry.State_Test(41);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_STATE_4200
     * @tc.number VIDEO_HWDEC_STATE_4200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_4200', Level.LEVEL1, async (done: Function) => {
      const result = await entry.State_Test(42);
      expect(result).assertEqual(0);
      done();
    })
  })
}
