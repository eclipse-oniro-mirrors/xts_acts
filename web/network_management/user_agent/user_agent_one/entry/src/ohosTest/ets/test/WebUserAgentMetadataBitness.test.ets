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

export default function webUserAgentMetadataBitness() {

  describe('webUserAgentMetadataBitness', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataBitness',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataBitness state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataBitness" == pages.name)) {
          console.info("get WebUserAgentMetadataBitness state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataBitness page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataBitness page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataBitnessButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataBitnessButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataBitness beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataBitness afterEach start");
      done();
    })

    /**
     * @tc.name   testGetBitnessAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBITNESS_RETURN_0100
     * @tc.desc   test getBitness returns value set by setBitness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBitnessAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetBitnessAfterSet', 174540);
      Utils.registerBaseEvent('testGetBitnessAfterSet', '64', 174550, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBitnessButton', 10, '');
    })

    /**
     * @tc.name   testGetBitnessEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBITNESS_RETURN_0200
     * @tc.desc   test getBitness returns empty string after setting empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBitnessEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBitnessEmpty', 174540);
      Utils.registerBaseEvent('testGetBitnessEmpty', '', 174560, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBitnessButton', 10, '');
    })

    /**
     * @tc.name   testSetBitnessNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETBITNESS_ERROR_401_0100
     * @tc.desc   test setBitness with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetBitnessNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetBitnessNull', 174540);
      Utils.registerBaseEvent('testSetBitnessNull', '401', 174570, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBitnessButton', 10, '');
    })

    /**
     * @tc.name   testSetBitnessUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETBITNESS_ERROR_401_0200
     * @tc.desc   test setBitness with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetBitnessUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetBitnessUndefined', 174540);
      Utils.registerBaseEvent('testSetBitnessUndefined', '401', 174580, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBitnessButton', 10, '');
    })

    /**
     * @tc.name   testGetBitness32
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBITNESS_RETURN_0300
     * @tc.desc   test getBitness returns 32-bit architecture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBitness32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBitness32', 174540);
      Utils.registerBaseEvent('testGetBitness32', '32', 174590, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBitnessButton', 10, '');
    })
  })
}
