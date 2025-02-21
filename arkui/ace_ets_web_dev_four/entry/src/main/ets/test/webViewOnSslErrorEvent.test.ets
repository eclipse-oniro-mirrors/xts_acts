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
import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { WebNetErrorList } from '@ohos.web.netErrorList'

export default function webViewOnSslErrorEvent() {

  describe('webViewOnSslErrorEvent', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webViewOnSslErrorEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnSslErrorEvent state success " + JSON.stringify(pages));
        if (!("webViewOnSslErrorEvent" == pages.name)) {
          console.info("get webViewOnSslErrorEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webViewOnSslErrorEvent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnSslErrorEvent page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_100
    * @tc.name       : testOnSslErrorEvent0100
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent0100', 0, async (done: Function) => {
      Utils.emitEvent("OnSslErrorEvent0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("OnSslErrorEvent0100", 2, 400, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("webViewOnSslErrorEvent"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_200
    * @tc.name       : testOnSslErrorEvent0200
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent0200', 0, async (done: Function) => {
      Utils.emitEvent("OnSslErrorEvent0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("OnSslErrorEvent0200", 3, 401, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("webViewOnSslErrorEvent"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_300
    * @tc.name       : testOnSslErrorEvent0300
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent0300', 0, async (done: Function) => {
      Utils.emitEvent("OnSslErrorEvent0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("OnSslErrorEvent0300", false, 402, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("webViewOnSslErrorEvent"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_400
    * @tc.name       : testOnSslErrorEvent0400
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent0400', 0, async (done: Function) => {
      Utils.emitEvent("OnSslErrorEvent0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("OnSslErrorEvent0400", 2
      , 403, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("webViewOnSslErrorEvent"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
