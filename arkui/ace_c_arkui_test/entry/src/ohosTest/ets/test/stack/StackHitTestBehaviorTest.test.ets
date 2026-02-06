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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function stackHitTestBehaviorTest() {

  describe('StackHitTestBehaviorTest', () => {

    let PAGE_TAG = 'StackHitTestBehaviorTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`stack/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_HITTESTBEHAVIOR_0100
    * @tc.name       : testStackHitTestBehavior001
    * @tc.desc       : testing HitTestBehavior for stack with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackHitTestBehavior001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackBrotherDefault')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchStackDefault').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestStackBrotherDefault').$attrs.backgroundColor)
        .assertEqual('#FF000000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_HITTESTBEHAVIOR_0200
    * @tc.name       : testStackHitTestBehavior002
    * @tc.desc       : testing HitTestBehavior for stack with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackHitTestBehavior002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackBrotherBlock')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestStackBlock').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestStackBrotherBlock').$attrs.backgroundColor)
        .assertEqual('#FF000000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_HITTESTBEHAVIOR_0300
    * @tc.name       : testStackHitTestBehavior003
    * @tc.desc       : testing HitTestBehavior for stack with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackHitTestBehavior003', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackBrotherTransparent')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestStackTransparent').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestStackBrotherTransparent').$attrs.backgroundColor)
        .assertEqual('#FF000000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_HITTESTBEHAVIOR_0400
    * @tc.name       : testStackHitTestBehavior004
    * @tc.desc       : testing HitTestBehavior for stack with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackHitTestBehavior004', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackBrotherNone')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestStackNone').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestStackBrotherNone').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_HITTESTBEHAVIOR_0500
    * @tc.name       : testStackHitTestBehavior005
    * @tc.desc       : testing HitTestBehavior for stack with abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStackHitTestBehavior005', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackBrotherExceptBelow')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestStackExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestStackBrotherExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FF000000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_HITTESTBEHAVIOR_0600
    * @tc.name       : testStackHitTestBehavior006
    * @tc.desc       : testing HitTestBehavior for stack with abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStackHitTestBehavior006', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackBrotherExceptAbove')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestStackExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestStackBrotherExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FF000000')
      done()
    })
  })
}