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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { Component, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function onVisibleTest() {

  describe('onVisibleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onVisiable/onVisibleAreaApproximateChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onVisibleTest state pages: " + JSON.stringify(pages));
        if (!("onVisibleTest" == pages.name)) {
          console.info("get onVisibleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onVisibleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onVisibleTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onVisibleTest after each called");
    });

    /**
     * @tc.name   onVisibleTest_0010
     * @tc.number onVisibleTest_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onVisibleTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('onVisibleTest_0010 START');
      let driver = await Driver.create();
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(200);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Test Text is completely invisible');
      await CommonFunc.sleep(200);

      await scrollBar.scrollToTop();
      await CommonFunc.sleep(3000);
      strJson = getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      await CommonFunc.sleep(200);
      obj = JSON.parse(strJson);
      await CommonFunc.sleep(200);
      console.info('onVisibleAreaApproximateChange_column_id2 content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Test Text is fully visible');
      console.info('[onVisibleTest_0010] END');
      done();
    });
  })
}