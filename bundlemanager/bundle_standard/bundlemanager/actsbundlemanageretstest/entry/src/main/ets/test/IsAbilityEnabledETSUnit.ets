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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import Bundle from '@ohos.bundle';

const BUNDLE_NAME = 'com.open.harmony.packagemag';
const BUNDLE_NAME_OTHER = 'com.example.l3jsdemo';
const BUNDLE_NAME_ERROR = 'com.ohos.acepackage.error';
const ABILITY_NAME = 'com.open.harmony.packagemag.MainAbility';
const ABILITY_NAME_OTHER = 'com.example.l3jsdemo.MainAbility';
const ABILITY_NAME_ERROR = 'com.ohos.acepackage.error.MainAbility';
const ABILITY_ERROR1 = {
    bundleName: BUNDLE_NAME_ERROR,
    name: ABILITY_NAME_ERROR
};
const ABILITY_ERROR2 = {
    bundleName: "",
    name: ABILITY_NAME
};
const ABILITY_ERROR3 = {
    bundleName: BUNDLE_NAME,
    name: ""
};
const ABILITY_ERROR4 = {
    bundleName: undefined,
    name: ABILITY_NAME
};
const ABILITY_ERROR5 = {
    bundleName: BUNDLE_NAME,
    name: undefined
};
const ABILITY_ERROR6 = {
    bundleName: undefined,
    name: undefined
};
const ABILITY_ERROR7 = {
    bundleName: "",
    name: ""
};


export default function isAbilityEnabledETSUnit() {

    describe('isAbilityEnabled_test', function () {

        /**
         * @tc.name   Sub_Bms_Framework_Status_AbilityEnable_5400
         * @tc.number Sub_Bms_Framework_Status_AbilityEnable_5400
         * @tc.desc   Check the return value of the interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Sub_Bms_Framework_Status_AbilityEnable_5400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            let timeOldStamp = await Utils.getNowTime();
            let abilityInfo = generateAbilityInfoForTest(BUNDLE_NAME,ABILITY_NAME);
            await Bundle.isAbilityEnabled(abilityInfo).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[Sub_Bms_Framework_Status_AbilityEnable_5400]', timeOldStamp, timeNewStamp);
                expect(data).assertTrue();
            }).catch((error) => {
                expect(error).assertFail();
            });
            timeOldStamp = await Utils.getNowTime();
            Bundle.isAbilityEnabled(abilityInfo, (error, data) => {
                if (error.code != 0) {
                    expect(error).assertFail();
                }
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[Sub_Bms_Framework_Status_AbilityEnable_5400]', timeOldStamp, timeNewStamp);
                expect(data).assertTrue();
                done();
            });
        });

        /**
         * @tc.name   Sub_Bms_Framework_Status_AbilityEnable_5300
         * @tc.number Sub_Bms_Framework_Status_AbilityEnable_5300
         * @tc.desc   Check the return value of the interface when bundleName and ability error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('Sub_Bms_Framework_Status_AbilityEnable_5300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            let abilityInfo1 = generateAbilityInfoForTest(ABILITY_ERROR1.bundleName,ABILITY_ERROR1.name);
            let abilityInfo2 = generateAbilityInfoForTest(ABILITY_ERROR2.bundleName,ABILITY_ERROR2.name);
            let abilityInfo3 = generateAbilityInfoForTest(ABILITY_ERROR3.bundleName,ABILITY_ERROR3.name);
            let abilityInfo7 = generateAbilityInfoForTest(ABILITY_ERROR7.bundleName,ABILITY_ERROR7.name);
            Bundle.isAbilityEnabled(abilityInfo1).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.isAbilityEnabled(abilityInfo2).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.isAbilityEnabled(abilityInfo3).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.isAbilityEnabled(abilityInfo7).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.isAbilityEnabled(abilityInfo1, (error, data) => {
                expect(error.code).assertEqual(0);
                expect(data).assertFalse();
                Bundle.isAbilityEnabled(abilityInfo2, (error, data) => {
                    expect(error.code).assertEqual(0);
                    expect(data).assertFalse();
                    Bundle.isAbilityEnabled(abilityInfo3, (error, data) => {
                        expect(error.code).assertEqual(0);
                        expect(data).assertFalse();
                        Bundle.isAbilityEnabled(abilityInfo7, (error, data) => {
                            expect(error.code).assertEqual(0);
                            expect(data).assertFalse();
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.name   Sub_Bms_Framework_Status_AbilityEnable_5200
         * @tc.number Sub_Bms_Framework_Status_AbilityEnable_5200
         * @tc.desc   Check the return value of the interface when bundleName and ability error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Bms_Framework_Status_AbilityEnable_5200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            let abilityInfo4 = generateAbilityInfoForTest(ABILITY_ERROR4.bundleName,ABILITY_ERROR4.name);
            let abilityInfo5 = generateAbilityInfoForTest(ABILITY_ERROR5.bundleName,ABILITY_ERROR5.name);
            let abilityInfo6 = generateAbilityInfoForTest(ABILITY_ERROR6.bundleName,ABILITY_ERROR6.name);
            Bundle.isAbilityEnabled(abilityInfo4).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(2);
            });
            Bundle.isAbilityEnabled(abilityInfo5).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(2);
            });
            Bundle.isAbilityEnabled(abilityInfo6).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(2);
            });
            Bundle.isAbilityEnabled(abilityInfo4, (error, data) => {
                expect(error.code).assertEqual(2);
                expect(data).assertEqual(undefined);
                Bundle.isAbilityEnabled(abilityInfo5, (error, data) => {
                    expect(error.code).assertEqual(2);
                    expect(data).assertEqual(undefined);
                    Bundle.isAbilityEnabled(abilityInfo6, (error, data) => {
                        expect(error.code).assertEqual(2);
                        expect(data).assertEqual(undefined);
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   Sub_Bms_Framework_Status_AbilityEnable_5500
         * @tc.number Sub_Bms_Framework_Status_AbilityEnable_5500
         * @tc.desc   Check the return value of the interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Bms_Framework_Status_AbilityEnable_5500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(BUNDLE_NAME_OTHER,ABILITY_NAME_OTHER);
            await Bundle.isAbilityEnabled(abilityInfo).then((data) => {
                expect(data).assertTrue();
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.isAbilityEnabled(abilityInfo, (error, data) => {
                expect(error.code).assertEqual(0);
                expect(data).assertTrue();
                done();
            });
        });

        function generateAbilityInfoForTest(bundleName, name) {
            let map1 = new Map([
                ["", [{
                    "name": "", "value": "", "extra": ""
                }]]
            ]);
            let map2 = new Map([
                ["", [{
                    "name": "", "value": "", "resource": ""
                }]]
            ]);
            let resource = {
                "bundleName": "", "moduleName": "", "id": 0
            }
            let abilityInfo = {
                bundleName: bundleName,
                name: name,
                label: "",
                description: "",
                icon: "",
                labelId: 0,
                descriptionId: 0,
                iconId: 0,
                moduleName: "",
                process: "",
                targetAbility: "",
                backgroundModes: 0,
                isVisible: true,
                formEnabled: true,
                type: 0,
                subType: 0,
                orientation: 0,
                launchMode: 0,
                permissions: [], deviceTypes: [], deviceCapabilities: [], readPermission: "", writePermission: "",
                applicationInfo: {
                    name: "", description: "", descriptionId: 0, systemApp: true, enabled: true, label: "",
                    labelId: "", labelIndex: 0, icon: "", iconId: "", iconIndex: 0, process: "", supportedModes: 0, moduleSourceDirs: [],
                    permissions: [], moduleInfos: [], entryDir: "", codePath: "", metaData: map1, metadata: map2,
                    removable: true, accessTokenId: 0, uid: 0, entityType: "", fingerprint: "",
                    iconResource: resource, labelResource: resource, descriptionResource: resource,
                    appDistributionType :"" ,appProvisionType :"", nativeLibraryPath: ""
                },
                uri: "", metaData: [], metadata: [], enabled: true, supportWindowMode: [],
                maxWindowRatio: 0, minWindowRatio: 0, maxWindowWidth: 0, minWindowWidth: 0, maxWindowHeight: 0, minWindowHeight: 0
            };
            return abilityInfo;
        }



    })
}