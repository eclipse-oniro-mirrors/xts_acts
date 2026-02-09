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

export default function commonAttrsVisibilityTest() {

  describe('CommonAttrsVisibilityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsVisibility001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_VISIBILITY_0100
     * @tc.desc   testing visibility for commonAttrs with valid value VISIBLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsVisibility001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsVisibility001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsVisibility002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_VISIBILITY_0200
     * @tc.desc   testing visibility for commonAttrs with valid value HIDDEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsVisibility002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsVisibility002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsVisibility003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_VISIBILITY_0300
     * @tc.desc   testing visibility for commonAttrs with valid value NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsVisibility003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsVisibility003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsVisibility004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_VISIBILITY_0400
     * @tc.desc   testing visibility for commonAttrs with invalid value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsVisibility004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsVisibility004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsVisibility005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_VISIBILITY_0500
     * @tc.desc   testing visibility for commonAttrs with invalid value 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsVisibility005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsVisibility005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsVisibility006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_VISIBILITY_0600
     * @tc.desc   testing resetAttribute visibility for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsVisibility006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsVisibility006()).assertEqual(0)
      done()
    })
  })
}
