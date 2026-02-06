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

const EVENT_ID_SET_EMIT_KEY = 201660;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webOnInterceptReqTwo() {
  describe('ActsAceWebDevWebOnInterceptReqTwoTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webOnInterceptReqTwo',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webOnInterceptReqTwo state success " + JSON.stringify(pages));
        if (!("webOnInterceptReqTwo" == pages.name)) {
          console.info("get webOnInterceptReqTwo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webOnInterceptReqTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webOnInterceptReqTwo page error: " + err);
      }
      await driver.waitForComponent(ON.id("webOnInterceptReqTwo"), 10000);
      console.log("waitForComponent webOnInterceptReqTwo");
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webOnInterceptReqTwo beforeEach start");
      done();
    })

    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_WEBPATR2_API_0200
     * @tc.name       : testOnInterceptRequestAgainWebC
     * @tc.desc       : onInterceptRequest with setting webresourceresponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOnInterceptRequestAgainWebC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptRequestSecondWebC", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnInterceptRequestAgainWebC",  "intercept test", 201670, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webOnInterceptReqTwo");
      if (await Utils.waitForExist(() => isReturn, 'testOnInterceptRequestAgainWebC' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}