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

export default function progressAccessibilityLevelTest() {

  describe('ProgressAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_ACCESSIBILITYLEVEL_0100
     * @tc.name       : testProgressAccessibilityLevel001
     * @tc.desc       : testing accessibilityLevel for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressAccessibilityLevel001', 0, async (done: Function) => {
      expect(nativeFunc.testProgressAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_ACCESSIBILITYLEVEL_0200
     * @tc.name       : testProgressAccessibilityLevel002
     * @tc.desc       : testing accessibilityLevel for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressAccessibilityLevel002', 0, async (done: Function) => {
      expect(nativeFunc.testProgressAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_ACCESSIBILITYLEVEL_0300
     * @tc.name       : testProgressAccessibilityLevel003
     * @tc.desc       : testing accessibilityLevel for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressAccessibilityLevel003', 0, async (done: Function) => {
      expect(nativeFunc.testProgressAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_ACCESSIBILITYLEVEL_0400
     * @tc.name       : testProgressAccessibilityLevel004
     * @tc.desc       : testing accessibilityLevel for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressAccessibilityLevel004', 0, async (done: Function) => {
      expect(nativeFunc.testProgressAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_ACCESSIBILITYLEVEL_0500
     * @tc.name       : testProgressAccessibilityLevel005
     * @tc.desc       : testing accessibilityLevel for Progress with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testProgressAccessibilityLevel005', 0, async (done: Function) => {
      expect(nativeFunc.testProgressAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_ACCESSIBILITYLEVEL_0600
     * @tc.name       : testProgressAccessibilityLevel006
     * @tc.desc       : testing accessibilityLevel for Progress with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testProgressAccessibilityLevel006', 0, async (done: Function) => {
      expect(nativeFunc.testProgressAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
