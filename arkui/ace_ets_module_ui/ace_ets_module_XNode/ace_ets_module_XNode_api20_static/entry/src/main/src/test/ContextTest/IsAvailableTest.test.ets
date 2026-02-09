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
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function IsAvailableTest() {
  describe('IsAvailableTest', () => {
    beforeAll(() => {
      console.info("IsAvailableTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.XNode.api20.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      console.info("IsAvailableTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/IsAvailableTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IsAvailableTest state pages:" + JSON.stringify(pages));
        if (!("IsAvailableTest" == pages.name)) {
          console.info("get IsAvailableTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push IsAvailableTest page error:" + err);
      }
      console.info("IsAvailableTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IsAvailableTest after each called");
    });
        
    /**
     * @tc.number   IsAvailableTest_static_0100
     * @tc.name     IsAvailableTest_static_0100
     * @tc.desc     IsAvailableTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('IsAvailableTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('IsAvailableTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_isAvailable'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1: string = inspector.getInspectorByKey('isAvailable1_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[IsAvailableTest_static_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[IsAvailableTest_static_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));

      let strJson2: string = inspector.getInspectorByKey('isAvailable2_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[IsAvailableTest_static_0100] component obj2 is: " + JSON.stringifyJsonElement(obj2));
      console.info("[IsAvailableTest_static_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('true');
      // expect(obj2.getElement('$attrs').getString('content')).assertEqual('false');
      console.info('[IsAvailableTest_static_0100] END');
      done();
    });
  })
}