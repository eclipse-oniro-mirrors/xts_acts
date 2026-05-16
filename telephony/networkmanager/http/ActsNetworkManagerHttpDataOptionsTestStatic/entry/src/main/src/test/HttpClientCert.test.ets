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

const certPath_legitimate: string = "xtsTest";
const keyPath_legitimate: string = "xtsTest";
const pwd: string = "123";

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


export default function httpClientCertTest() {

    describe("HttpClientCertTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name   testHttpClientCert_static_0100
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0100
         * @tc.desc   test clientCert with no certPath no keyPath certType any
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testHttpClientCert_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test0100';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            {
                                method: http.RequestMethod.GET,
                                extraData: "MineMine",
                                header: {
                                    "Content-Type": "application/json",
                                } as Record<string,string>,
                                readTimeout: 60000,
                                connectTimeout: 60000,
                                clientCert: {
                                    certPath: "",
                                    keyPath: "",
                                    keyPassword: pwd,
                                    certType: http.CertType.P12,
                                } as http.ClientCert,
                            },
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +' httpRequest fail, get error is '+JSON.stringify(err));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: data ->'+JSON.stringify(data));
                                    ExpectTrue(data?.responseCode == 200);
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
         * @tc.name   testHttpClientCert_static_0200
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0200
         * @tc.desc   test clientCert with no certPath no keyPath certType any
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_0200';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            extraData: "MineMine",
                            header: {
                                "Content-Type": "application/json",
                            } as Record<string,string>,
                            readTimeout: 60000,
                            connectTimeout: 60000,
                            clientCert: {
                                certPath: "",
                                keyPath: "",
                                keyPassword: pwd,
                                certType: http.CertType.P12,
                            }as http.ClientCert,
                        }).then((res: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'request success res: res ->'+JSON.stringify(res));
                            ExpectTrue(res.responseCode == 200);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' request failed err '+JSON.stringify(err));
                            ExpectFail();
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
         * @tc.name   testHttpClientCert_static_0300
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0300
         * @tc.desc   test clientCert with illegal certPath illegal keyPath certType any legitimated
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_0300';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            {
                                method: http.RequestMethod.GET,
                                extraData: "MineMine",
                                header: {
                                    "Content-Type": "application/json",
                                }as Record<string,string>,
                                readTimeout: 60000,
                                connectTimeout: 60000,
                                clientCert: {
                                    certPath: "aaa",
                                    keyPath: "aaa",
                                    keyPassword: pwd,
                                    certType: http.CertType.P12,
                                } as http.ClientCert,
                            },
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                    ExpectTrue(err?.code == 2300058);
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +' request success ');
                                    ExpectFail();
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                }
                            }
                        );
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
         * @tc.name   testHttpClientCert_static_0400
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0400
         * @tc.desc   test clientCert with illegal certPath illegal keyPath certType any legitimated
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_0400';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            extraData: "MineMine",
                            header: {
                                "Content-Type": "application/json",
                            }as Record<string,string>,
                            readTimeout: 60000,
                            connectTimeout: 60000,
                            clientCert: {
                                certPath: "aaa",
                                keyPath: "aaa",
                                keyPassword: pwd,
                                certType: http.CertType.P12,
                            } as http.ClientCert,
                        }).then((res: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +' request success res:'+JSON.stringify(res));
                            ExpectFail();
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err.code == 2300058);
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
         * @tc.name   testHttpClientCert_static_0500
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0500
         * @tc.desc   test clientCert with  legitimated certPath and keyPath http.CertType.P12
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_0500';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            {
                                method: http.RequestMethod.GET,
                                extraData: "MineMine",
                                header: {
                                    "Content-Type": "application/json",
                                }as Record<string,string>,
                                readTimeout: 60000,
                                connectTimeout: 60000,
                                clientCert: {
                                    certPath: certPath_legitimate,
                                    keyPath: keyPath_legitimate,
                                    keyPassword: pwd,
                                    certType: http.CertType.P12,
                                } as http.ClientCert,
                            },
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest fail err is '+JSON.stringify(err));
                                    ExpectTrue(err?.code == 2300058);
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success : data ->'+JSON.stringify(data));
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
         * @tc.name   testHttpClientCert_static_0600
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0600
         * @tc.desc   test clientCert with  legitimated certPath and keyPath http.CertType.P12
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_0600';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            extraData: "MineMine",
                            header: {
                                "Content-Type": "application/json",
                            }as Record<string,string>,
                            readTimeout: 60000,
                            connectTimeout: 60000,
                            clientCert: {
                                certPath: certPath_legitimate,
                                keyPath: keyPath_legitimate,
                                keyPassword: pwd,
                                certType: http.CertType.P12,
                            }as http.ClientCert,
                        }).then((res: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'request success res:: data ->'+JSON.stringify(res));
                            ExpectFail();
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest fail: get error is '+JSON.stringify(err));
                            ExpectTrue(err.code == 2300058);
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
         * @tc.name   testHttpClientCert_static_0700
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0700
         * @tc.desc   test clientCert with  legitimated certPath and keyPath http.CertType.PEM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_0700';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            {
                                method: http.RequestMethod.GET,
                                extraData: "MineMine",
                                header: {
                                    "Content-Type": "application/json",
                                }as Record<string,string>,
                                readTimeout: 60000,
                                connectTimeout: 60000,
                                clientCert: {
                                    certPath: certPath_legitimate,
                                    keyPath: keyPath_legitimate,
                                    keyPassword: pwd,
                                    certType: http.CertType.PEM,
                                }as http.ClientCert,
                            },
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest fail, get error is '+JSON.stringify(err));
                                    ExpectTrue(err?.code == 2300058);
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: data ->'+JSON.stringify(data));
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
         * @tc.name   testHttpClientCert_static_0800
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0800
         * @tc.desc   test clientCert with  legitimated certPath and keyPath http.CertType.PEM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_0800';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            extraData: "MineMine",
                            header: {
                                "Content-Type": "application/json",
                            }as Record<string,string>,
                            readTimeout: 60000,
                            connectTimeout: 60000,
                            clientCert: {
                                certPath: certPath_legitimate,
                                keyPath: keyPath_legitimate,
                                keyPassword: pwd,
                                certType: http.CertType.PEM,
                            }as http.ClientCert,
                        }).then((res: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'request success res: ->'+JSON.stringify(res));
                            ExpectFail();
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest fail: get error is '+JSON.stringify(err));
                            ExpectTrue(err.code == 2300058);
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
         * @tc.name   testHttpClientCert_static_0900
         * @tc.number SUB_NetworkMgr_Http_ClientCert_0900
         * @tc.desc   test clientCert with  legitimated certPath and keyPath http.CertType.DER
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_0900';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            {
                                method: http.RequestMethod.GET,
                                extraData: "MineMine",
                                header: {
                                    "Content-Type": "application/json",
                                }as Record<string,string>,
                                readTimeout: 60000,
                                connectTimeout: 60000,
                                clientCert: {
                                    certPath: certPath_legitimate,
                                    keyPath: keyPath_legitimate,
                                    keyPassword: pwd,
                                    certType: http.CertType.DER,
                                }as http.ClientCert,
                            },
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                    ExpectTrue(err?.code == 2300058);
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName + 'httpRequest success: data ->'+JSON.stringify(data));
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
         * @tc.name   testHttpClientCert_static_1000
         * @tc.number SUB_NetworkMgr_Http_ClientCert_1000
         * @tc.desc   test clientCert with  legitimated certPath and keyPath http.CertType.DER
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpClientCert_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpClientCert_static_1000';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            extraData: "MineMine",
                            header: {
                                "Content-Type": "application/json",
                            }as Record<string,string>,
                            readTimeout: 60000,
                            connectTimeout: 60000,
                            clientCert: {
                                certPath: certPath_legitimate,
                                keyPath: keyPath_legitimate,
                                keyPassword: pwd,
                                certType: http.CertType.DER,
                            }as http.ClientCert,
                        }).then((res: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'request success res: ->'+JSON.stringify(res));
                            ExpectFail();
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err.code == 2300058);
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

    })

}