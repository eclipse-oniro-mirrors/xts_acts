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

export default function webUserAgentMetadataArch() {

  describe('webUserAgentMetadataArch', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataArch',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataArch state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataArch" == pages.name)) {
          console.info("get WebUserAgentMetadataArch state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataArch page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataArch page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataArchButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataArchButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataArch beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataArch afterEach start");
      done();
    })

    /**
     * @tc.name   testGetArchitectureAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETARCHITECTURE_RETURN_0100
     * @tc.desc   test getArchitecture returns value set by setArchitecture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetArchitectureAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetArchitectureAfterSet', 174480);
      Utils.registerBaseEvent('testGetArchitectureAfterSet', 'x86_64', 174490, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataArchButton', 10, '');
    })

    /**
     * @tc.name   testGetArchitectureEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETARCHITECTURE_RETURN_0200
     * @tc.desc   test getArchitecture returns empty string after setting empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetArchitectureEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetArchitectureEmpty', 174480);
      Utils.registerBaseEvent('testGetArchitectureEmpty', '', 174500, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataArchButton', 10, '');
    })

    /**
     * @tc.name   testSetArchitectureNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETARCHITECTURE_ERROR_401_0100
     * @tc.desc   test setArchitecture with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetArchitectureNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetArchitectureNull', 174480);
      Utils.registerBaseEvent('testSetArchitectureNull', '401', 174510, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataArchButton', 10, '');
    })

    /**
     * @tc.name   testSetArchitectureUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETARCHITECTURE_ERROR_401_0200
     * @tc.desc   test setArchitecture with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetArchitectureUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetArchitectureUndefined', 174480);
      Utils.registerBaseEvent('testSetArchitectureUndefined', '401', 174520, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataArchButton', 10, '');
    })

    /**
     * @tc.name   testGetArchitectureArm64
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETARCHITECTURE_RETURN_0300
     * @tc.desc   test getArchitecture returns ARM64 architecture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetArchitectureArm64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetArchitectureArm64', 174480);
      Utils.registerBaseEvent('testGetArchitectureArm64', 'ARM64', 174530, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataArchButton', 10, '');
    })
  })
}
