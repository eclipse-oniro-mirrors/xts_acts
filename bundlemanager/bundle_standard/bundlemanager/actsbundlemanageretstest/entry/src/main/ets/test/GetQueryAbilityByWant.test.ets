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
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0500
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0500', 0, async function (done) {
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
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0520
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0520', 0, async function (done) {
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
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0540
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0540', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          action: "action_a"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_0540' + JSON.stringify(res))
        expect(res[0].name).assertEqual('com.example.third7.actionSingleString')
        expect(res[0].description).assertEqual('actionSingleString')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0540' + JSON.stringify(err))
        expect().assertFail()
        done()
      })

    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0560
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0560', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "action_b2"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_0560' + JSON.stringify(res))
        expect(res[0].name).assertEqual('com.example.third7.actionDoubleString')
        expect(res[0].description).assertEqual('actionDoubleString')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0560' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0580
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0580', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "action_c1"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_0580' + JSON.stringify(res))
        expect(res[0].name).assertEqual('com.example.third7.actionDoubleSkill')
        expect(res[0].description).assertEqual('actionDoubleSkill')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0580' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0600
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third appl
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0600', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "action_d2"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_0600' + JSON.stringify(res))
        expect(res[0].name).assertEqual('com.example.third7.actionDoubleSkill')
        expect(res[0].description).assertEqual('actionDoubleSkill')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0600' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });


    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0620
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0620', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "action_not_exist"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        expect(res).assertFail()
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0620' + JSON.stringify(err))
        expect(err).assertEqual(INVALID_CODE)
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0640
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0640', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": []
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_0640 ' + JSON.stringify(res))
        const list = ['entityDoubleSkill', 'entityDoubleString', 'entitySingleString', 'entityEmpty']
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            expect(list.includes(res[i].description)).assertEqual(true)
          }
        }
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0640 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0660
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0660', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": [""]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        expect(res).assertFail()
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0660' + JSON.stringify(err))
        expect(err).assertEqual(INVALID_CODE)
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0680
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0680', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": ["entity_a"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_0680' + JSON.stringify(res))
        expect(res[0].name).assertEqual('com.example.third7.entitySingleString')
        expect(res[0].description).assertEqual('entitySingleString')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0680' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0700
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0700', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": ["entity_b2"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_0700' + JSON.stringify(res))
        expect(res[0].name).assertEqual('com.example.third7.entityDoubleString')
        expect(res[0].description).assertEqual('entityDoubleString')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_0700' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5020
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5020', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": ["entity_d1"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5020' + JSON.stringify(res))
        expect(res[0].name).assertEqual('com.example.third7.entityDoubleSkill')
        expect(res[0].description).assertEqual('entityDoubleSkill')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5020' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5520
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5520', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": ["entity_c1", "entity_c2"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5520' + JSON.stringify(res))
        expect(res[0].name).assertEqual('com.example.third7.entityDoubleSkill')
        expect(res[0].description).assertEqual('entityDoubleSkill')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5520' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5540
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5540', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": ["entity_b1", "entity_not_exist"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        expect(res).assertFail()
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5540' + JSON.stringify(err))
        expect(err).assertEqual(INVALID_CODE)
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5080
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5080', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": ["entity_b1", "entity_b2", "entity_not_exist"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        expect(res).assertFail()
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5080' + JSON.stringify(err))
        expect(err).assertEqual(INVALID_CODE)
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5040
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5040', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
          "entities": ["entity_not_exist"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        expect(res).assertFail()
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5040' + JSON.stringify(err))
        expect(err).assertEqual(INVALID_CODE)
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_4940
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_4940', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "entity_reserved",
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_4940 ' + JSON.stringify(res))
        const list = ['entityDoubleSkill', 'entityDoubleString', 'entitySingleString', 'entityEmpty']
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            expect(list.includes(res[i].description)).assertEqual(true)
          }
        }
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_4940 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5660
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5660', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": ""
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        expect(res.length).assertEqual(2);
        for (let count = 0; count < 2; count++) {
          console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5660 ' + JSON.stringify(res[count]));
          if (res[count].name == BUNDLE_NAME2 + '.uriEmpty') {
            expect(res[count].description).assertEqual('uriEmpty');
          } else {
            expect(res[count].name).assertEqual(BUNDLE_NAME2 + '.uriSchemeEmpty');
            expect(res[count].description).assertEqual('uriSchemeEmpty');
          }
        }
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5660 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5560
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5560', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": "content"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5560 ' + JSON.stringify(res))
        const list = ['uriHostEmpty', 'uriScheme']
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            expect(list.includes(res[i].description)).assertEqual(true)
          }
        }
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5560 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5100
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5100', 0, async function (done) {
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
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5100 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5120
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5120', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": "content://www.test.com:8080"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5120 ' + JSON.stringify(res))
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
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5120 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5580
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5580', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": "content://www.test.com:8080/query/student/name"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5580 ' + JSON.stringify(res))
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
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5580 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5140
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5140', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": "content://www.test.com/query/student/name"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5140 ' + JSON.stringify(res))
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
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5140 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5180
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5180', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": "content://www.test.com:8080/query/teacher/name"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5180 ' + JSON.stringify(res))
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
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5180 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5160
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5160', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": "content://www.test.com:8080/query/student/jack"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5160 ' + JSON.stringify(res))
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
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5160 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5680
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5680', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": "file://www.test.com:8080/query/student/name"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5680 ' + JSON.stringify(res))
        expect(res[0].description).assertEqual('uriMultiPath')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5680 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5700
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5700', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "uri_reserved",
          "uri": "file://www.test.com:8080/query/teacher/hello"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5700 ' + JSON.stringify(res))
        expect(res[0].description).assertEqual('uriMultiPath')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5700 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5720
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5720', 0, async function (done) {
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
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5720' + JSON.stringify(err))
        expect(err).assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5200
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5200', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "type": "*/*"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5200 ' + JSON.stringify(res))
        const list = ['TypeDoubleWildCard', 'TypeSingleWildCard', 'TypeString', 'TypeStringExt']
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
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5200' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5220
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5220', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "type": "prefixType/*"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5220 ' + JSON.stringify(res))
        const list = ['TypeDoubleWildCard', 'TypeSingleWildCard', 'TypeString']
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            expect(list.includes(res[i].description)).assertEqual(true)
          }
        }
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5220 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: sub_Bms_Framework_Query_AbilityInfo_5240
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('sub_Bms_Framework_Query_AbilityInfo_5240', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "type": "prefixType/suffixType"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success sub_Bms_Framework_Query_AbilityInfo_5240 ' + JSON.stringify(res))
        const list = ['TypeDoubleWildCard', 'TypeSingleWildCard', 'TypeString']
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            expect(list.includes(res[i].description)).assertEqual(true)
          }
        }
        done()
      }).catch(err => {
        console.error(' fail sub_Bms_Framework_Query_AbilityInfo_5240' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5740
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5740', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "type": "prefixTypeExt/suffixTypeExt"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5740 ' + JSON.stringify(res))
        const list = ['TypeStringExt', 'TypeDoubleWildCard']
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            expect(list.includes(res[i].description)).assertEqual(true)
          }
        }
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5740' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5760
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5760', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "type_reserved"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5760 ' + JSON.stringify(res))
        const list = ['TypeEmpty', 'TypeEmptyExt']
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            expect(list.includes(res[i].description)).assertEqual(true)
          }
        }
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5760 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5600
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5600', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "type_reserved",
          "type": ""
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5600 ' + JSON.stringify(res))
        const list = ['TypeEmpty', 'TypeEmptyExt']
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            expect(list.includes(res[i].description)).assertEqual(true)
          }
        }
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5600 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5780
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5780', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "type": "none/none"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5780' + JSON.stringify(res))
        expect(res[0].description).assertEqual('TypeDoubleWildCard')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5780' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5900
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5900', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "all_action_a",
          "entities": ["all_entity_a"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5900' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allAE')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5900' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5920
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5920', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "all_action_b",
          "entities": ["all_entity_b1", "all_entity_b2"]
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5920' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allAEs')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5920' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5800
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5800', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "uri": "http://www.test.com:8080/query/student/name",
          "type": "text/plain"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5800' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allUT')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5800' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5820
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5820', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "uri": "http://www.test.com:8080/query/student/name",
          "type": "text/*"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5820' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allUT')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5820' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5840
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5840', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "uri": "http://www.test.com:8080/query/teacher",
          "type": "text/plain"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5840' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allUT')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5840' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5860
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5860', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "uri": "http://www.test.com:8080/query/teacher/hello",
          "type": "text/plain"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5860' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allUT')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5860' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5880
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5880', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "uri": "http://www.test.com:8080/update/hello/world/name",
          "type": "text/plain"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5880 ' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allUT')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5880 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5620
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5620', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "all_action_c",
          "entities": ["all_entity_c1"],
          "uri": "https://www.test.com:8080/query/student/name",
          "type": "text/plain"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5620 ' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allAEUT')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5620 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_5640
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos
    * @tc.desc: queryAbilityByWant for third app
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_5640', 0, async function (done) {
      bundle.queryAbilityByWant(
        {
          "action": "all_action_c",
          "entities": ["all_entity_c1", "all_entity_c2"],
          "uri": "https://www.test.com:8080/query/student/name",
          "type": "text/*"
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(res => {
        console.info(' success Sub_Bms_Framework_Query_AbilityInfo_5640 ' + JSON.stringify(res))
        expect(res[0].description).assertEqual('allAEUT')
        done()
      }).catch(err => {
        console.error(' fail Sub_Bms_Framework_Query_AbilityInfo_5640 ' + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    });
  })
}
