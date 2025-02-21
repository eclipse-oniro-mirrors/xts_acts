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

import net_Http from '@ohos.net.http';
import { describe, expect, it } from '@ohos/hypium'

export default function Http2Test() {
    describe('Http2Test', function () {

        /**
         * @tc.number Telephony_NETSTACK_Http2TestBasicGet_0100
         * @tc.name set usingCache to true
         * @tc.desc usingCache test
         */
        it('Telephony_NETSTACK_Http2TestBasicGet_0100', 0, async function (done) {
            let http = net_Http.createHttp();
            http.request("https://www.zhihu.com", {
                usingProtocol: net_Http.HttpProtocol.HTTP1_1
            }).then(function (data) {
                http.destroy();
                expect(data.responseCode === net_Http.ResponseCode.OK).assertTrue();
                done();
            });
        });

        /**
         * @tc.number Telephony_NETSTACK_Http2TestBasicGet_0200
         * @tc.name set usingCache to true
         * @tc.desc usingCache test
         */
        it('Telephony_NETSTACK_Http2TestBasicGet_0200', 0, async function (done) {
            let http = net_Http.createHttp();
            http.request("https://www.zhihu.com", {
                usingProtocol: net_Http.HttpProtocol.HTTP2
            }).then(function (data) {
                http.destroy();
                console.info("Telephony_NETSTACK_Http2TestBasicGet_0200" + JSON.stringify(data));
                expect(data.responseCode === net_Http.ResponseCode.OK).assertTrue();
                done();
            });
        });

        /**
         * @tc.number Telephony_NETSTACK_Http2TestBasicGet_0300
         * @tc.name set usingCache to true
         * @tc.desc usingCache test
         */
        it('Telephony_NETSTACK_Http2TestBasicGet_0300', 0, async function (done) {
            let http = net_Http.createHttp();
            http.request("https://www.zhihu.com").then(function (data) {
                http.destroy();
                console.info("Telephony_NETSTACK_Http2TestBasicGet_0300" + JSON.stringify(data));
                expect(data.responseCode === net_Http.ResponseCode.OK).assertTrue();
                done();
            });
        });

        /**
         * @tc.number Telephony_NETSTACK_Http2TestBasicGet_0400
         * @tc.name set usingCache to true
         * @tc.desc usingCache test
         */
        it('Telephony_NETSTACK_Http2TestBasicGet_0400', 0, async function (done) {
            expect(net_Http.HttpProtocol.HTTP1_1).assertEqual(0);
            expect(net_Http.HttpProtocol.HTTP2).assertEqual(1);
            done();
        });

        /**
         * @tc.number Telephony_NETSTACK_Http2TestBasicGet_0500
         * @tc.name set usingCache to true
         * @tc.desc usingCache test
         */
        it('Telephony_NETSTACK_Http2TestBasicGet_0500', 0, async function (done) {
            expect(net_Http.HttpDataType.STRING).assertEqual(0);
            expect(net_Http.HttpDataType.OBJECT).assertEqual(1);
            expect(net_Http.HttpDataType.ARRAY_BUFFER).assertEqual(2);
            done();
        });

        it('Telephony_http_HttpTestPriority_0100', 0, async function (done) {
            let CaseName = 'Telephony_http_HttpTestPriority_0100';
            try {
                let httpRequestOptions = {
                    method: net_Http.RequestMethod.GET,
                    extraData: null,
                    expectDataType: net_Http.HttpDataType.STRING,
                    header: "content-type': 'application/json",
                    readTimeout: 6000,
                    connectTimeout: 6000,
                    priority: 100
                }
                var httpRequest = net_Http.createHttp();
                httpRequest.request("https://www.zhihu.com", httpRequestOptions, (err, data) => {
                    httpRequest.destroy();
                    console.info(CaseName + JSON.stringify(err) + "data" + JSON.stringify(data));
                    expect(data.responseCode === net_Http.ResponseCode.OK).assertTrue();
                    expect(data.resultType == net_Http.HttpDataType.STRING).assertTrue();
                    done();
                });
            } catch (err) {
                console.info(CaseName + "err=" + err);
                done();
                return;
            }
        });
    });
}