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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webAttributeTest() {
  describe('WebAttributeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await Utils.sleep(2000);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      done()
    });

    /*
    * @tc.number      : SUB_WEB_ONCONSOLE_0100
    * @tc.name        : testOnConsole001
    * @tc.desc        : test onConsole message
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnConsole001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnConsole001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnConsole001", "console test", 70040, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_CONSOLEMESSAGE_0100
    * @tc.name        : testConsoleMessage001
    * @tc.desc        : test onConsole info
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testConsoleMessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitConsoleMessage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConsoleMessage001", 51, 70042, done);
      Utils.registerEvent("testConsoleMessage001", 'resource://rawfile/index.html', 70044, done);
      Utils.registerEvent("testConsoleMessage001", MessageLevel.Info, 70046, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
  })
}
