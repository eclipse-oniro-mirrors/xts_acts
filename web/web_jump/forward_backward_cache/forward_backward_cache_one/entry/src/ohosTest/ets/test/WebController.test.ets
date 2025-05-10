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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webController() {

  describe('WebControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webController state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webController page error: " + err);
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
      console.info("webController beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSBACKWARD_0100
    * @tc.name       : testAccessBackward001
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessBackward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward001", false, 31011, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0100
    * @tc.name       : testAccessStep001
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessStep001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep001", false, 31015, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0200
    * @tc.name       : testAccessStep002
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessStep002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep002", true, 100089, done);
      sendEventByKey('WebControllerButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0300
    * @tc.name       : testAccessStep003
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessStep003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep003", false, 100090, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0400
    * @tc.name       : testAccessStep004
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessStep004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep004", true, 100091, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0500
    * @tc.name       : testAccessStep005
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessStep005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep005", false, 100092, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0600
    * @tc.name       : testAccessStep006
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessStep006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep006", true, 100093, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0700
    * @tc.name       : testAccessStep007
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessStep007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep007", false, 100094, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0800
    * @tc.name       : testAccessStep008
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessStep008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep008", true, 100095, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSBACKWARD_0200
    * @tc.name       : testAccessBackward002
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessBackward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward002", true, 31012, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSBACKWARD_0300
    * @tc.name       : testAccessBackward003
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessBackward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward003", false, 200006, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSBACKWARD_0400
    * @tc.name       : testAccessBackward004
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessBackward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward004", true, 200007, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSFORWARD_0100
    * @tc.name       : testAccessForward001
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward001", false, 31013, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSFORWARD_0200
    * @tc.name       : testAccessForward002
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward002", true, 31014, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSFORWARD_0300
    * @tc.name       : testAccessForward003
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward003", false, 200008, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSFORWARD_0400
    * @tc.name       : testAccessForward004
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testAccessForward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward004", true, 200009, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKWARD_0100
    * @tc.name       : testBackward001
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testBackward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward001", "\"index\"", 31016, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKWARD_0200
    * @tc.name       : testBackward002
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testBackward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward001", "\"index\"", 200010, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKWARD_0300
    * @tc.name       : testBackward003
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testBackward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward003", "\"second\"", 200011, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FORWARD_0100
    * @tc.name       : testForward001
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward001", true, 31017, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FORWARD_0200
    * @tc.name       : testForward002
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward002", '"LoadData"', 100087, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FORWARD_0300
    * @tc.name       : testForward003
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward003", '"index"', 100088, done);
      sendEventByKey('WebControllerButton', 10, '');
    })


  })
}
