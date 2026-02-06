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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TapGestureBasicDoubleClickTest() {
  describe('TapGestureBasicDoubleClickTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TapGestureBasicDoubleClickTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/TapGestureBasicDoubleClick',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TapGestureBasicDoubleClickTest state pages:" + JSON.stringify(pages));
        if (!("TapGestureBasicDoubleClick" == pages.name)) {
          console.info("get TapGestureBasicDoubleClickTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TapGestureBasicDoubleClickTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TapGestureBasicDoubleClickTest page error:" + err);
      }
      console.info("TapGestureBasicDoubleClickTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("TapGestureBasicDoubleClickTest after each called");
    });

    /**
     * @tc.name   TapGestureBasicDoubleClickTest_0010
     * @tc.number SUB_TapGestureBasicDoubleClickTest_0010
     * @tc.desc   api test TapGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TapGestureBasicDoubleClickTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('TapGestureBasicDoubleClickTest_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('TapGestureBasicDoubleClickTest_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let FatherObj = CommonFunc.getComponentRectOnScreen('TapGestureBasicDoubleClick_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('TapGestureBasicDoubleClickTest_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('TapGestureBasicDoubleClick_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('TapGestureBasicDoubleClickTest_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('TapGestureBasicDoubleClickTest_0010 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.doubleClick(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text1 = getInspectorByKey('TapGestureBasicDoubleClick_repeat');
      let obj1: ESObject = JSON.parse(text1);
      console.log('TapGestureBasicDoubleClickTest_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('repeat:false');

      await CommonFunc.sleep(200);
      let text2 = getInspectorByKey('TapGestureBasicDoubleClick_offsetX');
      let obj2: ESObject = JSON.parse(text2);
      console.log('TapGestureBasicDoubleClickTest_0010 obj2 $attrs content',obj2.$attrs.content,obj2)
      expect(obj2.$attrs.content).assertEqual('offsetX:0');

      await CommonFunc.sleep(200);
      let text3 = getInspectorByKey('TapGestureBasicDoubleClick_offsetY');
      let obj3: ESObject = JSON.parse(text3);
      console.log('TapGestureBasicDoubleClickTest_0010 obj3 $attrs content',obj3.$attrs.content,obj3)
      expect(obj3.$attrs.content).assertEqual('offsetY:0');

      await CommonFunc.sleep(200);
      let text4 = getInspectorByKey('TapGestureBasicDoubleClick_angle');
      let obj4: ESObject = JSON.parse(text4);
      console.log('TapGestureBasicDoubleClickTest_0010 obj4 $attrs content',obj4.$attrs.content,obj4)
      expect(obj4.$attrs.content).assertEqual('angle:0');

      await CommonFunc.sleep(200);
      let text5 = getInspectorByKey('TapGestureBasicDoubleClick_scale');
      let obj5: ESObject = JSON.parse(text5);
      console.log('TapGestureBasicDoubleClickTest_0010 obj5 $attrs content',obj5.$attrs.content,obj5)
      expect(obj5.$attrs.content).assertEqual('scale:1');

      await CommonFunc.sleep(200);
      let text6 = getInspectorByKey('TapGestureBasicDoubleClick_pinchCenterX');
      let obj6: ESObject = JSON.parse(text6);
      console.log('TapGestureBasicDoubleClickTest_0010 obj6 $attrs content',obj6.$attrs.content,obj6)
      expect(obj6.$attrs.content).assertEqual('pinchCenterX:0');

      await CommonFunc.sleep(200);
      let text7 = getInspectorByKey('TapGestureBasicDoubleClick_pinchCenterY');
      let obj7: ESObject = JSON.parse(text7);
      console.log('TapGestureBasicDoubleClickTest_0010 obj7 $attrs content',obj7.$attrs.content,obj7)
      expect(obj7.$attrs.content).assertEqual('pinchCenterY:0');

      await CommonFunc.sleep(200);
      let text8 = getInspectorByKey('TapGestureBasicDoubleClick_speed');
      let obj8: ESObject = JSON.parse(text8);
      console.log('TapGestureBasicDoubleClickTest_0010 obj8 $attrs content',obj8.$attrs.content,obj8)
      expect(obj8.$attrs.content).assertEqual('speed:0');

      await CommonFunc.sleep(200);
      let text9 = getInspectorByKey('TapGestureBasicDoubleClick_fingerList_id');
      let obj9: ESObject = JSON.parse(text9);
      console.log('TapGestureBasicDoubleClickTest_0010 obj9 $attrs content',obj9.$attrs.content,obj9)
      expect(obj9.$attrs.content).assertEqual('fingerList_id:0');

      await CommonFunc.sleep(200);
      let text10 = getInspectorByKey('TapGestureBasicDoubleClick_fingerList_globalX');
      let obj10: ESObject = JSON.parse(text10);
      console.log('TapGestureBasicDoubleClickTest_0010 obj10 $attrs content',obj10.$attrs.content,Math.round(areaObj.left + areaWidth/2) - windowOffsetX)
      expect(Math.abs(Math.round((vp2px(Number(obj10.$attrs.content)))- (Math.round(areaObj.left + areaWidth/2) - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text11 = getInspectorByKey('TapGestureBasicDoubleClick_fingerList_globalY');
      let obj11: ESObject = JSON.parse(text11);
      console.log('TapGestureBasicDoubleClickTest_0010 obj11 $attrs content',obj11.$attrs.content,Math.round(areaObj.top + areaHeight/2) - windowOffsetY)
      expect(Math.abs(Math.round((vp2px(Number(obj11.$attrs.content)))- (Math.round(areaObj.top + areaHeight/2) - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text12 = getInspectorByKey('TapGestureBasicDoubleClick_fingerList_localX');
      let obj12: ESObject = JSON.parse(text12);
      console.log('TapGestureBasicDoubleClickTest_0010 obj12 $attrs content',obj12.$attrs.content,obj12)
      expect(Math.abs(Math.round((vp2px(Number(obj12.$attrs.content)))- (Math.round(areaObj.left + areaWidth/2) - areaObj.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text13 = getInspectorByKey('TapGestureBasicDoubleClick_fingerList_localY');
      let obj13: ESObject = JSON.parse(text13);
      console.log('TapGestureBasicDoubleClickTest_0010 obj13 $attrs content',obj13.$attrs.content,obj13)
      expect(Math.abs(Math.round((vp2px(Number(obj13.$attrs.content)))- (Math.round(areaObj.top + areaHeight/2) - areaObj.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text16 = getInspectorByKey('TapGestureBasicDoubleClick_target_area_width');
      let obj16: ESObject = JSON.parse(text16);
      console.log('TapGestureBasicDoubleClickTest_0010 obj16 $attrs content',obj16.$attrs.content, vp2px(Number(obj16.$attrs.content)), vp2px(240))
      expect(Math.abs(vp2px(Number(obj16.$attrs.content)) - vp2px(240)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text17 = getInspectorByKey('TapGestureBasicDoubleClick_target_area_height');
      let obj17: ESObject = JSON.parse(text17);
      console.log('TapGestureBasicDoubleClickTest_0010 obj17 $attrs content',obj17.$attrs.content, vp2px(Number(obj17.$attrs.content)), vp2px(80))
      expect(Math.abs(vp2px(Number(obj17.$attrs.content)) - vp2px(80)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text18 = getInspectorByKey('TapGestureBasicDoubleClick_target_area_position_x');
      let obj18: ESObject = JSON.parse(text18);
      console.log('TapGestureBasicDoubleClickTest_0010 obj18 $attrs content',obj18.$attrs.content,obj18)
      expect(Math.abs(Math.round((vp2px(Number(obj18.$attrs.content)))- (areaObj.left-FatherObj.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text19 = getInspectorByKey('TapGestureBasicDoubleClick_target_area_position_y');
      let obj19: ESObject = JSON.parse(text19);
      expect(Math.abs(Math.round((vp2px(Number(obj19.$attrs.content)))- (areaObj.top-FatherObj.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text20 = getInspectorByKey('TapGestureBasicDoubleClick_target_area_globalPosition_x');
      let obj20: ESObject = JSON.parse(text20);
      console.log('TapGestureBasicDoubleClickTest_0010 obj20 $attrs content',obj20.$attrs.content,areaObj.left - windowOffsetX)
      expect(Math.abs(Math.round((vp2px(Number(obj20.$attrs.content)))- (areaObj.left - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text21 = getInspectorByKey('TapGestureBasicDoubleClick_target_area_globalPosition_y');
      let obj21: ESObject = JSON.parse(text21);
      console.log('TapGestureBasicDoubleClickTest_0010 obj21 $attrs content',obj21.$attrs.content,areaObj.top - windowOffsetY)
      expect(Math.abs(Math.round((vp2px(Number(obj21.$attrs.content)))- (areaObj.top - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text22 = getInspectorByKey('TapGestureBasicDoubleClick_source');
      let obj22: ESObject = JSON.parse(text22);
      console.log('TapGestureBasicDoubleClickTest_0010 obj22 $attrs content',obj22.$attrs.content,obj22)
      expect(obj22.$attrs.content).assertEqual('source:2');

      await CommonFunc.sleep(200);
      let text23 = getInspectorByKey('TapGestureBasicDoubleClick_pressure');
      let obj23: ESObject = JSON.parse(text23);
      console.log('TapGestureBasicDoubleClickTest_0010 obj23 $attrs content',obj23.$attrs.content,obj23)
      expect(obj23.$attrs.content).assertEqual('pressure:0');

      await CommonFunc.sleep(200);
      let text24 = getInspectorByKey('TapGestureBasicDoubleClick_tiltX');
      let obj24: ESObject = JSON.parse(text24);
      console.log('TapGestureBasicDoubleClickTest_0010 obj24 $attrs content',obj24.$attrs.content,obj24)
      expect(obj24.$attrs.content).assertEqual('tiltX:0');

      await CommonFunc.sleep(200);
      let text25 = getInspectorByKey('TapGestureBasicDoubleClick_tiltY');
      let obj25: ESObject = JSON.parse(text25);
      console.log('TapGestureBasicDoubleClickTest_0010 obj25 $attrs content',obj25.$attrs.content,obj25)
      expect(obj25.$attrs.content).assertEqual('tiltY:0');

      await CommonFunc.sleep(200);
      let text26 = getInspectorByKey('TapGestureBasicDoubleClick_sourceTool');
      let obj26: ESObject = JSON.parse(text26);
      console.log('TapGestureBasicDoubleClickTest_0010 obj26 $attrs content',obj26.$attrs.content,obj26)
      expect(obj26.$attrs.content).assertEqual('sourceTool:FINGER');

      await CommonFunc.sleep(200);
      let text27 = getInspectorByKey('TapGestureBasicDoubleClick_velocityX');
      let obj27: ESObject = JSON.parse(text27);
      console.log('TapGestureBasicDoubleClickTest_0010 obj27 $attrs content',obj27.$attrs.content,obj27)
      expect(obj27.$attrs.content).assertEqual('velocityX:0');

      await CommonFunc.sleep(200);
      let text28 = getInspectorByKey('TapGestureBasicDoubleClick_velocityY');
      let obj28: ESObject = JSON.parse(text28);
      console.log('TapGestureBasicDoubleClickTest_0010 obj28 $attrs content',obj28.$attrs.content,obj28)
      expect(obj28.$attrs.content).assertEqual('velocityY:0');

      await CommonFunc.sleep(200);
      let text29 = getInspectorByKey('TapGestureBasicDoubleClick_velocity');
      let obj29: ESObject = JSON.parse(text29);
      console.log('TapGestureBasicDoubleClickTest_0010 obj29 $attrs content',obj29.$attrs.content,obj29)
      expect(obj29.$attrs.content).assertEqual('velocity:0');

      console.info('TapGestureBasicDoubleClickTest_0010 END');
      done();
    });
  })
}
