/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import stationary from "@ohos.stationary"
import { describe, it, expect } from '@ohos/hypium'
let reportLatencyNs = 1000000000;

export default function DeviceStatusUnitTest() {
    describe('DeviceStatusUnitTest', function () {
        console.log("*************DeviceStatus API Test Begin*************");
        var p_done = undefined;
        const pub_callback = (data) => {
            console.log('callback data: ' + JSON.stringify(data) + ', data.value:' + data.value);
            expect(data.value >= -1).assertTrue();
            console.log(' done ');
            if (p_done != undefined) {
                p_done();
            } else {
                console.log(' p_done is undefined');
            }
        }

        /**
         * @tc.number    : SUB_MSDP_DeviceStatus_API_Stationary_0100
         * @tc.name      : SUB_MSDP_DeviceStatus_API_Stationary_0100
         * @tc.desc      : Stationary callback interface test
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0100', 0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0100 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("still", stationary.ActivityEvent.ENTER_EXIT, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0100 once start");
            try {
                p_done = done;
                stationary.once("still", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0100 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("still", stationary.ActivityEvent.ENTER_EXIT, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.number    : SUB_MSDP_DeviceStatus_API_Stationary_0200
         * @tc.name      : SUB_MSDP_DeviceStatus_API_Stationary_0200
         * @tc.desc      : Stationary callback interface test
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0200', 0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0200 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.EXIT, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0200 once start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0200 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", stationary.ActivityEvent.EXIT, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.number    : SUB_MSDP_DeviceStatus_API_Stationary_0300
         * @tc.name      : SUB_MSDP_DeviceStatus_API_Stationary_0300
         * @tc.desc      : Stationary callback interface test
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0300', 0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0300 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("Type_Unknow", stationary.ActivityEvent.ENTER_EXIT, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                console.info(`stationary.on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0300 once start");
            try {
                p_done = done;
                stationary.once("Type_Unknow", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                console.info(`stationary.once fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0300 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("Type_Unknow", stationary.ActivityEvent.ENTER_EXIT, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    console.info(`stationary.once fail: ${JSON.stringify(error, ['code', 'message'])}`);
                    expect(error.code).assertEqual(401);
                    done();
                }
            }, 200);
        })

        /**
         * @tc.number    : SUB_MSDP_DeviceStatus_API_Stationary_0400
         * @tc.name      : SUB_MSDP_DeviceStatus_API_Stationary_0400
         * @tc.desc      : Stationary callback interface test
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0400', 0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0400 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.ENTER, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0400 once start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0400 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", stationary.ActivityEvent.ENTER, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.number    : SUB_MSDP_DeviceStatus_API_Stationary_0500
         * @tc.name      : SUB_MSDP_DeviceStatus_API_Stationary_0500
         * @tc.desc      : Stationary callback interface test
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0500', 0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0500 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.EXIT, 1, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                console.info(`stationary.on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0500 once start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0500 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", stationary.ActivityEvent.EXIT, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })
    })
}
