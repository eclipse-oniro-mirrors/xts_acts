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

export default function ApiTest() {
  describe('ApiTest', () => {
    beforeAll(() => {
      entry.Api_Test_Prepare(0);
    })
    beforeEach(() => {
      entry.Api_Test_Prepare(2);
    })
    afterEach(() => {
      entry.Api_Test_Prepare(3);
    })
    afterAll(() => {
      entry.Api_Test_Prepare(1);
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0200
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3300
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_3300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1800
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0300
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0400
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0500
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(6);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1400
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(7);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5000
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_5000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_5000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(8);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_5100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_5100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(9);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0600
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(10);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(11);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0800
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(12);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0900
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(13);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1000
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(14);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(15);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_4100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_4100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_4100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(16);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1500
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(17);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1200
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(18);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1300
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(19);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1600
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(20);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1700
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(21);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2200
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(22);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2500
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(23);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2600
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(24);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2700
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(25);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2800
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(26);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2900
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(27);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3000
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_3000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(28);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_3100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(29);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3200
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_3200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(30);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0100
     * @tc.number VIDEO_HWDEC_API_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(31);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0200
     * @tc.number VIDEO_HWDEC_API_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(32);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0300
     * @tc.number VIDEO_HWDEC_API_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(33);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0400
     * @tc.number VIDEO_HWDEC_API_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(34);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0500
     * @tc.number VIDEO_HWDEC_API_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(35);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0600
     * @tc.number VIDEO_HWDEC_API_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(36);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0700
     * @tc.number VIDEO_HWDEC_API_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(37);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0800
     * @tc.number VIDEO_HWDEC_API_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(38);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_0900
     * @tc.number VIDEO_HWDEC_API_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(39);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_1000
     * @tc.number VIDEO_HWDEC_API_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_1000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(40);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_1100
     * @tc.number VIDEO_HWDEC_API_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_1100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(41);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_1200
     * @tc.number VIDEO_HWDEC_API_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_1200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(42);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0100
     * @tc.number VIDEO_HWDEC_CAP_API_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(43);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0200
     * @tc.number VIDEO_HWDEC_CAP_API_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(44);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0300
     * @tc.number VIDEO_HWDEC_CAP_API_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(45);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0400
     * @tc.number VIDEO_HWDEC_CAP_API_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(46);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0500
     * @tc.number VIDEO_HWDEC_CAP_API_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(47);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0600
     * @tc.number VIDEO_HWDEC_CAP_API_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(48);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0700
     * @tc.number VIDEO_HWDEC_CAP_API_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(49);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0800
     * @tc.number VIDEO_HWDEC_CAP_API_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(50);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0900
     * @tc.number VIDEO_HWDEC_CAP_API_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(51);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1000
     * @tc.number VIDEO_HWDEC_CAP_API_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(52);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3100
     * @tc.number VIDEO_HWDEC_CAP_API_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(53);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3200
     * @tc.number VIDEO_HWDEC_CAP_API_3200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(54);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3300
     * @tc.number VIDEO_HWDEC_CAP_API_3300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(55);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3400
     * @tc.number VIDEO_HWDEC_CAP_API_3400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(56);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3500
     * @tc.number VIDEO_HWDEC_CAP_API_3500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(57);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3600
     * @tc.number VIDEO_HWDEC_CAP_API_3600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(58);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3700
     * @tc.number VIDEO_HWDEC_CAP_API_3700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(59);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3800
     * @tc.number VIDEO_HWDEC_CAP_API_3800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(60);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3900
     * @tc.number VIDEO_HWDEC_CAP_API_3900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(61);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4000
     * @tc.number VIDEO_HWDEC_CAP_API_4000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(62);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4100
     * @tc.number VIDEO_HWDEC_CAP_API_4100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(63);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4200
     * @tc.number VIDEO_HWDEC_CAP_API_4200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(64);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4300
     * @tc.number VIDEO_HWDEC_CAP_API_4300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(65);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4400
     * @tc.number VIDEO_HWDEC_CAP_API_4400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(66);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4500
     * @tc.number VIDEO_HWDEC_CAP_API_4500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(67);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4600
     * @tc.number VIDEO_HWDEC_CAP_API_4600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(68);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4700
     * @tc.number VIDEO_HWDEC_CAP_API_4700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(69);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4800
     * @tc.number VIDEO_HWDEC_CAP_API_4800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(70);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4900
     * @tc.number VIDEO_HWDEC_CAP_API_4900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(71);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5000
     * @tc.number VIDEO_HWDEC_CAP_API_5000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(72);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1700
     * @tc.number VIDEO_HWDEC_CAP_API_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(73);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5100
     * @tc.number VIDEO_HWDEC_CAP_API_5100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(74);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5200
     * @tc.number VIDEO_HWDEC_CAP_API_5200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(75);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5300
     * @tc.number VIDEO_HWDEC_CAP_API_5300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(76);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_9400
     * @tc.number VIDEO_HWDEC_CAP_API_9400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_9400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(77);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5400
     * @tc.number VIDEO_HWDEC_CAP_API_5400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(78);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5500
     * @tc.number VIDEO_HWDEC_CAP_API_5500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(79);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5600
     * @tc.number VIDEO_HWDEC_CAP_API_5600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(80);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5700
     * @tc.number VIDEO_HWDEC_CAP_API_5700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(81);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1600
     * @tc.number VIDEO_HWDEC_CAP_API_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(82);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5800
     * @tc.number VIDEO_HWDEC_CAP_API_5800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(83);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5900
     * @tc.number VIDEO_HWDEC_CAP_API_5900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(84);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6000
     * @tc.number VIDEO_HWDEC_CAP_API_6000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(85);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6100
     * @tc.number VIDEO_HWDEC_CAP_API_6100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(86);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6200
     * @tc.number VIDEO_HWDEC_CAP_API_6200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(87);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6300
     * @tc.number VIDEO_HWDEC_CAP_API_6300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(88);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6400
     * @tc.number VIDEO_HWDEC_CAP_API_6400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(89);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6500
     * @tc.number VIDEO_HWDEC_CAP_API_6500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(90);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6600
     * @tc.number VIDEO_HWDEC_CAP_API_6600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(91);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6700
     * @tc.number VIDEO_HWDEC_CAP_API_6700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(92);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6800
     * @tc.number VIDEO_HWDEC_CAP_API_6800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(93);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6900
     * @tc.number VIDEO_HWDEC_CAP_API_6900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(94);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7000
     * @tc.number VIDEO_HWDEC_CAP_API_7000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(95);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7100
     * @tc.number VIDEO_HWDEC_CAP_API_7100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(96);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1200
     * @tc.number VIDEO_HWDEC_CAP_API_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(97);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7200
     * @tc.number VIDEO_HWDEC_CAP_API_7200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(98);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7300
     * @tc.number VIDEO_HWDEC_CAP_API_7300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(99);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7400
     * @tc.number VIDEO_HWDEC_CAP_API_7400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(100);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7500
     * @tc.number VIDEO_HWDEC_CAP_API_7500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(101);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1300
     * @tc.number VIDEO_HWDEC_CAP_API_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(102);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7600
     * @tc.number VIDEO_HWDEC_CAP_API_7600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(103);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7700
     * @tc.number VIDEO_HWDEC_CAP_API_7700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7700', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(104);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7800
     * @tc.number VIDEO_HWDEC_CAP_API_7800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7800', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(105);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7900
     * @tc.number VIDEO_HWDEC_CAP_API_7900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7900', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(106);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_8000
     * @tc.number VIDEO_HWDEC_CAP_API_8000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_8000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(107);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1400
     * @tc.number VIDEO_HWDEC_CAP_API_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(108);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_8100
     * @tc.number VIDEO_HWDEC_CAP_API_8100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_8100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(109);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_8200
     * @tc.number VIDEO_HWDEC_CAP_API_8200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_8200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(110);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_8300
     * @tc.number VIDEO_HWDEC_CAP_API_8300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_8300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(111);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_ATTIME_API_0010
     * @tc.number VIDEO_HWDEC_ATTIME_API_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_ATTIME_API_0010', Level.LEVEL1, async (done: Function) => {
      const result = await entry.Api_Test(112);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0010
     * @tc.number VIDEO_DECODE_SYNC_API_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0010', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(113);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0020
     * @tc.number VIDEO_DECODE_SYNC_API_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0020', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(114);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0030
     * @tc.number VIDEO_DECODE_SYNC_API_0030
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0030', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(115);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0040
     * @tc.number VIDEO_DECODE_SYNC_API_0040
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0040', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(116);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0050
     * @tc.number VIDEO_DECODE_SYNC_API_0050
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0050', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(117);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0060
     * @tc.number VIDEO_DECODE_SYNC_API_0060
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0060', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(118);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0070
     * @tc.number VIDEO_DECODE_SYNC_API_0070
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0070', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(119);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0080
     * @tc.number VIDEO_DECODE_SYNC_API_0080
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0080', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(120);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FORMAT_API_0010
     * @tc.number VIDEO_HWDEC_FORMAT_API_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_HWDEC_FORMAT_API_0010', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Api_Test(121);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_FORMAT_API_0020
     * @tc.number VIDEO_HWDEC_FORMAT_API_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_HWDEC_FORMAT_API_0020', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Api_Test(122);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_ADD_0010
     * @tc.number VIDEO_HWDEC_API_ADD_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_ADD_0010', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(123);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_ADD_0020
     * @tc.number VIDEO_HWDEC_API_ADD_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_ADD_0020', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(124);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_ADD_0030
     * @tc.number VIDEO_HWDEC_API_ADD_0030
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_ADD_0030', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(125);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HWDEC_API_ADD_0040
     * @tc.number VIDEO_HWDEC_API_ADD_0040
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_ADD_0040', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(126);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1000
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1000', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(127);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1100
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(128);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1200
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(129);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1300
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(130);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1400
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(131);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1500
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(132);
      expect(result).assertEqual(0);
      done();
    })
  })
}