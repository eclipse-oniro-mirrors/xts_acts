/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, beforeAll, beforeEach, expect, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function webDownloadItemDeserializeParam() {

  describe('webDownloadItemDeserializeParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webDownloadItemDeserializeParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webDownloadItemDeserializeParam state success ' + JSON.stringify(pages));
        if (!('webDownloadItemDeserializeParam' == pages.name)) {
          console.info('get webDownloadItemDeserializeParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webDownloadItemDeserializeParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webDownloadItemDeserializeParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webDownloadItemDeserializeParamButton'), 10000);
      console.log('waitForComponent webDownloadItemDeserializeParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {

      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webDownloadItemDeserializeParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webDownloadItemDeserializeParam afterEach start');
      done();
    })

    /**
     * @tc.name   testWebDownloadItemDeserializeNull001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_DESERIALIZE_NULL_0100
     * @tc.desc   test WebDownloadItem.deserialize with null serializedData parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadItemDeserializeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitWebDownloadItemDeserializeNull001', 174200);
      Utils.registerBaseEvent('testWebDownloadItemDeserializeNull001', '401', 174210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('webDownloadItemDeserializeParamButton');
    })

    /**
     * @tc.name   testWebDownloadItemDeserializeUndefined001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_DESERIALIZE_UNDEFINED_0100
     * @tc.desc   test WebDownloadItem.deserialize with undefined serializedData parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadItemDeserializeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitWebDownloadItemDeserializeUndefined001', 174200);
      Utils.registerBaseEvent('testWebDownloadItemDeserializeUndefined001', '401', 174220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('webDownloadItemDeserializeParamButton');
    })
  })
}
