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
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webSetUserAgentForHosts() {

  describe('webSetUserAgentForHosts', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebSetUserAgentForHosts',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetUserAgentForHosts state success " + JSON.stringify(pages));
        if (!("webSetUserAgentForHosts" == pages.name)) {
          console.info("get webSetUserAgentForHosts state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webSetUserAgentForHosts page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetUserAgentForHosts page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebSetUserAgentForHostsButton"),10000);
      console.log("waitForComponent WebSetUserAgentForHostsButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webSetUserAgentForHosts beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webSetUserAgentForHosts afterEach start");
      console.info("webSetUserAgentForHosts afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETUSERAGENTFORHOSTS_OVERRANGE_0100
    * @tc.name       : testSetUserAgentForHostsOverRange
    * @tc.desc       : test setUserAgentForHosts overRange
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetUserAgentForHostsOverRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsOverRange', 174050);
      Utils.registerBaseEvent('testSetUserAgentForHostsOverRange', false, 174060, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentForHostsButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_SETUSERAGENTFORHOSTS_API_0100
    * @tc.name       : testSetUserAgentForHosts
    * @tc.desc       : test setUserAgentForHosts
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetUserAgentForHosts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHosts', 174050);
      Utils.registerBaseEvent('testSetUserAgentForHostsOverRange', true, 174070, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentForHostsButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_SETUSERAGENTFORHOSTS_ERROR_0100
    * @tc.name       : testSetUserAgentForHostsFirstParamNull
    * @tc.desc       : test setUserAgentForHosts first param null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetUserAgentForHostsFirstParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsFirstParamNull', 174050);
      Utils.registerBaseEvent('testSetUserAgentForHostsFirstParamNull', '401', 174080, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentForHostsButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_SETUSERAGENTFORHOSTS_ERROR_0200
    * @tc.name       : testSetUserAgentForHostsFirstParamUndefined
    * @tc.desc       : test setUserAgentForHosts first param undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetUserAgentForHostsFirstParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsFirstParamUndefined', 174050);
      Utils.registerBaseEvent('testSetUserAgentForHostsFirstParamUndefined', '401', 174090, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentForHostsButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_SETUSERAGENTFORHOSTS_ERROR_0300
    * @tc.name       : testSetUserAgentForHostsSecondParamNull
    * @tc.desc       : test setUserAgentForHosts second param null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetUserAgentForHostsSecondParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsSecondParamNull', 174050);
      Utils.registerBaseEvent('testSetUserAgentForHostsSecondParamNull', '401', 174100, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentForHostsButton', 10, '');
    })
    /*
    * @tc.number     : SUB_ACE_WEB_SETUSERAGENTFORHOSTS_ERROR_0400
    * @tc.name       : testSetUserAgentForHostsSecondParamUndefined
    * @tc.desc       : test setUserAgentForHosts first param undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetUserAgentForHostsSecondParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsSecondParamUndefined', 174050);
      Utils.registerBaseEvent('testSetUserAgentForHostsSecondParamUndefined', '401', 174110, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentForHostsButton', 10, '');
    })


  })
}
