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


export default function SegmentButtonItemOptionsArrayPushTest() {
  describe('SegmentButtonItemOptionsArrayPushTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("SegmentButtonItemOptionsArrayPushTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("SegmentButtonItemOptionsArrayPushTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonItemOptionsArray1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonItemOptionsArray1" == pages.name)) {
          console.info("get SegmentButtonItemOptionsArrayPushTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegmentButtonItemOptionsArrayPushTest page error:" + err);
      }
      console.info("SegmentButtonItemOptionsArrayPushTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonItemOptionsArrayPushTest after each called");
    });

    /**
     * @tc.number   SegmentButtonItemOptionsArrayPushTest_static_001
     * @tc.name     SegmentButtonItemOptionsArrayPushTest_static_001
     * @tc.desc     SegmentButtonItemOptionsArrayPushTest_static_001
     * @tc.level    Level.LEVEL1
     */
    it('SegmentButtonItemOptionsArrayPushTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayPushTest_static_001 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('SegmentButtonItemOptionsArray_push'));
      await CommonFunc.sleep(500);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.text('a'));
      expect(btn2).not().assertUndefined();
      console.info("[SegmentButtonItemOptionsArrayPushTest_static_001] click succ");
      expect(AppStorage.get<string>("SegmentButtonItemOptionsArray_push")).assertEqual('push succ');
      AppStorage.delete("SegmentButtonItemOptionsArray_push");
      console.info('[SegmentButtonItemOptionsArrayPushTest_static_001] END');
      done();
    });
  })
}