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

export default function commonAttrsAccessibilityActionsTest() {

  describe('CommonAttrsAccessibilityActionsTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYACTIONS_0100
     * @tc.name       : testCommonAttrsAccessibilityActions001
     * @tc.desc       : testing accessibilty actions for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityActions001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityActions001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYACTIONS_0200
     * @tc.name       : testCommonAttrsAccessibilityActions002
     * @tc.desc       : testing accessibilty actions for commonattrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityActions002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityActions002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYACTIONS_0300
     * @tc.name       : testCommonAttrsAccessibilityActions003
     * @tc.desc       : testing accessibilty actions for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityActions003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityActions003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYACTIONS_0400
     * @tc.name       : testCommonAttrsAccessibilityActions004
     * @tc.desc       : testing accessibilty actions for commonattrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityActions004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityActions004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYACTIONS_0500
     * @tc.name       : testCommonAttrsAccessibilityActions005
     * @tc.desc       : testing on accessibilty actions for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityActions005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityActions005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYACTIONS_0600
     * @tc.name       : testCommonAttrsAccessibilityActions006
     * @tc.desc       : testing resetAttribute accessibilty actions for commonattrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityActions006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityActions006()).assertEqual(0)
      done()
    })
  })
}