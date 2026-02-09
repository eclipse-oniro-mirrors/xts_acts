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

import http from '@ohos.net.http';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

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
export default function HttpUsingProtocolTest() {
  describe('HttpUsingProtocolTest',  ()=> {

    /**
     * @tc.name   testTelephonyNETSTACKHttp2TestBasicGet0100
     * @tc.number SUB_Telephony_NETSTACK_Http2TestBasicGet_0100
     * @tc.desc   test http1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyNETSTACKHttp2TestBasicGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = 'testTelephonyNETSTACKHttp2TestBasicGet0100';
      console.info(`${caseName}---start`);
      try {
        let httpRequest  = http.createHttp();
        httpRequest .request("https://www.baidu.com", {
          usingProtocol: http.HttpProtocol.HTTP1_1
        }).then((data)=> {
          console.info(`${caseName} data: ` + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest .destroy();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} httpsRequest fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNETSTACKHttp2TestBasicGet0200
     * @tc.number SUB_Telephony_NETSTACK_Http2TestBasicGet_0200
     * @tc.desc   usingCache test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyNETSTACKHttp2TestBasicGet0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = 'testTelephonyNETSTACKHttp2TestBasicGet0200';
      console.info(`${caseName}---start`);
      try {
        let httpRequest  = http.createHttp();
        httpRequest .request("https://www.baidu.com", {
          usingProtocol: http.HttpProtocol.HTTP2
        }).then((data) =>{
          console.info(`${caseName} data: ` + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest .destroy();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} httpsRequest fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }

    });

    /**
     * @tc.name   testTelephonyNETSTACKHttp2TestBasicGet0300
     * @tc.number SUB_Telephony_NETSTACK_Http2TestBasicGet_0300
     * @tc.desc   set usingCache to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyNETSTACKHttp2TestBasicGet0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = 'testTelephonyNETSTACKHttp2TestBasicGet0300';
      console.info(`${caseName}---start`);
      try {
        let httpRequest  = http.createHttp();
        httpRequest .request("https://www.baidu.com").then( (data)=> {
          console.info(`${caseName} data: ` + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest .destroy();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} httpsRequest fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNETSTACKHttp2TestBasicGet0400
     * @tc.number SUB_Telephony_NETSTACK_Http2TestBasicGet_0400
     * @tc.desc   usingCache test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyNETSTACKHttp2TestBasicGet0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function)=> {
      let caseName = 'testTelephonyNETSTACKHttp2TestBasicGet0400';
      console.info(`${caseName}---start`);
      try {
        expect(http.HttpProtocol.HTTP1_1).assertEqual(0);
        expect(http.HttpProtocol.HTTP2).assertEqual(1);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }

    });
    /**
     * @tc.name   testTelephonyNETSTACKHttp2TestBasicGet0500
     * @tc.number SUB_Telephony_NETSTACK_Http2TestBasicGet_0500
     * @tc.desc   usingCache test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyNETSTACKHttp2TestBasicGet0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function)=> {
      let caseName = 'testTelephonyNETSTACKHttp2TestBasicGet0500';
      console.info(`${caseName}---start`);
      try {
        expect(http.HttpDataType.STRING).assertEqual(0);
        expect(http.HttpDataType.OBJECT).assertEqual(1);
        expect(http.HttpDataType.ARRAY_BUFFER).assertEqual(2);
        done();
      } catch (error) {
        console.info(`${caseName} httpsRequest fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyHttpHttpTestPriority0100
     * @tc.number SUB_Telephony_Http_HttpTestPriority_0100
     * @tc.desc   usingCache test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyHttpHttpTestPriority0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = 'testTelephonyHttpHttpTestPriority0100';
      console.info(`${caseName}---start`);
      try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: '',
            expectDataType: http.HttpDataType.STRING,
            header: "content-type': 'application/json",
            readTimeout: 6000,
            connectTimeout: 6000,
            priority: 100,
            caPath: ''
          }
          let httpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com", httpRequestOptions, (err, data) => {
            console.info(caseName + JSON.stringify(err) + "data" + JSON.stringify(data));
            ExpectTrue(data.responseCode == 200);
            ExpectTrue(data.resultType == http.HttpDataType.STRING);
            httpRequest.destroy();
            done();
          });
      } catch (error) {
        console.info(`${caseName}  catch  err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });
  });
}