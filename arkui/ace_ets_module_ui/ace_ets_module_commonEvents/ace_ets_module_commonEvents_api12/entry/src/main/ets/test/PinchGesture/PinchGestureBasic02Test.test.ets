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
import {PointerMatrix, UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode} from '@ohos.UiTest';

export default function PinchGestureBasic02Test() {
  describe('PinchGestureBasic02Test', () => {
    beforeEach(async (done: Function) => {
      console.info("PinchGestureBasic02Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PinchGesture/PinchGestureBasic02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PinchGestureBasic02Test state pages:" + JSON.stringify(pages));
        if (!("PinchGestureBasic02" == pages.name)) {
          console.info("get PinchGestureBasic02Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PinchGestureBasic02Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PinchGestureBasic02Test page error:" + err);
      }
      console.info("PinchGestureBasic02Test beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("PinchGestureBasic02Test after each called");
    });

    /**
     * @tc.name   PinchGestureBasic02Test_0010
     * @tc.number PinchGestureBasic02Test_0010
     * @tc.desc   api test PinchGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PinchGestureBasic02Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('PinchGestureBasic02Test_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('PinchGestureBasic02Test_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('PinchGestureBasic02_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('PinchGestureBasic02Test_0010 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('PinchGestureBasic02Test_0010 areaObj1 clicked finger[0] start',Math.round(areaObj1.left),Math.round(areaObj1.top))
      console.log('PinchGestureBasic02Test_0010 areaObj1 clicked finger[0] end',Math.round(areaObj1.right),Math.round(areaObj1.top))
      console.log('PinchGestureBasic02Test_0010 areaObj1 clicked finger[1] start',Math.round(areaObj1.right),Math.round(areaObj1.bottom))
      console.log('PinchGestureBasic02Test_0010 areaObj1 clicked finger[1] end',Math.round(areaObj1.left),Math.round(areaObj1.bottom))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x: Math.round(areaObj1.left + areaWidth1 * 0.5),y: Math.round(areaObj1.top + areaHeight1 * 0.1) });
      pointers.setPoint(0,1,{x: Math.round(areaObj1.left + areaWidth1 * 0.5),y: Math.round(areaObj1.top + areaHeight1 * 0.3) });
      pointers.setPoint(1,0,{x: Math.round(areaObj1.left + areaWidth1 * 0.5),y: Math.round(areaObj1.bottom - areaHeight1 * 0.1) });
      pointers.setPoint(1,1,{x: Math.round(areaObj1.left + areaWidth1 * 0.5),y: Math.round(areaObj1.bottom - areaHeight1 * 0.3) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      // 拖动之后重新获取当前区域的位置信息
      let FatherObj = CommonFunc.getComponentRectOnScreen('PinchGestureBasic02_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('PinchGestureBasic02Test_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('PinchGestureBasic02_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('PinchGestureBasic02Test_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)

      let text1 = getInspectorByKey('PinchGestureBasic02_repeat');
      let obj1: ESObject = JSON.parse(text1);
      console.log('PinchGestureBasic02Test_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('repeat:false');

      await CommonFunc.sleep(200);
      let text2 = getInspectorByKey('PinchGestureBasic02_offsetX');
      let obj2: ESObject = JSON.parse(text2);
      console.log('PinchGestureBasic02Test_0010 obj2 $attrs content',obj2.$attrs.content,obj2)
      expect(obj2.$attrs.content).assertEqual('offsetX:0');

      await CommonFunc.sleep(200);
      let text3 = getInspectorByKey('PinchGestureBasic02_offsetY');
      let obj3: ESObject = JSON.parse(text3);
      console.log('PinchGestureBasic02Test_0010 obj3 $attrs content',obj3.$attrs.content,obj3)
      expect(obj3.$attrs.content).assertEqual('offsetY:0');

      await CommonFunc.sleep(200);
      let text4 = getInspectorByKey('PinchGestureBasic02_angle');
      let obj4: ESObject = JSON.parse(text4);
      console.log('PinchGestureBasic02Test_0010 obj4 $attrs content',obj4.$attrs.content,obj4)
      expect(obj4.$attrs.content).assertEqual('angle:0');

      await CommonFunc.sleep(200);
      let text6 = getInspectorByKey('PinchGestureBasic02_pinchCenterX');
      let obj6: ESObject = JSON.parse(text6);
      console.log('PinchGestureBasic02Test_0010 obj6 $attrs content',vp2px(Number(obj6.$attrs.content)),vp2px(Number(obj6.$attrs.content))- (Math.round(areaObj1.left + areaWidth1 * 0.5) - areaObj1.left))
      console.log('PinchGestureBasic02Test_0010 obj6 $attrs pinchCenterX',obj6.$attrs.content, Number(obj6.$attrs.content), vp2px(Number(obj6.$attrs.content)))
      expect(Math.abs(Math.round(vp2px(Number(obj6.$attrs.content))- (Math.round(areaObj1.left + areaWidth1 * 0.5) - areaObj1.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text7 = getInspectorByKey('PinchGestureBasic02_pinchCenterY');
      let obj7: ESObject = JSON.parse(text7);
      console.log('PinchGestureBasic02Test_0010 obj7 $attrs content',vp2px(Number(obj6.$attrs.content)),(vp2px(Number(obj7.$attrs.content)))- ((Math.round(areaObj1.top + areaHeight1 * 0.3) + (Math.round(areaObj1.bottom - areaHeight1 * 0.3) - Math.round(areaObj1.top + areaHeight1 * 0.3))/2) - areaObj1.top))
      console.log('PinchGestureBasic02Test_0010 obj7 $attrs pinchCenterY',obj7.$attrs.content, Number(obj7.$attrs.content), vp2px(Number(obj7.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj7.$attrs.content)))- ((Math.round(areaObj1.top + areaHeight1 * 0.3) + (Math.round(areaObj1.bottom - areaHeight1 * 0.3) - Math.round(areaObj1.top + areaHeight1 * 0.3))/2) - areaObj1.top))) <= 1).assertTrue();

      // fingerList[0]
      await CommonFunc.sleep(200);
      let text9 = getInspectorByKey('PinchGestureBasic02_fingerList_id');
      let obj9: ESObject = JSON.parse(text9);
      console.log('PinchGestureBasic02Test_0010 obj9 $attrs content',obj9.$attrs.content,obj9)
      expect(obj9.$attrs.content).assertEqual('fingerList_id:0');

      // fingerList[0]
      await CommonFunc.sleep(200);
      let text10 = getInspectorByKey('PinchGestureBasic02_fingerList_globalX');
      let obj10: ESObject = JSON.parse(text10);
      console.log('RotatioroundnGestureBasicTest_0010 obj10 $attrs content',vp2px(Number(obj10.$attrs.content)),Math.round(areaObj1.left + areaWidth1 * 0.5) - windowOffsetX)
      console.log('PinchGestureBasic02Test_0010 obj10 $attrs fingerList_globalX',obj10.$attrs.content, Number(obj10.$attrs.content), vp2px(Number(obj10.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj10.$attrs.content)))- (Math.round(areaObj1.left + areaWidth1 * 0.5) - windowOffsetX))) <= 1).assertTrue();

      // fingerList[0]
      await CommonFunc.sleep(200);
      let text11 = getInspectorByKey('PinchGestureBasic02_fingerList_globalY');
      let obj11: ESObject = JSON.parse(text11);
      console.log('PinchGestureBasic02Test_0010 obj11 $attrs content',vp2px(Number(obj11.$attrs.content)),Math.round(areaObj1.top + areaHeight1 * 0.3) - windowOffsetY)
      console.log('PinchGestureBasic02Test_0010 obj11 $attrs fingerList_globalY',obj11.$attrs.content, Number(obj11.$attrs.content), vp2px(Number(obj11.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj11.$attrs.content)))- (Math.round(areaObj1.top + areaHeight1 * 0.3) - windowOffsetY))) <= 1).assertTrue();

      // fingerList[0]
      await CommonFunc.sleep(200);
      let text12 = getInspectorByKey('PinchGestureBasic02_fingerList_localX');
      let obj12: ESObject = JSON.parse(text12);
      console.log('PinchGestureBasic02Test_0010 obj12 $attrs content',vp2px(Number(obj12.$attrs.content)),Math.round(areaObj1.left + areaWidth1 * 0.5) - areaObj1.left)
      console.log('PinchGestureBasic02Test_0010 obj12 $attrs localX',obj12.$attrs.content, Number(obj12.$attrs.content), vp2px(Number(obj12.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj12.$attrs.content)))- (Math.round(areaObj1.left + areaWidth1 * 0.5) - areaObj1.left))) <= 1).assertTrue();

      // fingerList[0]
      await CommonFunc.sleep(200);
      let text13 = getInspectorByKey('PinchGestureBasic02_fingerList_localY');
      let obj13: ESObject = JSON.parse(text13);
      console.log('PinchGestureBasic02Test_0010 obj13 $attrs content',vp2px(Number(obj13.$attrs.content)),Math.round(areaObj1.top + areaHeight1 * 0.3) - areaObj1.top)
      console.log('PinchGestureBasic02Test_0010 obj13 $attrs localY',obj13.$attrs.content, Number(obj13.$attrs.content), vp2px(Number(obj13.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj13.$attrs.content)))- (Math.round(areaObj1.top + areaHeight1 * 0.3) - areaObj1.top))) <= 1).assertTrue();

      // fingerList[1]
      await CommonFunc.sleep(200);
      let text9f = getInspectorByKey('PinchGestureBasic02_fingerList1_id');
      let obj9f: ESObject = JSON.parse(text9f);
      console.log('PinchGestureBasic02Test_0010 obj9f $attrs content',obj9f.$attrs.content,obj9f)
      expect(obj9f.$attrs.content).assertEqual('fingerList1_id:1');

      // fingerList[1]
      await CommonFunc.sleep(200);
      let text10f = getInspectorByKey('PinchGestureBasic02_fingerList1_globalX');
      let obj10f: ESObject = JSON.parse(text10f);
      console.log('PinchGestureBasic02Test_0010 obj10f $attrs content',vp2px(Number(obj10f.$attrs.content)),Math.round(areaObj1.left + areaWidth1 * 0.5) - windowOffsetX)
      console.log('PinchGestureBasic02Test_0010 obj10f $attrs fingerList1_globalX',obj10f.$attrs.content, Number(obj10f.$attrs.content), vp2px(Number(obj10f.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj10f.$attrs.content)))- (Math.round(areaObj1.left + areaWidth1 * 0.5) - windowOffsetX))) <= 1).assertTrue();

      // fingerList[1]
      await CommonFunc.sleep(200);
      let text11f = getInspectorByKey('PinchGestureBasic02_fingerList1_globalY');
      let obj11f: ESObject = JSON.parse(text11f);
      console.log('PinchGestureBasic02Test_0010 obj11f $attrs content',vp2px(Number(obj11f.$attrs.content)),Math.round(areaObj1.bottom - areaHeight1 * 0.3) - windowOffsetY)
      console.log('PinchGestureBasic02Test_0010 obj11f $attrs fingerList1_globalY',obj11f.$attrs.content, Number(obj11f.$attrs.content), vp2px(Number(obj11f.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj11f.$attrs.content)))- (Math.round(areaObj1.bottom - areaHeight1 * 0.3) - windowOffsetY))) <= 1).assertTrue();

      // fingerList[1]
      await CommonFunc.sleep(200);
      let text12f = getInspectorByKey('PinchGestureBasic02_fingerList1_localX');
      let obj12f: ESObject = JSON.parse(text12f);
      console.log('PinchGestureBasic02Test_0010 obj12f $attrs content',vp2px(Number(obj12f.$attrs.content)),Math.round(areaObj1.left + areaWidth1 * 0.5) - areaObj1.left)
      console.log('PinchGestureBasic02Test_0010 obj12f $attrs localX',obj12f.$attrs.content, Number(obj12f.$attrs.content), vp2px(Number(obj12f.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj12f.$attrs.content)))- (Math.round(areaObj1.left + areaWidth1 * 0.5) - areaObj1.left))) <= 1).assertTrue();

      // fingerList[1]
      await CommonFunc.sleep(200);
      let text13f = getInspectorByKey('PinchGestureBasic02_fingerList1_localY');
      let obj13f: ESObject = JSON.parse(text13f);
      console.log('PinchGestureBasic02Test_0010 obj13f $attrs content',vp2px(Number(obj13f.$attrs.content)),Math.round(areaObj1.bottom - areaHeight1 * 0.3) - areaObj1.top)
      console.log('PinchGestureBasic02Test_0010 obj13f $attrs localY',obj13f.$attrs.content, Number(obj13f.$attrs.content), vp2px(Number(obj13f.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj13f.$attrs.content)))- (Math.round(areaObj1.bottom - areaHeight1 * 0.3) - areaObj1.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text16 = getInspectorByKey('PinchGestureBasic02_target_area_width');
      let obj16: ESObject = JSON.parse(text16);
      console.log('PinchGestureBasic02Test_0010 obj16 $attrs content',obj16.$attrs.content, vp2px(Number(obj16.$attrs.content)), vp2px(240))
      expect(Math.abs(vp2px(Number(obj16.$attrs.content)) - vp2px(240)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text17 = getInspectorByKey('PinchGestureBasic02_target_area_height');
      let obj17: ESObject = JSON.parse(text17);
      console.log('PinchGestureBasic02Test_0010 obj17 $attrs content',obj17.$attrs.content, vp2px(Number(obj17.$attrs.content)), vp2px(160))
      expect(Math.abs(vp2px(Number(obj17.$attrs.content)) - vp2px(160)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text18 = getInspectorByKey('PinchGestureBasic02_target_area_position_x');
      let obj18: ESObject = JSON.parse(text18);
      console.log('PinchGestureBasic02Test_0010 obj18 $attrs content',vp2px(Number(obj18.$attrs.content)),areaObj1.left-FatherObj.left)
      console.log('PinchGestureBasic02Test_0010 obj18 $attrs position_x',obj18.$attrs.content, Number(obj18.$attrs.content), vp2px(Number(obj18.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj18.$attrs.content)))- (areaObj1.left-FatherObj.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text19 = getInspectorByKey('PinchGestureBasic02_target_area_position_y');
      let obj19: ESObject = JSON.parse(text19);
      console.log('PinchGestureBasic02Test_0010 obj19 $attrs content',vp2px(Number(obj19.$attrs.content)),areaObj1.top-FatherObj.top)
      console.log('PinchGestureBasic02Test_0010 obj19 $attrs position_y',obj19.$attrs.content, Number(obj19.$attrs.content), vp2px(Number(obj19.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj19.$attrs.content)))- (areaObj1.top-FatherObj.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text20 = getInspectorByKey('PinchGestureBasic02_target_area_globalPosition_x');
      let obj20: ESObject = JSON.parse(text20);
      console.log('PinchGestureBasic02Test_0010 obj20 $attrs content',vp2px(Number(obj20.$attrs.content)),areaObj1.left - windowOffsetX)
      console.log('PinchGestureBasic02Test_0010 obj20 $attrs area_globalPosition_x',obj20.$attrs.content, Number(obj20.$attrs.content), vp2px(Number(obj20.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj20.$attrs.content)))- (areaObj1.left - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text21 = getInspectorByKey('PinchGestureBasic02_target_area_globalPosition_y');
      let obj21: ESObject = JSON.parse(text21);
      console.log('PinchGestureBasic02Test_0010 obj21 $attrs content',vp2px(Number(obj21.$attrs.content)),areaObj1.top - windowOffsetY)
      console.log('PinchGestureBasic02Test_0010 obj21 $attrs area_globalPosition_y',obj21.$attrs.content, Number(obj21.$attrs.content), vp2px(Number(obj21.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj21.$attrs.content)))- (areaObj1.top - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text22 = getInspectorByKey('PinchGestureBasic02_source');
      let obj22: ESObject = JSON.parse(text22);
      console.log('PinchGestureBasic02Test_0010 obj22 $attrs content',obj22.$attrs.content,obj22)
      expect(obj22.$attrs.content).assertEqual('source:2');

      await CommonFunc.sleep(200);
      let text23 = getInspectorByKey('PinchGestureBasic02_pressure');
      let obj23: ESObject = JSON.parse(text23);
      console.log('PinchGestureBasic02Test_0010 obj23 $attrs content',obj23.$attrs.content,obj23)
      expect(obj23.$attrs.content).assertEqual('pressure:0');

      await CommonFunc.sleep(200);
      let text24 = getInspectorByKey('PinchGestureBasic02_tiltX');
      let obj24: ESObject = JSON.parse(text24);
      console.log('PinchGestureBasic02Test_0010 obj24 $attrs content',obj24.$attrs.content,obj24)
      expect(obj24.$attrs.content).assertEqual('tiltX:0');

      await CommonFunc.sleep(200);
      let text25 = getInspectorByKey('PinchGestureBasic02_tiltY');
      let obj25: ESObject = JSON.parse(text25);
      console.log('PinchGestureBasic02Test_0010 obj25 $attrs content',obj25.$attrs.content,obj25)
      expect(obj25.$attrs.content).assertEqual('tiltY:0');

      await CommonFunc.sleep(200);
      let text26 = getInspectorByKey('PinchGestureBasic02_sourceTool');
      let obj26: ESObject = JSON.parse(text26);
      console.log('PinchGestureBasic02Test_0010 obj26 $attrs content',obj26.$attrs.content,obj26)
      expect(obj26.$attrs.content).assertEqual('sourceTool:FINGER');

      console.info('PinchGestureBasic02Test_0010 END');
      done();
    });
  })
}
