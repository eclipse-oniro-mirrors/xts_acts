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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { startAbility, UtilsTest } from '../Util.test.ets';

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;

export default function setScrollEvent() {
  describe('setScrollEvent', () => {
    beforeAll(() => {
      console.info("SearchTypeTest beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/setScrollEvent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("setScrollEvent" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    
    
/**
     * @tc.number   setScrollEvent_static_0100
     * @tc.name     setScrollEvent_static_0100
     * @tc.desc     setScrollEvent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('setScrollEvent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[setScrollEvent_static_0100] START');
      let driver = Driver.create()
      let btnEvent: Component = await driver.findComponent(ON.id('Scroll_addCommonEvent_03')) as Component;
      await btnEvent!.click();
      await CommonFunc.sleep(1500);

      let swipeScroll = CommonFunc.getComponentRectOnScreen('key_ScrollItem_set');
      let top = swipeScroll.top;
      let right = swipeScroll.right;
      let left = swipeScroll.left;
      let bottom = swipeScroll.bottom;
      console.info("setScrollEvent_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height * 0.8)).toInt(),
        (Math.round(left + width / 2)).toInt(), (Math.round(top + height * 0.2)).toInt());
      await CommonFunc.sleep(2000);
      let btn: Component = await driver.findComponent(ON.id('Scroll_setOnReach_03')) as Component;
      await btn!.click();
      await CommonFunc.sleep(1500);

      let btn1: Component = await driver.findComponent(ON.id('Scroll_setOnWill_03')) as Component;
      await btn1!.click();
      await CommonFunc.sleep(1500);
      let strJson1 = inspector.getInspectorByKey('Scroll_setOnWill_03');
      console.info("[setScrollEvent_static_0100] content1: " +
      JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual('setOnWillScroll_setOnDidScroll');

      let btn2: Component = await driver.findComponent(ON.id('Scroll_setOnScroll_03')) as Component;
      await btn2!.click();
      await CommonFunc.sleep(1500);
      let strJson2 = inspector.getInspectorByKey('Scroll_setOnScroll_03');
      console.info("[setScrollEvent_static_0100] content2: " +
      JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
        .assertEqual('setOnScrollStart_setOnScrollStop');

      let btn3: Component = await driver.findComponent(ON.id('Scroll_setOnFrameBegin_03')) as Component;
      await btn3!.click();
      await CommonFunc.sleep(1500);
      let strJson3 = inspector.getInspectorByKey('Scroll_setOnFrameBegin_03');
      console.info("[setScrollEvent_static_0100] content3: " +
      JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
        .assertEqual('setOnScrollFrameBegin');
      console.info('[setScrollEvent_static_0100] END');
      done();
    });
  })
}
