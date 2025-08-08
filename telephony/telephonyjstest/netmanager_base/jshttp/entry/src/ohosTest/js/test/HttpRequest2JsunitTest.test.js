/**
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, expect, it, TestType, Size, Level  } from '@ohos/hypium';
import http from '@ohos.net.http';


let httpRequestOptions = {
    method: http.RequestMethod.GET,
    extraData: null,
    header: "content-type': 'application/json",
    readTimeout: 60000,
    connectTimeout: 60000
};

let Address_Baidu = "https://www.baidu.com/";

function dataReceive_on_callback(data) {
    console.log("dataReceive_on_callback receive len:" + JSON.stringify(data.byteLength));
}

function dataEnd_on_callback() {
    console.log("dataEnd_on_callback callback function");
}

function dataReceiveProgress_on_callback(data) {
    console.log("dataReceiveProgress_on_callback receive datProgress:" + JSON.stringify(data));
}

export default function HttprequestInStreamJsunitTest() {
    describe("HttprequestInStreamJsunitTest", function () {
        /**
         * @tc.number Telephony_http_HttpRequest_requestInStream_0100
         * @tc.name httprequestInStream::requestInStream
         * @tc.desc Test requestInStream(url: string, callback: AsyncCallback<void>): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_Async_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_Async_0100";
            let Address_Img = "https://img1.baidu.com/it/u=3010094603,1247181326&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";
            let httpRequest = http.createHttp();
            try {
                httpRequest.on("dataReceive", dataReceive_on_callback);
                httpRequest.on("dataReceiveProgress", dataReceiveProgress_on_callback);
                httpRequest.on("dataEnd", dataEnd_on_callback);
                httpRequest.requestInStream(Address_Img, httpRequestOptions, (err, data) => {
                    console.info(CaseName + " responseCode data : " + data);
                    console.log(CaseName + "NETSTACK requestInStream OK!");
                    httpRequest.off("dataReceive");
                    console.log("NETSTACK off dataReceive success!");
                    httpRequest.off("dataReceiveProgress");
                    console.log("NETSTACK off dataReceiveProgress success!");
                    httpRequest.off("dataEnd");
                    console.log("NETSTACK off dataEnd success!");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                })
            } catch (error) {
                console.log(CaseName + " requestInStream catch : error = " + JSON.stringify(error));
                expect(error).assertFalse();
                done();
            }
        });


        /**
         * @tc.number Telephony_http_HttpRequest_requestInStream_0200
         * @tc.name httprequestInStream::requestInStream
         * @tc.desc Test requestInStream(url: string, options: HttpRequestOptions, callback: AsyncCallback<void>): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_Async_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_Async_0200"
            var httpRequest = http.createHttp();
            httpRequest.requestInStream(Address_Baidu, (err, data) => {
                if (err) {
                    console.log(CaseName + " requestInStream ERROR" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                httpRequest.destroy();
                console.log(CaseName + " requestInStream Finish responseCode " + data);
                done();
            });
        });

        /**
         * @tc.number Telephony_http_HttpRequest_requestInStream_0100
         * @tc.name httprequestInStream::requestInStream
         * @tc.desc Test requestInStream(url: string, options: HttpRequestOptions): Promise<void>.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_Promise_0100";
            var httpRequest = http.createHttp();
            httpRequest.requestInStream(Address_Baidu, httpRequestOptions).then(function (data) {
                console.log(CaseName + " requestInStream Finish responseCode " + data);
                httpRequest.destroy();
                done();
            }).catch(function (err) {
                console.log(CaseName + " error = " + JSON.stringify(err));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.number Telephony_http_HttpRequest_requestInStream_0100
         * @tc.name httprequestInStream::requestInStream
         * @tc.desc Test requestInStream(url: string): Promise<void>.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_Promise_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_Promise_0200";
            var httpRequest = http.createHttp();
            httpRequest.requestInStream(Address_Baidu).then(function (data) {
                console.log(CaseName + " requestInStream Finish responseCode " + data);
                httpRequest.destroy();
                done();
            }).catch(function (err) {
                console.log(CaseName + " : error = " + JSON.stringify(err));
                expect().assertFail();
                done();
            });
        });


        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataReceive_0100
         * @tc.name httprequestInStream::on_dataReceive
         * @tc.desc Test on(type: "dataReceive", callback: Callback<ArrayBuffer>): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_on_dataReceive_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_on_dataReceive_0100";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataReceive", dataReceive_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    console.log(CaseName + " on dataReceive Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0100
         * @tc.name httprequestInStream::off_dataReceive
         * @tc.desc Test off(type: "dataReceive", callback: Callback<ArrayBuffer>): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0100";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataReceive", dataReceive_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    httpRequest.off("dataReceive", dataReceive_on_callback);
                    console.log(CaseName + " off dataReceive Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0200
         * @tc.name httprequestInStream::off_dataReceive
         * @tc.desc Test off(type: "dataReceive"): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0200";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataReceive", dataReceive_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    httpRequest.off("dataReceive");
                    console.log(CaseName + " off dataReceive Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataReceiveProgress_0100
         * @tc.name httprequestInStream::on_dataReceiveProgress
         * @tc.desc Test on(type: "dataReceiveProgress", callback: Callback<{ receiveSize: number, totalSize: number }>): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_on_dataReceiveProgress_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_on_dataReceiveProgress_0100";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataReceiveProgress", dataReceiveProgress_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    console.log(CaseName + " on dataReceiveProgress Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0100
         * @tc.name httprequestInStream::off_dataReceiveProgress
         * @tc.desc Test off(type: "dataReceiveProgress", callback: Callback<{ receiveSize: number, totalSize: number }>): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0100";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataReceiveProgress", dataReceiveProgress_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    httpRequest.off("dataReceiveProgress", dataReceiveProgress_on_callback);
                    console.log(CaseName + " off dataReceiveProgress Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0200
         * @tc.name httprequestInStream::off_dataReceiveProgress
         * @tc.desc Test off(type: "dataReceiveProgress"): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0200";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataReceiveProgress", dataReceiveProgress_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    httpRequest.off("dataReceiveProgress");
                    console.log(CaseName + " off dataReceiveProgress Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataEnd_0100
         * @tc.name httprequestInStream::on_dataEnd
         * @tc.desc Test on(type: "dataEnd", callback: Callback<void>): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_on_dataEnd_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_on_dataEnd_0100";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataEnd", dataEnd_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    console.log(CaseName + " on dataEnd Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0100
         * @tc.name httprequestInStream::off_dataEnd
         * @tc.desc Test off(type: "dataEnd", callback?: Callback<void>): void.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0100";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataEnd", dataEnd_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    httpRequest.off("dataEnd", dataEnd_on_callback);
                    console.log(CaseName + " off dataEnd Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0200
         * @tc.name httprequestInStream::off_dataEnd
         * @tc.desc Test off(type: "dataEnd"): void;.
         */
        it("SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            let CaseName = "SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0200";
            try {
                var httpRequest = http.createHttp();
                httpRequest.on("dataEnd", dataEnd_on_callback);
                httpRequest.requestInStream(Address_Baidu).then(function (data) {
                    httpRequest.off("dataEnd");
                    console.log(CaseName + " off dataEnd Finish ");
                    expect(data == 200).assertTrue();
                    httpRequest.destroy();
                    done();
                }).catch(function (err) {
                    console.log(CaseName + " : error = " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(CaseName + " : error = " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });
    });
}