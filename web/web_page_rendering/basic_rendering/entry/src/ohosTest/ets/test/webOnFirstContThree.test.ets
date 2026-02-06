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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitLoadUrlOnfirstcontentfulpaintWebc";

export default function webOnFirstContThree() {
  describe('ActsAceWebDevWebOnFirstContThreeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webOnFirstContThree',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webOnFirstContThree state success " + JSON.stringify(pages));
        if (!("webOnFirstContThree" == pages.name)) {
          console.info("get webOnFirstContThree state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webOnFirstContThree page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webOnFirstContThree page error: " + err);
      }
      await waitForComponent("webOnFirstContThree");
      done();
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webOnFirstContThree beforeEach start");
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR5_API_0300
     *tc.name testOnfirstcontentfulpaintloadurlWebc
     *tc.desc onfirstcontentfulpaint with web load url
     */
    it('testOnfirstcontentfulpaintloadurlWebc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitLoadUrlOnfirstcontentfulpaintWebc";
      Utils.registerEvent("testOnfirstcontentfulpaintloadurlWebc", true, 151800, done);
      sendEventByKey('webOnFirstContThree', 10, '');
    })
  })
}