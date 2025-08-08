/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, it, expect } from '@ohos/hypium';
import Utils from './Utils';
import Bundle from '@ohos.bundle';

const BUNDLE_NAME = 'com.open.harmony.packagemag';
const BUNDLE_NAME_OTHER = 'com.example.l3jsdemo';
const BUNDLE_NAME_ERROR = 'com.ohos.acepackage.error';

export default function IsApplicationEnabledETSUnit() {

    describe('isApplicationEnabled_test', function () {

        /*
         * @tc.number: Sub_Bms_Framework_Status_AppEnable_3000
         * @tc.name: isApplicationEnabled : Get whether to enable a specified application
         * @tc.desc: Check the return value of the interface (by promise)
         */
        it('Sub_Bms_Framework_Status_AppEnable_3000', 0, async function (done) {
            let timeOldStamp = await Utils.getNowTime();
            await Bundle.isApplicationEnabled(BUNDLE_NAME).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[Sub_Bms_Framework_Status_AppEnable_3000]', timeOldStamp, timeNewStamp);
                expect(data).assertTrue();
            }).catch((error) => {
                expect(error).assertFail();
            });
            timeOldStamp = await Utils.getNowTime();
            Bundle.isApplicationEnabled(BUNDLE_NAME, (error, data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[Sub_Bms_Framework_Status_AppEnable_3000]', timeOldStamp, timeNewStamp);
                expect(error.code).assertEqual(0);
                expect(data).assertTrue();
                done();
            });
        });

        /*
         * @tc.number: Sub_Bms_Framework_Status_AppEnable_2900
         * @tc.name: isApplicationEnabled : Get whether to enable a specified application
         * @tc.desc: Check the return value of the interface (by promise)
         */
        it('Sub_Bms_Framework_Status_AppEnable_2900', 0, async function (done) {
            await Bundle.isApplicationEnabled(BUNDLE_NAME_ERROR).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            await Bundle.isApplicationEnabled("").then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            await Bundle.isApplicationEnabled(undefined).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(2);
            });
            Bundle.isApplicationEnabled(BUNDLE_NAME_ERROR, (error, data) => {
                expect(error.code).assertEqual(0);
                expect(data).assertFalse();
                Bundle.isApplicationEnabled("", (error, data) => {
                    expect(error.code).assertEqual(0);
                    expect(data).assertFalse();
                    Bundle.isApplicationEnabled(undefined, (error, data) => {
                        expect(error.code).assertEqual(2);
                        expect(data).assertEqual(undefined);
                        done();
                    });
                });
            });
        });

        /*
         * @tc.number: Sub_Bms_Framework_Status_AppEnable_3100
         * @tc.name: isApplicationEnabled : Get whether to enable a specified application
         * @tc.desc: Check the return value of the interface (by promise)
         */
        it('Sub_Bms_Framework_Status_AppEnable_3100', 0, async function (done) {
            let timeOldStamp = await Utils.getNowTime();
            await Bundle.isApplicationEnabled(BUNDLE_NAME_OTHER).then((data) => {
                expect(data).assertTrue();
            }).catch((error) => {
                expect(error).assertFail();
            });
            timeOldStamp = await Utils.getNowTime();
            Bundle.isApplicationEnabled(BUNDLE_NAME_OTHER, (error, data) => {
                expect(error.code).assertEqual(0);
                expect(data).assertTrue();
                done();
            });
        });

    })

}