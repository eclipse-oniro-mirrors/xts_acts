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

const EVENT_ID_SET_EMIT_KEY = 201640;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webOnInterceptReqThree() {
  describe('ActsAceWebDevWebOnInterceptReqThreeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webOnInterceptReqThree',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webOnInterceptReqThree state success " + JSON.stringify(pages));
        if (!("webOnInterceptReqThree" == pages.name)) {
          console.info("get webOnInterceptReqThree state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webOnInterceptReqThree page success");
        }
      } catch (err) {
        console.error("push webOnInterceptReqThree page error: " + err);
      }
      await driver.waitForComponent(ON.id("webOnInterceptReqThree"), 10000);
      console.log("waitForComponent webOnInterceptReqThree");
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webOnInterceptReqThree beforeEach start");
      done();
    })

    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_WEBPATR2_API_0300
     * @tc.name       : testOnInterceptRequestThirdWebC
     * @tc.desc       : onInterceptRequest with setting setresponsecede 404
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOnInterceptRequestThirdWebC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptRequestThirdWebC", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnInterceptRequestThirdWebC", 404, 201650, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webOnInterceptReqThree");
      if (await Utils.waitForExist(() => isReturn, 'testOnInterceptRequestThirdWebC' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}