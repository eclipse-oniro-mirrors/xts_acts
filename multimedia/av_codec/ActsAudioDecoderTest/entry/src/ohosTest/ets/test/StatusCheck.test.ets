/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import libAudioDecoder from 'libentry.so';

export default function StatusCheckTest() {
  describe('StatusCheckTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.name   STATUS_CHECK_001
     * @tc.number STATUS_CHECK_001
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_001', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_002
     * @tc.number STATUS_CHECK_002
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_002', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_003
     * @tc.number STATUS_CHECK_003
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_003', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_004
     * @tc.number STATUS_CHECK_004
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_004', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_005
     * @tc.number STATUS_CHECK_005
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_005', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_006
     * @tc.number STATUS_CHECK_006
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_006', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_007
     * @tc.number STATUS_CHECK_007
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_007', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(6);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_008
     * @tc.number STATUS_CHECK_008
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_008', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(7);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_009
     * @tc.number STATUS_CHECK_009
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_009', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(8);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_010
     * @tc.number STATUS_CHECK_010
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_010', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(9);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_011
     * @tc.number STATUS_CHECK_011
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_011', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(10);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_012
     * @tc.number STATUS_CHECK_012
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_012', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(11);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_013
     * @tc.number STATUS_CHECK_013
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_013', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(12);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_014
     * @tc.number STATUS_CHECK_014
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_014', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(13);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_015
     * @tc.number STATUS_CHECK_015
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_015', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(14);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_016
     * @tc.number STATUS_CHECK_016
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_016', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(15);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_017
     * @tc.number STATUS_CHECK_017
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_017', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(16);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_018
     * @tc.number STATUS_CHECK_018
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_018', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(17);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_019
     * @tc.number STATUS_CHECK_019
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_019', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(18);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_020
     * @tc.number STATUS_CHECK_020
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_020', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(19);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_021
     * @tc.number STATUS_CHECK_021
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_021', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(20);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_022
     * @tc.number STATUS_CHECK_022
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_022', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(21);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_023
     * @tc.number STATUS_CHECK_023
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_023', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(22);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_024
     * @tc.number STATUS_CHECK_024
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_024', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(23);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_025
     * @tc.number STATUS_CHECK_025
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_025', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(24);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_026
     * @tc.number STATUS_CHECK_026
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_026', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(25);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_027
     * @tc.number STATUS_CHECK_027
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_027', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(26);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_028
     * @tc.number STATUS_CHECK_028
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_028', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(27);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_029
     * @tc.number STATUS_CHECK_029
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_029', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(28);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_030
     * @tc.number STATUS_CHECK_030
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_030', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(29);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_031
     * @tc.number STATUS_CHECK_031
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_031', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(30);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_032
     * @tc.number STATUS_CHECK_032
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_032', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(31);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_033
     * @tc.number STATUS_CHECK_033
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_033', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(32);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_034
     * @tc.number STATUS_CHECK_034
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_034', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(33);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_035
     * @tc.number STATUS_CHECK_035
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_035', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(34);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_036
     * @tc.number STATUS_CHECK_036
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_036', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(35);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_037
     * @tc.number STATUS_CHECK_037
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_037', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(36);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_038
     * @tc.number STATUS_CHECK_038
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_038', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(37);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_039
     * @tc.number STATUS_CHECK_039
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_039', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(38);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_040
     * @tc.number STATUS_CHECK_040
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_040', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(39);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_041
     * @tc.number STATUS_CHECK_041
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_041', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(40);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_042
     * @tc.number STATUS_CHECK_042
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_042', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(41);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_043
     * @tc.number STATUS_CHECK_043
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_043', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(42);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_044
     * @tc.number STATUS_CHECK_044
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_044', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(43);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_045
     * @tc.number STATUS_CHECK_045
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_045', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(44);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_046
     * @tc.number STATUS_CHECK_046
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_046', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(45);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_047
     * @tc.number STATUS_CHECK_047
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_047', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(46);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_048
     * @tc.number STATUS_CHECK_048
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_048', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(47);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_049
     * @tc.number STATUS_CHECK_049
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_049', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(48);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_050
     * @tc.number STATUS_CHECK_050
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_050', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(49);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_051
     * @tc.number STATUS_CHECK_051
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_051', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(50);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_052
     * @tc.number STATUS_CHECK_052
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_052', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(51);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_053
     * @tc.number STATUS_CHECK_053
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_053', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(52);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_054
     * @tc.number STATUS_CHECK_054
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_054', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(53);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_055
     * @tc.number STATUS_CHECK_055
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_055', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(54);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_056
     * @tc.number STATUS_CHECK_056
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_056', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(55);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_057
     * @tc.number STATUS_CHECK_057
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_057', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(56);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_058
     * @tc.number STATUS_CHECK_058
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_058', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(57);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_059
     * @tc.number STATUS_CHECK_059
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_059', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(58);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_060
     * @tc.number STATUS_CHECK_060
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_060', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(59);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_061
     * @tc.number STATUS_CHECK_061
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_061', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(60);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_062
     * @tc.number STATUS_CHECK_062
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_062', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(61);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_063
     * @tc.number STATUS_CHECK_063
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_063', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(62);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_064
     * @tc.number STATUS_CHECK_064
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_064', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(63);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_065
     * @tc.number STATUS_CHECK_065
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_065', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(64);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_066
     * @tc.number STATUS_CHECK_066
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_066', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(65);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_067
     * @tc.number STATUS_CHECK_067
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_067', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(66);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   STATUS_CHECK_068
     * @tc.number STATUS_CHECK_068
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_068', Level.LEVEL0, async (done: Function) => {
      const result = await libAudioDecoder.STATUS_CHECK(67);
      expect(result).assertEqual(0);
      done();
    })
  })
}

