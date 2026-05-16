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

export default function RefreshRefreshOffsetTest() {
  describe('RefreshRefreshOffsetTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RefreshRefreshOffsetTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Refresh/RefreshRefreshOffset",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RefreshRefreshOffsetTest state pages:" + JSON.stringify(pages));
        if (!("RefreshRefreshOffset" == pages.name)) {
          console.info("get RefreshRefreshOffsetTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RefreshRefreshOffsetTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RefreshRefreshOffsetTest page error:" + err);
      }
      console.info("RefreshRefreshOffsetTest beforeEach end");
      done();
    });
/**
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0100
     * @tc.name   SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0100
     * @tc.desc   Set the value return 50.00vp.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0100', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('changeRefreshOffsetValue0'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('refresh_Offset1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0100] component obj is: " + JSON.stringify(obj));
      console.info("[SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0100 ] refreshOffset: " + JSON.stringify(obj.$attrs.refreshOffset));
      expect(obj.$attrs.refreshOffset).assertEqual('50.00vp');
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0200
     * @tc.name   SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0200
     * @tc.desc   Set the value return 0.00vp.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0200', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('changeRefreshOffsetValue1'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('refresh_Offset1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0200 ] refreshOffset: " + JSON.stringify(obj.$attrs.refreshOffset));
      expect(obj.$attrs.refreshOffset).assertEqual('0.00vp');
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_TEST_0200] END');
      done();
    });

  })
}
