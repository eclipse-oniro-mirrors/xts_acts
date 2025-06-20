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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';
import formError from '@ohos.application.formError';
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

export default function abilityTest() {
    describe('ProviderGetFormsInfoTest', () => {
        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0100
         * @tc.name      : testProviderGetForsInfo0100
         * @tc.desc      : getFormsInfo(callback).
         * @tc.level     : Level 1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_0100';
            console.info(`${name} start`);
            formProvider.getFormsInfo(async (err, value) => {
                console.info(`${name}` + "formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
                console.info(`${name}` + "formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
                expect(err).assertEqual(null);
                expect(value.length).assertEqual(2);
                checkResultArray(name, expectResult, value)
                await sleep(2000);
                done();
            });
            console.info("SUB_AA_OpenHarmony_ProviderGetForsInfo_0100 end");
        });

        /**
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0200
         * @tc.name      : testProviderGetForsInfo0200
         * @tc.desc      : getFormsInfo(filter, undefined) # Have no idea how to test it.
         * @tc.level     : Level 1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_0200';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0300
         * @tc.name      : testProviderGetForsInfo0300
         * @tc.desc      : getFormsInfo().
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_0300';
            console.info(`${name} start`);
            formProvider.getFormsInfo().then( async (value) => {
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0500
         * @tc.name      : testProviderGetForsInfo0500
         * @tc.desc      : getFormsInfo(filter, callback) where filter = {}.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_0500';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0600
         * @tc.name      : testProviderGetForsInfo0600
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = "".
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_0600';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0700
         * @tc.name      : testProviderGetForsInfo0700
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = undefined.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_0700';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0800
         * @tc.name      : testProviderGetForsInfo0800
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = "HelloWorld" which doesn't exist.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_0800';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_0900
         * @tc.name      : testProviderGetForsInfo0900
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = "module1" which does exist.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_0900';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1000
         * @tc.name      : testProviderGetForsInfo1000
         * @tc.desc      : getFormsInfo(filter, callback) where moduleName = "entry" exists but has no forms.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_1000';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1200
         * @tc.name      : testProviderGetForsInfo1200
         * @tc.desc      : getFormsInfo(filter) where filter = {}.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_1200';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1300
         * @tc.name      : testProviderGetForsInfo1300
         * @tc.desc      : getFormsInfo(filter) where moduleName = "".
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_1300';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1400
         * @tc.name      : testProviderGetForsInfo1400
         * @tc.desc      : getFormsInfo(filter) where moduleName = undefined.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_1400';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1500
         * @tc.name      : testProviderGetForsInfo1500
         * @tc.desc      : getFormsInfo(filter) where moduleName = "HelloWorld" which doesn't exist.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_1500';
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

        /**checkResult 
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1600
         * @tc.name      : testProviderGetForsInfo1600
         * @tc.desc      : getFormsInfo(filter) where moduleName = "module1" which does exist.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_1600';
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
         * @tc.number    : SUB_AA_OpenHarmony_ProviderGetForsInfo_1700
         * @tc.name      : testProviderGetForsInfo1700
         * @tc.desc      : getFormsInfo(filter) where moduleName = "entry" which exists but has no forms.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_ProviderGetForsInfo_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_ProviderGetForsInfo_1700';
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
         * @tc.number    : SUB_AA_OpenHarmony_FormStateInfo_0100
         * @tc.name      : SUB_AA_OpenHarmony_FormStateInfo_0100
         * @tc.desc      : formInfo.FormStateInfo covered test.
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
        it('SUB_AA_OpenHarmony_FormStateInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let name: string = 'SUB_AA_OpenHarmony_FormStateInfo_0100';
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
