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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function tabsOnContentWillChangeIndex04JsunitTest() {
  describe('tabsOnContentWillChangeIndex04JsunitTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsOnContentWillChangeIndex04JsunitTest beforeEach start");
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get tabsOnContentWillChangeIndex04JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex04" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex03JsunitTest  pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex04"})
          routerAlp.pushUrl({ url: "MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex04" })
          await CommonFunc.sleep(2000);
          // console.info("push tabsOnContentWillChangeIndex04JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex04JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex04JsunitTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex4JsunitTest after each called");
    });


    
    /**
     * @tc.number   tabsOnContentWillChangeJsunitTest_static_0040
     * @tc.name     tabsOnContentWillChangeJsunitTest_static_0040
     * @tc.desc     tabsOnContentWillChangeJsunitTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('tabsOnContentWillChangeJsunitTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tabsOnContentWillChangeJsunitTest_static_0040 START');

      // change index it can not change index 3
      let driver = Driver.create();
      let button01 = await driver.findComponent(ON.id("changeIndexTest"));
      await (button01?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('currentIndex4x');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0040] component obj is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('1');

      await (button01?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson2 = inspector.getInspectorByKey('currentIndex4x');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0040] component obj is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('2');

      await (button01?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson3 = inspector.getInspectorByKey('currentIndex4x');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0040] component obj is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('2');

      console.info('tabsOnContentWillChangeJsunitTest_static_0040 END');
      done();
    });


  })
}
