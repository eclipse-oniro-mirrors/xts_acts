/**
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";

let tlsOptions_system : http.TlsOptions = 'system'
let tlsConfigPram01 :http.TlsConfig = {
    tlsVersionMin: http.TlsVersion.TLS_V_1_0,
    tlsVersionMax: http.TlsVersion.TLS_V_1_1,
    cipherSuites:[ 'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
        'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
        'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
        'TLS_RSA_WITH_3DES_EDE_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV11CipherSuite
    ]
}
let tlsConfigPram02 :http.TlsConfig = {
    tlsVersionMin: http.TlsVersion.TLS_V_1_2,
    tlsVersionMax: http.TlsVersion.TLS_V_1_3,
    cipherSuites:[
        'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
        'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
        'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
        'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
        'TLS_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
        'TLS_AES_128_GCM_SHA256' as http.TlsV13SpecificCipherSuite as http.TlsV13CipherSuite,
    ]
}
let tlsOptions_config_01 : http.TlsOptions = tlsConfigPram01
let tlsOptions_config_02 : http.TlsOptions = tlsConfigPram02
let serverAuthentication: http.ServerAuthentication ={
    credential: {
        username: "proxy-username",
        password: "proxy-password"
    },
    authenticationType: "basic"
}


const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err) {
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err) {
        console.info("expectInfo", `test sucess`);
    }
}


export default function httpRequestErrorCodeTest() {

    describe("HttpRequestErrorCodeTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');


        /**
         * @tc.name   testHttpRequestMethodErrorCode_static_0100
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0100
         * @tc.desc   test http request(url, callback) with request error code 2300003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpRequestMethodErrorCode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpRequestMethodErrorCode_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('', (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if(err?.code != 0){
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300003);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }else{
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
                                ExpectFail();
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testHttpRequestMethodErrorCode_static_0200
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0200
         * @tc.desc   test http request(url, options, callback) with request error code 2300003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpRequestMethodErrorCode_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpRequestMethodErrorCode_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');

                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if(err?.code != 0){
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300003);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }else{
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
                                ExpectFail();
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testHttpRequestMethodErrorCode_static_0300
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0300
         * @tc.desc   test http request(url, options, Promise) with request error code 2300003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpRequestMethodErrorCode_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'test03testHttpRequestMethodErrorCode_static_030000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        let promise = httpRequest.request('', {
                            method: http.RequestMethod.GET,
                        });
                        promise.then((data:http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300003);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })




        /**
         * @tc.name   testHttpRequestMethodErrorCode_static_0700
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0700
         * @tc.desc   test http request(url, callback) with request error code 2300001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpRequestMethodErrorCode_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpRequestMethodErrorCode_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('ws://baidu.com', (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if(err?.code != 0){
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300001);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }else{
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectFail();
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testHttpRequestMethodErrorCode_static_0800
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0800
         * @tc.desc   test http request(url, options, callback) with request error code 2300001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpRequestMethodErrorCode_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpRequestMethodErrorCode_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('ws://baidu.com', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                           if(err?.code != 0){
                               hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                               ExpectTrue(err?.code == 2300001);
                               httpRequest.destroy();
                               hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                               done();
                           }else{
                               hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                               ExpectFail();
                               httpRequest.destroy();
                               hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                               done();
                           }
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })


    })

}