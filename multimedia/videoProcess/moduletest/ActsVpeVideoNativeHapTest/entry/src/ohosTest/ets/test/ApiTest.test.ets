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

import { describe, it, expect, Level, afterEach } from '@ohos/hypium';
import entry from 'libentry.so';

export default function VpeVideoApiTest() {
  describe('VpeVideoApiTest', () => {
    afterEach(() => {
      entry.TearDown();
    })
    /**
     * @tc.name   VPE_VIDEO_API_TEST_0010
     * @tc.number VPE_VIDEO_API_TEST_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0010', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0020
     * @tc.number VPE_VIDEO_API_TEST_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0020', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0030
     * @tc.number VPE_VIDEO_API_TEST_0030
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0030', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0040
     * @tc.number VPE_VIDEO_API_TEST_0040
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0040', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0050
     * @tc.number VPE_VIDEO_API_TEST_0050
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0050', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0060
     * @tc.number VPE_VIDEO_API_TEST_0060
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0060', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0070
     * @tc.number VPE_VIDEO_API_TEST_0070
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0070', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(6);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0080
     * @tc.number VPE_VIDEO_API_TEST_0080
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0080', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(7);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0090
     * @tc.number VPE_VIDEO_API_TEST_0090
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0090', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(8);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0100
     * @tc.number VPE_VIDEO_API_TEST_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0100', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(9);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0110
     * @tc.number VPE_VIDEO_API_TEST_0110
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0110', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(10);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0120
     * @tc.number VPE_VIDEO_API_TEST_0120
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0120', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(11);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0130
     * @tc.number VPE_VIDEO_API_TEST_0130
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0130', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(12);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0140
     * @tc.number VPE_VIDEO_API_TEST_0140
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0140', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(13);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0150
     * @tc.number VPE_VIDEO_API_TEST_0150
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0150', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(14);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0160
     * @tc.number VPE_VIDEO_API_TEST_0160
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0160', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(15);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0170
     * @tc.number VPE_VIDEO_API_TEST_0170
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0170', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(16);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0180
     * @tc.number VPE_VIDEO_API_TEST_0180
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0180', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(17);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0190
     * @tc.number VPE_VIDEO_API_TEST_0190
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0190', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(18);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0200
     * @tc.number VPE_VIDEO_API_TEST_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0200', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(19);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0201
     * @tc.number VPE_VIDEO_API_TEST_0201
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0201', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(20);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0210
     * @tc.number VPE_VIDEO_API_TEST_0210
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0210', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(21);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0220
     * @tc.number VPE_VIDEO_API_TEST_0220
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0220', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(22);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0230
     * @tc.number VPE_VIDEO_API_TEST_0230
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0230', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(23);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0240
     * @tc.number VPE_VIDEO_API_TEST_0240
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0240', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(24);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0250
     * @tc.number VPE_VIDEO_API_TEST_0250
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0250', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(25);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0260
     * @tc.number VPE_VIDEO_API_TEST_0260
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0260', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(26);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0270
     * @tc.number VPE_VIDEO_API_TEST_0270
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0270', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(27);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0280
     * @tc.number VPE_VIDEO_API_TEST_0280
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0280', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(28);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0290
     * @tc.number VPE_VIDEO_API_TEST_0290
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0290', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(29);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0291
     * @tc.number VPE_VIDEO_API_TEST_0291
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0291', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(30);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0300
     * @tc.number VPE_VIDEO_API_TEST_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0300', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(31);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0310
     * @tc.number VPE_VIDEO_API_TEST_0310
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0310', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(32);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0320
     * @tc.number VPE_VIDEO_API_TEST_0320
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0320', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(33);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0330
     * @tc.number VPE_VIDEO_API_TEST_0330
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0330', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(34);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0340
     * @tc.number VPE_VIDEO_API_TEST_0340
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0340', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(35);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0350
     * @tc.number VPE_VIDEO_API_TEST_0350
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0350', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(36);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0360
     * @tc.number VPE_VIDEO_API_TEST_0360
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0360', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(37);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0370
     * @tc.number VPE_VIDEO_API_TEST_0370
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0370', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(38);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0380
     * @tc.number VPE_VIDEO_API_TEST_0380
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0380', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(39);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0390
     * @tc.number VPE_VIDEO_API_TEST_0390
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0390', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(40);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0400
     * @tc.number VPE_VIDEO_API_TEST_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0400', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(41);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0410
     * @tc.number VPE_VIDEO_API_TEST_0410
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0410', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(42);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0420
     * @tc.number VPE_VIDEO_API_TEST_0420
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0420', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(43);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0430
     * @tc.number VPE_VIDEO_API_TEST_0430
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0430', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(44);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0440
     * @tc.number VPE_VIDEO_API_TEST_0440
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0440', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(45);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0450
     * @tc.number VPE_VIDEO_API_TEST_0450
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0450', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(46);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0460
     * @tc.number VPE_VIDEO_API_TEST_0460
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0460', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(47);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0470
     * @tc.number VPE_VIDEO_API_TEST_0470
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0470', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(48);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0480
     * @tc.number VPE_VIDEO_API_TEST_0480
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0480', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(49);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0490
     * @tc.number VPE_VIDEO_API_TEST_0490
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0490', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(50);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0500
     * @tc.number VPE_VIDEO_API_TEST_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0500', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(51);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0510
     * @tc.number VPE_VIDEO_API_TEST_0510
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0510', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(52);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0520
     * @tc.number VPE_VIDEO_API_TEST_0520
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0520', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(53);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0530
     * @tc.number VPE_VIDEO_API_TEST_0530
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0530', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(54);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0540
     * @tc.number VPE_VIDEO_API_TEST_0540
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0540', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(55);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0550
     * @tc.number VPE_VIDEO_API_TEST_0550
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0550', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(56);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0560
     * @tc.number VPE_VIDEO_API_TEST_0560
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0560', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(57);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0570
     * @tc.number VPE_VIDEO_API_TEST_0570
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0570', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(58);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0580
     * @tc.number VPE_VIDEO_API_TEST_0580
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0580', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(59);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0590
     * @tc.number VPE_VIDEO_API_TEST_0590
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0590', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(60);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0591
     * @tc.number VPE_VIDEO_API_TEST_0591
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0591', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(61);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_VIDEO_API_TEST_0600
     * @tc.number VPE_VIDEO_API_TEST_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VPE_VIDEO_API_TEST_0600', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Api_Test(62);
      expect(result).assertEqual(0);
      done();
    })
  })
}

