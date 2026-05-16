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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
export default function stopImageAnalyzerJsunit() {
  describe('stopImageAnalyzerJsunit', () => {
    beforeAll(() => {
      
      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("stopImageAnalyzer beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponent/stopImageAnalyzer",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stopImageAnalyzer state pages: " + JSON.stringify(pages));
        if (!("stopImageAnalyzer" == pages.name)) {
          console.info("get stopImageAnalyzer state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push stopImageAnalyzer page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   startImageAnalyzerTest_static_0010
     * @tc.name     startImageAnalyzerTest_static_0010
     * @tc.desc     startImageAnalyzerTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('startImageAnalyzerTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('startImageAnalyzerTest_static_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await (driver.findComponent(ON.id('startImageAnalyzer_button')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('startImageAnalyzer_text');
      console.info("[startImageAnalyzerTest_static_0010] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('startImageAnalyzer succ');
      console.info('[startImageAnalyzerTest_static_0010] END');
      done();
    });

    
    /**
     * @tc.number   stopImageAnalyzerTest_static_0020
     * @tc.name     stopImageAnalyzerTest_static_0020
     * @tc.desc     stopImageAnalyzerTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('stopImageAnalyzerTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('stopImageAnalyzerTest_static_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await (driver.findComponent(ON.id('startImageAnalyzer_button')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await (driver.findComponent(ON.id('stopImageAnalyzer_button')) as Promise<Component>);
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stopImageAnalyzer_text');
      console.info("[stopImageAnalyzerTest_static_0020] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('stopImageAnalyzer succ');
      console.info('[stopImageAnalyzerTest_static_0020] END');
      done();
    });
  })
}

