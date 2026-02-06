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

const EVENT_ID_SET_EMIT_KEY = 201530;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webONHttpErrorReceiveExample() {
  describe('ActsAceWebDevWebONHttpErrorReceiveExampleTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webONHttpErrorReceiveExample',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webONHttpErrorReceiveExample state success " + JSON.stringify(pages));
        if (!("webONHttpErrorReceiveExample" == pages.name)) {
          console.info("get webONHttpErrorReceiveExample state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webONHttpErrorReceiveExample page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webONHttpErrorReceiveExample page error: " + err);
      }
      await driver.waitForComponent(ON.id("webONHttpErrorReceiveExample"), 10000);
      console.log("waitForComponent webONHttpErrorReceiveExample");
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webONHttpErrorReceiveExample beforeEach start");
      done();
    })

    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_WEBERRORRECV_API_0200
     * @tc.name       : testOnHttpErrorReceiveByExampleWebc
     * @tc.desc       : test interface of onHttpErrorReceive with parameter used by example
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOnHttpErrorReceiveByExampleWebc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnHttpErrorReceiveByExampleWebc", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnHttpErrorReceiveByExampleWebc", 403, 201540, () => { isReturn = 1 });
      Utils.registerEvent("testOnHttpErrorReceiveByExampleWebc", "intercept test", 201550, () => { isReturn = 2 });
      await Utils.waitAndClickComponent(driver, "webONHttpErrorReceiveExample");
      if (await Utils.waitForExist(() => isReturn, 'testOnHttpErrorReceiveByExampleWebc' + '_returnCheck', 2, 1000)) {
        done();
      }
    })
  })
}