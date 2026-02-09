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

export default function listItemLinearGradientTest() {

  describe('ListItemLinearGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });
    /**
     * @tc.name   testListItemLinearGradient001
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0100
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient002
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0200
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient003
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0300
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient004
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0400
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient005
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0500
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient006
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0600
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient007
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0700
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient008
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0800
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient009
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_0900
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemLinearGradient010
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_LINEARGRADIENT_1000
     * @tc.desc   testing linearGradient for listItem with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemLinearGradient010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemLinearGradient010()).assertEqual(0)
      done()
    })
  })
}
