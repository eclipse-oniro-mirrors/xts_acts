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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function webResourceResponseSetResponseMimeTypeParam() {

  describe('webResourceResponseSetResponseMimeTypeParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webResourceResponseSetResponseMimeTypeParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webResourceResponseSetResponseMimeTypeParam state success ' + JSON.stringify(pages));
        if (!('webResourceResponseSetResponseMimeTypeParam' == pages.name)) {
          console.info('get webResourceResponseSetResponseMimeTypeParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webResourceResponseSetResponseMimeTypeParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webResourceResponseSetResponseMimeTypeParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webResourceResponseSetResponseMimeTypeParamButton'), 10000);
      console.log('waitForComponent webResourceResponseSetResponseMimeTypeParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webMessagePortPostMessageEventExtErrorCode beforeEach start');
      done();
    })


    afterEach(async (done: Function) => {
      console.info('webResourceResponseSetResponseMimeTypeParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetResponseMimeTypeNull001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEMIMETYPE_NULL_0100
     * @tc.desc   test WebResourceResponse.setResponseMimeType with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseMimeTypeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseMimeTypeNull001', 174200);
      Utils.registerBaseEvent('testSetResponseMimeTypeNull001', 'success', 174210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseMimeTypeParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseMimeTypeUndefined001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEMIMETYPE_UNDEFINED_0100
     * @tc.desc   test WebResourceResponse.setResponseMimeType with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseMimeTypeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseMimeTypeUndefined001', 174200);
      Utils.registerBaseEvent('testSetResponseMimeTypeUndefined001', 'success', 174220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseMimeTypeParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseMimeTypeEmptyString001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEMIMETYPE_EMPTYSTRING_0100
     * @tc.desc   test WebResourceResponse.setResponseMimeType with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseMimeTypeEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseMimeTypeEmptyString001', 174200);
      Utils.registerBaseEvent('testSetResponseMimeTypeEmptyString001', 'success', 174230, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseMimeTypeParamButton', 10, '');
    })
  })
}
