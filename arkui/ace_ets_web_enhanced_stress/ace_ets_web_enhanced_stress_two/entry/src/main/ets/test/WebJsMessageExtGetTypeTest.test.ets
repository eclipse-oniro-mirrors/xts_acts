/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import { Constants } from './Constants';
import Utils from './Utils';
import router from '@ohos.router';

export default function webJsMessageExtGetTypeTest() {

  describe('WebJsMessageExtGetTypeTest', () => {
    let pageName = 'WebJsMessageExtGetTypeTest'
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/' + pageName,
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
    * @tc.number      : SUB_WEB_STRESS_WEB_JSMESSAGEEXT_GETTYPE_0100
    * @tc.name        : testJsMessageExtGetType001
    * @tc.desc        : test getString stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsMessageExtGetType001', 0, async (done: Function) => {
      Utils.doIt("testJsMessageExtGetType001", 120031, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_JSMESSAGEEXT_GETTYPE_0200
    * @tc.name        : testJsMessageExtGetType002
    * @tc.desc        : test getString stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsMessageExtGetType002', 0, async (done: Function) => {
      Utils.doIt("testJsMessageExtGetType002", 120032, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });


    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_JSMESSAGEEXT_GETTYPE_0300
    * @tc.name        : testJsMessageExtGetType003
    * @tc.desc        : test getString stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsMessageExtGetType003', 0, async (done: Function) => {
      Utils.doIt("testJsMessageExtGetType003", 120033, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_JSMESSAGEEXT_GETTYPE_0400
    * @tc.name        : testJsMessageExtGetType004
    * @tc.desc        : test getString stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsMessageExtGetType004', 0, async (done: Function) => {
      Utils.doIt("testJsMessageExtGetType004", 120034, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_JSMESSAGEEXT_GETTYPE_0500
    * @tc.name        : testJsMessageExtGetType005
    * @tc.desc        : test getString stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsMessageExtGetType005', 0, async (done: Function) => {
      Utils.doIt("testJsMessageExtGetType005", 120035, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}
