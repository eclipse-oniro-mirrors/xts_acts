/**
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import fetch from '@system.fetch';
import http from '@ohos.net.http';
import { describe, expect, it, TestType, Size, Level  } from '@ohos/hypium'

export default function Telephony_NetStack_HttpFetchTest() {

  describe("Telephony_NetStack_HttpFetchTest", function () {

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchBasicGet_0100
     * @tc.name 基本场景，FETCH方式测试能否GET一个网址
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchBasicGet_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/anything",
            success: function (data) {
              console.info("NetStack fetch success " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchUserAgent_0100
     * @tc.name FETCH方式返回用户代理
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchUserAgent_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/user-agent",
            success: function (data) {
              console.info("NetStack fetch success " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(JSON.parse(data.data.toString())["user-agent"] == "libcurl-agent/1.0").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack fetch complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchUserAgent_0200
     * @tc.name FETCH方式返回用户代理
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchUserAgent_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/user-agent",
            responseType: "json",
            success: function (data) {
              console.info("NetStack fetch success " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(data.data["user-agent"] == "libcurl-agent/1.0").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack fetch complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchHeader_0100
     * @tc.name 返回Header
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchHeader_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/headers",
            success: function (data) {
              console.info("NetStack Fetch Success " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(JSON.parse(data.data.toString())["headers"]["Content-Type"] === "application/json").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchHeader_0200
     * @tc.name 返回Header
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchHeader_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/headers",
            responseType: "json",
            success: function (data) {
              console.info("NetStack Fetch Success " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(data.data["headers"]["Content-Type"] === "application/json").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchPost_0100
     * @tc.name 返回Post内容
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchPost_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/post",
            method: "POST",
            data: "MineMine",
            success: function (data) {
              console.info("NetStack " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(JSON.parse(data.data.toString())["data"] === "MineMine").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done()
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchPost_0200
     * @tc.name 返回Post内容
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchPost_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/post",
            method: "POST",
            data: "MineMine",
            responseType: "json",
            success: function (data) {
              console.info("NetStack " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(data.data["data"] === "MineMine").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchPut_0100
     * @tc.name 返回Put内容
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchPut_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/put",
            method: "PUT",
            data: "MineMine",
            success: function (data) {
              console.info("NetStack " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(JSON.parse(data.data.toString())["data"] === "MineMine").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchPut_0200
     * @tc.name 返回Put内容
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchPut_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/put",
            method: "PUT",
            data: "MineMine",
            responseType: "json",
            success: function (data) {
              console.info("NetStack " + JSON.stringify(data));
              if (data.code === 200) {
                expect(data.code === 200 || data.code > 500).assertTrue();
                expect(data.data["data"] === "MineMine").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchUrlEncode_0100
     * @tc.name 返回Cookies内容
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchUrlEncode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/response-headers?key1=val1&key2=val2",
            data: {
              "name1": "mine1",
              "name2": "mine2",
            },
            success: function (data) {
              console.info("NetStack " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(JSON.parse(data.data.toString())["key1"] === "val1").assertTrue();
                expect(JSON.parse(data.data.toString())["key2"] === "val2").assertTrue();
                expect(JSON.parse(data.data.toString())["name1"] === "mine1").assertTrue();
                expect(JSON.parse(data.data.toString())["name2"] === "mine2").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });

    /**
     * @tc.number Telephony_NetStack_HttpTestFetchUrlEncode_0200
     * @tc.name 返回Cookies内容
     * @tc.desc function test
     */
    it("Telephony_NetStack_HttpTestFetchUrlEncode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      let httpRequest = http.createHttp();
      httpRequest.request("https://httpbin.org", {
        readTimeout: 10000,
        connectTimeout: 10000
      }, (err, data) => {
        if (!err) {
          fetch.fetch({
            url: "https://httpbin.org/response-headers?key1=val1&key2=val2",
            data: {
              "name1": "mine1",
              "name2": "mine2",
            },
            responseType: "json",
            success: function (data) {
              console.info("NetStack " + JSON.stringify(data));
              expect(data.code === 200 || data.code > 500).assertTrue();
              if (data.code === 200) {
                expect(data.data["key1"] === "val1").assertTrue();
                expect(data.data["key2"] === "val2").assertTrue();
                expect(data.data["name1"] === "mine1").assertTrue();
                expect(data.data["name2"] === "mine2").assertTrue();
              }
              done();
            },
            fail: function () {
              console.info("NetStack Fetch Failed");
              expect().assertFail();
              done();
            },
            complete: function () {
              console.info("NetStack Fetch Complete");
            }
          })
        } else {
          console.info('error:' + JSON.stringify(err));
          done();
        }
        httpRequest.destroy();
      });
    });
  });
}