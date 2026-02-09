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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function TextAreaStopBackPressTest() {
  describe('TextAreaStopBackPressTest', () => {
    beforeAll(() => {
      console.info("TextAreaStopBackPressTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaStopBackPressTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaStopBackPress",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaStopBackPressTest state pages:" + "");
        if (!("TextAreaStopBackPress" == pages.name)) {
          console.info("get TextAreaStopBackPressTest pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextAreaStopBackPressTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaStopBackPressTest page error:" + err);
      }
      console.info("TextAreaStopBackPressTest beforeEach end");
    });

    
    

    /**
     * @tc.number   TextAreaStopBackPressTest_static_0010
     * @tc.name     TextAreaStopBackPressTest_static_0010
     * @tc.desc     TextAreaStopBackPressTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('TextAreaStopBackPressTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaStopBackPressTest_0010] START');
      let strJson = inspector.getInspectorByKey('TextArea_stopBackPress_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaStopBackPressTest_static_0010] component obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getBoolean('stopBackPress')).assertEqual(true);
      console.info('[TextAreaStopBackPressTest_static_0010] END');
      done();
    });

    
    

    /**
     * @tc.number   TextAreaStopBackPressTest_static_0020
     * @tc.name     TextAreaStopBackPressTest_static_0020
     * @tc.desc     TextAreaStopBackPressTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('TextAreaStopBackPressTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaStopBackPressTest_static_0020] START');
      let strJson = inspector.getInspectorByKey('TextArea_stopBackPress_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaStopBackPressTest_static_0020] component obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getBoolean('stopBackPress')).assertEqual(false);
      console.info('[TextAreaStopBackPressTest_static_0020] END');
      done();
    });

    
    

    /**
     * @tc.number   TextAreaStopBackPressTest_static_0030
     * @tc.name     TextAreaStopBackPressTest_static_0030
     * @tc.desc     TextAreaStopBackPressTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('TextAreaStopBackPressTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaStopBackPressTest_static_0030] START');
      let strJson = inspector.getInspectorByKey('TextArea_stopBackPress_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaStopBackPressTest_static_0030] component obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getBoolean('stopBackPress')).assertEqual(true);
      console.info('[TextAreaStopBackPressTest_0030] END');
      done();
    });

    
    

    /**
     * @tc.number   TextAreaStopBackPressTest_static_0040
     * @tc.name     TextAreaStopBackPressTest_static_0040
     * @tc.desc     TextAreaStopBackPressTest_static_0040
     * @tc.level    Level.LEVEL2
     */
it('TextAreaStopBackPressTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextAreaStopBackPressTest_static_0040] START');
      let strJson = inspector.getInspectorByKey('TextArea_stopBackPress_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAreaStopBackPressTest_static_0040] component obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getBoolean('stopBackPress')).assertEqual(true);
      console.info('[TextAreaStopBackPressTest_static_0040] END');
      done();
    });
  })
}

