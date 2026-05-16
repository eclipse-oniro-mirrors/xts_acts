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

export default function listItemBorderColorTest() {

  describe('ListItemBorderColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListItemBorderColor001
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERCOLOR_0100
     * @tc.desc   testing borderColor for listItem with unify the border width of the four edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderColor002
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERCOLOR_0200
     * @tc.desc   testing borderColor for listItem with set the width of the borders on each side separately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderColor002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemBorderColor003
     * @tc.number SUB_ARKUI_CAPI_LISTITEM_BORDERCOLOR_0300
     * @tc.desc   testing borderColor for listItem with set the width of the borders on each side, with three values of 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemBorderColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemBorderColor003()).assertEqual(0)
      done()
    })
  })
}
