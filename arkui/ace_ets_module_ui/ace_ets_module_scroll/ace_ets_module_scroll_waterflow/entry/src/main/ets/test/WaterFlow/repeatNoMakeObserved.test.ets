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

export default function repeatNoMakeObserved() {
  describe('repeatNoMakeObserved', () => {
    beforeEach(async (done: Function) => {
      console.info("repeatNoMakeObserved beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/repeatNoMakeObserved",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get repeatNoMakeObserved state pages:" + JSON.stringify(pages));
        if (!("repeatNoMakeObserved" == pages.name)) {
          console.info("get repeatNoMakeObserved pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push repeatNoMakeObserved page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatNoMakeObserved page error:" + err);
      }
      console.info("repeatNoMakeObserved beforeEach end");
      done();
    });

    /**
     * @tc.name   repeatNoMakeObserved_0100
     * @tc.number repeatNoMakeObserved_001
     * @tc.desc   Testing the WaterFlowSections without MakeObserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('repeatNoMakeObserved_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[repeatNoMakeObserved_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('no_observed_update'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('no_observed_mess');
      console.info("[repeatNoMakeObserved_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('update: true');

      let btn2: Component = await driver.findComponent(ON.id('no_observed_splice'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      let strJson2 = getInspectorByKey('no_observed_mess');
      console.info("[repeatNoMakeObserved_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('splice: true');

      let btn3: Component = await driver.findComponent(ON.id('no_observed_new'));
      await btn3.click();
      await CommonFunc.sleep(1500);
      let strJson3 = getInspectorByKey('no_observed_mess');
      console.info("[repeatNoMakeObserved_0100] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('new: true');
      console.info('[repeatNoMakeObserved_0100] END');
      done();
    });
  })
}
