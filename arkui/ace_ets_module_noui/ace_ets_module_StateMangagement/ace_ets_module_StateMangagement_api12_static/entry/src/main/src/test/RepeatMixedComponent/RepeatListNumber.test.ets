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


export default function RepeatListNumber() {
  describe('RepeatListNumber', () => {

    beforeAll(() => {
      console.info("RepeatListNumber beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("RepeatListNumber beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMixedComponent/RepeatListNumber",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RepeatListNumber state pages:" + JSON.stringify(pages));
        if (!("RepeatListNumber" == pages.name)) {
          console.info("get RepeatListNumber pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push RepeatListNumber page error:" + err);
      }
      console.info("RepeatListNumber beforeEach end");
    });
    
   
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatListNumber after each called");
    });

    
    
    /**
     * @tc.number   RepeatListNumber_static_001
     * @tc.name     RepeatListNumber_static_001
     * @tc.desc     RepeatListNumber_static_001
     * @tc.level    Level.LEVEL0
     */
it('RepeatListNumber_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RepeatListNumber_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Text1_LN2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RepeatListNumber_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('non vs 2 index:2:0');
      console.info('[RepeatListNumber_static_001] END');

      let strJson1 = inspector.getInspectorByKey('Text2_LN2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[RepeatListNumber_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('has vs 2 index:2:0');
      console.info('[RepeatListNumber_static_001] END');


      let btn: Component|null = await driver.findComponent(ON.id('Button1_LN'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('Text1_LN16');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[RepeatListNumber_static_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('non vs 16 index:16:0');
      console.info('[RepeatListNumber_static_001] END');

      let btn1: Component|null = await driver.findComponent(ON.id('Button2_LN'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('Text1_LN16');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[RepeatListNumber_static_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('non vs 16 index:16:100');
      console.info('[RepeatListNumber_static_001] END');
      done();
    });
  })
}
