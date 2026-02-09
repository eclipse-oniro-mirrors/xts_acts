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

export default function SearchCancelButton() {
  describe('SearchCancelButton', () => {
    beforeAll(() => {
      console.info("SearchCancelButton beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchCancelButton beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchCancelButton',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchCancelButton state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("SearchCancelButton" == pages.name)) {
          console.info("get SearchCancelButton state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchCancelButton page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SearchCancelButton after each called");
    });

/**
         * @tc.number   SearchCancelButton_static_001
         * @tc.name     SearchCancelButton_static_001
         * @tc.desc     SearchCancelButton_static_001
         * @tc.level    Level.LEVEL0
         */
it('SearchCancelButton_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchCancelButton_static001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('Search');
      let m_strJson = inspector.getInspectorByKey('Modifier');
      let obj = JSON.parseJsonElement(strJson);
      let m_obj = JSON.parseJsonElement(m_strJson);
      let button = await driver.findComponent(ON.id('change')) as Component;
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton'))).assertEqual('{"style":"CancelButtonStyle.INPUT","icon":{"size":"24.00px","color":"#99182431","src":"resource:///ohos_close.svg"}}');
      expect(JSON.stringifyJsonElement(m_obj.getElement('$attrs').getElement('cancelButton'))).assertEqual('{"style":"CancelButtonStyle.INPUT","icon":{"size":"24.00px","color":"#99182431","src":"resource:///ohos_close.svg"}}');
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Search');
      let m_strJson1 = inspector.getInspectorByKey('Modifier');
      let obj1 = JSON.parseJsonElement(strJson1);
      let m_obj1 = JSON.parseJsonElement(m_strJson1);
      expect(JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('cancelButton'))).assertEqual('{"style":"CancelButtonStyle.CONSTANT","icon":{"size":"30.00px","color":"#FFF04B3D","src":"resource:///ohos_close.svg"}}');
      expect(JSON.stringifyJsonElement(m_obj1.getElement('$attrs').getElement('cancelButton'))).assertEqual('{"style":"CancelButtonStyle.CONSTANT","icon":{"size":"30.00px","color":"#FFF04B3D","src":"resource:///ohos_close.svg"}}');
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('Search');
      let m_strJson2 = inspector.getInspectorByKey('Modifier');
      let obj2 = JSON.parseJsonElement(strJson2);
      let m_obj2 = JSON.parseJsonElement(m_strJson2);
      expect(JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('cancelButton'))).assertEqual('{"style":"CancelButtonStyle.INPUT","icon":{"size":"24.00px","color":"#FFF04B3D","src":"resource:///ohos_close.svg"}}');
      expect(JSON.stringifyJsonElement(m_obj2.getElement('$attrs').getElement('cancelButton'))).assertEqual('{"style":"CancelButtonStyle.INPUT","icon":{"size":"24.00px","color":"#FFF04B3D","src":"resource:///ohos_close.svg"}}');
      done();
    });
  })
}