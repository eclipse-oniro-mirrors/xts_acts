/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for  specific language governing permissions and
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

export default function webUserAgentMetadataMobile() {

  describe('webUserAgentMetadataMobile', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataMobile',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataMobile state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataMobile" == pages.name)) {
          console.info("get WebUserAgentMetadataMobile state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataMobile page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataMobile page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataMobileButton"), 10000);
      console.log("waitForComponent WWebUserAgentMetadataMobileButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataMobile beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataMobile afterEach start");
      done();
    })

    /**
     * @tc.name   testGetMobileAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETMOBILE_RETURN_0100
     * @tc.desc   test getMobile returns value set by setMobile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMobileAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetMobileAfterSet', 174740);
      Utils.registerBaseEvent('testGetMobileAfterSet', true, 174750, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataMobileButton', 10, '');
    })

    /**
     * @tc.name   testGetMobileFalse
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETMOBILE_RETURN_0200
     * @tc.desc   test getMobile returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMobileFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetMobileFalse', 174740);
      Utils.registerBaseEvent('testGetMobileFalse', false, 174760, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataMobileButton', 10, '');
    })

    /**
     * @tc.name   testSetMobileNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETMOBILE_ERROR_401_0100
     * @tc.desc   test setMobile with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMobileNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetMobileNull', 174740);
      Utils.registerBaseEvent('testSetMobileNull', '401', 174770, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataMobileButton', 10, '');
    })

    /**
     * @tc.name   testSetMobileUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETMOBILE_ERROR_401_0200
     * @tc.desc   test setMobile with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMobileUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetMobileUndefined', 174740);
      Utils.registerBaseEvent('testSetMobileUndefined', '401', 174780, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataMobileButton', 10, '');
    })
  })
}
