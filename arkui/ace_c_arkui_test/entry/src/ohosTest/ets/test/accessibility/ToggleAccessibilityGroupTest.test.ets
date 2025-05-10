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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function toggleAccessibilityGroupTest() {

  describe('ToggleAccessibilityGroupTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYGROUP_0100
     * @tc.name       : testToggleAccessibilityGroup001
     * @tc.desc       : testing accessibilityGroup for Toggle with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleAccessibilityGroup001', 0, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityGroup001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYGROUP_0200
     * @tc.name       : testToggleAccessibilityGroup002
     * @tc.desc       : testing accessibilityGroup for Toggle with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleAccessibilityGroup002', 0, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityGroup002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYGROUP_0300
     * @tc.name       : testToggleAccessibilityGroup003
     * @tc.desc       : testing accessibilityGroup for Toggle with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleAccessibilityGroup003', 0, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityGroup003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYGROUP_0400
     * @tc.name       : testToggleAccessibilityGroup004
     * @tc.desc       : testing accessibilityGroup for Toggle with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleAccessibilityGroup004', 0, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
