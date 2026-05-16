/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest() {
  describe('commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/onVisibleAreaApproximateChangeNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest state success " +
        JSON.stringify(pages));
        if (!("onVisibleAreaApproximateChangeNullAndUndefined" == pages.name)) {
          console.info("get commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest state success " +
          JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest page success " +
          JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodOnVisibleAreaApproximateChangeNullV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_ONVISIBLEAREAAPPROXIMATECHANGE_PARAM_001
     * @tc.desc   Test CommonMethod onVisibleAreaApproximateChange with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodOnVisibleAreaApproximateChangeNullV1001', Level.LEVEL0, async (done: Function) => {
      console.info('commonMethodOnVisibleAreaApproximateChangeNullV1001 START');
      let driver = await Driver.create();
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(200);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('test');
      strJson = getInspectorByKey('onVisibleAreaApproximateChange_row_id');
      await CommonFunc.sleep(200);
      obj = JSON.parse(strJson);
      await CommonFunc.sleep(200);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('test');
      await CommonFunc.sleep(200);
      await scrollBar.scrollToTop();
      await CommonFunc.sleep(3000);
      strJson = getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      await CommonFunc.sleep(200);
      obj = JSON.parse(strJson);
      await CommonFunc.sleep(200);
      console.info('onVisibleAreaApproximateChange_column_id2 content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('test');
      strJson = getInspectorByKey('onVisibleAreaApproximateChange_row_id');
      await CommonFunc.sleep(200);
      obj = JSON.parse(strJson);
      await CommonFunc.sleep(200);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('test');
      console.info('[commonMethodOnVisibleAreaApproximateChangeNullV1001] END');
      done();
    });
  })
}
