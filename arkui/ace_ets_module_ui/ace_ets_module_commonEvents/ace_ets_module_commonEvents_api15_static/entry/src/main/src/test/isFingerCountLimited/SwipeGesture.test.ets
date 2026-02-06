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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, MouseButton, ON, PointerMatrix } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swipeGestureTest() {
  describe('SwipeGestureTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('SwipeGesture beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Gesture/isFingerCountLimited/SwipeGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SwipeGesture state pages:' + JSON.stringify(pages));
        if (!('SwipeGesture' == pages.name)) {
          console.info('get SwipeGesture state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push SwipeGesture page error:' + err);
      }
    });

    
/**
     * @tc.number   SwipeGesture1_static_0100
     * @tc.name     SwipeGesture1_static_0100
     * @tc.desc     SwipeGesture1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SwipeGesture1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SwipeGesture1_static_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX: number = AppStorage.get<number>("winLeft") as number
      let windowOffsetY: number = AppStorage.get<number>("winTop") as number
      console.log('SwipeGesture1_static_0100 windowOffsetX and windowOffsetY', windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('SwipeGesture');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('SwipeGesture1_static_0100 areaObj1', areaObj1.left, areaObj1.top, areaObj1.right, areaObj1.bottom)
      console.log('SwipeGesture1_static_0100 areaObj1 clicked start', Math.round(areaObj1.left + areaWidth1 / 4),
        Math.round(areaObj1.top + areaHeight1 / 4))
      console.log('SwipeGesture1_static_0100 areaObj1 clicked end', Math.round(areaObj1.left + areaWidth1 / 2),
        Math.round(areaObj1.top + areaHeight1 / 2))
      let driver = Driver.create();
      let speed = Math.floor(areaWidth1 * 0.6 / 0.016 / 1000) * 1000
      await CommonFunc.sleep(1000);
      await (driver.swipe(Math.round(areaObj1.left + areaWidth1 / 4) as int,
        Math.round(areaObj1.top + areaHeight1 / 4) as int, Math.round(areaObj1.left + areaWidth1 / 2) as int,
        Math.round(areaObj1.top + areaHeight1 / 2) as int, 800) as Promise<void>)
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('SwipeGesture');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SwipeGesture1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeGesture1_static_0100] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('success');
      console.info('[SwipeGesture1_static_0100] END');
      done();
    });


    
    
/**
     * @tc.number   SwipeGesture1_static_0200
     * @tc.name     SwipeGesture1_static_0200
     * @tc.desc     SwipeGesture1_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SwipeGesture1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SwipeGesture1_static_0200 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX: number = AppStorage.get<number>("winLeft") as number
      let windowOffsetY: number = AppStorage.get<number>("winTop") as number
      console.log('SwipeGesture1_static_0200 windowOffsetX and windowOffsetY', windowOffsetX, windowOffsetY)
      let areaObj2 = CommonFunc.getComponentRectOnScreen('SwipeGesture2');
      let areaHeight2 = areaObj2.bottom - areaObj2.top
      let areaWidth2 = areaObj2.right - areaObj2.left
      console.log('SwipeGesture1_static_0200 areaObj2', areaObj2.left, areaObj2.top, areaObj2.right, areaObj2.bottom)
      console.log('SwipeGesture1_static_0200 areaObj2 clicked start', Math.round(areaObj2.left + areaWidth2 * 0.2),
        Math.round(areaObj2.top + areaObj2.top + areaHeight2 / 2))
      console.log('SwipeGesture1_static_0200 areaObj2 clicked end', Math.round(areaObj2.left + areaWidth2 * 0.8),
        Math.round(areaObj2.top + areaObj2.top + areaHeight2 / 2))
      let driver = Driver.create();
      let speed = (Math.floor(areaWidth2 * 0.6 / 0.016 / 1000) * 1000) as int
      await CommonFunc.sleep(1000);
      await ((driver.swipe(Math.round(areaObj2.left + areaWidth2 * 0.2) as int,
        Math.round(areaObj2.top + areaObj2.top + areaHeight2 / 2) as int,
        Math.round(areaObj2.left + areaWidth2 * 0.8) as int,
        Math.round(areaObj2.top + areaObj2.top + areaHeight2 / 2) as int, speed)) as Promise<void>)
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('SwipeGesture2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SwipeGesture1_static_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeGesture1_static_0200] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('success');
      console.info('[SwipeGesture1_static_0200] END');
      done();
    });

  })
}
