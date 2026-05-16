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
    /**
     * @tc.name   getProfileByAbilityInvalidModulePro
     * @tc.number Sub_Bms_Framework_Query_Profile_0900
     * @tc.desc   Check the invalid moduleName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   getProfileByAbilityEmptyModulePro
     * @tc.number Sub_Bms_Framework_Query_Profile_1300
     * @tc.desc   Check the empty moduleName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   getProfileByAbilityInvalidModuleCall
     * @tc.number Sub_Bms_Framework_Query_Profile_1500
     * @tc.desc   Check the invalid moduleName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidModuleCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByAbilityInvalidModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityEmptyModuleCall
     * @tc.number Sub_Bms_Framework_Query_Profile_3200
     * @tc.desc   Check the empty moduleName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityEmptyModuleCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility('', ABILITY_NAME, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        console.error('[getProfileByAbilityEmptyModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityInvalidAbilityPro
     * @tc.number Sub_Bms_Framework_Query_Profile_1000
     * @tc.desc   Check the invalid abilityName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   getProfileByAbilityEmptyAbilityPro
     * @tc.number Sub_Bms_Framework_Query_Profile_2700
     * @tc.desc   Check the empty abilityName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   getProfileByAbilityInvalidAbilityCall
     * @tc.number Sub_Bms_Framework_Query_Profile_2000
     * @tc.desc   Check the invalid abilityName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidAbilityCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByAbilityInvalidAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityEmptyAbilityCall
     * @tc.number Sub_Bms_Framework_Query_Profile_2700
     * @tc.desc   Check the empty abilityName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityEmptyAbilityCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, '', METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByAbilityEmptyAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityCallback
     * @tc.number Sub_Bms_Framework_Query_Profile_2200
     * @tc.desc   Check the valid metadataName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   getProfileByAbilityInvalidMetaDataCall
     * @tc.number Sub_Bms_Framework_Query_Profile_2400
     * @tc.desc   Check the invalid metadataName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidMetaDataCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err, data) => {
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        console.error('[getProfileByAbilityInvalidMetaDataCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityEmptyMetaDataCall
     * @tc.number Sub_Bms_Framework_Query_Profile_3400
     * @tc.desc   Check the empty metadataName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   getProfileByAbilityPromise
     * @tc.number Sub_Bms_Framework_Query_Profile_0100
     * @tc.desc   Check the valid metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   getProfileByAbilityInvalidMetaDataPro
     * @tc.number Sub_Bms_Framework_Query_Profile_0300
     * @tc.desc   Check the invalid metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   getProfileByAbilityEmptyMetaDataPro
     * @tc.number Sub_Bms_Framework_Query_Profile_2800
     * @tc.desc   Check the empty metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   getProfileByAbilityNoMetaDataPro
     * @tc.number Sub_Bms_Framework_Query_Profile_0700
     * @tc.desc   without metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   getProfileByAbilityNoProfilePro
     * @tc.number Sub_Bms_Framework_Query_Profile_4600
     * @tc.desc   no profile configured under the ability (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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


    /**
     * @tc.name   getProfileByAbilityNoJsonPro
     * @tc.number Sub_Bms_Framework_Query_Profile_0600
     * @tc.desc   profile is invalid json format (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   getProfileByAbilityNoJsonCall
     * @tc.number Sub_Bms_Framework_Query_Profile_4400
     * @tc.desc   profile is invalid json format (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityNoJsonCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err, data) => {
        console.info('[getProfileByAbilityNoJsonCall] err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      });
    })

    /**
     * @tc.name   testGetProfileByAbilitySyncSuccess
     * @tc.number Sub_Bms_Framework_Query_Profile_6200
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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

    /**
     * @tc.name   testGetProfileByAbilitySyncWithoutMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_6300
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

    /**
     * @tc.name   testGetProfileByAbilitySyncByInvalidModuleName
     * @tc.number Sub_Bms_Framework_Query_Profile_6400
     * @tc.desc   Check the invalid moduleName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncByInvalidAbilityName
     * @tc.number Sub_Bms_Framework_Query_Profile_6500
     * @tc.desc   Check the invalid abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncInvalidMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_6600
     * @tc.desc   Check resource has no prefix (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncByEmptyModuleName
     * @tc.number Sub_Bms_Framework_Query_Profile_6800
     * @tc.desc   Check the empty moduleName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncByEmptyAbilityName
     * @tc.number Sub_Bms_Framework_Query_Profile_6900
     * @tc.desc   Check the empty abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncSuccessEmptyMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_7000
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

    /**
     * @tc.name   testGetProfileByAbilitySyncNullModule
     * @tc.number Sub_Bms_Framework_Query_Profile_7100
     * @tc.desc   Check param number is failed (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncNullAbility
     * @tc.number Sub_Bms_Framework_Query_Profile_7200
     * @tc.desc   Check param number is failed (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncSuccessNullMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_7300
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

    /**
     * @tc.name   testGetProfileByAbilitySyncUndefinedModule
     * @tc.number Sub_Bms_Framework_Query_Profile_7400
     * @tc.desc   Check param number is failed (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncUndefinedAbility
     * @tc.number Sub_Bms_Framework_Query_Profile_7500
     * @tc.desc   Check param number is failed (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testGetProfileByAbilitySyncUndefinedMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_7600
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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