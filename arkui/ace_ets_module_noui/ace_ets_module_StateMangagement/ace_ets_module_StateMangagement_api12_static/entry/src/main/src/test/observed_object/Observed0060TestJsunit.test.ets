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
export default function Observed0060TestJsunit() {
  describe('Observed0060TestJsunit', () => {
    beforeAll(() => {
      console.info("Observed0060TestJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Observed0060TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observed_object/Observed0060",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Observed0060TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Observed0060TestJsunit" == pages.name)) {
          console.info("get Observed0060TestJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Observed0060TestJsunit page error:" + err);
      }
      console.info("Observed0060TestJsunit beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Observed0060TestJsunit after each called");
    });

    
    
    /**
     * @tc.number   Observed0060TestJsunit_static_001
     * @tc.name     Observed0060TestJsunit_static_001
     * @tc.desc     Observed0060TestJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('Observed0060TestJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Observed0060TestJsunit_static_001] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060ID'));
      console.info("[Observed0060TestJsunit] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060String'));
      console.info("[Observed0060TestJsunit] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Tom');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Boolean'));
      console.info("[Observed0060TestJsunit] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('false');
      await CommonFunc.sleep(1000);
      let obj3 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Class'));
      console.info("[Observed0060TestJsunit] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('Hello');
      await CommonFunc.sleep(1000);
      let obj4 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Obj'));
      console.info("[Observed0060TestJsunit] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj5 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Enum'));
      console.info("[Observed0060TestJsunit] component obj5 is: " + JSON.stringify(obj5));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('A');
      await CommonFunc.sleep(1000);
      let obj6 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Array'));
      console.info("[Observed0060TestJsunit] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('a');
      let obj7 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Map'));
      console.info("[Observed0060TestJsunit] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('value');
      let obj8 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Set'));
      console.info("[Observed0060TestJsunit] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.getElement('$attrs').getString('content')).assertEqual('0');
      let obj9 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Date'));
      console.info("[Observed0060TestJsunit] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('Tue Jan 02 2024 03:00:00 GMT+0800');
      let obj10 = JSON.parseJsonElement(inspector.getInspectorByKey('tvObserved0060Null'));
      console.info("[Observed0060TestJsunit] component obj10 is: " + JSON.stringify(obj10));
      expect(obj10.getElement('$attrs').getString('content')).assertEqual('null');
      console.info('[Observed0060TestJsunit] END');
      done();
    });
  })
}
