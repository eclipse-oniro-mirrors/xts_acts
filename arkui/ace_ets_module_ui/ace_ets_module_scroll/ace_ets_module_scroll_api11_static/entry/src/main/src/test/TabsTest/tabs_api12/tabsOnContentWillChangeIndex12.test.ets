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

export default function tabsOnContentWillChangeIndex12JsunitTest() {
  describe('tabsOnContentWillChangeIndex12JsunitTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsOnContentWillChangeIndex12JsunitTest beforeEach start");
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get tabsOnContentWillChangeIndex12JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex12" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex12JsunitTest  pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex12"})
          routerAlp.pushUrl({ url: "MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex12" })
          await CommonFunc.sleep(2000);
          // console.info("push tabsOnContentWillChangeIndex12JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex12JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex12JsunitTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex12JsunitTest after each called");
    });


    
    /**
     * @tc.number   tabsOnContentWillChangeJsunitTest_static_0120
     * @tc.name     tabsOnContentWillChangeJsunitTest_static_0120
     * @tc.desc     tabsOnContentWillChangeJsunitTest_static_0120
     * @tc.level    Level.LEVEL0
     */
it('tabsOnContentWillChangeJsunitTest_static_0120', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tabsOnContentWillChangeJsunitTest_static_0120 START');
      let driver = Driver.create();
      // get the content rect value
      let tabsRect = CommonFunc.getComponentRect('content12x');
      console.info("tabsOnContentWillChangeJsunitTest_static_0120  test rect value " + tabsRect.left + "," +
      tabsRect.right + "," +
      tabsRect.top + "," + tabsRect.bottom);
      // swipe index 0 -1  right swipe to left
      await driver.swipe((Math.round((AppStorage.get<number>("winLeft") ?? 0) +
        (tabsRect.right - tabsRect.left) * 0.2 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + (tabsRect.bottom - tabsRect.top) / 2 +
        tabsRect.top)).toInt(), (Math.round((AppStorage.get<number>("winLeft") ?? 0) +
          (tabsRect.right - tabsRect.left) * 0.1 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + (tabsRect.bottom - tabsRect.top) / 2 +
        tabsRect.top)).toInt());
      await CommonFunc.sleep(2000);

      let text01 = await driver.findComponent(ON.text("首页的内容"))
      let texContent = await (text01?.getText() as Promise<string>);
      expect(texContent).assertEqual("首页的内容");

      console.info('tabsOnContentWillChangeJsunitTest_static_0120  END');
      done();

    });


  })
}
