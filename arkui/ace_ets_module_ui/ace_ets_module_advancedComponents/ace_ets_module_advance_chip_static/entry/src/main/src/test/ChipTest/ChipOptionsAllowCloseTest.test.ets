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

export default function ChipOptionsAllowCloseTest() {
  describe('ChipOptionsAllowCloseTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipOptionsAllowCloseTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipOptionsAllowCloseTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Chip/ChipOptionsAllowCloseTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipOptionsAllowCloseTest state pages:" + JSON.stringify(pages));
        if (!("ChipOptionsAllowCloseTest" == pages.name)) {
          console.info("get ChipOptionsAllowCloseTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ChipTest0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipOptionsAllowCloseTest page error:" + err);
      }
      console.info("ChipOptionsAllowCloseTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipOptionsAllowCloseTest after each called");
    });




    /**
     * @tc.number   ChipOptionsAllowCloseTest_static_001
     * @tc.name     ChipOptionsAllowCloseTest_static_001
     * @tc.desc     ChipOptionsAllowCloseTest_static_001
     * @tc.level    Level.LEVEL2
     */
    it('ChipOptionsAllowCloseTest_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ChipOptionsAllowCloseTest_static_001] START');
      await CommonFunc.sleep(1000);
      const driver = Driver.create();
      const chipList = await driver.findComponents(ON.type('SymbolGlyph').within(ON.id('ChipOptionsAllowCloseExample')));
      console.info('[ChipOptionsAllowCloseTest_static_001] length '+chipList?.length);
      expect(chipList?.length).assertEqual(2);
      console.info('[ChipOptionsAllowCloseTest_static_001] END');
      done();
    });
  })
}