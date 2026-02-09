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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function UIFontAliasInfo() {
  describe('UIFontAliasInfo', () => {
    beforeAll(() => {
      console.info("UIFontAliasInfo beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("UIFontAliasInfo beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/font/UIFontAliasInfo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get UIFontAliasInfo state pages:" + JSON.stringify(pages));
        if (!("UIFontAliasInfo" == pages.name)) {
          console.info("get UIFontAliasInfo pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push UIFontAliasInfo page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIFontAliasInfo page error:" + err);
      }
      console.info("UIFontAliasInfo beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIFontAliasInfo after each called");
    });

    

    /**
     * @tc.number   UIFontAliasInfo_static_001
     * @tc.name     UIFontAliasInfo_static_001
     * @tc.desc     UIFontAliasInfo_static_001
     * @tc.level    Level.LEVEL1
     */
    it('UIFontAliasInfo_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[UIFontAliasInfo_static_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get<string>('UIFontName')).assertContain("HarmonyOS-Sans");
      expect('' + AppStorage.get<string>('UIFontWeight')).assertContain("0");
      expect('' + AppStorage.get<string>('UIFontTo')).assertContain("100");
      AppStorage.delete('UIFontName');
      AppStorage.delete('UIFontWeight');
      AppStorage.delete('UIFontTo');
      console.info('[UIFontAliasInfo_static_001] END');
      done();
    });
  })
}