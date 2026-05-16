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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libNdk from 'libentry.so';

export default function VpeVideoNdkTest() {
  describe('VpeVideoNdkTest', () => {
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
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0100', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(0)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0200', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(1)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0300', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(2)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0500
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0500', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(3)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0600
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0600', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(4)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0700', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(5)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0800', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(6)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0900
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0900
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_0900', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(7)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1000
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1000
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1000', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(8)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1100', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(9)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1200', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(10)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1300', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(11)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1400', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(12)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1500
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1500', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(13)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1600
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1600', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(14)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1700', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(15)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1800', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(16)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1900
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1900
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_1900', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(17)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2000
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2000
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2000', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(18)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2100', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(19)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2200', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(20)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2300', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(21)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2400', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(22)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2500
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2500', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(23)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2600
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2600', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(24)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2700', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(25)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2800', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(26)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2900
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2900
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_2900', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(27)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3000
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3000
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3000', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(28)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3100', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(29)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3200', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(30)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3300', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(31)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3400', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(32)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_PART_TWO_3400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_PART_TWO_3400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_PART_TWO_3400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_PART_TWO_3400', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(33)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3500', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(34)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3700', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(35)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_VIDEO_3800', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(36)).assertEqual(0);
    })

  })
}