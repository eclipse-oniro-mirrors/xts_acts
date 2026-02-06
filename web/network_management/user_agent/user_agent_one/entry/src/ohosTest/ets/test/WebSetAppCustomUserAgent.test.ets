/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webSetAppCustomUserAgent() {

  describe('webSetAppCustomUserAgent', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebSetAppCustomUserAgent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetAppCustomUserAgent state success " + JSON.stringify(pages));
        if (!("webSetAppCustomUserAgent" == pages.name)) {
          console.info("get webSetAppCustomUserAgent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webSetAppCustomUserAgent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetAppCustomUserAgent page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebSetAppCustomUserAgentButton"),10000);
      console.log("waitForComponent WebSetAppCustomUserAgentButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webSetAppCustomUserAgent beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webSetAppCustomUserAgent afterEach start");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETAPPCUSTOMUSERAGENT_API_0100
    * @tc.name       : testSetAppCustomUserAgent
    * @tc.desc       : test setAppCustomUserAgent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetAppCustomUserAgent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetAppCustomUserAgent', 174010);
      Utils.registerBaseEvent('testSetAppCustomUserAgent', true, 174020, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetAppCustomUserAgentButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_SETAPPCUSTOMUSERAGENT_ERROR_0100
    * @tc.name       : testSetAppCustomUserAgentNull
    * @tc.desc       : test setAppCustomUserAgent null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetAppCustomUserAgentNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetAppCustomUserAgentNull', 174010);
      Utils.registerBaseEvent('testSetAppCustomUserAgentNull', '401', 174030, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetAppCustomUserAgentButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_SETAPPCUSTOMUSERAGENT_ERROR_0200
    * @tc.name       : testSetAppCustomUserAgentUndefined
    * @tc.desc       : test setAppCustomUserAgent undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetAppCustomUserAgentUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetAppCustomUserAgentUndefined', 174010);
      Utils.registerBaseEvent('testSetAppCustomUserAgentUndefined', '401', 174040, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetAppCustomUserAgentButton', 10, '');
    })

  })
}
