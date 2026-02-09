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

export default function SwipeGestureExample02Test() {
  describe('SwipeGestureExample02Test', () => {
    beforeEach(async (done: Function) => {
      console.info("SwipeGestureExample02Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwipeGesture/SwipeGestureExample02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwipeGestureExample02Test state pages:" + JSON.stringify(pages));
        if (!("SwipeGestureExample02" == pages.name)) {
          console.info("get SwipeGestureExample02Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SwipeGestureExample02Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwipeGestureExample02Test page error:" + err);
      }
      console.info("SwipeGestureExample02Test beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("SwipeGestureExample02Test after each called");
    });

    /**
     * @tc.name   SwipeGestureExample02Test_0010
     * @tc.number SwipeGestureExample02Test_0010
     * @tc.desc   api test SwipeGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwipeGestureExample02Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('SwipeGestureExample02Test_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('SwipeGestureExample02Test_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('SwipeGestureExample02_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('SwipeGestureExample02Test_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('SwipeGestureExample02Test_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.top + areaHeight1 * 0.2))
      console.log('SwipeGestureExample02Test_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.bottom + areaHeight1 * 0.9))
      let driver = Driver.create();
      let speed = Math.floor(areaHeight1 * 1.7 / 0.016 / 1000) * 1000
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.top + areaHeight1 * 0.2),Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.bottom + areaHeight1 * 0.9),speed)
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

      let text1 = getInspectorByKey('SwipeGestureExample02_repeat');
      let obj1: ESObject = JSON.parse(text1);
      console.log('SwipeGestureExample02Test_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('repeat:false');

      await CommonFunc.sleep(200);
      let text2 = getInspectorByKey('SwipeGestureExample02_offsetX');
      let obj2: ESObject = JSON.parse(text2);
      console.log('SwipeGestureExample02Test_0010 obj2 $attrs content',obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('0');

      await CommonFunc.sleep(200);
      let text3 = getInspectorByKey('SwipeGestureExample02_offsetY');
      let obj3: ESObject = JSON.parse(text3);
      console.log('SwipeGestureExample02Test_0010 obj3 $attrs content',obj3.$attrs.content)
      expect(obj3.$attrs.content).assertEqual('0');

      await CommonFunc.sleep(200);
      let text4 = getInspectorByKey('SwipeGestureExample02_angle');
      let obj4: ESObject = JSON.parse(text4);
      console.log('SwipeGestureExample02Test_0010 obj4 $attrs content',obj4.$attrs.content,obj4)
      expect(Number(obj4.$attrs.content) - 90 <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text5 = getInspectorByKey('SwipeGestureExample02_scale');
      let obj5: ESObject = JSON.parse(text5);
      console.log('SwipeGestureExample02Test_0010 obj5 $attrs content',obj5.$attrs.content,obj5)
      expect(obj5.$attrs.content).assertEqual('scale:1');

      await CommonFunc.sleep(200);
      let text6 = getInspectorByKey('SwipeGestureExample02_pinchCenterX');
      let obj6: ESObject = JSON.parse(text6);
      console.log('SwipeGestureExample02Test_0010 obj6 $attrs content',obj6.$attrs.content,obj6)
      expect(obj6.$attrs.content).assertEqual('pinchCenterX:0');

      await CommonFunc.sleep(200);
      let text7 = getInspectorByKey('SwipeGestureExample02_pinchCenterY');
      let obj7: ESObject = JSON.parse(text7);
      console.log('SwipeGestureExample02Test_0010 obj7 $attrs content',obj7.$attrs.content,obj7)
      expect(obj7.$attrs.content).assertEqual('pinchCenterY:0');

      await CommonFunc.sleep(200);
      let text9 = getInspectorByKey('SwipeGestureExample02_fingerList_id');
      let obj9: ESObject = JSON.parse(text9);
      console.log('SwipeGestureExample02Test_0010 obj9 $attrs content',obj9.$attrs.content,obj9)
      expect(obj9.$attrs.content).assertEqual('fingerList_id:0');

      await CommonFunc.sleep(200);
      let text10 = getInspectorByKey('SwipeGestureExample02_fingerList_globalX');
      let obj10: ESObject = JSON.parse(text10);
      console.log('SwipeGestureExample02Test_0010 obj10 $attrs content',vp2px(Number(obj10.$attrs.content)),Math.round(areaObj1.left + areaWidth1/2) - windowOffsetX)
      console.log('SwipeGestureExample02Test_0010 obj10 $attrs fingerList_globalX',obj10.$attrs.content, Number(obj10.$attrs.content), vp2px(Number(obj10.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj10.$attrs.content)))- (Math.round(areaObj1.left + areaWidth1/2) - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text11 = getInspectorByKey('SwipeGestureExample02_fingerList_globalY');
      let obj11: ESObject = JSON.parse(text11);
      console.log('SwipeGestureExample02Test_0010 obj11 $attrs content',vp2px(Number(obj11.$attrs.content)),Math.round(areaObj1.bottom + areaHeight1 * 0.9) - windowOffsetY)
      console.log('SwipeGestureExample02Test_0010 obj11 $attrs fingerList_globalY',obj11.$attrs.content, Number(obj11.$attrs.content), vp2px(Number(obj11.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj11.$attrs.content)))- (Math.round(areaObj1.bottom + areaHeight1 * 0.9) - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text12 = getInspectorByKey('SwipeGestureExample02_fingerList_localX');
      let obj12: ESObject = JSON.parse(text12);
      console.log('SwipeGestureExample02Test_0010 obj12 $attrs content',vp2px(Number(obj12.$attrs.content)),Math.round(areaObj1.left + areaWidth1/2) - areaObj1.left)
      console.log('SwipeGestureExample02Test_0010 obj12 $attrs localX',obj12.$attrs.content, Number(obj12.$attrs.content), vp2px(Number(obj12.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj12.$attrs.content)))- (Math.round(areaObj1.left + areaWidth1/2) - areaObj1.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text13 = getInspectorByKey('SwipeGestureExample02_fingerList_localY');
      let obj13: ESObject = JSON.parse(text13);
      console.log('SwipeGestureExample02Test_0010 obj13 $attrs content',vp2px(Number(obj13.$attrs.content)),Math.round(areaObj1.bottom + areaHeight1 * 0.9) - areaObj1.top)
      console.log('SwipeGestureExample02Test_0010 obj13 $attrs localY',obj13.$attrs.content, Number(obj13.$attrs.content), vp2px(Number(obj13.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj13.$attrs.content)))- (Math.round(areaObj1.bottom + areaHeight1 * 0.9) - areaObj1.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text16 = getInspectorByKey('SwipeGestureExample02_target_area_width');
      let obj16: ESObject = JSON.parse(text16);
      console.log('SwipeGestureExample02Test_0010 obj16 $attrs content',obj16.$attrs.content, vp2px(Number(obj16.$attrs.content)), vp2px(240))
      expect(Math.abs(vp2px(Number(obj16.$attrs.content)) - vp2px(240)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text17 = getInspectorByKey('SwipeGestureExample02_target_area_height');
      let obj17: ESObject = JSON.parse(text17);
      console.log('SwipeGestureExample02Test_0010 obj17 $attrs content',obj17.$attrs.content, vp2px(Number(obj17.$attrs.content)), vp2px(80))
      expect(Math.abs(vp2px(Number(obj17.$attrs.content)) - vp2px(80)) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text18 = getInspectorByKey('SwipeGestureExample02_target_area_position_x');
      let obj18: ESObject = JSON.parse(text18);
      console.log('SwipeGestureExample02Test_0010 obj18 $attrs content',vp2px(Number(obj18.$attrs.content)),areaObj1.left-FatherObj.left)
      console.log('SwipeGestureExample02Test_0010 obj18 $attrs position_x',obj18.$attrs.content, Number(obj18.$attrs.content), vp2px(Number(obj18.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj18.$attrs.content)))- (areaObj1.left-FatherObj.left))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text19 = getInspectorByKey('SwipeGestureExample02_target_area_position_y');
      let obj19: ESObject = JSON.parse(text19);
      console.log('SwipeGestureExample02Test_0010 obj19 $attrs content',vp2px(Number(obj19.$attrs.content)),areaObj1.top-FatherObj.top)
      console.log('SwipeGestureExample02Test_0010 obj19 $attrs position_y',obj19.$attrs.content, Number(obj19.$attrs.content), vp2px(Number(obj19.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj19.$attrs.content)))- (areaObj1.top-FatherObj.top))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text20 = getInspectorByKey('SwipeGestureExample02_target_area_globalPosition_x');
      let obj20: ESObject = JSON.parse(text20);
      console.log('SwipeGestureExample02Test_0010 obj20 $attrs content',vp2px(Number(obj20.$attrs.content)),areaObj1.left - windowOffsetX)
      console.log('SwipeGestureExample02Test_0010 obj20 $attrs area_globalPosition_x',obj20.$attrs.content, Number(obj20.$attrs.content), vp2px(Number(obj20.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj20.$attrs.content)))- (areaObj1.left - windowOffsetX))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text21 = getInspectorByKey('SwipeGestureExample02_target_area_globalPosition_y');
      let obj21: ESObject = JSON.parse(text21);
      console.log('SwipeGestureExample02Test_0010 obj21 $attrs content',vp2px(Number(obj21.$attrs.content)),areaObj1.top - windowOffsetY)
      console.log('SwipeGestureExample02Test_0010 obj21 $attrs area_globalPosition_y',obj21.$attrs.content, Number(obj21.$attrs.content), vp2px(Number(obj21.$attrs.content)))
      expect(Math.abs(Math.round((vp2px(Number(obj21.$attrs.content)))- (areaObj1.top - windowOffsetY))) <= 1).assertTrue();

      await CommonFunc.sleep(200);
      let text22 = getInspectorByKey('SwipeGestureExample02_source');
      let obj22: ESObject = JSON.parse(text22);
      console.log('SwipeGestureExample02Test_0010 obj22 $attrs content',obj22.$attrs.content,obj22)
      expect(obj22.$attrs.content).assertEqual('source:2');

      await CommonFunc.sleep(200);
      let text23 = getInspectorByKey('SwipeGestureExample02_pressure');
      let obj23: ESObject = JSON.parse(text23);
      console.log('SwipeGestureExample02Test_0010 obj23 $attrs content',obj23.$attrs.content,obj23)
      expect(obj23.$attrs.content).assertEqual('pressure:0');

      await CommonFunc.sleep(200);
      let text24 = getInspectorByKey('SwipeGestureExample02_tiltX');
      let obj24: ESObject = JSON.parse(text24);
      console.log('SwipeGestureExample02Test_0010 obj24 $attrs content',obj24.$attrs.content,obj24)
      expect(obj24.$attrs.content).assertEqual('tiltX:0');

      await CommonFunc.sleep(200);
      let text25 = getInspectorByKey('SwipeGestureExample02_tiltY');
      let obj25: ESObject = JSON.parse(text25);
      console.log('SwipeGestureExample02Test_0010 obj25 $attrs content',obj25.$attrs.content,obj25)
      expect(obj25.$attrs.content).assertEqual('tiltY:0');

      await CommonFunc.sleep(200);
      let text26 = getInspectorByKey('SwipeGestureExample02_sourceTool');
      let obj26: ESObject = JSON.parse(text26);
      console.log('SwipeGestureExample02Test_0010 obj26 $attrs content',obj26.$attrs.content,obj26)
      expect(obj26.$attrs.content).assertEqual('sourceTool:FINGER');

      console.info('SwipeGestureExample02Test_0010 END');
      done();
    });


  })
}
