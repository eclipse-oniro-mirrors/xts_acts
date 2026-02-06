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

import { beforeAll, beforeEach,afterEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();
export default function WebAttributeEnhancedTest() {

  describe('WebAttributeEnhancedTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeEnhancedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeEnhancedTest state success " + JSON.stringify(pages));
        if (!("WebAttributeEnhancedTest" == pages.name)) {
          console.info("get WebAttributeEnhancedTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebAttributeEnhancedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeEnhancedTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebAttributeEnhancedTestButton"),10000);
      console.log("waitForComponent WebAttributeEnhancedTestButton click==>")
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebAttributeEnhancedTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebAttributeEnhancedTest afterEach start");
      console.info("WebAttributeEnhancedTest afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_ONLOADSTARTED_API_0100
    * @tc.name       : testOnLoadStarted001
    * @tc.desc       : test onLoadStarted rawfile
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnLoadStarted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnLoadStarted001', 133);
      Utils.registerBaseEvent('testOnLoadStarted001', 1, 2025071701, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebAttributeEnhancedTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_ONLOADSTARTED_API_0200
    * @tc.name       : testOnLoadStarted002
    * @tc.desc       : test onLoadStarted https url
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnLoadStarted002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnLoadStarted002', 133);
      Utils.registerBaseEvent('testOnLoadStarted002', 1, 2025071702, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebAttributeEnhancedTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_ONLOADSTARTED_API_0300
    * @tc.name       : testOnLoadStarted003
    * @tc.desc       : test onLoadStarted anchor page
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnLoadStarted003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnLoadStarted003', 133);
      Utils.registerBaseEvent('testOnLoadStarted003', -1, 2025071703, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebAttributeEnhancedTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_ONLOADFINISHED_API_0100
    * @tc.name       : testOnLoadFinished001
    * @tc.desc       : test onLoadFinished rawfile
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnLoadFinished001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnLoadFinished001', 133);
      Utils.registerBaseEvent('testOnLoadFinished001', 1, 2025071704, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebAttributeEnhancedTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_ONLOADFINISHED_API_0200
    * @tc.name       : testOnLoadFinished002
    * @tc.desc       : test onLoadFinished https url
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnLoadFinished002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnLoadFinished002', 133);
      Utils.registerBaseEvent('testOnLoadFinished002', 1, 2025071705, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebAttributeEnhancedTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_ONLOADFINISHED_API_0300
    * @tc.name       : testOnLoadFinished003
    * @tc.desc       : test onLoadFinished anchor page
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnLoadFinished003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnLoadFinished003', 133);
      Utils.registerBaseEvent('testOnLoadFinished003', 1, 2025071706, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebAttributeEnhancedTestButton', 10, '');
    })

  })
}
