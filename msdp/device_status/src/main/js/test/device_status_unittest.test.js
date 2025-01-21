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
const MSEC_1000 = 1000;

export default function DeviceStatusUnitTest() {
    describe('DeviceStatusUnitTest', function () {
        console.log("*************DeviceStatus API Test Begin*************");
        var p_done = undefined;
        const pub_callback = (data) => {
            console.log('callback data: ' + JSON.stringify(data) + ', data.value:' + data.value);
            expect(data.value >= 1).assertTrue();
            console.log(' done ');
            if (p_done != undefined) {
                p_done();
            } else {
                console.log(' p_done is undefined');
            }
        }

        /**
         * @tc.number DeviceStatus_001
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_001', 0, function (done) {
            console.log("msdp_test_devices_status_001 start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("still", 3, 1, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_002
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_002', 0, function (done) {
            console.log("msdp_test_devices_status_002 start");
            try {
                p_done = done;
                stationary.once("still", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_003
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_003', 0, function (done) {
            console.log("msdp_test_devices_status_003 start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("still", 3, pub_callback);
                    expect(true).assertTrue();
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    done();
                }
            }, 200);
        })



        /**
         * @tc.number DeviceStatus_004
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_004', 0, function (done) {
            console.log("msdp_test_devices_status_004 start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", 3, 1, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_005
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_005', 0, function (done) {
            console.log("msdp_test_devices_status_005 start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_006
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_006', 0, function (done) {
            console.log("msdp_test_devices_status_006 start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", 3, pub_callback);
                    expect(true).assertTrue();
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    done();
                }
            }, 200);
        })

        /**
        * @tc.number DeviceStatus_007
        * @tc.name
        * @tc.callback:AsyncCallback<HighStillResponse>
        * parameter unknown
        */
        it('msdp_test_devices_status_007', 0, function (done) {
            console.log("msdp_test_devices_status_007 start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("Type_Unknow", 3, 1, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_008
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_008', 0, function (done) {
            console.log("msdp_test_devices_status_008 start");
            try {
                p_done = done;
                stationary.once("Type_Unknow", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_009
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_009', 0, function (done) {
            console.log("msdp_test_devices_status_009 start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("Type_Unknow", 3, pub_callback);
                    expect(true).assertTrue();
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    done();
                }
            }, 200);
        })



        /**
        * @tc.number DeviceStatus_010
        * @tc.name
        * @tc.callback:AsyncCallback<HighStillResponse>
        * parameter unknown
        */
        it('msdp_test_devices_status_010', 0, function (done) {
            console.log("msdp_test_devices_status_010 start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", 3, 1, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_011
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_011', 0, function (done) {
            console.log("msdp_test_devices_status_011 start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_012
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_012', 0, function (done) {
            console.log("msdp_test_devices_status_012 start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", 1, pub_callback);
                    expect(true).assertTrue();
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    done();
                }
            }, 200);
        })


        /**
             * @tc.number DeviceStatus_013
             * @tc.name
             * @tc.callback:AsyncCallback<HighStillResponse>
             * parameter unknown
             */
        it('msdp_test_devices_status_013', 0, function (done) {
            console.log("msdp_test_devices_status_013 start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", 3, 1, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_014
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_014', 0, function (done) {
            console.log("msdp_test_devices_status_014 start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                done();
            }
        })


        /**
         * @tc.number DeviceStatus_015
         * @tc.name
         * @tc.callback:AsyncCallback<HighStillResponse>
         * parameter unknown
         */
        it('msdp_test_devices_status_015', 0, function (done) {
            console.log("msdp_test_devices_status_015 start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", 2, pub_callback);
                    expect(true).assertTrue();
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    done();
                }
            }, 200);
        })

    })
}
