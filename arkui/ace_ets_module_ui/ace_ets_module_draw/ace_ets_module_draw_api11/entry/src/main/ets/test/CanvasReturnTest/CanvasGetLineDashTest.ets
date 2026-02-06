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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
 
export default function CanvasGetLineDashTest() {
  describe('CanvasGetLineDashTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CanvasGetLineDashTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasReturn/CanvasGetLineDash",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasGetLineDash state pages:" + JSON.stringify(pages));
        if (!("CanvasGetLineDash" == pages.name)) {
          console.info("get CanvasGetLineDash pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CanvasGetLineDash page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasGetLineDash page error:" + err);
      }
      console.info("CanvasGetLineDash beforeEach end");
      done();
    });
 
    it('CanvasGetLineDashTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[CanvasGetLineDashTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('getLineDashTypeNotNull'));
      await btn.click();
      await CommonFunc.sleep(1000);
      console.info("[CanvasGetLineDashTest_0100] getLineDashTypeNotNull: " + AppStorage.get('getLineDashTypeNotNull'));
      expect(AppStorage.get('getLineDashTypeNotNull')).assertDeepEquals([10,20]);
      AppStorage.delete('getLineDashTypeNotNull')
      console.info('[CanvasGetLineDashTest_0100] END');
      done();
    });

    it('CanvasGetLineDashTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[CanvasGetLineDashTest_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('getLineDashTypeNull'));
      await btn.click();
      await CommonFunc.sleep(1000);
      console.info("[CanvasGetLineDashTest_0200] getLineDashTypeNull: " + AppStorage.get('getLineDashTypeNull'));
      expect(AppStorage.get('getLineDashTypeNull')).assertDeepEquals([]);
      AppStorage.delete('getLineDashTypeNull')
      console.info('[CanvasGetLineDashTest_0200] END');
      done();
    });
 
  })
}