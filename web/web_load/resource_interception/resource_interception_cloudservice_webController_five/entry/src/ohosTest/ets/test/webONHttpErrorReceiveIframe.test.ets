/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201560;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webONHttpErrorReceiveIframe() {
  describe('ActsAceWebDevWebONHttpErrorReceiveIframeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webONHttpErrorReceiveIframe',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webONHttpErrorReceiveIframe state success " + JSON.stringify(pages));
        if (!("webONHttpErrorReceiveIframe" == pages.name)) {
          console.info("get webONHttpErrorReceiveIframe state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webONHttpErrorReceiveIframe page success");
        }
      } catch (err) {
        console.error("push webONHttpErrorReceiveIframe page error: " + err);
      }
      await driver.waitForComponent(ON.id("webONHttpErrorReceiveIframe"), 10000);
      console.log("waitForComponent webONHttpErrorReceiveIframe");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webONHttpErrorReceiveIframe beforeEach start");
      done();
    })

    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_WEBERRORRECV_API_0300
     * @tc.name       : testOnHttpErrorReceiveByIframeHtmlWebc
     * @tc.desc       : test interface of onHttpErrorReceive with parameter used by html file with iframe
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOnHttpErrorReceiveByIframeHtmlWebc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnHttpErrorReceiveByIframeHtmlWebc", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnHttpErrorReceiveByIframeHtmlWebc", false, 201570, () => { isReturn = 1 });
      Utils.registerEvent("testOnHttpErrorReceiveByIframeHtmlWebc", "index", 201580, () => { isReturn = 2 });
      await Utils.waitAndClickComponent(driver, "webONHttpErrorReceiveIframe");
      if (await Utils.waitForExist(() => isReturn, 'testOnHttpErrorReceiveByIframeHtmlWebc' + '_returnCheck', 2, 1000)) {
        done();
      }
    })
  })
}