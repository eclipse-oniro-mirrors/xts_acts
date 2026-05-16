/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
const SLEEP_TIME = 1000;

export default function RefreshMaxPullDownDistanceTest() {
  describe('RefreshMaxPullDownDistanceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RefreshMaxPullDownDistanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Refresh/RefreshMaxPullDownDistance",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RefreshMaxPullDownDistanceTest state pages:" + JSON.stringify(pages));
        if (!("RefreshMaxPullDownDistance" == pages.name)) {
          console.info("get RefreshMaxPullDownDistanceTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RefreshMaxPullDownDistanceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RefreshMaxPullDownDistanceTest page error:" + err);
      }
      console.info("RefreshMaxPullDownDistanceTest beforeEach end");
      done();
    });
    /**
     * @tc.number SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0100
     * @tc.name   SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0100
     * @tc.desc   Set the value return 200.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0100', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('changeMaxPullDownDistance1'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('maxPullDownDistance1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0100] component obj is: " + JSON.stringify(obj));
      console.info("[SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0100] maxPullDownDistance: " + JSON.stringify(obj.$attrs.maxPullDownDistance));
      expect(obj.$attrs.maxPullDownDistance).assertEqual(200);
      console.info('[SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0200
     * @tc.name   SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0200
     * @tc.desc   Set the value return -200.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0200', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('changeMaxPullDownDistance2'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('maxPullDownDistance1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0200] component obj is: " + JSON.stringify(obj));
      console.info("[SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0200] maxPullDownDistance: " + JSON.stringify(obj.$attrs.maxPullDownDistance));
      expect(obj.$attrs.maxPullDownDistance).assertEqual(-200);
      console.info('[SUB_ARKUI_REFRESH_MAXPULLDOWNDISTANCE_TEST_0200] END');
      done();
    });

  })
}
