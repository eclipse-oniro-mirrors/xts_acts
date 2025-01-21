/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import fileio from '@ohos.fileio'
import request from "@ohos.request";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestUploadJSUnit() {
  describe('requestUploadJSUnit', function () {
    console.info('====>################################request upload Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info('====>beforeAll: Prerequisites are executed.');
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });

    /**
     * @tc.number    SUB_MISC_REQUEST_UPLOAD_removeNormal_promise_0010
     * @tc.name    SUB_MISC_REQUEST_UPLOAD_removeNormal_promise_0010
     * @tc.desc      Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MISC_REQUEST_UPLOAD_removeNormal_promise_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_MISC_REQUEST_UPLOAD_removeNormal_promise_0010 is starting-----------------------");
      try {
        console.info("====>SUB_MISC_REQUEST_UPLOAD_removeNormal_promise_0010 remove");
        await request.agent.remove("1234567");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_MISC_REQUEST_UPLOAD_removeNormal_promise_0010 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400003);
      }
      console.info("-----------------------SUB_MISC_REQUEST_UPLOAD_removeNormal_promise_0010 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_MISC_REQUEST_UPLOAD_removeNormal_callback_0010
     * @tc.name    SUB_MISC_REQUEST_UPLOAD_removeNormal_callback_0010
     * @tc.desc      Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MISC_REQUEST_UPLOAD_removeNormal_callback_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_MISC_REQUEST_UPLOAD_removeNormal_callback_0010 is starting-----------------------");
      request.agent.remove("1234567", (err) => {
        try {
          if(err){
            console.info("====>SUB_MISC_REQUEST_UPLOAD_removeNormal_callback_0010 err.message: " + err.message);
            console.info("====>SUB_MISC_REQUEST_UPLOAD_removeNormal_callback_0010 err.code: " + err.code);
            expect(err.code).assertEqual(13400003);
          }else{
            expect().assertFail();
          }
          done();
        }catch (err){
          console.info("====>SUB_MISC_REQUEST_UPLOAD_removeNormal_callback_0010 remove fail: " + JSON.stringify(err));
          done();
        }
      });
    });

  })
}
