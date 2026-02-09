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
export default function searchOnWillDelete() {
  describe('searchOnWillDelete', () => {
    beforeAll(() => {
      console.info("searchOnWillDelete beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchOnWillDelete beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchOnWillDelete",
      }
      try {
        console.info("searchOnWillDelete beforeEach start1");
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchOnWillDelete state pages:" + JSON.stringify(pages));
        if (!("searchOnWillDelete" == pages.name)) {
          console.info("searchOnWillDelete beforeEach start2");

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        console.info("searchOnWillDelete beforeEach start3");
      } catch (err) {
        console.error("push searchOnWillDelete page error:" + err);
      }
      console.info("searchOnWillDelete beforeEach start4");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchOnWillDelete beforeEach start5");
      console.info("searchOnWillDelete after each called");
    })


    /**
     * @tc.number   searchOnWillDeletestatic_0100
     * @tc.name     searchOnWillDelete_static_0100
     * @tc.desc     searchOnWillDelete_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('searchOnWillDelete_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info("searchOnWillDelete beforeEach start6");
      let tagName = 'searchOnWillDelete0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("searchOnWillDelete beforeEach start7");
      let button = await driver.findComponent(ON.id('button_onWillDelete1'))
      console.info("searchOnWillDelete beforeEach start8");
      await CommonFunc.sleep(3000);
      console.info("searchOnWillDelete beforeEach start8.1");
      button?.click()
      console.info("searchOnWillDelete beforeEach start8.2");
      await CommonFunc.sleep(3000);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(3000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(3000);
      console.info("searchOnWillDelete beforeEach start9");
      let strJsonNew = inspector.getInspectorByKey('key_search_OnWillDelete_001');
      console.info("searchOnWillDelete beforeEach start10");
      JSON.stringify(JSON.parseJsonElement(strJsonNew))
      console.info("searchOnWillDelete beforeEach start10.1");
      console.info('[' + tagName + '] Search OnWillDelete is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      console.info("searchOnWillDelete beforeEach start11");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual("onWillDelete pass");

      let button1 = await driver.findComponent(ON.id('button_onWillDelete2'))
      console.info("searchOnWillDelete beforeEach start12");
      await CommonFunc.sleep(3000);
      console.info("searchOnWillDelete beforeEach start12.1");
      button1?.click()
      console.info("searchOnWillDelete beforeEach start12.2");
      await CommonFunc.sleep(3000);
      console.info("searchOnWillDelete beforeEach start12.21");
      let newbutton = await driver.findComponent(ON.id('button_onWillDelete1'))
      console.info("searchOnWillDelete beforeEach start12.25");
      await CommonFunc.sleep(3000);
      newbutton?.click();
      console.info("button_onWillDelete1 beforeEach start12.3");
      await CommonFunc.sleep(3000);
      await driver.triggerKey(2055);
      console.info("button_onWillDelete1 beforeEach start12.4");
      await CommonFunc.sleep(3000);
      console.info("button_onWillDelete1 beforeEach start13");
      await driver.triggerKey(2070);
      await CommonFunc.sleep(3000);
      let strJsonNew1 = inspector.getInspectorByKey('key_search_OnWillDelete_001');
      console.info('[' + tagName + '] Search OnWillDelete is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      console.info("button_onWillDelete2 beforeEach start14");
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual("onWillDelete pass");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
