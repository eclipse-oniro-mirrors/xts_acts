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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function LazyForEachCustomComponentFreezeModeTest() {
  describe('LazyForEachCustomComponentFreezeModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyForEachCustomComponentFreezeModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/LazyForEachCustomComponentFreezeMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyForEachCustomComponentFreezeMode state pages: " + JSON.stringify(pages));
        if (!("LazyForEachCustomComponentFreezeMode" == pages.name)) {
          console.info("get LazyForEachCustomComponentFreezeMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyForEachCustomComponentFreezeMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachCustomComponentFreezeMode page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   LazyForEachCustomComponentFreezeModeTest_0100
     * @tc.number SUB_ARKUI_API_LazyForEachCustomComponentFreezeModeTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LazyForEachCustomComponentFreezeModeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[LazyForEachCustomComponentFreezeModeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('LazyForEachCustomComponentFreezeModeMessageButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('LazyForEachCustomComponentFreezeModeMessageText');

      let button2 = await driver.findComponent(ON.id('LazyForEachCustomComponentFreezeModeUndefinedButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('LazyForEachCustomComponentFreezeModeMessageText');

      let button3 = await driver.findComponent(ON.id('LazyForEachCustomComponentFreezeModeAutoButton'));
      await button3.click();
      await CommonFunc.sleep(2000);
      let strJson3 = getInspectorByKey('LazyForEachCustomComponentFreezeModeMessageText');

      let button4 = await driver.findComponent(ON.id('LazyForEachCustomComponentFreezeModeDisabledButton'));
      await button4.click();
      await CommonFunc.sleep(2000);
      let strJson4 = getInspectorByKey('LazyForEachCustomComponentFreezeModeMessageText');

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('1');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('undefined');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('0');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('1');
      expect(LazyForEachCustomComponentFreezeMode.AUTO).assertEqual(0);
      expect(LazyForEachCustomComponentFreezeMode.DISABLED).assertEqual(1);
      expect(LazyForEachCustomComponentFreezeMode.ENABLED).assertEqual(2);
      
      console.info('[LazyForEachCustomComponentFreezeModeTest_0100] END');
      done();
    });
  })
}

