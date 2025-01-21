/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, it, expect} from '@ohos/hypium';
import http from '@ohos.net.http';
import connection from "@ohos.net.connection";

export default function httpJsunit() {
  describe("httpJsunitTest", function () {
    /**
     * @tc.number Telephony_Http_Http_createHttp_0100
     * @tc.name createHttp
     * @tc.desc Test Create HTTP authentication.
     */
    it("Telephony_Http_Http_createHttp_0100", 0, async function (done) {
      console.log("-----------------------http createHttp Test is starting-----------------------");
      var httpRequest = http.createHttp();
      expect(httpRequest != null).assertTrue();
      console.log("-----------------------http createHttp Test end-----------------------");
      done();
    });
    /**
     * @tc.number Telephony_NetworkManager_getDefaultNetSync
     * @tc.name Test getDefaultNetSync() to check return value
     * @tc.desc Function test
     */
    it('Telephony_NetworkManager_getDefaultNetSync', 0, async function (done) {
      let caseName = 'Telephony_NetworkManager_getDefaultNetSync'
      let handleInstance = undefined;
      handleInstance = connection.getDefaultNetSync();
      if (handleInstance == undefined) {
        console.log(`${caseName} gethandleInstance fail`);
        expect().assertFail();
        done();
      } else {
        console.log(`${caseName} gethandleInstance success`);
        expect(typeof (handleInstance) == 'object').assertEqual(true);
        done();
      }
    });

    /**
     * @tc.number Telephony_NetworkManager_isDefaultNetMetered_Async_0100
     * @tc.name Test isDefaultNetMetered() to check return value
     * @tc.desc Function test
     */
    it('Telephony_NetworkManager_isDefaultNetMetered_Async_0100', 0, async function (done) {
      let caseName = 'Telephony_NetworkManager_isDefaultNetMetered_Async_0100'
      connection.isDefaultNetMetered((error, data) => {
        if (error) {
          console.log(`${caseName} isDefaultNetMetered  error`);
          expect().assertFail();
          done();
        } else {
          console.log(`${caseName} isDefaultNetMetered success`);
          expect(error).assertEqual(undefined);
          expect(data).assertEqual(true);
          done();
        }
      })
    });

    /**
     * @tc.number Telephony_NetworkManager_isDefaultNetMetered_Promise_0100
     * @tc.name Test isDefaultNetMetered() to check return value
     * @tc.desc Function test
     */
    it('Telephony_NetworkManager_isDefaultNetMetered_Promise_0100', 0, async function (done) {
      let caseName = 'Telephony_NetworkManager_isDefaultNetMetered_Promise_0100'
      connection.isDefaultNetMetered().then((data) => {
        console.log(`${caseName} isDefaultNetMetered success`);
        expect(data).assertEqual(true);
        done();
      }).catch((error) => {
        console.log(JSON.stringify(error));
        expect().assertFail();
        done();
      })
    });
  })
};