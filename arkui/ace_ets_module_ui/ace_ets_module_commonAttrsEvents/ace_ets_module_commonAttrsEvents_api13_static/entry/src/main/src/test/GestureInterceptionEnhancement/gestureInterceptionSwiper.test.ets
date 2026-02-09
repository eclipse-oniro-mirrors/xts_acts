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
import RectValue from '../../../ets/MainAbility/common/Rect'
import { Message, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
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

export default function gestureInterceptionEnhancementCallbackSwiperTest() {
  describe('gestureInterceptionEnhancementCallbackSwiperTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api13.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("gestureInterceptionEnhancementCallbackSwiperTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureInterceptionEnhancement/tabsInterceptionRecognizerSwiperTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gestureInterceptionEnhancementCallbackSwiperTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get gestureInterceptionEnhancementCallbackSwiperTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gestureInterceptionEnhancementCallbackSwiperTest page error:" + err);
      }
      console.info("gestureInterceptionEnhancementCallbackSwiperTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      const tabsInterceptionSwiperTest = AppStorage.get<Router>("router") as Router

      tabsInterceptionSwiperTest.replaceUrl({ url: 'MainAbility/pages/index/indexassist' })
      await CommonFunc.sleep(2000);
    });

    
    
/**
     * @tc.number   gestureInterceptionEnhancementCallbackSwiperTest_static_0010
     * @tc.name     gestureInterceptionEnhancementCallbackSwiperTest_static_0010
     * @tc.desc     gestureInterceptionEnhancementCallbackSwiperTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('gestureInterceptionEnhancementCallbackSwiperTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('gestureInterceptionEnhancementCallbackSwiperTest_static_0010 START');
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let firstswiper = CommonFunc.getComponentRectOnScreen('swiperRecogniserTest');
        let top = firstswiper.top;
        let right = firstswiper.right;
        let left = firstswiper.left;
        let bottom = firstswiper.bottom;
        console.info("gestureInterceptionEnhancementCallbackSwiperTest_static_0010 value is" + left + " --" + right +
          "--" + top + "--" + bottom);
        let height = bottom - top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(3000);

        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(3000);

        // check the GestureRecognizerJudgeBegin trigger
        let strJson = inspector.getInspectorByKey('callBackString');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[gestureInterceptionEnhancementCallbackSwiperTest_static_0010 ] content: " +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(obj.getElement('$attrs').getString('content')).assertEqual("接口触发");
        done();
      });

    
    
/**
     * @tc.number   gestureInterceptionEnhancementCallbackSwiperTest_static_0020
     * @tc.name     gestureInterceptionEnhancementCallbackSwiperTest_static_0020
     * @tc.desc     gestureInterceptionEnhancementCallbackSwiperTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('gestureInterceptionEnhancementCallbackSwiperTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('gestureInterceptionEnhancementCallbackSwiperTest_static_0020 START');

        AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({
          name: 'exposeInnerGesture', value: false
        });
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let firstswiper = CommonFunc.getComponentRectOnScreen('swiperRecogniserTest');
        let top = firstswiper.top;
        let right = firstswiper.right;
        let left = firstswiper.left;
        let bottom = firstswiper.bottom;
        console.info("gestureInterceptionEnhancementCallbackSwiperTest_static_0020 value is" + left + " --" + right +
          "--" + top + "--" + bottom);
        let height = bottom - top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(3000);

        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(3000);

        // check the GestureRecognizerJudgeBegin trigger
        let strJson = inspector.getInspectorByKey('callBackString');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[gestureInterceptionEnhancementCallbackSwiperTest_static_0020 ] content: " +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(obj.getElement('$attrs').getString('content')).assertEqual("接口触发");
        done();
      });


  })
}

