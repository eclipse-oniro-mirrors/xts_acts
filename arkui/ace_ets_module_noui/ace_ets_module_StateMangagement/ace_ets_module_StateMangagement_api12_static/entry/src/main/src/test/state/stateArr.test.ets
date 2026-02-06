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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index"
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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function stateArr() {
  describe('stateArr', () => {
    beforeAll(() => {
      console.info("stateArr beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("stateArr beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/state/stateArr",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stateArr state pages:" + JSON.stringify(pages));
        if (!("stateArr" == pages.name)) {
          console.info("get stateArr pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push stateArr page error:" + err);
      }
      console.info("stateArr beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stateArr after each called");
    });

    
    
    /**
     * @tc.number   StateArr0010TestJsunit_static_001
     * @tc.name     StateArr0010TestJsunit_static_001
     * @tc.desc     StateArr0010TestJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('StateArr0010TestJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StateArr0010TestJsunit_static_001] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id("btnStateArr0010Set"));
      await CommonFunc.sleep(1000);
      console.info('[StateArr0010TestJsunit_static_001] START1');
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvStateArr0010Title');
      console.info('[StateArr0010TestJsunit_static_001] START2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateArr0010TestJsunit_static_001] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Hello[0,false,{"param":47}]');
      await CommonFunc.sleep(1000);
      console.info('[StateArr0010TestJsunit_static_001] START3');
      let btn1 = await driver.findComponent(ON.id("btnStateArr0010Delete"));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvStateArr0010Title');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StateMap0010TestJsunit_static_001] component obj1 is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Hello[0,false]');
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id("btnStateArr0010Clear"));
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('tvStateArr0010Title');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StateMap0010TestJsunit_static_001] component obj2 is: " + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Hello[]');
      console.info('[StateArr0010TestJsunit_static_001] END');
      done();
    });
  })
}