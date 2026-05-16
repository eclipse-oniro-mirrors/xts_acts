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

export default function listAccessibilityLevelTest() {

  describe('ListAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListAccessibilityLevel001
     * @tc.number SUB_ARKUI_CAPI_LIST_ACCESSIBILITYLEVEL_0100
     * @tc.desc   testing accessibilityLevel for List with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListAccessibilityLevel002
     * @tc.number SUB_ARKUI_CAPI_LIST_ACCESSIBILITYLEVEL_0200
     * @tc.desc   testing accessibilityLevel for List with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListAccessibilityLevel003
     * @tc.number SUB_ARKUI_CAPI_LIST_ACCESSIBILITYLEVEL_0300
     * @tc.desc   testing accessibilityLevel for List with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListAccessibilityLevel004
     * @tc.number SUB_ARKUI_CAPI_LIST_ACCESSIBILITYLEVEL_0400
     * @tc.desc   testing accessibilityLevel for List with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListAccessibilityLevel005
     * @tc.number SUB_ARKUI_CAPI_LIST_ACCESSIBILITYLEVEL_0500
     * @tc.desc   testing accessibilityLevel for List with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListAccessibilityLevel006
     * @tc.number SUB_ARKUI_CAPI_LIST_ACCESSIBILITYLEVEL_0600
     * @tc.desc   testing accessibilityLevel for List with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
