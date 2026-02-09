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

export default function customComponentAlignTest() {

  describe('CustomComponentAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomComponentAlign001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0100
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0200
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0300
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0400
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0500
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign006
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0600
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign007
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0700
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign008
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0800
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign009
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0900
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign010
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_1000
     * @tc.desc   testing align for button with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentAlign011
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_1100
     * @tc.desc   testing align for button with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentAlign011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign011()).assertEqual(0)
      done()
    })

  })
}
