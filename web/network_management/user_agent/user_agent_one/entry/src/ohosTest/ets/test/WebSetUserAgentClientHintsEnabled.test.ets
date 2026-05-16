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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webSetUserAgentClientHintsEnabled() {

  describe('webSetUserAgentClientHintsEnabled', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebSetUserAgentClientHintsEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetUserAgentClientHintsEnabled state success " + JSON.stringify(pages));
        if (!("webSetUserAgentClientHintsEnabled" == pages.name)) {
          console.info("get webSetUserAgentClientHintsEnabled state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webSetUserAgentClientHintsEnabled page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetUserAgentClientHintsEnabled page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebSetUserAgentClientHintsEnabledButton"), 10000);
      console.log("waitForComponent WebSetUserAgentClientHintsEnabledButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webSetUserAgentClientHintsEnabled beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webSetUserAgentClientHintsEnabled afterEach start");
      console.info("webSetUserAgentClientHintsEnabled afterEach end");
      done();
    })

    /**
     * @tc.name   testSetUserAgentClientHintsEnabled
     * @tc.number SUB_ACE_WEB_SETUSERAGENTCLIENTHINTSENABLED_API_0100
     * @tc.desc   test setUserAgentClientHintsEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentClientHintsEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentClientHintsEnabled', 174120);
      Utils.registerBaseEvent('testSetUserAgentClientHintsEnabled', true, 174130, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentClientHintsEnabledFalse
     * @tc.number SUB_ACE_WEB_SETUSERAGENTCLIENTHINTSENABLED_API_0200
     * @tc.desc   test setUserAgentClientHintsEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentClientHintsEnabledFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentClientHintsEnabledFalse', 174120);
      Utils.registerBaseEvent('testSetUserAgentClientHintsEnabledFalse', true, 174131, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentClientHintsEnabledNull
     * @tc.number SUB_ACE_WEB_SETUSERAGENTCLIENTHINTSENABLED_ERROR_0100
     * @tc.desc   test setUserAgentClientHintsEnabled null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentClientHintsEnabledNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentClientHintsEnabledNull', 174120);
      Utils.registerBaseEvent('testSetUserAgentClientHintsEnabledNull', '401', 174140, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentClientHintsEnabledUndefined
     * @tc.number SUB_ACE_WEB_SETUSERAGENTCLIENTHINTSENABLED_ERROR_0200
     * @tc.desc   test setUserAgentClientHintsEnabled undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentClientHintsEnabledUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentClientHintsEnabledUndefined', 174120);
      Utils.registerBaseEvent('testSetUserAgentClientHintsEnabledUndefined', '401', 174150, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
    })

    /**
     * @tc.name   testGetUserAgentClientHintsEnabledTrue
     * @tc.number SUB_ACE_WEB_GETUSERAGENTCLIENTHINTSENABLED_API_0100
     * @tc.desc   test getUserAgentClientHintsEnabled return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUserAgentClientHintsEnabledTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetUserAgentClientHintsEnabledTrue', 174120);
      Utils.registerBaseEvent('testGetUserAgentClientHintsEnabledTrue', true, 174160, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
    })

    /**
     * @tc.name   testGetUserAgentClientHintsEnabledFalse
     * @tc.number SUB_ACE_WEB_GETUSERAGENTCLIENTHINTSENABLED_API_0200
     * @tc.desc   test getUserAgentClientHintsEnabled return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUserAgentClientHintsEnabledFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetUserAgentClientHintsEnabledFalse', 174120);
      Utils.registerBaseEvent('testGetUserAgentClientHintsEnabledFalse', false, 174170, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
    })

  })
}
