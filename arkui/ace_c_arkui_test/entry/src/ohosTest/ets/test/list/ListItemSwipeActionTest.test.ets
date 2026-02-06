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

export default function listItemSwipeActionTest() {

  describe('ListItemSwipeActionTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_SWIPE_ACTION_0001
     * @tc.name       : testListItemSwipeAction001
     * @tc.desc       : testing item swipe action for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSwipeAction001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemSwipeAction001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_SWIPE_ACTION_0002
     * @tc.name       : testListItemSwipeAction002
     * @tc.desc       : testing item swipe action for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSwipeAction002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemSwipeAction002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_SWIPE_ACTION_0003
     * @tc.name       : testListItemSwipeAction003
     * @tc.desc       : testing item swipe action for list with resetAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSwipeAction003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemSwipeAction003()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_SWIPE_ACTION_0004
     * @tc.name       : testListItemSwipeAction004
     * @tc.desc       : testing item swipe action for list with OH_ArkUI_ListItemSwipeActionOption_Dispose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSwipeAction004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemSwipeAction004()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_SWIPE_ACTION_0005
     * @tc.name       : testListItemSwipeAction005
     * @tc.desc       : testing item swipe action for list with SetEdgeEffect GetEdgeEffect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSwipeAction005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemSwipeAction005()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_SWIPE_ACTION_0006
     * @tc.name       : testListItemSwipeAction006
     * @tc.desc       : testing item swipe action for list with SetEdgeEffect GetEdgeEffect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSwipeAction006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemSwipeAction006()).assertEqual(0)
      done()
    })
  })
}
