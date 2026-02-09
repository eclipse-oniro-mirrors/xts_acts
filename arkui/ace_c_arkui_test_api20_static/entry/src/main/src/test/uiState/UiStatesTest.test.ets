'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function uiStatesTest() {

  describe('UiStatesTest', (): void => {

    let PAGE_TAG = 'UiStatesTest';
    beforeAll(async (): Promise<void> => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api20.static", "EntryAbility")
      console.info("[ui] beforeAll end");
      await Utils.pushPage(`uiState/${PAGE_TAG}`, false);
    });

    
    /**
     * @tc.number   uiStatesTest_001
     * @tc.name     uiStatesTest_001
     * @tc.desc     uiStatesTest_001
     * @tc.level    Level.LEVEL1
     */
    it('uiStatesTest_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('textStates'));
      await Utils.sleep(2000);
      await (component?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textStates');
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("uiStatesTest_001 content is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PRESSED');
      done();
    })

    
    /**
     * @tc.number   uiStatesTest_002
     * @tc.name     uiStatesTest_002
     * @tc.desc     uiStatesTest_002
     * @tc.level    Level.LEVEL1
     */
    it('uiStatesTest_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('textStates'));
      let component1 = await driver.findComponent(ON.id('OnChangeButton'));
      await (component1?.click() as Promise<void>);
      await Utils.sleep(2000);
      await (component?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textStates');
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("uiStatesTest_002 content is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PRESSED');
      done();
    })
  })
}