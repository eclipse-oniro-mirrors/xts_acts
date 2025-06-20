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
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webNestedScrollOptionsScrollBackwardHorizontalTest() {

  describe('WebNestedScrollOptionsScrollBackwardHorizontalTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNestedScrollOptionsScrollBackwardHorizontalTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNestedScrollOptionsScrollBackwardHorizontalTest state success " + JSON.stringify(pages));
        if (!("WebNestedScrollOptionsScrollBackwardHorizontalTest" == pages.name)) {
          console.info("get WebNestedScrollOptionsScrollBackwardHorizontalTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebNestedScrollOptionsScrollBackwardHorizontalTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNestedScrollOptionsScrollBackwardHorizontalTest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebNestedScrollOptionsScrollBackwardHorizontalTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebNestedScrollOptionsScrollBackwardHorizontalTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0100
    * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal001
    * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testNestedScrollOptionsScrollBackwardHorizontal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal001", true, 9001, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0200
    * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal002
    * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testNestedScrollOptionsScrollBackwardHorizontal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal002", true, 9002, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0300
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal003
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal003", true, 9003, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0400
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal004
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal004", true, 9004, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0500
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal005
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal005", true, 9005, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0600
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal006
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal006", true, 9006, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0700
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal007
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal007", true, 9007, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0800
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal008
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal008", true, 9008, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0900
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal009
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal009", true, 9009, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1000
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal010
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal010", true, 9010, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1100
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal011
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal011", true, 9011, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1200
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal012
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal012", true, 9012, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1300
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal013
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal013", true, 9013, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1400
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal014
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal014", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal014", true, 9014, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1500
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal015
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal015", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal015", true, 9015, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1600
     * @tc.name        : testNestedScrollOptionsScrollBackwardHorizontal016
     * @tc.desc        : test NestedScrollOptions scrollBackward horizontal
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal016", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal016", true, 9016, done);
      sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
    })

  })
}
