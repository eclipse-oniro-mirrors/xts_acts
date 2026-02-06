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

import { describe, expect, it, TestType, Size, Level, beforeEach  } from '@ohos/hypium';
import http from '@ohos.net.http';

const ExpectFail = () => {
  try {
    ExpectFail();
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
function sleep(time: number): Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok');
    }, time)
  });
}
let httpRequestOptions: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  header: "content-type': 'application/json",
  readTimeout: 60000,
  connectTimeout: 60000
};

let Address_Baidu = "https://www.baidu.com/";
let isONEventDataReceive = 0;
let isONEventDataReceiveProgress = 0;
let isONEventDataEnd = 0;

function dataReceive_on_callback(data: ArrayBuffer) {
  isONEventDataReceive +=1;
  console.log(" dataReceive_on_callback receive len:" + JSON.stringify(data.byteLength));
}

function dataEnd_on_callback() {
  isONEventDataEnd +=1;
  console.log(" dataEnd_on_callback callback function");
}

function dataReceiveProgress_on_callback(data: http.DataReceiveProgressInfo) {
  isONEventDataReceiveProgress +=1;
  console.log("dataReceiveProgress_on_callback receive data: " + JSON.stringify(data));
  let receiveSize = data.receiveSize;
  let totalSize = data.totalSize;
  console.log("dataReceiveProgress_on_callback receiveSize: " + JSON.stringify(receiveSize) +
    " , dataReceiveProgress_on_callback totalSize: " + JSON.stringify(totalSize));
}

export default function HttpRequestInStreamTest() {
  describe("HttpRequestInStreamTest", () => {
    beforeEach((done: Function)=>{
       isONEventDataReceive = 0;
       isONEventDataReceiveProgress = 0;
       isONEventDataEnd = 0;
      done();
    })

    /**
     * @tc.name   testTelephonyhttpHttpRequestrequestInStream0100
     * @tc.number SUB_Telephony_http_HttpRequest_requestInStream_0100
     * @tc.desc   Test requestInStream(url: string, callback: AsyncCallback<void>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyhttpHttpRequestrequestInStream0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyhttpHttpRequestrequestInStream0100";
      let Address_Img = "https://img1.baidu.com/it/u=3010094603,1247181326&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";
      let httpRequest = http.createHttp();
      console.info(`${caseName}---start`);
      try {
        httpRequest.on("dataReceive", dataReceive_on_callback);
        httpRequest.on("dataReceiveProgress", dataReceiveProgress_on_callback);
        httpRequest.on("dataEnd", dataEnd_on_callback);
        httpRequest.requestInStream(Address_Img, httpRequestOptions, async (error, data) => {
          console.log(`${caseName} get error is `+ JSON.stringify(error)+ " data is " + JSON.stringify(data));
          if (error) {
            console.error(`${caseName} get err is `+JSON.stringify(error));
            ExpectFail();
            console.info(`${caseName}---end`);
            done();
          }else{
            httpRequest.off("dataReceive");
            httpRequest.off("dataReceiveProgress");
            httpRequest.off("dataEnd");
            httpRequest.destroy();
            await sleep(200);
            ExpectTrue(data == 200 && isONEventDataReceive !=0 && isONEventDataReceiveProgress != 0 && isONEventDataEnd !=0);
            console.log(`${caseName }---isONEventDataReceive: `, isONEventDataReceive,"isONEventDataReceiveProgress: ",isONEventDataReceiveProgress,"isONEventDataEnd: ",isONEventDataEnd)
            done();
            console.info(`${caseName}---end`);
          }
        })
      } catch (error) {
        console.error(`${caseName} catch err is `+JSON.stringify(error));
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamondataReceive0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataReceive_0100
     * @tc.desc   Test on(type: "dataReceive", callback: Callback<ArrayBuffer>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamondataReceive0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamondataReceive0100";
      console.info(`${caseName}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataReceive", dataReceive_on_callback);
        httpRequest.requestInStream(Address_Baidu).then(async (data) =>{
          console.info(`${caseName} isONEventDataReceive: `+ isONEventDataReceive+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataReceive > 0);
          httpRequest.off("dataReceive");
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err is `+JSON.stringify(error));
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataReceive0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0100
     * @tc.desc   Test off(type: "dataReceive", callback: Callback<ArrayBuffer>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataReceive0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamoffdataReceive0100";
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataReceive", dataReceive_on_callback);
        httpRequest.off("dataReceive", dataReceive_on_callback);
        httpRequest.requestInStream(Address_Baidu).then(async (data) =>{
          console.info(`${caseName} isONEventDataReceive: `+ isONEventDataReceive+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataReceive == 0);
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error) =>{
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err is `+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataReceive0200
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0200
     * @tc.desc   Test off(type: "dataReceive"): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataReceive0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamoffdataReceive0200";
      console.info(`${caseName}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataReceive", dataReceive_on_callback);
        httpRequest.off("dataReceive");
        httpRequest.requestInStream(Address_Baidu).then(async (data) =>{
          console.info(`${caseName} isONEventDataReceive: `+ isONEventDataReceive+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataReceive == 0);
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error) =>{
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err is `+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamondataReceiveProgress0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataReceiveProgress_0100
     * @tc.desc   Test on(type: "dataReceiveProgress", callback: Callback<{ receiveSize: number, totalSize: number }>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamondataReceiveProgress0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamondataReceiveProgress0100";
      console.info(`${caseName}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataReceiveProgress", dataReceiveProgress_on_callback);
        httpRequest.requestInStream(Address_Baidu).then(async (data)=> {
          console.info(`${caseName} isONEventDataReceiveProgress: `+ isONEventDataReceiveProgress+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataReceiveProgress > 0);
          httpRequest.off("dataReceiveProgress");
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err is `+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0100
     * @tc.desc   Test off(type: "dataReceiveProgress", callback: Callback<{ receiveSize: number, totalSize: number }>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress0100";
      console.info(`${caseName}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataReceiveProgress", dataReceiveProgress_on_callback);
        httpRequest.off("dataReceiveProgress", dataReceiveProgress_on_callback);
        httpRequest.requestInStream(Address_Baidu).then(async (data) =>{
          console.info(`${caseName} isONEventDataReceiveProgress: `+ isONEventDataReceiveProgress+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataReceiveProgress == 0);
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error) =>{
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err is `+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });


    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress0200
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0200
     * @tc.desc   Test off(type: "dataReceiveProgress"): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress0200";
      console.info(`${caseName}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataReceiveProgress", dataReceiveProgress_on_callback);
        httpRequest.off("dataReceiveProgress");
        httpRequest.requestInStream(Address_Baidu).then(async (data) =>{
          console.info(`${caseName} isONEventDataReceiveProgress: `+ isONEventDataReceiveProgress+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataReceiveProgress == 0);
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error) =>{
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---end`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err is `+JSON.stringify(error));
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });


    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamondataEnd0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataEnd_0100
     * @tc.desc   Test on(type: "dataEnd", callback: Callback<void>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamondataEnd0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamondataEnd0100";
      console.info(`${caseName}---start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataEnd", dataEnd_on_callback);
        httpRequest.requestInStream(Address_Baidu).then(async (data) =>{
          console.info(`${caseName} isONEventDataEnd is `+ isONEventDataEnd+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataEnd > 0 );
          httpRequest.off("dataEnd", dataEnd_on_callback);
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error)=> {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err is `+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });


    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataEnd0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0100
     * @tc.desc   Test off(type: "dataEnd", callback?: Callback<void>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataEnd0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamoffdataEnd0100";
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataEnd", dataEnd_on_callback);
        httpRequest.off("dataEnd", dataEnd_on_callback);
        httpRequest.requestInStream(Address_Baidu).then(async (data) =>{
          console.info(`${caseName} isONEventDataEnd is `+ isONEventDataEnd+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataEnd == 0 );
          httpRequest.off("dataEnd", dataEnd_on_callback);
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error)=> {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        });
      } catch (error) {
        console.log(caseName + " : error = " + JSON.stringify(error));
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataEnd0200
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0200
     * @tc.desc   Test off(type: "dataEnd"): void;.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataEnd0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)=> {
      let caseName = "testTelephonyNetStackHttprequestInStreamoffdataEnd0200";
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("dataEnd", dataEnd_on_callback);
        httpRequest.off("dataEnd");
        httpRequest.requestInStream(Address_Baidu).then(async (data) =>{
          console.info(`${caseName} isONEventDataEnd is `+ isONEventDataEnd+ ' data: '+data);
          await sleep(200);
          ExpectTrue(data == 200 && isONEventDataEnd == 0 );
          httpRequest.off("dataEnd", dataEnd_on_callback);
          httpRequest.destroy();
          console.info(`${caseName}---end`);
          done();
        }).catch( (err:Error)=> {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        });
      } catch (error) {
        console.log(caseName + " : error = " + JSON.stringify(error));
        ExpectFail();
        done();
      }
    });
  });
}