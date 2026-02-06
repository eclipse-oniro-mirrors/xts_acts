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

const ADDR_TEST_ILLEGAL: string = "abc";

const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";

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


export default function httpRequestDestroyTest() {

    describe("HttpRequestDestroyTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   testNetworkMgrHttpCreateHttp_static_0100
         * @tc.number SUB_NetworkMgr_Http_createHttp_0100
         * @tc.desc   test createHttp
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpCreateHttp_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName: string = "testNetworkMgrHttpCreateHttp_static_0100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        ExpectTrue(httpRequest != null);
                        httpRequest.destroy();
                        done();
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +' try catch err  '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpRequest_static_0200
         * @tc.number SUB_NetworkMgr_Http_Request_0200
         * @tc.desc   test Request
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpRequest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName: string = "testNetworkMgrHttpRequest_static_0200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest fail   error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest success : data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.name   testNetworkMgrHttpRequest_static_0400
         * @tc.number SUB_NetworkMgr_Http_Request_0400
         * @tc.desc   test Request
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpRequest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName: string = "testNetworkMgrHttpRequest_static_0400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                    }
                });
                let httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((data: http.HttpResponse) => {
                    hilog.info(domain, tag, '%{public}s', caseName +' httpRequest success : data ->'+JSON.stringify(data));
                    ExpectTrue(data?.responseCode == 200);
                    httpRequest.destroy();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest fail   error is '+JSON.stringify(err));
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });



        /**
         * @tc.name   testHttpRequest_static_0600
         * @tc.number SUB_NetworkMgr_Http_Request_0600
         * @tc.desc   test Request with illegal url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequest_static_0600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_ILLEGAL, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest fail   error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300006);
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest success : data ->'+JSON.stringify(data));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpRequest_static_0700
         * @tc.number SUB_NetworkMgr_Http_Request_0700
         * @tc.desc   test Request with illegal url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequest_static_0700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail()
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        httpRequest.request(ADDR_TEST_ILLEGAL).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest success : data ->'+JSON.stringify(data));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            console.info(`${caseName} httpRequest fail err: ${JSON.stringify(data)}`);
                            ExpectTrue(err?.code == 2300006);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.name   testHttpDestroy_static_0800
         * @tc.number SUB_NetworkMgr_Http_Destroy_0800
         * @tc.desc   test destroy
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpDestroy_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpDestroy_static_0800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest.destory fail  error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300023);
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest.destory success : data ->'+JSON.stringify(data));
                                ExpectFail();
                                done();
                            }
                        });
                        httpRequest.destroy();
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testHttpDestroy_static_0900
         * @tc.number SUB_NetworkMgr_Http_Destroy_0900
         * @tc.desc   test destroy
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpDestroy_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpDestroy_static_0900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        httpRequest.destroy();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest.destory success : data ->'+JSON.stringify(data));
                            ExpectFail()
                            done();
                        }).catch((error: Error) => {  let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'   httpRequest.destory fail err: '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300999)
                            done();
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail()
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.name   testHttpDestroy_static_1100
         * @tc.number SUB_NetworkMgr_Http_Destroy_1100
         * @tc.desc   test destroy after httpRequest send an success request
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpDestroy_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpDestroy_static_1100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, () => {
                            httpRequest.destroy();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void>|null) => {
                                if (err?.code != 0) {
                                    console.info(`${caseName} httpRequest.destory fail err:${JSON.stringify(err)}`);
                                    ExpectTrue(err?.code == 2300999);
                                    httpRequest.destroy();
                                    done();
                                } else {
                                    console.info(`${caseName} httpRequest.destory success ${JSON.stringify(err)}`);
                                    ExpectFail();
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        });
                    }
                });
            } catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

    })

}