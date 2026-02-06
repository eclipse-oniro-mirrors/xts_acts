/*
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

import bundle from '@ohos.bundle'
import image from '@ohos.multimedia.image'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const BUNDLE_NAME = "com.open.harmony.packagemag";
const ABILITIY_NAME = "com.open.harmony.packagemag.MainAbility";
const SERVICE_NAME = "com.open.harmony.packagemag.ServiceAbility";
const BUNDLE_NAME_OTHER = "com.example.l3jsdemo";
const ABILITIY_NAME_OTHER = "com.example.l3jsdemo.MainAbility";
const BUNDLE_NAME_ERROR = "com.ohos.packagemag";
const ABILITIY_NAME_ERROR = "com.ohos.packagemag.MainAbility";

export default function getAbilityIcon() {
    describe('ActsBmsGetAbilityIconTest', function () {

        /*
         * @tc.number: Sub_Bms_Framework_Query_Icon_2800
         * @tc.name: test getAbilityIcon
         * @tc.desc: get the abilityIcon
         */
        it('Sub_Bms_Framework_Query_Icon_2800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME_OTHER, ABILITIY_NAME_OTHER).then(pixelmap => {
                console.log('Sub_Bms_Framework_Query_Icon_2800 success: ' + pixelmap.getBytesNumberPerRow());
                expect(pixelmap.getBytesNumberPerRow()).assertLarger(0);
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err));
                expect(err).assertFail();
            });
            bundle.getAbilityIcon(BUNDLE_NAME_OTHER, ABILITIY_NAME_OTHER, (err, pixelmap) => {
                expect(err).assertEqual(0);
                expect(pixelmap.getBytesNumberPerRow()).assertLarger(0);
                done();
            });
        });

        /*
         * @tc.number: Sub_Bms_Framework_Query_Icon_2700
         * @tc.name: test getAbilityIcon
         * @tc.desc: get the abilityIcon
         */
        it('Sub_Bms_Framework_Query_Icon_2700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME, ABILITIY_NAME).then(pixelmap => {
                console.log('Sub_Bms_Framework_Query_Icon_2700 success: ' + pixelmap.getBytesNumberPerRow());
                expect(pixelmap.getBytesNumberPerRow()).assertLarger(0);
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err));
                expect(err).assertFail();
            });
            bundle.getAbilityIcon(BUNDLE_NAME, ABILITIY_NAME, (err, pixelmap) => {
                expect(err).assertEqual(0);
                expect(pixelmap.getBytesNumberPerRow()).assertLarger(0);
                done();
            });
        });

        /*
         * @tc.number: Sub_Bms_Framework_Query_Icon_2900
         * @tc.name: test getAbilityIcon
         * @tc.desc: get the abilityIcon
         */
        it('Sub_Bms_Framework_Query_Icon_2900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME, SERVICE_NAME).then(pixelmap => {
                expect().assertFail();
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err));
                expect(err).assertEqual(1);
            });
            bundle.getAbilityIcon(BUNDLE_NAME, SERVICE_NAME, (err, pixelmap) => {
                expect(err).assertEqual(1);
                done();
            });
        });

        /*
         * @tc.number: Sub_Bms_Framework_Query_Icon_3200
         * @tc.name: test getAbilityIcon
         * @tc.desc: get the abilityIcon
         */
        it('Sub_Bms_Framework_Query_Icon_3200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME, ABILITIY_NAME_ERROR).then(pixelmap => {
                expect(pixelmap !== null).assertFail();
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err))
                expect(err).assertEqual(1);
            });
            await bundle.getAbilityIcon(BUNDLE_NAME_ERROR, ABILITIY_NAME).then(pixelmap => {
                expect().assertFail();
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err))
                expect(err).assertEqual(1);
            });
            await bundle.getAbilityIcon("", "").then(pixelmap => {
                expect().assertFail();
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err))
                expect(err).assertEqual(1);
            });
            bundle.getAbilityIcon(BUNDLE_NAME, ABILITIY_NAME_ERROR, (err, pixelmap) => {
                console.log('bms_getAbilityIcon_0100 success: ' + pixelmap);
                expect(err).assertEqual(1);
                bundle.getAbilityIcon(BUNDLE_NAME_ERROR, ABILITIY_NAME, (err, pixelmap) => {
                    expect(err).assertEqual(1);
                    bundle.getAbilityIcon("", "", (err, pixelmap) => {
                        expect(err).assertEqual(1);
                        done();
                    });
                });
            });
        });

        /*
         * @tc.number: Sub_Bms_Framework_Query_Icon_3000
         * @tc.name: test getAbilityIcon
         * @tc.desc: get the abilityIcon
         */
        it('Sub_Bms_Framework_Query_Icon_3000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME, undefined).then(pixelmap => {
                expect(pixelmap).assertFail();
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err));
                expect(err).assertEqual(2);
            });
            await bundle.getAbilityIcon(undefined, ABILITIY_NAME).then(pixelmap => {
                expect(pixelmap).assertFail();
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err));
                expect(err).assertEqual(2);
            });
            await bundle.getAbilityIcon(undefined, undefined).then(pixelmap => {
                expect(pixelmap).assertFail();
            }).catch(err => {
                console.info("getAbilityIcon fail:" + JSON.stringify(err));
                expect(err).assertEqual(2);
            });
            bundle.getAbilityIcon(BUNDLE_NAME, undefined, (err, pixelmap) => {
                console.log('bms_getAbilityIcon_0100 success: ' + pixelmap);
                expect(err).assertEqual(2);
                bundle.getAbilityIcon(undefined, ABILITIY_NAME, (err, pixelmap) => {
                    expect(err).assertEqual(2);
                    bundle.getAbilityIcon(undefined, undefined, (err, pixelmap) => {
                        expect(err).assertEqual(2);
                        done();
                    });
                });
            });
        });

    });
}