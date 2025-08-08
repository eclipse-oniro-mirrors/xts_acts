/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
let emitKey = "emitOnActivateContent";

export default function webWaitForAttachedTest() {


  describe('onActivateContentTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/OnActivateContent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onActivateContent state success " + JSON.stringify(pages));
        if (!("onActivateContent" == pages.name)) {
          console.info("get onActivateContent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push onActivateContent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onActivateContent page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("onActivateContent afterEach start");
      await Utils.sleep(2000);
      console.info("onActivateContent afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONACTIVATECONTENTBUTTON_0100
    * @tc.name        : emitOnActivateContent
    * @tc.desc        : test on normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */

    it('emitOnActivateContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnActivateContent", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("emitOnActivateContent", true, 20250619, done);
      sendEventByKey('onActivateContentButton', 10, '');
    })
  })
}