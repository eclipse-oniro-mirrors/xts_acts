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

export default function ListSwipeActionItemTest() {

  describe('ListSwipeActionItemTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_0100
     * @tc.name       : testListSwipeAction001
     * @tc.desc       : testing swipeAction create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSwipeAction001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeActionCreate()).assertEqual(1)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_0200
     * @tc.name       : testListSwipeAction002
     * @tc.desc       : testing swipeAction create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListSwipeAction002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeActionSetActionAreaDistance001()).assertEqual(0);
      done()
    })

     /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_003
     * @tc.name       : testListSwipeAction003
     * @tc.desc       : testing swipeAction setEdgeEffect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListSwipeAction003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeActionOptionEdgeEffect()).assertEqual(0)
      done()
    })

     /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_0007
     * @tc.name       : testListSwipeAction004
     * @tc.desc       : testing swipeAction setOnAction
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListSwipeAction004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeActionItem007()).assertEqual(1)
      done()
    })

     /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_0006
     * @tc.name       : testListSwipeAction005
     * @tc.desc       : testing swipeAction setcontent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListSwipeAction005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeActionItem006()).assertEqual(1)
      done()
    })
    
     /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_OptionCreate
     * @tc.name       : testListSwipeAction006
     * @tc.desc       : testing swipeActionOption create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListSwipeAction006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeActionOptionCreate()).assertEqual(1);
      done()
    })
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_OptionCreate
     * @tc.name       : testListSwipeAction007
     * @tc.desc       : testing swipeActionOption create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListSwipeAction007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeActionItem008()).assertEqual(1);
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_OptionCreate
     * @tc.name       : testListSwipeAction008
     * @tc.desc       : testing swipeActionOption create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListSwipeAction008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeActionItem009()).assertEqual(1);
      done()
    })

  })
}
