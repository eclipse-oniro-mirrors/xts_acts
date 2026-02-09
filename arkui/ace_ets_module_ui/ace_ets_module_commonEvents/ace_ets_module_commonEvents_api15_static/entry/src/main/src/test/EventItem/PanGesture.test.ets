'use static';
/**
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
import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON ,Component,PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function panGestureEventTest() {
  describe('panGestureEvent', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('panGestureEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/PanGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get panGestureEvent state pages: ' + JSON.stringify(pages));
        if (!('PanGesture' == pages.name)) {
          console.info('get panGestureEvent state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await router.push(options);
          await CommonFunc.sleep(2000);
          // console.info('push panGestureEvent success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push panGestureEvent page error: ' + err);
        expect().assertFail();
      }
    });

    
    
    
/**
     * @tc.number   PanGesture1_static_0100
     * @tc.name     PanGesture1_static_0100
     * @tc.desc     PanGesture1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PanGesture1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PanGesture1_static_0100 START');
      await CommonFunc.sleep(1000);
      let areaObj1  = CommonFunc.getComponentRectOnScreen('PanGesture1');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('PanGesture1_static_0100 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('PanGesture1_static_0100 areaObj1 clicked finger[0] start',Math.round(areaObj1.left + areaWidth1 * 0.1),Math.round(areaObj1.top + areaHeight1 * 0.5))
      console.log('PanGesture1_static_0100 areaObj1 clicked finger[0] end',Math.round(areaObj1.left + areaWidth1 * 0.3),Math.round(areaObj1.top + areaHeight1 * 0.5))
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x: Math.round(areaObj1.left + areaWidth1 * 0.1) as Int,y: Math.round(areaObj1.top + areaHeight1 * 0.5) as Int });
      pointers.setPoint(0,1,{x: Math.round(areaObj1.left + areaWidth1 * 0.3) as Int,y: Math.round(areaObj1.top + areaHeight1 * 0.5) as Int });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('PanGesture1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[PanGesture1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[PanGesture1_static_0100] title: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[PanGesture1_static_0100] END');
      done();
    });

  })
}

