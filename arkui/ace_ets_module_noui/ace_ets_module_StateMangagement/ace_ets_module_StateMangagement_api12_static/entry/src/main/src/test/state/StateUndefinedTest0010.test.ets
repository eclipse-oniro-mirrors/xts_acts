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
export default function StateUndefinedTest0010() {
  describe('StateUndefinedTest0010', () => {
    beforeAll(() => {
      console.info("StateUndefinedTest0010 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("StateUndefinedTest0010 beforeEach start");
      let options: router.RouterOptions = {
        url:"MainAbility/pages/state/StateUndefined0010",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateUndefinedTest0010 state pages:" + JSON.stringify(pages));
        if (!("StateUndefinedTest0010" == pages.name)) {
          console.info("get StateUndefinedTest0010 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push StateUndefinedTest0010 page error:" + err);
      }
      console.info("StateUndefinedTest0010 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("StateUndefinedTest0010 after each called");
    });

    
    //page页面注释
    
    /**
     * @tc.number   StateUndefinedTest0010_static_001
     * @tc.name     StateUndefinedTest0010_static_001
     * @tc.desc     StateUndefinedTest0010_static_001
     * @tc.level    Level.LEVEL0
     */
it('StateUndefinedTest0010_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StateUndefinedTest0010_static_001] START');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvProvideValue'));
      console.info("[StateSet0010TestJsunit] component obj content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('provideValue:undefined');
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tvStateValue'));
      console.info("[StateSet0010TestJsunit] component obj1 content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('stateValue:null');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('tvPropValue'));
      console.info("[StateSet0010TestJsunit] component obj2 content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('propValue:undefined');
      await CommonFunc.sleep(1000);
      let obj3 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLinkValue'));
      console.info("[StateSet0010TestJsunit] component obj3 content is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('linkValue:undefined');
      await CommonFunc.sleep(1000);
      let obj4 = JSON.parseJsonElement(inspector.getInspectorByKey('tvComsumeValue'));
      console.info("[StateSet0010TestJsunit] component obj4 content is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('comsumeValue:undefined');
      await CommonFunc.sleep(1000);
      let obj5 = JSON.parseJsonElement(inspector.getInspectorByKey('tvStoragePropValue'));
      console.info("[StateSet0010TestJsunit] component obj5 content is: " + JSON.stringify(obj5.getElement('$attrs').getString('content')));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('storagePropValue:undefined');
      await CommonFunc.sleep(1000);
      let obj6 = JSON.parseJsonElement(inspector.getInspectorByKey('tvStorageLinkValue'));
      console.info("[StateSet0010TestJsunit] component obj6 content is: " + JSON.stringify(obj6.getElement('$attrs').getString('content')));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('storageLinkValue:undefined');
      await CommonFunc.sleep(1000);
      let obj7 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageProp'));
      console.info("[StateSet0010TestJsunit] component obj7 content is: " + JSON.stringify(obj7.getElement('$attrs').getString('content')));
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('localStorageProp:undefined');
      await CommonFunc.sleep(1000);
      let obj8 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageLink'));
      console.info("[StateSet0010TestJsunit] component obj8 content is: " + JSON.stringify(obj8.getElement('$attrs').getString('content')));
      expect(obj8.getElement('$attrs').getString('content')).assertEqual('localStorageLink:undefined');
      console.info('[StateUndefinedTest0010_static_001] END');
      done();
    });
  })
}
