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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
 
export default function LayoutChildrenTest() {
  describe('LayoutChildrenTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LayoutChildrenTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LayoutChildren",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LayoutChildrenTest state pages: " + JSON.stringify(pages));
        if (!("frameNode" == pages.name)) {
          console.info("get LayoutChildrenTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LayoutChildrenTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LayoutChildrenTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
 
    /**
     * @tc.name   LayoutChildrenTest_0100
     * @tc.number LayoutChildrenTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutChildrenTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('LayoutChildrenTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('Button1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('Button3'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('layoutChildrenState')).assertEqual('onLayoutChildrenByID');
      AppStorage.delete('layoutChildrenState')
      let btn2 = await driver.findComponent(ON.id('Button2'));
      await btn2.click();
      let btn3 = await driver.findComponent(ON.id('Button3'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('layoutChildrenState')).assertEqual('offLayoutChildrenByID');
      AppStorage.delete('layoutChildrenState')
      console.info('[LayoutChildrenTest_0100] END');
      done();
    });

    /**
     * @tc.name   LayoutChildrenTest_0200
     * @tc.number LayoutChildrenTest_0200
     * @tc.desc   api23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutChildrenTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('LayoutChildrenTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('Button1'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1 = await driver.findComponent(ON.id('Button3'));
      await btn1.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('layoutChildrenState')).assertEqual('onLayoutChildrenByID');
      AppStorage.delete('layoutChildrenState')
      let btn2 = await driver.findComponent(ON.id('Button4'));
      await btn2.click();
      let btn3 = await driver.findComponent(ON.id('Button3'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('layoutChildrenState')).assertEqual('offLayoutChildrencomplete');
      AppStorage.delete('layoutChildrenState')
      console.info('[LayoutChildrenTest_0200] END');
      done();
    });
  })
}