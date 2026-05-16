'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level, beforeAll, afterEach } from '../../../../hypium/index';
import { i18n } from '@kit.LocalizationKit';
import display from '@ohos.display';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';


export default function TabSegmentButtonOptionsTest() {
  describe('TabSegmentButtonOptionsTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("TabSegmentButtonOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("TabSegmentButtonOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/TabSegmentButtonOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("TabSegmentButtonOptions" == pages.name)) {
          console.info("get TabSegmentButtonOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabSegmentButtonOptionsTest page error:" + err);
      }
      console.info("TabSegmentButtonOptionsTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TabSegmentButtonOptionsTest after each called");
    });

    /**
     * @tc.number   TabSegmentButtonOptionsTest_static_001
     * @tc.name     TabSegmentButtonOptionsTest_static_001
     * @tc.desc     TabSegmentButtonOptionsTest_static_001
     * @tc.level    Level.LEVEL1
     */
    it('TabSegmentButtonOptionsTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TabSegmentButtonOptionsTest_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('TabSegmentButtonOptions_type'));
      await CommonFunc.sleep(500);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[TabSegmentButtonOptionsTest_static_001] click succ");
      expect(AppStorage.get<string>("TabSegmentButtonOptions_type")).assertEqual('tab');
      AppStorage.delete("TabSegmentButtonOptions_type")
      console.info('[TabSegmentButtonOptionsTest_static_001] END');
      done();
    });
  })
}