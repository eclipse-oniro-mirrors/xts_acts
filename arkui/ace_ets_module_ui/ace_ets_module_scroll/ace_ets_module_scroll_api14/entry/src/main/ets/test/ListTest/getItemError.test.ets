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
import events_emitter from '@ohos.events.emitter';

export default function getItemError() {
  describe('getItemError', () => {
    beforeEach(async (done: Function) => {
      console.info("getItemError beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/getItemError",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getItemError state pages:" + JSON.stringify(pages));
        if (!("getItemError" == pages.name)) {
          console.info("get getItemError pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getItemError page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getItemError page error:" + err);
      }
      console.info("getItemError beforeEach end");
      done();
    });

    /**
     * @tc.name   getItemError_0100
     * @tc.number getItemError_001
     * @tc.desc   401 error code for getItemRect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getItemError_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[getItemError_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('getItemRect_401'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('getItemRect_err_text');
      console.info("[getItemError_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getItemError_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('getItemRect: 401');
      console.info('[getItemError_0100] END');
      done();
    });

    /**
     * @tc.name   getItemError_0200
     * @tc.number getItemError_002
     * @tc.desc   100004 error code for getItemRect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getItemError_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[getItemError_0200] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('getItemRect_100004'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('getItemRect_err_text');
      console.info("[getItemError_0200] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getItemError_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('getItemRect: 100004');
      console.info('[getItemError_0200] END');
      done();
    });

    /**
     * @tc.name   getItemError_0300
     * @tc.number getItemError_003
     * @tc.desc   401 error code for getItemIndex.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getItemError_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[getItemError_0300] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('getItemIndex_401'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('getItemIndex_err_text');
      console.info("[getItemError_0300] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getItemError_0300] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('getItemIndex: 401');
      console.info('[getItemError_0300] END');
      done();
    });

    /**
     * @tc.name   getItemError_0400
     * @tc.number getItemError_004
     * @tc.desc   100004 error code for getItemIndex.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getItemError_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[getItemError_0400] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('getItemIndex_100004'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('getItemIndex_err_text');
      console.info("[getItemError_0400] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getItemError_0400] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('getItemIndex: 100004');
      console.info('[getItemError_0400] END');
      done();
    });
  })
}
