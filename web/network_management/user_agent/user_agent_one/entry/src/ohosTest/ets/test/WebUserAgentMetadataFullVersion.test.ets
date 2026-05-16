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

export default function webUserAgentMetadataFullVersion() {

  describe('webUserAgentMetadataFullVersion', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataFullVersion',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataFullVersion state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataFullVersion" == pages.name)) {
          console.info("get WebUserAgentMetadataFullVersion state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataFullVersion page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataFullVersion page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataFullVersionButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataFullVersionButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataFullVersion beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataFullVersion afterEach start");
      done();
    })

    /**
     * @tc.name   testGetFullVersionAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETFULLVERSION_RETURN_0100
     * @tc.desc   test getFullVersion returns value set by setFullVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFullVersionAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetFullVersionAfterSet', 174680);
      Utils.registerBaseEvent('testGetFullVersionAfterSet', '1.0.0.0', 174690, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFullVersionButton', 10, '');
    })

    /**
     * @tc.name   testGetFullVersionEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETFULLVERSION_RETURN_0200
     * @tc.desc   test getFullVersion returns empty string after setting empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetFullVersionEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetFullVersionEmpty', 174680);
      Utils.registerBaseEvent('testGetFullVersionEmpty', '', 174700, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFullVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetFullVersionNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETFULLVERSION_ERROR_401_0100
     * @tc.desc   test setFullVersion with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFullVersionNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFullVersionNull', 174680);
      Utils.registerBaseEvent('testSetFullVersionNull', '401', 174710, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFullVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetFullVersionUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETFULLVERSION_ERROR_401_0200
     * @tc.desc   test setFullVersion with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFullVersionUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFullVersionUndefined', 174680);
      Utils.registerBaseEvent('testSetFullVersionUndefined', '401', 174720, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFullVersionButton', 10, '');
    })

    /**
     * @tc.name   testGetFullVersionLong
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETFULLVERSION_RETURN_0300
     * @tc.desc   test getFullVersion returns long version string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetFullVersionLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetFullVersionLong', 174680);
      Utils.registerBaseEvent('testGetFullVersionLong', '99.99.99.99', 174730, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFullVersionButton', 10, '');
    })
  })
}
