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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
const TAG = '[ReuseOptionsDynamicReuseIdTest]';
const DOMAIN = 0xF811;


export default function ReuseOptionsDynamicReuseIdTest() {
  describe('ReuseOptionsDynamicReuseIdTest', () => {

    beforeEach(async (done: Function) => {
      console.info("ReuseOptionsDynamicReuseIdTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ReuseV2/ReuseOptionsDynamicReuseIdTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ReuseOptionsDynamicReuseIdTest" == pages.name)) {
          console.info("get ReuseOptionsDynamicReuseIdTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ReuseOptionsDynamicReuseIdTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReuseOptionsDynamicReuseIdTest page error:" + err);
      }
      console.info("ReuseOptionsDynamicReuseIdTest beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'afterEach start');
    })

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'afterAll start');
    })

    /**
     * @tc.name   ReuseOptionsDynamicReuseIdTest001
     * @tc.number SUB_ARUI_REUSE_OPTIONS_DYNAMIC_REUSE_ID_0100
     * @tc.desc   Test dynamic reuseId callback with same reuseId value triggers component reuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ReuseOptionsDynamicReuseIdTest001', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'ReuseOptionsDynamicReuseIdTest001 start');
      
      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let buttonChangeToGroupA = await driver.findComponent(ON.id('button_toggle_1'));
      await buttonChangeToGroupA.click();
      await CommonFunc.sleep(500);

      let buttonChangeToGroupA2 = await driver.findComponent(ON.id('button_toggle_2'));
      await buttonChangeToGroupA2.click();
      await CommonFunc.sleep(500);

      let textComponent1 = await driver.findComponent(ON.id('text_Component3_3'));
      let text1 = await textComponent1.getText();
      expect(text1).assertEqual('true');

      let textComponent2 = await driver.findComponent(ON.id('text_Component2_2'));
      let text2 = await textComponent2.getText();
      expect(text2).assertEqual('false');

      hilog.info(DOMAIN, TAG, 'ReuseOptionsDynamicReuseIdTest001 end');
    })

  })
}
