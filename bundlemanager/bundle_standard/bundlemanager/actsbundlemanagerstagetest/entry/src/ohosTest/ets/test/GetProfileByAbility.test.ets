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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@kit.BasicServicesKit';
import manager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

const MODULE_NAME = "testModule"
const MODULE_NAME_TEST = "testModule1"
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility"
const ABILITY_NAME1 = "ohos.acts.bundle.stage.test.MainAbility1"
const ABILITY_NAME_TEST = "ohos.acts.bundle.stage.test.MainAbilityTest"
const METADATA_NAME = "metadata.ability.test"
const METADATA_NAME1 = "metadata.ability.config"
const METADATA_NAME2 = "ohos.ability.form2"
const METADATA_NAME3 = "ohos.ability.form3"
const METADATA_NAME4 = "ohos.ability.form4"
const METADATA_NAME_TEST = "ohos.test.form"
const PROFILE_JSON_STRING = "{\"src\":[\"MainAbility/pages/index/index\",\"MainAbility/pages/second/second\"]}"
const ERROR_ABILITY_NOT_EXIST = 17700003
const ERROR_PROFILE_NOT_EXIST = 17700024
const ERROR_MODULE_NOT_EXIST = 17700002
const PARAM_ERROR_CODE = 401;

export default function getProfileByAbility() {
  describe('getProfileByAbility', () => {
    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0900
     * @tc.name: getProfileByAbilityInvalidModulePro
     * @tc.desc: Check the invalid moduleName (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityInvalidModulePro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByAbilityInvalidModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getProfileByAbilityInvalidModulePro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_1300
     * @tc.name: getProfileByAbilityEmptyModulePro
     * @tc.desc: Check the empty moduleName (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityEmptyModulePro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      await manager.getProfileByAbility('', ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByAbilityEmptyModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getProfileByAbilityEmptyModulePro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST)
        done()
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_1500
     * @tc.name: getProfileByAbilityInvalidModuleCall
     * @tc.desc: Check the invalid moduleName (by callback)
     * @tc.level   0
     */
    it('getProfileByAbilityInvalidModuleCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByAbilityInvalidModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_3200
     * @tc.name: getProfileByAbilityEmptyModuleCall
     * @tc.desc: Check the empty moduleName (by callback)
     * @tc.level   0
     */
    it('getProfileByAbilityEmptyModuleCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility('', ABILITY_NAME, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        console.error('[getProfileByAbilityEmptyModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_1000
     * @tc.name: getProfileByAbilityInvalidAbilityPro
     * @tc.desc: Check the invalid abilityName (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityInvalidAbilityPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME).then(data => {
        console.info("getProfileByAbilityInvalidAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getProfileByAbilityInvalidAbilityPro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2700
     * @tc.name: getProfileByAbilityEmptyAbilityPro
     * @tc.desc: Check the empty abilityName (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityEmptyAbilityPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME, '', METADATA_NAME).then(data => {
        console.info("getProfileByAbilityEmptyAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getProfileByAbilityEmptyAbilityPro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2000
     * @tc.name: getProfileByAbilityInvalidAbilityCall
     * @tc.desc: Check the invalid abilityName (by callback)
     * @tc.level   0
     */
    it('getProfileByAbilityInvalidAbilityCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByAbilityInvalidAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2700
     * @tc.name: getProfileByAbilityEmptyAbilityCall
     * @tc.desc: Check the empty abilityName (by callback)
     * @tc.level   0
     */
    it('getProfileByAbilityEmptyAbilityCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, '', METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByAbilityEmptyAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2200
     * @tc.name: getProfileByAbilityCallback
     * @tc.desc: Check the valid metadataName (by callback)
     * @tc.level   0
     */
    it('getProfileByAbilityCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME, (err, data) => {
        console.info('[getProfileByAbilityCallback] getProfileByAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2400
     * @tc.name: getProfileByAbilityInvalidMetaDataCall
     * @tc.desc: Check the invalid metadataName (by callback)
     * @tc.level   0
     */
    it('getProfileByAbilityInvalidMetaDataCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err, data) => {
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        console.error('[getProfileByAbilityInvalidMetaDataCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_3400
     * @tc.name: getProfileByAbilityEmptyMetaDataCall
     * @tc.desc: Check the empty metadataName (by callback)
     * @tc.level   0
     */
    it('getProfileByAbilityEmptyMetaDataCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, '', (err, data) => {
        console.info('[getProfileByAbilityEmptyMetaDataCall] getProfileByAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0100
     * @tc.name: getProfileByAbilityPromise
     * @tc.desc: Check the valid metadataName (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info('[getProfileByAbilityPromise] getProfileByAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByAbilityPromise]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0300
     * @tc.name: getProfileByAbilityInvalidMetaDataPro
     * @tc.desc: Check the invalid metadataName (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityInvalidMetaDataPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST).then(data => {
        console.info('[getProfileByAbilityInvalidMetaDataPro] getProfileByAbility callback data is: ' + JSON.stringify(data));
        done()
      }).catch((err: BusinessError) => {
        console.error('[getProfileByAbilityInvalidMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_2800
     * @tc.name: getProfileByAbilityEmptyMetaDataPro
     * @tc.desc: Check the empty metadataName (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityEmptyMetaDataPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, '').then(data => {
        console.info('[getProfileByAbilityEmptyMetaDataPro] getProfileByAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByAbilityEmptyMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0700
     * @tc.name: getProfileByAbilityNoMetaDataPro
     * @tc.desc: without metadataName (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityNoMetaDataPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME).then(data => {
        console.info('[getProfileByAbilityNoMetaDataPro] getProfileByAbility callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByAbilityNoMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_4600
     * @tc.name: getProfileByAbilityNoProfilePro
     * @tc.desc: no profile configured under the ability (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityNoProfilePro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME1).then(data => {
        console.info('[getProfileByAbilityNoProfilePro] getProfileByAbility callback data is: ' + JSON.stringify(data));
        expect(data).assertFail()
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByAbilityNoProfilePro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })


    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_0600
     * @tc.name: getProfileByAbilityNoJsonPro
     * @tc.desc: profile is invalid json format (by promise)
     * @tc.level   0
     */
    it('getProfileByAbilityNoJsonPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4).then(data => {
        console.info('[getProfileByAbilityNoJsonPro] data is: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByAbilityNoJsonPro] Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_4400
     * @tc.name: getProfileByAbilityNoJsonCall
     * @tc.desc: profile is invalid json format (by callback)
     * @tc.level   0
     */
    it('getProfileByAbilityNoJsonCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err, data) => {
        console.info('[getProfileByAbilityNoJsonCall] err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      });
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6200
     * @tc.name: testGetProfileByAbilitySyncSuccess
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncSuccess', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      try {
        let data = manager.getProfileByAbilitySync(MODULE_NAME, ABILITY_NAME, METADATA_NAME);
        console.info("testGetProfileByAbilitySyncSuccess success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncSuccess failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6300
     * @tc.name: testGetProfileByAbilitySyncWithoutMetaData
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncWithoutMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      try {
        let data = manager.getProfileByAbilitySync(MODULE_NAME, ABILITY_NAME);
        console.info("testGetProfileByAbilitySyncWithoutMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncWithoutMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6400
     * @tc.name: testGetProfileByAbilitySyncByInvalidModuleName
     * @tc.desc: Check the invalid moduleName (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncByInvalidModuleName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync('INVALID_NAME', ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncByInvalidModuleName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6500
     * @tc.name: testGetProfileByAbilitySyncByInvalidAbilityName
     * @tc.desc: Check the invalid abilityName (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncByInvalidAbilityName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync(MODULE_NAME_TEST, 'INVALID_NAME', METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncByInvalidAbilityName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6600
     * @tc.name: testGetProfileByAbilitySyncInvalidMetaData
     * @tc.desc: Check resource has no prefix (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncInvalidMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getProfileByAbilitySyncNoProfile failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6800
     * @tc.name: testGetProfileByAbilitySyncByEmptyModuleName
     * @tc.desc: Check the empty moduleName (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncByEmptyModuleName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync('', ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getProfileByAbilitySyncByEmptyModuleName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_6900
     * @tc.name: testGetProfileByAbilitySyncByEmptyAbilityName
     * @tc.desc: Check the empty abilityName (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncByEmptyAbilityName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync(MODULE_NAME_TEST, '', METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getProfileByAbilitySyncByEmptyAbilityName failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_7000
     * @tc.name: testGetProfileByAbilitySyncSuccessEmptyMetaData
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncSuccessEmptyMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      try {
        let data = manager.getProfileByAbilitySync(MODULE_NAME, ABILITY_NAME, '');
        console.info("testGetProfileByAbilitySyncSuccessEmptyMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncSuccessEmptyMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_7100
     * @tc.name: testGetProfileByAbilitySyncNullModule
     * @tc.desc: Check param number is failed (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncNullModule', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync(null, ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getProfileByAbilitySyncParamError failed" + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_7200
     * @tc.name: testGetProfileByAbilitySyncNullAbility
     * @tc.desc: Check param number is failed (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncNullAbility', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync(MODULE_NAME, null, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncNullAbility failed" + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_7300
     * @tc.name: testGetProfileByAbilitySyncSuccessNullMetaData
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncSuccessNullMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      try {
        let data = manager.getProfileByAbilitySync(MODULE_NAME, ABILITY_NAME, null);
        console.info("testGetProfileByAbilitySyncSuccessEmptyMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncSuccessNullMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_7400
     * @tc.name: testGetProfileByAbilitySyncUndefinedModule
     * @tc.desc: Check param number is failed (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncUndefinedModule', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync(undefined, ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncUndefinedModule failed" + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_7500
     * @tc.name: testGetProfileByAbilitySyncUndefinedAbility
     * @tc.desc: Check param number is failed (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncUndefinedAbility', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        manager.getProfileByAbilitySync(MODULE_NAME, undefined, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncUndefinedAbility failed" + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_7600
     * @tc.name: testGetProfileByAbilitySyncUndefinedMetaData
     * @tc.desc: profile is json (by sync)
     * @tc.level   0
     */
    it('testGetProfileByAbilitySyncUndefinedMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      try {
        let data = manager.getProfileByAbilitySync(MODULE_NAME, ABILITY_NAME, undefined);
        console.info("testGetProfileByAbilitySyncUndefinedMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByAbilitySyncUndefinedMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })



  })
}