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

export default function tabsOnContentWillChangeIndex03JsunitTest() {
  describe('tabsOnContentWillChangeIndex03JsunitTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsOnContentWillChangeIndex03JsunitTest beforeEach start");
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get tabsOnContentWillChangeIndex03JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex03" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex03JsunitTest  pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex03"})
          routerAlp.pushUrl({ url: "MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex03" })
          await CommonFunc.sleep(2000);
          // console.info("push tabsOnContentWillChangeIndex03JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex03JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex03JsunitTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex3JsunitTest after each called");
    });


    
    /**
     * @tc.number   tabsOnContentWillChangeJsunitTest_static_0030
     * @tc.name     tabsOnContentWillChangeJsunitTest_static_0030
     * @tc.desc     tabsOnContentWillChangeJsunitTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('tabsOnContentWillChangeJsunitTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tabsOnContentWillChangeJsunitTest_static_0030 START');

      let driver = Driver.create();
      // get the content rect value
      let tabsRect = CommonFunc.getComponentRect('content4x');
      console.info("tabsOnContentWillChangeJsunitTest_static_0030  test rect value " + tabsRect.left + "," +
      tabsRect.right + "," +
      tabsRect.top + "," + tabsRect.bottom);
      // swipe index 3 to index 2  left swipe to right

      await driver.swipe((Math.round((AppStorage.get<number>("winLeft") ?? 0) +
        (tabsRect.right - tabsRect.left) * 0.1 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + (tabsRect.bottom - tabsRect.top) / 2 +
        tabsRect.top)).toInt(), (Math.round((AppStorage.get<number>("winLeft") ?? 0) +
          (tabsRect.right - tabsRect.left) * 0.8 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + (tabsRect.bottom - tabsRect.top) / 2 +
        tabsRect.top)).toInt());
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('currentIndex2x');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0030] component obj is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('2');

      let text01 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent = await (text01?.getText() as Promise<string>);
      expect(texContent).assertEqual("推荐的内容");

      // swipe index 2 to index 3 right swipe to left

      await driver.swipe((Math.round((AppStorage.get<number>("winLeft") ?? 0) +
        (tabsRect.right - tabsRect.left) * 0.8 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + (tabsRect.bottom - tabsRect.top) / 2 +
        tabsRect.top)).toInt(), (Math.round((AppStorage.get<number>("winLeft") ?? 0) +
          (tabsRect.right - tabsRect.left) * 0.1 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + (tabsRect.bottom - tabsRect.top) / 2 +
        tabsRect.top)).toInt());
      await CommonFunc.sleep(2000);

      let strJson2 = inspector.getInspectorByKey('currentIndex2x');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0030] component obj is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('3');

      let text02 = await driver.findComponent(ON.text("我的内容"))
      let texContent2 = await (text02?.getText() as Promise<string>);
      expect(texContent2).assertEqual("我的内容");

      // swipe index 3 to index 4 right swipe to left

      await driver.swipe((Math.round((AppStorage.get<number>("winLeft") ?? 0) +
        (tabsRect.right - tabsRect.left) * 0.8 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + (tabsRect.bottom - tabsRect.top) / 2 +
        tabsRect.top)).toInt(), (Math.round((AppStorage.get<number>("winLeft") ?? 0) +
          (tabsRect.right - tabsRect.left) * 0.1 + tabsRect.left)).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + (tabsRect.bottom - tabsRect.top) / 2 +
        tabsRect.top)).toInt());
      await CommonFunc.sleep(2000);

      let strJson23 = inspector.getInspectorByKey('currentIndex2x');
      let obj23 = JSON.parseJsonElement(strJson23);
      console.info("[tabsOnContentWillChangeJsunitTest_static_0030] component obj is: " + JSON.stringify(obj23));
      expect(obj23.getElement('$attrs').getString('content')).assertEqual('4');

      let text023 = await driver.findComponent(ON.text("党史1949"))
      let texContent23 = await (text023?.getText() as Promise<string>);
      expect(texContent23).assertEqual("党史1949");

      console.info('tabsOnContentWillChangeJsunitTest_static_0030 END');
      done();
    });


  })
}
