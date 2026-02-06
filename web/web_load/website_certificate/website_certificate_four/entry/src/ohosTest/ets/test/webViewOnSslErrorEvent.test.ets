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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202440;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnSslErrorEvent() {

  describe('webViewOnSslErrorEvent', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnSslErrorEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnSslErrorEvent state success " + JSON.stringify(pages));
        if (!("webViewOnSslErrorEvent" == pages.name)) {
          console.info("get webViewOnSslErrorEvent state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webViewOnSslErrorEvent page success");
        }
      } catch (err) {
        console.error("push webViewOnSslErrorEvent page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewOnSslErrorEvent"), 10000);
      console.log("waitForComponent webViewOnSslErrorEvent");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_100
    * @tc.name       : testOnSslErrorEvent0100
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('OnSslErrorEvent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OnSslErrorEvent0100", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("OnSslErrorEvent0100", 2, 202450, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewOnSslErrorEvent");
      if (await Utils.waitForExist(() => isReturn, 'OnSslErrorEvent0100' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_200
    * @tc.name       : testOnSslErrorEvent0200
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OnSslErrorEvent0200", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("OnSslErrorEvent0200", 3, 202460, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewOnSslErrorEvent");
      if (await Utils.waitForExist(() => isReturn, 'OnSslErrorEvent0200' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_300
    * @tc.name       : testOnSslErrorEvent0300
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OnSslErrorEvent0300", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("OnSslErrorEvent0300", false, 202470, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewOnSslErrorEvent");
      if (await Utils.waitForExist(() => isReturn, 'OnSslErrorEvent0300' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_400
    * @tc.name       : testOnSslErrorEvent0400
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OnSslErrorEvent0400", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("OnSslErrorEvent0400", 2, 202480, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewOnSslErrorEvent");
      if (await Utils.waitForExist(() => isReturn, 'OnSslErrorEvent0400' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}