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

export default function ButtonStyle() {
  describe('ButtonStyle', () => {
    beforeAll(() => {
      console.info("ButtonStyle beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info("ButtonStyle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CalendarPickerDialog/ButtonStyle",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ButtonStyle state pages:" + JSON.stringify(pages));
        if (!("ButtonStyle" == pages.name)) {
          console.info("get ButtonStyle pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.push(options);
          await CommonFunc.sleep(2000);
          // console.info("push ButtonStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ButtonStyle page error:" + err);
      }
      console.info("ButtonStyle beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ButtonStyle after each called");
    });

    
    
    
/**
     * @tc.number   ButtonStyle_static_001
     * @tc.name     ButtonStyle_static_001
     * @tc.desc     ButtonStyle_static_001
     * @tc.level    Level.LEVEL3
     */
it('ButtonStyle_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[ButtonStyle_static_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ButtonStyle')) as Component;
      await CommonFunc.sleep(1000);
      await btn1!.click();
      console.info('[ButtonStyle_static_001] click');
      await CommonFunc.sleep(1000);
      console.info('[ButtonStyle_static_001] getInspectorTree start');
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      console.info('[ButtonStyle_static_001] getInspectorTree end');
      await CommonFunc.sleep(1000);
      console.info('[ButtonStyle_static_001] CommonFunc.sleep');
      console.info("[ButtonStyle_static_001] expect is: " + obj2.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[3].getArray('$children')[0].getElement('$attrs').getString('type'));
      expect(obj2.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[3].getArray('$children')[0].getElement('$attrs').getString('type')).assertEqual("ButtonType.Normal");
      console.info('[ButtonStyle_static_001] expect');
      await CommonFunc.sleep(1000);
      console.info('[ButtonStyle_static_001] driver.triggerKey start');
      await driver.triggerKey(2070);
      console.info('[ButtonStyle_static_001] driver.triggerKey end');
      await CommonFunc.sleep(1000);

      console.info('[ButtonStyle_static_001] END');
      done();
    });
  })
}