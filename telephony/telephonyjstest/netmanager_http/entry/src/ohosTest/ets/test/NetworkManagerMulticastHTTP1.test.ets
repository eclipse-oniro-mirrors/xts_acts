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

import { describe, expect, it, afterEach, afterAll, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import display from '@ohos.display';

let httpRequest = http.createHttp();
let url = "http://httpbin.org/anything";

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

export default function NetworkManagerMulticast1HTTP2Test() {
    afterAll(async ()=> {
        console.log('NetworkManagerMulticastHTTPTest afterAll start');
        console.log('NetworkManagerMulticastHTTPTest afterAll end');
    });
    describe("NetworkManagerMulticast1HTTP2Test", ()=> {
        /**
         * @tc.number: SUB_Telephone_netstack_Http3_QUIC_Xts_Async_0100
         * @tc.name: HTTP::request
         * @tc.desc: Test request property.
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("SUB_Telephone_netstack_Http3_QUIC_Xts_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function)=>{
            let caseName = "SUB_Telephone_netstack_Http3_QUIC_Xts_Async_0100";
            try {
                httpRequest.request(url,httpRequestOptions_http3,(err,data)=>{
                    if(err) {
                        console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                        expect(err.code === 2300999).assertTrue();
                        done();
                    } else {
                        console.log(`${caseName} request succeed, err: ${JSON.stringify(data)}`);
                        expect(data.responseCode === 200).assertTrue();
                        done();
                    }
                })
            } catch(error) {
                console.log(`${caseName} request failed, err: ${JSON.stringify(error)}`);
            }
        })
        /**
         * @tc.number: SUB_Telephone_netstack_Http3_QUIC_Xts_Async_0200
         * @tc.name: HTTP::request
         * @tc.desc: Test request property.
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("SUB_Telephone_netstack_Http3_QUIC_Xts_Async_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function)=>{
            let caseName = "SUB_Telephone_netstack_Http3_QUIC_Xts_Async_0200";
            httpRequest.request(url,httpRequestOptions_http3_HTTP1_1,(err,data)=>{
                if(err) {
                    console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                    expect(err.code === 2300999).assertTrue();
                    done();
                } else {
                    console.log(`${caseName} request succeed, err: ${JSON.stringify(data)}`);
                    expect(data.responseCode === 200).assertTrue();
                    done();
                }
            })
        })
        /**
         * @tc.number: SUB_Telephone_netstack_Http3_QUIC_Xts_Async_0300
         * @tc.name: HTTP::request
         * @tc.desc: Test request property.
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("SUB_Telephone_netstack_Http3_QUIC_Xts_Async_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function)=>{
            let caseName = "SUB_NetworkManager_HTTP_Request_Async_0300";
            httpRequest.request(url,httpRequestOptions_http3_HTTP2,(err,data)=>{
                if(err) {
                    console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                    expect(err.code === 2300999).assertTrue();
                    done();
                } else {
                    console.log(`${caseName} request succeed, err: ${JSON.stringify(data)}`);
                    expect(data.responseCode === 200).assertTrue();
                    done();
                }
            })
        })
    })
}
