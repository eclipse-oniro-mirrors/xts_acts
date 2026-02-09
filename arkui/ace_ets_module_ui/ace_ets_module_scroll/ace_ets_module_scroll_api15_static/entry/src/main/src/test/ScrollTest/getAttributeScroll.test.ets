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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility } from '../Util.test'

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;

export default function getAttributeScroll() {
  describe('getAttributeScroll', () => {

    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll15.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("getAttributeScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/getAttributeScroll",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info("get getAttributeScroll state pages:" + JSON.stringify(pages));
        if (!("getAttributeScroll" == pages.name)) {
          console.info("get getAttributeScroll pages.name:" + '');
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push getAttributeScroll page error:" + err);
      }
      console.info("getAttributeScroll beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getAttributeScroll after each called");
    });


    
    /**
     * @tc.number   getAttributeScroll_static_0100
     * @tc.name     getAttributeScroll_static_0100
     * @tc.desc     getAttributeScroll_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getAttributeScroll_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getAttributeScroll_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('scroll_get_click')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('typeNode_scroll');
      console.info("[getAttributeScroll_static_0100] component obj is: " + strJson);
      console.info("[getAttributeScroll_static_0100]: scrollBarWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBarWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarWidth')).assertEqual("30.00vp");
      console.info('[getAttributeScroll_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   getAttributeScroll_static_0200
     * @tc.name     getAttributeScroll_static_0200
     * @tc.desc     getAttributeScroll_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getAttributeScroll_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getAttributeScroll_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('scroll_bind_click')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('scroll_fling_text')) as Component;
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('scroll_fling_text');
      console.info("[getAttributeScroll_static_0200] component obj is: " + strJson);
      console.info("[getAttributeScroll_static_0200]: content: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content') !== 'ScrollFling: 0')
        .assertTrue();
      console.info('[getAttributeScroll_static_0200] END');
      done();
    });
  })
}