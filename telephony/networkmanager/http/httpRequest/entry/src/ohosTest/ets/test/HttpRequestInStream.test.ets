import type { BusinessError } from "@ohos.base";
import http from "@ohos.net.http";
import { describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import connection from "@ohos.net.connection";
export const ADDR_TEST_ILLEGAL: string = "abc";
export const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";
const ExpectFail = () => {
    try {
        expect().assertFail();
    }
    catch (err) {
        console.info(`exportFail failed err: ${JSON.stringify(err)}`);
    }
};
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    }
    catch (err) {
        console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
    }
};
export default function HttpRequestInStreamTest() {
    describe("HttpRequestInStreamTest", () => {
        /**
         * @tc.name   testNetworkMgrHttpRequestInStream0100
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0100
         * @tc.desc   test requestInStream
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpRequestInStream0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            const caseName: string = "testNetworkMgrHttpRequestInStream0100";
            console.info(`${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId == 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    }
                    else {
                        console.info(`${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, data: number) => {
                            if (err) {
                                console.info(`${caseName} requestInStream fail err: ${JSON.stringify(data)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }
                            else {
                                console.info(`${caseName} requestInStream success ${JSON.stringify(data)}`);
                                ExpectTrue(data == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            }
            catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testHttpRequestInStream0200
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0200
         * @tc.desc   test requestInStream with destory httpRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            const caseName: string = "testHttpRequestInStream0200";
            console.info(`${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId == 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    }
                    else {
                        console.info(`${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, data: number) => {
                            if (err) {
                                console.info(`${caseName} destory httpRequest and requestStream fail err:${err}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }
                            else {
                                console.info(`${caseName} destory httpRequest and requestStream success ${data}`);
                                ExpectTrue(data == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            }
            catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testNetworkMgrHttpRequestInStream0300
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0300
         * @tc.desc   test requestInStream
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpRequestInStream0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            const caseName: string = "testNetworkMgrHttpRequestInStream0300";
            console.info(`${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId == 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    }
                    else {
                        console.info(`${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS).then((data: number) => {
                            console.info(`${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                            ExpectTrue(data == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((err: BusinessError) => {
                            console.info(`${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            }
            catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testHttpRequestInStream0400
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0400
         * @tc.desc   test requestInStream with destroy httpRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            const caseName: string = "testHttpRequestInStream0400";
            console.info(`${caseName} test Start`);
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId == 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    }
                    else {
                        console.info(`${caseName} Network connected`);
                        httpRequest.destroy();
                        httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS).then((data: number) => {
                            console.info(`${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        }).catch((err: BusinessError) => {
                            console.info(`${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
                            ExpectTrue(err.code == 2300999);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            }
            catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testHttpRequestInStream0500
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0500
         * @tc.desc   test requestInStream
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            const caseName: string = "testHttpRequestInStream0500";
            console.info(`${caseName} test Start`);
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId == 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    }
                    else {
                        console.info(`${caseName} Network connected`);
                        httpRequest.on("headersReceive", () => {
                            httpRequest.destroy();
                        });
                        httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS).then((data: number) => {
                            console.info(`${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                            ExpectTrue(data == 200);
                            done();
                        }).catch((err: BusinessError) => {
                            console.info(`${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            }
            catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testHttpRequestInStream0600
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0600
         * @tc.desc   test requestInStream with illegal url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            const caseName: string = "testHttpRequestInStream0600";
            console.info(`${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId == 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    }
                    else {
                        console.info(`${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.requestInStream(ADDR_TEST_ILLEGAL, (err: BusinessError, data: number) => {
                            if (err) {
                                console.info(`${caseName}  requestInStream fail err ${JSON.stringify(err)}`);
                                ExpectTrue(err.code == 2300006);
                                httpRequest.destroy();
                                done();
                            }
                            else {
                                console.info(`${caseName}  requestInStream success ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            }
            catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testHttpRequestInStream0700
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0700
         * @tc.desc   test requestInStream with illegal url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            const caseName: string = "testHttpRequestInStream0700";
            console.info(`${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId == 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    }
                    else {
                        console.info(`${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.requestInStream(ADDR_TEST_ILLEGAL, (err: BusinessError, data: number) => {
                            if (err) {
                                console.info(`${caseName}  requestInStream fail err ${JSON.stringify(err)}`);
                                ExpectTrue(err.code == 2300006);
                                httpRequest.destroy();
                                done();
                            }
                            else {
                                console.info(`${caseName}  requestInStream success ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            }
            catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testHttpRequestInStream0800
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0800
         * @tc.desc   test requestInStream with illegal url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            const caseName: string = "testHttpRequestInStream0800";
            console.info(`${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId == 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        console.info(`${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.requestInStream(ADDR_TEST_ILLEGAL).then((data: number) => {
                            console.info('Result:' + data);
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        }).catch((err: BusinessError) => {
                            console.info('error:' + JSON.stringify(err));
                            ExpectTrue(err.code == 2300006);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testHttpRequestInStream0900
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0900
         * @tc.desc   test requestInStream with destroy httpRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            const caseName: string = "testHttpRequestInStream0900";
            console.info(`${caseName} test Start`);

            let httpRequest: http.HttpRequest = http.createHttp();

            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId === 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        console.info(`${caseName} Network connected`);
                        httpRequest.destroy();
                        httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, data: number) => {
                            if (err) {
                                console.info(`${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
                                ExpectTrue(err.code === 2300999);
                            } else {
                                console.info(`${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                                ExpectFail();
                            }
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            console.info(`${caseName} test End`);
        });
        /**
         * @tc.name   testHttpRequestInStream1000
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_1000
         * @tc.desc   test requestInStream with destroy httpRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            const caseName: string = "testHttpRequestInStream1000";
            console.info(`${caseName} test Start`);
            let httpRequest: http.HttpRequest = http.createHttp();
            try {
                connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
                    if (data.netId === 0) {
                        console.info(`${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        console.info(`${caseName} Network connected`);
                        httpRequest.destroy();
                        httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, {}, (err: BusinessError, data: number) => {
                            if (err) {
                                console.info(`${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
                                ExpectTrue(err.code === 2300999);
                            } else {
                                console.info(`${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                                ExpectFail();
                            }
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }

            console.info(`${caseName} test End`);
        });
    });
}
