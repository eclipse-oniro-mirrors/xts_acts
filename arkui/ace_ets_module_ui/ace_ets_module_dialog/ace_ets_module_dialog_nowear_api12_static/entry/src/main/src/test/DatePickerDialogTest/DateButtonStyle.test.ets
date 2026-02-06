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
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function DateButtonStyle() {
  describe('DateButtonStyle', () => {

    beforeAll(() => {
      console.info("DateButtonStyle beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info("DateButtonStyle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DatePickerDialog/DateButtonStyle",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DateButtonStyle state pages:" + JSON.stringify(pages));
        if (!("DateButtonStyle" == pages.name)) {
          console.info("get DateButtonStyle pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push DateButtonStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DateButtonStyle page error:" + err);
      }
      console.info("DateButtonStyle beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DateButtonStyle after each called");
    });
    
    
    
/**
     * @tc.number   DateButtonStyle_static_001
     * @tc.name     DateButtonStyle_static_001
     * @tc.desc     DateButtonStyle_static_001
     * @tc.level    Level.LEVEL3
     */
it('DateButtonStyle_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[DateButtonStyle_static_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('DateButtonStyle')) as Component;
      await btn1!.click();
      await CommonFunc.sleep(1000);

      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[DateButtonStyle_static_001] obj2 is: " + JSON.stringify(obj2));
      console.info("[DateButtonStyle_static_001] obj2.$children[1].$children[0].$children[0].$children[2].$children[0] is: " + JSON.stringifyJsonElement(obj2.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[2].getArray('$children')[0]));
      expect(obj2.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[2].getArray('$children')[0].getElement('$attrs').getString('type')).assertEqual("ButtonType.Normal");

      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

      console.info('[DateButtonStyle_static_001] END');
      done();
    });
  })
}