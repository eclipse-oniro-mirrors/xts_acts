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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'


export default function SwipeGestureExample02Test() {
  describe('SwipeGestureExample02Test', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12None.static", "EntryAbility")

    });
    beforeEach(async ():Promise<void> => {
      console.info("SwipeGestureExample02Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwipeGesture/SwipeGestureExample02',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SwipeGestureExample02Test state pages:" + JSON.stringify(pages));
        if (!("SwipeGestureExample02" == pages.name)) {
          console.info("get SwipeGestureExample02Test pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SwipeGestureExample02Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwipeGestureExample02Test page error:" + err);
      }
      console.info("SwipeGestureExample02Test beforeEach end");
      // done();
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("SwipeGestureExample02Test after each called");
    });

    
    

/**
     * @tc.number   SwipeGestureExample02Test_static_0010
     * @tc.name     SwipeGestureExample02Test_static_0010
     * @tc.desc     SwipeGestureExample02Test_static_0010
     * @tc.level    Level.LEVEL0
     */
it('SwipeGestureExample02Test_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwipeGestureExample02Test_0010 START');
      const uiContext = AppStorage.get<UIContext>("uiContext");
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = AppStorage.get<number>("winLeft") as number
      let windowOffsetY:number = AppStorage.get<number>("winTop") as number
      console.log('SwipeGestureExample02Test_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('SwipeGestureExample02_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('SwipeGestureExample02Test_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('SwipeGestureExample02Test_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.top + areaHeight1 * 0.2))
      console.log('SwipeGestureExample02Test_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.bottom + areaHeight1 * 0.9))
      let driver = Driver.create();
      let speed = (Math.floor(areaHeight1 * 1.7 / 0.016 / 1000) * 1000) as Int
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1/2) as Int,Math.round(areaObj1.top + areaHeight1 * 0.2) as Int,Math.round(areaObj1.left + areaWidth1/2) as Int,Math.round(areaObj1.bottom + areaHeight1 * 0.9) as Int,speed)
      await CommonFunc.sleep(4000);
      // 拖动之后重新获取当前区域的位置信息
      let FatherObj = CommonFunc.getComponentRectOnScreen('SwipeGestureExample02_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('SwipeGestureExample02Test_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('SwipeGestureExample02_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('SwipeGestureExample02Test_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('SwipeGestureExample02Test_0010 areaObj clicked start',Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.top + areaHeight1 * 0.2))
      console.log('SwipeGestureExample02Test_0010 areaObj clicked end'  ,Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.bottom + areaHeight1 * 0.9))

      let text1 = inspector.getInspectorByKey('SwipeGestureExample02_repeat');
      let obj1 = JSON.parseJsonElement(text1);
      console.log('SwipeGestureExample02Test_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),obj1)
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('repeat:false');

      await CommonFunc.sleep(200);
      let text2 = inspector.getInspectorByKey('SwipeGestureExample02_offsetX');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('SwipeGestureExample02Test_0010 obj2 $attrs content',obj2.getElement('$attrs').getString('content'))
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');

      await CommonFunc.sleep(200);
      let text3 = inspector.getInspectorByKey('SwipeGestureExample02_offsetY');
      let obj3 = JSON.parseJsonElement(text3);
      console.log('SwipeGestureExample02Test_0010 obj3 $attrs content',obj3.getElement('$attrs').getString('content'))
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('0');

      await CommonFunc.sleep(200);
      let text4 = inspector.getInspectorByKey('SwipeGestureExample02_angle');
      let obj4 = JSON.parseJsonElement(text4);
      console.log('SwipeGestureExample02Test_0010 obj4 $attrs content',obj4.getElement('$attrs').getString('content'),obj4)
      expect(Number(obj4.getElement('$attrs').getString('content')) - 90 <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text5 = inspector.getInspectorByKey('SwipeGestureExample02_scale');
      let obj5 = JSON.parseJsonElement(text5);
      console.log('SwipeGestureExample02Test_0010 obj5 $attrs content',obj5.getElement('$attrs').getString('content'),obj5)
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('scale:1');

      await CommonFunc.sleep(200);
      let text6 = inspector.getInspectorByKey('SwipeGestureExample02_pinchCenterX');
      let obj6 = JSON.parseJsonElement(text6);
      console.log('SwipeGestureExample02Test_0010 obj6 $attrs content',obj6.getElement('$attrs').getString('content'),obj6)
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('pinchCenterX:0');

      await CommonFunc.sleep(200);
      let text7 = inspector.getInspectorByKey('SwipeGestureExample02_pinchCenterY');
      let obj7 = JSON.parseJsonElement(text7);
      console.log('SwipeGestureExample02Test_0010 obj7 $attrs content',obj7.getElement('$attrs').getString('content'),obj7)
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('pinchCenterY:0');

      await CommonFunc.sleep(200);
      let text9 = inspector.getInspectorByKey('SwipeGestureExample02_fingerList_id');
      let obj9 = JSON.parseJsonElement(text9);
      console.log('SwipeGestureExample02Test_0010 obj9 $attrs content',obj9.getElement('$attrs').getString('content'),obj9)
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('fingerList_id:0');

      await CommonFunc.sleep(200);
      let text10 = inspector.getInspectorByKey('SwipeGestureExample02_fingerList_globalX');
      let obj10 = JSON.parseJsonElement(text10);
      console.log('SwipeGestureExample02Test_0010 obj10 $attrs content',uiContext!.vp2px(Number(obj10.getElement('$attrs').getString('content'))),Math.round(areaObj1.left + areaWidth1/2) - windowOffsetX)
      console.log('SwipeGestureExample02Test_0010 obj10 $attrs fingerList_globalX',obj10.getElement('$attrs').getString('content'), Number(obj10.getElement('$attrs').getString('content')), uiContext!.vp2px(Number(obj10.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext!.vp2px(Number(obj10.getElement('$attrs').getString('content'))))- (Math.round(areaObj1.left + areaWidth1/2) - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text11 = inspector.getInspectorByKey('SwipeGestureExample02_fingerList_globalY');
      let obj11 = JSON.parseJsonElement(text11);
      console.log('SwipeGestureExample02Test_0010 obj11 $attrs content',uiContext!.vp2px(Number(obj11.getElement('$attrs').getString('content'))),Math.round(areaObj1.bottom + areaHeight1 * 0.9) - windowOffsetY)
      console.log('SwipeGestureExample02Test_0010 obj11 $attrs fingerList_globalY',obj11.getElement('$attrs').getString('content'), Number(obj11.getElement('$attrs').getString('content')), uiContext!.vp2px(Number(obj11.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext!.vp2px(Number(obj11.getElement('$attrs').getString('content'))))- (Math.round(areaObj1.bottom + areaHeight1 * 0.9) - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text12 = inspector.getInspectorByKey('SwipeGestureExample02_fingerList_localX');
      let obj12 = JSON.parseJsonElement(text12);
      console.log('SwipeGestureExample02Test_0010 obj12 $attrs content',uiContext!.vp2px(Number(obj12.getElement('$attrs').getString('content'))),Math.round(areaObj1.left + areaWidth1/2) - areaObj1.left)
      console.log('SwipeGestureExample02Test_0010 obj12 $attrs localX',obj12.getElement('$attrs').getString('content'), Number(obj12.getElement('$attrs').getString('content')), uiContext!.vp2px(Number(obj12.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext!.vp2px(Number(obj12.getElement('$attrs').getString('content'))))- (Math.round(areaObj1.left + areaWidth1/2) - areaObj1.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text13 = inspector.getInspectorByKey('SwipeGestureExample02_fingerList_localY');
      let obj13 = JSON.parseJsonElement(text13);
      console.log('SwipeGestureExample02Test_0010 obj13 $attrs content',uiContext!.vp2px(Number(obj13.getElement('$attrs').getString('content'))),Math.round(areaObj1.bottom + areaHeight1 * 0.9) - areaObj1.top)
      console.log('SwipeGestureExample02Test_0010 obj13 $attrs localY',obj13.getElement('$attrs').getString('content'), Number(obj13.getElement('$attrs').getString('content')), uiContext!.vp2px(Number(obj13.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext!.vp2px(Number(obj13.getElement('$attrs').getString('content'))))- (Math.round(areaObj1.bottom + areaHeight1 * 0.9) - areaObj1.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text16 = inspector.getInspectorByKey('SwipeGestureExample02_target_area_width');
      let obj16 = JSON.parseJsonElement(text16);
      console.log('SwipeGestureExample02Test_0010 obj16 $attrs content',obj16.getElement('$attrs').getString('content'), uiContext!.vp2px(Number(obj16.getElement('$attrs').getString('content'))), uiContext!.vp2px(240))
      expect(Math.abs(uiContext!.vp2px(Number(obj16.getElement('$attrs').getString('content'))) - uiContext!.vp2px(240)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text17 = inspector.getInspectorByKey('SwipeGestureExample02_target_area_height');
      let obj17 = JSON.parseJsonElement(text17);
      console.log('SwipeGestureExample02Test_0010 obj17 $attrs content',obj17.getElement('$attrs').getString('content'), uiContext!.vp2px(Number(obj17.getElement('$attrs').getString('content'))), uiContext!.vp2px(80))
      expect(Math.abs(uiContext!.vp2px(Number(obj17.getElement('$attrs').getString('content'))) - uiContext!.vp2px(80)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text18 = inspector.getInspectorByKey('SwipeGestureExample02_target_area_position_x');
      let obj18 = JSON.parseJsonElement(text18);
      console.log('SwipeGestureExample02Test_0010 obj18 $attrs content',uiContext!.vp2px(Number(obj18.getElement('$attrs').getString('content'))),areaObj1.left-FatherObj.left)
      console.log('SwipeGestureExample02Test_0010 obj18 $attrs position_x',obj18.getElement('$attrs').getString('content'), Number(obj18.getElement('$attrs').getString('content')), uiContext!.vp2px(Number(obj18.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext!.vp2px(Number(obj18.getElement('$attrs').getString('content'))))- (areaObj1.left-FatherObj.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text19 = inspector.getInspectorByKey('SwipeGestureExample02_target_area_position_y');
      let obj19 = JSON.parseJsonElement(text19);
      console.log('SwipeGestureExample02Test_0010 obj19 $attrs content',uiContext!.vp2px(Number(obj19.getElement('$attrs').getString('content'))),areaObj1.top-FatherObj.top)
      console.log('SwipeGestureExample02Test_0010 obj19 $attrs position_y',obj19.getElement('$attrs').getString('content'), Number(obj19.getElement('$attrs').getString('content')), uiContext!.vp2px(Number(obj19.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext!.vp2px(Number(obj19.getElement('$attrs').getString('content'))))- (areaObj1.top-FatherObj.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text20 = inspector.getInspectorByKey('SwipeGestureExample02_target_area_globalPosition_x');
      let obj20 = JSON.parseJsonElement(text20);
      console.log('SwipeGestureExample02Test_0010 obj20 $attrs content',uiContext!.vp2px(Number(obj20.getElement('$attrs').getString('content'))),areaObj1.left - windowOffsetX)
      console.log('SwipeGestureExample02Test_0010 obj20 $attrs area_globalPosition_x',obj20.getElement('$attrs').getString('content'), Number(obj20.getElement('$attrs').getString('content')), uiContext!.vp2px(Number(obj20.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext!.vp2px(Number(obj20.getElement('$attrs').getString('content'))))- (areaObj1.left - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text21 = inspector.getInspectorByKey('SwipeGestureExample02_target_area_globalPosition_y');
      let obj21 = JSON.parseJsonElement(text21);
      console.log('SwipeGestureExample02Test_0010 obj21 $attrs content',uiContext!.vp2px(Number(obj21.getElement('$attrs').getString('content'))),areaObj1.top - windowOffsetY)
      console.log('SwipeGestureExample02Test_0010 obj21 $attrs area_globalPosition_y',obj21.getElement('$attrs').getString('content'), Number(obj21.getElement('$attrs').getString('content')), uiContext!.vp2px(Number(obj21.getElement('$attrs').getString('content'))))
      expect(Math.abs(Math.round((uiContext!.vp2px(Number(obj21.getElement('$attrs').getString('content'))))- (areaObj1.top - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text22 = inspector.getInspectorByKey('SwipeGestureExample02_source');
      let obj22 = JSON.parseJsonElement(text22);
      console.log('SwipeGestureExample02Test_0010 obj22 $attrs content',obj22.getElement('$attrs').getString('content'),obj22)
      expect(obj22.getElement('$attrs').getString('content')).assertEqual('source:2');

      await CommonFunc.sleep(200);
      let text23 = inspector.getInspectorByKey('SwipeGestureExample02_pressure');
      let obj23 = JSON.parseJsonElement(text23);
      console.log('SwipeGestureExample02Test_0010 obj23 $attrs content',obj23.getElement('$attrs').getString('content'),obj23)
      expect(obj23.getElement('$attrs').getString('content')).assertEqual('pressure:0');

      await CommonFunc.sleep(200);
      let text24 = inspector.getInspectorByKey('SwipeGestureExample02_tiltX');
      let obj24 = JSON.parseJsonElement(text24);
      console.log('SwipeGestureExample02Test_0010 obj24 $attrs content',obj24.getElement('$attrs').getString('content'),obj24)
      expect(obj24.getElement('$attrs').getString('content')).assertEqual('tiltX:0');

      await CommonFunc.sleep(200);
      let text25 = inspector.getInspectorByKey('SwipeGestureExample02_tiltY');
      let obj25 = JSON.parseJsonElement(text25);
      console.log('SwipeGestureExample02Test_0010 obj25 $attrs content',obj25.getElement('$attrs').getString('content'),obj25)
      expect(obj25.getElement('$attrs').getString('content')).assertEqual('tiltY:0');

      await CommonFunc.sleep(200);
      let text26 = inspector.getInspectorByKey('SwipeGestureExample02_sourceTool');
      let obj26 = JSON.parseJsonElement(text26);
      console.log('SwipeGestureExample02Test_0010 obj26 $attrs content',obj26.getElement('$attrs').getString('content'),obj26)
      expect(obj26.getElement('$attrs').getString('content')).assertEqual('sourceTool:FINGER');

      console.info('SwipeGestureExample02Test_0010 END');
      done();
    });


  })
}
