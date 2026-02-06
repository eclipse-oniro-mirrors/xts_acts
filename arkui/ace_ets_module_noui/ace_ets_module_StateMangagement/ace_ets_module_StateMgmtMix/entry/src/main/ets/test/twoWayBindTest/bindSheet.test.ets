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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
 
export default function bindSheetTest() {
  describe('bindSheetTest', () => {
    beforeEach(async (done: Function) => {
      console.info("bindSheetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/twoWayBind/bindSheet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindSheetTest state pages: " + JSON.stringify(pages));
        if (!("bindSheet" == pages.name)) {
          console.info("get bindSheetTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push bindSheetTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindSheetTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   bindSheetTest_0100
     * @tc.number bindSheetTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindSheetTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('bindSheetTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('bindSheetButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('bindSheetText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[bindSheetTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow: true');

      console.info('[bindSheetTest_0100] END');
      done();
    });
    /**
     * @tc.name   bindSheetTest_0200
     * @tc.number bindSheetTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindSheetTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('bindSheetTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('bindSheetButton1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('bindSheetText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[bindSheetTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow: false');

      console.info('[bindSheetTest_0200] END');
      done();
    });
  })
}

