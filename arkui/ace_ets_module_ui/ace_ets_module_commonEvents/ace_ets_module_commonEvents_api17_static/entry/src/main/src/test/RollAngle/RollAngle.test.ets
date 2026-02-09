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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType,Size,Level } from '../../../../hypium/index';
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

export default function RollAngle() {
  describe('RollAngle', () => {
    beforeAll(() => {
      console.info("RollAngle beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi17.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RollAngle/RollAngle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get RollAngle state pages: ' + JSON.stringify(pages));
        if (!('MainAbility/pages/RollAngle/RollAngle' == pages.name)) {   //if (!('RollAngle' == pages.name)) {

          console.info('get RollAngle state pages.name: ' + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push RollAngle success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RollAngle page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('RollAngle after each called');
    });

    
    
    /**
     * @tc.number   RollAngle_static_0100
     * @tc.name     RollAngle_static_0100
     * @tc.desc     RollAngle_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('RollAngle_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RollAngle_static_0100] START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Touch'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(3000);

      // test the child component response
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RollAngle_static_0100] strJson is: ' + strJson);
      console.info('[RollAngle_static_0100] RollAngle obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).not().assertEqual('undefined');

      console.info('[RollAngle_static_0100] END')
      done();
    });
  })
}