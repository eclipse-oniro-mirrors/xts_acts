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


export default function RepeatObservedV2Nest() {
  describe('RepeatObservedV2Nest', () => {

    beforeAll(() => {
      console.info("RepeatObservedV2Nest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("RepeatObservedV2Nest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMix/RepeatObservedV2Nest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RepeatObservedV2Nest state pages:" + JSON.stringify(pages));
        if (!("RepeatObservedV2Nest" == pages.name)) {
          console.info("get RepeatObservedV2Nest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push RepeatObservedV2Nest page error:" + err);
      }
      console.info("RepeatObservedV2Nest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatObservedV2Nest after each called");
    });

    
    
    /**
     * @tc.number   RepeatObservedV2Nest_static_001
     * @tc.name     RepeatObservedV2Nest_static_001
     * @tc.desc     RepeatObservedV2Nest_static_001
     * @tc.level    Level.LEVEL0
     */
it('RepeatObservedV2Nest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RepeatObservedV2Nest_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component|null = await driver.findComponent(ON.id('button2'));
      let strJson = inspector.getInspectorByKey('repeat1_V2N0');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RepeatObservedV2Nest_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('innerObject0');
      console.info('[RepeatObservedV2Nest_static_001] END');

      let strJson1 = inspector.getInspectorByKey('repeat1_V2N2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[RepeatObservedV2Nest_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('innerObject2');
      console.info('[RepeatObservedV2Nest_static_001] END');

      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('repeat1_V2N2');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[RepeatObservedV2Nest_static_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('100');
      console.info('[RepeatObservedV2Nest_static_001] END');
      done();
    });
  })
}
