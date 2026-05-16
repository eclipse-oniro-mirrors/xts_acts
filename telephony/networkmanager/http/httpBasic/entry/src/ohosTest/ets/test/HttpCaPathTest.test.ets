/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, it, expect, Level, Size, TestType  } from '@ohos/hypium';
import http from '@ohos.net.http';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}
export default function HttpCaPathTest() {
  describe('HttpCaPathTest',  () =>{

    let URL1 = "https://www.openharmony.cn";

    let httpRequestOptions1: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json'
      },
      caPath: "/data/storage/"
    }
    let httpRequestOptions2: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json'
      },
      caPath: ""
    }
    let httpRequestOptions3: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json'
      }
    }



    /**
     * @tc.name   testTelephonyNetStackHTTPSCertificateManagement0100
     * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0100
     * @tc.desc   request: input https://www.openharmony.cn/ & error of caPath by Async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHTTPSCertificateManagement0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let CASE_NAME = 'testTelephonyNetStackHTTPSCertificateManagement0100';
      console.info(`${CASE_NAME}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request(URL1, httpRequestOptions1, (err, data) => {
          console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          done();
        })
      } catch (error) {
        console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetStackHTTPSCertificateManagement0200
     * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0200
     * @tc.desc   request: input https://www.openharmony.cn/ & null of caPath by Async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHTTPSCertificateManagement0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let CASE_NAME = 'testTelephonyNetStackHTTPSCertificateManagement0200';
      console.info(`${CASE_NAME}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request(URL1, httpRequestOptions2, (err, data) => {
          console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          done();
        })
      } catch (error) {
        console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetStackHTTPSCertificateManagement0300
     * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0300
     * @tc.desc   request: input https://www.openharmony.cn/ & default of caPath by Async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHTTPSCertificateManagement0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let CASE_NAME = 'testTelephonyNetStackHTTPSCertificateManagement0300';
      console.info(`${CASE_NAME}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request(URL1, httpRequestOptions3, (err, data) => {
          console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          done();
        })
      } catch (error) {
        console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
    })
  })
}
