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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
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


export default function arrowOffset() {
  describe('arrowOffset', () => {
    beforeEach(async (done: Function) => {
      console.info("arrowOffset beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/arrowOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get arrowOffset state pages: " + JSON.stringify(pages));
        if (!("arrowOffset" == pages.name)) {
          console.info("get arrowOffset state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push arrowOffset success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push arrowOffset page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("arrowOffset after each called");
    });

    /**
     * @tc.name   arrowOffset_0100
     * @tc.number SUB_ACE_arrowOffset_0100
     * @tc.desc   To test the arrowOffset: 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('arrowOffset_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('arrowOffset_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('CustomPopup'));
      await button.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('customText'));
      expect(text != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('arrowOffset_0100 END');
      done();
    });

    /**
     * @tc.name   arrowOffset_0200
     * @tc.number SUB_ACE_arrowOffset_0200
     * @tc.desc   To test the arrowOffset: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('arrowOffset_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('arrowOffset_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('CustomPopup1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('customText'));
      expect(text != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('arrowOffset_0200 END');
      done();
    });
  })
}