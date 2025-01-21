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
import Utils from './Utils';
import router from '@ohos.router';

export default function webOnInterceptKeyEvent() {
  describe('WebOnInterceptKeyEventTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebOnInterceptKeyEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnInterceptKeyEvent state success " + JSON.stringify(pages));
        if (!("WebOnInterceptKeyEvent" == pages.name)) {
          console.info("get WebOnInterceptKeyEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOnInterceptKeyEvent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnInterceptKeyEvent page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOnInterceptKeyEventTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebOnInterceptKeyEventTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTKEYEVENT_0200
    * @tc.name        : testOnInterceptKeyEvent002
    * @tc.desc        : test onInterceptKeyEvent when return true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnInterceptKeyEvent002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptKeyEvent002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInterceptKeyEvent002", 2047, 70422, done);
      sendEventByKey('WebOnInterceptKeyEventTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTKEYEVENT_0300
    * @tc.name        : testOnInterceptKeyEvent003
    * @tc.desc        : test onInterceptKeyEvent when return false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnInterceptKeyEvent003', 0, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptKeyEvent003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInterceptKeyEvent003", 2047, 70425, done);
      sendEventByKey('WebOnInterceptKeyEventTestButton', 10, '');
    })
  })
}