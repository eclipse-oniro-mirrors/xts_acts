/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import resourceManager from '@ohos.resourceManager';
import Ability from '@ohos.app.ability.UIAbility'
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterEach,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Context from 'application.Context';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'
import { TextStyle, StyledString } from 'arkui.component.styledString'
import { Color, FontStyle, FontWeight } from 'arkui.component.enums'


let domain: int = 0x0000;
let tag: string = 'testTag';

export default function FivePointOne_resMgrStageTest() {

  describe("FivePointOne_resMgrStageTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start FivePointOne_resMgrStageTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager | undefined;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      resContext = abilityDelegator.getAppContext()
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_static_0100
     * @tc.number resourceManager_test_getIntPluralStringValueSync_static_0100
     * @tc.desc   getIntPluralStringValueSync with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getIntPluralStringValueSync_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value = res!.getIntPluralStringValueSync(0x01000036, 2, 2, 'test');
      console.log('resourceManager_test_getIntPluralStringValueSync_static_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringByNameSync_static_0100
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_0310
     * @tc.desc   getDoublePluralStringByNameSync with name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value = res!.getDoublePluralStringByNameSync('p_str4', 2.1, 2, 'test');
      console.log('resourceManager_test_getDoublePluralStringByNameSync_static_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_static_0970
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_0970
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_static_0970', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getIntPluralStringValueSync(123, 1);
      } catch (err) {
        let error = err as BusinessError
        console.log('resourceManager_test_getIntPluralStringValueSync_static_0970 error code:' + error.code);
        expect(error.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_static_0990
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_0990
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_static_0990', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getDoublePluralStringValueSync(123, 2.1);
      } catch (err) {
        let error = err as BusinessError
        console.log('resourceManager_test_getDoublePluralStringValueSync_static_0990 error code:' + error.code);
        expect(error.code).assertEqual(9001001);
      }
    })
       
    /**
     * @tc.name   resourceManager_test_getIntPluralStringByNameSync_static_0100
     * @tc.number resourceManager_test_getIntPluralStringByNameSync_static_0100
     * @tc.desc   getIntPluralStringByNameSync with name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getIntPluralStringByNameSync_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value = res!.getIntPluralStringByNameSync('p_str4', 2, 2, 'test');
      console.log('resourceManager_test_getIntPluralStringByNameSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })
    
    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_static_1010
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1010
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_static_1010', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getIntPluralStringValueSync(0x01000014, 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_static_1010 error code:' + err.code);
        expect((err as BusinessError).code).assertEqual(9001002);
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_static_1030
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1030
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_static_1030', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getDoublePluralStringValueSync(0x0100000d, 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_static_1030 error code:' + err.code);
        expect((err as BusinessError).code == 9001002).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_static_1050
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1050
     * @tc.desc   error code 9001006 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_static_1050', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getIntPluralStringValueSync(0x01000038, 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_static_1050 error code:' + err.code);
        expect((err as BusinessError).code).assertEqual(9001006);
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_static_1070
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1070
     * @tc.desc   error code 9001006 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_static_1070', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getDoublePluralStringValueSync(0x01000038, 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_static_1070 error code:' + err.code);
        expect((err as BusinessError).code == 9001006).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_static_1090
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1090
     * @tc.desc   error code 9001007 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_static_1090', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getIntPluralStringValueSync(0x01000037, 1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_static_1090 error code:' + err.code);
        expect((err as BusinessError).code).assertEqual(9001007);
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_static_1110
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1110
     * @tc.desc   error code 9001007 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_static_1110', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getDoublePluralStringValueSync(0x01000037, 2.1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_static_1110 error code:' + err.code);
        expect((err as BusinessError).code == 9001007).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringByNameSync_static_1130
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1130
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringByNameSync_static_1130', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getIntPluralStringByNameSync('invalidName', 1);
      } catch (err) {
        let error = err as BusinessError
        console.log('resourceManager_test_getIntPluralStringByNameSync_static_1130 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringByNameSync_static_1140
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1140
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_static_1140', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getDoublePluralStringByNameSync('invalidName', 2.1);
      } catch (err) {
        let error = err as BusinessError
        console.log('resourceManager_test_getDoublePluralStringByNameSync_static_1140 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringByNameSync_static_1150
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1150
     * @tc.desc   error code 9001006 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringByNameSync_static_1150', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getIntPluralStringByNameSync('test_cyc', 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringByNameSync_static_1150 error code:' + err.code);
        expect((err as BusinessError).code == 9001006).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringByNameSync_static_1160
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1160
     * @tc.desc   error code 9001006 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_static_1160', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getDoublePluralStringByNameSync('test_cyc', 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringByNameSync_static_1160 error code:' + err.code);
        expect((err as BusinessError).code == 9001006).assertTrue();
      }
    })


    /**
     * @tc.name   resourceManager_test_getIntPluralStringByNameSync_static_1170
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1170
     * @tc.desc   error code 9001008 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringByNameSync_static_1170', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getIntPluralStringByNameSync('string_format7', 1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringByNameSync_static_1170 error code:' + err.code);
        expect((err as BusinessError).code == 9001008).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringByNameSync_static_1180
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_static_1180
     * @tc.desc   error code 9001008 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_static_1180', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getDoublePluralStringByNameSync('string_format7', 2.1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringByNameSync_static_1180 error code:' + err.code);
        expect((err as BusinessError).code == 9001008).assertTrue();
      }
    })
    console.log('*************end FivePointOne_resMgrStageTest*************');
  })
}
