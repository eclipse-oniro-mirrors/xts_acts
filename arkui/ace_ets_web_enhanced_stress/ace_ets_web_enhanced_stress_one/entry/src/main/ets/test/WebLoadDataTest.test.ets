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

export default function webLoadDataTest() {

  describe('WebLoadDataTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebLoadDataTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebLoadDataTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebLoadDataTest state success " + JSON.stringify(pages));
        if (!("WebLoadDataTest" == pages.name)) {
          console.info("get WebLoadDataTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebLoadDataTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebLoadDataTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebLoadDataTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebLoadDataTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0100
    * @tc.name        : testWebLoadData001
    * @tc.desc        : stress testing loadData when parameter is data,mimeType,encoding
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData001', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData001", 81050, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0200
    * @tc.name        : testWebLoadData002
    * @tc.desc        : stress testing LoadData when parameter is data,mimeType,encoding,baseUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData002', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData002", 81051, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0300
    * @tc.name        : testWebLoadData003
    * @tc.desc        : stress testing LoadData when parameter is data,mimeType,encoding,historyUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData003', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData003", 81052, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0400
    * @tc.name        : testWebLoadData004
    * @tc.desc        : stress testing LoadData when parameter is data,mimeType,encoding,historyUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData004', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData004", 81053, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0500
    * @tc.name        : testWebLoadData005
    * @tc.desc        : stress testing LoadData when parameter is data,mimeType,encoding,baseUrl=""
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData005', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData005", 81054, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0600
    * @tc.name        : testWebLoadData006
    * @tc.desc        : stress testing LoadData when parameter is data,mimeType,encoding,baseUrl="",historyUrl=""
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData006', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData006", 81055, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0700
    * @tc.name        : testWebLoadData007
    * @tc.desc        : stress testing LoadData when parameter is data,mimeType,encoding,historyUrll=""
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData007', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData007", 81056, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0800
    * @tc.name        : testWebLoadData008
    * @tc.desc        : stress testing LoadData when parameter is data,mimeType,encoding,baseUrll="",historyUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData008', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData008", 81057, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_LOADDATA_0900
    * @tc.name        : testWebLoadData009
    * @tc.desc        : stress testing LoadData when parameter is data,mimeType,encoding,baseUrll,historyUrl=""
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebLoadData009', 0, async (done: Function) => {
      Utils.doIt("testWebLoadData009", 81058, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_LOAD_DATA_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}
