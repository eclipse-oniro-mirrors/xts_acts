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
let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
let XTS_TEST_HTTPS_URL: string = 'https://www.baidu.com/';

type keys = 'letter' | 'characters';

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


export default function httpRequestOptionsTest() {

    describe("HttpRequestOptionsTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_0100
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_0100
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: {
                                "letter": "test",
                                "characters": "测试文字",
                            }as Record<keys,string>,
                            header: "content-type': 'application/json",
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                    ExpectTrue(data?.responseCode == 200);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_0200
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_0200
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: 'testInformation测试',
                            header: "content-type': 'application/x-www-form-urlencoded",
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                    ExpectTrue(data?.responseCode == 200);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_0300
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_0300
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: 'testInformation测试',
                            header: "content-type': 'text/xml",
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_0400
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_0400
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: {
                                "letter": "test",
                                "characters": "测试文字",
                            }as Record<keys,string>,
                            header: "content-type': 'application/json",
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_0500
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_0500
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: 'testInformation测试',
                            header: "content-type': 'application/x-www-form-urlencoded",
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_0600
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_0600
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: 'testInformation测试',
                            header: "content-type': 'text/xml",
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_0700
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_0700
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: ''
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_0800
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_0800
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingCache: true
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                console.info(`${caseName} firstResponse err ---${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                                httpResponseCache.flush((err: BusinessError<void>|null) => {
                                    if (err?.code != 0) {
                                        console.info(`${caseName} flush err ---${JSON.stringify(err)}`);
                                        ExpectFail();
                                        httpRequest.destroy();
                                        done();
                                    } else {
                                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                            if (err?.code != 0) {
                                                console.info(`${caseName} secondResponse err ---${JSON.stringify(err)}`);
                                                ExpectFail();
                                                httpRequest.destroy();
                                                done();
                                            } else {
                                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                                ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                                                httpRequest.destroy();
                                                done();
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1000
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1000
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingCache: true
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
                        httpRequest.request('http://httpbin.org/anything', httpRequestOptions).then((data: http.HttpResponse) => {
                            console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                            httpResponseCache.flush((err: BusinessError<void>|null) => {
                                if (err?.code != 0) {
                                    console.info(`${caseName} flush err ---${JSON.stringify(err)}`);
                                    ExpectFail();
                                    done();
                                } else {
                                    httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                        if (err?.code != 0) {
                                            console.info(`${caseName} secondResponse err ---${JSON.stringify(err)}`);
                                            ExpectFail();
                                            done();
                                        } else {
                                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                            ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                                            httpRequest.destroy();
                                            done();
                                        }
                                    });
                                }
                            });
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1200
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1200
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1300
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1300
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1000
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1400
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1400
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1001
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });



        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1600
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1600
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1700
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1700
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1000
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1800
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1800
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1001
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2300
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2300
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingProxy: false
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2400
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2400
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingProxy: true
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2500
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2500
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingProxy: false
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2600
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2600
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingProxy: true
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3500
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3500
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: ""
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3600
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3600
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: "xts-test’: ‘xts/test"
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3700
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3700
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: undefined
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3800
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3800
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: ""
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3900
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3900
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3900';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: "xts-test’: ‘xts/test"
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4000
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4000
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: undefined
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4100
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4100
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            readTimeout: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                    ExpectTrue(err?.code == 2300028);
                                    httpRequest.destroy();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4200
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4200
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            connectTimeout: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300028);
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4300
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4300
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            readTimeout: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectFail();
                            done();
                        }).catch((error: Error) => { let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300028);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4400
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4400
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            connectTimeout: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectFail();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300028);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4500
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4500
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            readTimeout: 0,
                            connectTimeout: 0
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4600
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4600
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            readTimeout: 0,
                            connectTimeout: 0
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

    })

}