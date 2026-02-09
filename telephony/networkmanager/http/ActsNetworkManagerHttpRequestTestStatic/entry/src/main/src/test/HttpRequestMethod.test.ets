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
let ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";


const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err: BusinessError) {
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err: BusinessError) {
        console.info("expectInfo", `test sucess`);
    }
}


export default function httpRequestMethodTest() {

    describe("HttpRequestMethodTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   testHttpRequestMethodGET_static_0100
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0100
         * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodGET_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodGET_static_0100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodGET_static_0200
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0200
         * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodGET_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodGET_static_0200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest  error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodGET_static_0300
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0300
         * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodGET_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodGET_static_0300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodGET_static_0400
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0400
         * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodGET_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodGET_static_0400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodGET_static_0500
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0500
         * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodGET_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodGET_static_0500";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300999);//The device does not support HTTP3
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodGET_static_0600
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0600
         * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodGET_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodGET_static_0600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.GET,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999);//The device does not support HTTP3
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodHEAD_static_0700
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_0700
         * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodHEAD_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodHEAD_static_0700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.HEAD,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodHEAD_static_0800
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_0800
         * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodHEAD_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodHEAD_static_0800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.HEAD,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodHEAD_static_0900
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_0900
         * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodHEAD_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodHEAD_static_0900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                    }
                });
                let httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                    method: http.RequestMethod.HEAD,
                    usingProtocol: http.HttpProtocol.HTTP2
                }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                    if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                        ExpectFail();
                        httpRequest.destroy();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                        ExpectTrue(data?.responseCode == 200);
                        httpRequest.destroy();
                        done();
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodHEAD_static_1000
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_1000
         * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodHEAD_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodHEAD_static_1000";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.HEAD,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodHEAD_static_1100
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_1100
         * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodHEAD_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodHEAD_static_1100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.HEAD,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300999);
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodHEAD_static_1200
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_1200
         * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodHEAD_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodHEAD_static_1200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.HEAD,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodOPTIONS_static_1300
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1300
         * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodOPTIONS_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodOPTIONS_static_1300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.OPTIONS,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodOPTIONS_static_1400
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1400
         * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodOPTIONS_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodOPTIONS_static_1400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.OPTIONS,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => { let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');

        });

        /**
         * @tc.name   testHttpRequestMethodOPTIONS_static_1500
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1500
         * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodOPTIONS_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodOPTIONS_static_1500";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.OPTIONS,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodOPTIONS_static_1600
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1600
         * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodOPTIONS_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodOPTIONS_static_1600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.OPTIONS,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodOPTIONS_static_1700
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1700
         * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodOPTIONS_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodOPTIONS_static_1700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                    }
                });
                let httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                    method: http.RequestMethod.OPTIONS,
                    usingProtocol: http.HttpProtocol.HTTP3
                }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                    if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 2300999);
                        httpRequest.destroy();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                        ExpectTrue(data?.responseCode == 200);
                        httpRequest.destroy();
                        done();
                    }
                });
            }
            catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodOPTIONS_static_1800
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1800
         * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodOPTIONS_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodOPTIONS_static_1800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.OPTIONS,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPOST_static_1900
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_1900
         * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPOST_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPOST_static_1900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                    }
                });
                let httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                    method: http.RequestMethod.POST,
                    usingProtocol: http.HttpProtocol.HTTP1_1
                }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                    if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                        ExpectFail();
                        httpRequest.destroy();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                        ExpectTrue(data?.responseCode == 200);
                        httpRequest.destroy();
                        done();
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPOST_static_2000
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2000
         * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPOST_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPOST_static_2000";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.POST,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => { let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPOST_static_2100
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2100
         * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPOST_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPOST_static_2100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.POST,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPOST_static_2200
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2200
         * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPOST_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPOST_static_2200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.POST,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPOST_static_2300
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2300
         * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPOST_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPOST_static_2300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.POST,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300999);
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPOST_static_2400
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2400
         * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPOST_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPOST_static_2400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.POST,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPUT_static_2500
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2500
         * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPUT_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPUT_static_2500";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.PUT,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPUT_static_2600
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2600
         * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPUT_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPUT_static_2600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.PUT,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => { let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPUT_static_2700
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2700
         * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPUT_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPUT_static_2700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.PUT,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPUT_static_2800
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2800
         * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPUT_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPUT_static_2800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.PUT,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => { let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPUT_static_2900
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2900
         * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPUT_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPUT_static_2900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                    }
                });
                let httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                    method: http.RequestMethod.PUT,
                    usingProtocol: http.HttpProtocol.HTTP3
                }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                    if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 2300999);
                        httpRequest.destroy();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                        ExpectTrue(data?.responseCode == 200);
                        httpRequest.destroy();
                        done();
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodPUT_static_3000
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_3000
         * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodPUT_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodPUT_static_3000";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.PUT,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodDELETE_static_3100
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3100
         * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodDELETE_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodDELETE_static_3100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.DELETE,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodDELETE_static_3200
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3200
         * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodDELETE_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodDELETE_static_3200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.DELETE,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodDELETE_static_3300
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3300
         * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodDELETE_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodDELETE_static_3300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.DELETE,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodDELETE_static_3400
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3400
         * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodDELETE_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodDELETE_static_3400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.DELETE,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodDELETE_static_3500
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3500
         * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodDELETE_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodDELETE_static_3500";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.DELETE,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300999);
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodDELETE_static_3600
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3600
         * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodDELETE_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodDELETE_static_3600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.DELETE,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodTRACE_static_3700
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_3700
         * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodTRACE_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodTRACE_static_3700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.TRACE,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(typeof data?.responseCode == 'int');
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodTRACE_static_3800
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_3800
         * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodTRACE_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodTRACE_static_3800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.TRACE,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(typeof data?.responseCode == 'int');
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => { let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        })

        /**
         * @tc.name   testHttpRequestMethodTRACE_static_3900
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_3900
         * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodTRACE_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodTRACE_static_3900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.TRACE,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(typeof data?.responseCode == 'int');
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodTRACE_static_4000
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_4000
         * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodTRACE_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodTRACE_static_4000";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.TRACE,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(typeof data?.responseCode == 'int');
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => { let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodTRACE_static_4100
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_4100
         * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodTRACE_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodTRACE_static_4100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.TRACE,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300999);
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(typeof data?.responseCode == 'int');
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodTRACE_static_4200
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_4200
         * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodTRACE_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodTRACE_static_4200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.TRACE,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(typeof data?.responseCode == 'int');
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodCONNECT_static_4300
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4300
         * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodCONNECT_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodCONNECT_static_4300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                    }
                });
                let httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                    method: http.RequestMethod.CONNECT,
                    usingProtocol: http.HttpProtocol.HTTP1_1
                }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                    if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                        ExpectFail();
                        httpRequest.destroy();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                        ExpectTrue(typeof data?.responseCode == 'int');
                        httpRequest.destroy();
                        done();
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodCONNECT_static_4400
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4400
         * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodCONNECT_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodCONNECT_static_4400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.CONNECT,
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(typeof data?.responseCode == 'int');
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodCONNECT_static_4500
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4500
         * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodCONNECT_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodCONNECT_static_4500";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                    }
                });
                let httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                    method: http.RequestMethod.CONNECT,
                    usingProtocol: http.HttpProtocol.HTTP2
                }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                    if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                        ExpectFail();
                        httpRequest.destroy();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                        ExpectTrue(typeof data?.responseCode == 'int');
                        httpRequest.destroy();
                        done();
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodCONNECT_static_4600
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4600
         * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodCONNECT_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodCONNECT_static_4600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.CONNECT,
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(typeof data?.responseCode == 'int');
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodCONNECT_static_4700
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4700
         * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodCONNECT_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodCONNECT_static_4700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.CONNECT,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300999);
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(typeof data?.responseCode == 'int');
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequestMethodCONNECT_static_4800
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4800
         * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestMethodCONNECT_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodCONNECT_static_4800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Network connected  ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.CONNECT,
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +':  httpRequest success ->'+JSON.stringify(data));
                            ExpectTrue(typeof data?.responseCode == 'int');
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +' trycatch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


    })

}