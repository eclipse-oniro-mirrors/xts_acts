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

export default function VpeImageNdkTest() {
  describe('VpeImageNdkTest', () => {
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
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(0)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(1)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(2)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(3)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0500
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(4)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0600
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(5)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(6)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(7)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0900
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0900
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_0900', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(8)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1000
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1000
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1000', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(9)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(10)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_TWO_1100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_TWO_1100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_TWO_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_TWO_1100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(11)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_THREE_1100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_THREE_1100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_THREE_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_THREE_1100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(12)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_FOUR_1100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_FOUR_1100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_FOUR_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_FOUR_1100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(13)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_FIVE_1100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_FIVE_1100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_FIVE_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_PART_FIVE_1100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(14)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(15)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(16)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(17)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1500
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(18)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1600
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(19)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(20)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(21)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1900
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1900
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_1900', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(22)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2000
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2000
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2000', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(23)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(24)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(25)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(26)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(27)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2500
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(28)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2600
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(29)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(30)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(31)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2900
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2900
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_2900', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(32)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3000
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3000
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3000', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(33)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(34)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(35)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(36)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(37)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3500
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(38)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3600
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(39)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(40)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(41)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3900
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3900
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_3900', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(42)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4000
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4000
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4000', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(43)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4100
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4100
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(44)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4200
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4200
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(45)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4300
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4300
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(46)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4400
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4400
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(47)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4500
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4500
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(48)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4600
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4600
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(49)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4700
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4700
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(50)).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4800
     * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4800
     * @tc.desc   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VPE_IMAGE_4800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(51)).assertEqual(0);
    })
  })
}