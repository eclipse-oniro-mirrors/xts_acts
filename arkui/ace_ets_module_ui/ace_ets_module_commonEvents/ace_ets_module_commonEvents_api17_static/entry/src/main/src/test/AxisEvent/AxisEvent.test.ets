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
import { Driver } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function AxisEvent() {
  describe('AxisEvent', () => {
    beforeAll(() => {
      console.info("AxisEvent beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi17.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AxisEvent/AxisEvent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get AxisEvent state pages:' + JSON.stringify(pages));
        if (!('AxisEvent' == pages.name)) {
          console.info('get AxisEvent pages.name:' + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push AxisEvent page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push AxisEvent page error:' + err);
      }
      console.info('AxisEvent beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info('AxisEvent after each called');
    });

    
    
    /**
     * @tc.number   AxisEvent_static_0100
     * @tc.name     AxisEvent_static_0100
     * @tc.desc     AxisEvent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('AxisEvent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('AxisEvent_static_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = AppStorage.get<number>("winLeft") as number;
      let windowOffsetY:number = AppStorage.get<number>("winTop") as number;
      console.log('AxisEvent_static_0100 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let FatherObj = CommonFunc.getComponentRectOnScreen('AxisEvent_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('AxisEvent_static_0100 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('AxisEvent001');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('AxisEvent_static_0100 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('AxisEvent_static_0100 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))

      let driver:Driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('+++++++++++++++++++++++++++++++++1')
      // await driver.mouseScroll({x:Math.round(areaObj.left + areaWidth/2) as Int, y:Math.round(areaObj.top + areaHeight/2) as Int}, true, 30, 2072,20)
      console.log('+++++++++++++++++++++++++++++++++2')
      await CommonFunc.sleep(3000);
      console.log('+++++++++++++++++++++++++++++++++3')
      let text1 = inspector.getInspectorByKey('x');
      console.log('+++++++++++++++++++++++++++++++++4')
      let obj1 = JSON.parseJsonElement(text1);
      console.log('+++++++++++++++++++++++++++++++++5')
      console.log('AxisEvent_static_0100 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),obj1)
      expect(obj1.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text2 = inspector.getInspectorByKey('y');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('AxisEvent_static_0100 obj2 $attrs content',obj2.getElement('$attrs').getString('content'),obj2)
      expect(obj2.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text3 = inspector.getInspectorByKey('displayX');
      let obj3 = JSON.parseJsonElement(text3);
      console.log('AxisEvent_static_0100 obj3 $attrs content',obj3.getElement('$attrs').getString('content'),obj3)
      expect(obj3.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text4 = inspector.getInspectorByKey('displayY');
      let obj4 = JSON.parseJsonElement(text4);
      console.log('AxisEvent_static_0100 obj4 $attrs content',obj4.getElement('$attrs').getString('content'),obj4)
      expect(obj4.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text5 = inspector.getInspectorByKey('windowX');
      let obj5 = JSON.parseJsonElement(text5);
      console.log('AxisEvent_static_0100 obj5 $attrs content',obj5.getElement('$attrs').getString('content'),obj5)
      expect(obj5.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text6 = inspector.getInspectorByKey('windowY');
      let obj6 = JSON.parseJsonElement(text6);
      console.log('AxisEvent_static_0100 obj2 $attrs content',obj6.getElement('$attrs').getString('content'),obj6)
      expect(obj6.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text7 = inspector.getInspectorByKey('scrollStep');
      let obj7 = JSON.parseJsonElement(text7);
      console.log('AxisEvent_static_0100 obj7 $attrs content',obj7.getElement('$attrs').getString('content'),obj7)
      expect(obj7.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text8 = inspector.getInspectorByKey('action');
      let obj8 = JSON.parseJsonElement(text8);
      console.log('AxisEvent_static_0100 obj8 $attrs content',obj8.getElement('$attrs').getString('content'),obj8)
      expect(obj8.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text9 = inspector.getInspectorByKey('getVerticalAxisValue');
      let obj9 = JSON.parseJsonElement(text9);
      console.log('AxisEvent_static_0100 obj9 $attrs content',obj9.getElement('$attrs').getString('content'),obj9)
      expect(obj9.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text10 = inspector.getInspectorByKey('getHorizontalAxisValue');
      let obj10 = JSON.parseJsonElement(text10);
      console.log('AxisEvent_static_0100 obj10 $attrs content',obj10.getElement('$attrs').getString('content'),obj10)
      expect(obj10.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text11 = inspector.getInspectorByKey('propagationValue');
      let obj11 = JSON.parseJsonElement(text10);
      console.log('AxisEvent_static_0100 obj11 $attrs content',obj11.getElement('$attrs').getString('content'),obj11)
      expect(obj11.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text12 = inspector.getInspectorByKey('None');
      let obj12 = JSON.parseJsonElement(text12);
      console.log('AxisEvent_static_0100 obj11 $attrs content',obj11.getElement('$attrs').getString('content'),obj11)
      expect(obj12.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text13 = inspector.getInspectorByKey('Begin');
      let obj13 = JSON.parseJsonElement(text13);
      console.log('AxisEvent_static_0100 obj11 $attrs content',obj11.getElement('$attrs').getString('content'),obj11)
      expect(obj13.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text14 = inspector.getInspectorByKey('UPDATE');
      let obj14 = JSON.parseJsonElement(text10);
      console.log('AxisEvent_static_0100 obj14 $attrs content',obj11.getElement('$attrs').getString('content'),obj11)
      expect(obj14.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text15 = inspector.getInspectorByKey('Cancel');
      let obj15 = JSON.parseJsonElement(text15);
      console.log('AxisEvent_static_0100 obj11 $attrs content',obj11.getElement('$attrs').getString('content'),obj11)
      expect(obj15.getElement('$attrs').getString('content')).not().assertEqual('init');

      let text16 = inspector.getInspectorByKey('END');
      let obj16 = JSON.parseJsonElement(text15);
      console.log('AxisEvent_static_0100 obj16 $attrs content',obj16.getElement('$attrs').getString('content'),obj11)
      expect(obj16.getElement('$attrs').getString('content')).not().assertEqual('init');
      console.info('AxisEvent_static_0100 END');
      done();
    });
  })
}
