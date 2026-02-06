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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RichEditorEKeyboardTest() {
  describe('RichEditorEKeyboardTest', () => {
    beforeAll(() => {
      console.info("RichEditorEKeyboardTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorEKeyboardTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorEKeyboardTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get RichEditorEKeyboardTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get RichEditorEKeyboardTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RichEditorEKeyboardTest page error:" + err);
      }
      console.info("RichEditorEKeyboardTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorEKeyboardTest after each called");
    });


    
    
    


/**
     * @tc.number   RichEditorEKeyboardTest_static_0001
     * @tc.name     RichEditorEKeyboardTest_static_0001
     * @tc.desc     RichEditorEKeyboardTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('RichEditorEKeyboardTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorEKeyboardTest0001 START');
      let strJson = inspector.getInspectorByKey('RichEditor');
      let obj = JSON.parseJsonElement(strJson);
      console.log('RichEditorEKeyboardTest-----' +
      obj.getElement('$attrs').getString('enableKeyboardOnFocus'));
      expect(obj.getElement('$attrs').getString('enableKeyboardOnFocus') + '').assertEqual('true');
      console.info("[RichEditorEKeyboardTest0001] end");
      done();
    });

    
    
    


/**
     * @tc.number   RichEditorEKeyboardTest_static_0002
     * @tc.name     RichEditorEKeyboardTest_static_0002
     * @tc.desc     RichEditorEKeyboardTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('RichEditorEKeyboardTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorEKeyboardTest0002 START');
      let strJson = inspector.getInspectorByKey('RichEditor1');
      let obj = JSON.parseJsonElement(strJson);
      console.log('RichEditorEKeyboardTest-----' +
      obj.getElement('$attrs').getString('enableKeyboardOnFocus'));
      expect(obj.getElement('$attrs').getString('enableKeyboardOnFocus') + '').assertEqual('true');
      console.info("[RichEditorEKeyboardTest0002] end");
      done();
    });

    
    
    


/**
     * @tc.number   RichEditorEKeyboardTest_static_0003
     * @tc.name     RichEditorEKeyboardTest_static_0003
     * @tc.desc     RichEditorEKeyboardTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('RichEditorEKeyboardTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info(' RichEditorEKeyboardTest0003 START');
      let strJson = inspector.getInspectorByKey('RichEditor2');
      let obj = JSON.parseJsonElement(strJson);
      console.log('RichEditorEKeyboardTest-----' +
      obj.getElement('$attrs').getString('enableKeyboardOnFocus'));
      expect(obj.getElement('$attrs').getString('enableKeyboardOnFocus') + '').assertEqual('false');
      console.info("[RichEditorEKeyboardTest0003] end");
      done();
    });

    
    
    


/**
     * @tc.number   RichEditorEKeyboardTest_static_0004
     * @tc.name     RichEditorEKeyboardTest_static_0004
     * @tc.desc     RichEditorEKeyboardTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('RichEditorEKeyboardTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info(' RichEditorEKeyboardTest0004 START');
      let strJson = inspector.getInspectorByKey('RichEditor3');
      let obj = JSON.parseJsonElement(strJson);
      console.log('RichEditorEKeyboardTest-----' + obj.getElement('$attrs').getString('enableKeyboardOnFocus'));
      expect(obj.getElement('$attrs').getString('enableKeyboardOnFocus') + '').assertEqual('true');
      console.info("[RichEditorEKeyboardTest0004] end");
      done();
    });
  })
}