/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';
import formError from '@ohos.application.formError';

let module1FormInfo: formInfo.FormInfo = {
    bundleName: "com.example.getformsinfotest",
    moduleName: "module1",
    abilityName: "FormAbility",
    name: "module1_widget",
    displayName: "GetFormsInfo Demo1",
    displayNameId: 0,
    descriptionId: 0,
    description: "This is a service widget.",
    type:1,
    jsComponentName: "",
    colorMode: -1,
    isDefault: true,
    updateEnabled: true,
    formVisibleNotify: true,
    scheduledUpdateTime: "10:30",
    formConfigAbility: "ability://xxxxx",
    updateDuration: 1,
    defaultDimension:2,
    supportDimensions:[2, 6],
    supportedShapes:[2],
    customizeData: {},
    isDynamic: true,
    transparencyEnabled: false
}

let module2FormInfo: formInfo.FormInfo = {
    bundleName: "com.example.getformsinfotest",
    moduleName: "module2",
    abilityName: "FormAbility",
    name: "module2_widget",
    displayName: "GetFormsInfo Demo2",
    displayNameId: 0,
    descriptionId: 0,
    description: "This is a service widget.",
    type:1,
    jsComponentName: "",
    colorMode: -1,
    isDefault: true,
    updateEnabled: true,
    formVisibleNotify: true,
    scheduledUpdateTime: "10:30",
    formConfigAbility: "ability://xxxxx",
    updateDuration: 1,
    defaultDimension:2,
    supportDimensions:[2],
    supportedShapes:[1],
    customizeData: {},
    isDynamic: true,
    transparencyEnabled: false
}

const ERR_ADD_INVALID_PARAM = 401;
var expectResult = Array();
expectResult.push(module1FormInfo);
expectResult.push(module2FormInfo);

export default function abilityTest() {
    describe('ProviderGetFormsInfoTest', function () {
        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0100
         * @tc.name      : testProviderGetForsInfo0100
         * @tc.desc      : getFormsInfo(callback).
         * @tc.level     : Level 1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0100', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_0100");
            formProvider.getFormsInfo((err, value) => {
                console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(expectResult, value)
                done();
            });
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0200
         * @tc.name      : testProviderGetForsInfo0200
         * @tc.desc      : getFormsInfo(filter, undefined) # Have no idea how to test it.
         * @tc.level     : Level 1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0200', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_0200");
            const filter : formInfo.FormInfoFilter = {
                moduleName : "module1"
            };
            try {
                formProvider.getFormsInfo(filter, undefined);
            } catch(err) {
                expect().assertFail();
            }
            done();
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0300
         * @tc.name      : testProviderGetForsInfo0300
         * @tc.desc      : getFormsInfo().
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0300', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_0300");
            formProvider.getFormsInfo().then((value) => {
                expect(value.length).assertEqual(2);
                checkResultArray(expectResult, value);
            }).catch((err) => {
                console.info('formProvider::GetFormsInfoTest failed' + JSON.stringify(err));
                expect().assertFail();
            })
            done();
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0500
         * @tc.name      : testProviderGetForsInfo0500
         * @tc.desc      : getFormsInfo(filter, callback) where filter = {}.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0500', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_getFormsInfo_0105");
            const filter : formInfo.FormInfoFilter = {};
            formProvider.getFormsInfo(filter, function(err, value) {
                console.info("formProvider::GetFormsInfoTest: " + JSON.stringify(err));
                console.info("formProvider::GetFormsInfoTest: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(expectResult, value);
                done();
            });
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0600
         * @tc.name      : testProviderGetForsInfo0600
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = "".
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0600', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_0600");
            const filter : formInfo.FormInfoFilter = {
                moduleName: ""
            };
            formProvider.getFormsInfo(filter, function(err, value) {
                console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(expectResult, value);
                done();
            });
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0700
         * @tc.name      : testProviderGetForsInfo0700
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = undefined.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0700', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_0700");
            const filter : formInfo.FormInfoFilter = {
                moduleName: undefined
            };
            formProvider.getFormsInfo(filter, function(err, value) {
                console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(expectResult, value);
                done();
            });
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0800
         * @tc.name      : testProviderGetForsInfo0800
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = "HelloWorld" which doesn't exist.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0800', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_0800");
            const filter : formInfo.FormInfoFilter = {
                moduleName: "HelloWorld"
            };
            formProvider.getFormsInfo(filter, function(err, value) {
                console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(0);
                done();
            });
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0900
         * @tc.name      : testProviderGetForsInfo0900
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = "module1" which does exist.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0900', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_0900");
            const filter : formInfo.FormInfoFilter = {
                moduleName: "module1"
            };
            formProvider.getFormsInfo(filter, function(err, value) {
                console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(1);
                checkResult(module1FormInfo, value[0]);
                done();
            });
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1000
         * @tc.name      : testProviderGetForsInfo1000
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = "entry" exists but has no forms.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1000', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_1000");
            const filter : formInfo.FormInfoFilter = {
                moduleName: "entry"
            };
            formProvider.getFormsInfo(filter, function(err, value) {
                console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(0);
                done();
            });
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1200
         * @tc.name      : testProviderGetForsInfo1200
         * @tc.desc      : getFormsInfo(filter) where filter = {}.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1200', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_1200");
            const filter : formInfo.FormInfoFilter = {};
            await formProvider.getFormsInfo(filter).then((value) => {
                expect(value.length).assertEqual(2);
                checkResultArray(expectResult, value);
            }).catch((err) => {
                console.info('formProvider::GetFormsInfoTest failed' + JSON.stringify(err));
                expect().assertFail();
            })
            done();
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1300
         * @tc.name      : testProviderGetForsInfo1300
         * @tc.desc      : getFormsInfo(filter) where moduleName = "".
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1300', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_1300");
            const filter : formInfo.FormInfoFilter = {
                moduleName: ""
            };
            await formProvider.getFormsInfo(filter).then((value) => {
                expect(value.length).assertEqual(2);
                checkResultArray(expectResult, value);
            }).catch((err) => {
                console.info('formProvider::GetFormsInfoTest failed' + JSON.stringify(err));
                expect().assertFail();
            })
            done();
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1400
         * @tc.name      : testProviderGetForsInfo1400
         * @tc.desc      : getFormsInfo(filter) where moduleName = undefined.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1400', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_1400");
            const filter : formInfo.FormInfoFilter = {
                moduleName: undefined
            };
            formProvider.getFormsInfo(filter).then((value) => {
                expect(value.length).assertEqual(2);
                checkResultArray(expectResult, value);
            }).catch((err) => {
                console.info('formProvider::GetFormsInfoTest failed' + JSON.stringify(err));
                expect().assertFail();
            })
            done();
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1500
         * @tc.name      : testProviderGetForsInfo1500
         * @tc.desc      : getFormsInfo(filter) where moduleName = "HelloWorld" which doesn't exist.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1500', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_1500");
            const filter : formInfo.FormInfoFilter = {
                moduleName: "HelloWorld"
            };
            await formProvider.getFormsInfo(filter).then((value) => {
                expect(value.length).assertEqual(0);
            }).catch((err) => {
                console.info('formProvider::GetFormsInfoTest failed' + JSON.stringify(err));
                expect().assertFail();
            })
            done();
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1600
         * @tc.name      : testProviderGetForsInfo1600
         * @tc.desc      : getFormsInfo(filter) where moduleName = "module1" which does exist.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1600', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_1600");
            const filter : formInfo.FormInfoFilter = {
                moduleName: "module1"
            };
            await formProvider.getFormsInfo(filter).then((value) => {
                expect(value.length).assertEqual(1);
                checkResult(module1FormInfo, value[0])
            }).catch((err) => {
                console.info('formProvider::GetFormsInfoTest failed' + JSON.stringify(err));
                expect().assertFail();
            })
            done();
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1700
         * @tc.name      : testProviderGetForsInfo1700
         * @tc.desc      : getFormsInfo(filter) where moduleName = "entry" which exists but has no forms.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1700', 0, async function (done) {
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_1700");
            const filter : formInfo.FormInfoFilter = {
                moduleName: "entry"
            };
            formProvider.getFormsInfo(filter).then((value) => {
                expect(value.length).assertEqual(0);
            }).catch((err) => {
                console.info('formProvider::GetFormsInfoTest failed' + JSON.stringify(err));
                expect().assertFail();
            })
            done();
        });
    })

    function checkResultArray(expectInfos: Array<formInfo.FormInfo>, result:Array<formInfo.FormInfo>) {
        console.info("formProvider::GetForsInfoTest checkResultArray");
        for (var index = 0; index < expectInfos.length; index++) {
            console.info("formProvider::GetForsInfoTest checkResul index is " + index);
            checkResult(expectInfos[index], result[index])
        }
    }

    function checkResult(expectInfo: formInfo.FormInfo, result: formInfo.FormInfo) {
        console.info("formProvider::GetFormsInfoTest: bundleName expect " + expectInfo.bundleName);
        expect(expectInfo.bundleName).assertEqual(result.bundleName);
        console.info("formProvider::GetFormsInfoTest: abilityName expect " + expectInfo.abilityName);
        expect(expectInfo.abilityName).assertEqual(result.abilityName);
        console.info("formProvider::GetFormsInfoTest: name expect " + expectInfo.name);
        expect(expectInfo.name).assertEqual(result.name);
        console.info("formProvider::GetFormsInfoTest: displayName expect " + expectInfo.displayName);
        expect(expectInfo.displayName).assertEqual(result.displayName);
        console.info("formProvider::GetFormsInfoTest: description expect " + expectInfo.description);
        expect(expectInfo.description).assertEqual(result.description);
        console.info("formProvider::GetFormsInfoTest: type expect " + expectInfo.type);
        expect(expectInfo.type).assertEqual(result.type);
        console.info("formProvider::GetFormsInfoTest: jsComponentName expect " + expectInfo.jsComponentName);
        expect(expectInfo.jsComponentName).assertEqual(result.jsComponentName);
        console.info("formProvider::GetFormsInfoTest: colorMode expect " + expectInfo.colorMode);
        expect(expectInfo.colorMode).assertEqual(result.colorMode);
        console.info("formProvider::GetFormsInfoTest: isDefault expect " + expectInfo.isDefault);
        expect(expectInfo.isDefault).assertEqual(result.isDefault);
        console.info("formProvider::GetFormsInfoTest: formVisibleNotify expect " + expectInfo.formVisibleNotify);
        expect(expectInfo.formVisibleNotify).assertEqual(result.formVisibleNotify);
        console.info("formProvider::GetFormsInfoTest: scheduledUpdateTime expect " + expectInfo.scheduledUpdateTime);
        expect(expectInfo.scheduledUpdateTime).assertEqual(result.scheduledUpdateTime);
        console.info("formProvider::GetFormsInfoTest: formConfigAbility expect " + expectInfo.formConfigAbility);
        expect(expectInfo.formConfigAbility).assertEqual(result.formConfigAbility);
        console.info("formProvider::GetFormsInfoTest: updateDuration expect " + expectInfo.updateDuration);
        expect(expectInfo.updateDuration).assertEqual(result.updateDuration);
        console.info("formProvider::GetFormsInfoTest: defaultDimension expect " + expectInfo.defaultDimension);
        expect(expectInfo.defaultDimension).assertEqual(result.defaultDimension);
        console.info("formProvider::GetFormsInfoTest: supportDimensions expect " + JSON.stringify(expectInfo.supportDimensions));
        expect(JSON.stringify(expectInfo.supportDimensions)).assertEqual(JSON.stringify(result.supportDimensions));
        console.info("formProvider::GetFormsInfoTest: customizeData expect " + JSON.stringify(expectInfo.customizeData));
        expect(JSON.stringify(expectInfo.customizeData)).assertEqual(JSON.stringify(result.customizeData));
        console.info("formProvider::GetFormsInfoTest: supportedShapes expect " + JSON.stringify(expectInfo.supportedShapes));
        expect(JSON.stringify(expectInfo.supportedShapes)).assertEqual(JSON.stringify(result.supportedShapes));
    }
}
