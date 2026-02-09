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

export default function SearchPlaceholderColor() {
  describe('SearchPlaceholderColor', () => {
    beforeAll(() => {
      console.info("SearchPlaceholderColor beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchPlaceholderColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchPlaceholderColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchPlaceholderColor state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("SearchPlaceholderColor" == pages.name)) {
          console.info("get SearchPlaceholderColor state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchPlaceholderColor page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SearchPlaceholderColor after each called");
    });

/**
         * @tc.number   SearchPlaceholderColor_static_001
         * @tc.name     SearchPlaceholderColor_static_001
         * @tc.desc     SearchPlaceholderColor_static_001
         * @tc.level    Level.LEVEL0
         */
it('SearchPlaceholderColor_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchPlaceholderColor_static001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('Search');
      let m_strJson = inspector.getInspectorByKey('Modifier');
      let obj = JSON.parseJsonElement(strJson);
      let m_obj = JSON.parseJsonElement(m_strJson);
      let button = await driver.findComponent(ON.id('change')) as Component;
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#99182431"');
      expect(JSON.stringifyJsonElement(m_obj.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#99182431"');
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Search');
      let m_strJson1 = inspector.getInspectorByKey('Modifier');
      let obj1 = JSON.parseJsonElement(strJson1);
      let m_obj1 = JSON.parseJsonElement(m_strJson1);
      expect(JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#FF0000FF"');
      expect(JSON.stringifyJsonElement(m_obj1.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#FF0000FF"');
      await button.click();
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey('Search');
      let m_strJson2 = inspector.getInspectorByKey('Modifier');
      let obj2 = JSON.parseJsonElement(strJson2);
      let m_obj2 = JSON.parseJsonElement(m_strJson2);
      expect(JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#99182431"');
      expect(JSON.stringifyJsonElement(m_obj2.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#99182431"');
      done();
    });
  })
}