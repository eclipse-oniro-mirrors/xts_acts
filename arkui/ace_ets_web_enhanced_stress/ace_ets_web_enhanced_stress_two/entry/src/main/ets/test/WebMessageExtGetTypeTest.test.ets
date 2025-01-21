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

export default function webMessageExtGetTypeTest() {

  describe('WebMessageExtGetTypeTest', () => {
    let pageName = 'WebMessageExtGetTypeTest'
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
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_GETTYPE_0100
    * @tc.name        : testWebMessageExtGetType001
    * @tc.desc        : test getType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtGetType001', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtGetType001", 120006, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_GETTYPE_0200
    * @tc.name        : testWebMessageExtGetType002
    * @tc.desc        : test getType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtGetType002', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtGetType002", 120007, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_GETTYPE_0300
    * @tc.name        : testWebMessageExtGetType003
    * @tc.desc        : test getType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtGetType003', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtGetType003", 120008, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_GETTYPE_0400
    * @tc.name        : testWebMessageExtGetType004
    * @tc.desc        : test getType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtGetType004', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtGetType004", 120009, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_GETTYPE_0500
    * @tc.name        : testWebMessageExtGetType005
    * @tc.desc        : test getType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtGetType005', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtGetType005", 120010, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_GETTYPE_0600
    * @tc.name        : testWebMessageExtGetType006
    * @tc.desc        : test getType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtGetType006', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtGetType006", 120011, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_GET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
