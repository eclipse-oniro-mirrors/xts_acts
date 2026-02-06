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
import { BusinessError } from '@kit.BasicServicesKit';
import manager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

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
const PROFILE_JSON_STRING = "{\"forms\":[{\"colorMode\":\"auto\",\"defaultDimension\":\"2*2\",\"description\":" +
  "\"This is a service widget.\",\"isDefault\":true,\"isDynamic\":true,\"name\":\"widget\",\"scheduledUpdateTime\":" +
  "\"10:30\",\"src\":\"./ets/widget/pages/WidgetCard.ets\",\"supportDimensions\":[\"1*2\",\"2*2\",\"2*4\",\"4*4\"]," +
  "\"uiSyntax\":\"arkts\",\"updateDuration\":1,\"updateEnabled\":true,\"window\":{\"autoDesignWidth\":true,\"designWidth\":720}}]}"
const ERROR_ABILITY_NOT_EXIST = 17700003
const ERROR_PROFILE_NOT_EXIST = 17700024
const ERROR_MODULE_NOT_EXIST = 17700002
const PARAM_ERROR_CODE = 401;

export default function getProfileByExtensionAbility() {
  describe('getProfileByExtensionAbility', () => {
    /**
     * @tc.name   getProfileByExtensionAbilityInvalidModulePro
     * @tc.number Sub_Bms_Framework_Query_Profile_0900
     * @tc.desc   Check the invalid moduleName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidModulePro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      await manager.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionAbilityInvalidModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getProfileByExtensionAbilityInvalidModulePro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyModulePro
     * @tc.number Sub_Bms_Framework_Query_Profile_1300
     * @tc.desc   Check the empty moduleName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityEmptyModulePro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      await manager.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionAbilityEmptyModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getProfileByExtensionAbilityEmptyModulePro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidModuleCall
     * @tc.number Sub_Bms_Framework_Query_Profile_1500
     * @tc.desc   Check the invalid moduleName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidModuleCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      manager.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityInvalidModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyModuleCall
     * @tc.number Sub_Bms_Framework_Query_Profile_3200
     * @tc.desc   Check the empty moduleName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityEmptyModuleCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      manager.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityEmptyModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidAbilityPro
     * @tc.number Sub_Bms_Framework_Query_Profile_1000
     * @tc.desc   Check the invalid abilityName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidAbilityPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionAbilityInvalidAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getProfileByExtensionAbilityInvalidAbilityPro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyAbilityPro
     * @tc.number Sub_Bms_Framework_Query_Profile_2700
     * @tc.desc   Check the empty abilityName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityEmptyAbilityPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME).then(data => {
        console.info("getProfileByExtensionAbilityEmptyAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getProfileByExtensionAbilityEmptyAbilityPro failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidAbilityCall
     * @tc.number Sub_Bms_Framework_Query_Profile_2000
     * @tc.desc   Check the invalid abilityName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidAbilityCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityInvalidAbilityCall]Operation failed. Cause: ' +
        JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyAbilityCall
     * @tc.number Sub_Bms_Framework_Query_Profile_2700
     * @tc.desc   Check the empty abilityName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityEmptyAbilityCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      manager.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME, (err, data) => {
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityEmptyAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityCallback
     * @tc.number Sub_Bms_Framework_Query_Profile_2200
     * @tc.desc   Check the valid metadataName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getProfileByExtensionAbilityCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME, (err, data) => {
        console.info('[getProfileByExtensionAbilityCallback] getProfileByExtensionAbility callback data is: ' +
        JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidMetaDataCall
     * @tc.number Sub_Bms_Framework_Query_Profile_2400
     * @tc.desc   Check the invalid metadataName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidMetaDataCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err, data) => {
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        console.error('[getProfileByExtensionAbilityInvalidMetaDataCall]Operation failed. Cause: ' +
        JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyMetaDataCall
     * @tc.number Sub_Bms_Framework_Query_Profile_3400
     * @tc.desc   Check the empty metadataName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getProfileByExtensionAbilityEmptyMetaDataCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, '', (err, data) => {
        console.info('[getProfileByExtensionAbilityEmptyMetaDataCall] getProfileByExtensionAbility callback data is: ' +
        JSON.stringify(data));
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
     * @tc.name   getProfileByExtensionAbilityPromise
     * @tc.number Sub_Bms_Framework_Query_Profile_0100
     * @tc.desc   Check the valid metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getProfileByExtensionAbilityPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info('[getProfileByExtensionAbilityPromise] getProfileByExtensionAbility callback data is: ' +
        JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByExtensionAbilityPromise]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidMetaDataPro
     * @tc.number Sub_Bms_Framework_Query_Profile_0300
     * @tc.desc   Check the invalid metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidMetaDataPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST).then(data => {
        console.info('[getProfileByExtensionAbilityInvalidMetaDataPro] getProfileByExtensionAbility callback data is: ' +
        JSON.stringify(data));
        expect().assertFail();
        done()
      }).catch((err: BusinessError) => {
        console.error('[getProfileByExtensionAbilityInvalidMetaDataPro]Operation failed. Cause: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyMetaDataPro
     * @tc.number Sub_Bms_Framework_Query_Profile_2800
     * @tc.desc   Check the empty metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getProfileByExtensionAbilityEmptyMetaDataPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, '').then(data => {
        console.info('[getProfileByExtensionAbilityEmptyMetaDataPro] getProfileByExtensionAbility callback data is: ' +
        JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByExtensionAbilityEmptyMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityNoMetaDataPro
     * @tc.number Sub_Bms_Framework_Query_Profile_0700
     * @tc.desc   without metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getProfileByExtensionAbilityNoMetaDataPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME).then(data => {
        console.info('[getProfileByExtensionAbilityNoMetaDataPro] getProfileByExtensionAbility callback data is: ' +
        JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByExtensionAbilityNoMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityNoJsonPro
     * @tc.number Sub_Bms_Framework_Query_Profile_0600
     * @tc.desc   profile is invalid json format (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityNoJsonPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4).then(data => {
        console.info('[getProfileByExtensionAbilityNoJsonPro] data is: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        console.error('[getProfileByExtensionAbilityNoJsonPro] Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityNoJsonCall
     * @tc.number Sub_Bms_Framework_Query_Profile_4400
     * @tc.desc   profile is invalid json format (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityNoJsonCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err, data) => {
        console.info('[getProfileByExtensionAbilityNoJsonCall] err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      });
    })

    /**
     * @tc.name   testGetProfileByExtensionAbilitySync
     * @tc.number Sub_Bms_Framework_Query_Profile_4800
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProfileByExtensionAbilitySync', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, METADATA_NAME);
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncWithoutMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_4900
     * @tc.desc   Check the empty metadataName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetProfileByExtensionAbilitySyncWithoutMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME);
        console.info("testGetProfileByExtensionAbilitySyncWithoutMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncWithoutMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncByInvalidModuleName
     * @tc.number Sub_Bms_Framework_Query_Profile_5000
     * @tc.desc   Check the invalid moduleName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidModuleName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncByInvalidAbilityName
     * @tc.number Sub_Bms_Framework_Query_Profile_5100
     * @tc.desc   Check the invalid abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidAbilityName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncByInvalidMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_5200
     * @tc.desc   Check the invalid abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   getProfileByExtensionAbilitySyncByEmptyModuleName
     * @tc.number Sub_Bms_Framework_Query_Profile_5300
     * @tc.desc   Check the empty moduleName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilitySyncByEmptyModuleName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncByEmptyAbilityName
     * @tc.number Sub_Bms_Framework_Query_Profile_5400
     * @tc.desc   Check the empty abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncByEmptyAbilityName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncEmptyMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_5500
     * @tc.desc   Check the empty metadataName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProfileByExtensionAbilitySyncEmptyMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, '');
        console.info("testGetProfileByExtensionAbilitySyncEmptyMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncEmptyMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncNullModule
     * @tc.number Sub_Bms_Framework_Query_Profile_4800
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncNullModule', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncNullAbility
     * @tc.number Sub_Bms_Framework_Query_Profile_5700
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncNullAbility', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncNullMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_5800
     * @tc.desc   Check the empty metadataName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetProfileByExtensionAbilitySyncNullMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, null);
        console.info("testGetProfileByExtensionAbilitySyncNullMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncNullMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncUndefinedModule
     * @tc.number Sub_Bms_Framework_Query_Profile_5900
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncUndefinedModule', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncUndefinedAbility
     * @tc.number Sub_Bms_Framework_Query_Profile_6000
     * @tc.desc   profile is json (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncUndefinedAbility', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
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

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncUndefinedMetaData
     * @tc.number Sub_Bms_Framework_Query_Profile_6100
     * @tc.desc   Check the empty metadataName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetProfileByExtensionAbilitySyncUndefinedMetaData', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      try {
        let data = manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, undefined);
        console.info("testGetProfileByExtensionAbilitySyncUndefinedMetaData success" + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(2);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      } catch (err) {
        console.info("testGetProfileByExtensionAbilitySyncUndefinedMetaData failed" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })


  })
}