/**
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

import manager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

const MODULE_NAME = "testModule"
const MODULE_NAME_TEST = "testModule1"
const ABILITY_NAME = "Form"
const ABILITY_NAME1 = "Form1"
const ABILITY_NAME_TEST = "FromTest"
const METADATA_NAME = "ohos.extension.form"
const METADATA_NAME1 = "ohos.extension.form1"
const METADATA_NAME2 = "ohos.extension.form2"
const METADATA_NAME3 = "ohos.extension.form3"
const METADATA_NAME4 = "ohos.extension.form4"
const METADATA_NAME_TEST = "ohos.test.form"
const PROFILE_JSON_STRING = "{\"src\":[\"MainAbility/pages/index/index\",\"MainAbility/pages/second/second\"]}"
const ERROR_ABILITY_NOT_EXIST = 17700003
const ERROR_PROFILE_NOT_EXIST = 17700024
const ERROR_MODULE_NOT_EXIST = 17700002
const PARAM_ERROR_CODE = 401;

export default function getProfileByExtensionAbility() {
  describe('getProfileByExtensionAbility', function () {
    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0900
     * @tc.name: getProfileByExtensionAbilityInvalidModulePro
     * @tc.desc: Check the invalid moduleName (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityInvalidModulePro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionAbilityInvalidModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByExtensionAbilityInvalidModulePro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_1300
     * @tc.name: getProfileByExtensionAbilityEmptyModulePro
     * @tc.desc: Check the empty moduleName (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityEmptyModulePro', 0, async function (done) {
      await manager.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionAbilityEmptyModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByExtensionAbilityEmptyModulePro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST)
        done()
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_1500
     * @tc.name: getProfileByExtensionAbilityInvalidModuleCall
     * @tc.desc: Check the invalid moduleName (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityInvalidModuleCall', 0, async function (done) {
      manager.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityInvalidModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_3200
     * @tc.name: getProfileByExtensionAbilityEmptyModuleCall
     * @tc.desc: Check the empty moduleName (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityEmptyModuleCall', 0, async function (done) {
      manager.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityEmptyModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_1000
     * @tc.name: getProfileByExtensionAbilityInvalidAbilityPro
     * @tc.desc: Check the invalid abilityName (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityInvalidAbilityPro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionAbilityInvalidAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByExtensionAbilityInvalidAbilityPro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2700
     * @tc.name: getProfileByExtensionAbilityEmptyAbilityPro
     * @tc.desc: Check the empty abilityName (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityEmptyAbilityPro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME).then(data => {
        console.info("getProfileByExtensionAbilityEmptyAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByExtensionAbilityEmptyAbilityPro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2000
     * @tc.name: getProfileByExtensionAbilityInvalidAbilityCall
     * @tc.desc: Check the invalid abilityName (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityInvalidAbilityCall', 0, async function (done) {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityInvalidAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2700
     * @tc.name: getProfileByExtensionAbilityEmptyAbilityCall
     * @tc.desc: Check the empty abilityName (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityEmptyAbilityCall', 0, async function (done) {
      manager.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityEmptyAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2200
     * @tc.name: getProfileByExtensionAbilityCallback
     * @tc.desc: Check the valid metadataName (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityCallback', 0, async function (done) {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME, (err, data) => {
        console.info('[getProfileByExtensionAbilityCallback] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2400
     * @tc.name: getProfileByExtensionAbilityInvalidMetaDataCall
     * @tc.desc: Check the invalid metadataName (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityInvalidMetaDataCall', 0, async function (done) {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err, data) => {
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityInvalidMetaDataCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_3400
     * @tc.name: getProfileByExtensionAbilityEmptyMetaDataCall
     * @tc.desc: Check the empty metadataName (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityEmptyMetaDataCall', 0, async function (done) {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, '', (err, data) => {
        console.info('[getProfileByExtensionAbilityEmptyMetaDataCall] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(3);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[2]).assertEqual("string");
        expect(data[2]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0100
     * @tc.name: getProfileByExtensionAbilityPromise
     * @tc.desc: Check the valid metadataName (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityPromise', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info('[getProfileByExtensionAbilityPromise] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityPromise]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0300
     * @tc.name: getProfileByExtensionAbilityInvalidMetaDataPro
     * @tc.desc: Check the invalid metadataName (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityInvalidMetaDataPro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST).then(data => {
        console.info('[getProfileByExtensionAbilityInvalidMetaDataPro] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect().assertFail();
        done()
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityInvalidMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2800
     * @tc.name: getProfileByExtensionAbilityEmptyMetaDataPro
     * @tc.desc: Check the empty metadataName (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityEmptyMetaDataPro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, '').then(data => {
        console.info('[getProfileByExtensionAbilityEmptyMetaDataPro] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(3);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[2]).assertEqual("string");
        expect(data[2]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityEmptyMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0700
     * @tc.name: getProfileByExtensionAbilityNoMetaDataPro
     * @tc.desc: without metadataName (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityNoMetaDataPro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME).then(data => {
        console.info('[getProfileByExtensionAbilityNoMetaDataPro] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(3);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[2]).assertEqual("string");
        expect(data[2]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityNoMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_4600
     * @tc.name: getProfileByExtensionAbilityNoProfilePro
     * @tc.desc: no profile configured under the ability (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityNoProfilePro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME1).then(data => {
        console.info('[getProfileByExtensionAbilityNoProfilePro] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityNoProfilePro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0500
     * @tc.name: getProfileByExtensionAbilityNotSuffixPro
     * @tc.desc: profile is .txt suffix (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityNotSuffixPro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3).then(data => {
        console.info('[getProfileByExtensionAbilityNotSuffixPro] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityNotSuffixPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_3800
     * @tc.name: getProfileByExtensionAbilityNotSuffixCall
     * @tc.desc: profile is .txt suffix (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityNotSuffixCall', 0, async function (done) {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3, (err, data) => {
        console.info('[getProfileByExtensionAbilityNotSuffixCall] getProfileByExtensionAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0600
     * @tc.name: getProfileByExtensionAbilityNoJsonPro
     * @tc.desc: profile is invalid json format (by promise)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityNoJsonPro', 0, async function (done) {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4).then(data => {
        console.info('[getProfileByExtensionAbilityNoJsonPro] data is: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityNoJsonPro] Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_4400
     * @tc.name: getProfileByExtensionAbilityNoJsonCall
     * @tc.desc: profile is invalid json format (by callback)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilityNoJsonCall', 0, async function (done) {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err, data) => {
        console.info('[getProfileByExtensionAbilityNoJsonCall] err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_4800
     * @tc.name: testGetProfileByExtensionAbilitySync
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySync', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, METADATA_NAME3);
        console.info("getProfileByExtensionAbilitySync success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        done();
      } catch (err) {
        console.info("getProfileByExtensionAbilitySyncSuccessTest failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_4900
     * @tc.name: testGetProfileByExtensionAbilitySyncWithoutMetaData
     * @tc.desc: Check the empty metadataName
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncWithoutMetaData', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME);
        console.info("testGetProfileByExtensionAbilitySyncWithoutMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(3);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[2]).assertEqual("string");
        expect(data[2]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncWithoutMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5000
     * @tc.name: testGetProfileByExtensionAbilitySyncByInvalidModuleName
     * @tc.desc: Check the invalid moduleName (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidModuleName', 0, async function (done) {
      try {
        manager.getProfileByExtensionAbilitySync('INVALID_NAME', ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncByInvalidModuleName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5100
     * @tc.name: testGetProfileByExtensionAbilitySyncByInvalidAbilityName
     * @tc.desc: Check the invalid abilityName (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidAbilityName', 0, async function (done) {
      try {
        manager.getProfileByExtensionAbilitySync(MODULE_NAME, 'INVALID_NAME', METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncByInvalidAbilityName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5200
     * @tc.name: testGetProfileByExtensionAbilitySyncByInvalidMetaData
     * @tc.desc: Check the invalid abilityName (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidMetaData', 0, async function (done) {
      try {
        manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, "METADATA_NAME");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getProfileByExtensionAbilitySyncByInvalidAbilityName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5300
     * @tc.name: getProfileByExtensionAbilitySyncByEmptyModuleName
     * @tc.desc: Check the empty moduleName (by sync)
     * @tc.level   0
     */
    it('getProfileByExtensionAbilitySyncByEmptyModuleName', 0, async function (done) {
      try {
        manager.getProfileByExtensionAbilitySync('', ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getProfileByExtensionAbilitySyncByEmptyModuleName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5400
     * @tc.name: testGetProfileByExtensionAbilitySyncByEmptyAbilityName
     * @tc.desc: Check the empty abilityName (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncByEmptyAbilityName', 0, async function (done) {
      try {
        manager.getProfileByExtensionAbilitySync(MODULE_NAME, '', METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getProfileByExtensionAbilitySyncByEmptyAbilityName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5500
     * @tc.name: testGetProfileByExtensionAbilitySyncEmptyMetaData
     * @tc.desc: Check the empty metadataName
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncEmptyMetaData', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, '');
        console.info("testGetProfileByExtensionAbilitySyncEmptyMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(3);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[2]).assertEqual("string");
        expect(data[2]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncEmptyMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_4800
     * @tc.name: testGetProfileByExtensionAbilitySyncNullModule
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncNullModule', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(null, ABILITY_NAME, METADATA_NAME3);
        console.info("testGetProfileByExtensionAbilitySyncNullModule success" + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncNullModule failed" + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5700
     * @tc.name: testGetProfileByExtensionAbilitySyncNullAbility
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncNullAbility', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, null, METADATA_NAME3);
        console.info("testGetProfileByExtensionAbilitySyncNullAbility success" + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncNullAbility failed" + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5800
     * @tc.name: testGetProfileByExtensionAbilitySyncNullMetaData
     * @tc.desc: Check the empty metadataName
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncNullMetaData', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, null);
        console.info("testGetProfileByExtensionAbilitySyncNullMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(3);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[2]).assertEqual("string");
        expect(data[2]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncNullMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_5900
     * @tc.name: testGetProfileByExtensionAbilitySyncUndefinedModule
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncUndefinedModule', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(undefined, ABILITY_NAME, METADATA_NAME3);
        console.info("testGetProfileByExtensionAbilitySyncUndefinedModule success" + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncUndefinedModule failed" + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6000
     * @tc.name: testGetProfileByExtensionAbilitySyncUndefinedAbility
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncUndefinedAbility', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, undefined, METADATA_NAME3);
        console.info("testGetProfileByExtensionAbilitySyncUndefinedAbility success" + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncUndefinedAbility failed" + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6100
     * @tc.name: testGetProfileByExtensionAbilitySyncUndefinedMetaData
     * @tc.desc: Check the empty metadataName
     * @tc.level   0
     */
    it('testGetProfileByExtensionAbilitySyncUndefinedMetaData', 0, async function (done) {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, undefined);
        console.info("testGetProfileByExtensionAbilitySyncUndefinedMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(3);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[2]).assertEqual("string");
        expect(data[2]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncUndefinedMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })



  })
}