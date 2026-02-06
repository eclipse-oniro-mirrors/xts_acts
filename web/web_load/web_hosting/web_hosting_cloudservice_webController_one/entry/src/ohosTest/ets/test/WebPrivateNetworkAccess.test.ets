/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach,afterEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webPrivateNetworkAccessTest() {

  describe('webPrivateNetworkAccessTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebPrivateNetworkAccess',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebPrivateNetworkAccess state success ' + JSON.stringify(pages));
        if (!('WebPrivateNetworkAccess' == pages.name)) {
          console.info('get WebPrivateNetworkAccess state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebPrivateNetworkAccess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebPrivateNetworkAccess page error: ' + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebPrivateNetworkAccessButton'),10000);
      console.log('waitForComponent WebPrivateNetworkAccessButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebPrivateNetworkAccess beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebPrivateNetworkAccess afterEach start');
      done();
    })

    /**
     * @tc.name   testPrivateNetworkAccess01
     * @tc.number SUB_ACE_WEB_PRIVATENETWORKACCESS_API_0001
     * @tc.desc   test enablePrivateNetworkAccess true isPrivateNetworkAccessEnabled true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrivateNetworkAccess01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitPrivateNetworkAccess01', 21);
      Utils.registerBaseEvent('testPrivateNetworkAccess01', true, 2025081409, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrivateNetworkAccessButton', 10, '');
    })
    /**
     * @tc.name   testPrivateNetworkAccess02
     * @tc.number SUB_ACE_WEB_PRIVATENETWORKACCESS_API_0002
     * @tc.desc   test enablePrivateNetworkAccess false isPrivateNetworkAccessEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrivateNetworkAccess02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitPrivateNetworkAccess02', 21);
      Utils.registerBaseEvent('testPrivateNetworkAccess02', false, 2025081410, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrivateNetworkAccessButton', 10, '');
    })
    /**
     * @tc.name   testPrivateNetworkAccessErrorCode01
     * @tc.number SUB_ACE_WEB_PRIVATENETWORKACCESS_API_0003
     * @tc.desc   test enablePrivateNetworkAccess null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrivateNetworkAccessErrorCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitPrivateNetworkAccessErrorCode01', 21);
      Utils.registerBaseEvent('testPrivateNetworkAccessErrorCode01', 401, 2025081411, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrivateNetworkAccessButton', 10, '');
    })
    /**
     * @tc.name   testPrivateNetworkAccessErrorCode02
     * @tc.number SUB_ACE_WEB_PRIVATENETWORKACCESS_API_0004
     * @tc.desc   test enablePrivateNetworkAccess undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrivateNetworkAccessErrorCode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitPrivateNetworkAccessErrorCode02', 21);
      Utils.registerBaseEvent('testPrivateNetworkAccessErrorCode02', 401, 2025081412, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrivateNetworkAccessButton', 10, '');
    })

  })
}
