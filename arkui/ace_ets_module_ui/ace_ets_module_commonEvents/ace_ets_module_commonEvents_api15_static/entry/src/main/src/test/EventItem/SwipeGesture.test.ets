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
import { Component, Driver, ON, PointerMatrix } from '@ohos.UiTest';
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

export default function swipeGestureEventTest() {
  describe('swipeGestureEvent', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('swipeGestureEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/SwipeGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get swipeGestureEvent state pages: ' + JSON.stringify(pages));
        if (!('SwipeGesture' == pages.name)) {
          console.info('get swipeGestureEvent state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push swipeGestureEvent page error: ' + err);
        expect().assertFail();
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
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let colum = CommonFunc.getComponentRectOnScreen('SwipeGesture1');
      await CommonFunc.sleep(1000);
      let top = colum.top
      let left = colum.left
      console.log('test start get data is:' + colum.top + '[]' + colum.left)
      console.log('test start get data is:' + Math.round(AppStorage.get<number>("winLeft")! + 100) +
        '[]' + Math.round(top + 100) + '[]' +
      Math.round(AppStorage.get<number>("winLeft")! + 500) + '[]' + Math.round(top + 500) + '[]' + 600)

      await driver.swipe(Math.round(AppStorage.get<number>("winLeft")! + 100).toInt(),
        Math.round(top + 100).toInt(),
        Math.round(AppStorage.get<number>("winLeft")! + 500).toInt(), Math.round(top + 500).toInt(), 600 as Int)

      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('value');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SwipeGesture1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeGesture1_static_0100] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[SwipeGesture1_static_0100] END');
      done();
    });

  })
}

