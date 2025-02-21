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

export default function WebHttpBodyStream() {

  describe('WebHttpBodyStream', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebHttpBodyStream',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebHttpBodyStream state success " + JSON.stringify(pages));
        if (!("WebHttpBodyStream" == pages.name)) {
          console.info("get WebHttpBodyStream state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebHttpBodyStream page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebHttpBodyStream page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBHTTPBODYSTREAM_100
    * @tc.name       : testWebHttpBodyStream0100
    * @tc.desc       : test WebHttpBodyStream
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebHttpBodyStream0100', 0, async (done: Function) => {
      Utils.emitEvent("WebHttpBodyStream0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebHttpBodyStream0100", true, 8820, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebHttpBodyStream"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
