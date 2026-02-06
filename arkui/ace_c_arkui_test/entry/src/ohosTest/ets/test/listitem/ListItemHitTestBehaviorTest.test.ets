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

import {  describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function listItemHitTestBehaviorTest() {

  describe('ListItemHitTestBehaviorTest', () => {
    /*
    * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_HITTESTBEHAVIOR_0100
    * @tc.name       : testListHitTestBehavior001
    * @tc.desc       : test listItem hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListItemHitTestBehavior001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ListItemHitTestBehaviorDefaultTest';
      await Utils.pushPage(`listitem/${PAGE_TAG}`);
      await Utils.clickComponent('Default')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ColumnDefault').$attrs.backgroundColor)
        .assertEqual('#FF00FFFF')
      expect(Utils.getComponentInfoByKey('ListItemDefault').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_HITTESTBEHAVIOR_0200
    * @tc.name       : testListItemHitTestBehavior002
    * @tc.desc       : test listItem hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListItemHitTestBehavior002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ListItemHitTestBehaviorBlockTest';
      await Utils.pushPage(`listitem/${PAGE_TAG}`);
      await Utils.clickComponent('Block')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ColumnBlock').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('ListItemBlock').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_HITTESTBEHAVIOR_0300
    * @tc.name       : testListItemHitTestBehavior003
    * @tc.desc       : test listItem hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListItemHitTestBehavior003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ListItemHitTestBehaviorTransparentTest';
      await Utils.pushPage(`listitem/${PAGE_TAG}`);
      await Utils.clickComponent('Transparent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ColumnTransparent').$attrs.backgroundColor)
        .assertEqual('#FF00FFFF')
      expect(Utils.getComponentInfoByKey('ListItemTransparent').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_HITTESTBEHAVIOR_0400
    * @tc.name       : testListItemHitTestBehavior004
    * @tc.desc       : test listItem hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListItemHitTestBehavior004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ListItemHitTestBehaviorNoneTest';
      await Utils.pushPage(`listitem/${PAGE_TAG}`);
      await Utils.clickComponent('None')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ColumnNone').$attrs.backgroundColor)
        .assertEqual('#FF00FFFF')
      expect(Utils.getComponentInfoByKey('ListItemNone').$attrs.backgroundColor)
        .assertEqual('#FFFF11FF')
      done();
    })
  })
}