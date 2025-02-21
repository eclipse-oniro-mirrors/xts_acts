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
import bundle from '@ohos.bundle'
import account from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'

const BUNDLE_NAME1 = 'com.example.third1';
const BUNDLE_NAME2 = 'com.example.third7';
const SYSTEM_NAME = 'com.example.system2';
const ABILITIY_NAME8 = 'com.example.system2.MainAbility';
let userId: number = 0;
const INVALID_CODE: number = 1;

export default function ActsBmsQueryAbilityByWant() {
    describe('ActsBmsQueryAbilityByWant', function () {

        beforeAll(async function (done) {
            await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
                console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
                userId = account;
                done();
            }).catch(err => {
                console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
                done();
            })
        });
    
        /*
        * @tc.number: bms_queryAbilityByWant_0100
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_0100', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": ""
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res).assertFail()
                    done()
                }).catch(err => {
                    expect(err).assertEqual(INVALID_CODE)
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_0200
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_0200', 0, async function (done) {
            bundle.queryAbilityByWant(
                {}, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res).assertFail()
                    done()
                }).catch(err => {
                    expect(err).assertEqual(INVALID_CODE)
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_0300
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_0300', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    action: "action_a"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_0300'+ JSON.stringify(res))
                    expect(res[0].name).assertEqual('com.example.third7.actionSingleString')
                    expect(res[0].description).assertEqual('actionSingleString')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_0300' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })

        });

        /*
        * @tc.number: bms_queryAbilityByWant_0400
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_0400', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "action_b2"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_0400'+ JSON.stringify(res))
                    expect(res[0].name).assertEqual('com.example.third7.actionDoubleString')
                    expect(res[0].description).assertEqual('actionDoubleString')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_0400' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_0500
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_0500', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "action_c1"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_0500'+ JSON.stringify(res))
                    expect(res[0].name).assertEqual('com.example.third7.actionDoubleSkill')
                    expect(res[0].description).assertEqual('actionDoubleSkill')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_0500' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_0600
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third appl
        */
        it('bms_queryAbilityByWant_0600', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "action_d2"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_0600'+ JSON.stringify(res))
                    expect(res[0].name).assertEqual('com.example.third7.actionDoubleSkill')
                    expect(res[0].description).assertEqual('actionDoubleSkill')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_0600' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });


        /*
        * @tc.number: bms_queryAbilityByWant_0700
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_0700', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "action_not_exist"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res).assertFail()
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_0700' + JSON.stringify(err))
                    expect(err).assertEqual(INVALID_CODE)
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_0800
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_0800', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": []
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_0800 '+ JSON.stringify(res))
                    const list = ['entityDoubleSkill','entityDoubleString','entitySingleString','entityEmpty']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_0800 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_0900
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_0900', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": [""]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res).assertFail()
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_0900' + JSON.stringify(err))
                    expect(err).assertEqual(INVALID_CODE)
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1000
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1000', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": ["entity_a"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_1000'+ JSON.stringify(res))
                    expect(res[0].name).assertEqual('com.example.third7.entitySingleString')
                    expect(res[0].description).assertEqual('entitySingleString')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1000' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1100
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1100', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": ["entity_b2"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_1100'+ JSON.stringify(res))
                    expect(res[0].name).assertEqual('com.example.third7.entityDoubleString')
                    expect(res[0].description).assertEqual('entityDoubleString')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1100' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1200
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1200', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": ["entity_d1"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_1200'+ JSON.stringify(res))
                    expect(res[0].name).assertEqual('com.example.third7.entityDoubleSkill')
                    expect(res[0].description).assertEqual('entityDoubleSkill')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1200' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1300
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1300', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": ["entity_c1", "entity_c2"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_1300'+ JSON.stringify(res))
                    expect(res[0].name).assertEqual('com.example.third7.entityDoubleSkill')
                    expect(res[0].description).assertEqual('entityDoubleSkill')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1300' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1400
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1400', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": ["entity_b1", "entity_not_exist"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res).assertFail()
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1400' + JSON.stringify(err))
                    expect(err).assertEqual(INVALID_CODE)
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1500
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1500', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": ["entity_b1", "entity_b2", "entity_not_exist"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res).assertFail()
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1500' + JSON.stringify(err))
                    expect(err).assertEqual(INVALID_CODE)
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1600
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1600', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                    "entities": ["entity_not_exist"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res).assertFail()
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1600' + JSON.stringify(err))
                    expect(err).assertEqual(INVALID_CODE)
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1700
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1700', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "entity_reserved",
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_1700 '+ JSON.stringify(res))
                    const list = ['entityDoubleSkill','entityDoubleString','entitySingleString','entityEmpty']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1700 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1800
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1800', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": ""
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_1800 '+ JSON.stringify(res))
                    const list = ['uriEmpty','uriSchemeEmpty']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1800 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_1900
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_1900', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "content"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_1900 '+ JSON.stringify(res))
                    const list = ['uriHostEmpty','uriScheme']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_1900 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2000
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2000', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "content://www.test.com"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res.length).assertEqual(3);
                    for (let count = 0; count < 3; count++) {
                        if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
                            expect(res[count].description).assertEqual('uriHostEmpty');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
                            expect(res[count].description).assertEqual('uriScheme');
                        } else {
                            expect(res[count].description).assertEqual('uriSchemeHost');
                        }
                    }
                    done();
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2000 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2100
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2100', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "content://www.test.com:8080"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_2100 '+ JSON.stringify(res))
                    expect(res.length).assertEqual(4);
                    for (let count = 0; count < 4; count++) {
                        if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
                            expect(res[count].description).assertEqual('uriHostEmpty');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
                            expect(res[count].description).assertEqual('uriScheme');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPort') {
                            expect(res[count].description).assertEqual('uriSchemeHostPort');
                        } else {
                            expect(res[count].description).assertEqual('uriSchemeHost');
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2100 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2200
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2200', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "content://www.test.com:8080/query/student/name"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_2200 '+ JSON.stringify(res))
                    const list = ['uriSchemeHostPortPath', 'uriSchemeHostPortPathStartWith', 'uriSchemeHostPortPathRegx']
                    expect(res.length).assertEqual(7);
                    for (let count = 0; count < 7; count++) {
                        if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
                            expect(res[count].description).assertEqual('uriHostEmpty');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
                            expect(res[count].description).assertEqual('uriScheme');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPort') {
                            expect(res[count].description).assertEqual('uriSchemeHostPort');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPathStartWith') {
                            expect(res[count].description).assertEqual('uriSchemeHostPortPathStartWith');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPathRegx') {
                            expect(res[count].description).assertEqual('uriSchemeHostPortPathRegx');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPath') {
                            expect(res[count].description).assertEqual('uriSchemeHostPortPath');
                        } else {
                            expect(res[count].description).assertEqual('uriSchemeHost');
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2200 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2300
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2300', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "content://www.test.com/query/student/name"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_2300 '+ JSON.stringify(res))
                    const list = ['uriPortEmptyWithPath', 'uriPortEmptyWithPathStartWith', 'uriPortEmptyWithPathRegx']
                    expect(res.length).assertEqual(6);
                    for (let count = 0; count < 6; count++) {
                        if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
                            expect(res[count].description).assertEqual('uriHostEmpty');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
                            expect(res[count].description).assertEqual('uriScheme');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriPortEmptyWithPath') {
                            expect(res[count].description).assertEqual('uriPortEmptyWithPath');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriPortEmptyWithPathStartWith') {
                            expect(res[count].description).assertEqual('uriPortEmptyWithPathStartWith');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriPortEmptyWithPathRegx') {
                            expect(res[count].description).assertEqual('uriPortEmptyWithPathRegx');
                        } else {
                            expect(res[count].description).assertEqual('uriSchemeHost');
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2300 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2400
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2400', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "content://www.test.com:8080/query/teacher/name"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_2400 '+ JSON.stringify(res))
                    expect(res.length).assertEqual(5);
                    for (let count = 0; count < 5; count++) {
                        if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
                            expect(res[count].description).assertEqual('uriHostEmpty');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
                            expect(res[count].description).assertEqual('uriScheme');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPort') {
                            expect(res[count].description).assertEqual('uriSchemeHostPort');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPathRegx') {
                            expect(res[count].description).assertEqual('uriSchemeHostPortPathRegx');
                        } else {
                            expect(res[count].description).assertEqual('uriSchemeHost');
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2400 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2500
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2500', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "content://www.test.com:8080/query/student/jack"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_2500 '+ JSON.stringify(res))
                    expect(res.length).assertEqual(5);
                    for (let count = 0; count < 5; count++) {
                        if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
                            expect(res[count].description).assertEqual('uriHostEmpty');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
                            expect(res[count].description).assertEqual('uriScheme');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPort') {
                            expect(res[count].description).assertEqual('uriSchemeHostPort');
                        } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPathStartWith') {
                            expect(res[count].description).assertEqual('uriSchemeHostPortPathStartWith');
                        } else {
                            expect(res[count].description).assertEqual('uriSchemeHost');
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2500 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2600
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2600', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "file://www.test.com:8080/query/student/name"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_2600 '+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('uriMultiPath')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2600 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2700
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2700', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "file://www.test.com:8080/query/teacher/hello"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_2700 '+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('uriMultiPath')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2700 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2800
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2800', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "uri_reserved",
                    "uri": "content://abc"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    expect(res.length).assertEqual(2);
                    for (let count = 0; count < 2; count++) {
                        if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
                            expect(res[count].description).assertEqual('uriHostEmpty');
                        } else {
                            expect(res[count].description).assertEqual('uriScheme');
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2800' + JSON.stringify(err))
                    expect(err).assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_2900
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_2900', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "type": "*/*"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_2900 '+ JSON.stringify(res))
                    const list = ['TypeDoubleWildCard','TypeSingleWildCard','TypeString', 'TypeStringExt']
                    let cnt = 0;
                    if (res && res.length) {
                        for (let i = 0; i < res.length; i++) {
                            if (list.includes(res[i].description)) {
                                cnt++;
                            }
                        }
                    }
                    expect(cnt).assertEqual(list.length)
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_2900' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3000
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3000', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "type": "prefixType/*"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3000 '+ JSON.stringify(res))
                    const list = ['TypeDoubleWildCard','TypeSingleWildCard','TypeString']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3000 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3100
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3100', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "type": "prefixType/suffixType"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3100 '+ JSON.stringify(res))
                    const list = ['TypeDoubleWildCard','TypeSingleWildCard','TypeString']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3100' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3200
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3200', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "type": "prefixTypeExt/suffixTypeExt"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3200 '+ JSON.stringify(res))
                    const list = ['TypeStringExt','TypeDoubleWildCard']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3200' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3300
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3300', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "type_reserved"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3300 '+ JSON.stringify(res))
                    const list = ['TypeEmpty','TypeEmptyExt']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3300 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3400
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3400', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "type_reserved",
                    "type": ""
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3400 '+ JSON.stringify(res))
                    const list = ['TypeEmpty','TypeEmptyExt']
                    if(res && res.length) {
                        for(let i = 0; i < res.length; i++) {
                            expect(list.includes(res[i].description)).assertEqual(true)
                        }
                    }
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3400 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3500
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3500', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "type": "none/none"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3500'+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('TypeDoubleWildCard')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3500' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3600
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3600', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "all_action_a",
                    "entities":["all_entity_a"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3600'+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allAE')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3600' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3700
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3700', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action": "all_action_b",
                    "entities":["all_entity_b1", "all_entity_b2"]
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3700'+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allAEs')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3700' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3800
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3800', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "uri" :"http://www.test.com:8080/query/student/name",
                    "type":"text/plain"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3800'+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allUT')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3800' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_3900
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_3900', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "uri" :"http://www.test.com:8080/query/student/name",
                    "type":"text/*"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_3900'+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allUT')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_3900' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_4000
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_4000', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "uri" :"http://www.test.com:8080/query/teacher",
                    "type":"text/plain"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_4000'+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allUT')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_4000' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_4100
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_4100', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "uri" :"http://www.test.com:8080/query/teacher/hello",
                    "type":"text/plain"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_4100'+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allUT')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_4100' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_4200
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_4200', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "uri" :"http://www.test.com:8080/update/hello/world/name",
                    "type":"text/plain"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_4200 '+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allUT')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_4200 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_4300
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_4300', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action":"all_action_c",
                    "entities":["all_entity_c1"],
                    "uri" :"https://www.test.com:8080/query/student/name",
                    "type":"text/plain"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_4300 '+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allAEUT')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_4300 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });

        /*
        * @tc.number: bms_queryAbilityByWant_4400
        * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
        * @tc.desc: queryAbilityByWant for third app
        */
        it('bms_queryAbilityByWant_4400', 0, async function (done) {
            bundle.queryAbilityByWant(
                {
                    "action":"all_action_c",
                    "entities":["all_entity_c1", "all_entity_c2"],
                    "uri" :"https://www.test.com:8080/query/student/name",
                    "type":"text/*"
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
                    console.info(' success bms_queryAbilityByWant_4400 '+ JSON.stringify(res))
                    expect(res[0].description).assertEqual('allAEUT')
                    done()
                }).catch(err => {
                    console.error(' fail bms_queryAbilityByWant_4400 ' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                })
        });
    })
}
