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
import { describe,beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
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


export default function RichEditorStopBackPressTest() {
  describe('RichEditorStopBackPressTest', () => {
    beforeAll(() => {
      console.info("RichEditorStopBackPressTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorStopBackPressTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorStopBackPress",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get RichEditorStopBackPressTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get RichEditorStopBackPressTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RichEditorStopBackPressTest page error:" + err);
      }
      console.info("RichEditorStopBackPressTest beforeEach end");
    }); 

    
    
    
/**
     * @tc.number   RichEditorStopBackPressTest_static_0010
     * @tc.name     RichEditorStopBackPressTest_static_0010
     * @tc.desc     RichEditorStopBackPressTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('RichEditorStopBackPressTest_static_0010', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorStopBackPressTest_0010] START');
      let strJson = inspector.getInspectorByKey('RichEditor_stopBackPress_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorStopBackPressTest_0010] component obj is: " + strJson);
      console.info("[RichEditorStopBackPressTest_0010] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('stopBackPress')).assertEqual('true');
      console.info('[RichEditorStopBackPressTest_0010] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorStopBackPressTest_static_0020
     * @tc.name     RichEditorStopBackPressTest_static_0020
     * @tc.desc     RichEditorStopBackPressTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('RichEditorStopBackPressTest_static_0020', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorStopBackPressTest_0020] START');
      let strJson = inspector.getInspectorByKey('RichEditor_stopBackPress_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorStopBackPressTest_0020] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('stopBackPress')).assertEqual('false');
      console.info('[RichEditorStopBackPressTest_0020] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorStopBackPressTest_static_0030
     * @tc.name     RichEditorStopBackPressTest_static_0030
     * @tc.desc     RichEditorStopBackPressTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('RichEditorStopBackPressTest_static_0030', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorStopBackPressTest_0030] START');
      let strJson = inspector.getInspectorByKey('RichEditor_stopBackPress_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorStopBackPressTest_0030] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('stopBackPress')).assertEqual('true');
      console.info('[RichEditorStopBackPressTest_0030] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorStopBackPressTest_static_0040
     * @tc.name     RichEditorStopBackPressTest_static_0040
     * @tc.desc     RichEditorStopBackPressTest_static_0040
     * @tc.level    Level.LEVEL2
     */
it('RichEditorStopBackPressTest_static_0040', Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('[RichEditorStopBackPressTest_0040] START');
      let strJson = inspector.getInspectorByKey('RichEditor_stopBackPress_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditorStopBackPressTest_0040] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('stopBackPress')).assertEqual('true');
      console.info('[RichEditorStopBackPressTest_0040] END');
      done();
    });
  })
}

