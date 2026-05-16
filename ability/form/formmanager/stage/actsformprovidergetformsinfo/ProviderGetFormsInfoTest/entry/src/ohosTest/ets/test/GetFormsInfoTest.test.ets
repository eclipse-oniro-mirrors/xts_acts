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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';

let module1Want: Want = {
    deviceId: "",
    bundleName: "com.ohos.st.formsystemhost",
    abilityName: "com.ohos.st.formsystemhost.MainAbility",
    parameters: {
        "formId": "0",
        "name": "Form_Js001",
        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
        "ability": "",
        "moduleName": "entry",
        "temporary": false,
        "isCreate": true
    }
  }

  let module1FormStateInfo: formInfo.FormStateInfo = {
  formState: formInfo.FormState.DEFAULT,
  want: module1Want
}

let module1FormInfo: formInfo.FormInfo = {
    bundleName: "com.example.getformsinfotest",
    moduleName: "entry",
    abilityName: "EntryFormAbility",
    name: "widget",
    displayName: "",
    displayNameId: 0,
    descriptionId: 0,
    description: "This is a service widget.",
    type:2,
    jsComponentName: "",
    colorMode: -1,
    isDefault: true,
    updateEnabled: true,
    formVisibleNotify: false,
    scheduledUpdateTime: "10:30",
    formConfigAbility: "",
    updateDuration: 1,
    defaultDimension:2,
    supportDimensions:[1,2,3,4],
    supportedShapes:[1],
    customizeData: {},
    isDynamic: true,
    transparencyEnabled: false
}

let module2FormInfo: formInfo.FormInfo = {
    bundleName: "com.example.getformsinfotest",
    moduleName: "entry",
    abilityName: "EntryFormAbility",
    name: "widget1",
    displayName: "",
    displayNameId: 0,
    descriptionId: 0,
    description: "This is a service widget.",
    type:2,
    jsComponentName: "",
    colorMode: -1,
    isDefault: false,
    updateEnabled: true,
    formVisibleNotify: false,
    scheduledUpdateTime: "10:30",
    formConfigAbility: "",
    updateDuration: 0,
    defaultDimension:2,
    supportDimensions:[1,2,3,4],
    supportedShapes:[1],
    customizeData: {},
    isDynamic: false,
    transparencyEnabled: false
}

let expectResult: formInfo.FormInfo[] = Array();
expectResult.push(module1FormInfo);
expectResult.push(module2FormInfo);

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

const ERROR_CODE1 = 401;
const ERROR_CODE2 = 16500050;
const ERROR_CODE3 = 16500100;
const ERROR_CODE4 = 16501000;

export default function abilityTest() {
    describe('ProviderGetFormsInfoTest', () => {
        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0100
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0100
         * @tc.desc   getFormsInfo(callback).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0100';
            console.info(`${name} start`);
            formProvider.getFormsInfo(async (err, value) => {
                console.info(`${name}` + "formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                if (err === null) {
                    expect(err).assertEqual(null);
                    expect(value.length).assertEqual(2);
                    checkResultArray(name, expectResult, value);
                } else if (err.code === ERROR_CODE1) {
                    expect(err.code).assertEqual(ERROR_CODE1);
                } else if (err.code === ERROR_CODE2) {
                    expect(err.code).assertEqual(ERROR_CODE2);
                } else if (err.code === ERROR_CODE3) {
                    expect(err.code).assertEqual(ERROR_CODE3);
                } else if (err.code === ERROR_CODE4) {
                    expect(err.code).assertEqual(ERROR_CODE4);
                }
                await sleep(2000);
                done();
            });
            console.info("SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0100 end");
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0200
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0200
         * @tc.desc   getFormsInfo(filter, undefined) # Have no idea how to test it.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0200';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName : "module1"
            };
            try {
                formProvider.getFormsInfo(filter, undefined);
                done();
            } catch(err) {
                expect().assertFail();
                done();
            }
            console.info(`${name} end`);
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0300
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0300
         * @tc.desc   getFormsInfo().
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0300';
            console.info(`${name} start`);
            formProvider.getFormsInfo().then( async (value) => {
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(value.length).assertEqual(2);
                checkResultArray(name, expectResult, value);
                await sleep(2000);
                done();
            }).catch((err: BusinessError) => {
                console.error(`${name}  formProvider::GetFormsInfoTest failed err:${JSON.stringify(err)}`);
                if (err.code === ERROR_CODE1) {
                    expect(err.code).assertEqual(ERROR_CODE1);
                } else if (err.code === ERROR_CODE2) {
                    expect(err.code).assertEqual(ERROR_CODE2);
                } else if (err.code === ERROR_CODE3) {
                    expect(err.code).assertEqual(ERROR_CODE3);
                } else if (err.code === ERROR_CODE4) {
                    expect(err.code).assertEqual(ERROR_CODE4);
                }
                expect().assertFail();
                done();
            })
            console.info(`${name} end`);
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0500
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0500
         * @tc.desc   getFormsInfo(filter, callback) where filter = {}.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0500';
            console.info(`${name} start`);;
            const filter : formInfo.FormInfoFilter = {};
            formProvider.getFormsInfo(filter, async (err, value) =>  {
                console.info(`${name}` + "formProvider::GetFormsInfoTest: " + JSON.stringify(err));
                console.info(`${name}` + "formProvider::GetFormsInfoTest: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(name, expectResult, value);
                await sleep(2000);
                done();
            });
            console.info(`${name} end`);
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0600
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0600
         * @tc.desc   getFormsInfo(filter, callback) where moduleName = "".
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0600';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: ""
            };
            formProvider.getFormsInfo(filter, async (err, value) =>  {
                console.info(`${name}` + "formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(name, expectResult, value);
                await sleep(2000);
                console.info(`${name} end`);
                done();
            });
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0700
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0700
         * @tc.desc   getFormsInfo(filter, callback) where moduleName = undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0700';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: undefined
            };
            formProvider.getFormsInfo(filter, async (err, value) =>  {
                console.info(`${name}` + "formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(name, expectResult, value);
                await sleep(2000);
                console.info(`${name} end`);
                done();
            });
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0800
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0800
         * @tc.desc   getFormsInfo(filter, callback) where moduleName = "HelloWorld" which doesn't exist.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0800';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: "HelloWorld"
            };
            formProvider.getFormsInfo(filter, (err, value) =>  {
                console.info(`${name}` + "formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(0);
                console.info(`${name} end`);
                done();
            });
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0900
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0900
         * @tc.desc   getFormsInfo(filter, callback) where moduleName = "module1" which does exist.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_0900';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: "module1"
            };
            formProvider.getFormsInfo(filter, (err, value) => {
                console.info(`${name}` + "formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(0);
                console.info(`${name} end`);
                done();
            });
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1000
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1000
         * @tc.desc   getFormsInfo(filter, callback) where moduleName = "entry" exists but has no forms.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1000';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: "entry"
            };
            formProvider.getFormsInfo(filter, async (err, value) =>  {
                console.info(`${name}` + "formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(name, expectResult, value);
                await sleep(2000);
                done();
                console.info(`${name} end`);
            });
            
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1200
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1200
         * @tc.desc   getFormsInfo(filter) where filter = {}.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1200';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {};
            let formProviderGetFormsInfo = async () => {
                await formProvider.getFormsInfo(filter).then( async (value) => {
                    console.info(`${name} value:${JSON.stringify(value)}`);
                    expect(value.length).assertEqual(2);
                    checkResultArray(name, expectResult, value);
                    await sleep(2000);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${name}  formProvider::GetFormsInfoTest failed err:${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                })
                console.info(`${name} end`);
            }
            formProviderGetFormsInfo();
            
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1300
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1300
         * @tc.desc   getFormsInfo(filter) where moduleName = "".
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1300';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: ""
            };
        
            let formProviderGetFormsInfo = async () => {
                try{
                    let value = await formProvider.getFormsInfo(filter);
                    console.info(`${name} value:${JSON.stringify(value)}`);
                    expect(value.length).assertEqual(2);
                    checkResultArray(name, expectResult, value);
                    await sleep(2000);
                    done()
                } catch(err) {
                    console.error(`${name}  formProvider::GetFormsInfoTest failed err:${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                }
                console.info(`${name} end`);
            }

            formProviderGetFormsInfo();
            
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1400
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1400
         * @tc.desc   getFormsInfo(filter) where moduleName = undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1400';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: undefined
            };
            formProvider.getFormsInfo(filter).then( async (value) => {
                console.info(`${name} value:${JSON.stringify(value)}`);
                    expect(value.length).assertEqual(2);
                    checkResultArray(name, expectResult, value);
                    await sleep(2000);
                    console.info(`${name} end`);
                    done()
            }).catch((err: BusinessError) => {
                console.error(`${name}  formProvider::GetFormsInfoTest failed err:${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            })
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1500
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1500
         * @tc.desc   getFormsInfo(filter) where moduleName = "HelloWorld" which doesn't exist.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1500';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: "HelloWorld"
            };
            let formProviderGetFormsInfo = async () => {
                await formProvider.getFormsInfo(filter).then( async (value) => {
                    console.info(`${name} value:${JSON.stringify(value)}`);
                    expect(value.length).assertEqual(0);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${name}  formProvider::GetFormsInfoTest failed err:${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                })
                console.info(`${name} end`);
            }
            formProviderGetFormsInfo();
            
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1600
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1600
         * @tc.desc   getFormsInfo(filter) where moduleName = "module1" which does exist.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1600';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: "module1"
            };
            let formProviderGetFormsInfo = async () => {
                await formProvider.getFormsInfo(filter).then(async (value) => {
                    expect(value.length).assertEqual(0);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${name}  formProvider::GetFormsInfoTest failed err:${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                })
                console.info(`${name} end`);
            }
            formProviderGetFormsInfo();
            
        });

        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1700
         * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1700
         * @tc.desc   getFormsInfo(filter) where moduleName = "entry" which exists but has no forms.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_PROVIDER_GET_FORMS_INFO_1700';
            console.info(`${name} start`);
            const filter : formInfo.FormInfoFilter = {
                moduleName: "entry"
            };
            formProvider.getFormsInfo(filter).then( async (value) => {
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(value.length).assertEqual(2);
                checkResultArray(name, expectResult, value);
                await sleep(2000);
                done();
            }).catch((err: BusinessError) => {
                console.error(`${name}  formProvider::GetFormsInfoTest failed err:${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            })
            console.info(`${name} end`);
        });
		
        /**
         * @tc.name   SUB_ABILITY_FORM_FWK_FORM_STATE_INFO_0100
         * @tc.number SUB_ABILITY_FORM_FWK_FORM_STATE_INFO_0100
         * @tc.desc   formInfo.FormStateInfo covered test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ABILITY_FORM_FWK_FORM_STATE_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_ABILITY_FORM_FWK_FORM_STATE_INFO_0100';
            console.info(`${name} start`);
            let stateInfo: formInfo.FormStateInfo = module1FormStateInfo;
            expect(0).assertEqual(stateInfo.formState);
            expect("com.ohos.st.formsystemhost").assertEqual(stateInfo.want.bundleName);
            expect().not().assertFail();
            done();
            console.info(`${name} end`);
        });
    })

    let checkResultArray = (name: string, expectInfos: Array<formInfo.FormInfo>, result:Array<formInfo.FormInfo>) => {
        console.info(`${name}` + "formProvider::GetForsInfoTest checkResultArray start");
        for (let index = 0; index < expectInfos.length; index++) {
            checkResult(name, expectInfos[index], result[index])
        }
        console.info(`${name}` + "formProvider::GetForsInfoTest checkResultArray end");
    }

    let checkResult = (name: string, expectInfo: formInfo.FormInfo, result: formInfo.FormInfo) => {
        console.info(`${name}` + "GetFormsInfoTest checkResult start");
        console.info(`${name} expectInfo: ${JSON.stringify(expectInfo)}`);
        console.info(`${name} result: ${JSON.stringify(result)}`);
        expect(expectInfo.bundleName).assertEqual(result.bundleName);
        expect(expectInfo.abilityName).assertEqual(result.abilityName);
        expect(expectInfo.name).assertEqual(result.name);
        expect(expectInfo.displayName).assertEqual(result.displayName);
        expect(expectInfo.description).assertEqual(result.description);
        expect(expectInfo.type).assertEqual(result.type);
        expect(expectInfo.jsComponentName).assertEqual(result.jsComponentName);
        expect(expectInfo.colorMode).assertEqual(result.colorMode);
        expect(expectInfo.isDefault).assertEqual(result.isDefault);
        expect(expectInfo.formVisibleNotify).assertEqual(result.formVisibleNotify);
        expect(expectInfo.scheduledUpdateTime).assertEqual(result.scheduledUpdateTime);
        expect(expectInfo.formConfigAbility).assertEqual(result.formConfigAbility);
        expect(expectInfo.updateDuration).assertEqual(result.updateDuration);
        expect(expectInfo.defaultDimension).assertEqual(result.defaultDimension);
        expect(JSON.stringify(expectInfo.supportDimensions)).assertEqual(JSON.stringify(result.supportDimensions));
        expect(JSON.stringify(expectInfo.customizeData)).assertEqual(JSON.stringify(result.customizeData));
        expect(JSON.stringify(expectInfo.supportedShapes)).assertEqual(JSON.stringify(result.supportedShapes));
        console.info(`${name}` + "formProvider::GetFormsInfoTest end");
    }
}
