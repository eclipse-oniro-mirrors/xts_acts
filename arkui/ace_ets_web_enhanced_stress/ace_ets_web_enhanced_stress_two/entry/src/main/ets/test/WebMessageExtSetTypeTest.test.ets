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

export default function webMessageExtSetTypeTest() {

  describe('WebMessageExtSetTypeTest', () => {
    let pageName = 'WebMessageExtSetTypeTest'
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
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_SETTYPE_0100
    * @tc.name        : testWebMessageExtSetType001
    * @tc.desc        : test setType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtSetType001', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtSetType001", 120019, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_SET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_SETTYPE_0200
    * @tc.name        : testWebMessageExtSetType002
    * @tc.desc        : test setType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtSetType002', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtSetType002", 120020, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_SET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_SETTYPE_0300
    * @tc.name        : testWebMessageExtSetType003
    * @tc.desc        : test setType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtSetType003', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtSetType003", 120021, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_SET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_SETTYPE_0400
    * @tc.name        : testWebMessageExtSetType004
    * @tc.desc        : test setType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtSetType004', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtSetType004", 120022, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_SET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_SETTYPE_0500
    * @tc.name        : testWebMessageExtSetType005
    * @tc.desc        : test setType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtSetType005', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtSetType005", 120023, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_SET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_SETTYPE_0600
    * @tc.name        : testWebMessageExtSetType006
    * @tc.desc        : test setType stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtSetType006', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtSetType006", 120024, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_SET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_SETTYPE_0700
    * @tc.name        : testWebMessageExtSetType007
    * @tc.desc        : test setType stress   
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtSetType007', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtSetType007", 120025, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_SET_TYPE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
