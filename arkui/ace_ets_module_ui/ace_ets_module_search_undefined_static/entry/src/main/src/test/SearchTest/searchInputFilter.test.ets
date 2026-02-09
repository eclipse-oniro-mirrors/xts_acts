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
export default function searchInputFilter() {
  describe('searchInputFilter', () => {
    beforeAll(() => {
      console.info("searchInputFilter beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchInputFilter beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchInputFilter",
      }
      try {
        console.info("searchInputFilter beforeEach start1");
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchInputFilter state pages:" + JSON.stringify(pages));
        if (!("searchInputFilter" == pages.name)) {
          console.info("searchInputFilter beforeEach start2");

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        console.info("searchInputFilter beforeEach start3");
      } catch (err) {
        console.error("push searchInputFilter page error:" + err);
      }
      console.info("searchInputFilter beforeEach start4");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchInputFilter beforeEach start5");
      console.info("searchInputFilter after each called");
    })


    /**
     * @tc.number   searchInputFilter_static_0100
     * @tc.name     searchInputFilter_static_0100
     * @tc.desc     searchInputFilter_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('searchInputFilter_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info("searchInputFilter beforeEach start6");
      let tagName = 'searchInputFilter0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("searchInputFilter beforeEach start7");
      console.info("searchInputFilter beforeEach start8");
      await CommonFunc.sleep(500);
      console.info("searchInputFilter beforeEach start8.1");
      console.info("searchInputFilter beforeEach start8.2");
      console.info("searchInputFilter beforeEach start9");
      let strJsonNew = inspector.getInspectorByKey('key_search_inputFilter_002');
      console.info("searchInputFilter beforeEach start10");
      JSON.stringify(JSON.parseJsonElement(strJsonNew))
      console.info("searchInputFilter beforeEach start10.1");
      console.info('[' + tagName + '] Search searchInputFilter is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('inputFilter')));
      console.info("searchInputFilter beforeEach start11");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('inputFilter')).assertEqual("[a-z]");

      let button1 = await driver.findComponent(ON.id('button_inputFilter2'))
      console.info("searchInputFilter beforeEach start12");
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(500);
      console.info("searchInputFilter beforeEach start13");
      let strJsonNew1 = inspector.getInspectorByKey('key_search_inputFilter_002');
      console.info('[' + tagName + '] Search searchInputFilter is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('inputFilter')));
      console.info("searchInputFilter beforeEach start14");
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('inputFilter')).assertEqual("");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
