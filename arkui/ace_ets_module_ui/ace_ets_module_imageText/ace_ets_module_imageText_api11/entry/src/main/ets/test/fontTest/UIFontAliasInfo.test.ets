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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function UIFontAliasInfo() {
  describe('UIFontAliasInfo', () => {
    beforeEach(async (done: Function) => {
      console.info("UIFontAliasInfo beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIFontAliasInfo state pages:" + JSON.stringify(pages));
        if (!("UIFontAliasInfo" == pages.name)) {
          console.info("get  UIFontAliasInfo pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/font/UIFontAliasInfo"})
          await CommonFunc.sleep(2000);
          console.info("push UIFontAliasInfo page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIFontAliasInfo page error:" + err);
      }
      console.info("UIFontAliasInfo foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIFontAliasInfo after each called");
    });


    /**
     * @tc.name   UIFontAliasInfo_001
     * @tc.number UIFontAliasInfo_001
     * @tc.desc   UIFontAliasInfo_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UIFontAliasInfo_001', Level.LEVEL1, async (done: Function) => {
      console.info('[UIFontAliasInfo_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('UIFontName')).assertContain("HarmonyOS-Sans");
      expect('' + AppStorage.get('UIFontWeight')).assertContain("0");
      expect('' + AppStorage.get('UIFontTo')).assertContain("100");
      AppStorage.delete('UIFontName');
      AppStorage.delete('UIFontWeight');
      AppStorage.delete('UIFontTo');
      console.info('[UIFontAliasInfo_001] END');
      done();
    });
  })
}