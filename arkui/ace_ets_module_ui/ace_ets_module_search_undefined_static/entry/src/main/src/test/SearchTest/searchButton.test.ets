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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
export default function searchButton() {
  describe('searchButton', () => {
    beforeAll(() => {
      console.info("searchButton beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchButtonModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchButton",
      }
      try {
        console.info("searchButton beforeEach start1");
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchButton state pages:" + JSON.stringify(pages));
        if (!("searchButton" == pages.name)) {
          console.info("searchButton beforeEach start2");

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        console.info("searchButton beforeEach start3");
      } catch (err) {
        console.error("push searchButton page error:" + err);
      }
      console.info("searchButton beforeEach start4");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchButton beforeEach start5");
      console.info("searchButton after each called");
    })


    /**
     * @tc.number   searchButton_static_0100
     * @tc.name     searchButton_static_0100
     * @tc.desc     searchButton_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('searchButton_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info("searchButton beforeEach start6");
      let tagName = 'searchButton0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("searchButton beforeEach start7");
      console.info("searchButton beforeEach start8");
      await CommonFunc.sleep(500);
      console.info("searchButton beforeEach start8.1");
      console.info("searchButton beforeEach start8.2");
      await CommonFunc.sleep(500);
      console.info("searchButton beforeEach start9");
      let strJsonNew = inspector.getInspectorByKey('key_search_SearchButton_001');
      console.info("searchButton beforeEach start10");
      JSON.stringify(JSON.parseJsonElement(strJsonNew))
      console.info("searchButton beforeEach start10.1");
      console.info('[' + tagName + '] Search searchButton is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('searchButton')));
      console.info("button_onWillChange1 beforeEach start11");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('searchButton')).assertEqual("SearchButton");

      let button = await driver.findComponent(ON.id('button_SearchButton_001'))
      console.info("button_SearchButton_001 beforeEach start12");
      await CommonFunc.sleep(500);
      button?.click()
      await CommonFunc.sleep(500);
      console.info("button_SearchButton_001 beforeEach start13");
      let strJsonNew1 = inspector.getInspectorByKey('key_search_SearchButton_001');
      console.info('[' + tagName + '] Search searchButton is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('searchButton')));
      console.info("button_SearchButton_001 beforeEach start14");
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('searchButton')).assertEqual("SearchButton");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
