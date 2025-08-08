/**
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webMediaOption() {
  describe('WebMediaOptionTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebMediaOption',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebMediaOption state success " + JSON.stringify(pages));
        if (!("WebMediaOption" == pages.name)) {
          console.info("get WebMediaOption state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebMediaOption page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebMediaOption page error: " + err);
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

    afterEach(async (done: Function) => {
      console.info("WebMediaOptionTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebMediaOptionTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_MEDIAOPTIONS_0100
    * @tc.name        : testMediaOptions001
    * @tc.desc        : test mediaOptions single instance
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testMediaOptions001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitMediaOptions001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMediaOptions001", false, 415, done);
      sendEventByKey('webViewMediaOptionTestButton', 10, '');
    })
  })
}