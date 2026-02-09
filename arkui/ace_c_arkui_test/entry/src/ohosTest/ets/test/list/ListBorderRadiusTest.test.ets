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

export default function listBorderRadiusTest() {

  describe('ListBorderRadiusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListBorderRadius001
     * @tc.number SUB_ARKUI_CAPI_LIST_BORDERRADIUS_0100
     * @tc.desc   testing borderRadius for list with unify the border width of the four edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBorderRadius001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderRadius001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListBorderRadius002
     * @tc.number SUB_ARKUI_CAPI_LIST_BORDERRADIUS_0200
     * @tc.desc   testing borderRadius for list with set the width of the borders on each side separately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBorderRadius002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderRadius002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListBorderRadius003
     * @tc.number SUB_ARKUI_CAPI_LIST_BORDERRADIUS_0300
     * @tc.desc   testing borderRadius for list with set the width of the borders on each side, with three values of 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBorderRadius003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderRadius003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListBorderRadius004
     * @tc.number SUB_ARKUI_CAPI_LIST_BORDERRADIUS_0400
     * @tc.desc   testing borderRadius for list with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBorderRadius004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderRadius004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListBorderRadius005
     * @tc.number SUB_ARKUI_CAPI_LIST_BORDERRADIUS_0500
     * @tc.desc   testing borderRadius for list with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBorderRadius005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderRadius005()).assertEqual(0)
      done()
    })
  })
}
