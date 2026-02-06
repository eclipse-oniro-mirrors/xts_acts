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

export default function mouseEventTest() {
  describe('mouseEvent', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('mouseEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/Mouse',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get mouseEvent state pages: ' + JSON.stringify(pages));
        if (!('Mouse' == pages.name)) {
          console.info('get mouseEvent state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push mouseEvent page error: ' + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   Mouse1_static_0100
     * @tc.name     Mouse1_static_0100
     * @tc.desc     Mouse1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Mouse1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      await CommonFunc.sleep(1000);
      console.info('Mouse1_static_0100 START');
      let areaObj = CommonFunc.getComponentRectOnScreen('mouse');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      let mouseX = Math.round(areaObj.left + areaWidth * 0.5) as Int
      let mouseY = Math.round(areaObj.top + areaHeight * 0.5) as Int
      let driver = Driver.create();

      console.log('test driver is: ' + driver)
      await driver.mouseClick({
        x: mouseX, y: mouseY
      }, MouseButton.MOUSE_BUTTON_LEFT);

      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('value');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[Mouse1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[Mouse1_static_0100] title: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0,0,0,1');
      console.info('[Mouse1_static_0100] END');
      done();
    });
  })
}

