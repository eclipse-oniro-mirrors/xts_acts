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
import Utils from './Utils';
import router from '@ohos.router';

export default function webMessagePortIsExtentionTypeTest() {

  describe('WebMessagePortIsExtentionTypeTest', () => {
    let pageName = 'WebMessagePortIsExtentionTypeTest'
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/' + pageName,
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info(`get ${pageName} state success ` + JSON.stringify(pages));
        if (!(pageName == pages.name)) {
          console.info(`get ${pageName} state success ` + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info(`push ${pageName} page success ` + JSON.stringify(result));
        }
      } catch (err) {
        console.error(`push ${pageName} page error: ` + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info(`${pageName} beforeEach start`);
      done();
    })

    afterEach(async (done: Function) => {
      console.info(`${pageName} afterEach start`);
      await Utils.sleep(2000);
      console.info(`${pageName} afterEach end`);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBMESSAGEPORT_ISEXTENTIONTYPE_0100
    * @tc.name        : testIsExtentionType001
    * @tc.desc        : test isExtentionType
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testIsExtentionType001', 0, async (done: Function) => {
      Utils.emitEvent("testIsExtentionType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testIsExtentionType001", "401", 100100, done);
      sendEventByKey('IsExtentionTypeButton', 10, '');
    })

  })
}
