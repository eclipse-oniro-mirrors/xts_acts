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

export default function customComponentHitTestBehaviorTest() {

  describe('CustomComponentHitTestBehaviorTest', () => {

    let PAGE_TAG = 'CustomComponentHitTestBehaviorTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCustomComponentHitTestBehavior001
     * @tc.name     testCustomComponentHitTestBehavior001
     * @tc.desc     testCustomComponentHitTestBehavior001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentHitTestBehavior001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnTouchTestStackDefault')
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('OnTouchTestCustomComponentDefault');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('OnTouchTestCustomComponentBrotherDefault');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('OnTouchTestColumnDefault');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj1.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF0000FF')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')

      await Utils.clickComponent('OnTouchTestStackBlock')
      await Utils.sleep(1000)
      let strJson4 = inspector.getInspectorByKey('OnTouchTestCustomComponentBlock');
      let obj4 = JSON.parseJsonElement(strJson4);
      let strJson5 = inspector.getInspectorByKey('OnTouchTestCustomComponentBrotherBlock');
      let obj5 = JSON.parseJsonElement(strJson5);
      let strJson6 = inspector.getInspectorByKey('OnTouchTestColumnBlock');
      let obj6 = JSON.parseJsonElement(strJson6);
      expect(obj4.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF0000FF')
      expect(obj5.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')
      expect(obj6.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFF11FF')

      await Utils.clickComponent('OnTouchTestStackTransparent')
      await Utils.sleep(1000)
      let strJson7 = inspector.getInspectorByKey('OnTouchTestCustomComponentTransparent');
      let obj7 = JSON.parseJsonElement(strJson7);
      let strJson8 = inspector.getInspectorByKey('OnTouchTestCustomComponentBrotherTransparent');
      let obj8 = JSON.parseJsonElement(strJson8);
      let strJson9 = inspector.getInspectorByKey('OnTouchTestColumnTransparent');
      let obj9 = JSON.parseJsonElement(strJson9);
      expect(obj7.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF0000FF')
      expect(obj8.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF000000')
      expect(obj9.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')

      await Utils.clickComponent('OnTouchTestStackNone')
      await Utils.sleep(1000)
      let strJson10 = inspector.getInspectorByKey('OnTouchTestCustomComponentNone');
      let obj10 = JSON.parseJsonElement(strJson10);
      let strJson11 = inspector.getInspectorByKey('OnTouchTestCustomComponentBrotherNone');
      let obj11 = JSON.parseJsonElement(strJson11);
      let strJson12 = inspector.getInspectorByKey('OnTouchTestColumnNone');
      let obj12 = JSON.parseJsonElement(strJson12);
      expect(obj10.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFF0000')
      expect(obj11.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF000000')
      expect(obj12.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')

      await Utils.clickComponent('OnTouchTestStackExceptBelow')
      await Utils.sleep(1000)
      let strJson13 = inspector.getInspectorByKey('OnTouchTestCustomComponentExceptBelow');
      let obj13 = JSON.parseJsonElement(strJson13);
      let strJson14 = inspector.getInspectorByKey('OnTouchTestCustomComponentBrotherExceptBelow');
      let obj14 = JSON.parseJsonElement(strJson14);
      let strJson15 = inspector.getInspectorByKey('OnTouchTestColumnExceptBelow');
      let obj15 = JSON.parseJsonElement(strJson15);
      expect(obj13.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF0000FF')
      expect(obj14.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')
      expect(obj15.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')

      await Utils.clickComponent('OnTouchTestStackExceptAbove')
      await Utils.sleep(1000)
      let strJson16 = inspector.getInspectorByKey('OnTouchTestCustomComponentExceptAbove');
      let obj16 = JSON.parseJsonElement(strJson16);
      let strJson17 = inspector.getInspectorByKey('OnTouchTestCustomComponentBrotherExceptAbove');
      let obj17 = JSON.parseJsonElement(strJson17);
      let strJson18 = inspector.getInspectorByKey('OnTouchTestColumnExceptAbove');
      let obj18 = JSON.parseJsonElement(strJson18);
      expect(obj16.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF0000FF')
      expect(obj17.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')
      expect(obj18.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFFFFFF')
      done()
    })
  })
}