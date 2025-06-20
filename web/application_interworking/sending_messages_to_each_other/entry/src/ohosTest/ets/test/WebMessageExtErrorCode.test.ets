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

import { beforeAll, beforeEach, afterEach,describe, it, expect,TestType,Size,Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webMessageExtErrorCode() {

  describe('webMessageExtErrorCodeTestSuite', () => {

      let pageName = 'webMessageExtErrorCode'
      beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'testability/pages/' + pageName,
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info(`get ${pageName} state success ` + JSON.stringify(pages));
          if (!(pageName == pages.name)) {
            console.info(`get ${pageName} state success ` + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            await Utils.sleep(2000);
            console.info(`push ${pageName} page success ` + JSON.stringify(result));
          }
        } catch (err) {
          console.error(`push ${pageName} page error: ` + err);
        }
        done()
      });

      beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
          }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        console.info(`${pageName} beforeEach start`);
        done();
      })

      afterEach(async (done: Function) => {
        console.info(`${pageName} afterEach start`);
        await Utils.sleep(2000);
        console.info(`${pageName} afterEach end`);
        done();
      })


    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETSTRING_ERROR_CODE_0100
    * @tc.name       : testWebMessageExtSetStringErrorCode001
    * @tc.desc       : test WebMessageExtSetString error code 17100014
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetStringErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetStringErrorCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetStringErrorCode001", "17100014", 2025032101, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETNUMBER_ERROR_CODE_0100
    * @tc.name       : testWebMessageExtSetNumberErrorCode001
    * @tc.desc       : test WebMessageExtSetNumber error code 17100014
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetNumberErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetNumberErrorCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetNumberErrorCode001", "17100014", 2025032102, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETBOOLEAN_ERROR_CODE_0100
    * @tc.name       : testWebMessageExtSetBooleanErrorCode001
    * @tc.desc       : test WebMessageExtSetBoolean error code 17100014
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetBooleanErrorCode001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetBooleanErrorCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetBooleanErrorCode001", "17100014", 2025032103, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETARRAYBUFFER_ERROR_CODE_0100
    * @tc.name       : testWebMessageExtSetArrayBufferErrorCode001
    * @tc.desc       : test WebMessageExtSetArrayBuffer error code 17100014
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetArrayBufferErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetArrayBufferErrorCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetArrayBufferErrorCode001", "17100014", 2025032104, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETARRAY_ERROR_CODE_0100
    * @tc.name       : testWebMessageExtSetArrayErrorCode001
    * @tc.desc       : test WebMessageExtSetArray error code 17100014
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetArrayErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetArrayErrorCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetArrayErrorCode001", "17100014", 2025032105, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETERROR_ERROR_CODE_0100
    * @tc.name       : testWebMessageExtSetErrorErrorCode001
    * @tc.desc       : test WebMessageExtSetError error code 17100014
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetErrorErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetErrorErrorCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetError002", "17100014", 2025032106, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })



  })
}
