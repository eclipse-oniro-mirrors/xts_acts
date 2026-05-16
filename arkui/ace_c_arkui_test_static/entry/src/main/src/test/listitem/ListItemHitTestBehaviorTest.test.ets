'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { Driver } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
let libUtil:LibUtil = new LibUtil();

export default function listItemHitTestBehaviorTest() {

  describe('ListItemHitTestBehaviorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });
    
    
/**
     * @tc.number   testListItemHitTestBehavior001
     * @tc.name     testListItemHitTestBehavior001
     * @tc.desc     testListItemHitTestBehavior001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemHitTestBehavior001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ListItemHitTestBehaviorDefaultTest';
      await Utils.pushPage(`listitem/${PAGE_TAG}`);
      await Utils.clickComponent('Default')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('ColumnDefault');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListItemDefault');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FFFF')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')
      done();
    })

    
    
/**
     * @tc.number   testListItemHitTestBehavior002
     * @tc.name     testListItemHitTestBehavior002
     * @tc.desc     testListItemHitTestBehavior002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemHitTestBehavior002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ListItemHitTestBehaviorBlockTest';
      await Utils.pushPage(`listitem/${PAGE_TAG}`);
      await Utils.clickComponent('Block')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('ColumnBlock');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListItemBlock');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')
      done();
    })

    
    
/**
     * @tc.number   testListItemHitTestBehavior003
     * @tc.name     testListItemHitTestBehavior003
     * @tc.desc     testListItemHitTestBehavior003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemHitTestBehavior003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ListItemHitTestBehaviorTransparentTest';
      await Utils.pushPage(`listitem/${PAGE_TAG}`);
      await Utils.clickComponent('Transparent')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('ColumnTransparent');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListItemTransparent');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FFFF')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')
      done();
    })

    
    
/**
     * @tc.number   testListItemHitTestBehavior004
     * @tc.name     testListItemHitTestBehavior004
     * @tc.desc     testListItemHitTestBehavior004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemHitTestBehavior004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ListItemHitTestBehaviorNoneTest';
      await Utils.pushPage(`listitem/${PAGE_TAG}`);
      await Utils.clickComponent('None')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('ColumnNone');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListItemNone');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FFFF')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFF11FF')
      done();
    })
  })
}