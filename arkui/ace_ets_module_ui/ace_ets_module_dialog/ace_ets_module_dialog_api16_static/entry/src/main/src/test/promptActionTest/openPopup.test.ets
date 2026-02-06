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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function openPopupTest() {
  describe('openPopupTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("openPopupTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/openPopup',
      }
      try {
        const showToastOptions = AppStorage.get<Router>("router") as Router
        showToastOptions.clear();
        let pages = showToastOptions.getState();
        console.info("get openPopupTest state pages: " + JSON.stringify(pages));
        if (!("openPopupTest" == pages.name)) {
          console.info("get openPopupTest state pages.name: " + JSON.stringify(pages.name));
          showToastOptions.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push openPopupTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   openPopupTest_static_0100
     * @tc.name     openPopupTest_static_0100
     * @tc.desc     openPopupTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('openPopupTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'openPopupTest_static_0100';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(3500);
      let openPopup = inspector.getInspectorByKey('openPopup');
      console.info("[openPopupTest_static_0100] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(openPopup).getElement('$attrs')));
      expect(JSON.parseJsonElement(openPopup).getElement('$attrs').getString('content')).assertEqual('openPopup');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}