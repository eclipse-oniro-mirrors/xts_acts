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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

function doCopy(driver: Driver, componentId: string){
  let text = await driver.findComponent(ON.id(componentId)) as Component;
  await text.longClick();
  await CommonFunc.sleep(500);
  let selectionMenu = await driver.findComponent(ON.text('剪切')) as Component;
  await selectionMenu.click();
  await CommonFunc.sleep(500);
}


export default function SearchOnCutTest() {
  describe('SearchOnCutTest', () => {
    beforeAll(() => {
      console.info("SearchOnCutTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchOnCutTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchOnCut',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchOnCutTest state pages: " + JSON.stringify(pages));
        if (!("SearchOnCut" == pages.name)) {
          console.info("get SearchOnCutTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchOnCutTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchOnCutTest_static_0010
         * @tc.name     SearchOnCutTest_static_0010
         * @tc.desc     SearchOnCutTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchOnCutTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchOnCutTest_static_0010] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      doCopy(driver, 'Search_onCut_Undefined0')
      let copyValue1 = await driver.findComponent(ON.id('Search_Copy_Value0')) as Component;
      let text = await copyValue1.getText();
      console.info('[SearchOnCutTest_static_0010] SearchOnCutUndefined: ' + text);
      expect(text).assertEqual('copyValue: ');

      doCopy(driver, 'Search_onCut_Dynamic0')
      let copyValue2 = await driver.findComponent(ON.id('Search_Copy_Value0')) as Component;
      text = await copyValue2.getText();
      console.info('[SearchOnCutTest_static_0010] SearchOnCutDynamic: ' + text);
      expect(text).assertEqual('copyValue: onCut');

      let button = await driver.findComponent(ON.id('Search_onCut_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      doCopy(driver, 'Search_onCut_Dynamic0')
      let copyValue3 = await driver.findComponent(ON.id('Search_Copy_Value0')) as Component;
      text = await copyValue3.getText();
      console.info('[SearchOnCutTest_static_0010] SearchOnCutDynamic: ' + text);
      expect(text).assertEqual('copyValue: onCut');
      done();
    });

  })
}