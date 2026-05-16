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
import { describe, beforeAll,beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RichEditorKeyboardAppearanceTest() {
  describe('RichEditorKeyboardAppearanceTest', () => {
    beforeAll(() => {
      console.info("RichEditorKeyboardAppearanceTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorKeyboardAppearanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorKeyboardAppearance",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get RichEditorKeyboardAppearanceTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get RichEditorKeyboardAppearanceTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RichEditorKeyboardAppearanceTest page error:" + err);
      }
      console.info("RichEditorKeyboardAppearanceTest beforeEach end");
    }); 

    
    
    
/**
     * @tc.number   RichEditorKeyboardAppearanceTest_static_0010
     * @tc.name     RichEditorKeyboardAppearanceTest_static_0010
     * @tc.desc     RichEditorKeyboardAppearanceTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('RichEditorKeyboardAppearanceTest_static_0010', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorKeyboardAppearanceTest_0010] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_KeyboardAppearance_NONE_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0010] component obj is: " + strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0010] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[RichEditorKeyboardAppearanceTest_0010] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorKeyboardAppearanceTest_static_0020
     * @tc.name     RichEditorKeyboardAppearanceTest_static_0020
     * @tc.desc     RichEditorKeyboardAppearanceTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('RichEditorKeyboardAppearanceTest_static_0020', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorKeyboardAppearanceTest_0020] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_KeyboardAppearance_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0020] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(1);
      console.info('[RichEditorKeyboardAppearanceTest_0020] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorKeyboardAppearanceTest_static_0030
     * @tc.name     RichEditorKeyboardAppearanceTest_static_0030
     * @tc.desc     RichEditorKeyboardAppearanceTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('RichEditorKeyboardAppearanceTest_static_0030', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorKeyboardAppearanceTest_0030] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_KeyboardAppearance_LIGHT_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0030] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(2);
      console.info('[RichEditorKeyboardAppearanceTest_0030] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorKeyboardAppearanceTest_static_0040
     * @tc.name     RichEditorKeyboardAppearanceTest_static_0040
     * @tc.desc     RichEditorKeyboardAppearanceTest_static_0040
     * @tc.level    Level.LEVEL2
     */
it('RichEditorKeyboardAppearanceTest_static_0040', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorKeyboardAppearanceTest_0040] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_KeyboardAppearance_DARK_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0040] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(3);
      console.info('[RichEditorKeyboardAppearanceTest_0040] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorKeyboardAppearanceTest_static_0050
     * @tc.name     RichEditorKeyboardAppearanceTest_static_0050
     * @tc.desc     RichEditorKeyboardAppearanceTest_static_0050
     * @tc.level    Level.LEVEL2
     */
it('RichEditorKeyboardAppearanceTest_static_0050', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorKeyboardAppearanceTest_0050] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_KeyboardAppearance_DEFAULT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0050] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[RichEditorKeyboardAppearanceTest_0050] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorKeyboardAppearanceTest_static_0060
     * @tc.name     RichEditorKeyboardAppearanceTest_static_0060
     * @tc.desc     RichEditorKeyboardAppearanceTest_static_0060
     * @tc.level    Level.LEVEL2
     */
it('RichEditorKeyboardAppearanceTest_static_0060', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorKeyboardAppearanceTest_0060] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditor_KeyboardAppearance_UNDEFINED');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0060] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[RichEditorKeyboardAppearanceTest_0060] END');
      done();
    });
  })
}

