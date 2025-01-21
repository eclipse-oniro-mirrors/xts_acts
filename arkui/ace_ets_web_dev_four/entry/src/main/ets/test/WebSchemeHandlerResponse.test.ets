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

export default function WebSchemeHandlerResponse() {

  describe('WebSchemeHandlerResponse', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebSchemeHandlerResponse',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebSchemeHandlerResponse state success " + JSON.stringify(pages));
        if (!("WebSchemeHandlerResponse" == pages.name)) {
          console.info("get WebSchemeHandlerResponse state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebSchemeHandlerResponse page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebSchemeHandlerResponse page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.name       : testWebSchemeHandlerResponse0100
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebSchemeHandlerResponse0100', 0, async (done: Function) => {
      Utils.emitEvent("WebSchemeHandlerResponse0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebSchemeHandlerResponse0100", "http://www.example.com", 8806, done);
      Utils.registerEvent("WebSchemeHandlerResponse0100", 200, 8808, done);
      Utils.registerEvent("WebSchemeHandlerResponse0100", "OK", 8810, done);
      Utils.registerEvent("WebSchemeHandlerResponse0100", "text/html", 8812, done);
      Utils.registerEvent("WebSchemeHandlerResponse0100", "utf-8", 8814, done);
      Utils.registerEvent("WebSchemeHandlerResponse0100", "value1", 8816, done);
      Utils.registerEvent("WebSchemeHandlerResponse0100", WebNetErrorList.NET_OK, 8818, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
