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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../../Util.test';

export default function tabsOnContentWillChangeIndex11JsunitTest() {
  describe('tabsOnContentWillChangeIndex11JsunitTest', () => {
    beforeAll(() => {
      console.info("tabsOnContentWillChangeIndex11JsunitTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("tabsOnContentWillChangeIndex11JsunitTest beforeEach start");
      const tabs_onContentWillChangeIndex11 = AppStorage.get<Router>("router") as Router
      try {
        tabs_onContentWillChangeIndex11.clear();
        let pages = tabs_onContentWillChangeIndex11.getState();
        console.info("get tabsOnContentWillChangeIndex11JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex11" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex10JsunitTest  pages.name:" + JSON.stringify(pages.name));
          tabs_onContentWillChangeIndex11.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex11"})
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex11JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex11JsunitTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex11JsunitTest after each called");
    });

    

    
/**
     * @tc.number   tabsOnContentWillChangeJsunitTest_static_0110
     * @tc.name     tabsOnContentWillChangeJsunitTest_static_0110
     * @tc.desc     tabsOnContentWillChangeJsunitTest_static_0110
     * @tc.level    Level.LEVEL1
     */
it('tabsOnContentWillChangeJsunitTest_static_0110', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('tabsOnContentWillChangeJsunitTest_static_0110 START');

      // simulate the "tab"
      let driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      // -> 2015
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('currentIndex11x');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0110] component obj is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('1');

      // -> 2015
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('currentIndex11x');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0110] component obj is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('2');

      // it can not response when ->

      // -> 2015
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('currentIndex11x');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0110] component obj is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('3');

      console.info('tabsOnContentWillChangeIndex10JsunitTest END');
      done();
    });


  })
}
