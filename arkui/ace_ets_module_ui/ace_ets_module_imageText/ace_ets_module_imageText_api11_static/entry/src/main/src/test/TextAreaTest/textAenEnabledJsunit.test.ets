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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component,  Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textAenEnabledJsunit() {
  describe('textAenEnabledJsunit', () => {

    beforeAll(() => {
      console.info("textAenEnabledJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textAenEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAenEnabled",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textAenEnabledJsunit state pages:" + JSON.stringify(pages));
        if (!("textAenEnabled" == pages.name)) {
          console.info("get textAenEnabledJsunit pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAenEnabledJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAenEnabledJsunit page error:" + err);
      }
      console.info("textAenEnabledJsunit beforeEach end");
    });

    
    /**
     * @tc.number   textAenEnabledJsunit_static_0100
     * @tc.name     textAenEnabledJsunit_static_0100
     * @tc.desc     textAenEnabledJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('textAenEnabledJsunit_static_0100', Level.LEVEL1, async (done: ()=>void) => {

      console.info('textAenEnabledJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('taText'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('taEnable');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textAenEnabledJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textAenEnabledJsunit_static_0100] text1: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("TextArea组件事件触发");
      console.info('[textAenEnabledJsunit_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   textAenEnabledJsunit_static_0200
     * @tc.name     textAenEnabledJsunit_static_0200
     * @tc.desc     textAenEnabledJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('textAenEnabledJsunit_static_0200', Level.LEVEL1, async (done: ()=>void) => {

      console.info('textAenEnabledJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('tiText'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tiEnable');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textAenEnabledJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[textAenEnabledJsunit_static_0200] text2: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("TextInput组件事件触发");
      console.info('[textAenEnabledJsunit_static_0200] END');
      done();
    });

  })
}

