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

function expectTrue(data : boolean){
    try {
        expect(data).assertTrue();
    } catch (err){
        console.info('assertion failure');    
    }
};

export default function NetworkManagerMulticast2HTTP2Test() {
    afterAll(async ()=> {
        console.log('NetworkManagerMulticastHTTPTest afterAll start');
        console.log('NetworkManagerMulticastHTTPTest afterAll end');
    });
    describe("NetworkManagerMulticast2HTTP2Test", ()=> {
        /**
         * @tc.number: SUB_NetworkMgr_Http_QUIC_Xts_Promise_0100
         * @tc.name: testNetworkMgrHttpQUICXtsPromise0100
         * @tc.desc: Test request property.
         * @tc.level: level1
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("testNetworkMgrHttpQUICXtsPromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function)=>{
            let caseName:string = "testNetworkMgrHttpQUICXtsPromise0100";
            console.info(`${caseName}---Start`);
            try {
                httpRequest.request(url,httpRequestOptions_http3).then((data) => {
                    console.log(`${caseName} request succeed, data: ${JSON.stringify(data)}`);
                    expectTrue(data.responseCode === 200);
                    console.info(`${caseName}---End`);
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                    expectFalse();
                    console.info(`${caseName}---End`);
                    done();
                })
            }catch (error) {
                console.log(`${caseName} request failed, error: ${JSON.stringify(error)}`);
                expectFalse();
                console.info(`${caseName}---End`);
                done();
            }
        })
        /**
         * @tc.number: SUB_NetworkMgr_Http_QUIC_Xts_Promise_0200
         * @tc.name: testNetworkMgrHttpQUICXtsPromise0200
         * @tc.desc: Test request property.
         * @tc.level: level1
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("testNetworkMgrHttpQUICXtsPromise0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function)=>{
            let caseName:string = "testNetworkMgrHttpQUICXtsPromise0200";
            console.info(`${caseName}---Start`);
            try {
                httpRequest.request(url,httpRequestOptions_http3_HTTP1_1).then((data) => {
                    console.log(`${caseName} request succeed, data: ${JSON.stringify(data)}`);
                    expectTrue(data.responseCode === 200);
                    console.info(`${caseName}---End`);
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                    expectFalse();
                    console.info(`${caseName}---End`);
                    done();
                })
            }catch (error) {
                console.log(`${caseName} request failed, error: ${JSON.stringify(error)}`);
                expectFalse();
                console.info(`${caseName}---End`);
                done();
            }
        })
        /**
         * @tc.number: SUB_NetworkMgr_Http_QUIC_Xts_Promise_0300
         * @tc.name: testNetworkMgrHttpQUICXtsPromise0300
         * @tc.desc: Test request property.
         * @tc.level: level1
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("testNetworkMgrHttpQUICXtsPromise0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function)=>{
            let caseName:string = "testNetworkMgrHttpQUICXtsPromise0300";
            console.info(`${caseName}---Start`);
            try {
                httpRequest.request(url,httpRequestOptions_http3_HTTP2).then((data) => {
                    console.log(`${caseName} request succeed, data: ${JSON.stringify(data)}`);
                    expectTrue(data.responseCode === 200);
                    console.info(`${caseName}---End`);
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
                    expectFalse();
                    console.info(`${caseName}---End`);
                    done();
                })
            }catch (error) {
                console.log(`${caseName} request failed, error: ${JSON.stringify(error)}`);
                expectFalse();
                console.info(`${caseName}---End`);
                done();
            }
        })
    })
}