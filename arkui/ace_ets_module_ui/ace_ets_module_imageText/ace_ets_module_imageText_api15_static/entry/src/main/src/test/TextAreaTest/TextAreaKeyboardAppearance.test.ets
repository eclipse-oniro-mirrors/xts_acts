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
import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index.ets"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function TextAreaKeyboardAppearanceTest() {
  describe('TextAreaKeyboardAppearanceTest', () => {
    beforeAll(() => {
      console.info("TextAreaKeyboardAppearanceTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaKeyboardAppearanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaKeyboardAppearance",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextAreaKeyboardAppearanceTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextAreaKeyboardAppearanceTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaKeyboardAppearanceTest page error:" + err);
      }
      console.info("TextAreaKeyboardAppearanceTest beforeEach end");
    });

    
    
/**
     * @tc.number   TextAreaKeyboardAppearanceTest_static_0010
     * @tc.name     TextAreaKeyboardAppearanceTest_static_0010
     * @tc.desc     TextAreaKeyboardAppearanceTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('TextAreaKeyboardAppearanceTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaKeyboardAppearanceTest_0010] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextArea_KeyboardAppearance_NONE_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaKeyboardAppearanceTest_0010] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[TextAreaKeyboardAppearanceTest_0010] END');
      done();
    });

    
    
/**
     * @tc.number   TextAreaKeyboardAppearanceTest_static_0020
     * @tc.name     TextAreaKeyboardAppearanceTest_static_0020
     * @tc.desc     TextAreaKeyboardAppearanceTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('TextAreaKeyboardAppearanceTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaKeyboardAppearanceTest_0020] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextArea_KeyboardAppearance_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaKeyboardAppearanceTest_0020] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(1);
      console.info('[TextAreaKeyboardAppearanceTest_0020] END');
      done();
    });

    
    
/**
     * @tc.number   TextAreaKeyboardAppearanceTest_static_0030
     * @tc.name     TextAreaKeyboardAppearanceTest_static_0030
     * @tc.desc     TextAreaKeyboardAppearanceTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('TextAreaKeyboardAppearanceTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaKeyboardAppearanceTest_0030] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextArea_KeyboardAppearance_LIGHT_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaKeyboardAppearanceTest_0030] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(2);
      console.info('[TextAreaKeyboardAppearanceTest_0030] END');
      done();
    });

    
    
/**
     * @tc.number   TextAreaKeyboardAppearanceTest_static_0040
     * @tc.name     TextAreaKeyboardAppearanceTest_static_0040
     * @tc.desc     TextAreaKeyboardAppearanceTest_static_0040
     * @tc.level    Level.LEVEL2
     */
it('TextAreaKeyboardAppearanceTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaKeyboardAppearanceTest_0040] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextArea_KeyboardAppearance_DARK_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaKeyboardAppearanceTest_0040] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(3);
      console.info('[TextAreaKeyboardAppearanceTest_0040] END');
      done();
    });

    
    
/**
     * @tc.number   TextAreaKeyboardAppearanceTest_static_0050
     * @tc.name     TextAreaKeyboardAppearanceTest_static_0050
     * @tc.desc     TextAreaKeyboardAppearanceTest_static_0050
     * @tc.level    Level.LEVEL2
     */
it('TextAreaKeyboardAppearanceTest_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('TextAreaKeyboardAppearanceTest_0050 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextArea_KeyboardAppearance_DEFAULT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaKeyboardAppearanceTest_0050] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[TextAreaKeyboardAppearanceTest_0050] END');
      done();
    });

    
    
/**
     * @tc.number   TextAreaKeyboardAppearanceTest_static_0060
     * @tc.name     TextAreaKeyboardAppearanceTest_static_0060
     * @tc.desc     TextAreaKeyboardAppearanceTest_static_0060
     * @tc.level    Level.LEVEL2
     */
it('TextAreaKeyboardAppearanceTest_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaKeyboardAppearanceTest_0060] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextArea_KeyboardAppearance_UNDEFINED');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaKeyboardAppearanceTest_0060] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[TextAreaKeyboardAppearanceTest_0060] END');
      done();
    });
  })
}

