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

export default function webNestedScrollOptionsScrollForwardTest() {

  describe('WebNestedScrollOptionsScrollForwardTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNestedScrollOptionsScrollForwardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNestedScrollOptionsScrollForwardTest state success " + JSON.stringify(pages));
        if (!("WebNestedScrollOptionsScrollForwardTest" == pages.name)) {
          console.info("get WebNestedScrollOptionsScrollForwardTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebNestedScrollOptionsScrollForwardTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNestedScrollOptionsScrollForwardTest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebNestedScrollOptionsScrollForwardTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebNestedScrollOptionsScrollForwardTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0100
    * @tc.name        : testNestedScrollOptionsScrollForward001
    * @tc.desc        : test NestedScrollOptions scrollForward
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testNestedScrollOptionsScrollForward001', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward001", true, 8001, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0200
    * @tc.name        : testNestedScrollOptionsScrollForward002
    * @tc.desc        : test NestedScrollOptions scrollForward
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testNestedScrollOptionsScrollForward002', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward002", true, 8002, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0300
     * @tc.name        : testNestedScrollOptionsScrollForward003
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward003', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward003", true, 8003, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0400
     * @tc.name        : testNestedScrollOptionsScrollForward004
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward004', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward004", true, 8004, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0500
     * @tc.name        : testNestedScrollOptionsScrollForward005
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward005', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward005", true, 8005, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0600
     * @tc.name        : testNestedScrollOptionsScrollForward006
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward006', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward006", true, 8006, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0700
     * @tc.name        : testNestedScrollOptionsScrollForward007
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward007', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward007", true, 8007, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0800
     * @tc.name        : testNestedScrollOptionsScrollForward008
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward008', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward008", true, 8008, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0900
     * @tc.name        : testNestedScrollOptionsScrollForward009
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward009', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward009", true, 8009, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1000
     * @tc.name        : testNestedScrollOptionsScrollForward010
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward010', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward010", true, 8010, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1100
     * @tc.name        : testNestedScrollOptionsScrollForward011
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward011', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward011", true, 8011, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1200
     * @tc.name        : testNestedScrollOptionsScrollForward012
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward012', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward012", true, 8012, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1300
     * @tc.name        : testNestedScrollOptionsScrollForward013
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward013', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward013", true, 8013, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1400
     * @tc.name        : testNestedScrollOptionsScrollForward014
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward014', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward014", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward014", true, 8014, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1500
     * @tc.name        : testNestedScrollOptionsScrollForward015
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward015', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward015", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward015", true, 8015, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1600
     * @tc.name        : testNestedScrollOptionsScrollForward016
     * @tc.desc        : test NestedScrollOptions scrollForward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForward016', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForward016", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForward016", true, 8016, done);
      sendEventByKey('NestedScrollOptionsScrollForwardTestButton', 10, '');
    })

  })
}
