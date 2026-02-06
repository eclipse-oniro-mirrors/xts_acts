'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function valueAlphabet() {
  describe('valueAlphabet', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("valueAlphabet beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/valueAlphabet",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get valueAlphabet state pages:" + JSON.stringify(pages));
        if (!("valueAlphabet" == pages.name)) {
          console.info("get valueAlphabet pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push valueAlphabet page result:");
        }
      } catch (err) {
        console.error("push valueAlphabet page error:" + err);
      }
      console.info("valueAlphabet beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("valueAlphabet after each called");
    });


    
    /**
     * @tc.number   valueAlphabet_static_0100
     * @tc.name     valueAlphabet_static_0100
     * @tc.desc     valueAlphabet_static_0100
     * @tc.level    Level.LEVEL0
     */
it('valueAlphabet_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[valueAlphabet_static_0100] START');
      let strJson = inspector.getInspectorByKey('alp_outliers_value');
      console.info("[valueAlphabet_static_0100] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[valueAlphabet_static_0100] selected: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected')).assertEqual('0');
      console.info('[valueAlphabet_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   valueAlphabet_static_0200
     * @tc.name     valueAlphabet_static_0200
     * @tc.desc     valueAlphabet_static_0200
     * @tc.level    Level.LEVEL0
     */
it('valueAlphabet_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[valueAlphabet_static_0200] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.text('B'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('alp_outliers_value');
      console.info("[valueAlphabet_static_0200] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[valueAlphabet_static_0200] itemBorderRadius: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemBorderRadius')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemBorderRadius')).assertEqual('0.00vp');
      console.info('[valueAlphabet_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   valueAlphabet_static_0300
     * @tc.name     valueAlphabet_static_0300
     * @tc.desc     valueAlphabet_static_0300
     * @tc.level    Level.LEVEL0
     */
it('valueAlphabet_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[valueAlphabet_static_0300] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.text('A'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('alp_value_index');
      console.info("[valueAlphabet_static_0300] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[valueAlphabet_static_0300] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('index: 1, A');
      console.info('[valueAlphabet_static_0300] END');
      done();
    });
  })
}
