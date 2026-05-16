/*
 * Copyright (c) 2024-2025 Huawei Huawei Device Co., Ltd.
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

export default function webUserAgentMetadataFormFactors() {

  describe('webUserAgentMetadataFormFactors', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataFormFactors',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataFormFactors state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataFormFactors" == pages.name)) {
          console.info("get WebUserAgentMetadataFormFactors state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataFormFactors page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataFormFactors page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataFormFactorsButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataFormFactorsButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataFormFactors beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataFormFactors afterEach start");
      done();
    })

    /**
     * @tc.name   testGetFormFactorsAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETFORMFACTORS_RETURN_0100
     * @tc.desc   test getFormFactors returns value set by setFormFactors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFormFactorsAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetFormFactorsAfterSet', 174600);
      Utils.registerBaseEvent('testGetFormFactorsAfterSet', 1, 174610, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsButton', 10, '');
    })

    /**
     * @tc.name   testGetFormFactorsEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETFORMFACTORS_RETURN_0200
     * @tc.desc   test getFormFactors returns empty array after setting empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetFormFactorsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetFormFactorsEmpty', 174600);
      Utils.registerBaseEvent('testGetFormFactorsEmpty', 1, 174620, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETFORMFACTORS_ERROR_401_0100
     * @tc.desc   test setFormFactors with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFormFactorsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsNull', 174600);
      Utils.registerBaseEvent('testSetFormFactorsNull', '401', 174630, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETFORMFACTORS_ERROR_401_0200
     * @tc.desc   test setFormFactors with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFormFactorsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsUndefined', 174600);
      Utils.registerBaseEvent('testSetFormFactorsUndefined', '401', 174640, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsButton', 10, '');
    })

    /**
     * @tc.name   testGetFormFactorsMultiple
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETFORMFACTORS_RETURN_0300
     * @tc.desc   test getFormFactors returns multiple form factors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetFormFactorsMultiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetFormFactorsMultiple', 174600);
      Utils.registerBaseEvent('testGetFormFactorsMultiple', 2, 174650, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsButton', 10, '');
    })

    /**
     * @tc.name   testGetFormFactorsAutomotive
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETFORMFACTORS_RETURN_0400
     * @tc.desc   test getFormFactors returns AUTOMOTIVE form factor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetFormFactorsAutomotive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetFormFactorsAutomotive', 174600);
      Utils.registerBaseEvent('testGetFormFactorsAutomotive', 1, 174660, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsButton', 10, '');
    })

    /**
     * @tc.name   testGetFormFactorsDesktop
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETFORMFACTORS_RETURN_0500
     * @tc.desc   test getFormFactors returns DESKTOP form factor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetFormFactorsDesktop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetFormFactorsDesktop', 174600);
      Utils.registerBaseEvent('testGetFormFactorsDesktop', 1, 174670, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsButton', 10, '');
    })
  })
}
