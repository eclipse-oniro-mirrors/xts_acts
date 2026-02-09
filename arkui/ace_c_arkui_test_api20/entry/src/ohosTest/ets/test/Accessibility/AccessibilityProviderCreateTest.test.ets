/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function AccessibilityProviderCreateTest(){

  describe('AccessibilityProviderCreateTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number AccessibilityProviderCreateTest
     * @tc.name AccessibilityProviderCreateTest_001
     * @tc.desc Verify whether it can return the correct parameter error code when invalid parameters are passed in.
     * @tc.level LEVEL1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('AccessibilityProviderCreateTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.AccessibilityProviderCreateTest()).assertEqual(0)
      done();
    })

    /**
     * @tc.number AccessibilityProviderCreateTest_002
     * @tc.name AccessibilityProviderCreateTest_002
     * @tc.desc EmbeddedComponentOption Test
     * @tc.level LEVEL1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('AccessibilityProviderCreateTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.EmbeddedComponentOptionTest()).assertEqual(0)
      done();
    })

    /**
     * @tc.number AccessibilityProviderCreateTest_003
     * @tc.name AccessibilityProviderCreateTest_003
     * @tc.desc AccessibilityValueCreate Test
     * @tc.level LEVEL1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('AccessibilityProviderCreateTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.AccessibilityValueCreateTest()).assertEqual(0)
      done();
    })

    /**
     * @tc.number AccessibilityProviderCreateTest_004
     * @tc.name AccessibilityProviderCreateTest_004
     * @tc.desc AccessibilityStateCreate Test
     * @tc.level LEVEL1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('AccessibilityProviderCreateTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.AccessibilityStateCreateTest()).assertEqual(0)
      done();
    })

    /**
     * @tc.number AccessibilityProviderCreateTest_005
     * @tc.name AccessibilityProviderCreateTest_005
     * @tc.desc CreateAccessibilityEventInfo Test
     * @tc.level LEVEL1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('AccessibilityProviderCreateTest_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.CreateAccessibilityEventInfoTest()).assertEqual(0)
      done();
    })

    /**
     * @tc.number AccessibilityProviderCreateTest_006
     * @tc.name AccessibilityProviderCreateTest_006
     * @tc.desc CreateAccessibilityElementInfo Test
     * @tc.level LEVEL1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('AccessibilityProviderCreateTest_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.CreateAccessibilityElementInfoTest()).assertEqual(0)
      done();
    })

    /**
     * @tc.number AccessibilityErrorCodeTest_001
     * @tc.name AccessibilityErrorCodeTest_001
     * @tc.desc AccessibilityErrorCode Test
     * @tc.level LEVEL1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('AccessibilityErrorCodeTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.AccessibilityErrorCodeTest001()).assertEqual(0)
      done();
    })
  })
}