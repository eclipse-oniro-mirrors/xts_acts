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

const EVENT_ID_SET_EMIT_KEY = 201370;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webONHttpErrorReceive() {
  describe('ActsAceWebDevWebONHttpErrorReceiveTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webONHttpErrorReceive',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webONHttpErrorReceive state success " + JSON.stringify(pages));
        if (!("webONHttpErrorReceive" == pages.name)) {
          console.info("get webONHttpErrorReceive state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webONHttpErrorReceive page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webONHttpErrorReceive page error: " + err);
      }
      await driver.waitForComponent(ON.id("webONHttpErrorReceive"), 10000);
      console.log("waitForComponent webONHttpErrorReceive");
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webONHttpErrorReceive beforeEach start");
      done();
    })

    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_WEBERRORRECV_API_0100
     * @tc.name       : testOnHttpErrorReceiveFixedUserAgentWebc
     * @tc.desc       : test interface of onHttpErrorReceive with parameter fixed userAgent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOnHttpErrorReceiveFixedUserAgentWebc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnHttpErrorReceiveFixedUserAgentWebc", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "http://1.1.1.123/index.html", 201380, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUstestOnHttpErrorReceiveFixedUserAgentWebcerAgent", true, 201390, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", false, 201400, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", false, 201410, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "GET", 201420, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", '""', 201430, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "utf-8", 201440, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "text/html", 201450, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", 403, 201460, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "Forbidden", 201470, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "User-Agent", 201480, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36", 201490, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "X-Frame-Options", 201500, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "SAMEORIGIN", 201510, null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "403http://1.1.1.123/index.html", 201520, done);
      await Utils.waitAndClickComponent(driver, "webONHttpErrorReceive");
    })
  })
}