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

export default function refreshAccessibilityLevelTest() {

  describe('RefreshAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testRefreshAccessibilityLevel001
     * @tc.number SUB_ARKUI_CAPI_REFRESH_ACCESSIBILITYLEVEL_0100
     * @tc.desc   testing accessibilityLevel for Refresh with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testRefreshAccessibilityLevel002
     * @tc.number SUB_ARKUI_CAPI_REFRESH_ACCESSIBILITYLEVEL_0200
     * @tc.desc   testing accessibilityLevel for Refresh with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testRefreshAccessibilityLevel003
     * @tc.number SUB_ARKUI_CAPI_REFRESH_ACCESSIBILITYLEVEL_0300
     * @tc.desc   testing accessibilityLevel for Refresh with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testRefreshAccessibilityLevel004
     * @tc.number SUB_ARKUI_CAPI_REFRESH_ACCESSIBILITYLEVEL_0400
     * @tc.desc   testing accessibilityLevel for Refresh with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testRefreshAccessibilityLevel005
     * @tc.number SUB_ARKUI_CAPI_REFRESH_ACCESSIBILITYLEVEL_0500
     * @tc.desc   testing accessibilityLevel for Refresh with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testRefreshAccessibilityLevel006
     * @tc.number SUB_ARKUI_CAPI_REFRESH_ACCESSIBILITYLEVEL_0600
     * @tc.desc   testing accessibilityLevel for Refresh with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
