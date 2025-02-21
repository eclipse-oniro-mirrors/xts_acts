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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webOptions() {
  describe('WebOptionsTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOptions state success " + JSON.stringify(pages));
        if (!("WebOptions" == pages.name)) {
          console.info("get WebOptions state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOptions page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOptions page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOptionsTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebOptionsTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBOPTIONS_SRC_0100
    * @tc.name        : testWebOptionsSrc001
    * @tc.desc        : test WebOptions.src with rawfile
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebOptionsSrc001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebOptions001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebOptions001", 'index', 430, done);
      sendEventByKey('WebOptionsTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBOPTIONS_SRC_0200
    * @tc.name        : testWebOptionsSrc002
    * @tc.desc        : test WebOptions.src with resource
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebOptionsSrc002', 0, async (done: Function) => {
      Utils.emitEvent("emitWebOptions002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebOptions002", 'second', 432, done);
      sendEventByKey('WebOptionsTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBOPTIONS_SRC_0300
    * @tc.name        : testWebOptionsSrc003
    * @tc.desc        : test WebOptions.src with url
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebOptionsSrc003', 0, async (done: Function) => {
      Utils.emitEvent("emitWebOptions003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebOptions003", 'OpenAtom OpenHarmony', 434, done);
      sendEventByKey('WebOptionsTestButton', 10, '');
    })
  })
}