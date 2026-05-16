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

export default function webUserAgentMetadataPlatformVersion() {

  describe('webUserAgentMetadataPlatformVersion', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataPlatformVersion',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataPlatformVersion state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataPlatformVersion" == pages.name)) {
          console.info("get WebUserAgentMetadataPlatformVersion state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataPlatformVersion page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataPlatformVersion page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataPlatformVersionButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataPlatformVersionButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataPlatformVersion beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataPlatformVersion afterEach start");
      done();
    })

    /**
     * @tc.name   testGetPlatformVersionAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETPLATFORMVERSION_RETURN_0100
     * @tc.desc   test getPlatformVersion returns value set by setPlatformVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPlatformVersionAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetPlatformVersionAfterSet', 174920);
      Utils.registerBaseEvent('testGetPlatformVersionAfterSet', '24.0.0', 174930, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformVersionButton', 10, '');
    })

    /**
     * @tc.name   testGetPlatformVersionEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETPLATFORMVERSION_RETURN_0200
     * @tc.desc   test getPlatformVersion returns empty string after setting empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPlatformVersionEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetPlatformVersionEmpty', 174920);
      Utils.registerBaseEvent('testGetPlatformVersionEmpty', 'no_error', 174940, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetPlatformVersionNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETPLATFORMVERSION_ERROR_401_0100
     * @tc.desc   test setPlatformVersion with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPlatformVersionNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetPlatformVersionNull', 174920);
      Utils.registerBaseEvent('testSetPlatformVersionNull', '401', 174950, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetPlatformVersionUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETPLATFORMVERSION_ERROR_401_0200
     * @tc.desc   test setPlatformVersion with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPlatformVersionUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetPlatformVersionUndefined', 174920);
      Utils.registerBaseEvent('testSetPlatformVersionUndefined', '401', 174960, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformVersionButton', 10, '');
    })

    /**
     * @tc.name   testGetPlatformVersionLong
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETPLATFORMVERSION_RETURN_0300
     * @tc.desc   test getPlatformVersion returns long version string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPlatformVersionLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetPlatformVersionLong', 174920);
      Utils.registerBaseEvent('testGetPlatformVersionLong', '10.0.0.1900', 174970, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformVersionButton', 10, '');
    })
  })
}
