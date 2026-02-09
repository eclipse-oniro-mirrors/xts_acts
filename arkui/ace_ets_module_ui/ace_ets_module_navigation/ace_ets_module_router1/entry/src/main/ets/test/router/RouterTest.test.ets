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
import CommonFunc from '../../MainAbility/utils/Common';
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

export default function RouterTest() {
  describe('RouterTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RouterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/RouterTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RouterTest state pages:" + JSON.stringify(pages));
        if (!("RouterTest" == pages.name)) {
          console.info("get RouterTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RouterTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RouterTest page error:" + err);
      }
      console.info("RouterTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RouterTest after each called");
    });

    /**
     * @tc.number RouterTest_0100
     * @tc.name RouterTest_0100
     * @tc.desc router back param 1
     * @tc.level Level 1
     */
    it('RouterTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[RouterTest_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.text('testRouter1'));
      await btn1.click();
      console.info('[RouterTest_0100] btn1');
      await CommonFunc.sleep(1000);

      console.info('[RouterTest_0100] btn2');
      let text1 = getInspectorByKey('testId');
      expect(JSON.parse(text1).$attrs.content).assertEqual('test');

      console.info('[RouterTest_0100] END');
      done();
    });

    /**
     * @tc.number RouterTest_0200
     * @tc.name RouterTest_0200
     * @tc.desc router UIContext param -1
     * @tc.level Level 1
     */
    it('RouterTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[RouterTest_0200] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.text('testRouter2'));
      await btn1.click();
      console.info('[RouterTest_0200] btn1');
      await CommonFunc.sleep(1000);

      console.info('[RouterTest_0200] btn2');
      let text1 = getInspectorByKey('testId');
      expect(JSON.parse(text1).$attrs.content).assertEqual('test');

      console.info('[RouterTest_0200] END');
      done();
    });

    /**
     * @tc.number RouterTest_0300
     * @tc.name RouterTest_0300
     * @tc.desc router UIContext param 0
     * @tc.level Level 1
     */
    it('RouterTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[RouterTest_0300] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.text('testRouter3'));
      await btn1.click();
      console.info('[RouterTest_0300] btn1');
      await CommonFunc.sleep(1000);

      console.info('[RouterTest_0300] btn2');
      let text1 = getInspectorByKey('testId');
      expect(JSON.parse(text1).$attrs.content).assertEqual('test');

      console.info('[RouterTest_0300] END');
      done();
    });

    /**
     * @tc.number RouterTest_0400
     * @tc.name RouterTest_0400
     * @tc.desc router UIContext param 1
     * @tc.level Level 1
     */
    it('RouterTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[RouterTest_0400] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.text('testRouter4'));
      await btn1.click();
      console.info('[RouterTest_0400] btn1');
      await CommonFunc.sleep(1000);

      console.info('[RouterTest_0400] btn2');
      let text1 = getInspectorByKey('testId');
      expect(JSON.parse(text1).$attrs.content).assertEqual('test');

      console.info('[RouterTest_0400] END');
      done();
    });
  })
}
