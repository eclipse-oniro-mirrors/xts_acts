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
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function WordBreakTest() {
  describe('WordBreakTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WordBreakTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/WordBreakTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WordBreakTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("WordBreakTest" == pages.name)) {
          console.info("get WordBreakTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push WordBreakTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WordBreakTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WordBreakTest after each called");
    });

    /**
     * @tc.name   WordBreakTest0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   WordBreakTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WordBreakTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('WordBreakTest0001 START');
      let strJson = getInspectorByKey('wordBreakTest');
      let obj: ESObject = JSON.parse(strJson);
      console.log('wordBreakTest-----' + obj.$attrs.wordBreak);
      expect(obj.$attrs.wordBreak).assertEqual('normal');
      console.info("[WordBreakTest0001] end");
      done();
    });

    /**
     * @tc.name   WordBreakTest0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   WordBreakTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WordBreakTest0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('WordBreakTest0002 START');
      await CommonFunc.sleep(1000);
      let setWordBreak = await driver.findComponent(ON.id('setWordBreak1'))
      await CommonFunc.sleep(500);
      await setWordBreak.click()
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('wordBreakTest');
      let obj: ESObject = JSON.parse(strJson);
      console.log('wordBreakTest-----' + obj.$attrs.wordBreak);
      expect(obj.$attrs.wordBreak).assertEqual('break-all');
      console.info("[WordBreakTest0002] end");
      done();
    });

    /**
     * @tc.name   WordBreakTest0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   WordBreakTest0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WordBreakTest0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' WordBreakTest0003 START');
      await CommonFunc.sleep(1000);
      let setWordBreak = await driver.findComponent(ON.id('setWordBreak2'))
      await CommonFunc.sleep(500);
      await setWordBreak.click()
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('wordBreakTest');
      let obj: ESObject = JSON.parse(strJson);
      console.log('wordBreakTest-----' + obj.$attrs.wordBreak);
      expect(obj.$attrs.wordBreak).assertEqual('break-word');
      console.info("[WordBreakTest0003] end");
      done();
    });

    /**
     * @tc.name   WordBreakTest0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   WordBreakTest0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WordBreakTest0004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' WordBreakTest0004 START');
      await CommonFunc.sleep(1000);
      let setWordBreak = await driver.findComponent(ON.id('setWordBreak3'))
      await CommonFunc.sleep(500);
      await setWordBreak.click()
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('wordBreakTest');
      let obj: ESObject = JSON.parse(strJson);
      console.log('wordBreakTest-----' + obj.$attrs.wordBreak);
      expect(obj.$attrs.wordBreak).assertEqual('hyphenation');
      console.info("[WordBreakTest0004] end");
      done();
    });
  })
}