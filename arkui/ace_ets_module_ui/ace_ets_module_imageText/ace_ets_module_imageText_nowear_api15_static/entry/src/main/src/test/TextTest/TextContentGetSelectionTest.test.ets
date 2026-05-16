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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextContentGetSelectionTest() {
  describe('TextContentGetSelectionTest', () : void => {
    beforeAll(() => {
      console.info("TextContentGetSelectionTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api15.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextContentGetSelectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextContentGetSelectionTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextContentGetSelectionTest state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextContentGetSelectionTest pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextContentGetSelectionTest page error:" + err);
      }
      console.info("TextContentGetSelectionTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextContentGetSelectionTest after each called");
    });

    
    /**
     * @tc.number   TextContentGetSelectionTest_static_0001
     * @tc.name     TextContentGetSelectionTest_static_0001
     * @tc.desc     TextContentGetSelectionTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('TextContentGetSelectionTest_static_0001', Level.LEVEL1, async (done: () =>void) => {
      let driver = Driver.create();
      console.info('TextContentGetSelectionTest0001 START');
      await CommonFunc.sleep(1000);
      let TextArea = await driver.findComponent(ON.id('TextArea'))
      await CommonFunc.sleep(500);
      await (TextArea?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await CommonFunc.sleep(500);
      await (allSelect?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let getTextArea = await driver.findComponent(ON.id('getTextArea'))
      await CommonFunc.sleep(500);
      await (getTextArea?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let TextAreaSelectionStart = AppStorage.get<int>('TextAreaSelectionStart')
        let TextAreaSelectionEnd = AppStorage.get<int>('TextAreaSelectionEnd')
        expect(TextAreaSelectionStart).assertEqual(0);
        expect(TextAreaSelectionEnd).assertEqual(7);

      AppStorage.delete('TextAreaSelectionStart');
      AppStorage.delete('TextAreaSelectionEnd');
      console.info("[TextContentGetSelectionTest0001] end");
      done();
    });

    
    /**
     * @tc.number   TextContentGetSelectionTest_static_0002
     * @tc.name     TextContentGetSelectionTest_static_0002
     * @tc.desc     TextContentGetSelectionTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('TextContentGetSelectionTest_static_0002', Level.LEVEL1, async (done: () =>void) => {
      let driver = Driver.create();
      console.info('TextContentGetSelectionTest0002 START');
      await CommonFunc.sleep(1000);
      let Search = await driver.findComponent(ON.id('Search'))
      await CommonFunc.sleep(500);
      await (Search?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await CommonFunc.sleep(500);
      await (allSelect?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let getSearch = await driver.findComponent(ON.id('getSearch'))
      await CommonFunc.sleep(500);
      await (getSearch?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let SearchSelectionStart = AppStorage.get<int>('SearchSelectionStart')
        let SearchSelectionEnd = AppStorage.get<int>('SearchSelectionEnd')
        expect(SearchSelectionStart).assertEqual(0);
        expect(SearchSelectionEnd).assertEqual(6);

      AppStorage.delete('SearchSelectionStart');
      AppStorage.delete('SearchSelectionEnd');
      console.info("[TextContentGetSelectionTest0002] end");
      done();
    });

    
    /**
     * @tc.number   TextContentGetSelectionTest_static_0003
     * @tc.name     TextContentGetSelectionTest_static_0003
     * @tc.desc     TextContentGetSelectionTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('TextContentGetSelectionTest_static_0003', Level.LEVEL1, async (done: () =>void) => {
      let driver = Driver.create();
      console.info('TextContentGetSelectionTest0003 START');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.id('TextInput'))
      await CommonFunc.sleep(500);
      await (TextInput?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await CommonFunc.sleep(500);
      await (allSelect?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let getTextInput = await driver.findComponent(ON.id('getTextInput'))
      await CommonFunc.sleep(500);
      await (getTextInput?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let TextInputSelectionStart = AppStorage.get<int>('TextInputSelectionStart')
        let TextInputSelectionEnd = AppStorage.get<int>('TextInputSelectionEnd')
        expect(TextInputSelectionStart).assertEqual(0);
        expect(TextInputSelectionEnd).assertEqual(8);

      AppStorage.delete('TextInputSelectionStart');
      AppStorage.delete('TextInputSelectionEnd');
      console.info("[TextContentGetSelectionTest0003] end");
      done();
    });
  })
}