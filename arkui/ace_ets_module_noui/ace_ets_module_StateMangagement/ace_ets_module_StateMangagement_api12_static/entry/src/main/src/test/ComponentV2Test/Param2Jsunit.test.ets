'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function Param2Jsunit() {
  describe('Param2Jsunit', () => {

    beforeAll(() => {
      console.info("Param2Jsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Param2Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/Param2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Param2Jsunit state pages:" + JSON.stringify(pages));
        if (!("Param2Jsunit" == pages.name)) {
          console.info("get Param2Jsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Param2Jsunit page error:" + err);
      }
      console.info("Param2Jsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Param2Jsunit after each called");
    });

    
    
    /**
     * @tc.number   Param2Jsunit_static_001
     * @tc.name     Param2Jsunit_static_001
     * @tc.desc     Param2Jsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('Param2Jsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Param2Jsunit_static_001] START');
      let strJson1 = inspector.getInspectorByKey('param_text');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[Param2Jsunit_static_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[Param2Jsunit_static_001] content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Param 0');

      let strJson2 = inspector.getInspectorByKey('param1_text');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[Param2Jsunit_static_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[Param2Jsunit_static_001] content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Param1 5');

      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("param_change"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('param1_text');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[Param2Jsunit_static_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('Param1 6');
      console.info('[Param2Jsunit_static_001] END');
      done();
    });
  })
}
