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
export default function searchIcon() {
  describe('searchIcon', () => {
    beforeAll(() => {
      console.info("searchIcon beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchIcon beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchIcon",
      }
      try {
        console.info("searchIcon beforeEach start1");
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchIcon state pages:" + JSON.stringify(pages));
        if (!("searchIcon" == pages.name)) {
          console.info("searchIcon beforeEach start2");

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        console.info("searchIcon beforeEach start3");
      } catch (err) {
        console.error("push searchIcon page error:" + err);
      }
      console.info("searchIcon beforeEach start4");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchIcon beforeEach start5");
      console.info("searchIcon after each called");
    })


    /**
     * @tc.number   searchIcon_static_0100
     * @tc.name     searchIcon_static_0100
     * @tc.desc     searchIcon_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('searchIcon_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info("searchIcon beforeEach start6");
      let tagName = 'searchIcon0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("searchIcon beforeEach start7");
      console.info("searchIcon beforeEach start8");
      await CommonFunc.sleep(500);
      console.info("searchIcon beforeEach start8.1");
      console.info("searchIcon beforeEach start8.2");
      await CommonFunc.sleep(500);
      console.info("searchIcon beforeEach start9");
      let strJsonNew = inspector.getInspectorByKey('key_search_SearchIcon_001');
      console.info("searchIcon beforeEach start10");
      JSON.stringify(JSON.parseJsonElement(strJsonNew))
      console.info("searchIcon beforeEach start10.1");
      console.info('[' + tagName + '] Search searchIcon is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getElement('searchIcon')
        .getString('color')));
      console.info("button_onWillChange1 beforeEach start11");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('searchIcon').getString('color')).assertEqual("#FFFF0000");

      let button = await driver.findComponent(ON.id('button_SearchIcon_001'))
      console.info("button_SearchIcon_001 beforeEach start12");
      await CommonFunc.sleep(500);
      button?.click()
      await CommonFunc.sleep(500);
      console.info("button_SearchIcon_001 beforeEach start13");
      let strJsonNew1 = inspector.getInspectorByKey('key_search_SearchIcon_001');
      console.info('[' + tagName + '] Search searchOnWillChange is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getElement('searchIcon')
        .getString('color')));
      console.info("button_SearchIcon_001 beforeEach start14");
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getElement('searchIcon').getString('color')).assertEqual("[#99182431,]");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
