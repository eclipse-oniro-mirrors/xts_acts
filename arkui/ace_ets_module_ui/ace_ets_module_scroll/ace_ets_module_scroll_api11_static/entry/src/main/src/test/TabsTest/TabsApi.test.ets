'use static';
/**
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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import Utils from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function TabsApi() {
  describe('TabsApi', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("TabsApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsApi',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get TabsApi state success " + JSON.stringify(pages));
        if (!("TabsApi" == pages.name)) {
          console.info("get TabsApi state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push TabsApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsApi page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TabsApi after each called");
    });


    
    /**
     * @tc.number   TabsApi_static_001
     * @tc.name     TabsApi_static_001
     * @tc.desc     TabsApi_static_001
     * @tc.level    Level.LEVEL0
     */
it('TabsApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TabsApi_static_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn = await driver.findComponent(ON.text('Yellow'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(4000);

      let strJson = inspector.getInspectorByKey('TabsApi_text1');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[TabsApi_static_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onChange');

      console.info('[TabsApi_static_001] END');
      done();

    });
  })
}


