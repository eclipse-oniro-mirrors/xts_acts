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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function OnNewParamPage() {
  describe('OnNewParamPage', () => {

    beforeAll(() => {
      console.info("stepper beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear18.static", "EntryAbility")

    });

    beforeEach(async (done: () => void): Promise<void> => {
      console.info("OnNewParamPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/OnNewParamPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnNewParamPage state pages:" + JSON.stringify(pages));
        if (!("OnNewParamPage" == pages.name)) {
          console.info("get OnNewParamPage pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push OnNewParamPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnNewParamPage page error:" + err);
      }
      console.info("OnNewParamPage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnNewParamPage after each called");
    });


    
    /**
     * @tc.number   OnNewParamPage_static_0100
     * @tc.name     OnNewParamPage_static_0100
     * @tc.desc     OnNewParamPage_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('OnNewParamPage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnNewParamPage_static_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushId')) as Component;
      await btn1.click()
      console.info('[OnNewParamPage_static_0100] btn1 click');
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('standardId')) as Component;
      await btn2.click()
      console.info('[OnNewParamPage_static_0100] btn2 click');
      await driver.delayMs(1000);

      let strJson: string = inspector.getInspectorByKey('paramId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnNewParamPage_static_0100] component obj is: ' + JSON.stringifyJsonElement(obj));
      console.info('[OnNewParamPage_static_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      let btn3: Component = await driver.findComponent(ON.id('instanceId')) as Component;
      await btn3.click()
      console.info('[OnNewParamPage_static_0100] btn3 click');
      await driver.delayMs(1000);

      let strJson1: string = inspector.getInspectorByKey('paramId');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[OnNewParamPage_static_0100] component obj1 is: ' + JSON.stringifyJsonElement(obj1));
      console.info('[OnNewParamPage_static_0100] content obj1 is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');
      await driver.delayMs(1000);

      let btn4: Component = await driver.findComponent(ON.id('moveId')) as Component;
      await btn4.click()
      console.info('[OnNewParamPage_static_0100] btn4 click');
      await driver.delayMs(1000);

      let strJson2: string = inspector.getInspectorByKey('paramId');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[OnNewParamPage_static_0100] component obj2 is: ' + JSON.stringifyJsonElement(obj2));
      console.info('[OnNewParamPage_static_0100] content obj2 is: ' + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('{"msg":"MOVE_TO_TOP_SINGLETON"}');
      await driver.delayMs(1000);

      let btn5: Component = await driver.findComponent(ON.id('popId')) as Component;
      await btn5.click()
      console.info('[OnNewParamPage_static_0100] btn5 click');
      await driver.delayMs(1000);

      let strJson3: string = inspector.getInspectorByKey('paramId');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[OnNewParamPage_static_0100] component obj3 is: ' + JSON.stringifyJsonElement(obj3));
      console.info('[OnNewParamPage_static_0100] content obj3 is: ' + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('10');

      console.info('OnNewParamPage_static_0100 END');
      done();
    });

  })
}