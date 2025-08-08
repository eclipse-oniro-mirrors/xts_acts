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

export default function listHitTestBehaviorTest() {

  describe('ListHitTestBehaviorTest', () => {
    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_HITTESTBEHAVIOR_0100
    * @tc.name       : testListHitTestBehavior001
    * @tc.desc       : test list hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListHitTestBehavior001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ListHitTestBehaviorDefaultTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.clickComponent('Default')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ListDefault').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('ListBrotherDefault').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('ListItemDefault').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_HITTESTBEHAVIOR_0200
    * @tc.name       : testListHitTestBehavior002
    * @tc.desc       : test list hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListHitTestBehavior002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ListHitTestBehaviorBlockTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.clickComponent('Block')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ListBlock').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('ListBrotherBlock').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('ListItemBlock').$attrs.backgroundColor)
        .assertEqual('#FFFF11FF')
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_HITTESTBEHAVIOR_0300
    * @tc.name       : testListHitTestBehavior003
    * @tc.desc       : test list hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListHitTestBehavior003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ListHitTestBehaviorTransparentTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.clickComponent('Transparent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ListTransparent').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('ListBrotherTransparent').$attrs.backgroundColor)
        .assertEqual('#FF00FFFF')
      expect(Utils.getComponentInfoByKey('ListItemTransparent').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_HITTESTBEHAVIOR_0400
    * @tc.name       : testListHitTestBehavior004
    * @tc.desc       : test list hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListHitTestBehavior004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ListHitTestBehaviorNoneTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.clickComponent('None')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ListNone').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('ListBrotherNone').$attrs.backgroundColor)
        .assertEqual('#FF00FFFF')
      expect(Utils.getComponentInfoByKey('ListItemNone').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })
  })
}