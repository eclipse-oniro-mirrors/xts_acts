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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function valueAlphabet() {
  describe('valueAlphabet', () => {
    beforeEach(async (done: Function) => {
      console.info("valueAlphabet beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/valueAlphabet",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get valueAlphabet state pages:" + JSON.stringify(pages));
        if (!("valueAlphabet" == pages.name)) {
          console.info("get valueAlphabet pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push valueAlphabet page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push valueAlphabet page error:" + err);
      }
      console.info("valueAlphabet beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("valueAlphabet after each called");
    });

    /**
     * @tc.name   valueAlphabet_0100
     * @tc.number valueAlphabet_001
     * @tc.desc   Set the outlier of the AlphabetIndexer for selected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('valueAlphabet_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[valueAlphabet_0100] START');
      let strJson = getInspectorByKey('alp_outliers_value');
      console.info("[valueAlphabet_0100] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[valueAlphabet_0100] selected: " + JSON.stringify(JSON.parse(strJson).$attrs.selected));
      expect(JSON.parse(strJson).$attrs.selected).assertEqual('0');
      console.info('[valueAlphabet_0100] END');
      done();
    });

    /**
     * @tc.name   valueAlphabet_0200
     * @tc.number valueAlphabet_002
     * @tc.desc   Set the outlier of the AlphabetIndexer for itemBorderRadius.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('valueAlphabet_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[valueAlphabet_0200] START');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('B'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('alp_outliers_value');
      console.info("[valueAlphabet_0200] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[valueAlphabet_0200] itemBorderRadius: " + JSON.stringify(JSON.parse(strJson).$attrs.itemBorderRadius));
      expect(JSON.parse(strJson).$attrs.itemBorderRadius).assertEqual('0.00vp');
      console.info('[valueAlphabet_0200] END');
      done();
    });

    /**
     * @tc.name   valueAlphabet_0300
     * @tc.number valueAlphabet_001
     * @tc.desc   When selecting the second option, the return values of index and value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('valueAlphabet_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[valueAlphabet_0300] START');
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('A'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('alp_value_index');
      console.info("[valueAlphabet_0300] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[valueAlphabet_0300] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('index: 1, A');
      console.info('[valueAlphabet_0300] END');
      done();
    });
  })
}
