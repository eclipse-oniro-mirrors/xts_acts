/**
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import netSocket from '@ohos.net.socket';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function Telephony_NETSTACK_SocketTest() {


describe('Telephony_NETSTACK_SocketTest', function () {
        let envReady = false;

        /**
         * @tc.number Telephony_NetStack_UDPTest0100
         * @tc.name UDP bind,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0100', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.bind({
                        address: "127.0.0.1",
                        family: 1,
                        port: 0
                }, function (err, data) {
                        expect(err === undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest0200
         * @tc.name UDP bind,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0200', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.bind({
                        address: "127.0.0.1",
                        family: 1,
                        port: 0
                }).then(function (data) {
                        expect(data === undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest0300
         * @tc.name UDP send,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0300', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.send({
                        address: {
                                address: "127.0.0.1",
                                family: 1,
                                port: 0
                        },
                        data: "Hello"
                }, function (err, data) {
                        expect(err !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest0400
         * @tc.name UDP send,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0400', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.send({
                        address: {
                                address: "127.0.0.1",
                                family: 1,
                                port: 0
                        },
                        data: "Hello"
                }).then(function (data) {
                        expect(data !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest0500
         * @tc.name UDP close,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0500', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.close(function (err, data) {
                        expect(err !== undefined).assertTrue()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest0600
         * @tc.name UDP close,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0600', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.close().then(function (data) {
                        expect(data !== undefined).assertTrue()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest0700
         * @tc.name UDP getState,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0700', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.getState(function (err, data) {
                        expect(err !== undefined).assertTrue()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest0800
         * @tc.name UDP getState,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0800', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.getState().then(function (data) {
                        expect(data !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest0900
         * @tc.name UDP setExtraOptions,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest0900', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.setExtraOptions({}, function (err, data) {
                        expect(err !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest1000
         * @tc.name UDP setExtraOptions,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest1000', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.setExtraOptions({},).then(function (date) {
                        expect(date !== undefined).assertTrue()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest1100
         * @tc.name UDP on,预计callback不被调用
         * @tc.desc Function test
         */

        it('Telephony_NetStack_UDPTest1100', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.on('message', function () {
                        expect().assertFail()
                        done()
                })
                udp.on('listening', function () {
                        expect().assertFail()
                        done()
                })
                udp.on('close', function () {
                        expect().assertFail()
                        done()
                })
                udp.on('error', function () {
                        expect().assertFail()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_UDPTest1200
         * @tc.name UDP off,预计callback不被调用
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_UDPTest1200', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let udp = netSocket.constructUDPSocketInstance()
                udp.on('message', function () {
                })
                udp.on('listening', function () {
                })
                udp.on('close', function () {
                })
                udp.on('error', function () {
                })
                udp.off('message', function () {
                        expect().assertFail()
                        done()
                })
                udp.off('listening', function () {
                        expect().assertFail()
                        done()
                })
                udp.off('close', function () {
                        expect().assertFail()
                        done()
                })
                udp.off('error', function () {
                        expect().assertFail()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0100
         * @tc.name TCP bind,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0100', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.bind({
                        address: "127.0.0.1",
                        family: 1,
                        port: 0
                }, function (err, data) {
                        expect(err === undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0200
         * @tc.name TCP bind,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0200', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.bind({
                        address: "127.0.0.1",
                        family: 1,
                        port: 0
                }).then(function (data) {
                        expect(data === undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0300
         * @tc.name TCP send,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0300', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.send({
                        data: "Hello"
                }, function (err, data) {
                        expect(err !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0400
         * @tc.name TCP send,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0400', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.send({
                        data: "Hello"
                }).then(function (data) {
                        expect(data !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0500
         * @tc.name TCP close,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0500', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.close(function (err, data) {
                        expect(err !== undefined).assertTrue()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0600
         * @tc.name TCP close,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0600', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.close().then(function (data) {
                        expect(data !== undefined).assertTrue()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0700
         * @tc.name TCP getState,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0700', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.getState(function (err, data) {
                        expect(err !== undefined).assertTrue()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0800
         * @tc.name TCP getState,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0800', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.getState().then(function (data) {
                        expect(data !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest0900
         * @tc.name TCP setExtraOptions,callback方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest0900', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.setExtraOptions({}, function (err, data) {
                        expect(err !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest1000
         * @tc.name TCP setExtraOptions,promise方式，预计无异常，错误码为undefined
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest1000', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.setExtraOptions({},).then(function (date) {
                        expect(date !== undefined).assertTrue()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest1100
         * @tc.name TCP on,预计callback不被调用
         * @tc.desc Function test
         */

        it('Telephony_NetStack_TCPTest1100', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.on('message', function () {
                        expect().assertFail()
                        done()
                })
                tcp.on('connect', function () {
                        expect().assertFail()
                        done()
                })
                tcp.on('close', function () {
                        expect().assertFail()
                        done()
                })
                tcp.on('error', function () {
                        expect().assertFail()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest1200
         * @tc.name TCP off,预计callback不被调用
         * @tc.desc Function test`
         */

        it('Telephony_NetStack_TCPTest1200', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.on('message', function () {
                })
                tcp.on('connect', function () {
                })
                tcp.on('close', function () {
                })
                tcp.on('error', function () {
                })
                tcp.off('message', function () {
                        expect().assertFail()
                        done()
                })
                tcp.off('connect', function () {
                        expect().assertFail()
                        done()
                })
                tcp.off('close', function () {
                        expect().assertFail()
                        done()
                })
                tcp.off('error', function () {
                        expect().assertFail()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest1300
         * @tc.name TCP getRemoteAddress,callback方式，预计无异常，错误码不为undefined
         * @tc.desc Function test
         */
        it('Telephony_NetStack_TCPTest1300', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.getRemoteAddress(function (err, data) {
                        expect(err !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStack_TCPTest1400
         * @tc.name TCP getRemoteAddress,promise方式，预计无异常，错误码不为undefined
         * @tc.desc Function test
         */
        it('Telephony_NetStack_TCPTest1400', 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let tcp = netSocket.constructTCPSocketInstance()
                tcp.getRemoteAddress().then(function (data) {
                        expect(data !== undefined).assertTure()
                        done()
                })
                done()
        });

        /**
         * @tc.number Telephony_NetStact_TCPTest_1500
         * @TC.name   Tcp connect ,callback方式，预计无异常，错误码为undefined
         * @tc.desc   Function test
         */
        it("Telephony_NetStack_TCPTest_1500", 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let TCP = netSocket.constructTCPSocketInstance()
                TCP.connect({
                        address: {
                                address: "127.0.0.1",
                                family: 1,
                                port: 0
                        }
                }, function (err, data) {
                        expect(err === undefined).assertTrue()
                        done()
                })
                done()
        });


        /**
         * @tc.number Telephony_NetStact_TCPTest_1600
         * @TC.name   Tcp connect ,promise方式，预计无异常，错误码为undefined
         * @tc.desc   Function test
        */
        it("Telephony_NetStack_TCPTest_1600", 0, function (done) {
                if (!envReady) {
                        console.info("The environment was not ready");
                        done();
                        return;
                }
                let TCP = netSocket.constructTCPSocketInstance()
                TCP.connect({
                        address: {
                                address: "127.0.0.1",
                                family: 1,
                                port: 0
                        }
                }).then(function (data) {
                        expect(data === undefined).assertTrue()
                        done()
                })
                done()
        });

});
}