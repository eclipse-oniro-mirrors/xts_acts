'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function StyledStringKeyTest1() {
  describe('StyledStringKeyTest1', (): void => {
    beforeAll(() => {
      console.info("StyledStringKeyTest1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("StyledStringKeyTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringKeyTest1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StyledStringKeyTest1 state pages:" + JSON.stringify(pages));
        if (!("StyledStringKeyTest1" == pages.name)) {
          console.info("get StyledStringKeyTest1 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push StyledStringKeyTest1 page error:" + err);
      }
      console.info("StyledStringKeyTest1 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StyledStringKeyTest1 after each called");
    });


    
    /**
     * @tc.number   StyledStringKeyTest1_static_0100
     * @tc.name     StyledStringKeyTest1_static_0100
     * @tc.desc     StyledStringKeyTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('StyledStringKeyTest1_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('StyledStringKeyTest1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      try{
        let btn = await driver.findComponent(ON.id('StyledStringKeyTest1_btn'));
        await (btn?.click() as Promise<void>);
      }catch(e){}
      await CommonFunc.sleep(1000);
      console.info("[StyledStringKeyTest1_text] btn click");

      let strJson = inspector.getInspectorByKey('StyledStringKeyTest1_text');
      console.info("[StyledStringKeyTest1_text] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('hello');

      console.info('StyledStringKeyTest1_0100 END');
      done();
    });


  })
}