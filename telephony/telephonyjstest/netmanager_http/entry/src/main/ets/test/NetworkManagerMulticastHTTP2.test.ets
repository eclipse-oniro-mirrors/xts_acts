/**
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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

import { describe, expect, it, afterEach, afterAll } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';

let httpRequest = http.createHttp();
let url = "http://www.baidu.com";

let httpRequestOptions_http3:http.HttpRequestOptions = {
    method: http.RequestMethod.POST,
    usingProtocol: http.HttpProtocol.HTTP3,
    header:{
        'Content-Type': 'application/json'
    },
    extraData: "MineMine",
    dnsServers: [""]
}

let httpRequestOptions_http3_HTTP1_1:http.HttpRequestOptions = {
    method: http.RequestMethod.POST,
    usingProtocol: http.HttpProtocol.HTTP1_1,
    header:{
        'Content-Type': 'application/json'
    },
    extraData: "MineMine",
    dnsServers: [""]
}

let httpRequestOptions_http3_HTTP2:http.HttpRequestOptions = {
    method: http.RequestMethod.POST,
    usingProtocol: http.HttpProtocol.HTTP2,
    header:{
        'Content-Type': 'application/json'
    },
    extraData: "MineMine",
    dnsServers: [""]
}

function expectFalse() {
    try {
        expect().assertFail();
    } catch(err) {
        console.info('assertion failure');
    }
}

export default function NetworkManagerMulticast2HTTP2Test() {
    afterAll(async ()=> {
        console.log('NetworkManagerMulticastHTTPTest afterAll start');
        console.log('NetworkManagerMulticastHTTPTest afterAll end');
    });
    describe("NetworkManagerMulticast2HTTP2Test", ()=> {
        /**
         * @tc.number: SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0100
         * @tc.name: HTTP::request
         * @tc.desc: Test request property.
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0100", 0, async (done: Function)=>{
            let caseName = "SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0100";
            httpRequest.request(url,httpRequestOptions_http3).then((data) => {
                console.log(`${caseName} request succeed, data: ${JSON.stringify(data)}`);
                expect(data.responseCode === 200).assertTrue();
                done();
            }).catch((err: BusinessError) => {
                console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                expectFalse();
                done();
            })
        })
        /**
         * @tc.number: SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0200
         * @tc.name: HTTP::request
         * @tc.desc: Test request property.
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0200", 0, async (done: Function)=>{
            let caseName = "SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0200";
            httpRequest.request(url,httpRequestOptions_http3_HTTP1_1).then((data) => {
                console.log(`${caseName} request succeed, data: ${JSON.stringify(data)}`);
                expect(data.responseCode === 200).assertTrue();
                done();
            }).catch((err: BusinessError) => {
                console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                expectFalse();
                done();
            })
        })
        /**
         * @tc.number: SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0300
         * @tc.name: HTTP::request
         * @tc.desc: Test request property.
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0300", 0, async (done: Function)=>{
            let caseName = "SUB_Telephone_netstack_Http3_QUIC_Xts_Promise_0300";
            httpRequest.request(url,httpRequestOptions_http3_HTTP2).then((data) => {
                console.log(`${caseName} request succeed, data: ${JSON.stringify(data)}`);
                expect(data.responseCode === 200).assertTrue();
                done();
            }).catch((err: BusinessError) => {
                console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                expectFalse();
                done();
            })
        })
    })
}