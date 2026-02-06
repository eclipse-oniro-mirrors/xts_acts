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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Message, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import RectValue from '../../../ets/MainAbility/common/Rect'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test.ets'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

class Msg {
  name: string = ''
  value: number

  constructor(name: string, value: number) {
    this.name = name
    this.value = value
  }
}

interface ParamName {
  name: string,
  message: MessageManager<boolean>
}

export default function gestureInterceptionEnhancementTest() {
  describe('gestureInterceptionEnhancementTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api13.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("gestureInterceptionEnhancementTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureInterceptionEnhancement/tabsInterceptionEnhancement',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gestureInterceptionEnhancementTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get gestureInterceptionEnhancementTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gestureInterceptionEnhancementTest page error:" + err);
      }
      console.info("gestureInterceptionEnhancementTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      const tabsInterceptionEnhancement = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(2000);
      tabsInterceptionEnhancement.replaceUrl({ url: 'MainAbility/pages/index/indexassist' })
      await CommonFunc.sleep(2000);
    });

    
    

/**
     * @tc.number   gestureInterceptionEnhancementTest_static_0010
     * @tc.name     gestureInterceptionEnhancementTest_static_0010
     * @tc.desc     gestureInterceptionEnhancementTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('gestureInterceptionEnhancementTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gestureInterceptionEnhancementTest_static_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let firstTabs = CommonFunc.getComponentRectOnScreen('firstTabsContent');
      let top = firstTabs.top;
      let right = firstTabs.right;
      let left = firstTabs.left;
      let bottom = firstTabs.bottom;
      console.info("gestureInterceptionEnhancementTest_static_0010 value is" + left + " --" + right + "--" + top +
        "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      // tabs nest scroll
      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      await CommonFunc.sleep(2500);
      let text01 = await (driver.findComponent(ON.text("BlueTest")) as Promise<Component>)
      let textContent01: string = await text01.getText();
      expect(textContent01).assertEqual("BlueTest");

      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      await CommonFunc.sleep(2500);
      let text02 = await (driver.findComponent(ON.text("PinkTest")) as Promise<Component>)
      let textContent02: string = await text02.getText();
      expect(textContent02).assertEqual("PinkTest");

      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      await CommonFunc.sleep(2500);
      let text03 = await (driver.findComponent(ON.text("blue and pink test")) as Promise<Component>)
      let textContent03: string = await text03.getText();
      expect(textContent03).assertEqual("blue and pink test");
      done();
    });


    
    

/**
     * @tc.number   gestureInterceptionEnhancementTest_static_0020
     * @tc.name     gestureInterceptionEnhancementTest_static_0020
     * @tc.desc     gestureInterceptionEnhancementTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('gestureInterceptionEnhancementTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gestureInterceptionEnhancementTest_static_0020 START');
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({
        name: 'exposeInnerGesture', value: false
      });
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let firstTabs = CommonFunc.getComponentRectOnScreen('firstTabsContent');
      let top = firstTabs.top;
      let right = firstTabs.right;
      let left = firstTabs.left;
      let bottom = firstTabs.bottom;
      console.info("gestureInterceptionEnhancementTest_static_0020 value is" + left + " --" + right + "--" + top +
        "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      // tabs nest scroll
      console.info("gestureInterceptionEnhancementTest_static_0020 driver.swipe start");
      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      await CommonFunc.sleep(2500);
      console.info("gestureInterceptionEnhancementTest_static_0020 BlueTest start");
      let text01 = await (driver.findComponent(ON.text("BlueTest")) as Promise<Component>);
      console.info("gestureInterceptionEnhancementTest_static_0020 BlueTest success");
      let textContent01: string = await text01.getText();
      expect(textContent01).assertEqual("BlueTest");

      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      await CommonFunc.sleep(2500);
      let text02 = await (driver.findComponent(ON.text("PinkTest")) as Promise<Component>)
      let textContent02: string = await text02.getText();
      expect(textContent02).assertEqual("PinkTest");

      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      await CommonFunc.sleep(2500);
      let text03 = await (driver.findComponent(ON.text("PinkTest")) as Promise<Component>)
      let textContent03: string = await text03.getText();
      expect(textContent03).assertEqual("PinkTest");
      done();
    });

    
    

/**
     * @tc.number   gestureInterceptionEnhancementTest_static_0030
     * @tc.name     gestureInterceptionEnhancementTest_static_0030
     * @tc.desc     gestureInterceptionEnhancementTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('gestureInterceptionEnhancementTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gestureInterceptionEnhancementTest_static_0030 START');
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({
        name: 'exposeInnerGesture', value: false
      });
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let firstTabs = CommonFunc.getComponentRectOnScreen('firstTabsContent');
      let top = firstTabs.top;
      let right = firstTabs.right;
      let left = firstTabs.left;
      let bottom = firstTabs.bottom;
      console.info("gestureInterceptionEnhancementTest_static_0030 value is" + left + " --" + right + "--" + top +
        "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      // tabs nest scroll
      console.info("gestureInterceptionEnhancementTest_static_0030 driver.swipe start");
      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      await CommonFunc.sleep(2500);
      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      console.info("gestureInterceptionEnhancementTest_static_0030 driver.swipe 2 success");
      await CommonFunc.sleep(2500);
      await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
        Math.round(left) as Int, Math.round(top + height / 2) as Int);
      await CommonFunc.sleep(2500);
      console.info("gestureInterceptionEnhancementTest_static_0030 driver.swipe success");
      let strJson = inspector.getInspectorByKey('callBackS');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[gestureInterceptionEnhancementTest_static_0030] content: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("");
      done();
    });


  })
}

