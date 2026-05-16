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

export default function webviewControllerLoadDataParam() {

  describe('webviewControllerLoadDataParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerLoadDataParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerLoadDataParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerLoadDataParam' == pages.name)) {
          console.info('get webviewControllerLoadDataParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerLoadDataParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerLoadDataParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerLoadDataParamButton'), 10000);
      console.log('waitForComponent webviewControllerLoadDataParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerLoadDataParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerLoadDataParam afterEach start');
      done();
    })

    /**
     * @tc.name   testLoadDataDataNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADDATA_DATA_NULL_0100
     * @tc.desc   test WebviewController.loadData with null data parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadDataDataNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitLoadDataDataNull001', 182000);
      Utils.registerBaseEvent('testLoadDataDataNull001', '401', 182010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('webviewControllerLoadDataParamButton');
    })

    /**
     * @tc.name   testLoadDataDataUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADDATA_DATA_UNDEFINED_0100
     * @tc.desc   test WebviewController.loadData with undefined data parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadDataDataUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitLoadDataDataUndefined001', 182000);
      Utils.registerBaseEvent('testLoadDataDataUndefined001', '401', 182020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('webviewControllerLoadDataParamButton');
    })

    /**
     * @tc.name   testLoadDataMimeTypeNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADDATA_MIMETYPE_NULL_0100
     * @tc.desc   test WebviewController.loadData with null mimeType parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadDataMimeTypeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitLoadDataMimeTypeNull001', 182000);
      Utils.registerBaseEvent('testLoadDataMimeTypeNull001', '401', 182030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('webviewControllerLoadDataParamButton');
    })

    /**
     * @tc.name   testLoadDataMimeTypeUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADDATA_MIMETYPE_UNDEFINED_0100
     * @tc.desc   test WebviewController.loadData with undefined mimeType parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadDataMimeTypeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitLoadDataMimeTypeUndefined001', 182000);
      Utils.registerBaseEvent('testLoadDataMimeTypeUndefined001', '401', 182040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('webviewControllerLoadDataParamButton');
    })

    /**
     * @tc.name   testLoadDataEncodingNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADDATA_ENCODING_NULL_0100
     * @tc.desc   test WebviewController.loadData with null encoding parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadDataEncodingNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitLoadDataEncodingNull001', 182000);
      Utils.registerBaseEvent('testLoadDataEncodingNull001', '401', 182050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('webviewControllerLoadDataParamButton');
    })

    /**
     * @tc.name   testLoadDataEncodingUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADDATA_ENCODING_UNDEFINED_0100
     * @tc.desc   test WebviewController.loadData with undefined encoding parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadDataEncodingUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitLoadDataEncodingUndefined001', 182000);
      Utils.registerBaseEvent('testLoadDataEncodingUndefined001', '401', 182060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('webviewControllerLoadDataParamButton');
    })
  })
}
