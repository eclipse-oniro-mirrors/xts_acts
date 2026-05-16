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

export default function webUserAgentMetadataWow64() {

  describe('webUserAgentMetadataWow64', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataWow64',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataWow64 state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataWow64" == pages.name)) {
          console.info("get WebUserAgentMetadataWow64 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataWow64 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataWow64 page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataWow64Button"), 10000);
      console.log("waitForComponent WebUserAgentMetadataWow64Button==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataWow64 beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataWow64 afterEach start");
      done();
    })

    /**
     * @tc.name   testGetWow64AfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETWOW64_RETURN_0100
     * @tc.desc   test getWow64 returns value set by setWow64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWow64AfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetWow64AfterSet', 174980);
      Utils.registerBaseEvent('testGetWow64AfterSet', true, 174990, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataWow64Button', 10, '');
    })

    /**
     * @tc.name   testGetWow64False
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETWOW64_RETURN_0200
     * @tc.desc   test getWow64 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetWow64False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetWow64False', 174980);
      Utils.registerBaseEvent('testGetWow64False', false, 175000, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataWow64Button', 10, '');
    })

    /**
     * @tc.name   testSetWow64Null
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETWOW64_ERROR_401_0100
     * @tc.desc   test setWow64 with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWow64Null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetWow64Null', 174980);
      Utils.registerBaseEvent('testSetWow64Null', '401', 175010, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataWow64Button', 10, '');
    })

    /**
     * @tc.name   testSetWow64Undefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETWOW64_ERROR_401_0200
     * @tc.desc   test setWow64 with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWow64Undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetWow64Undefined', 174980);
      Utils.registerBaseEvent('testSetWow64Undefined', '401', 175020, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataWow64Button', 10, '');
    })
  })
}
