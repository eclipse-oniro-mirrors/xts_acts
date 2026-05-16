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

export default function webUserAgentMetadata() {

  describe('webUserAgentMetadata', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadata',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webUserAgentMetadata state success " + JSON.stringify(pages));
        if (!("webUserAgentMetadata" == pages.name)) {
          console.info("get webUserAgentMetadata state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webUserAgentMetadata page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webUserAgentMetadata page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webUserAgentMetadata beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webUserAgentMetadata afterEach start");
      console.info("webUserAgentMetadata afterEach end");
      done();
    })

    /**
     * @tc.name   testSetUserAgentMetadata
     * @tc.number SUB_ACE_WEB_SETUSERAGENTMETADATA_API_0100
     * @tc.desc   test setUserAgentMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentMetadata', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentMetadata', 174180);
      Utils.registerBaseEvent('testSetUserAgentMetadata', true, 174190, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentMetadataFirstParamNull
     * @tc.number SUB_ACE_WEB_SETUSERAGENTMETADATA_ERROR_0100
     * @tc.desc   test setUserAgentMetadata first param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentMetadataFirstParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentMetadataFirstParamNull', 174180);
      Utils.registerBaseEvent('testSetUserAgentMetadataFirstParamNull', '401', 174200, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentMetadataFirstParamUndefined
     * @tc.number SUB_ACE_WEB_SETUSERAGENTMETADATA_ERROR_0200
     * @tc.desc   test setUserAgentMetadata first param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentMetadataFirstParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentMetadataFirstParamUndefined', 174180);
      Utils.registerBaseEvent('testSetUserAgentMetadataFirstParamUndefined', '401', 174210, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })
    /**
     * @tc.name   testSetUserAgentMetadataFirstParamEmpty
     * @tc.number SUB_ACE_WEB_SETUSERAGENTMETADATA_EMPTY_PARAMS_0100
     * @tc.desc   test setUserAgentMetadata first param empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUserAgentMetadataFirstParamEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentMetadataFirstParamEmpty', 174180);
      Utils.registerBaseEvent('testSetUserAgentMetadataFirstParamEmpty', 'no_error', 26032507, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentMetadataSecondParamNull
     * @tc.number SUB_ACE_WEB_SETUSERAGENTMETADATA_ERROR_0300
     * @tc.desc   test setUserAgentMetadata second param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentMetadataSecondParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentMetadataSecondParamNull', 174180);
      Utils.registerBaseEvent('testSetUserAgentMetadataSecondParamNull', "no_error", 174220, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentMetadataSecondParamUndefined
     * @tc.number SUB_ACE_WEB_SETUSERAGENTMETADATA_ERROR_0400
     * @tc.desc   test setUserAgentMetadata second param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentMetadataSecondParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentMetadataSecondParamUndefined', 174180);
      Utils.registerBaseEvent('testSetUserAgentMetadataSecondParamUndefined', "no_error", 174230, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })

    /**
     * @tc.name   testGetUserAgentMetadata
     * @tc.number SUB_ACE_WEB_GETUSERAGENTMETADATA_API_0100
     * @tc.desc   test getUserAgentMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUserAgentMetadata', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetUserAgentMetadata', 174180);
      Utils.registerBaseEvent('testGetUserAgentMetadata', true, 174240, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })

    /**
     * @tc.name   testGetUserAgentMetadataParamNull
     * @tc.number SUB_ACE_WEB_GETUSERAGENTMETADATA_ERROR_0100
     * @tc.desc   test getUserAgentMetadata param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUserAgentMetadataParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetUserAgentMetadataParamNull', 174180);
      Utils.registerBaseEvent('testGetUserAgentMetadataParamNull', '401', 174250, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })

    /**
     * @tc.name   testGetUserAgentMetadataParamUndefined
     * @tc.number SUB_ACE_WEB_GETUSERAGENTMETADATA_ERROR_0200
     * @tc.desc   test getUserAgentMetadata param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUserAgentMetadataParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetUserAgentMetadataParamUndefined', 174180);
      Utils.registerBaseEvent('testGetUserAgentMetadataParamUndefined', '401', 174260, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })
    /**
     * @tc.name   testGetUserAgentMetadataParamEmpty
     * @tc.number SUB_ACE_WEB_GETUSERAGENTMETADATA_EMPTY_PARAMS_0100
     * @tc.desc   test getUserAgentMetadata param empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUserAgentMetadataParamEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetUserAgentMetadataParamEmpty', 174180);
      Utils.registerBaseEvent('testGetUserAgentMetadataParamEmpty', 'no_error', 26032508, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataButton', 10, '');
    })

  })
}
