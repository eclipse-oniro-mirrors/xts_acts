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
  Point,
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


export default function PanGestureExample03Test() {
  describe('PanGestureExample03Test', () => {
    
    await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
    

    const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      console.info("PanGestureExample03Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/PanGestureExample03',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get PanGestureExample03Test state pages:" + JSON.stringify(pages));
        if (!("PanGestureExample03" == pages.name)) {
          console.info("get PanGestureExample03Test pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PanGestureExample03Test page error:" + err);
      }
      console.info("PanGestureExample03Test beforeEach end");
      // done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("PanGestureExample03Test after each called");
    });


    
    
/**
     * @tc.number   PanGestureExample03Test_static_0010
     * @tc.name     PanGestureExample03Test_static_0010
     * @tc.desc     PanGestureExample03Test_static_0010
     * @tc.level    Level.LEVEL0
     */
it('PanGestureExample03Test_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PanGestureExample03Test_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX: number = AppStorage.get<number>("winLeft") as number
      let windowOffsetY: number = AppStorage.get<number>("winTop") as number
      console.log('PanGestureExample03Test_0010 windowOffsetX and windowOffsetY', windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('PanGestureExample03_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('PanGestureExample03Test_0010 areaObj1 start', areaObj1.left, areaObj1.top, areaObj1.right,
        areaObj1.bottom)
      console.log('PanGestureExample03Test_0010 areaObj1 clicked finger[0] start',
        Math.round(areaObj1.left + areaWidth1 * 0.2), Math.round(areaObj1.top + areaHeight1 / 2))
      console.log('PanGestureExample03Test_0010 areaObj1 clicked finger[0] end',
        Math.round(areaObj1.left + areaWidth1 * 0.7), Math.round(areaObj1.top + areaHeight1 / 2))
      console.log('PanGestureExample03Test_0010 areaObj1 clicked finger[1] start',
        Math.round(areaObj1.left + areaWidth1 * 0.3), Math.round(areaObj1.top + areaHeight1 / 2))
      console.log('PanGestureExample03Test_0010 areaObj1 clicked finger[1] end',
        Math.round(areaObj1.left + areaWidth1 * 0.8), Math.round(areaObj1.top + areaHeight1 / 2))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointers: PointerMatrix = PointerMatrix.create(2, 2);
      pointers.setPoint(0, 0, {
        x: Math.round(areaObj1.left + areaWidth1 * 0.2) as Int,
        y: Math.round(areaObj1.top + areaHeight1 / 2) as Int
      } as Point);
      await CommonFunc.sleep(1000);
      pointers.setPoint(0, 1, {
        x: Math.round(areaObj1.left + areaWidth1 * 0.7) as Int,
        y: Math.round(areaObj1.top + areaHeight1 / 2) as Int
      } as Point);

      await CommonFunc.sleep(1000);
      pointers.setPoint(1, 0, {
        x: Math.round(areaObj1.left + areaWidth1 * 0.3) as Int,
        y: Math.round(areaObj1.top + areaHeight1 / 2) as Int
      } as Point);
      await CommonFunc.sleep(1000);
      pointers.setPoint(1, 1, {
        x: Math.round(areaObj1.left + areaWidth1 * 0.8) as Int,
        y: Math.round(areaObj1.top + areaHeight1 / 2) as Int
      } as Point);
      await CommonFunc.sleep(1000);
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      // 拖动之后重新获取当前区域的位置信息
      let FatherObj = CommonFunc.getComponentRectOnScreen('PanGestureExample03_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('PanGestureExample03Test_0010 FatherObj', FatherObj.left, FatherObj.top, FatherObj.right,
        FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('PanGestureExample03_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('PanGestureExample03Test_0010 areaObj', areaObj.left, areaObj.top, areaObj.right, areaObj.bottom)

      let text1 = inspector.getInspectorByKey('PanGestureExample03_repeat');
      let obj1 = JSON.parseJsonElement(text1);
      console.log('PanGestureExample03Test_0010 obj1 $attrs content', obj1.getElement('$attrs').getString('content'),
        obj1)
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('repeat:false');

      await CommonFunc.sleep(200);
      let text2 = inspector.getInspectorByKey('PanGestureExample03_offsetX');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('PanGestureExample03Test_0010 obj2 $attrs content',
        uiContext.vp2px(Number(obj2.getElement('$attrs').getString('content'))),
        ((Math.round(areaObj1.left + areaWidth1 * 0.7) - Math.round(areaObj1.left + areaWidth1 * 0.2)) +
          (Math.round(areaObj1.left + areaWidth1 * 0.8) - Math.round(areaObj1.left + areaWidth1 * 0.3))) / 2)
      console.log('PanGestureExample03Test_0010 obj2 $attrs offsetX', obj2.getElement('$attrs').getString('content'),
        Number(obj2.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj2.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj2.getElement('$attrs').getString('content')))) -
        (((Math.round(areaObj1.left + areaWidth1 * 0.7) - Math.round(areaObj1.left + areaWidth1 * 0.2)) +
          (Math.round(areaObj1.left + areaWidth1 * 0.8) - Math.round(areaObj1.left + areaWidth1 * 0.3))) / 2))) <= 1)
        .assertTrue();

      await CommonFunc.sleep(200);
      let text3 = inspector.getInspectorByKey('PanGestureExample03_offsetY');
      let obj3 = JSON.parseJsonElement(text3);
      console.log('PanGestureExample03Test_0010 obj3 $attrs content',
        uiContext.vp2px(Number(obj3.getElement('$attrs').getString('content'))),
        ((Math.round(areaObj1.top + areaHeight1 / 2) - Math.round(areaObj1.top + areaHeight1 / 2)) +
          (Math.round(areaObj1.top + areaHeight1 / 2) - Math.round(areaObj1.top + areaHeight1 / 2))) / 2)
      console.log('PanGestureExample03Test_0010 obj3 $attrs offsetY', obj3.getElement('$attrs').getString('content'),
        Number(obj3.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj3.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj3.getElement('$attrs').getString('content')))) -
        (((Math.round(areaObj1.top + areaHeight1 / 2) - Math.round(areaObj1.top + areaHeight1 / 2)) +
          (Math.round(areaObj1.top + areaHeight1 / 2) - Math.round(areaObj1.top + areaHeight1 / 2))) / 2))) <= 1)
        .assertTrue();

      await CommonFunc.sleep(200);
      let text4 = inspector.getInspectorByKey('PanGestureExample03_angle');
      let obj4 = JSON.parseJsonElement(text4);
      console.log('PanGestureExample03Test_0010 obj4 $attrs content', obj4.getElement('$attrs').getString('content'),
        obj4)
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('angle:0');

      await CommonFunc.sleep(200);
      let text5 = inspector.getInspectorByKey('PanGestureExample03_scale');
      let obj5 = JSON.parseJsonElement(text5);
      console.log('PanGestureExample03Test_0010 obj5 $attrs content', obj5.getElement('$attrs').getString('content'),
        obj5)
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('scale:1');

      await CommonFunc.sleep(200);
      let text6 = inspector.getInspectorByKey('PanGestureExample03_pinchCenterX');
      let obj6 = JSON.parseJsonElement(text6);
      console.log('PanGestureExample03Test_0010 obj6 $attrs content', obj6.getElement('$attrs').getString('content'),
        obj6)
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('pinchCenterX:0');

      await CommonFunc.sleep(200);
      let text7 = inspector.getInspectorByKey('PanGestureExample03_pinchCenterY');
      let obj7 = JSON.parseJsonElement(text7);
      console.log('PanGestureExample03Test_0010 obj7 $attrs content', obj7.getElement('$attrs').getString('content'),
        obj7)
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('pinchCenterY:0');
      // fingerList[0]
      await CommonFunc.sleep(200);
      let text9 = inspector.getInspectorByKey('PanGestureExample03_fingerList_id');
      let obj9 = JSON.parseJsonElement(text9);
      console.log('PanGestureExample03Test_0010 obj9 $attrs content', obj9.getElement('$attrs').getString('content'),
        obj9)
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('fingerList_id:0');
      // fingerList[0]
      await CommonFunc.sleep(200);
      let text10 = inspector.getInspectorByKey('PanGestureExample03_fingerList_globalX');
      let obj10 = JSON.parseJsonElement(text10);
      console.log('PanGestureExample03Test_0010 obj10 $attrs content',
        uiContext.vp2px(Number(obj10.getElement('$attrs').getString('content'))),
        Math.round(areaObj1.left + areaWidth1 * 0.7) - windowOffsetX)
      console.log('PanGestureExample03Test_0010 obj10 $attrs fingerList_globalX',
        obj10.getElement('$attrs').getString('content'), Number(obj10.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj10.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj10.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj1.left + areaWidth1 * 0.7) - windowOffsetX))) <= 1).assertTrue();
      // fingerList[0]
      await CommonFunc.sleep(200);
      let text11 = inspector.getInspectorByKey('PanGestureExample03_fingerList_globalY');
      let obj11 = JSON.parseJsonElement(text11);
      console.log('PanGestureExample03Test_0010 obj11 $attrs content',
        uiContext.vp2px(Number(obj11.getElement('$attrs').getString('content'))),
        Math.round(areaObj1.top + areaHeight1 / 2) - windowOffsetY)
      console.log('PanGestureExample03Test_0010 obj11 $attrs fingerList_globalY',
        obj11.getElement('$attrs').getString('content'), Number(obj11.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj11.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj11.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj1.top + areaHeight1 / 2) - windowOffsetY))) <= 1).assertTrue();
      // fingerList[0]
      await CommonFunc.sleep(200);
      let text12 = inspector.getInspectorByKey('PanGestureExample03_fingerList_localX');
      await CommonFunc.sleep(2000);
      let obj12 = JSON.parseJsonElement(text12);
      console.log('PanGestureExample03Test_0010 obj12 $attrs content',
        uiContext.vp2px(Number(obj12.getElement('$attrs').getString('content'))),
        Math.round(areaObj1.left + areaWidth1 * 0.7) - areaObj1.left)
      console.log('PanGestureExample03Test_0010 obj12 $attrs localX', obj12.getElement('$attrs').getString('content'),
        Number(obj12.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj12.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj12.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj1.left + areaWidth1 * 0.7) - areaObj1.left))) <= 1).assertTrue();
      // fingerList[0]
      await CommonFunc.sleep(200);
      let text13 = inspector.getInspectorByKey('PanGestureExample03_fingerList_localY');
      let obj13 = JSON.parseJsonElement(text13);
      console.log('PanGestureExample03Test_0010 obj13 $attrs content',
        uiContext.vp2px(Number(obj13.getElement('$attrs').getString('content'))),
        Math.round(areaObj1.top + areaHeight1 / 2) - areaObj1.top)
      console.log('PanGestureExample03Test_0010 obj13 $attrs localY', obj13.getElement('$attrs').getString('content'),
        Number(obj13.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj13.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj13.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj1.top + areaHeight1 / 2) - areaObj1.top))) <= 1).assertTrue();

      // fingerList[1]
      await CommonFunc.sleep(200);
      let text9f = inspector.getInspectorByKey('PanGestureExample03_fingerList1_id');
      let obj9f = JSON.parseJsonElement(text9f);
      console.log('PanGestureExample03Test_0010 obj9f $attrs content', obj9f.getElement('$attrs').getString('content'),
        obj9f)
      expect(obj9f.getElement('$attrs').getString('content')).assertEqual('fingerList1_id:1');
      // fingerList[1]
      await CommonFunc.sleep(200);
      let text10f = inspector.getInspectorByKey('PanGestureExample03_fingerList1_globalX');
      let obj10f = JSON.parseJsonElement(text10f);
      console.log('PanGestureExample03Test_0010 obj10f $attrs content',
        uiContext.vp2px(Number(obj10f.getElement('$attrs').getString('content'))),
        Math.round(areaObj1.left + areaWidth1 * 0.8) - windowOffsetX)
      console.log('PanGestureExample03Test_0010 obj10f $attrs fingerList1_globalX',
        obj10f.getElement('$attrs').getString('content'), Number(obj10f.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj10f.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj10f.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj1.left + areaWidth1 * 0.8) - windowOffsetX))) <= 1).assertTrue();
      // fingerList[1]
      await CommonFunc.sleep(200);
      let text11f = inspector.getInspectorByKey('PanGestureExample03_fingerList1_globalY');
      let obj11f = JSON.parseJsonElement(text11f);
      console.log('PanGestureExample03Test_0010 obj11f $attrs content',
        uiContext.vp2px(Number(obj11f.getElement('$attrs').getString('content'))),
        Math.round(areaObj1.top + areaHeight1 / 2) - windowOffsetY)
      console.log('PanGestureExample03Test_0010 obj11f $attrs fingerList1_globalY',
        obj11f.getElement('$attrs').getString('content'), Number(obj11f.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj11f.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj11f.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj1.top + areaHeight1 / 2) - windowOffsetY))) <= 1).assertTrue();
      // fingerList[1]
      await CommonFunc.sleep(200);
      let text12f = inspector.getInspectorByKey('PanGestureExample03_fingerList1_localX');
      let obj12f = JSON.parseJsonElement(text12f);
      console.log('PanGestureExample03Test_0010 obj12f $attrs content',
        uiContext.vp2px(Number(obj12f.getElement('$attrs').getString('content'))),
        Math.round(areaObj1.left + areaWidth1 * 0.8) - areaObj1.left)
      console.log('PanGestureExample03Test_0010 obj12f $attrs localX', obj12f.getElement('$attrs').getString('content'),
        Number(obj12f.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj12f.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj12f.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj1.left + areaWidth1 * 0.8) - areaObj1.left))) <= 1).assertTrue();
      // fingerList[1]
      await CommonFunc.sleep(200);
      let text13f = inspector.getInspectorByKey('PanGestureExample03_fingerList1_localY');
      let obj13f = JSON.parseJsonElement(text13f);
      console.log('PanGestureExample03Test_0010 obj13f $attrs content',
        uiContext.vp2px(Number(obj13f.getElement('$attrs').getString('content'))),
        Math.round(areaObj1.top + areaHeight1 / 2) - areaObj1.top)
      console.log('PanGestureExample03Test_0010 obj13f $attrs localY', obj13f.getElement('$attrs').getString('content'),
        Number(obj13f.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj13f.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj13f.getElement('$attrs').getString('content')))) -
        (Math.round(areaObj1.top + areaHeight1 / 2) - areaObj1.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text16 = inspector.getInspectorByKey('PanGestureExample03_target_area_width');
      let obj16 = JSON.parseJsonElement(text16);
      console.log('PanGestureExample03Test_0010 obj16 $attrs content', obj16.getElement('$attrs').getString('content'),
        uiContext.vp2px(Number(obj16.getElement('$attrs').getString('content'))), uiContext.vp2px(240))
      expect(Math.abs(uiContext.vp2px(Number(obj16.getElement('$attrs').getString('content'))) -
      uiContext.vp2px(160)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text17 = inspector.getInspectorByKey('PanGestureExample03_target_area_height');
      let obj17 = JSON.parseJsonElement(text17);
      console.log('PanGestureExample03Test_0010 obj17 $attrs content', obj17.getElement('$attrs').getString('content'),
        uiContext.vp2px(Number(obj17.getElement('$attrs').getString('content'))), uiContext.vp2px(80))
      expect(Math.abs(uiContext.vp2px(Number(obj17.getElement('$attrs').getString('content'))) - uiContext.vp2px(80)) <=
        1).assertTrue();

      await CommonFunc.sleep(200);
      let text18 = inspector.getInspectorByKey('PanGestureExample03_target_area_position_x');
      let obj18 = JSON.parseJsonElement(text18);
      console.log('PanGestureExample03Test_0010 obj18 $attrs content',
        uiContext.vp2px(Number(obj18.getElement('$attrs').getString('content'))), areaObj1.left - FatherObj.left)
      console.log('PanGestureExample03Test_0010 obj18 $attrs position_x',
        obj18.getElement('$attrs').getString('content'), Number(obj18.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj18.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj18.getElement('$attrs').getString('content')))) -
        (areaObj1.left - FatherObj.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text19 = inspector.getInspectorByKey('PanGestureExample03_target_area_position_y');
      let obj19 = JSON.parseJsonElement(text19);
      console.log('PanGestureExample03Test_0010 obj19 $attrs content',
        uiContext.vp2px(Number(obj19.getElement('$attrs').getString('content'))), areaObj1.top - FatherObj.top)
      console.log('PanGestureExample03Test_0010 obj19 $attrs position_y',
        obj19.getElement('$attrs').getString('content'), Number(obj19.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj19.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj19.getElement('$attrs').getString('content')))) -
        (areaObj1.top - FatherObj.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text20 = inspector.getInspectorByKey('PanGestureExample03_target_area_globalPosition_x');
      let obj20 = JSON.parseJsonElement(text20);
      console.log('PanGestureExample03Test_0010 obj20 $attrs content',
        uiContext.vp2px(Number(obj20.getElement('$attrs').getString('content'))), areaObj1.left - windowOffsetX)
      console.log('PanGestureExample03Test_0010 obj20 $attrs area_globalPosition_x',
        obj20.getElement('$attrs').getString('content'), Number(obj20.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj20.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj20.getElement('$attrs').getString('content')))) -
        (areaObj1.left - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text21 = inspector.getInspectorByKey('PanGestureExample03_target_area_globalPosition_y');
      let obj21 = JSON.parseJsonElement(text21);
      console.log('PanGestureExample03Test_0010 obj21 $attrs content',
        uiContext.vp2px(Number(obj21.getElement('$attrs').getString('content'))), areaObj1.top - windowOffsetY)
      console.log('PanGestureExample03Test_0010 obj21 $attrs area_globalPosition_y',
        obj21.getElement('$attrs').getString('content'), Number(obj21.getElement('$attrs').getString('content')),
        uiContext.vp2px(Number(obj21.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext.vp2px(Number(obj21.getElement('$attrs').getString('content')))) -
        (areaObj1.top - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text22 = inspector.getInspectorByKey('PanGestureExample03_source');
      let obj22 = JSON.parseJsonElement(text22);
      console.log('PanGestureExample03Test_0010 obj22 $attrs content', obj22.getElement('$attrs').getString('content'),
        obj22)
      expect(obj22.getElement('$attrs').getString('content')).assertEqual('source:2');

      await CommonFunc.sleep(200);
      let text23 = inspector.getInspectorByKey('PanGestureExample03_pressure');
      let obj23 = JSON.parseJsonElement(text23);
      console.log('PanGestureExample03Test_0010 obj23 $attrs content', obj23.getElement('$attrs').getString('content'),
        obj23)
      expect(obj23.getElement('$attrs').getString('content')).assertEqual('pressure:0');

      await CommonFunc.sleep(200);
      let text24 = inspector.getInspectorByKey('PanGestureExample03_tiltX');
      let obj24 = JSON.parseJsonElement(text24);
      console.log('PanGestureExample03Test_0010 obj24 $attrs content', obj24.getElement('$attrs').getString('content'),
        obj24)
      expect(obj24.getElement('$attrs').getString('content')).assertEqual('tiltX:0');

      await CommonFunc.sleep(200);
      let text25 = inspector.getInspectorByKey('PanGestureExample03_tiltY');
      let obj25 = JSON.parseJsonElement(text25);
      console.log('PanGestureExample03Test_0010 obj25 $attrs content', obj25.getElement('$attrs').getString('content'),
        obj25)
      expect(obj25.getElement('$attrs').getString('content')).assertEqual('tiltY:0');

      await CommonFunc.sleep(200);
      let text26 = inspector.getInspectorByKey('PanGestureExample03_sourceTool');
      let obj26 = JSON.parseJsonElement(text26);
      console.log('PanGestureExample03Test_0010 obj26 $attrs content', obj26.getElement('$attrs').getString('content'),
        obj26)
      expect(obj26.getElement('$attrs').getString('content')).assertEqual('sourceTool:Finger');

      console.info('PanGestureExample03Test_0010 END');
      done();
    });
  })
}
