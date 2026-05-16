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

export default function webUserAgentMetadataBrandVersionList() {

  describe('webUserAgentMetadataBrandVersionList', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataBrandVersionList',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataBrandVersionList state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataBrandVersionList" == pages.name)) {
          console.info("get WebUserAgentMetadataBrandVersionList state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataBrandVersionList page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataBrandVersionList page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataBrandVersionListButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataBrandVersionListButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebUserAgentMetadataBrandVersionList beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebUserAgentMetadataBrandVersionList afterEach start");
      done();
    })

    /**
     * @tc.name   testGetBrandVersionListAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_RETURN_0100
     * @tc.desc   test getBrandVersionList returns the value set by setBrandVersionList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBrandVersionListAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListAfterSet', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListAfterSet', 2, 174340, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_RETURN_0200
     * @tc.desc   test getBrandVersionList returns empty array after setting empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListEmpty', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListEmpty', 2, 174350, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_0400
     * @tc.desc   test getBrandVersionList after setting null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListNull', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListNull', '401', 174360, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_0500
     * @tc.desc   test getBrandVersionList after setting undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListUndefined', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListUndefined', '401', 174370, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListMultiple
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_RETURN_0300
     * @tc.desc   test getBrandVersionList returns multiple items correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListMultiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListMultiple', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListMultiple', 2, 174380, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithEmptyBrand
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_0600
     * @tc.desc   test getBrandVersionList with empty brand string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithEmptyBrand', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithEmptyBrand', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithEmptyBrand', 'no_error', 174390, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithNullBrand
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_0700
     * @tc.desc   test getBrandVersionList with null brand string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithNullBrand', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithNullBrand', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithNullBrand', '401', 174400, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithUndefinedBrand
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_0800
     * @tc.desc   test getBrandVersionList with undefined brand string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithUndefinedBrand', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithUndefinedBrand', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithUndefinedBrand', '401', 174410, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithEmptyMajorVersion
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_0900
     * @tc.desc   test getBrandVersionList with empty majorVersion string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithEmptyMajorVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithEmptyMajorVersion', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithEmptyMajorVersion', 'no_error', 174420, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithNullMajorVersion
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_1000
     * @tc.desc   test getBrandVersionList with null majorVersion string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithNullMajorVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithNullMajorVersion', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithNullMajorVersion', '401', 174430, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithUndefinedMajorVersion
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_1100
     * @tc.desc   test getBrandVersionList with undefined majorVersion string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithUndefinedMajorVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithUndefinedMajorVersion', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithUndefinedMajorVersion', '401', 174440, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithEmptyFullVersion
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_1200
     * @tc.desc   test getBrandVersionList with empty fullVersion string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithEmptyFullVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithEmptyFullVersion', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithEmptyFullVersion', 'no_error', 174450, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithNullFullVersion
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_1300
     * @tc.desc   test getBrandVersionList with null fullVersion string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithNullFullVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithNullFullVersion', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithNullFullVersion', '401', 174460, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })

    /**
     * @tc.name   testGetBrandVersionListWithUndefinedFullVersion
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETBRANDVERSIONLIST_ERROR_401_1400
     * @tc.desc   test getBrandVersionList with undefined fullVersion string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBrandVersionListWithUndefinedFullVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetBrandVersionListWithUndefinedFullVersion', 174330);
      Utils.registerBaseEvent('testGetBrandVersionListWithUndefinedFullVersion', '401', 174470, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataBrandVersionListButton', 10, '');
    })
  })
}
