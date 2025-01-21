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

export default function webNestedScrollOptionsScrollBackwardTest() {

  describe('WebNestedScrollOptionsScrollBackwardTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebNestedScrollOptionsScrollBackwardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNestedScrollOptionsScrollBackwardTest state success " + JSON.stringify(pages));
        if (!("WebNestedScrollOptionsScrollBackwardTest" == pages.name)) {
          console.info("get WebNestedScrollOptionsScrollBackwardTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebNestedScrollOptionsScrollBackwardTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNestedScrollOptionsScrollBackwardTest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebNestedScrollOptionsScrollBackwardTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebNestedScrollOptionsScrollBackwardTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0100
    * @tc.name        : testNestedScrollOptionsScrollBackward001
    * @tc.desc        : test NestedScrollOptions scrollBackward
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testNestedScrollOptionsScrollBackward001', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward001", true, 7001, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0200
    * @tc.name        : testNestedScrollOptionsScrollBackward002
    * @tc.desc        : test NestedScrollOptions scrollBackward
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testNestedScrollOptionsScrollBackward002', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward002", true, 7002, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0300
     * @tc.name        : testNestedScrollOptionsScrollBackward003
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward003', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward003", true, 7003, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0400
     * @tc.name        : testNestedScrollOptionsScrollBackward004
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward004', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward004", true, 7004, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0500
     * @tc.name        : testNestedScrollOptionsScrollBackward005
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward005', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward005", true, 7005, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0600
     * @tc.name        : testNestedScrollOptionsScrollBackward006
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward006', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward006", true, 7006, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0700
     * @tc.name        : testNestedScrollOptionsScrollBackward007
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward007', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward007", true, 7007, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0800
     * @tc.name        : testNestedScrollOptionsScrollBackward008
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward008', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward008", true, 7008, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0900
     * @tc.name        : testNestedScrollOptionsScrollBackward009
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward009', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward009", true, 7009, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1000
     * @tc.name        : testNestedScrollOptionsScrollBackward010
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward010', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward010", true, 7010, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1100
     * @tc.name        : testNestedScrollOptionsScrollBackward011
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward011', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward011", true, 7011, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1200
     * @tc.name        : testNestedScrollOptionsScrollBackward012
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward012', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward012", true, 7012, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1300
     * @tc.name        : testNestedScrollOptionsScrollBackward013
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward013', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward013", true, 7013, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1400
     * @tc.name        : testNestedScrollOptionsScrollBackward014
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward014', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward014", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward014", true, 7014, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1500
     * @tc.name        : testNestedScrollOptionsScrollBackward015
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward015', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward015", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward015", true, 7015, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1600
     * @tc.name        : testNestedScrollOptionsScrollBackward016
     * @tc.desc        : test NestedScrollOptions scrollBackward
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackward016', 0, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackward016", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackward016", true, 7016, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardTestButton', 10, '');
    })

  })
}
