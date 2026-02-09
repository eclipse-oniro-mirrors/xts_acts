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

export default function toggleAccessibilityLevelTest() {

  describe('ToggleAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testToggleAccessibilityLevel001
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYLEVEL_0100
     * @tc.desc   testing accessibilityLevel for Toggle with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleAccessibilityLevel002
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYLEVEL_0200
     * @tc.desc   testing accessibilityLevel for Toggle with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleAccessibilityLevel003
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYLEVEL_0300
     * @tc.desc   testing accessibilityLevel for Toggle with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleAccessibilityLevel004
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYLEVEL_0400
     * @tc.desc   testing accessibilityLevel for Toggle with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleAccessibilityLevel005
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYLEVEL_0500
     * @tc.desc   testing accessibilityLevel for Toggle with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleAccessibilityLevel006
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ACCESSIBILITYLEVEL_0600
     * @tc.desc   testing accessibilityLevel for Toggle with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
