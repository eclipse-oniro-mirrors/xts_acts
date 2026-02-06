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

import network from '@system.network';
import { describe, expect, it , TestType, Size, Level } from '@ohos/hypium';
import connection from '@ohos.net.connection';

export default function Telephony_NetManager_NetWorkTest() {

    describe("Telephony_NetManager_NetWorkTest", function () {

        /**
         * @tc.number Telephony_NetManager_NetWorkTest_GetType_None_0100
         * @tc.name Whether the GetType method is called successfully without WiFi
         * @tc.desc Function test
         */
        it("Telephony_NetManager_NetWorkTest_GetType_None_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            connection.getDefaultNet(function (error, netHandle) {
                if (error || netHandle.netId >= 100) {
                    console.info("Network available or Network error:" + error);
                    done();
                    return;
                }
                network.getType({
                    success: function (data) {
                        console.info("NetManager getType " + JSON.stringify(data));
                        expect(data.type == "none").assertTrue();
                        expect(data.metered == false).assertTrue();
                        done();
                    },
                    fail: function (data, code) {
                        console.log("data:" + JSON.stringify(data) + " code:" + JSON.stringify(code));
                        expect().assertFail();
                        done();
                    },
                    complete: function () {
                    }
                })
            })
        });

        /**
         * @tc.number Telephony_NetManager_NetWorkTest_GetType_None_0200
         * @tc.name Whether to call GetType method again without WiFi
         * @tc.desc Function test
         */
        it("Telephony_NetManager_NetWorkTest_GetType_None_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            connection.getDefaultNet(function (error, netHandle) {
                if (error || netHandle.netId >= 100) {
                    console.info("Network available or Network error:" + error);
                    done();
                    return;
                }
                network.getType({
                    success: function (data) {
                        console.info("NetManager getType 1 " + JSON.stringify(data));
                        expect(data.type == "none").assertTrue();
                        expect(data.metered == false).assertTrue();
                        done();
                        console.info("NetManager Telephony_NetManager_NetWorkTest_GetType_none_1 end");
                    },
                    fail: function (data, code) {
                        console.log("data:" + JSON.stringify(data) + " code:" + JSON.stringify(code));
                        expect().assertFail();
                        done();
                    },
                    complete: function () {
                    }
                })
            })
        });

        /**
         * @tc.number Telephony_NetManager_NetWorkTest_Subscribe_None_0100
         * @tc.name Whether the subscribe method is called successfully without WiFi
         * @tc.desc Function test
         */
        it("Telephony_NetManager_NetWorkTest_Subscribe_None_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            connection.getDefaultNet(function (error, netHandle) {
                if (error || netHandle.netId >= 100) {
                    console.info("Network available or Network error:" + error);
                    done();
                    return;
                }
                network.subscribe({
                    success: function (data) {
                        console.info("NetManager subscribe " + JSON.stringify(data));
                        expect(data.type == "none").assertTrue();
                        expect(data.metered == false).assertTrue();
                    },
                    fail: function (data, code) {
                        console.log("data:" + JSON.stringify(data) + " code:" + JSON.stringify(code));
                        expect().assertFail();
                        done();
                    }
                });
                setTimeout(()=>{
                    network.unsubscribe();
                    console.info("async function unsubscribe end");
                    done();
                },1500);
            });
        });

        /**
         * @tc.number Telephony_NetManager_NetWorkTest_Subscribe_None_0200
         * @tc.name Whether to call the subscribe method again without WiFi
         * @tc.desc Function test
         */
        it("Telephony_NetManager_NetWorkTest_Subscribe_None_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            connection.getDefaultNet(function (error, netHandle) {
                if (error || netHandle.netId >= 100) {
                    console.info("Network available or Network error:" + error);
                    done();
                    return;
                }
                network.subscribe({
                    success: function (data) {
                        console.info("NetManager subscribe " + JSON.stringify(data));
                        expect(data.type == "none").assertTrue();
                        expect(data.metered == false).assertTrue();
                    },
                    fail: function (data, code) {
                        console.log("data:" + JSON.stringify(data) + " code:" + JSON.stringify(code));
                        expect().assertFail();
                        done();
                    }
                });
                setTimeout(()=>{
                    network.unsubscribe();
                    console.info("async function unsubscribe end");
                    done();
                },1500);
            });
        });
    });
}