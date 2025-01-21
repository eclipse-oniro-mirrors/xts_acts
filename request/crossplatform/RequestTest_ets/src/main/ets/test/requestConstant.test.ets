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

import request from "@ohos.request";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestConstantCrossplatformJSUnit() {
  describe('requestConstantCrossplatformTest', function () {
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
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_CONSTANT_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_CONSTANT_0001
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_CROSSPLATFORM_CONSTANT_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0001 is starting-----------------------");

      expect(request.EXCEPTION_PERMISSION === 201).assertTrue();
      expect(request.EXCEPTION_PARAMCHECK === 401).assertTrue();
      expect(request.EXCEPTION_UNSUPPORTED === 801).assertTrue();
      expect(request.EXCEPTION_FILEIO === 13400001).assertTrue();
      expect(request.EXCEPTION_FILEPATH === 13400002).assertTrue();
      expect(request.EXCEPTION_SERVICE === 13400003).assertTrue();
      expect(request.EXCEPTION_OTHERS === 13499999).assertTrue();
      expect(request.NETWORK_MOBILE === 1).assertTrue();
      expect(request.NETWORK_WIFI === 65536).assertTrue();
      expect(request.ERROR_CANNOT_RESUME === 0).assertTrue();
      expect(request.ERROR_DEVICE_NOT_FOUND === 1).assertTrue();
      expect(request.ERROR_FILE_ALREADY_EXISTS === 2).assertTrue();
      expect(request.ERROR_FILE_ERROR === 3).assertTrue();
      expect(request.ERROR_HTTP_DATA_ERROR === 4).assertTrue();
      expect(request.ERROR_INSUFFICIENT_SPACE === 5).assertTrue();
      expect(request.ERROR_TOO_MANY_REDIRECTS === 6).assertTrue();
      expect(request.ERROR_UNHANDLED_HTTP_CODE === 7).assertTrue();
      expect(request.ERROR_UNKNOWN === 8).assertTrue();
      expect(request.ERROR_OFFLINE === 9).assertTrue();
      expect(request.ERROR_UNSUPPORTED_NETWORK_TYPE === 10).assertTrue();
      expect(request.PAUSED_QUEUED_FOR_WIFI === 0).assertTrue();
      expect(request.PAUSED_WAITING_FOR_NETWORK === 1).assertTrue();
      expect(request.PAUSED_WAITING_TO_RETRY === 2).assertTrue();
      expect(request.PAUSED_BY_USER === 3).assertTrue();
      expect(request.PAUSED_UNKNOWN === 4).assertTrue();
      expect(request.SESSION_SUCCESSFUL === 0).assertTrue();
      expect(request.SESSION_RUNNING === 1).assertTrue();
      expect(request.SESSION_PENDING === 2).assertTrue();
      expect(request.SESSION_PAUSED === 3).assertTrue();
      expect(request.SESSION_FAILED === 4).assertTrue();
      done();
    });

  })
}
