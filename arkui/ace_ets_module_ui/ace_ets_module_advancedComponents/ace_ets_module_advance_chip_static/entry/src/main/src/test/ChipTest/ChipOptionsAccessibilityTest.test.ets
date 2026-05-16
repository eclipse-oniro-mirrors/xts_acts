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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import {
  $r,
} from '@ohos.arkui.component';

export default function ChipOptionsAccessibilityTest() {
  describe('ChipOptionsAccessibilityTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipOptionsAccessibilityTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipOptionsAccessibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Chip/ChipOptionsAccessibilityTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipOptionsAccessibilityTest state pages:" + JSON.stringify(pages));
        if (!("ChipOptionsAccessibilityTest" == pages.name)) {
          console.info("get ChipOptionsAccessibilityTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ChipTest0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipOptionsAccessibilityTest page error:" + err);
      }
      console.info("ChipOptionsAccessibilityTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipOptionsAccessibilityTest after each called");
    });




    /**
     * @tc.number   ChipOptionsAccessibilityTest_static_001
     * @tc.name     ChipOptionsAccessibilityTest_static_001
     * @tc.desc     ChipOptionsAccessibilityTest_static_001
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsAccessibilityTest_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsAccessibilityTest_static_001] START');
      await CommonFunc.sleep(1000);
      const driver = Driver.create();
      const chipList = await driver.findComponents(ON.type('Image').within(ON.id('ChipOptionsAccessibilityExample')));
      console.info('[ChipOptionsAccessibilityTest_static_001] length '+chipList?.length);
      expect(chipList?.length).assertEqual(5);
      console.info('[ChipOptionsAccessibilityTest_static_001] END');
      done();
    });

    /**
     * @tc.number   ChipOptionsAccessibilityTest_static_002
     * @tc.name     ChipOptionsAccessibilityTest_static_002
     * @tc.desc     ChipOptionsAccessibilityTest_static_002
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsAccessibilityTest_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsAccessibilityTest_static_002] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]

      console.info("[ChipOptionsAccessibilityTest_static_002] component accessibilityDescription is: " + Btn.getElement('$attrs').getString('accessibilityDescription'));
      expect(Btn.getElement('$attrs').getString('accessibilityDescription')).assertEqual('');
      console.info("[ChipOptionsAccessibilityTest_static_002] component accessibilityLevel is: " + Btn.getElement('$attrs').getString('accessibilityLevel'));
      expect(Btn.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      console.info('[ChipOptionsAccessibilityTest_static_002] END');
      done();
    });

    /**
     * @tc.number   ChipOptionsAccessibilityTest_static_003
     * @tc.name     ChipOptionsAccessibilityTest_static_003
     * @tc.desc     ChipOptionsAccessibilityTest_static_003
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsAccessibilityTest_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsAccessibilityTest_static_003] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]

      console.info("[ChipOptionsAccessibilityTest_static_003] component accessibilityDescription is: " + Btn.getElement('$attrs').getString('accessibilityDescription'));
      expect(Btn.getElement('$attrs').getString('accessibilityDescription')).assertEqual('');
      console.info("[ChipOptionsAccessibilityTest_static_003] component accessibilityLevel is: " + Btn.getElement('$attrs').getString('accessibilityLevel'));
      expect(Btn.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      console.info('[ChipOptionsAccessibilityTest_static_003] END');
      done();
    });

    /**
     * @tc.number   ChipOptionsAccessibilityTest_static_004
     * @tc.name     ChipOptionsAccessibilityTest_static_004
     * @tc.desc     ChipOptionsAccessibilityTest_static_004
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsAccessibilityTest_static_004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsAccessibilityTest_static_004] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]

      console.info("[ChipOptionsAccessibilityTest_static_004] component accessibilityDescription is: " + Btn.getElement('$attrs').getString('accessibilityDescription'));
      expect(Btn.getElement('$attrs').getString('accessibilityDescription')).assertEqual('accessibilityDescription1');
      console.info("[ChipOptionsAccessibilityTest_static_004] component accessibilityLevel is: " + Btn.getElement('$attrs').getString('accessibilityLevel'));
      expect(Btn.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');
      console.info('[ChipOptionsAccessibilityTest_static_004] END');
      done();
    });

    /**
     * @tc.number   ChipOptionsAccessibilityTest_static_005
     * @tc.name     ChipOptionsAccessibilityTest_static_005
     * @tc.desc     ChipOptionsAccessibilityTest_static_005
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsAccessibilityTest_static_005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsAccessibilityTest_static_005] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]

      console.info("[ChipOptionsAccessibilityTest_static_005] component accessibilityDescription is: " + Btn.getElement('$attrs').getString('accessibilityDescription'));
      expect(Btn.getElement('$attrs').getString('accessibilityDescription')).assertEqual('accessibilityDescription2');
      console.info("[ChipOptionsAccessibilityTest_static_005] component accessibilityLevel is: " + Btn.getElement('$attrs').getString('accessibilityLevel'));
      expect(Btn.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no');
      console.info('[ChipOptionsAccessibilityTest_static_005] END');
      done();
    });
    /**
     * @tc.number   ChipOptionsAccessibilityTest_static_006
     * @tc.name     ChipOptionsAccessibilityTest_static_006
     * @tc.desc     ChipOptionsAccessibilityTest_static_006
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsAccessibilityTest_static_006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsAccessibilityTest_static_006] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[4]

      console.info("[ChipOptionsAccessibilityTest_static_006] component accessibilityDescription is: " + Btn.getElement('$attrs').getString('accessibilityDescription'));
      expect(Btn.getElement('$attrs').getString('accessibilityDescription')).assertEqual('accessibilityDescription3');
      console.info("[ChipOptionsAccessibilityTest_static_006] component accessibilityLevel is: " + Btn.getElement('$attrs').getString('accessibilityLevel'));
      expect(Btn.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no-hide-descendants');
      console.info('[ChipOptionsAccessibilityTest_static_006] END');
      done();
    });
  })
}