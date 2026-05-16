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

const ADDR_TEST_DOMAIN_HTTPS: string = "https://www.baidu.com";

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


export default function httpRequestProtocolTest() {

    describe("HttpRequestProtocolTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name   testHttpProtocolHTTP_static_0100
         * @tc.number SUB_NetworkMgr_Http_HttpProtocol_0100
         * @tc.desc   test HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpProtocolHTTP_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpProtocolHTTP_static_0100';
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
                        hilog.info(domain, tag, '%{public}s', caseName +' createHttp success '+JSON.stringify(httpRequest));
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest fail, get error is '+JSON.stringify(err));
                                ExpectFail();
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
         * @tc.name   testHttpProtocolHTTP_static_0200
         * @tc.number SUB_NetworkMgr_Http_HttpProtocol_0200
         * @tc.desc   test HttpProtocol.HTTP1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpProtocolHTTP_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpProtocolHTTP_static_0200';
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
                        hilog.info(domain, tag, '%{public}s', caseName +' createHttp success '+JSON.stringify(httpRequest));
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            usingProtocol: http.HttpProtocol.HTTP1_1
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: HttpResponse ->'+JSON.stringify(data));
                            ExpectTrue(data.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' request fail err: '+JSON.stringify(err));
                            ExpectFail();
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
         * @tc.name   testHttpProtocolHTTP_static_0300
         * @tc.number SUB_NetworkMgr_Http_HttpProtocol_0300
         * @tc.desc   test HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpProtocolHTTP_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpProtocolHTTP_static_0300';
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
                            usingProtocol: http.HttpProtocol.HTTP2
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest get error is '+JSON.stringify(err));
                                ExpectFail();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest success : data ->'+JSON.stringify(data));
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
         * @tc.name   testHttpProtocolHTTP_static_0400
         * @tc.number SUB_NetworkMgr_Http_HttpProtocol_0400
         * @tc.desc   test HttpProtocol.HTTP2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpProtocolHTTP_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpProtocolHTTP_static_0400';
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
                            usingProtocol: http.HttpProtocol.HTTP2
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: HttpResponse ->'+JSON.stringify(data));
                            ExpectTrue(data.responseCode == 200);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' request get error is '+JSON.stringify(err));
                            ExpectFail();
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
         * @tc.name   testHttpProtocolHTTP_static_0500
         * @tc.number SUB_NetworkMgr_Http_HttpProtocol_0500
         * @tc.desc   test HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpProtocolHTTP_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpProtocolHTTP_static_0500';
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
                            usingProtocol: http.HttpProtocol.HTTP3
                        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest fail, get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300999);//The device does not support HTTP3
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +' httpRequest success : data ->'+JSON.stringify(data));
                                console.info(`${caseName} ${JSON.stringify(data)}`);
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
         * @tc.name   testHttpProtocolHTTP_static_0600
         * @tc.number SUB_NetworkMgr_Http_HttpProtocol_0600
         * @tc.desc   test HttpProtocol.HTTP3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testHttpProtocolHTTP_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpProtocolHTTP_static_0600';
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
                            usingProtocol: http.HttpProtocol.HTTP3
                        }).then((res: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest success ,HttpResponse is ->'+JSON.stringify(res));
                            ExpectTrue(res.responseCode == 200);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail err '+JSON.stringify(err));
                            ExpectTrue(err.code == 2300999);//The device does not support HTTP3
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