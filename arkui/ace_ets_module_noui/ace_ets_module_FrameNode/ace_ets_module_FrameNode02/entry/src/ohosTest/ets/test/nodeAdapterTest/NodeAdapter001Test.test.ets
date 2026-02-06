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
export default function NodeAdapter001Test() {
  describe('NodeAdapter001Test', () => {
    beforeEach(async (done: Function) => {
      console.info("NodeAdapter001Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/nodeAdapter/NodeAdapter001",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NodeAdapter001Test state pages: " + JSON.stringify(pages));
        if (!("NodeAdapter001" == pages.name)) {
          console.info("get NodeAdapter001Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NodeAdapter001Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NodeAdapter001Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   NodeAdapter001Test_0100
     * @tc.number NodeAdapter001Test_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NodeAdapter001Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('NodeAdapter001Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('NodeAdapter001_btn01'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let text_1 = await (await driver.findComponent(ON.id('text_0'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapter001Test_0100] component text_1: ' + text_1);
      expect(text_1).assertEqual('Adapter ListItem 0 r:0')
      console.info('[NodeAdapter001Test_0100] END');
      done();
    });

    /**
     * @tc.name   NodeAdapter001Test_0200
     * @tc.number NodeAdapter001Test_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NodeAdapter001Test_0200', Level.LEVEL0, async (done: Function) => {
      console.info('NodeAdapter001Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('NodeAdapter001_btn02'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let text_2 = await (await driver.findComponent(ON.id('text_0'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapter001Test_0200] component text_2: ' + text_2);
      expect(text_2).assertEqual('Adapter ListItem 0 r:0')
      console.info('[NodeAdapter001Test_0200] END');
      done();
    });

    /**
     * @tc.name   NodeAdapter001Test_0300
     * @tc.number NodeAdapter001Test_0300
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NodeAdapter001Test_0300', Level.LEVEL0, async (done: Function) => {
      console.info('NodeAdapter001Test_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('NodeAdapter001_btn03'));
      await button3.click();
      await CommonFunc.sleep(2000);
      let text_3 = await (await driver.findComponent(ON.id('text_1'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapter001Test_0300] component text_3: ' + text_3);
      expect(text_3).assertEqual('Adapter ListItem 1 r:0')
      console.info('[NodeAdapter001Test_0300] END');
      done();
    });

    /**
     * @tc.name   NodeAdapter001Test_0400
     * @tc.number NodeAdapter001Test_0400
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NodeAdapter001Test_0400', Level.LEVEL0, async (done: Function) => {
      console.info('NodeAdapter001Test_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('NodeAdapter001_btn04'));
      await button4.click();
      await CommonFunc.sleep(2000);
      let text_4 = await (await driver.findComponent(ON.id('text_0'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapter001Test_0400] component text_4: ' + text_4);
      expect(text_4).assertEqual('Adapter ListItem 0 r:0')
      console.info('[NodeAdapter001Test_0400] END');
      done();
    });

  })
}