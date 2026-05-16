'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function LongPressGestureLongClickTest() {
  describe('LongPressGestureLongClickTest', () => {

    await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")


    const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      console.info("LongPressGestureLongClickTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LongPressGesture/LongPressGestureLongClick',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get LongPressGestureLongClickTest state pages:" + JSON.stringify(pages));
        if (!("LongPressGestureLongClick" == pages.name)) {
          console.info("get LongPressGestureLongClickTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push LongPressGestureLongClickTest page error:" + err);
      }
      console.info("LongPressGestureLongClickTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("LongPressGestureLongClickTest after each called");
    });


    
    /**
     * @tc.number   LongPressGestureLongClickTest_static_0010
     * @tc.name     LongPressGestureLongClickTest_static_0010
     * @tc.desc     LongPressGestureLongClickTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('LongPressGestureLongClickTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LongPressGestureLongClickTest_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX: number = AppStorage.get<number>("winLeft") as number
      let windowOffsetY: number = AppStorage.get<number>("winTop") as number
      console.log('LongPressGestureLongClickTest_0010 windowOffsetX and windowOffsetY', windowOffsetX, windowOffsetY)
      let FatherObj = CommonFunc.getComponentRectOnScreen('LongPressGestureLongClick_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('LongPressGestureLongClickTest_0010 FatherObj', FatherObj.left, FatherObj.top, FatherObj.right,
        FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('LongPressGestureLongClick_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('LongPressGestureLongClickTest_0010 areaObj', areaObj.left, areaObj.top, areaObj.right,
        areaObj.bottom)
      console.log('LongPressGestureLongClickTest_0010 areaObj clicked', Math.round(areaObj.left + areaWidth / 2),
        Math.round(areaObj.top + areaHeight / 2))

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth / 2) as Int,
        Math.round(areaObj.top + areaHeight / 2) as Int);
      await CommonFunc.sleep(3000);

      let text1 = inspector.getInspectorByKey('LongPressGestureLongClick_repeat');
      let obj1 = JSON.parseJsonElement(text1);
      console.log('LongPressGestureLongClickTest_0010 obj1 $attrs content',
        obj1.getElement('$attrs').getString('content'), obj1)
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('repeat:false');

      await CommonFunc.sleep(200);
      let text2 = inspector.getInspectorByKey('LongPressGestureLongClick_offsetX');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('LongPressGestureLongClickTest_0010 obj2 $attrs content',
        obj2.getElement('$attrs').getString('content'), obj2)
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('offsetX:0');

      await CommonFunc.sleep(200);
      let text3 = inspector.getInspectorByKey('LongPressGestureLongClick_offsetY');
      let obj3 = JSON.parseJsonElement(text3);
      console.log('LongPressGestureLongClickTest_0010 obj3 $attrs content',
        obj3.getElement('$attrs').getString('content'), obj3)
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('offsetY:0');

      await CommonFunc.sleep(200);
      let text4 = inspector.getInspectorByKey('LongPressGestureLongClick_angle');
      let obj4 = JSON.parseJsonElement(text4);
      console.log('LongPressGestureLongClickTest_0010 obj4 $attrs content',
        obj4.getElement('$attrs').getString('content'), obj4)
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('angle:0');

      await CommonFunc.sleep(200);
      let text5 = inspector.getInspectorByKey('LongPressGestureLongClick_scale');
      let obj5 = JSON.parseJsonElement(text5);
      console.log('LongPressGestureLongClickTest_0010 obj5 $attrs content',
        obj5.getElement('$attrs').getString('content'), obj5)
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('scale:1');

      await CommonFunc.sleep(200);
      let text6 = inspector.getInspectorByKey('LongPressGestureLongClick_pinchCenterX');
      let obj6 = JSON.parseJsonElement(text6);
      console.log('LongPressGestureLongClickTest_0010 obj6 $attrs content',
        obj6.getElement('$attrs').getString('content'), obj6)
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('pinchCenterX:0');

      await CommonFunc.sleep(200);
      let text7 = inspector.getInspectorByKey('LongPressGestureLongClick_pinchCenterY');
      let obj7 = JSON.parseJsonElement(text7);
      console.log('LongPressGestureLongClickTest_0010 obj7 $attrs content',
        obj7.getElement('$attrs').getString('content'), obj7)
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('pinchCenterY:0');

      await CommonFunc.sleep(200);
      let text8 = inspector.getInspectorByKey('LongPressGestureLongClick_speed');
      let obj8 = JSON.parseJsonElement(text8);
      console.log('LongPressGestureLongClickTest_0010 obj8 $attrs content',
        obj8.getElement('$attrs').getString('content'), obj8)
      expect(obj8.getElement('$attrs').getString('content')).assertEqual('speed:0');

      await CommonFunc.sleep(200);
      let text9 = inspector.getInspectorByKey('LongPressGestureLongClick_fingerList_id');
      let obj9 = JSON.parseJsonElement(text9);
      console.log('LongPressGestureLongClickTest_0010 obj9 $attrs content',
        obj9.getElement('$attrs').getString('content'), obj9)
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('fingerList_id:0');

      await CommonFunc.sleep(200);
      let text10 = inspector.getInspectorByKey('LongPressGestureLongClick_fingerList_globalX');
      let obj10 = JSON.parseJsonElement(text10);
      console.log('LongPressGestureLongClickTest_0010 obj10 $attrs content',
        uiContext.vp2px(Number(obj10.getElement('$attrs').getString('content'))),
        Math.round(areaObj.left + areaWidth / 2) - windowOffsetX)
      console.log('LongPressGestureLongClickTest_0010 obj10 $attrs fingerList_globalX',
        obj10.getElement('$attrs').getString('content'), Number(obj10.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj10.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj10.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj.left + areaWidth / 2) - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text11 = inspector.getInspectorByKey('LongPressGestureLongClick_fingerList_globalY');
      let obj11 = JSON.parseJsonElement(text11);
      console.log('LongPressGestureLongClickTest_0010 obj11 $attrs content',
        uiContext.vp2px(Number(obj11.getElement('$attrs').getString('content'))),
        Math.round(areaObj.top + areaHeight / 2) - windowOffsetY)
      console.log('LongPressGestureLongClickTest_0010 obj11 $attrs fingerList_globalY',
        obj11.getElement('$attrs').getString('content'), Number(obj11.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj11.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj11.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj.top + areaHeight / 2) - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text12 = inspector.getInspectorByKey('LongPressGestureLongClick_fingerList_localX');
      let obj12 = JSON.parseJsonElement(text12);
      console.log('LongPressGestureLongClickTest_0010 obj12 $attrs content',
        uiContext.vp2px(Number(obj12.getElement('$attrs').getString('content'))),
        Math.round(areaObj.left + areaWidth / 2) - areaObj.left)
      console.log('LongPressGestureLongClickTest_0010 obj12 $attrs fingerList_localX',
        obj12.getElement('$attrs').getString('content'), Number(obj12.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj12.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj12.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj.left + areaWidth / 2) - areaObj.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text13 = inspector.getInspectorByKey('LongPressGestureLongClick_fingerList_localY');
      let obj13 = JSON.parseJsonElement(text13);
      console.log('LongPressGestureLongClickTest_0010 obj13 $attrs content',
        uiContext.vp2px(Number(obj13.getElement('$attrs').getString('content'))),
        Math.round(areaObj.top + areaHeight / 2) - areaObj.top)
      console.log('LongPressGestureLongClickTest_0010 obj13 $attrs fingerList_localY',
        obj13.getElement('$attrs').getString('content'), Number(obj13.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj13.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj13.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj.top + areaHeight / 2) - areaObj.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text16 = inspector.getInspectorByKey('LongPressGestureLongClick_target_area_width');
      let obj16 = JSON.parseJsonElement(text16);
      console.log('LongPressGestureLongClickTest_0010 obj16 $attrs content',
        obj16.getElement('$attrs').getString('content'),
        uiContext.vp2px(Number(obj16.getElement('$attrs').getString('content'))), uiContext.vp2px(240))
      expect(Math.abs(uiContext.vp2px(Number(obj16.getElement('$attrs').getString('content'))) -
      uiContext.vp2px(240)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text17 = inspector.getInspectorByKey('LongPressGestureLongClick_target_area_height');
      let obj17 = JSON.parseJsonElement(text17);
      console.log('LongPressGestureLongClickTest_0010 obj17 $attrs content',
        obj17.getElement('$attrs').getString('content'),
        uiContext.vp2px(Number(obj17.getElement('$attrs').getString('content'))), uiContext.vp2px(80))
      expect(Math.abs(uiContext.vp2px(Number(obj17.getElement('$attrs').getString('content'))) - uiContext.vp2px(80)) <=
        1).assertTrue();

      await CommonFunc.sleep(200);
      let text18 = inspector.getInspectorByKey('LongPressGestureLongClick_target_area_position_x');
      let obj18 = JSON.parseJsonElement(text18);
      console.log('LongPressGestureLongClickTest_0010 obj18 $attrs content',
        uiContext.vp2px(Number(obj18.getElement('$attrs').getString('content'))), areaObj.left - FatherObj.left)
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj18.getElement('$attrs').getString('content')))) -
        (areaObj.left - FatherObj.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text19 = inspector.getInspectorByKey('LongPressGestureLongClick_target_area_position_y');
      let obj19 = JSON.parseJsonElement(text19);
      console.log('LongPressGestureLongClickTest_0010 obj19 $attrs content',
        uiContext.vp2px(Number(obj19.getElement('$attrs').getString('content'))), areaObj.top - FatherObj.top)
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj19.getElement('$attrs').getString('content')))) -
        (areaObj.top - FatherObj.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text20 = inspector.getInspectorByKey('LongPressGestureLongClick_target_area_globalPosition_x');
      let obj20 = JSON.parseJsonElement(text20);
      console.log('LongPressGestureLongClickTest_0010 obj20 $attrs content',
        uiContext.vp2px(Number(obj20.getElement('$attrs').getString('content'))), areaObj.left - windowOffsetX)
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj20.getElement('$attrs').getString('content')))) -
        (areaObj.left - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text21 = inspector.getInspectorByKey('LongPressGestureLongClick_target_area_globalPosition_y');
      let obj21 = JSON.parseJsonElement(text21);
      console.log('LongPressGestureLongClickTest_0010 obj21 $attrs content',
        uiContext.vp2px(Number(obj21.getElement('$attrs').getString('content'))), areaObj.top - windowOffsetY)
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj21.getElement('$attrs').getString('content')))) -
        (areaObj.top - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text22 = inspector.getInspectorByKey('LongPressGestureLongClick_source');
      let obj22 = JSON.parseJsonElement(text22);
      console.log('LongPressGestureLongClickTest_0010 obj22 $attrs content',
        obj22.getElement('$attrs').getString('content'), obj22)
      expect(obj22.getElement('$attrs').getString('content')).assertEqual('source:2');

      await CommonFunc.sleep(200);
      let text23 = inspector.getInspectorByKey('LongPressGestureLongClick_pressure');
      let obj23 = JSON.parseJsonElement(text23);
      console.log('LongPressGestureLongClickTest_0010 obj23 $attrs content',
        obj23.getElement('$attrs').getString('content'), obj23)
      expect(obj23.getElement('$attrs').getString('content')).assertEqual('pressure:0');

      await CommonFunc.sleep(200);
      let text24 = inspector.getInspectorByKey('LongPressGestureLongClick_tiltX');
      let obj24 = JSON.parseJsonElement(text24);
      console.log('LongPressGestureLongClickTest_0010 obj24 $attrs content',
        obj24.getElement('$attrs').getString('content'), obj24)
      expect(obj24.getElement('$attrs').getString('content')).assertEqual('tiltX:0');

      await CommonFunc.sleep(200);
      let text25 = inspector.getInspectorByKey('LongPressGestureLongClick_tiltY');
      let obj25 = JSON.parseJsonElement(text25);
      console.log('LongPressGestureLongClickTest_0010 obj25 $attrs content',
        obj25.getElement('$attrs').getString('content'), obj25)
      expect(obj25.getElement('$attrs').getString('content')).assertEqual('tiltY:0');

      await CommonFunc.sleep(200);
      let text26 = inspector.getInspectorByKey('LongPressGestureLongClick_sourceTool');
      let obj26 = JSON.parseJsonElement(text26);
      console.log('LongPressGestureLongClickTest_0010 obj26 $attrs content',
        obj26.getElement('$attrs').getString('content'), obj26)
      expect(obj26.getElement('$attrs').getString('content')).assertEqual('sourceTool:Finger');

      await CommonFunc.sleep(200);
      let text27 = inspector.getInspectorByKey('LongPressGestureLongClick_velocityX');
      let obj27 = JSON.parseJsonElement(text27);
      console.log('LongPressGestureLongClickTest_0010 obj27 $attrs content',
        obj27.getElement('$attrs').getString('content'), obj27)
      expect(obj27.getElement('$attrs').getString('content')).assertEqual('velocityX:0');

      await CommonFunc.sleep(200);
      let text28 = inspector.getInspectorByKey('LongPressGestureLongClick_velocityY');
      let obj28 = JSON.parseJsonElement(text28);
      console.log('LongPressGestureLongClickTest_0010 obj28 $attrs content',
        obj28.getElement('$attrs').getString('content'), obj28)
      expect(obj28.getElement('$attrs').getString('content')).assertEqual('velocityY:0');

      await CommonFunc.sleep(200);
      let text29 = inspector.getInspectorByKey('LongPressGestureLongClick_velocity');
      let obj29 = JSON.parseJsonElement(text29);
      console.log('LongPressGestureLongClickTest_0010 obj29 $attrs content',
        obj29.getElement('$attrs').getString('content'), obj29)
      expect(obj29.getElement('$attrs').getString('content')).assertEqual('velocity:0');

      console.info('LongPressGestureLongClickTest_0010 END');
      done();
    });
  })
}
