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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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
import bundle from '@ohos.bundle.bundleManager';

export default function sheetSize1Jsunit() {
  describe('sheetSize1Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("sheetSize1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/sheetSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sheetSize1Jsunit state pages: " + JSON.stringify(pages));
        if (!("sheetSize" == pages.name)) {
          console.info("get sheetSize1Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push sheetSize1Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sheetSize1Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   sheetSize1Jsunit_0100
     * @tc.number sheetSize1Jsunit_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('sheetSize1Jsunit_0100', Level.LEVEL2, async (done: Function) => {
      // Get the sheetSize of the bindSheet
      await CommonFunc.sleep(1000);
      console.info('[sheetSize1Jsunit_0100] START');
      let strJson = getInspectorByKey('detents');
      await CommonFunc.sleep(1000);
      console.info("[sheetSize1Jsunit_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[sheetSize1Jsunit_0100] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("MEDIUM,LARGE,FIT_CONTENT");
      console.info('[sheetSize1Jsunit_0100] END');
      done();
    });

    /**
     * @tc.name   sheetSize1Jsunit_0200
     * @tc.number sheetSize1Jsunit_0200
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('sheetSize1Jsunit_0200', Level.LEVEL2, async (done: Function) => {
      // Get the sheetSize of the bindSheet
      console.info('[sheetSize1Jsunit_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('bindSheet_SheetSize1'));
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(globalThis.winLeft + vp2px(50)), Math.round(globalThis.winTop + vp2px(50)))
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('bindSheet_dismiss1');
      console.info("[sheetSize1Jsunit_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("dismiss succ");
      console.info('[sheetSize1Jsunit_0200] END');
      done();
    });
  })
}
