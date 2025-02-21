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

export default function webViewOnRequestStartTwo() {

  describe('webViewOnRequestStartTwo', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webViewOnRequestStartTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnRequestStartTwo state success " + JSON.stringify(pages));
        if (!("OnRequestStartTwo" == pages.name)) {
          console.info("get OnRequestStartTwo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push OnRequestStartTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnRequestStartTwo page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTONREQUESTSTARTTWO_0300
    * @tc.name       : testWebdefaultOnRequestStart0300
    * @tc.desc       : test WebdefaultOnRequestStartTwo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultOnRequestStart0300', 0, async (done: Function) => {
      Utils.emitEvent("defaultOnRequestStart0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultOnRequestStart0300", "lock", 3300, done);
      Utils.registerEvent("defaultOnRequestStart0300", "lock", 3302, done);
      Utils.registerEvent("defaultOnRequestStart0300", "lock", 3304, done);
      Utils.registerEvent("defaultOnRequestStart0300", false, 3306, done);
      Utils.registerEvent("defaultOnRequestStart0300", true, 3308, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("OnRequestStartTwo"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
