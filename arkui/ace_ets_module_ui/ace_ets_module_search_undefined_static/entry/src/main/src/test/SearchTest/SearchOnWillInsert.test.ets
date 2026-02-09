'use static'
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SearchOnWillInsert() {
  describe('SearchOnWillInsert', () => {
    beforeAll(() => {
      console.info("SearchOnWillInsert beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchOnWillInsert beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchOnWillInsert',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchOnWillInsert state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("SearchOnWillInsert" == pages.name)) {
          console.info("get SearchOnWillInsert state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchOnWillInsert page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SearchOnWillInsert after each called");
    });

/**
         * @tc.number   SearchOnWillInsert_static_001
         * @tc.name     SearchOnWillInsert_static_001
         * @tc.desc     SearchOnWillInsert_static_001
         * @tc.level    Level.LEVEL0
         */
it('SearchOnWillInsert_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchOnWillInsert_static001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('Search')) as Component;
      let text2 = await driver.findComponent(ON.id('Modifier')) as Component;
      let button = await driver.findComponent(ON.id('change')) as Component;
      await text.inputText('9');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);
      await text2.inputText('9');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('SearchText')
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');
      await button.click();
      await text.inputText('9');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);
      await text2.inputText('6');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey('SearchText')
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('96');
      await button.click();
      await text.inputText('7');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);
      await text2.inputText('7');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(200);
      let strJson3 = inspector.getInspectorByKey('SearchText')
      await CommonFunc.sleep(200);
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('96');
      console.info('[SearchOnWillInsert_static001] END');
      done();
    });
  })
}