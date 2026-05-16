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


export default function CommonSegmentButtonOptionsTest() {
  describe('CommonSegmentButtonOptionsTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("CommonSegmentButtonOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("CommonSegmentButtonOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/CommonSegmentButtonOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("CommonSegmentButtonOptions" == pages.name)) {
          console.info("get CommonSegmentButtonOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CommonSegmentButtonOptionsTest page error:" + err);
      }
      console.info("CommonSegmentButtonOptionsTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CommonSegmentButtonOptionsTest after each called");
    });

    /**
     * @tc.number   CommonSegmentButtonOptionsTest_static_001
     * @tc.name     CommonSegmentButtonOptionsTest_static_001
     * @tc.desc     CommonSegmentButtonOptionsTest_static_001
     * @tc.level    Level.LEVEL1
     */
    it('CommonSegmentButtonOptionsTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonSegmentButtonOptionsTest_static_001] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info("[CommonSegmentButtonOptionsTest_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityText')).assertEqual('notSelect');
      console.info('[CommonSegmentButtonOptionsTest_static_001] END');
      done();
    });

    /**
     * @tc.number   CommonSegmentButtonOptionsTest_static_002
     * @tc.name     CommonSegmentButtonOptionsTest_static_002
     * @tc.desc     CommonSegmentButtonOptionsTest_static_002
     * @tc.level    Level.LEVEL1
     */
    it('CommonSegmentButtonOptionsTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonSegmentButtonOptionsTest_static_002] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info("[CommonSegmentButtonOptionsTest_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityText')).assertEqual('select');
      console.info('[CommonSegmentButtonOptionsTest_static_002] END');
      done();
    });

    /**
     * @tc.number   CommonSegmentButtonOptionsTest_static_003
     * @tc.name     CommonSegmentButtonOptionsTest_static_003
     * @tc.desc     CommonSegmentButtonOptionsTest_static_003
     * @tc.level    Level.LEVEL1
     */
    it('CommonSegmentButtonOptionsTest_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonSegmentButtonOptionsTest_static_003] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
      console.info("[CommonSegmentButtonOptionsTest_static_003] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');
      console.info('[CommonSegmentButtonOptionsTest_static_003] END');
      done();
    });

    /**
     * @tc.number   CommonSegmentButtonOptionsTest_static_004
     * @tc.name     CommonSegmentButtonOptionsTest_static_004
     * @tc.desc     CommonSegmentButtonOptionsTest_static_004
     * @tc.level    Level.LEVEL1
     */
    it('CommonSegmentButtonOptionsTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonSegmentButtonOptionsTest_static_004] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
      console.info("[CommonSegmentButtonOptionsTest_static_004] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityDescription')).assertEqual('CommonSegmentButtonOptions');
      console.info('[CommonSegmentButtonOptionsTest_static_004] END');
      done();
    });

    /**
     * @tc.number   CommonSegmentButtonOptionsTest_static_005
     * @tc.name     CommonSegmentButtonOptionsTest_static_005
     * @tc.desc     CommonSegmentButtonOptionsTest_static_005
     * @tc.level    Level.LEVEL1
     */
    it('CommonSegmentButtonOptionsTest_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonSegmentButtonOptionsTest_static_005] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('CapsuleSegmentButtonOptions_type'));
      await CommonFunc.sleep(500);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[CommonSegmentButtonOptionsTest_static_005] click succ");
      expect(AppStorage.get<string>("CapsuleSegmentButtonOptions_type")).assertEqual('capsule');
      AppStorage.delete("CapsuleSegmentButtonOptions_type")
      console.info('[CommonSegmentButtonOptionsTest_static_005] END');
      done();
    });
  })
}