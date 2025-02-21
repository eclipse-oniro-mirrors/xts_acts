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
import { describe, it, expect } from 'hypium/index';
import Utils from './Utils';
import Bundle from '@ohos.bundle';

const BUNDLE_NAME = 'com.open.harmony.packagemag';
const ABILITY_NAME = 'com.open.harmony.packagemag.MainAbility';
const SERVICE_ABILITY_NAME = 'com.open.harmony.packagemag.ServiceAbility';
const OTHER_BUNDLE_NAME = 'com.example.l3jsdemo';
const OTHER_ABILITY_NAME = 'com.example.l3jsdemo.MainAbility';
const BUNDLE_NAME_ERROR = 'com.ohos.acepackage.error';
const ABILITY_NAME_ERROR = 'com.ohos.acepackage.error.MainAbility';

export default function getAbilityLabel() {

    describe('getAbilityLabel_test', function () {


        /*
         * @tc.number: getAbilityLabel_test_0100
         * @tc.name: Test getAbilityLabel : Gets the specified ability label
         * @tc.desc: Check the return value of the interface
         */
        it('getAbilityLabel_test_0100', 0, async function (done) {
            await Bundle.getAbilityLabel(BUNDLE_NAME, ABILITY_NAME).then((data) => {
                expect(data).assertEqual("entry_MainAbility");
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.getAbilityLabel(BUNDLE_NAME, ABILITY_NAME, (error, data) => {
                expect(error).assertNull();
                expect(data).assertEqual("entry_MainAbility");
                done();
            });
        });

        /*
         * @tc.number: getAbilityLabel_test_0200
         * @tc.name: getAbilityLabel : Gets the specified ability label
         * @tc.desc: Check the return value of the interface
         */
        it('getAbilityLabel_test_0200', 0, async function (done) {
            let timeOldStamp = await Utils.getNowTime();
            await Bundle.getAbilityLabel(OTHER_BUNDLE_NAME, OTHER_ABILITY_NAME).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[getAbilityLabel_test_0200]', timeOldStamp, timeNewStamp);
                expect(data).assertEqual("bmsfirstright");
            }).catch((error) => {
                expect(error).assertFail();
            });
            timeOldStamp = await Utils.getNowTime();
            Bundle.getAbilityLabel(OTHER_BUNDLE_NAME, OTHER_ABILITY_NAME, (error, data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[context_getAbilityLabel_test_0200]', timeOldStamp, timeNewStamp);
                expect(data).assertEqual("bmsfirstright");
                expect(error).assertNull();
                done();
            });
        });

        /*
         * @tc.number: getAbilityLabel_test_0300
         * @tc.name: getAbilityLabel : Gets the specified ability label
         * @tc.desc: Check the return value of the interface
         */
        it('getAbilityLabel_test_0300', 0, async function (done) {
            await Bundle.getAbilityLabel(BUNDLE_NAME, SERVICE_ABILITY_NAME).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error).assertEqual(1);
            });
            Bundle.getAbilityLabel(BUNDLE_NAME, SERVICE_ABILITY_NAME, (error, data) => {
                expect(error).assertEqual(1);
                expect(data).assertEqual(undefined);
                done();
            });
        });

        /*
         * @tc.number: getAbilityLabel_test_0400
         * @tc.name: getAbilityLabel : Gets the specified ability label
         * @tc.desc: Check the return value of the interface
         */
        it('getAbilityLabel_test_0400', 0, async function (done) {
            let timeOldStamp = await Utils.getNowTime();
            await Bundle.getAbilityLabel(BUNDLE_NAME_ERROR, ABILITY_NAME_ERROR).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[getAbilityLabel_test_0400]', timeOldStamp, timeNewStamp);
                expect(error).assertEqual(1);
            });
            await Bundle.getAbilityLabel("", "").then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error).assertEqual(1);
            });
            timeOldStamp = await Utils.getNowTime();
            Bundle.getAbilityLabel(BUNDLE_NAME_ERROR, ABILITY_NAME_ERROR, (error, data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[getAbilityLabel_test_0400]', timeOldStamp, timeNewStamp);
                expect(error).assertEqual(1);
                expect(data).assertEqual(undefined);
                Bundle.getAbilityLabel("", "", (error, data) => {
                    expect(error).assertEqual(1);
                    expect(data).assertEqual(undefined);
                    done();
                });
            });
        });

        /*
         * @tc.number: getAbilityLabel_test_0500
         * @tc.name: getAbilityLabel : Gets the specified ability label
         * @tc.desc: Check the return value of the interface
         */
        it('getAbilityLabel_test_0500', 0, async function (done) {
            await Bundle.getAbilityLabel(undefined, OTHER_ABILITY_NAME).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error).assertEqual(2);
            });
            await Bundle.getAbilityLabel(OTHER_BUNDLE_NAME, undefined).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error).assertEqual(2);
            });
            await Bundle.getAbilityLabel(undefined, undefined).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error).assertEqual(2);
            });
            Bundle.getAbilityLabel(undefined, OTHER_ABILITY_NAME, (error, data) => {
                expect(error).assertEqual(2);
                expect(data).assertEqual(undefined);
                Bundle.getAbilityLabel(OTHER_BUNDLE_NAME, undefined, (error, data) => {
                    expect(error).assertEqual(2);
                    expect(data).assertEqual(undefined);
                    Bundle.getAbilityLabel(undefined, undefined, (error, data) => {
                        expect(error).assertEqual(2);
                        expect(data).assertEqual(undefined);
                        done();
                    });
                });
            });
        });

    })

}