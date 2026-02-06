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

export default function toggleMarginTest() {

  describe('ToggleMarginTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testToggleMargin001
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_MARGIN_0100
     * @tc.desc   testing margin for toggle with normal value (positive number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleMargin001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleMargin001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleMargin002
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_MARGIN_0200
     * @tc.desc   testing margin for toggle with normal value (negative number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleMargin002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleMargin002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleMargin003
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_MARGIN_0300
     * @tc.desc   testing margin for toggle with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleMargin003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleMargin003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleMargin004
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_MARGIN_0400
     * @tc.desc   testing margin for toggle with normal value (positive number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleMargin004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleMargin004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleMargin005
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_MARGIN_0500
     * @tc.desc   testing margin for toggle with normal value (negative number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleMargin005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleMargin005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testToggleMargin006
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_MARGIN_0600
     * @tc.desc   testing margin for toggle with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleMargin006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleMargin006()).assertEqual(0)
      done()
    })

  })
}
