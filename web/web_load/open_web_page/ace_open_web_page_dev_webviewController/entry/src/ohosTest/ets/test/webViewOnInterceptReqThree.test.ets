/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200480;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnInterceptReqThree() {
  describe('ActsAceWebDevWebViewOnInterceptReqThreeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnInterceptReqThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnInterceptReqThree state success " + JSON.stringify(pages));
        if (!("webViewOnInterceptReqThree" == pages.name)) {
          console.info("get webViewOnInterceptReqThree state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewOnInterceptReqThree page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnInterceptReqThree page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewOnInterceptReqThree"), 10000);
      console.log("waitForComponent webViewOnInterceptReqThree");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewOnInterceptReqThree beforeEach start");
      done();
    })

    /*
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR2_API_0300
     * @tc.name testOnInterceptRequestThird
     * @tc.desc onInterceptRequest with setting setresponsecede 404
     */
    it('testOnInterceptRequestThird', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const emitKey = "emitOnInterceptRequestThird";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnInterceptRequestThird", 404, 200490, done);
      sendEventByKey('webViewOnInterceptReqThree', 10, '');
    })
  })
}