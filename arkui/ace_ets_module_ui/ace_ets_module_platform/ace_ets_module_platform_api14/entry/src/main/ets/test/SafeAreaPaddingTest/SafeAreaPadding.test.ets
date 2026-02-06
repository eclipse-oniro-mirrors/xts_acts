/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

 import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SafeAreaPadding1() {
  describe('SafeAreaPadding1', () => {
    beforeEach(async (done: Function) => {
      console.info("SafeAreaPadding1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SafeAreaPadding/SafeAreaPadding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaPadding1 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaPadding1" == pages.name)) {
          console.info("get SafeAreaPadding1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SafeAreaPadding1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SafeAreaPadding1 page error:" + err);
      }
      console.info("SafeAreaPadding1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SafeAreaPadding1 after each called");
    });
/**
     * @tc.number    SafeAreaPadding1_0100
     * @tc.name      SafeAreaPadding1_0100
     * @tc.desc      Test SafeAreaPadding1
     * @tc.level     Level 2
     */
    it('SafeAreaPadding1_0100', Level.LEVEL2, async (done: Function) => {
      console.info('SafeAreaPadding1_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let Button1 = await driver.findComponent(ON.id('SafeArea_button1'));
      await CommonFunc.sleep(500);
      Button1.click();
      await CommonFunc.sleep(1000);
      let SafeAreaPaading001 = CommonFunc.getComponentRect('safeAreaPadding_001');
      console.log("[SafeAreaPadding1_0100] component safeAreaPadding_001 is: " + SafeAreaPaading001);
      console.log("[SafeAreaPadding1_0100] component safeAreaPadding_001 top is: " + SafeAreaPaading001.top);
      let SafeAreaPaading002 = CommonFunc.getComponentRect('safeAreaPadding_002');
      console.log("[SafeAreaPadding1_0100] component safeAreaPadding_002 is: " + SafeAreaPaading002);
      console.log("[SafeAreaPadding1_0100] component safeAreaPadding_002 top is: " + SafeAreaPaading002.top);
      expect(Math.abs(Math.round(SafeAreaPaading001.top - SafeAreaPaading002.top)-Math.round(vp2px(5)))<=1).assertTrue()

      console.info('SafeAreaPadding1_0100 END');
      done();
    });
  })
}