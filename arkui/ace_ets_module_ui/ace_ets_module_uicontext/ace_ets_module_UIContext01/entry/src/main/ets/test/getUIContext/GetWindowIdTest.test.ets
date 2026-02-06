/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { ResolveStrategy } from '@ohos.arkui.UIContext';

export default function GetWindowIdTest() {
  describe('GetWindowIdTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetUIContextTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getUIContext/GetWindowIdTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetWindowIdTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetWindowIdTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push GetWindowIdTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetWindowIdTest page error:" + err);
      }
      console.info("GetWindowIdTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetWindowIdTest after each called");
    });

    /**
     * @tc.name   GetWindowIdTest_0100
     * @tc.number GetWindowIdTest_0100
     * @tc.desc   getUIContext test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetWindowIdTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('GetWindowIdTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('getWindowIdUndefined :' + AppStorage.get('getWindowIdUndefined'));
      console.info('getWindowIdValue :' + AppStorage.get('getWindowIdValue'));
      expect(AppStorage.get('getWindowIdUndefined')).assertEqual(undefined);
      expect(AppStorage.get('getWindowIdValue')).assertEqual(0);
      AppStorage.delete('getWindowIdUndefined');
      AppStorage.delete('getWindowIdValue');
      console.info('[GetWindowIdTest_0100] END');
      done();
    });

  })
}