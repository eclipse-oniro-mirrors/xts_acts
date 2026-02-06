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

export default function textAccessibilityLevelTest() {

  describe('TextAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYLEVEL_0100
     * @tc.name       : testTextAccessibilityLevel001
     * @tc.desc       : testing accessibilityLevel for Text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYLEVEL_0200
     * @tc.name       : testTextAccessibilityLevel002
     * @tc.desc       : testing accessibilityLevel for Text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYLEVEL_0300
     * @tc.name       : testTextAccessibilityLevel003
     * @tc.desc       : testing accessibilityLevel for Text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYLEVEL_0400
     * @tc.name       : testTextAccessibilityLevel004
     * @tc.desc       : testing accessibilityLevel for Text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYLEVEL_0500
     * @tc.name       : testTextAccessibilityLevel005
     * @tc.desc       : testing accessibilityLevel for Text with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYLEVEL_0600
     * @tc.name       : testTextAccessibilityLevel006
     * @tc.desc       : testing accessibilityLevel for Text with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
