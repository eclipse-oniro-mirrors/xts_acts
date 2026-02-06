/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import netHttp from '@ohos.net.http';
import { describe, expect, it, TestType, Size, Level  } from '@ohos/hypium';
import {BusinessError} from '@ohos.base';

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
export default function HttpBasicTest() {

  describe('HttpBasicTest',  ()=> {

    /**
     * @tc.name   testTelephonyNETSTACKHttpTestUserAgent0100
     * @tc.number SUB_Telephony_NETSTACK_HttpTestUserAgent_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNETSTACKHttpTestUserAgent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>{
      let caseName = 'testTelephonyNETSTACKHttpTestUserAgent0100';
      console.info(`${caseName}---start`);
      try {
        let http = netHttp.createHttp();
        http.request("https://httpbin.org/user-agent").then((data) =>{
          console.info(`${caseName} get data.responseCode is: `+ JSON.stringify(data.responseCode));
          console.info(`${caseName} get data.result is: `+ JSON.stringify(data));
          http.destroy();
          ExpectTrue(data.responseCode == 200 || data.responseCode > 500);
          if (data.responseCode == 200) {
            ExpectTrue(data.result.toString().search("user-agent") != -1 && data.result.toString().search("libcurl-agent/1.0") != -1);
          }
          done();
          console.info(`${caseName}---end`);
        });
      } catch (error) {
        console.info(`${caseName}catch  err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNETSTACKHttpTestHeader0100
     * @tc.number SUB_Telephony_NETSTACK_HttpTestHeader_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNETSTACKHttpTestHeader0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>{
      let caseName = 'testTelephonyNETSTACKHttpTestHeader0100';
      console.info(`${caseName}---start`);
      try {
        let http = netHttp.createHttp();
        http.request("https://httpbin.org/get" ,{
          method: netHttp.RequestMethod.GET,
          extraData: "MineMine",
          header: { 'Content-Type': 'application/json' }
        }).then((data)=> {
          http.destroy();
          ExpectTrue(data.responseCode == 200 || data.responseCode > 500);
          console.info(`${caseName} get data is: ` + JSON.stringify(data));
          if (data.responseCode == 200) {
            ExpectTrue(data.result.toString().search("Content-Type") != -1);
            ExpectTrue(data.result.toString().search("application/json") != -1);
          }
          done();
          console.info(`${caseName}---end`);
        }).catch((err: BusinessError)=>{
          console.error(`${caseName} request err is `+JSON.stringify(err));
          console.info(`${caseName}---end`);
          done();
        })
      } catch (error) {
        console.info(`${caseName} catch  err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNETSTACKHttpTestPost
     * @tc.number SUB_Telephony_NETSTACK_HttpTestPost
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNETSTACKHttpTestPost', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>{
      let caseName = 'testTelephonyNETSTACKHttpTestPost';
      console.info(`${caseName}---start`);
      try {
        let http = netHttp.createHttp();
        http.request("https://httpbin.org/post", {
          method: netHttp.RequestMethod.POST,
          extraData: "MineMine"
        }).then((data) =>{
          http.destroy();
          ExpectTrue(data.responseCode == 200 || data.responseCode > 500);
          if (data.responseCode == 200) {
            ExpectTrue(data.result.toString().search("MineMine") != -1);
          }
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catch  err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNETSTACKHttpTestPUT
     * @tc.number SUB_Telephony_NETSTACK_HttpTestPUT
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNETSTACKHttpTestPUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>{
      let caseName = 'testTelephonyNETSTACKHttpTestPUT';
      console.info(`${caseName}---start`);
      try {
        let http = netHttp.createHttp();
        http.request("https://httpbin.org/put", {
          method: netHttp.RequestMethod.PUT,
          extraData: "MineMine"
        }).then((data) => {
          http.destroy();
          ExpectTrue(data.responseCode == 200 || data.responseCode > 500);
          if (data.responseCode == 200) {
            ExpectTrue(data.result.toString().search("MineMine") != -1);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} catch  err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNETSTACKHttpTestCookies
     * @tc.number SUB_Telephony_NETSTACK_HttpTestCookies
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNETSTACKHttpTestCookies', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>{
      let caseName = 'testTelephonyNETSTACKHttpTestCookies';
      console.info(`${caseName}---start`);
      try {
        let http = netHttp.createHttp();
        http.request("https://httpbin.org/cookies/set/name/value").then( (data) =>{
          console.info(`${caseName} request get data is: `+ JSON.stringify(data));
          http.destroy();
          ExpectTrue(data.responseCode == 200 || data.responseCode > 500);
          if (data.responseCode == 200) {
            ExpectTrue(data.cookies !== "");
          }
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.info(`${caseName}catch  err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNETSTACKHttpTestEncode
     * @tc.number SUB_Telephony_NETSTACK_HttpTestEncode
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNETSTACKHttpTestEncode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>{
      let caseName = 'testTelephonyNETSTACKHttpTestEncode';
      console.info(`${caseName}---start`);
      try {
        let http = netHttp.createHttp();
        http.request("https://httpbin.org/response-headers?key1=val1&key2=val2", {
          extraData: {
            "name1": "mine1",
            "name2": "mine2",
          }
        }).then( (data) => {
          http.destroy();
          ExpectTrue(data.responseCode == 200 || data.responseCode > 500);
          if (data.responseCode == 200) {
            ExpectTrue(data.result.toString().search("key1") != -1);
            ExpectTrue(data.result.toString().search("val1") != -1);
            ExpectTrue(data.result.toString().search("key2") != -1);
            ExpectTrue(data.result.toString().search("val2") != -1);
            ExpectTrue(data.result.toString().search("name1") != -1);
            ExpectTrue(data.result.toString().search("mine1") != -1);
            ExpectTrue(data.result.toString().search("name2") != -1);
            ExpectTrue(data.result.toString().search("mine2") != -1);
          }
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catch  err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });
  });
}