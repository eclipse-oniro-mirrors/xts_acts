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
export default function searchOnContentScroll() {
  describe('searchOnContentScroll', () => {
    beforeAll(() => {
      console.info("searchOnContentScroll beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchOnContentScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchOnContentScroll",
      }
      try {
        console.info("searchOnWillDeleteModifier beforeEach start1");
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchOnContentScroll state pages:" + JSON.stringify(pages));
        if (!("searchOnContentScroll" == pages.name)) {
          console.info("searchOnContentScroll beforeEach start2");

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        console.info("searchOnContentScroll beforeEach start3");
      } catch (err) {
        console.error("push searchOnContentScroll page error:" + err);
      }
      console.info("searchOnContentScroll beforeEach start4");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchOnContentScroll beforeEach start5");
      console.info("searchOnContentScroll after each called");
    })


    /**
     * @tc.number   searchOnContentScroll_static_0100
     * @tc.name     searchOnContentScroll_static_0100
     * @tc.desc     searchOnContentScroll_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('searchOnContentScroll_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchOnContentScroll0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      //正常值
      let text = await driver.findComponent(ON.id('key_search_onContentScroll_001'))
      await (text?.inputText('placeholder(search)placeholder(search)placeholder(search)placeholder(search)') as Promise<void>)
      await CommonFunc.sleep(2000);
      driver.triggerKey(2070);
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('test_text_onContentScroll');
      console.info('[' + tagName + '] Search onContentScroll is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('true');
      //undefined
      let button1 = await driver.findComponent(ON.id('button_onContentScroll1'))
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('button_onContentScroll2'))
      await CommonFunc.sleep(500);
      button2?.click()
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.id('key_search_onContentScroll_001'))
      await (text1?.inputText('placeholder(search)placeholder(search)placeholder(search)placeholder(search)') as Promise<void>)
      await CommonFunc.sleep(1000);
      driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJsonNew1 = inspector.getInspectorByKey('test_text_onContentScroll');
      console.info('[' + tagName + '] Search onContentScroll is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      // expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('fail');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
