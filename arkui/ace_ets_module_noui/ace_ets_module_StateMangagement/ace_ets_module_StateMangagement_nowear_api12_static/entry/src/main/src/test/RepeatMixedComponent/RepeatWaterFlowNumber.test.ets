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

export default function RepeatWaterFlowNumber() {
  describe('RepeatWaterFlowNumber', () => {
    beforeAll(() => {
      console.info("RepeatWaterFlowNumber beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.nowear.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("RepeatWaterFlowNumber beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMixedComponent/RepeatWaterFlowNumber",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RepeatWaterFlowNumber state pages:" + JSON.stringify(pages));
        if (!("RepeatWaterFlowNumber" == pages.name)) {
          console.info("get RepeatWaterFlowNumber pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RepeatWaterFlowNumber page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatWaterFlowNumber page error:" + err);
      }
      console.info("RepeatWaterFlowNumber beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatWaterFlowNumber after each called");
    });

    /**
     * @tc.number RepeatWaterFlowNumber_static_001
     * @tc.name RepeatWaterFlowNumber_static_001
     * @tc.desc Test RepeatWaterFlowNumber component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatWaterFlowNumber_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RepeatWaterFlowNumber_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Text1_WN2');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[RepeatWaterFlowNumber_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2 index:2:0');
      console.info('[RepeatWaterFlowNumber_static_001] END');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('Text2_WN2');
      let obj1= JSON.parseJsonElement(strJson1);
      console.info("[RepeatWaterFlowNumber_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('2 index:2:0');
      console.info('[RepeatWaterFlowNumber_static_001] END');
      await CommonFunc.sleep(1000);

      let btn: Component = await driver.findComponent(ON.id('Button1_WN')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson2 = inspector.getInspectorByKey('Text1_WN15');
      let obj2= JSON.parseJsonElement(strJson2);
      console.info("[RepeatWaterFlowNumber_static_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('15 index:15:0');
      console.info('[RepeatWaterFlowNumber_static_001] END');
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('Button2_WN')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);

      let strJson3 = inspector.getInspectorByKey('Text1_WN15');
      let obj3= JSON.parseJsonElement(strJson3);
      console.info("[RepeatWaterFlowNumber_static_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('15 index:15:100');
      console.info('[RepeatWaterFlowNumber_static_001] END');
      done();
    });
  })
}
