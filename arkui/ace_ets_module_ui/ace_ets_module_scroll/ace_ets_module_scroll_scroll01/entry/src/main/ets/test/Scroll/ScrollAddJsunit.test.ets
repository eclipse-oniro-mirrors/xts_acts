/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import ohosrouter from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common'
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';

export default function ScrollAddJsunit() {
  describe('ScrollAddJsunit', () => {
    beforeAll(async () => {
      console.info("Scroll_addJsunit beforeEach start");
      try {
        ohosrouter.clear();
        let pages = ohosrouter.getState();
        console.info("Scroll_addJsunit " + JSON.stringify(pages));
        if (!("Scroll_add" == pages.name)) {
          console.info("Scroll_addJsunit state success " + JSON.stringify(pages.name));
          ohosrouter.pushUrl({
            url: 'MainAbility/pages/Scroll/Scroll_add',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
            // success
          })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push Scroll_add page success ");
        }
      } catch (err) {
        console.error("push Scroll_add page error: " + err);
      }
    });

    /**
     * @tc.name   ScrollAddJsunit_0400
     * @tc.number apiCommponentAddJsunit_0400
     * @tc.desc   Test Scroll onScrollText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollAddJsunit_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ScrollAddJsunit_0400 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(100);
      // wether if swipe
      let gridText = await driver.findComponent(ON.id('9'));
      let  text = await gridText.getText();
      console.info("[ScrollAddJsunit_0400] onScrollText: " + text);
      expect(text).assertEqual('9');
      done();
    });
  })
}