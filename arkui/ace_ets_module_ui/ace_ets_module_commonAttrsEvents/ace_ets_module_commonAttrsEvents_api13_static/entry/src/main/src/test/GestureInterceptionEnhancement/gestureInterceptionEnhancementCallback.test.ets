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

export default function gestureInterceptionEnhancementCallbackTest() {
  describe('gestureInterceptionEnhancementCallbackTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api13.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("gestureInterceptionEnhancementCallbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureInterceptionEnhancement/tabsInterceptionEnhancementcallbackTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gestureInterceptionEnhancementCallbackTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get gestureInterceptionEnhancementCallbackTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gestureInterceptionEnhancementCallbackTest page error:" + err);
      }
      console.info("gestureInterceptionEnhancementCallbackTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1500);
    });

    
    /**
     * @tc.number   gestureInterceptionEnhancementCallbackTest_static_0010
     * @tc.name     gestureInterceptionEnhancementCallbackTest_static_0010
     * @tc.desc     gestureInterceptionEnhancementCallbackTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('gestureInterceptionEnhancementCallbackTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('gestureInterceptionEnhancementCallbackTest_static_0010 START');
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let firstTabs = CommonFunc.getComponentRectOnScreen('firstTabsContent');
        let top = firstTabs.top;
        let right = firstTabs.right;
        let left = firstTabs.left;
        let bottom = firstTabs.bottom;
        console.info("gestureInterceptionEnhancementCallbackTest_static_0010 value is" + left + " --" + right + "--" +
          top + "--" + bottom);
        let height = bottom - top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(2500);

        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(2500);

        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(2500);
        // check the callback data
        let strJson = inspector.getInspectorByKey('eventtest');
        await CommonFunc.sleep(2500);
        let obj = JSON.parseJsonElement(strJson);
        console.info("[gestureInterceptionEnhancementCallbackTest_static_0010 ] content: " +
          strJson);
        let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('content'));
        console.info("gestureInterceptionEnhancementCallbackTest_static_0010" + obj2.getDouble('offsetX'));
        console.info("gestureInterceptionEnhancementCallbackTest_static_0010" + obj2.getDouble('offsetY'));
        console.info("gestureInterceptionEnhancementCallbackTest_static_0010" + obj2.getDouble('velocityX'));
        console.info("gestureInterceptionEnhancementCallbackTest_static_0010" + obj2.getDouble('velocityY'));
        console.info("gestureInterceptionEnhancementCallbackTest_static_0010" + obj2.getDouble('velocity'));
        expect(obj2.getDouble('offsetX') <= 0).assertTrue();
        expect(obj2.getDouble('offsetY') == 0).assertTrue();
        expect(Math.abs(obj2.getDouble('velocityX')) > 0).assertTrue();
        expect(Math.abs(obj2.getDouble('velocityY')) > 0).assertTrue();
        expect(obj2.getDouble('velocity') > 0).assertTrue();
        expect(obj2.getDouble('source') == 2).assertTrue();
        expect(obj2.getDouble('pressure') == 0).assertTrue();
        expect(obj2.getDouble('tiltX') == 0).assertTrue();
        expect(obj2.getDouble('tiltY') == 0).assertTrue();
        expect(obj2.getDouble('sourceTool') == 1).assertTrue();
        expect(obj2.getInteger('deviceId') == -1).assertTrue();
        done();
      });


  })
}

