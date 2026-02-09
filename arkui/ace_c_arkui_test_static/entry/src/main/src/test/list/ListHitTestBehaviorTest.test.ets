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

import { describe, expect, it, afterEach, Level,beforeAll,beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function listHitTestBehaviorTest() {

  describe('ListHitTestBehaviorTest', () => {

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    
    
/**
     * @tc.number   testListHitTestBehavior001
     * @tc.name     testListHitTestBehavior001
     * @tc.desc     testListHitTestBehavior001
     * @tc.level    Level.LEVEL1
     */
    it('testListHitTestBehavior001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ListHitTestBehaviorDefaultTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.clickComponent('Default')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('ListDefault');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListBrotherDefault');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('ListItemDefault');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')
      done();
    })

    
    
/**
     * @tc.number   testListHitTestBehavior002
     * @tc.name     testListHitTestBehavior002
     * @tc.desc     testListHitTestBehavior002
     * @tc.level    Level.LEVEL1
     */
    it('testListHitTestBehavior002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ListHitTestBehaviorBlockTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.clickComponent('Block')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('ListBlock');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListBrotherBlock');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('ListItemBlock');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFF11FF')
      done();
    })

    
    
/**
     * @tc.number   testListHitTestBehavior003
     * @tc.name     testListHitTestBehavior003
     * @tc.desc     testListHitTestBehavior003
     * @tc.level    Level.LEVEL1
     */
    it('testListHitTestBehavior003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ListHitTestBehaviorTransparentTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.clickComponent('Transparent')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('ListTransparent');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListBrotherTransparent');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('ListItemTransparent');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FFFF')
      expect(obj3.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')
      done();
    })

    
    
/**
     * @tc.number   testListHitTestBehavior004
     * @tc.name     testListHitTestBehavior004
     * @tc.desc     testListHitTestBehavior004
     * @tc.level    Level.LEVEL1
     */
    it('testListHitTestBehavior004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ListHitTestBehaviorNoneTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.clickComponent('None')
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('ListNone');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListBrotherNone');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('ListItemNone');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FFFF')
      expect(obj3.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')
      done();
    })
  })
}