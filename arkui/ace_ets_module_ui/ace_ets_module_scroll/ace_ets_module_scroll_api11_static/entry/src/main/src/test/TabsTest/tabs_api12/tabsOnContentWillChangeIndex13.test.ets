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

export default function tabsOnContentWillChangeIndex13JsunitTest() {
  describe('tabsOnContentWillChangeIndex13JsunitTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsOnContentWillChangeIndex13JsunitTest beforeEach start");
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get tabsOnContentWillChangeIndex13JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex13" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex13JsunitTest  pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex13"})
          routerAlp.pushUrl({ url: "MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex13" })
          await CommonFunc.sleep(2000);
          // console.info("push tabsOnContentWillChangeIndex13JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex13JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex13JsunitTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex13JsunitTest after each called");
    });


    
    /**
     * @tc.number   tabsOnContentWillChangeJsunitTest_static_0130
     * @tc.name     tabsOnContentWillChangeJsunitTest_static_0130
     * @tc.desc     tabsOnContentWillChangeJsunitTest_static_0130
     * @tc.level    Level.LEVEL0
     */
it('tabsOnContentWillChangeJsunitTest_static_0130', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tabsOnContentWillChangeJsunitTest_static_0130 START');
      let driver = Driver.create();
      // get the content rect value
      let tabsRect = CommonFunc.getComponentRect('content13x');
      console.info("tabsOnContentWillChangeJsunitTest_static_0130  test rect value " + tabsRect.left + "," +
      tabsRect.right + "," +
      tabsRect.top + "," + tabsRect.bottom);

      // swipe index  0 -1   swipe direction top to bottom
      await driver.swipe(((AppStorage.get<number>("winLeft") ?? 0) +
      Math.round((tabsRect.right - tabsRect.left) / 2 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) +
          (tabsRect.bottom - tabsRect.top) * 0.8 + tabsRect.top)).toInt(),
        (Math.round((AppStorage.get<number>("winLeft") ?? 0) +
          (tabsRect.right - tabsRect.left) / 2 + tabsRect.left)).toInt(),


        (Math.round((AppStorage.get<number>("winTop") ?? 0) +
          (tabsRect.bottom - tabsRect.top) * 0.05 + tabsRect.top)).toInt());

      await CommonFunc.sleep(2000);

      let text01 = await driver.findComponent(ON.text("发现的内容"))
      let texContent = await (text01?.getText() as Promise<string>);
      expect(texContent).assertEqual("发现的内容");

      // swipe index  1 -2   swipe direction top to bottom
      await driver.swipe(((AppStorage.get<number>("winLeft") ?? 0) +
      Math.round((tabsRect.right - tabsRect.left) / 2 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) +
          (tabsRect.bottom - tabsRect.top) * 0.8 + tabsRect.top)).toInt(),
        (Math.round((AppStorage.get<number>("winLeft") ?? 0) +
          (tabsRect.right - tabsRect.left) / 2 + tabsRect.left)).toInt(),


        (Math.round((AppStorage.get<number>("winTop") ?? 0) +
          (tabsRect.bottom - tabsRect.top) * 0.05 + tabsRect.top)).toInt());

      await CommonFunc.sleep(2000);

      let text02 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent2 = await (text02?.getText() as Promise<string>);
      expect(texContent2).assertEqual("推荐的内容");


      // swipe index  2 -3   swipe direction top to bottom
      await driver.swipe((Math.round((AppStorage.get<number>("winLeft") ?? 0) +
        (tabsRect.right - tabsRect.left) / 2 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) +
          (tabsRect.bottom - tabsRect.top) * 0.8 + tabsRect.top)).toInt(),
        (Math.round((AppStorage.get<number>("winLeft") ?? 0) +
          (tabsRect.right - tabsRect.left) / 2 + tabsRect.left)).toInt(),


        (Math.round((AppStorage.get<number>("winTop") ?? 0) +
          (tabsRect.bottom - tabsRect.top) * 0.05 + tabsRect.top)).toInt());

      await CommonFunc.sleep(2000);

      let text03 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent3 = await (text03?.getText() as Promise<string>);
      expect(texContent3).assertEqual("推荐的内容");

      console.info('tabsOnContentWillChangeJsunitTest_static_0130 END');
      done();

    });


  })
}
