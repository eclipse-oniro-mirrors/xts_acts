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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it,expect, Level } from "../../../../../hypium/index"
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {  Driver, ON } from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function tabsDemo() {
  describe('tabsDemo', () => {
    beforeAll(() => {
      console.info("tabsDemo beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("tabsDemo beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextApi/tabsDemo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get tabsDemo state pages:" + JSON.stringify(pages));
        if (!("tabsDemo" == pages.name)) {
          console.info("get tabsDemo pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push tabsDemo page error:" + err);
      }
      console.info("tabsDemo beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsDemo after each called");
    });

    
    /**
     * @tc.number   tabsDemo_static_001
     * @tc.name     tabsDemo_static_001
     * @tc.desc     tabsDemo_static_001
     * @tc.level    Level.LEVEL2
     */
    it('tabsDemo_static_001', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[tabsDemo_static_001] START');
      await CommonFunc.sleep(1000);

      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.text('Yellow'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(4000);

      let strJson = inspector.getInspectorByKey('tabsDemo_text1');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[tabsDemo_static_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('456');

      console.info('[tabsDemo_static_001] END');
      done();

    });
  })
}


