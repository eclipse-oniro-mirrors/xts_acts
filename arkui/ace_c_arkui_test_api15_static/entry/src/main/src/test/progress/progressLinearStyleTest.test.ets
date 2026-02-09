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

import { expect, describe, it, afterEach, Level, beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

export default function ProgressLinearStyleTest(){

  describe('ProgressLinearStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testProgressLinearStyle001
     * @tc.name     testProgressLinearStyle001
     * @tc.desc     testProgressLinearStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testProgressLinearStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestProgressLinearStyle';
      await Utils.pushPage(`progress/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('progress');
      await driver.delayMs(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressLinearStyle001] component width strJson:" + JSON.stringify(strJson));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('strokeWidth')).assertEqual('50.00vp');
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('strokeRadius')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual('false');
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')).assertEqual('true');
      done();
    });

    
    /**
     * @tc.number   testProgressLinearStyle002
     * @tc.name     testProgressLinearStyle002
     * @tc.desc     testProgressLinearStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testProgressLinearStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestProgressLinearStyle';
      await Utils.pushPage(`progress/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('progress1');
      await driver.delayMs(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressLinearStyle002] component width strJson:" + JSON.stringify(strJson));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('strokeWidth')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('strokeRadius')).assertEqual('2.00vp');
      done();
    });

    
    /**
     * @tc.number   testProgressLinearStyle003
     * @tc.name     testProgressLinearStyle003
     * @tc.desc     testProgressLinearStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testProgressLinearStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestProgressLinearStyle';
      await Utils.pushPage(`progress/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let progress:Component = await driver.findComponent(ON.id('progress')) as Component;
      await progress.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('progress');
      await driver.delayMs(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressLinearStyle003] component width strJson:" + JSON.stringify(strJson));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('strokeWidth')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('strokeRadius')).assertEqual('2.00vp');
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual('true');
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')).assertEqual('false');
      done();
    });

    
    /**
     * @tc.number   testProgressLinearStyle004
     * @tc.name     testProgressLinearStyle004
     * @tc.desc     testProgressLinearStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testProgressLinearStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestProgressLinearStyle';
      await Utils.pushPage(`progress/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('progress2');
      await driver.delayMs(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressLinearStyle004] component width strJson:" + JSON.stringify(strJson));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('strokeWidth')).assertEqual('9.00vp');
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('strokeRadius')).assertEqual('4.50vp');
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual('true');
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')).assertEqual('false');
      done();
    });
  })
}
