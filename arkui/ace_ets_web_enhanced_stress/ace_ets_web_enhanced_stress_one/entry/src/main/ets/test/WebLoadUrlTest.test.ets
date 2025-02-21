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
import router from '@ohos.router';
import Utils from './Utils';

export default function webLoadUrlTest() {

  describe('WebLoadUrlTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebLoadUrlTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebLoadUrlTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebLoadUrlTest state success " + JSON.stringify(pages));
        if (!("WebLoadUrlTest" == pages.name)) {
          console.info("get WebLoadUrlTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebLoadUrlTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebLoadUrlTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebLoadUrlTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebLoadUrlTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADURL_0100
    * @tc.name        : testWebLoadUrl001
    * @tc.desc        : stress testing LoadUrl when using the raw files
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadUrl001', 0, async (done: Function) => {
      Utils.doIt("testWebLoadUrl001", 81100, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADURL_0200
    * @tc.name        : testWebLoadUrl002
    * @tc.desc        : stress testing LoadUrl when using the resource
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadUrl002', 0, async (done: Function) => {
      Utils.doIt("testWebLoadUrl002", 81110, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADURL_0300
    * @tc.name        : testWebLoadUrl003
    * @tc.desc        : stress testing LoadUrl when using the url
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadUrl003', 0, async (done: Function) => {
      Utils.doIt("testWebLoadUrl003", 81120, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADURL_0400
    * @tc.name        : testWebLoadUrl004
    * @tc.desc        : stress testing LoadUrl when using the sandbox file
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadUrl004', 0, async (done: Function) => {
      Utils.doIt("testWebLoadUrl004", 81121, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADURL_0500
    * @tc.name        : testWebLoadUrl005
    * @tc.desc        : stress testing LoadUrl when using the raw file and customHeaders
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadUrl005', 0, async (done: Function) => {
      Utils.doIt("testWebLoadUrl005", 81122, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADURL_0600
    * @tc.name        : testWebLoadUrl006
    * @tc.desc        : stress testing LoadUrl when using the resource and customHeaders
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadUrl006', 0, async (done: Function) => {
      Utils.doIt("testWebLoadUrl006", 81123, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADURL_0700
    * @tc.name        : testWebLoadUrl007
    * @tc.desc        : stress testing LoadUrl when using the url and customHeaders
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadUrl007', 0, async (done: Function) => {
      Utils.doIt("testWebLoadUrl007", 81124, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADURL_0800
    * @tc.name        : testWebLoadUrl008
    * @tc.desc        : stress testing LoadUrl when using the sandbox file and customHeaders
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadUrl008', 0, async (done: Function) => {
      Utils.doIt("testWebLoadUrl008", 81125, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
