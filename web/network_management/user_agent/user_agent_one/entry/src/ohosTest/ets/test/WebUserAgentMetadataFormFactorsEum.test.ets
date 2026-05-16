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

export default function webUserAgentMetadataFormFactorsEum() {

  describe('webUserAgentMetadataFormFactorsEum', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataFormFactorsEum',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webUserAgentMetadataFormFactorsEum state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataFormFactorsEum" == pages.name)) {
          console.info("get webUserAgentMetadataFormFactorsEum state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webUserAgentMetadataFormFactorsEum page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webUserAgentMetadataFormFactorsEum page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataFormFactorsEumButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataFormFactorsEumButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webUserAgentMetadataFormFactorsEum beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webUserAgentMetadataFormFactorsEum afterEach start");
      done();
    })

    /**
     * @tc.name   testSetFormFactorsAutomotive
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_AUTOMOTIVE_0100
     * @tc.desc   test setFormFactors with AUTOMOTIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFormFactorsAutomotive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsAutomotive', 175030);
      Utils.registerBaseEvent('testSetFormFactorsAutomotive', true, 175040, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsDesktop
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_DESKTOP_0100
     * @tc.desc   test setFormFactors with DESKTOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFormFactorsDesktop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsDesktop', 175030);
      Utils.registerBaseEvent('testSetFormFactorsDesktop', true, 175050, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsMobile
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_MOBILE_0100
     * @tc.desc   test setFormFactors with MOBILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFormFactorsMobile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsMobile', 175030);
      Utils.registerBaseEvent('testSetFormFactorsMobile', true, 175060, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsEInk
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_EINK_0100
     * @tc.desc   test setFormFactors with EINK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFormFactorsEInk', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsEInk', 175030);
      Utils.registerBaseEvent('testSetFormFactorsEInk', true, 175070, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsTablet
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_TABLET_0100
     * @tc.desc   test setFormFactors with TABLET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFormFactorsTablet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsTablet', 175030);
      Utils.registerBaseEvent('testSetFormFactorsTablet', true, 175080, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsWatch
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_WATCH_0100
     * @tc.desc   test setFormFactors with WATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFormFactorsWatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsWatch', 175030);
      Utils.registerBaseEvent('testSetFormFactorsWatch', true, 175090, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsXR
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_XR_0100
     * @tc.desc   test setFormFactors with XR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFormFactorsXR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsXR', 175030);
      Utils.registerBaseEvent('testSetFormFactorsXR', true, 175100, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsMultiple
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_MULTIPLE_0100
     * @tc.desc   test setFormFactors with multiple form factors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFormFactorsMultiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsMultiple', 175030);
      Utils.registerBaseEvent('testSetFormFactorsMultiple', true, 175110, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_EMPTY_0100
     * @tc.desc   test setFormFactors with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFormFactorsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsEmpty', 175030);
      Utils.registerBaseEvent('testSetFormFactorsEmpty', 1, 175120, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsNull
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_ERROR_401_0100
     * @tc.desc   test setFormFactors with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFormFactorsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsNull', 175030);
      Utils.registerBaseEvent('testSetFormFactorsNull', '401', 175130, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })

    /**
     * @tc.name   testSetFormFactorsUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTFORMFACTOR_SETFORMFACTORS_ERROR_401_0200
     * @tc.desc   test setFormFactors with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFormFactorsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFormFactorsUndefined', 175030);
      Utils.registerBaseEvent('testSetFormFactorsUndefined', '401', 175140, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataFormFactorsEumButton', 10, '');
    })
  })
}
