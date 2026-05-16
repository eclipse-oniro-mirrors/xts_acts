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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'


export default function GetWindowIdTest() {
  describe('GetWindowIdTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("themePageToggleTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.uicontext.static'", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("themePageToggleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/window/GetWindowIdTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get themePageToggleTest state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/window/GetWindowIdTest" == pages.name)) {
          console.info("get themePageToggleTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push themePageToggleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetWindowIdTest page error:" + err);
      }
      console.info("GetWindowIdTest beforeEach end");
    });

    /**
     * @tc.number   SUB_ARKUI_GetWindowIdTest_static_1000
     * @tc.name     SUB_ARKUI_GetWindowIdTest_static_1000
     * @tc.desc     SUB_ARKUI_GetWindowIdTest_static_1000
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_GetWindowIdTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SUB_ARKUI_GetWindowIdTest_static_1000 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      expect(AppStorage.get<Int|undefined>('getWindowIdValue1')).assertEqual(0);
      expect(AppStorage.get<Int|undefined>('getWindowIdValue2')).assertEqual(undefined);
      AppStorage.delete('getWindowIdValue1');
      AppStorage.delete('getWindowIdValue2');
      console.info('[SUB_ARKUI_GetWindowIdTest_static_1000] END');
      done();
    });
  })
}