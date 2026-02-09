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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
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

export default function tapLocationTest() {
  describe('tapLocationTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi20.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/tapLocation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get tapLocationstate pages:' + JSON.stringify(pages));
        if (!('tapLocation' == pages.name)) {
          console.info('get tapLocation state pages.name:' + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push tapLocation page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push tapLocation page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('tapLocation after each called');
    });

    
    
/**
     * @tc.number   tapLocation1_static_0100
     * @tc.name     tapLocation1_static_0100
     * @tc.desc     tapLocation1_static_0100
     * @tc.level    Level.LEVEL1
     */
it('tapLocation1_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('tapLocation1_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('TapGesture'));
      await (Column?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('x');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[tapLocation1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[tapLocation1_static_0100] title: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).not().assertEqual('');
      console.info('[tapLocation1_static_0100] END');
      done();
    });

    
    
/**
     * @tc.number   tapLocation1_static_0200
     * @tc.name     tapLocation1_static_0200
     * @tc.desc     tapLocation1_static_0200
     * @tc.level    Level.LEVEL1
     */
it('tapLocation1_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('tapLocation1_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('TapGesture'));
      await (Column?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('y');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[tapLocation1_static_0200] component obj1 is: ' + JSON.stringify(obj1));
      console.info('[tapLocation1_static_0200] title: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).not().assertEqual('');
      console.info('[tapLocation1_static_0200] END');
      done();
    });
  })
}
