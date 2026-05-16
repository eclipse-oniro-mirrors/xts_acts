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
const MODULE_NAME_TEST: string= "entry1";
const ABILITY_NAME: string = "EntryAbility";
const ABILITY_NAME1: string = "EntryAbility1";
const ABILITY_NAME_TEST: string = "EntryAbilityTest";
const METADATA_NAME: string = "metadata.ability.test";
const METADATA_NAME1: string = "metadata.ability.config";
const METADATA_NAME2: string = "ohos.ability.form2";
const METADATA_NAME3: string = "ohos.ability.form3";
const METADATA_NAME4: string = "ohos.ability.form4";
const METADATA_NAME_TEST: string = "ohos.test.form";
const PROFILE_JSON_STRING: string = "{\"src\":[\"pages/index\"]}";
const ERROR_ABILITY_NOT_EXIST: int = 17700003;
const ERROR_PROFILE_NOT_EXIST: int = 17700024;
const ERROR_MODULE_NOT_EXIST: int = 17700002;
let bundleName: string = 'ohos.acts.bundle.stage.test';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function getProfileByAbility() {
  describe('getProfileByAbility', () => {

    /**
     * @tc.name   getProfileByAbilityInvalidModulePro_static
     * @tc.number Sub_Bms_Framework_Query_Profile__static_0900
     * @tc.desc   Check the invalid moduleName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidModulePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME).then((data: Array<string>): void => {
        hilog.info(domain, tag, "getProfileByAbilityInvalidModulePro_static success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: Error): void => {
        hilog.error(domain, tag, "getProfileByAbilityInvalidModulePro_static failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByAbilityEmptyModulePro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_1300
     * @tc.desc   Check the empty moduleName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityEmptyModulePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByAbility('', ABILITY_NAME, METADATA_NAME).then((data: Array<string>): void => {
        hilog.info(domain, tag, "getProfileByAbilityEmptyModulePro_static success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: Error): void => {
        hilog.error(domain, tag, "getProfileByAbilityEmptyModulePro_static failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByAbilityInvalidModuleCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_1500
     * @tc.desc   Check the invalid moduleName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidModuleCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByAbilityInvalidModuleCall_static]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityEmptyModuleCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_3200
     * @tc.desc   Check the empty moduleName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityEmptyModuleCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByAbility('', ABILITY_NAME, METADATA_NAME, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByAbilityEmptyModuleCall_static]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityInvalidAbilityPro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_1000
     * @tc.desc   Check the invalid abilityName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidAbilityPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME).then((data: Array<string>): void => {
        hilog.info(domain, tag, "getProfileByAbilityInvalidAbilityPro_static success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: Error): void => {
        hilog.error(domain, tag, "getProfileByAbilityInvalidAbilityPro_static failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByAbilityEmptyAbilityPro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_2700
     * @tc.desc   Check the empty abilityName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityEmptyAbilityPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByAbility(MODULE_NAME, '', METADATA_NAME).then((data: Array<string>): void => {
        hilog.info(domain, tag, "getProfileByAbilityEmptyAbilityPro_static success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: Error): void => {
        hilog.error(domain, tag, "getProfileByAbilityEmptyAbilityPro_static failed" + JSON.stringify(err))
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
        done()
      })
    })

    /**
     * @tc.name   getProfileByAbilityInvalidAbilityCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_2000
     * @tc.desc   Check the invalid abilityName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidAbilityCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByAbilityInvalidAbilityCall_static]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityEmptyAbilityCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_02700
     * @tc.desc   Check the empty abilityName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityEmptyAbilityCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByAbility(MODULE_NAME, '', METADATA_NAME, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByAbilityEmptyAbilityCall_static]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityInvalidMetaDataCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_2400
     * @tc.desc   Check the invalid metadataName (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidMetaDataCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err: BusinessError<void> | null, data) => {
        expect(err?.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        hilog.error(domain, tag, '[getProfileByAbilityInvalidMetaDataCall_static]Operation failed. Cause: ' + JSON.stringify(err));
        done();
      });
    })

    /**
     * @tc.name   getProfileByAbilityInvalidMetaDataPro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_0300
     * @tc.desc   Check the invalid metadataName (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityInvalidMetaDataPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST).then((data: Array<string>): void => {
        hilog.info(domain, tag, '[getProfileByAbilityInvalidMetaDataPro_static] getProfileByAbility callback data is: ' + JSON.stringify(data));
        done()
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '[getProfileByAbilityInvalidMetaDataPro_static]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /**
     * @tc.name   getProfileByAbilityNoProfilePro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_4600
     * @tc.desc   no profile configured under the ability (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityNoProfilePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3).then((data: Array<string>): void => {
        hilog.info(domain, tag, '[getProfileByAbilityNoProfilePro_static] getProfileByAbility callback data is: ' + JSON.stringify(data));
        expect(data).assertFail()
        done();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '[getProfileByAbilityNoProfilePro_static]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /**
     * @tc.name   getProfileByAbilityNoJsonPro_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_0600
     * @tc.desc   profile is invalid json format (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityNoJsonPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4).then((data: Array<string>): void => {
        hilog.info(domain, tag, '[getProfileByAbilityNoJsonPro_static] data is: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '[getProfileByAbilityNoJsonPro_static] Operation failed. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      })
    })

    /**
     * @tc.name   getProfileByAbilityNoJsonCall_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_4400
     * @tc.desc   profile is invalid json format (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityNoJsonCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      manager.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err: BusinessError<void> | null, data) => {
        hilog.error(domain, tag, '[getProfileByAbilityNoJsonCall_static] err: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      });
    })

    /**
     * @tc.name   testGetProfileByAbilitySyncByInvalidModuleName_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_6400
     * @tc.desc   Check the invalid moduleName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByAbilitySyncByInvalidModuleName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByAbilitySync('INVALID_NAME', ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "testGetProfileByAbilitySyncByInvalidModuleName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByAbilitySyncByInvalidAbilityName_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_6500
     * @tc.desc   Check the invalid abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByAbilitySyncByInvalidAbilityName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByAbilitySync(MODULE_NAME_TEST, 'INVALID_NAME', METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "testGetProfileByAbilitySyncByInvalidAbilityName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByAbilitySyncInvalidMetaData_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_6600
     * @tc.desc   Check resource has no prefix (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByAbilitySyncInvalidMetaData_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByAbilitySync(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "getProfileByAbilitySyncNoProfile_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByAbilitySyncByEmptyModuleName_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_6800
     * @tc.desc   Check the empty moduleName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByAbilitySyncByEmptyModuleName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByAbilitySync('', ABILITY_NAME, METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "getProfileByAbilitySyncByEmptyModuleName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.name   testGetProfileByAbilitySyncByEmptyAbilityName_static
     * @tc.number Sub_Bms_Framework_Query_Profile_static_6900
     * @tc.desc   Check the empty abilityName (by sync)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProfileByAbilitySyncByEmptyAbilityName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        manager.getProfileByAbilitySync(MODULE_NAME_TEST, '', METADATA_NAME);
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, "getProfileByAbilitySyncByEmptyAbilityName_static failed" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
        done();
      }
    })

  })
}