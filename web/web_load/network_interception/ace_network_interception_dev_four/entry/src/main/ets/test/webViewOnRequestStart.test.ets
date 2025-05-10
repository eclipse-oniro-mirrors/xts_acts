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
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnRequestStart() {

  describe('webViewOnRequestStart', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webViewOnRequestStart',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnRequestStart state success " + JSON.stringify(pages));
        if (!("OnRequestStart" == pages.name)) {
          console.info("get OnRequestStart state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push OnRequestStart page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnRequestStart page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTONREQUESTSTART_0100
    * @tc.name       : testWebdefaultOnRequestStart0100
    * @tc.desc       : test WebdefaultOnRequestStart
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultOnRequestStart0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultOnRequestStart0100", 10)
      await Utils.sleep(4000);
      Utils.registerEvent("defaultOnRequestStart0100", "https://www.baidu.com/", 4400, done);
      Utils.registerEvent("defaultOnRequestStart0100", "GET", 4402, done);
      Utils.registerEvent("defaultOnRequestStart0100", "", 4404, done);
      Utils.registerEvent("defaultOnRequestStart0100", true, 4406, done);
      Utils.registerEvent("defaultOnRequestStart0100", false, 4408, done);
      Utils.registerEvent("defaultOnRequestStart0100", true, 4410, done);
      Utils.registerEvent("defaultOnRequestStart0100", true, 4412, done);
      await Utils.sleep(4000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("OnRequestStart"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTONREQUESTSTART_0200
    * @tc.name       : testWebdefaultOnRequestStart0200
    * @tc.desc       : test WebdefaultOnRequestStart
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultOnRequestStart0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultOnRequestStart0200", 10)
      await Utils.sleep(4000);
      Utils.registerEvent("defaultOnRequestStart0200", "defaultOnRequestStart0200", 4414, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("OnRequestStart"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
