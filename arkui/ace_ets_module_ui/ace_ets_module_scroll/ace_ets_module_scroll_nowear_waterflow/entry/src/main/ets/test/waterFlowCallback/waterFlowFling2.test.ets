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
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function waterFlowFling2() {
  describe('waterFlowFling2', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowFling2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/waterFlowCallback/waterFlowFling2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowFling2 state pages:" + JSON.stringify(pages));
        if (!("waterFlowFling2" == pages.name)) {
          console.info("get waterFlowFling2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowFling2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowFling2 page error:" + err);
      }
      console.info("waterFlowFling2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowFling2 after each called");
    });

    /**
     * @tc.name   waterFlowFling2_0100
     * @tc.number waterFlowFling2_001
     * @tc.desc   When fling is 2000, the event callback timing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('waterFlowFling2_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[waterFlowFling2_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('fling_scroll_2'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('water_fling_2');
      console.info("[waterFlowFling2_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[waterFlowFling2_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content)
        .assertEqual('fling: onScrollIndex-onReachStart-onScrollStart-onScrollFrameBegin-onScrollStop');
      console.info('[waterFlowFling2_0100] END');
      done();
    });
  })
}
