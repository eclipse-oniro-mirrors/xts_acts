/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import manager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";

const MODULE_NAME: string = "entry";
const MODULE_NAME_TEST: string = "entry1";
const ABILITY_NAME: string = "EntryFormAbility";
const ABILITY_NAME1: string = "EntryFormAbility1";
const ABILITY_NAME_TEST: string = "EntryFormAbilityTest";
const METADATA_NAME: string = "ohos.extension.form";
const METADATA_NAME1: string = "ohos.extension.form1";
const METADATA_NAME2: string = "ohos.extension.form2";
const METADATA_NAME3: string = "ohos.extension.form3";
const METADATA_NAME4: string = "ohos.extension.form4";
const METADATA_NAME_TEST: string = "ohos.test.form";
const PROFILE_JSON_STRING: string = "{\"forms\":[{\"colorMode\":\"auto\",\"defaultDimension\":\"2*2\",\"description\":" +
  "\"This is a service widget.\",\"isDefault\":true,\"isDynamic\":true,\"name\":\"widget\",\"scheduledUpdateTime\":" +
  "\"10:30\",\"src\":\"./ets/pages/Index.ets\",\"supportDimensions\":[\"1*2\",\"2*2\",\"2*4\",\"4*4\"]," +
  "\"uiSyntax\":\"arkts\",\"updateDuration\":1,\"updateEnabled\":true,\"window\":{\"autoDesignWidth\":true,\"designWidth\":720}}]}";
const ERROR_ABILITY_NOT_EXIST: int = 17700003;
const ERROR_PROFILE_NOT_EXIST: int= 17700024;
const ERROR_MODULE_NOT_EXIST: int = 17700002;
let bundleName: string = 'ohos.acts.bundle.stage.test';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function getProfileByExtensionAbility() {
  describe('getProfileByExtensionAbility', () => {

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidModulePro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_0900
     * @tc.desc   Check the invalid moduleName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidModulePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME).then((data: Array<string>): void =>  {
        hilog.info(domain, tag, "getProfileByExtensionAbilityInvalidModulePro_static success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: Error): void  => {
        hilog.error(domain, tag, "getProfileByExtensionAbilityInvalidModulePro_static failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyModulePro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_1300
     * @tc.desc   Check the empty moduleName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityEmptyModulePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME).then((data: Array<string>): void =>  {
        hilog.info(domain, tag, "getProfileByExtensionAbilityEmptyModulePro_static success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: Error): void  => {
        hilog.error(domain, tag, "getProfileByExtensionAbilityEmptyModulePro_static failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST)
        done()
        done()
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidModuleCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_1500
     * @tc.desc   Check the invalid moduleName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidModuleCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByExtensionAbilityInvalidModuleCall_static]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyModuleCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_3200
     * @tc.desc   Check the empty moduleName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityEmptyModuleCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByExtensionAbilityEmptyModuleCall_static]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidAbilityPro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_1000
     * @tc.desc   Check the invalid abilityName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidAbilityPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME).then((data: Array<string>): void =>  {
        hilog.info(domain, tag, "getProfileByExtensionAbilityInvalidAbilityPro_static success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: Error): void  => {
        hilog.error(domain, tag, "getProfileByExtensionAbilityInvalidAbilityPro_static failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyAbilityPro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_2700
     * @tc.desc   Check the empty abilityName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityEmptyAbilityPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME).then((data: Array<string>): void =>  {
        hilog.info(domain, tag, "getProfileByExtensionAbilityEmptyAbilityPro_static success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: Error): void  => {
        hilog.error(domain, tag, "getProfileByExtensionAbilityEmptyAbilityPro_static failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidAbilityCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_2000
     * @tc.desc   Check the invalid abilityName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidAbilityCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByExtensionAbilityInvalidAbilityCall_static]Operation failed. Cause: ' +
        JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityEmptyAbilityCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_02700
     * @tc.desc   Check the empty abilityName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityEmptyAbilityCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByExtensionAbilityEmptyAbilityCall_static]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidMetaDataCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_2400
     * @tc.desc   Check the invalid metadataName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidMetaDataCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByExtensionAbilityInvalidMetaDataCall_static]Operation failed. Cause: ' +
        JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByExtensionAbilityInvalidMetaDataPro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_0300
     * @tc.desc   Check the invalid metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityInvalidMetaDataPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST).then((data: Array<string>): void =>  {
        hilog.info(domain, tag, '[getProfileByExtensionAbilityInvalidMetaDataPro_static] getProfileByExtensionAbility callback data is: ' +
        JSON.stringify(data));
        expect().assertFail();
        done()
      }).catch((err: Error): void  => {
        hilog.error(domain, tag, '[getProfileByExtensionAbilityInvalidMetaDataPro_static]Operation failed. Cause: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityNoProfilePro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_4600
     * @tc.desc   no profile configured under the ability (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityNoProfilePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3).then((data: Array<string>): void =>  {
        hilog.info(domain, tag, '[getProfileByExtensionAbilityNoProfilePro_static] getProfileByExtensionAbility callback data is: ' +
        JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((err: Error): void  => {
        hilog.error(domain, tag, '[getProfileByExtensionAbilityNoProfilePro_static]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })



    /**
     * @tc.name   getProfileByExtensionAbilityNoJsonPro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_0600
     * @tc.desc   profile is invalid json format (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityNoJsonPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4).then((data: Array<string>): void =>  {
        hilog.info(domain, tag, '[getProfileByExtensionAbilityNoJsonPro_static] data is: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((err: Error): void  => {
        hilog.error(domain, tag, '[getProfileByExtensionAbilityNoJsonPro_static] Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /**
     * @tc.name   getProfileByExtensionAbilityNoJsonCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_4400
     * @tc.desc   profile is invalid json format (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityNoJsonCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err: BusinessError<void> | null, data) => {
        hilog.error(domain, tag, '[getProfileByExtensionAbilityNoJsonCall_static] err: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      });
    })

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncByInvalidModuleName_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5000
     * @tc.desc   Check the invalid moduleName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidModuleName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByExtensionAbilitySync('INVALID_NAME', ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "testGetProfileByExtensionAbilitySyncByInvalidModuleName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncByInvalidAbilityName_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5100
     * @tc.desc   Check the invalid abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidAbilityName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByExtensionAbilitySync(MODULE_NAME, 'INVALID_NAME', METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "testGetProfileByExtensionAbilitySyncByInvalidAbilityName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncByInvalidMetaData_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5200
     * @tc.desc   Check the invalid abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncByInvalidMetaData_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, "METADATA_NAME");
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "getProfileByExtensionAbilitySyncByInvalidAbilityName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.name   getProfileByExtensionAbilitySyncByEmptyModuleName_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5300
     * @tc.desc   Check the empty moduleName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilitySyncByEmptyModuleName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByExtensionAbilitySync('', ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "getProfileByExtensionAbilitySyncByEmptyModuleName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByExtensionAbilitySyncByEmptyAbilityName_static
     * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5400
     * @tc.desc   Check the empty abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByExtensionAbilitySyncByEmptyAbilityName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByExtensionAbilitySync(MODULE_NAME, '', METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "getProfileByExtensionAbilitySyncByEmptyAbilityName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

  })
}