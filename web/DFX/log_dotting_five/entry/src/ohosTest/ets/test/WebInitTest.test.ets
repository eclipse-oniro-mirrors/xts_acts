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

import { beforeAll, describe, it , expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest';
import wifiMg from '@ohos.wifiManager';

export default function webInitTest() {
  describe('WebInitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebInitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebInitTest state success " + JSON.stringify(pages));
        if (!("WebInitTest" == pages.name)) {
          console.info("get WebInitTest state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push WebInitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebInitTest page error: " + err);
      }
      await waitForComponent("WebInitTestButton");
      done()
    });

    /**
     * @tc.name   testSchemeName001
     * @tc.number SUB_WEB_SCHEME_NAME_0100
     * @tc.desc   test schemeName length exceeds 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSchemeName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSchemeName001", 119760)
      Utils.registerEvent("testSchemeName001", '401', 119770, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })

    /**
     * @tc.name   testCustomizeSchemes001
     * @tc.number SUB_WEB_CUSTOMIZESCHEMES_0100
     * @tc.desc   test customizeSchemes length exceeds 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCustomizeSchemes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemes001", 119760)
      Utils.registerEvent("testCustomizeSchemes001", '401', 119780, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
  })
}
