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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function currentScroll() {
  describe('currentScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("currentScroll beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scrollCallback/currentScroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get currentScroll state pages:" + JSON.stringify(pages));
        if (!("currentScroll" == pages.name)) {
          console.info("get currentScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push currentScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push currentScroll page error:" + err);
      }
      console.info("currentScroll beforeEach end");
      done();
    });
    /**
     * @tc.name   currentScroll_0100
     * @tc.number currentScroll_0100
     * @tc.desc   Get the current total scroll offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('currentScroll_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[currentScroll_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('offset_un_print'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('offset_un_text');
      console.info("[currentScroll_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[currentScroll_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("Current offset - X: 0, Y: 0");
      console.info('[currentScroll_0100] END');
      done();
    });

    /**
     * @tc.name   currentScroll_0200
     * @tc.number currentScroll_0200
     * @tc.desc   The offset interface returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('currentScroll_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[currentScroll_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('offset_un_show'));
      await button1.click();
      await CommonFunc.sleep(1500);
      let button2 = await driver.findComponent(ON.id('offset_un_print'));
      await button2.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('offset_un_text');
      console.info("[currentScroll_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[currentScroll_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("undefined");
      console.info('[currentScroll_0200] END');
      done();
    });
  })
}