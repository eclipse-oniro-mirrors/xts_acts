/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function routerJsunit() {
  describe('routerJsunit', function () {
    beforeAll(async function (done) {
      console.info("router beforeEach start");

      try {
        router.clear();
        let pages = router.getState();
        console.info("get router state success " + JSON.stringify(pages));
        if (!("circle" == pages.name)) {
          console.info("get router state success " + JSON.stringify(pages.name));
          router.pushUrl({
             url: 'pages/circle',
             params: {
               data1: 'message',
               data2: {
                data3: [123, 456, 789]
               }
             }
          }).then(() => {
                console.info("push circle page success " );
            })
            .catch(err => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("circleNew after each called");
    });


    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_002
     * @tc.name         tesRouter_001
     * @tc.desc         testRouterAPi
     */
    it('testRouter_001', 0, async function (done) {
       await Utils.sleep(2000);
       try {
        router.showAlertBeforeBackPage({
          message: 'Message Info'
        });
        expect(true).assertTrue();
        done();
      } catch(error) {
         console.error(`showAlertBeforeBackPage failed, code is ${error.code}, message is ${error.message}`);
         expect(error.code == 13004).assertTrue();
         done();
      }

    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_002
    * @tc.name         tesRouter_002
    * @tc.desc         testRouterAPi
    */
    it('testRouter_002', 0, async function (done) {
      await Utils.sleep(2000);
      try {
        router.hideAlertBeforeBackPage();
        expect(true).assertTrue();
        done();
      } catch(error) {
        console.error(`hideAlertBeforeBackPage failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 13004).assertTrue();
        done();
      }
    });


  })
}
