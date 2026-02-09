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

export default function listLinearGradientTest() {

  describe('ListLinearGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListLinearGradient001
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0100
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient002
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0200
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient003
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0300
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient004
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0400
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient005
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0500
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient006
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0600
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient007
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0700
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient008
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0800
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient009
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_0900
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListLinearGradient010
     * @tc.number SUB_ARKUI_CAPI_LIST_LINEARGRADIENT_1000
     * @tc.desc   testing linearGradient for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListLinearGradient010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListLinearGradient010()).assertEqual(0)
      done()
    })
  })
}
