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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import {TextAlign} from '@ohos.arkui.component'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from "../../../../ets/MainAbility/common/Common";
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RichEditorTest() {
  describe('RichEditorTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("RichEditorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditor/RichEditor",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get RichEditorTest state pages:" + JSON.stringify(pages));
        if (!("RichEditor" == pages.name)) {
          console.info("get RichEditorTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RichEditorTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTest page error:" + err);
      }
      console.info("RichEditorTest beforeEach end");
    });
    beforeAll(() => {
      console.info("RichEditorTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    
    /**
     * @tc.number   RichEditorTest_static_001
     * @tc.name     RichEditorTest_static_001
     * @tc.desc     RichEditorTest_static_001
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorTest_static_001', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[RichEditorTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('RichEditor_Start'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RichEditor_get'));
      await (button1?.click() as Promise<void>);
      console.info("RichEditorTest_001 click success");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_text');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorTest_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual(String(TextAlign.Start));
      console.info('[RichEditorTest_001] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorTest_static_002
     * @tc.name     RichEditorTest_static_002
     * @tc.desc     RichEditorTest_static_002
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorTest_static_002', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[RichEditorTest_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('RichEditor_End'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RichEditor_get'));
      await (button1?.click() as Promise<void>);
      console.info("RichEditorTest_002 click success");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_text');
      await CommonFunc.sleep(200);
       let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorTest_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual(String(TextAlign.End));
      console.info('[RichEditorTest_002] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorTest_static_003
     * @tc.name     RichEditorTest_static_003
     * @tc.desc     RichEditorTest_static_003
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorTest_static_003', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[RichEditorTest_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('RichEditor_Center'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RichEditor_get'));
      await (button1?.click() as Promise<void>);
      console.info("RichEditorTest_003 click success");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_text');
      await CommonFunc.sleep(200);
       let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorTest_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual(String(TextAlign.Center));
      console.info('[RichEditorTest_003] END');
      done();
    });
  })
}
