/**
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import netHttp from '@ohos.net.http';
import { describe, expect, it, TestType, Size, Level  } from '@ohos/hypium'

export default function Telephony_NETSTACK_HTTPTest() {

    describe('Telephony_NETSTACK_HTTPTest', function () {

        /**
         * @tc.number Telephony_NETSTACK_HttpTestBasicGet_0100
         * @tc.name 基本场景，测试能否GET一个网址
         * @tc.desc Function test`
         */

        it('Telephony_NETSTACK_HttpTestBasicGet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let http = netHttp.createHttp();
            http.request("https://httpbin.org/anything").then(function (data) {
                http.destroy();
                expect(data.responseCode === netHttp.ResponseCode.OK || data.responseCode > 500).assertTrue();
                done();
            });
        });

        /**
         * @tc.number Telephony_NETSTACK_HttpTestUserAgent_0100
         * @tc.name 返回用户代理
         * @tc.desc Function test`
         */

        it('Telephony_NETSTACK_HttpTestUserAgent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let http = netHttp.createHttp();
            http.request("https://httpbin.org/user-agent").then(function (data) {
                http.destroy();
                expect(data.responseCode === netHttp.ResponseCode.OK || data.responseCode > 500).assertTrue();
                if (data.responseCode === netHttp.ResponseCode.OK) {
                    console.info(JSON.stringify(data));
                    expect(data.result.toString().search("user-agent") != -1).assertTrue();
                    expect(data.result.toString().search("libcurl-agent/1.0") != -1).assertTrue();
                }
                done();
            });
        });

        /**
         * @tc.number Telephony_NETSTACK_HttpTestHeader_0100
         * @tc.name 返回Header
         * @tc.desc Function test`
         */

		 it('Telephony_NETSTACK_HttpTestHeader_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
		  let http = netHttp.createHttp();
		  http.request("https://httpbin.org/get" ,{
			method: netHttp.RequestMethod.GET,
			extraData: "MineMine",
			header: { 'Content-Type': 'application/json' }
		  }).then(function (data) {
			http.destroy();
			expect(data.responseCode === netHttp.ResponseCode.OK || data.responseCode > 500).assertTrue();
			console.info("Telephony_NETSTACK_HttpTestHeader_0100" + JSON.stringify(data.result));
			if (data.responseCode === netHttp.ResponseCode.OK) {
			  expect(data.result.toString().search("Content-Type") != -1).assertTrue();
			  expect(data.result.toString().search("application/json") != -1).assertTrue();
			}
			done()
		  });
		});

        /**
         * @tc.number Telephony_NETSTACK_HttpTestPost
         * @tc.name 返回post内容
         * @tc.desc Function test`
         */

        it('Telephony_NETSTACK_HttpTestPost_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let http = netHttp.createHttp();
            http.request("https://httpbin.org/post", {
                method: netHttp.RequestMethod.POST,
                extraData: "MineMine"
            }).then(function (data) {
                http.destroy();
                expect(data.responseCode === netHttp.ResponseCode.OK || data.responseCode > 500).assertTrue();
                if (data.responseCode === netHttp.ResponseCode.OK) {
                    expect(data.result.toString().search("MineMine") != -1).assertTrue()
                }
                done();
            });
        });

        /**
         * @tc.number Telephony_NETSTACK_HttpTestPUT
         * @tc.name 返回put内容
         * @tc.desc Function test`
         */

        it('Telephony_NETSTACK_HttpTestPut_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let http = netHttp.createHttp();
            http.request("https://httpbin.org/put", {
                method: netHttp.RequestMethod.PUT,
                extraData: "MineMine"
            }).then(function (data) {
                http.destroy();
                expect(data.responseCode === netHttp.ResponseCode.OK || data.responseCode > 500).assertTrue();
                if (data.responseCode === netHttp.ResponseCode.OK) {
                    expect(data.result.toString().search("MineMine") != -1).assertTrue()
                }
                done();
            });
        });

        /**
         * @tc.number Telephony_NETSTACK_HttpTestCookies
         * @tc.name 返回Cookies内容
         * @tc.desc Function test`
         */

        it('Telephony_NETSTACK_HttpTestCookies_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let http = netHttp.createHttp();
            http.request("https://httpbin.org/cookies/set/name/value").then(function (data) {
                http.destroy();
                expect(data.responseCode === netHttp.ResponseCode.OK || data.responseCode > 500).assertTrue();
                if (data.responseCode === netHttp.ResponseCode.OK) {
                    expect(data.cookies !== "").assertTrue();
                }
                done();
            });
        });

        /**
         * @tc.number Telephony_NETSTACK_HttpTestEncode
         * @tc.name 返回Cookies内容
         * @tc.desc Function test`
         */

        it('Telephony_NETSTACK_HttpTestEncode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let http = netHttp.createHttp();
            http.request("https://httpbin.org/response-headers?key1=val1&key2=val2", {
                extraData: {
                    "name1": "mine1",
                    "name2": "mine2",
                }
            }).then(function (data) {
                http.destroy();
                expect(data.responseCode === netHttp.ResponseCode.OK || data.responseCode > 500).assertTrue();
                if (data.responseCode === netHttp.ResponseCode.OK) {
                    expect(data.result.toString().search("key1") != -1).assertTrue()
                    expect(data.result.toString().search("val1") != -1).assertTrue()
                    expect(data.result.toString().search("key2") != -1).assertTrue()
                    expect(data.result.toString().search("val2") != -1).assertTrue()
                    expect(data.result.toString().search("name1") != -1).assertTrue()
                    expect(data.result.toString().search("mine1") != -1).assertTrue()
                    expect(data.result.toString().search("name2") != -1).assertTrue()
                    expect(data.result.toString().search("mine2") != -1).assertTrue()
                }
                done();
            });
        });
    });
}