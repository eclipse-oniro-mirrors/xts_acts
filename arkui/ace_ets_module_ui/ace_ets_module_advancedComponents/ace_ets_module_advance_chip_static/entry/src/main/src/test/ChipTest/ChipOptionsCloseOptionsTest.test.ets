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

export default function ChipOptionsCloseOptionsTest() {
  describe('ChipOptionsCloseOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipOptionsCloseOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipOptionsCloseOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Chip/ChipOptionsCloseOptionsTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipOptionsCloseOptionsTest state pages:" + JSON.stringify(pages));
        if (!("ChipOptionsCloseOptionsTest" == pages.name)) {
          console.info("get ChipOptionsCloseOptionsTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ChipTest0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipOptionsCloseOptionsTest page error:" + err);
      }
      console.info("ChipOptionsCloseOptionsTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipOptionsCloseOptionsTest after each called");
    });




    /**
     * @tc.number   ChipOptionsCloseOptionsTest_static_001
     * @tc.name     ChipOptionsCloseOptionsTest_static_001
     * @tc.desc     ChipOptionsCloseOptionsTest_static_001
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsCloseOptionsTest_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsCloseOptionsTest_static_001] START');
      await CommonFunc.sleep(1000);
      const driver = Driver.create();
      const chipList = await driver.findComponents(ON.type('Image').within(ON.id('ChipOptionsCloseOptionsExample')));
      console.info('[ChipOptionsCloseOptionsTest_static_001] length '+chipList?.length);
      expect(chipList?.length).assertEqual(2);
      console.info('[ChipOptionsCloseOptionsTest_static_001] END');
      done();
    });

    /**
     * @tc.number   ChipOptionsCloseOptionsTest_static_002
     * @tc.name     ChipOptionsCloseOptionsTest_static_002
     * @tc.desc     ChipOptionsCloseOptionsTest_static_002
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsCloseOptionsTest_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsCloseOptionsTest_static_002] START');
      await CommonFunc.sleep(1000);
      let Symbol = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]

      console.info("[ChipOptionsCloseOptionsTest_static_002] component accessibilityText is: " + Symbol.getElement('$attrs').getString('accessibilityText'));
      expect(Symbol.getElement('$attrs').getString('accessibilityText')).assertEqual('删除');
      console.info('[ChipOptionsCloseOptionsTest_static_002] END');
      done();
    });

    /**
     * @tc.number   ChipOptionsCloseOptionsTest_static_003
     * @tc.name     ChipOptionsCloseOptionsTest_static_003
     * @tc.desc     ChipOptionsCloseOptionsTest_static_003
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsCloseOptionsTest_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsCloseOptionsTest_static_003] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]

      console.info("[ChipOptionsCloseOptionsTest_static_003] component accessibilityText is: " + Btn.getElement('$attrs').getString('accessibilityText'));
      expect(Btn.getElement('$attrs').getString('accessibilityText')).assertEqual('accessibilityText1');
      console.info("[ChipOptionsCloseOptionsTest_static_003] component accessibilityDescription is: " + Btn.getElement('$attrs').getString('accessibilityDescription'));
      expect(Btn.getElement('$attrs').getString('accessibilityDescription')).assertEqual('accessibilityDescription1');
      console.info('[ChipOptionsCloseOptionsTest_static_003] END');
      done();
    });
  })
}