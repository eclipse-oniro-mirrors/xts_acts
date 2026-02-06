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

export default function listItemBorderWidthTest() {

  describe('ListItemBorderWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListItemBorderWidth001
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERWIDTH_0100
     * @tc.desc   testing borderWidth for listItem with unify the border width of the four edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderWidth001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderWidth002
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERWIDTH_0200
     * @tc.desc   testing borderWidth for listItem with set the width of the borders on each side separately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderWidth002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderWidth003
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERWIDTH_0300
     * @tc.desc   testing borderWidth for listItem with set the width of the borders on each side, with three values of 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderWidth003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderWidth003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderWidth004
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERWIDTH_0400
     * @tc.desc   testing borderWidth for listItem with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderWidth004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderWidth004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderWidth005
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERWIDTH_0500
     * @tc.desc   testing borderWidth for listItem with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderWidth005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderWidth005()).assertEqual(0)
      done()
    })
  })
}
