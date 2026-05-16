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

export default function webUserAgentMetadataModel() {

  describe('webUserAgentMetadataModel', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentMetadataModel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebUserAgentMetadataModel state success " + JSON.stringify(pages));
        if (!("WebUserAgentMetadataModel" == pages.name)) {
          console.info("get WebUserAgentMetadataModel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebUserAgentMetadataModel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebUserAgentMetadataModel page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentMetadataModelButton"), 10000);
      console.log("waitForComponent WebUserAgentMetadataModelButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webTestUserAgentMetadataModel beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webTestUserAgentMetadataModel afterEach start");
      done();
    })

    /**
     * @tc.name   testGetModelAfterSet
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETMODEL_RETURN_0100
     * @tc.desc   test getModel returns value set by setModel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetModelAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetModelAfterSet', 174790);
      Utils.registerBaseEvent('testGetModelAfterSet', 'OpenHarmony Device', 174800, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataModelButton', 10, '');
    })

    /**
     * @tc.name   testGetModelEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETMODEL_RETURN_0200
     * @tc.desc   test getModel returns empty string after setting empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetModelEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetModelEmpty', 174790);
      Utils.registerBaseEvent('testGetModelEmpty', 'no_error', 174810, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataModelButton', 10, '');
    })

    /**
     * @tc.name   testSetModelNull
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETMODEL_ERROR_401_0100
     * @tc.desc   test setModel with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetModelNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetModelNull', 174790);
      Utils.registerBaseEvent('testSetModelNull', '401', 174820, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataModelButton', 10, '');
    })

    /**
     * @tc.name   testSetModelUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_SETMODEL_ERROR_401_0200
     * @tc.desc   test setModel with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetModelUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetModelUndefined', 174790);
      Utils.registerBaseEvent('testSetModelUndefined', '401', 174830, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataModelButton', 10, '');
    })

    /**
     * @tc.name   testGetModelLong
     * @tc.number SUB_ACE_WEB_USERAGENTMETADATA_GETMODEL_RETURN_0300
     * @tc.desc   test getModel returns long model string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetModelLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetModelLong', 174790);
      Utils.registerBaseEvent('testGetModelLong', 'OpenHarmony Device Model 123456789', 174840, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentMetadataModelButton', 10, '');
    })
  })
}
