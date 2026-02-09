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

export default function listItemBorderRadiusTest() {

  describe('ListItemBorderRadiusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListItemBorderRadius001
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERRADIUS_0100
     * @tc.desc   testing borderRadius for listItem with unify the border width of the four edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderRadius001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderRadius001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderRadius002
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERRADIUS_0200
     * @tc.desc   testing borderRadius for listItem with set the width of the borders on each side separately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderRadius002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderRadius002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderRadius003
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERRADIUS_0300
     * @tc.desc   testing borderRadius for listItem with set the width of the borders on each side, with three values of 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderRadius003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderRadius003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderRadius004
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERRADIUS_0400
     * @tc.desc   testing borderRadius for listItem with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderRadius004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderRadius004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderRadius005
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERRADIUS_0500
     * @tc.desc   testing borderRadius for listItem with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderRadius005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderRadius005()).assertEqual(0)
      done()
    })
  })
}
