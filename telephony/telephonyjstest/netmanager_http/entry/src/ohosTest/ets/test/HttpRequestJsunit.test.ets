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

import { describe, expect, it, beforeEach, afterEach, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base'

export default function httpRequestJsunit() {
  describe("HttpRequestJsunitTest", () => {
    afterEach(async () => {
      console.log('Test afterEach start');
      let httpRequest = http.createHttp();
      httpRequest.off('headerReceive');
      httpRequest.destroy();
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_request_0100
     * @tc.name httprequest::request
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_request_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_request_0100";
      console.log("-----------------------HttpRequest_request Test is starting-----------------------");
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequest_request Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_request_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_request_0200
     * @tc.name httprequest::request
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_request_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_request_0200";
      console.log("-----------------------HttpRequest_request_01 Test is starting-----------------------");
      try {
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequest_request_01 Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_request_0200 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_request_0300
     * @tc.name httprequest::request
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_request_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_request_0300";
      console.log("-----------------------HttpRequest_request_02 Test is starting-----------------------");
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequest_request_02 Test end-----------------------");
          done();
        }).catch((error:BusinessError) => {
          console.info('HttpRequest_request_0300 asyncCallback error : ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_request_0300 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_destroy_0100
     * @tc.name httprequest::destroy
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_destroy_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_destroy_0100";
      console.log("-----------------------HttpRequest_destroy Test is starting-----------------------");
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            httpRequest.destroy();
            expect(true).assertTrue();
            console.log("-----------------------HttpRequest_destroy Test end-----------------------");
            done();
          } catch (error) {
            expect(false).assertFail();
            done();
          }
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_destroy_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_on_headerReceive_0100
     * @tc.name httprequest::on_headerReceive
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_on_headerReceive_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_on_headerReceive_0100";
      console.log("-----------------------HttpRequest_on_headerReceive Test is starting-----------------------");
      try {
        let httpRequest = http.createHttp();
        httpRequest.on('headerReceive', (data) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.log("-----------------------HttpRequest_on_headerReceive Test end-----------------------");
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_on_headerReceive_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_off_headerReceive_0100
     * @tc.name httprequest::off_headerReceive
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_off_headerReceive_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_off_headerReceive_0100";
      console.log("-----------------------HttpRequest_off_headerReceive Test is starting-----------------------");
      try {
        let httpRequest = http.createHttp();
        let callbackdata1 = (data:object) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(false).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequest_off_headerReceive Test end-----------------------");
          done();
        };
        httpRequest.on('headerReceive', callbackdata1);
        httpRequest.off('headerReceive', callbackdata1);
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_off_headerReceive_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_on_headersReceive_0100
     * @tc.name httprequest::on_headersReceive
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_on_headersReceive_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_on_headersReceive_0100";
      console.log("-----------------------HttpRequest_on_headersReceive Test is starting-----------------------");
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("headersReceive", (data) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.log("-----------------------HttpRequest_on_headersReceive Test end-----------------------");
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_on_headersReceive_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_off_headersReceive_0100
     * @tc.name httprequest::off_headersReceive
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_off_headersReceive_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_off_headersReceive_0100";
      console.log("-----------------------HttpRequest_off_headersReceive Test is starting-----------------------");
      try {
        let httpRequest = http.createHttp();
        httpRequest.off("headersReceive", (data) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(false).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequest_off_headersReceive Test end-----------------------");
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_off_headersReceive_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_off_headersReceive_0200
     * @tc.name httprequest::off_headersReceive_0200
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_off_headersReceive_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      console.log("-----------------------HttpRequest_off_headersReceive Test is starting-----------------------");
      try {
        let httpRequest = http.createHttp();
        httpRequest.off('headersReceive');
        expect(true).assertTrue();
        httpRequest.destroy();
        console.log("-----------------------HttpRequest_off_headersReceive_0200 Test end-----------------------");
        done();
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_off_headersReceive_0200 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_http_HttpRequest_once_headersReceive_0100
     * @tc.name httprequest::once_headersReceive_0100
     * @tc.desc Test Test httprequest property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_http_HttpRequest_once_headersReceive_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let casename = "SUB_Telephony_http_HttpRequest_once_headersReceive_0100";
      console.log("-----------------------HttpRequest_once_headersReceive Test is starting-----------------------");
      try {
        let httpRequest = http.createHttp();
        httpRequest.once('headersReceive', (data) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(true).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequest_on_headersReceive Test end-----------------------");
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("SUB_Telephony_http_HttpRequest_once_headersReceive_010 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
  })
};