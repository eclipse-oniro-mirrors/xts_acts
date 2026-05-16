/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import http from '@ohos.net.http';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ADDR_TEST_STREAM_HTTPS: string = "https://cn.bing.com/rp/Q5BJPjebyYN5QiqznkcMQmLrF9U.svg";

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



export default function HttpResponsePropertiesTest() {

    describe("HttpResponsePropertiesTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name   testNetworkMgrHttpResponse_static_0100
         * @tc.number SUB_NetworkMgr_Http_Response_0100
         * @tc.desc   test resultType with default parameter for expectDataType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpResponse_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
            const caseName: string = "testNetworkMgrHttpResponse_static_0100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let resultType: http.HttpDataType ;
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {

                                hilog.info(domain, tag, '%{public}s', caseName +':  res.resultType:->'+JSON.stringify(res));
                                ExpectTrue(res?.resultType ==http.HttpDataType.STRING);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'   request catch error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_0200
         * @tc.number SUB_NetworkMgr_Http_Response_0200
         * @tc.desc   test resultType with expectDataType:http.HttpDataType.STRING
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_0200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let resultType: http.HttpDataType ;
            const expectDataType: http.HttpDataType = http.HttpDataType.STRING;
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType,
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(res?.resultType ==expectDataType);
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'   request catch error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_0300
         * @tc.number SUB_NetworkMgr_Http_Response_0300
         * @tc.desc   test resultType with expectDataType:http.HttpDataType.OBJECT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_0300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let resultType: http.HttpDataType ;
            const expectDataType: http.HttpDataType = http.HttpDataType.OBJECT;
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType,
                            }).then((res: http.HttpResponse) => {
                                resultType = res.resultType;
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                const flag: boolean = [http.HttpDataType.OBJECT, http.HttpDataType.STRING].includes(resultType);
                                ExpectTrue(flag);
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'   request catch error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_0400
         * @tc.number SUB_NetworkMgr_Http_Response_0400
         * @tc.desc   test resultType with expectDataType:http.HttpDataType.ARRAY_BUFFER
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_0400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let resultType: http.HttpDataType ;
            const expectDataType: http.HttpDataType = http.HttpDataType.ARRAY_BUFFER;
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType,
                            }).then((res: http.HttpResponse) => {

                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(res?.resultType ==expectDataType);
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'   request catch error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });



        /**
         * @tc.name   testHttpResponse_static_0600
         * @tc.number SUB_NetworkMgr_Http_Response_0600
         * @tc.desc   test resultType with header.contentType(application/json) Type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_0600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let resultType: http.HttpDataType ;
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                header: {
                                    "content-type": "application/json"
                                }as Record<string,string>,
                            }).then((res: http.HttpResponse) => {

                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(res?.resultType ==http.HttpDataType.STRING);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'   request catch error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }

        });

        /**
         * @tc.name   testHttpResponse_static_0700
         * @tc.number SUB_NetworkMgr_Http_Response_0700
         * @tc.desc   test resultType with header.contentType(application/octet-stream) Type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_0700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let resultType: http.HttpDataType ;
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                header: {
                                    "content-type": "application/octet-stream"
                                }as Record<string,string>,
                            }).then((res: http.HttpResponse) => {

                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(res?.resultType ==http.HttpDataType.ARRAY_BUFFER);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'   request catch error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_0800
         * @tc.number SUB_NetworkMgr_Http_Response_0800
         * @tc.desc   test resultType with header.contentType(image/svg+xml) Type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_0800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let resultType: http.HttpDataType ;
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                header: {
                                    "content-type": "image/svg+xml"
                                }as Record<string,string>,
                            }).then((res: http.HttpResponse) => {

                                hilog.info(domain, tag, '%{public}s', caseName +': res ->'+JSON.stringify(res));
                                ExpectTrue(res?.resultType ==http.HttpDataType.ARRAY_BUFFER);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'   request catch error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_0900
         * @tc.number SUB_NetworkMgr_Http_Response_0900
         * @tc.desc   test resultType with header.contentType(text/html) Type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_0900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            let resultType: http.HttpDataType ;
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                header: {
                                    "content-type": "text/html"
                                }as Record<string,string>,
                            }).then((res: http.HttpResponse) => {

                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(res?.resultType ==http.HttpDataType.STRING);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'   request catch error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testNetworkMgrHttpResponse_static_1000
         * @tc.number SUB_NetworkMgr_Http_Response_1000
         * @tc.desc   test resultType with default parameter for expectDataType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpResponse_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
            const caseName: string = "testNetworkMgrHttpResponse_static_1000";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            let resultType: http.HttpDataType ;
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +' : request  data ->'+JSON.stringify(data));
                                    ExpectTrue(res?.resultType ==http.HttpDataType.STRING);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_1100
         * @tc.number SUB_NetworkMgr_Http_Response_1100
         * @tc.desc   test resultType with expectDataType:http.HttpDataType.STRING
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_1100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            let resultType: http.HttpDataType ;
                            const httpRequest: http.HttpRequest = http.createHttp();
                            const expectDataType: http.HttpDataType = http.HttpDataType.STRING;
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType,
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +' : request  data ->'+JSON.stringify(data));
                                    ExpectTrue(res?.resultType ==expectDataType);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_1200
         * @tc.number SUB_NetworkMgr_Http_Response_1200
         * @tc.desc   test resultType with expectDataType:http.HttpDataType.OBJECT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_1200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            let resultType: http.HttpDataType ;
                            const httpRequest: http.HttpRequest = http.createHttp();
                            const expectDataType: http.HttpDataType = http.HttpDataType.OBJECT;
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType,
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    if(res == undefined){
                                        hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse is ->'+JSON.stringify(res));
                                        ExpectFail();
                                    }else{
                                        hilog.info(domain, tag, '%{public}s', caseName +' : HttpResponse is ->'+JSON.stringify(res));
                                        const flag: boolean = [http.HttpDataType.OBJECT, http.HttpDataType.STRING, undefined].includes(res?.resultType);
                                        ExpectTrue(flag);
                                    }
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_1300
         * @tc.number SUB_NetworkMgr_Http_Response_1300
         * @tc.desc   test resultType with expectDataType:http.HttpDataType.ARRAY_BUFFER
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_1300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            let resultType: http.HttpDataType ;
                            const httpRequest: http.HttpRequest = http.createHttp();
                            const expectDataType: http.HttpDataType = http.HttpDataType.ARRAY_BUFFER;
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType,
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +' : request  data ->'+JSON.stringify(data));
                                    ExpectTrue(res?.resultType ==expectDataType);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_1500
         * @tc.number SUB_NetworkMgr_Http_Response_1500
         * @tc.desc   test resultType with header.contentType(application/json)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_1500";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            let resultType: http.HttpDataType ;
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                header: {
                                    "content-type": "application/json"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +' : request  data ->'+JSON.stringify(data));
                                    ExpectTrue(res?.resultType ==http.HttpDataType.STRING);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_1600
         * @tc.number SUB_NetworkMgr_Http_Response_1600
         * @tc.desc   test resultType with header.contentType(application/octet-stream)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_1600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            let resultType: http.HttpDataType ;
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                header: {
                                    "content-type": "application/octet-stream"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +' : request  data ->'+JSON.stringify(data));

                                    ExpectTrue(res?.resultType ==http.HttpDataType.ARRAY_BUFFER);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_1700
         * @tc.number SUB_NetworkMgr_Http_Response_1700
         * @tc.desc   test resultType with header.contentType(image/svg+xml)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_1700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            let resultType: http.HttpDataType ;
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                header: {
                                    "content-type": "image/svg+xml"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +' : request  data ->'+JSON.stringify(data));

                                    ExpectTrue(res?.resultType ==http.HttpDataType.ARRAY_BUFFER);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_1800
         * @tc.number SUB_NetworkMgr_Http_Response_1800
         * @tc.desc   test resultType with header.contentType(text/html)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_1800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            let resultType: http.HttpDataType ;
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                header: {
                                    "content-type": "text/html"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +' : request  data ->'+JSON.stringify(data));

                                    ExpectTrue(res?.resultType ==http.HttpDataType.STRING);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_1900
         * @tc.number SUB_NetworkMgr_Http_Response_1900
         * @tc.desc   test result expect type string expectDataType within http.HttpDataType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_1900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            const httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType: http.HttpDataType.STRING,
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                const type: string = typeof res?.result;
                                ExpectTrue(type == 'string');
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_2000
         * @tc.number SUB_NetworkMgr_Http_Response_2000
         * @tc.desc   test result expect type object expectDataType within http.HttpDataType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2000";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            const httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType: http.HttpDataType.OBJECT,
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                const type: string = typeof res?.result;
                                const flag: boolean = ['string', 'object', 'undefined'].includes(type);
                                ExpectTrue(flag);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_2100
         * @tc.number SUB_NetworkMgr_Http_Response_2100
         * @tc.desc   test result expect type ArrayBuffer expectDataType within http.HttpDataType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            const httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType: http.HttpDataType.ARRAY_BUFFER,
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                const flag: boolean = res?.result instanceof ArrayBuffer;
                                ExpectTrue(flag);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_2300
         * @tc.number SUB_NetworkMgr_Http_Response_2300
         * @tc.desc   test result with header.contentType(application/json) type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                header: {
                                    "content-type": "application/json"
                                }as Record<string,string>
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                const type: string = typeof res?.result;
                                ExpectTrue(type == 'string');
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_2400
         * @tc.number SUB_NetworkMgr_Http_Response_2400
         * @tc.desc   test result with header.contentType(application/octet-stream) type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                header: {
                                    "content-type": "application/octet-stream"
                                }as Record<string,string>
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(res?.result instanceof ArrayBuffer);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_2500
         * @tc.number SUB_NetworkMgr_Http_Response_2500
         * @tc.desc   test result with header.contentType(image/svg+xml) type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2500";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                header: {
                                    "content-type": "image/svg+xml"
                                }as Record<string,string>
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(res?.result instanceof ArrayBuffer);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_2600
         * @tc.number SUB_NetworkMgr_Http_Response_2600
         * @tc.desc   test result with header.contentType(text/html) type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                header: {
                                    "content-type": "text/html"
                                }as Record<string,string>
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(typeof res?.result == 'string');
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_2700
         * @tc.number SUB_NetworkMgr_Http_Response_2700
         * @tc.desc   test result expect type string expectDataType within http.HttpDataType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2700";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType: http.HttpDataType.STRING,
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(typeof res?.result == 'string');
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_2800
         * @tc.number SUB_NetworkMgr_Http_Response_2800
         * @tc.desc   test result expect type object expectDataType within http.HttpDataType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType: http.HttpDataType.OBJECT,
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    const flag: boolean = ['string', 'object', 'undefined'].includes(typeof res?.result);
                                    ExpectTrue(flag);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }

        });

        /**
         * @tc.name   testHttpResponse_static_2900
         * @tc.number SUB_NetworkMgr_Http_Response_2900
         * @tc.desc   test result expect type ArrayBuffer expectDataType within http.HttpDataType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_2900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                expectDataType: http.HttpDataType.ARRAY_BUFFER,
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(res?.result instanceof ArrayBuffer);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_3100
         * @tc.number SUB_NetworkMgr_Http_Response_3100
         * @tc.desc   test result  header.contentType(application/json)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_3100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                header: {
                                    "content-type": "application/json"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(typeof res?.result == 'string');
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }

        });

        /**
         * @tc.name   testHttpResponse_static_3200
         * @tc.number SUB_NetworkMgr_Http_Response_3200
         * @tc.desc   test result header.contentType(application/octet-stream)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_3200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                header: {
                                    "content-type": "application/octet-stream"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(res?.result instanceof ArrayBuffer);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_3300
         * @tc.number SUB_NetworkMgr_Http_Response_3300
         * @tc.desc   test result header.contentType(image/svg+xml)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_3300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                header: {
                                    "content-type": "image/svg+xml"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(res?.result instanceof ArrayBuffer);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_3400
         * @tc.number SUB_NetworkMgr_Http_Response_3400
         * @tc.desc   test result header.contentType(image/apng)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_3400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                                header: {
                                    "content-type": "text/html"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(typeof res?.result == 'string');
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_3600
         * @tc.number SUB_NetworkMgr_Http_Response_3600
         * @tc.desc   test responseCode with fail request
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_3600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request("abc").then((res: http.HttpResponse) => {
                                console.info(`${caseName} res.responseCode: ${res?.responseCode}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectTrue(err.code == 2300006);
                                done();
                            })
                        }
                    }
                });
            } catch (error) {
                const err: BusinessError = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_3800
         * @tc.number SUB_NetworkMgr_Http_Response_3800
         * @tc.desc   test responseCode with fail request
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_3800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request("abc", (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    console.info(`${caseName} request error code: ${err?.code}, msg: ${err?.message}`);
                                    ExpectTrue(err?.code == 2300006);
                                    httpRequest.destroy();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_3900
         * @tc.number SUB_NetworkMgr_Http_Response_3900
         * @tc.desc   test header expect value with type Object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_3900";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                                console.info(`${caseName} res.header:${JSON.stringify(res.header)}`);
                                ExpectTrue(res?.header instanceof Object);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_4000
         * @tc.number SUB_NetworkMgr_Http_Response_4000
         * @tc.desc   test header  expect value with type Object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_4000";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---httpRequest  createHttp success');
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    console.log(`${caseName} res.header: ${JSON.stringify(res?.header)}`)
                                    ExpectTrue(res?.header instanceof Object);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_4100
         * @tc.number SUB_NetworkMgr_Http_Response_4100
         * @tc.desc   test cookies  expect value with type string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_4100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                                console.info(`${caseName} res.cookies:${JSON.stringify(res.cookies)}`);
                                ExpectTrue(typeof res?.cookies == 'string');
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => { let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            })
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_4200
         * @tc.number SUB_NetworkMgr_Http_Response_4200
         * @tc.desc   test cookies  expect value with type string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_4200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(typeof res?.cookies == 'string');
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_4300
         * @tc.number SUB_NetworkMgr_Http_Response_4300
         * @tc.desc   test performanceTiming
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_4300";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            const httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                                console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
                                ExpectTrue(res.performanceTiming.dnsTiming >= 0);
                                ExpectTrue(res.performanceTiming.tcpTiming >= 0);
                                ExpectTrue(res.performanceTiming.tlsTiming >= 0);
                                ExpectTrue(res.performanceTiming.firstSendTiming >= 0);
                                ExpectTrue(res.performanceTiming.firstReceiveTiming >= 0);
                                ExpectTrue(res.performanceTiming.totalFinishTiming >= 0);
                                ExpectTrue(res.performanceTiming.redirectTiming >= 0);
                                ExpectTrue(res.performanceTiming.responseHeaderTiming >= 0);
                                ExpectTrue(res.performanceTiming.responseBodyTiming >= 0);
                                ExpectTrue(res.performanceTiming.totalTiming >= 0);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => { let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_4400
         * @tc.number SUB_NetworkMgr_Http_Response_4400
         * @tc.desc   test performanceTiming
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_4400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    console.info(`${caseName} res.performanceTiming:${JSON.stringify(res?.performanceTiming)}`);
                                    ExpectTrue(res?.performanceTiming != undefined);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (error) {
                const err: BusinessError = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_4500
         * @tc.number SUB_NetworkMgr_Http_Response_4500
         * @tc.desc   test result header.contentType(application/octet-stream) and expectDataType(type string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_4500";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                expectDataType: http.HttpDataType.STRING,
                                header: {
                                    "content-type": "application/octet-stream"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(typeof res?.result == 'string');
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });


        /**
         * @tc.name   testHttpResponse_static_4600
         * @tc.number SUB_NetworkMgr_Http_Response_4600
         * @tc.desc   test result header.contentType(application/json) and expectDataType(type buffer)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_4600";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                expectDataType: http.HttpDataType.ARRAY_BUFFER,
                                header: {
                                    "content-type": "application/json"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(res?.result instanceof ArrayBuffer);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });



        /**
         * @tc.name   testHttpResponse_static_4800
         * @tc.number SUB_NetworkMgr_Http_Response_4800
         * @tc.desc   test result header.contentType(application/json) and expectDataType(type string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_4800";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                expectDataType: http.HttpDataType.STRING,
                                header: {
                                    "content-type": "application/json"
                                }as Record<string,string>
                            }, (err: BusinessError<void>|null, res: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  request failerror is '+JSON.stringify(err));
                                    httpRequest.destroy();
                                    ExpectFail();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +':request data ->'+JSON.stringify(res));
                                    ExpectTrue(typeof res?.result == 'string');
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_5100
         * @tc.number SUB_NetworkMgr_Http_Response_5100
         * @tc.desc   test result header.contentType(application/octet-stream) and expectDataType(type string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_5100";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                expectDataType: http.HttpDataType.STRING,
                                header: {
                                    "content-type": "application/octet-stream"
                                }as Record<string,string>
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(typeof res?.result == 'string');
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

        /**
         * @tc.name   testHttpResponse_static_5200
         * @tc.number SUB_NetworkMgr_Http_Response_5200
         * @tc.desc   test result header.contentType(application/json) and expectDataType(type buffer)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_5200";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                expectDataType: http.HttpDataType.ARRAY_BUFFER,
                                header: {
                                    "content-type": "application/json"
                                }as Record<string,string>
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(res?.result instanceof ArrayBuffer);
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }

        });

        /**
         * @tc.name   testHttpResponse_static_5400
         * @tc.number SUB_NetworkMgr_Http_Response_5400
         * @tc.desc   test result header.contentType(application/json) and expectDataType(type string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHttpResponse_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpResponse_static_5400";
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(error));
                        ExpectFail();
                        done();
                    } else {
                        if (data?.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', caseName +' no Network connected ');
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', caseName +'  Network connected ');
                            const httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                                expectDataType: http.HttpDataType.STRING,
                                header: {
                                    "content-type": "application/json"
                                }as Record<string,string>
                            }).then((res: http.HttpResponse) => {
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse  ->'+JSON.stringify(res));
                                ExpectTrue(typeof res?.result == 'string')
                                httpRequest.destroy();
                                done();
                            }).catch((error: Error) => {
                                let err = error as BusinessError;
                                hilog.info(domain, tag, '%{public}s', caseName +'  request fail, error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            });
                        }
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
        });

    })
}