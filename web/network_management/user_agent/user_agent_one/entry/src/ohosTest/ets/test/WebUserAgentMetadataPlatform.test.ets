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

export default function webUserAgentMetadataPlatform() {

  describe('webUserAgentMetadataPlatform', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataPlatform',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataPlatform state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadata" == pages.name)) {
          console.info("get WebUserAgentMetadataPlatform state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataPlatform page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataPlatform page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataPlatformButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataPlatformButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataPlatform beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataPlatform afterEach start");
      done();
    })

    /**
     * @tc.name   testGetPlatformAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETPLATFORM_RETURN_0100
     * @tc.desc   test getPlatform returns value set by setPlatform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPlatformAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetPlatformAfterSet', 174850);
      Utils.registerBaseEvent('testGetPlatformAfterSet', 'OpenHarmony', 174860, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformButton', 10, '');
    })

    /**
     * @tc.name   testGetPlatformEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETPLATFORM_RETURN_0200
     * @tc.desc   test getPlatform returns empty string after setting empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPlatformEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetPlatformEmpty', 174850);
      Utils.registerBaseEvent('testGetPlatformEmpty', true, 174870, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformButton', 10, '');
    })

    /**
     * @tc.name   testSetPlatformNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETPLATFORM_ERROR_401_0100
     * @tc.desc   test setPlatform with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPlatformNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetPlatformNull', 174850);
      Utils.registerBaseEvent('testSetPlatformNull', '401', 174880, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformButton', 10, '');
    })

    /**
     * @tc.name   testSetPlatformUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETPLATFORM_ERROR_401_0200
     * @tc.desc   test setPlatform with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPlatformUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetPlatformUndefined', 174850);
      Utils.registerBaseEvent('testSetPlatformUndefined', '401', 174890, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformButton', 10, '');
    })
    /**
     * @tc.name   testSetPlatformEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETPLATFORM_EMPTY_0100
     * @tc.desc   test setPlatform with EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPlatformEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetPlatformEmpty', 174850);
      Utils.registerBaseEvent('testSetPlatformEmpty', 'no_error', 26032509, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformButton', 10, '');
    })

    /**
     * @tc.name   testGetPlatformWindows
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETPLATFORM_RETURN_0300
     * @tc.desc   test getPlatform returns Windows platform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPlatformWindows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetPlatformWindows', 174850);
      Utils.registerBaseEvent('testGetPlatformWindows', 'Windows', 174900, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformButton', 10, '');
    })

    /**
     * @tc.name   testGetPlatformLinux
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETPLATFORM_RETURN_0400
     * @tc.desc   test getPlatform returns Linux platform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPlatformLinux', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetPlatformLinux', 174850);
      Utils.registerBaseEvent('testGetPlatformLinux', 'Linux', 174910, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataPlatformButton', 10, '');
    })
  })
}
