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
import {UiComponent,MouseButton, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function AxisEvent() {
  describe('AxisEvent', () => {
    beforeEach(async (done: Function) => {
      console.info('AxisEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AxisEvent/AxisEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get AxisEvent state pages:' + JSON.stringify(pages));
        if (!('AxisEvent' == pages.name)) {
          console.info('get AxisEvent pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push AxisEvent page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push AxisEvent page error:' + err);
      }
      console.info('AxisEvent beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info('AxisEvent after each called');
    });

    /**
     * @tc.number
     * @tc.name      AxisEvent_0100
     * @tc.desc      api test TapGesture
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('AxisEvent_0100', Level.LEVEL0, async (done: Function) => {
      console.info('AxisEvent_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('AxisEvent_0100 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let FatherObj = CommonFunc.getComponentRectOnScreen('AxisEvent_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('AxisEvent_0100 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('AxisEvent001');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('AxisEvent_0100 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('AxisEvent_0100 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))

      let driver:Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.mouseScroll({x:Math.round(areaObj.left + areaWidth/2), y:Math.round(areaObj.top + areaHeight/2)}, true, 30, 2072,20)
      await CommonFunc.sleep(3000);
      let text1 = getInspectorByKey('x');
      let obj1: ESObject = JSON.parse(text1);
      console.log('AxisEvent_0100 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).not().assertEqual('init');

      let text2 = getInspectorByKey('y');
      let obj2: ESObject = JSON.parse(text2);
      console.log('AxisEvent_0100 obj2 $attrs content',obj2.$attrs.content,obj2)
      expect(obj2.$attrs.content).not().assertEqual('init');

      let text3 = getInspectorByKey('displayX');
      let obj3: ESObject = JSON.parse(text3);
      console.log('AxisEvent_0100 obj3 $attrs content',obj3.$attrs.content,obj3)
      expect(obj3.$attrs.content).not().assertEqual('init');

      let text4 = getInspectorByKey('displayY');
      let obj4: ESObject = JSON.parse(text4);
      console.log('AxisEvent_0100 obj4 $attrs content',obj4.$attrs.content,obj4)
      expect(obj4.$attrs.content).not().assertEqual('init');

      let text5 = getInspectorByKey('windowX');
      let obj5: ESObject = JSON.parse(text5);
      console.log('AxisEvent_0100 obj5 $attrs content',obj5.$attrs.content,obj5)
      expect(obj5.$attrs.content).not().assertEqual('init');

      let text6 = getInspectorByKey('windowY');
      let obj6: ESObject = JSON.parse(text6);
      console.log('AxisEvent_0100 obj2 $attrs content',obj6.$attrs.content,obj6)
      expect(obj6.$attrs.content).not().assertEqual('init');

      let text7 = getInspectorByKey('scrollStep');
      let obj7: ESObject = JSON.parse(text7);
      console.log('AxisEvent_0100 obj7 $attrs content',obj7.$attrs.content,obj7)
      expect(obj7.$attrs.content).not().assertEqual('init');

      let text8 = getInspectorByKey('action');
      let obj8: ESObject = JSON.parse(text8);
      console.log('AxisEvent_0100 obj8 $attrs content',obj8.$attrs.content,obj8)
      expect(obj8.$attrs.content).not().assertEqual('init');

      let text9 = getInspectorByKey('getVerticalAxisValue');
      let obj9: ESObject = JSON.parse(text9);
      console.log('AxisEvent_0100 obj9 $attrs content',obj9.$attrs.content,obj9)
      expect(obj9.$attrs.content).not().assertEqual('init');

      let text10 = getInspectorByKey('getHorizontalAxisValue');
      let obj10: ESObject = JSON.parse(text10);
      console.log('AxisEvent_0100 obj10 $attrs content',obj10.$attrs.content,obj10)
      expect(obj10.$attrs.content).not().assertEqual('init');

      let text11 = getInspectorByKey('propagationValue');
      let obj11: ESObject = JSON.parse(text10);
      console.log('AxisEvent_0100 obj11 $attrs content',obj11.$attrs.content,obj11)
      expect(obj11.$attrs.content).not().assertEqual('init');

      let text12 = getInspectorByKey('None');
      let obj12: ESObject = JSON.parse(text12);
      console.log('AxisEvent_0100 obj11 $attrs content',obj11.$attrs.content,obj11)
      expect(obj12.$attrs.content).not().assertEqual('init');

      let text13 = getInspectorByKey('Begin');
      let obj13: ESObject = JSON.parse(text13);
      console.log('AxisEvent_0100 obj11 $attrs content',obj11.$attrs.content,obj11)
      expect(obj13.$attrs.content).not().assertEqual('init');

      let text14 = getInspectorByKey('UPDATE');
      let obj14: ESObject = JSON.parse(text10);
      console.log('AxisEvent_0100 obj14 $attrs content',obj11.$attrs.content,obj11)
      expect(obj14.$attrs.content).not().assertEqual('init');

      let text15 = getInspectorByKey('Cancel');
      let obj15: ESObject = JSON.parse(text15);
      console.log('AxisEvent_0100 obj11 $attrs content',obj11.$attrs.content,obj11)
      expect(obj15.$attrs.content).not().assertEqual('init');

      let text16 = getInspectorByKey('END');
      let obj16: ESObject = JSON.parse(text15);
      console.log('AxisEvent_0100 obj16 $attrs content',obj16.$attrs.content,obj11)
      expect(obj16.$attrs.content).not().assertEqual('init');
      console.info('AxisEvent_0100 END');
      done();
    });
  })
}
