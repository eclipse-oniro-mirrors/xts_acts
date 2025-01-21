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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webSecureDnsModeEnumTest() {

  describe('WebSecureDnsModeEnumTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebSecureDnsModeEnumTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebSecureDnsModeEnumTest state success " + JSON.stringify(pages));
        if (!("WebSecureDnsModeEnumTest" == pages.name)) {
          console.info("get WebSecureDnsModeEnumTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebSecureDnsModeEnumTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebSecureDnsModeEnumTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebSecureDnsModeEnumTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebSecureDnsModeEnumTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_SECUREDNSMODE_ENUM_0100
    * @tc.name        : testWebSecureDnsModeEnum001
    * @tc.desc        : test the value of SecureDnsMode.OFF is 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebSecureDnsModeEnum001', 0, async (done: Function) => {
      Utils.emitEvent("testWebSecureDnsModeEnum001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebSecureDnsModeEnum001", 0, 70300, done);
      sendEventByKey('WebSecureDnsModeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_SECUREDNSMODE_ENUM_0200
    * @tc.name        : testWebSecureDnsModeEnum002
    * @tc.desc        : test the value of SecureDnsMode.AUTO is 1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebSecureDnsModeEnum002', 0, async (done: Function) => {
      Utils.emitEvent("testWebSecureDnsModeEnum002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebSecureDnsModeEnum002", 1, 70301, done);
      sendEventByKey('WebSecureDnsModeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_SECUREDNSMODE_ENUM_0300
    * @tc.name        : testWebSecureDnsModeEnum003
    * @tc.desc        : test the value of SecureDnsMode.SECURE_ONLY is 2
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebSecureDnsModeEnum003', 0, async (done: Function) => {
      Utils.emitEvent("testWebSecureDnsModeEnum003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebSecureDnsModeEnum003", 2, 70302, done);
      sendEventByKey('WebSecureDnsModeEnumTestButton', 10, '');
    })

  })
}
