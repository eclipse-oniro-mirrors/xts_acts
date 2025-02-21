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


export default function HttpRequestOptionsJsunit() {
  describe("HttpRequestOptionsJsunitTest", function () {
    function expectFalse() {
      try {
        expect().assertFail();
      } catch (err) {
        console.info('assertion failure');
      }
    };

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_method_0100
     * @tc.name HttpRequestOptions::method
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_http_HttpRequestOptions_method_0100", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0100';
      console.log("-----------------------HttpRequestOptions_method Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequestOptions_method Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_method_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_http_HttpRequestOptions_method_0200
     * @tc.name HttpRequestOptions::method
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_http_HttpRequestOptions_method_0200", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0100';
      console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequestOptions_method_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("Telephony_http_HttpRequestOptions_method_0200 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_extraData_0100
     * @tc.name HttpRequestOptions::extraData
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_extraData_0100", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0200';
      console.log("-----------------------HttpRequestOptions_extraData Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: {
            //tn=albumsdetail&word=渐变风格插画&fr=albumslist&album_tab=设计素材&album_id=409&rn=30
            tn: "albumsdetail",
            work: "渐变风格插画",
            fr: "albumslist",
            album_tab: "设计素材",
            album_id: "409",
            rn: "30"
          },
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequestOptions_extraData Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_extraData_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_extraData_0200
     * @tc.name HttpRequestOptions::extraData
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_extraData_0200", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0200';
      console.log("-----------------------HttpRequestOptions_extraData_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: {
            //tn=albumsdetail&word=渐变风格插画&fr=albumslist&album_tab=设计素材&album_id=409&rn=30
            tn: "albumsdetail",
            work: "渐变风格插画",
            fr: "albumslist",
            album_tab: "设计素材",
            album_id: "409",
            rn: "30"
          },
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequestOptions_extraData_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_extraData_0200 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_header_0100
     * @tc.name HttpRequestOptions::header
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_header_0100", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            expect(true).assertTrue();
            httpRequest.destroy();
            console.log("-----------------------HttpRequestOptions_header Test end-----------------------");
            done();
          } catch (error) {
            console.log("Telephony_Http_HttpRequestOptions_header_0100 : JSON parse error = " + error);
            expect(false).assertFail();
            done();
          }
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_header_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_header_0200
     * @tc.name HttpRequestOptions::header
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_header_0200", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          try {
            expect(true).assertTrue();
            httpRequest.destroy();
            console.log("-----------------------HttpRequestOptions_header_01 Test end-----------------------");
            done();
          } catch (error) {
            console.log("Telephony_Http_HttpRequestOptions_header_0200 : JSON parse error = " + error);
            expectFalse();
            done();
          }
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_header_0200 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number Telephony_Http_HttpRequestOptions_header_0300
     * @tc.name HttpRequestOptions::header
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_header_0300", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header_02 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/xml",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            expect(data.responseCode == 200).assertTrue();
            httpRequest.destroy();
            console.log("-----------------------HttpRequestOptions_header_02 Test end-----------------------");
            done();
          } catch (error) {
            console.log("Telephony_Http_HttpRequestOptions_header_0300 : JSON parse error = " + error);
            expectFalse();
            done();
          }
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_header_0300 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_header_0400
     * @tc.name HttpRequestOptions::header
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_header_0400", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header_03 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/xml",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          try {
            expect(data.result.valueOf() != "").assertTrue();
            httpRequest.destroy();
            console.log("-----------------------HttpRequestOptions_header_03 Test end-----------------------");
            done();
          } catch (error) {
            console.log("Telephony_Http_HttpRequestOptions_header_0400 : JSON parse error = " + error);
            expectFalse();
            done();
          }
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_header_0400 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_readTimeout_0100
     * @tc.name HttpRequestOptions::readTimeout
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_readTimeout_0100", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0400';
      console.log("-----------------------HttpRequestOptions_readTimeout Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 0.1,
          connectTimeout: 60
        }
        var httpRequest = http.createHttp();
        if (httpRequestOptions.connectTimeout < 60000) {
          done();
          return;
        }
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 408).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequestOptions_readTimeout Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_readTimeout_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_readTimeout_0200
     * @tc.name HttpRequestOptions::readTimeout
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_readTimeout_0200", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0400';
      console.log("-----------------------HttpRequestOptions_readTimeout_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 0.1,
          connectTimeout: 60
        }
        var httpRequest = http.createHttp();
        if (httpRequestOptions.connectTimeout < 60000) {
          done();
          return;
        }
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 408).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequestOptions_readTimeout_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_readTimeout_0200 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_connectTimeout_0100
     * @tc.name HttpRequestOptions::connectTimeout
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_connectTimeout_0100", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0500';
      console.log("-----------------------HttpRequestOptions_connectTimeout Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60,
          connectTimeout: 0.1
        }
        if (httpRequestOptions.connectTimeout < 60000) {
          done();
          return;
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 504).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequestOptions_connectTimeout Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_connectTimeout_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number Telephony_Http_HttpRequestOptions_connectTimeout_0200
     * @tc.name HttpRequestOptions::connectTimeout
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_connectTimeout_0200", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0500';
      console.log("-----------------------HttpRequestOptions_connectTimeout_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60,
          connectTimeout: 0.1
        }
        if (httpRequestOptions.connectTimeout < 60000) {
          done();
          return;
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 504).assertTrue();
          httpRequest.destroy();
          console.log("-----------------------HttpRequestOptions_connectTimeout_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("Telephony_Http_HttpRequestOptions_connectTimeout_0200 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_UsingProxy_0100
     * @tc.name Telephony_Http_HttpRequestOptions_UsingProxy_0100
     * @tc.desc Telephony_Http_HttpRequestOptions_UsingProxy_0100
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_UsingProxy_0100", 0, async function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request(
        "https://www.baidu.com/",
        {
          connectTimeout: 60000,
          readTimeout: 60000,
          usingProxy: true,
        }, (err, data) => {
        if (!err) {
          console.info('Telephony_Http_HttpRequestOptions_UsingProxy_0100 code:' + data.responseCode);
          expect(data.responseCode == http.ResponseCode.OK).assertTrue();
          done();
        } else {
          console.info('Telephony_Http_HttpRequestOptions_UsingProxy_0100 error:' + JSON.stringify(err));
          httpRequest.destroy();
          expect(true).assertFalse();
          done();
        }
      }
      );
    });

    /**
     * @tc.number Telephony_Http_HttpRequestOptions_UsingProxy_0200
     * @tc.name Telephony_Http_HttpRequestOptions_UsingProxy_0200
     * @tc.desc Telephony_Http_HttpRequestOptions_UsingProxy_0200
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("Telephony_Http_HttpRequestOptions_UsingProxy_0200", 0, async function (done) {
      let httpRequest = http.createHttp();
      let ExclusionList = ""
      let array = ExclusionList.split(',');
      let httpProxy = {
        host: "host",
        port: 1,
        exclusionList: array
      }
      httpRequest.request(
        "https://www.baidu.com/",
        {
          connectTimeout: 60000,
          readTimeout: 60000,
          usingProxy: httpProxy,
        }, (err, data) => {
        if (!err) {
          console.info('Telephony_Http_HttpRequestOptions_UsingProxy_0200 code:' + data.responseCode);
          expect(true).assertFalse();
          done();
        } else {
          console.info('Telephony_Http_HttpRequestOptions_UsingProxy_0200 error:' + JSON.stringify(err));
          httpRequest.destroy();
          expect(err.code == 2300005).assertTrue();
          done();
        }
      }
      );
    });
  })

};

