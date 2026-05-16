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

export default function TextNumberTransitionTest() {
  describe('TextNumberTransitionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextNumberTransitionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextNumberTransitionTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextNumberTransitionTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextNumberTransitionTest" == pages.name)) {
          console.info("get TextNumberTransitionTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextNumberTransitionTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextNumberTransitionTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextNumberTransitionTest after each called");
    });

    /**
     * @tc.name   TextNumberTransitionTest0001
     * @tc.number SUB_ACE_BASIC_ETS_TEXT_NUMBER_TRANSITION_API_0001
     * @tc.desc   test flipDirection: FlipDirection.DOWN, enableBlur: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextNumberTransitionTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextNumberTransitionTest0001 START');
      let TextNumberTransition = getInspectorByKey('TextNumberTransition');
      let numericTextTransitionOptions: ESObject = JSON.parse(JSON.parse(TextNumberTransition).$attrs.numericTextTransitionOptions);
      console.log('numericTextTransitionOptions--flipDirection:'+numericTextTransitionOptions.flipDirection)
      console.log('numericTextTransitionOptions--enableBlur:'+numericTextTransitionOptions.enableBlur)
      expect(''+numericTextTransitionOptions.flipDirection).assertEqual('down')
      expect(''+numericTextTransitionOptions.enableBlur).assertEqual('false')
      console.info("[TextNumberTransitionTest0001] end");
      done();
    });

    /**
     * @tc.name   TextNumberTransitionTest0002
     * @tc.number SUB_ACE_BASIC_ETS_TEXT_NUMBER_TRANSITION_API_0002
     * @tc.desc   test flipDirection: FlipDirection.UP, enableBlur: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextNumberTransitionTest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextNumberTransitionTest0002 START');
      let changeIndex = await driver.findComponent(ON.id('changeIndex'))
      await CommonFunc.sleep(500);
      await changeIndex.click()
      await CommonFunc.sleep(500);
      let TextNumberTransition = getInspectorByKey('TextNumberTransition');
      let numericTextTransitionOptions: ESObject = JSON.parse(JSON.parse(TextNumberTransition).$attrs.numericTextTransitionOptions);
      console.log('numericTextTransitionOptions--flipDirection:'+numericTextTransitionOptions.flipDirection)
      console.log('numericTextTransitionOptions--enableBlur:'+numericTextTransitionOptions.enableBlur)
      expect(''+numericTextTransitionOptions.flipDirection).assertEqual('up')
      expect(''+numericTextTransitionOptions.enableBlur).assertEqual('true')
      console.info("[TextNumberTransitionTest0002] end");
      done();
    });
  })
}