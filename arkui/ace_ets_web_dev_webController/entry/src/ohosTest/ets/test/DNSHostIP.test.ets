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
import { beforeAll, beforeEach, describe, it, expect, afterEach } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import webView from '@ohos.web.webview';

export default function DNSHostIP() {

  describe('DNSHostIP', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/DNSHostIP',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DNSHostIP state success " + JSON.stringify(pages));
        if (!("DNSHostIP" == pages.name)) {
          console.info("get DNSHostIP state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push DNSHostIP page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DNSHostIP page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      await Utils.sleep(60000);
      console.info("web afterEach finish");
      done();
    })


    /*
     * @tc.number     : Acts_setHostIP_0100
     * @tc.name       : testSetHostIP001
     * @tc.desc       : test DNSHostIP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('setHostIP0100', 0, async (done: Function) => {
      Utils.emitEvent("setHostIP0100", 10)
      await Utils.sleep(5000);
      Utils.registerEvent("setHostIP0100", true, 8770, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("DNSHostIP"));
      await StartModel.click();
      await driver.delayMs(5000);
    })

    /*
     * @tc.number     : Acts_clearHostIP_1200
     * @tc.name       : testClearHostIP012
     * @tc.desc       : test DNSHostIP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('setHostIP1200', 0, async (done: Function) => {
      Utils.emitEvent("setHostIP1200", 10)
      await Utils.sleep(5000);
      Utils.registerEvent("setHostIP1200", true, 8771, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("DNSHostIP"));
      await StartModel.click();
      await driver.delayMs(5000);
    })


    /*
     * @tc.number     : Acts_clearHostIP_1300
     * @tc.name       : testClearHostIP013
     * @tc.desc       : test DNSHostIP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('setHostIP1300', 0, async (done: Function) => {
      Utils.emitEvent("setHostIP1300", 10)
      await Utils.sleep(5000);
      Utils.registerEvent("setHostIP1300", true, 8772, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("DNSHostIP"));
      await StartModel.click();
      await driver.delayMs(5000);
    })
    /*
     * @tc.number     : Acts_clearHostIP_0800
     * @tc.name       : testClearHostIP008
     * @tc.desc       : test DNSHostIP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('setHostIP1500', 0, async (done: Function) => {
      Utils.emitEvent("setHostIP1500", 10)
      await Utils.sleep(5000);
      Utils.registerEvent("setHostIP1500", true, 8773, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("DNSHostIP"));
      await StartModel.click();
      await driver.delayMs(5000);
    })
  })
}
