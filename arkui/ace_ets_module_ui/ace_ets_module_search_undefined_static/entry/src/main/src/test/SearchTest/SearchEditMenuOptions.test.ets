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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function SearchEitMenuOptionsTest() {
  describe('SearchEditMenuOptionsTest', () : void => {
    beforeAll(() => {
      console.info("SearchEditMenuOptionsTest beforeEach start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchEditMenuOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchEditMenuOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchEditMenuOptionsTest state pages:" + "");
        if (!("SearchEditMenuOptions" == pages.name)) {
          console.info("get SearchEditMenuOptionsTest pages.name:" + "");


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push SearchEditMenuOptionsTest page error:" + err);
      }
      console.info("SearchEditMenuOptionsTest beforeEach end");
    });

    /**
     * @tc.number   SearchEditMenuOptionsTest_static_0001
     * @tc.name     SearchEditMenuOptionsTest_static_0001
     * @tc.desc     SearchEditMenuOptionsTest_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('SearchEditMenuOptionsTest_static_0001', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('SearchEditMenuOptionsTest SearchEditMenuOptionsTest0002 START');
      await CommonFunc.sleep(500);
      let search = await driver.findComponent(ON.id('search')) as Component;
      await CommonFunc.sleep(500);
      await search.longClick();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('111111')) as Component;
      await CommonFunc.sleep(500);
      await button.click();
      let search2 = await driver.findComponent(ON.id('search2')) as Component;
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('searchLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('SearchEditMenuOptionsTest0002---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('SearchEditMenuOptionsTest0002---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual('');
      console.info("[SearchEditMenuOptionsTest0002] end");
      done();
    });

    /**
     * @tc.number   SearchEditMenuOptionsTest_static_0002
     * @tc.name     SearchEditMenuOptionsTest_static_0002
     * @tc.desc     SearchEditMenuOptionsTest_static_0002
     * @tc.level    Level.LEVEL0
     */
    it('SearchEditMenuOptionsTest_static_0002', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('SearchEditMenuOptionsTest SearchEditMenuOptionsTest0002 START');
      let change = await driver.findComponent(ON.id('button_ChangeValue')) as Component;
      await CommonFunc.sleep(500);
      change.click();
      await CommonFunc.sleep(500);
      let search = await driver.findComponent(ON.id('search')) as Component;
      await CommonFunc.sleep(500);
      await search.longClick();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('全选')) as Component;
      await CommonFunc.sleep(500);
      button.click();
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('search')) as Component;
      await CommonFunc.sleep(500);
      await text.inputText('Undefined');
      await CommonFunc.sleep(500);

      let search2 = await driver.findComponent(ON.id('search2')) as Component;
      let actualText = search2.getText();
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('search');
      let obj = JSON.parseJsonElement(strJson);
      console.log('SearchEditMenuOptionsTest0002---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('SearchEditMenuOptionsTest0002---obj.$attrs.content---' + obj.getElement('$attrs').getString('value'));
      expect('' + obj.getElement('$attrs').getString('value')).assertEqual('searchUndefined');
      console.info("[SearchEditMenuOptionsTest0002] end");
      done();
    });
    /**
     * @tc.number   SearchEditMenuOptionsTest_static_0003
     * @tc.name     SearchEditMenuOptionsTest_static_0003
     * @tc.desc     SearchEditMenuOptionsTest_static_0003
     * @tc.level    Level.LEVEL0
     */
    it('SearchEditMenuOptionsTest_static_0003', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('SearchEditMenuOptionsTest SearchEditMenuOptionsTest0002 START');
      let change = await driver.findComponent(ON.id('button_ChangeValue')) as Component;
      await CommonFunc.sleep(500);
      change.click();
      await CommonFunc.sleep(500);
      let search = await driver.findComponent(ON.id('search')) as Component;
      await CommonFunc.sleep(500);
      await search.longClick();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('111111')) as Component;
      await CommonFunc.sleep(500);
      await button.click();
      let search2 = await driver.findComponent(ON.id('search2')) as Component;
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('searchLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('SearchEditMenuOptionsTest_static_0003---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('SearchEditMenuOptionsTest_static_0003---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual('');
      console.info("[SearchEditMenuOptionsTest_static_0003] end");
      done();
    });
  })
}
