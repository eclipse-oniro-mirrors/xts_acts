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

export default function tabsOnContentWillChangeIndex15JsunitTest() {
  describe('tabsOnContentWillChangeIndex15JsunitTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsOnContentWillChangeIndex15JsunitTest beforeEach start");
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get tabsOnContentWillChangeIndex15JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex15" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex15JsunitTest  pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex15"})
          routerAlp.pushUrl({ url: "MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex15" })
          await CommonFunc.sleep(2000);
          // console.info("push tabsOnContentWillChangeIndex15JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex15JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex15JsunitTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex15JsunitTest after each called");
    });


    
    /**
     * @tc.number   tabsOnContentWillChangeJsunitTest_static_0150
     * @tc.name     tabsOnContentWillChangeJsunitTest_static_0150
     * @tc.desc     tabsOnContentWillChangeJsunitTest_static_0150
     * @tc.level    Level.LEVEL0
     */
it('tabsOnContentWillChangeJsunitTest_static_0150', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tabsOnContentWillChangeJsunitTest_static_0150 START');
      // add data
      let driver = Driver.create();
      let button02 = await driver.findComponent(ON.id("tabsAddI"));
      await (button02?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let text02 = await driver.findComponent(ON.text("建国1950"));
      let textContent = await (text02?.getText() as Promise<string>);
      expect(textContent).assertEqual('建国1950');

      // deleteData

      let button03 = await driver.findComponent(ON.id("tabPopI"));
      await (button03?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let text03 = await driver.findComponent(ON.text("发现的内容"));
      let textContent3 = await (text03?.getText() as Promise<string>);
      expect(textContent3).assertEqual('发现的内容');

      console.info('tabsOnContentWillChangeJsunitTest_static_0150 END');
      done();
    });

  })
}
