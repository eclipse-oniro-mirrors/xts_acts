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

export default function webNestedScrollOptionsScrollForwardHorizontalTest() {

  describe('WebNestedScrollOptionsScrollForwardHorizontalTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNestedScrollOptionsScrollForwardHorizontalTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNestedScrollOptionsScrollForwardHorizontalTest state success " + JSON.stringify(pages));
        if (!("WebNestedScrollOptionsScrollForwardHorizontalTest" == pages.name)) {
          console.info("get WebNestedScrollOptionsScrollForwardHorizontalTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebNestedScrollOptionsScrollForwardHorizontalTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNestedScrollOptionsScrollForwardHorizontalTest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebNestedScrollOptionsScrollForwardHorizontalTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebNestedScrollOptionsScrollForwardHorizontalTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0100
    * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal001
    * @tc.desc        : test NestedScrollOptions scrollForward horizontal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testNestedScrollOptionsScrollForwardHorizontal001', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal001", true, 5001, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0200
    * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal002
    * @tc.desc        : test NestedScrollOptions scrollForward horizontal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testNestedScrollOptionsScrollForwardHorizontal002', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal002", true, 5002, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0300
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal003
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal003', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal003", true, 5003, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0400
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal004
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal004', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal004", true, 5004, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0500
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal005
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal005', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal005", true, 5005, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0600
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal006
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal006', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal006", true, 5006, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0700
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal007
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal007', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal007", true, 5007, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0800
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal008
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal008', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal008", true, 5008, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0900
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal009
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal009', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal009", true, 5009, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1000
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal010
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal010', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal010", true, 5010, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1100
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal011
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal011', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal011", true, 5011, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1200
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal012
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal012', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal012", true, 5012, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1300
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal013
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal013', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal013", true, 5013, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1400
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal014
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal014', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal014", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal014", true, 5014, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1500
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal015
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal015', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal015", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal015", true, 5015, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1600
     * @tc.name        : testNestedScrollOptionsScrollForwardHorizontal016
     * @tc.desc        : test NestedScrollOptions scrollForward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal016', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollForwardHorizontal016", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollForwardHorizontal016", true, 5016, done);
      sendEventByKey('NestedScrollOptionsScrollForwardHorizontalTestButton', 10, '');
    })

  })
}
