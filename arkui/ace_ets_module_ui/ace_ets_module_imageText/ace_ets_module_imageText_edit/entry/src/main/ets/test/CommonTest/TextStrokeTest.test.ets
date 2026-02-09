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

export default function TextStrokeTest() {
  describe('TextStrokeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStrokeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/common/TextStrokeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStrokeTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextStrokeTest" == pages.name)) {
          console.info("get TextStrokeTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextStrokeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStrokeTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStrokeTest after each called");
    });

    /**
     * @tc.name   TextStrokeTest0001
     * @tc.number SUB_ACE_BASIC_ETS_STROKE_API_0001
     * @tc.desc   set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextStrokeTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextStrokeTest0001 START');
      let getStroke = await driver.findComponent(ON.id('getStroke'))
      await CommonFunc.sleep(500);
      await getStroke.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('TextInputStrokeWidth')).assertEqual('0.00px');
      expect(''+AppStorage.get('TextInputStrokeColor')).assertEqual('#FFFFC0CB');
      expect(''+AppStorage.get('TextAreaStrokeWidth')).assertEqual('0.00px');
      expect(''+AppStorage.get('TextAreaStrokeColor')).assertEqual('#FFFFC0CB');
      expect(''+AppStorage.get('SearchStrokeWidth')).assertEqual('0.00px');
      expect(''+AppStorage.get('SearchStrokeColor')).assertEqual('#FFFFC0CB');
      AppStorage.delete('TextInputStrokeWidth')
      AppStorage.delete('TextInputStrokeColor')
      AppStorage.delete('TextAreaStrokeWidth')
      AppStorage.delete('TextAreaStrokeColor')
      AppStorage.delete('SearchStrokeWidth')
      AppStorage.delete('SearchStrokeColor')
      console.info("[TextStrokeTest0001] end");
      done();
    });

    /**
     * @tc.name   TextStrokeTest0002
     * @tc.number SUB_ACE_BASIC_ETS_STROKE_API_0002
     * @tc.desc   set normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextStrokeTest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextStrokeTest0002 START');
      let change = await driver.findComponent(ON.id('changeStroke'))
      await CommonFunc.sleep(500);
      await change.click()
      await CommonFunc.sleep(500);
      let getStroke = await driver.findComponent(ON.id('getStroke'))
      await CommonFunc.sleep(500);
      await getStroke.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('TextInputStrokeWidth')).assertEqual('500.00%');
      expect(''+AppStorage.get('TextInputStrokeColor')).assertEqual('#FFFFC0CB');
      expect(''+AppStorage.get('TextAreaStrokeWidth')).assertEqual('500.00%');
      expect(''+AppStorage.get('TextAreaStrokeColor')).assertEqual('#FFFFC0CB');
      expect(''+AppStorage.get('SearchStrokeWidth')).assertEqual('500.00%');
      expect(''+AppStorage.get('SearchStrokeColor')).assertEqual('#FFFFC0CB');
      AppStorage.delete('TextInputStrokeWidth')
      AppStorage.delete('TextInputStrokeColor')
      AppStorage.delete('TextAreaStrokeWidth')
      AppStorage.delete('TextAreaStrokeColor')
      AppStorage.delete('SearchStrokeWidth')
      AppStorage.delete('SearchStrokeColor')
      console.info("[TextStrokeTest0002] end");
      done();
    });

    /**
     * @tc.name   TextStrokeTest0003
     * @tc.number SUB_ACE_BASIC_ETS_STROKE_API_0003
     * @tc.desc   set normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextStrokeTest0003', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextStrokeTest0003 START');
      let change = await driver.findComponent(ON.id('changeStroke'))
      await CommonFunc.sleep(500);
      await change.click()
      await CommonFunc.sleep(500);
      await change.click()
      await CommonFunc.sleep(500);
      let getStroke = await driver.findComponent(ON.id('getStroke'))
      await CommonFunc.sleep(500);
      await getStroke.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('TextInputStrokeWidth')).assertEqual('-500.00%');
      expect(''+AppStorage.get('TextInputStrokeColor')).assertEqual('#FF00000A');
      expect(''+AppStorage.get('TextAreaStrokeWidth')).assertEqual('-500.00%');
      expect(''+AppStorage.get('TextAreaStrokeColor')).assertEqual('#FF00000A');
      expect(''+AppStorage.get('SearchStrokeWidth')).assertEqual('-500.00%');
      expect(''+AppStorage.get('SearchStrokeColor')).assertEqual('#FF00000A');
      AppStorage.delete('TextInputStrokeWidth')
      AppStorage.delete('TextInputStrokeColor')
      AppStorage.delete('TextAreaStrokeWidth')
      AppStorage.delete('TextAreaStrokeColor')
      AppStorage.delete('SearchStrokeWidth')
      AppStorage.delete('SearchStrokeColor')
      console.info("[TextStrokeTest0003] end");
      done();
    });
  })
}