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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function gridIndexTest() {
  describe('gridIndexTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("gridIndexTest beforeEach start");
      const routerAlp = AppStorage.get<Router>("router") as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get gridIndexTest  state pages:" + JSON.stringify(pages));
        if (!("gridte" == pages.name)) {
          console.info("get gridIndexTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl({url:"MainAbility/pages/grid/gridte"})
          routerAlp.pushUrl({ url: "MainAbility/pages/grid/gridte" })
          await CommonFunc.sleep(2000);
          // console.info("push gridIndexTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridIndexTest page error:" + err);
      }
      console.info("gridIndexTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gridIndexTest after each called");
    });


    
    /**
     * @tc.number   gridIndexTest_static_0100
     * @tc.name     gridIndexTest_static_0100
     * @tc.desc     gridIndexTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('gridIndexTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[gridIndexTest_static_0100] START');
      await CommonFunc.sleep(2000);
      let btRight = CommonFunc.getComponentRect('index2');
      let right = btRight.right
      let btLeft = CommonFunc.getComponentRect('index2');
      let left = btLeft.left
      let width2 = Math.round(right - left)

      let btRight1 = CommonFunc.getComponentRect('index3');
      let right1 = btRight1.right
      let btLeft1 = CommonFunc.getComponentRect('index3');
      let left1 = btLeft1.left
      let width3 = Math.round(right1 - left1)
      expect(width2 + "").assertEqual(width3 + "")
      console.info('[gridIndexTest_static_0100] END');
      done();
    });

  })
}
