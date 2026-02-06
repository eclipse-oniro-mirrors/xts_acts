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

export default function customComponentAccessibilityGroupTest() {

  describe('CustomComponentAccessibilityGroupTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ACCESSIBILITYGROUP_0100
     * @tc.name       : testCustomComponentAccessibilityGroup001
     * @tc.desc       : testing accessibilityGroup for CustomComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAccessibilityGroup001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAccessibilityGroup001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ACCESSIBILITYGROUP_0200
     * @tc.name       : testCustomComponentAccessibilityGroup002
     * @tc.desc       : testing accessibilityGroup for CustomComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAccessibilityGroup002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAccessibilityGroup002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ACCESSIBILITYGROUP_0300
     * @tc.name       : testCustomComponentAccessibilityGroup003
     * @tc.desc       : testing accessibilityGroup for CustomComponent with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentAccessibilityGroup003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAccessibilityGroup003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ACCESSIBILITYGROUP_0400
     * @tc.name       : testCustomComponentAccessibilityGroup004
     * @tc.desc       : testing accessibilityGroup for CustomComponent with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentAccessibilityGroup004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
