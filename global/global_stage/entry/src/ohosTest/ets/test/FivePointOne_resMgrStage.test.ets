/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { GlobalContext } from '../test/global';

export default function FivePointOne_resMgrStageTest() {
  describe("FivePointOne_resMgrStageTest", () => {
    console.log('*************start FivePointOne_resMgrStageTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      resContext = (GlobalContext.getContext().getObject('yq') as Context)
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_0100
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.desc   getIntPluralStringValueSync with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getIntPluralStringValueSync_0100', Level.LEVEL2, () => {
      let value = res.getIntPluralStringValueSync($r('app.plural.p_str4').id, 2, 2, 'test');
      console.log('resourceManager_test_getIntPluralStringValueSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_0200
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.desc   getIntPluralStringValueSync with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getIntPluralStringValueSync_0200', Level.LEVEL2, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.plural.p_str4').id
      };
      let value = res.getIntPluralStringValueSync(resource, 2, 2, 'test');
      console.log('resourceManager_test_getIntPluralStringValueSync_0200:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringByNameSync_0100
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.desc   getIntPluralStringByNameSync with name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getIntPluralStringByNameSync_0100', Level.LEVEL2, () => {
      let value = res.getIntPluralStringByNameSync('p_str4', 2, 2, 'test');
      console.log('resourceManager_test_getIntPluralStringByNameSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_0100
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.desc   getDoublePluralStringValueSync with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getDoublePluralStringValueSync_0100', Level.LEVEL2, () => {
      let value = res.getDoublePluralStringValueSync($r('app.plural.p_str4').id, 2.1, 2, 'test');
      console.log('resourceManager_test_getDoublePluralStringValueSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_0200
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.desc   getDoublePluralStringValueSync with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getDoublePluralStringValueSync_0200', Level.LEVEL2, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.plural.p_str4').id
      };
      let value = res.getDoublePluralStringValueSync(resource, 2.1, 2, 'test');
      console.log('resourceManager_test_getDoublePluralStringValueSync_0200:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringByNameSync_0100
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.desc   getDoublePluralStringByNameSync with name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_0100', Level.LEVEL2, () => {
      let value = res.getDoublePluralStringByNameSync('p_str4', 2.1, 2, 'test');
      console.log('resourceManager_test_getDoublePluralStringByNameSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_0970
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0970
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_0970', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringValueSync(123, 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_0970 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_0980
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0980
     * @tc.desc   error code 9001001 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_0980', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: 123
        }, 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_0980 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_0990
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_0990
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_0990', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringValueSync(123, 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_0990 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_1000
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1000
     * @tc.desc   error code 9001001 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_1000', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: 123
        }, 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_1000 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_1010
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1010
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_1010', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringValueSync($r('app.boolean.boolean_1').id, 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_1010 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_1020
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1020
     * @tc.desc   error code 9001002 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_1020', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.boolean.boolean_1').id
        }, 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_1020 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_1030
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1030
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_1030', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringValueSync($r('app.boolean.boolean_1').id, 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_1030 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_1040
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1040
     * @tc.desc   error code 9001002 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_1040', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.boolean.boolean_1').id
        }, 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_1040 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_1050
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1050
     * @tc.desc   error code 9001006 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_1050', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringValueSync($r('app.plural.test_cyc').id, 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_1050 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_1060
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1060
     * @tc.desc   error code 9001006 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_1060', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.plural.test_cyc').id
        }, 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_1060 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_1070
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1070
     * @tc.desc   error code 9001006 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_1070', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringValueSync($r('app.plural.test_cyc').id, 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_1070 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_1080
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1080
     * @tc.desc   error code 9001006 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_1080', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.plural.test_cyc').id
        }, 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_1080 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_1090
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1090
     * @tc.desc   error code 9001007 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_1090', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringValueSync($r('app.plural.string_format7').id, 1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_1090 error code:' + err.code);
        expect(err.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringValueSync_1100
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1100
     * @tc.desc   error code 9001007 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringValueSync_1100', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.plural.string_format7').id
        }, 1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringValueSync_1100 error code:' + err.code);
        expect(err.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_1110
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1110
     * @tc.desc   error code 9001007 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_1110', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringValueSync($r('app.plural.string_format7').id, 2.1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_1110 error code:' + err.code);
        expect(err.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringValueSync_1120
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1120
     * @tc.desc   error code 9001007 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringValueSync_1120', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.plural.string_format7').id
        }, 2.1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringValueSync_1120 error code:' + err.code);
        expect(err.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringByNameSync_1130
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1130
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringByNameSync_1130', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringByNameSync('invalidName', 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringByNameSync_1130 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringByNameSync_1140
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1140
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_1140', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringByNameSync('invalidName', 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringByNameSync_1140 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringByNameSync_1150
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1150
     * @tc.desc   error code 9001006 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringByNameSync_1150', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringByNameSync('test_cyc', 1);
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringByNameSync_1150 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringByNameSync_1160
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1160
     * @tc.desc   error code 9001006 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_1160', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringByNameSync('test_cyc', 2.1);
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringByNameSync_1160 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   resourceManager_test_getIntPluralStringByNameSync_1170
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1170
     * @tc.desc   error code 9001008 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getIntPluralStringByNameSync_1170', Level.LEVEL3, () => {
      try {
        res.getIntPluralStringByNameSync('string_format7', 1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getIntPluralStringByNameSync_1170 error code:' + err.code);
        expect(err.code).assertEqual('9001008');
      }
    })

    /**
     * @tc.name   resourceManager_test_getDoublePluralStringByNameSync_1180
     * @tc.number SUB_GLOBAL_ResourceManager_Plural_1180
     * @tc.desc   error code 9001008 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_1180', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringByNameSync('string_format7', 2.1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringByNameSync_1180 error code:' + err.code);
        expect(err.code).assertEqual('9001008');
      }
    })

    /**
     * @tc.name SUB_GLOBAL_GetLocales_0100
     * @tc.number SUB_GLOBAL_GetLocales_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GLOBAL_GetLocales_0100', Level.LEVEL3, () => {
      let value: Array<string> = res.getLocales(true);
      console.log('SUB_GLOBAL_GetLocales_0100 value:', value);
      expect(value.toString()).assertContain('zh-CN');
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200
     * @tc.desc with getOverrideResourceManager
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200', Level.LEVEL3, () => {
      let overrideConfigurationOne: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'zh_Hans_CN',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_TABLET,
        screenDensity: resourceManager.ScreenDensity.SCREEN_MDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager(overrideConfigurationOne);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      result.push(value.getOverrideConfiguration().mnc);
      result.push(value.getOverrideConfiguration().mcc);
      let resultString = value.getOverrideConfiguration().locale;
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200 result:', result[3]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200 result:', result[4]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200 result:', result[5]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0200 result:', resultString);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x01);
      expect(result[2]).assertEqual(160);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(101);
      expect(result[5]).assertEqual(460);
      expect(resultString).assertEqual('zh_Hans_CN');
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_getOverrideResourceManager_0300
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideResourceManager_0300
     * @tc.desc with getOverrideResourceManager
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0300', Level.LEVEL3, () => {
      let overrideConfigurationTwo: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_CAR,
        screenDensity: resourceManager.ScreenDensity.SCREEN_LDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager(overrideConfigurationTwo);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0300 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0300 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0300 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0300 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x02);
      expect(result[2]).assertEqual(240);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_getOverrideResourceManager_0400
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideResourceManager_0400
     * @tc.desc with getOverrideResourceManager
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0400', Level.LEVEL3, () => {
      let overrideConfigurationThree: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_PC,
        screenDensity: resourceManager.ScreenDensity.SCREEN_XLDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager(overrideConfigurationThree);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0400 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0400 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0400 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0400 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x03);
      expect(result[2]).assertEqual(320);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_getOverrideResourceManager_0500
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideResourceManager_0500
     * @tc.desc with getOverrideResourceManager
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0500', Level.LEVEL3, () => {
      let overrideConfigurationFour: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_TV,
        screenDensity: resourceManager.ScreenDensity.SCREEN_XXLDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager(overrideConfigurationFour);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0500 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0500 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0500 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0500 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x04);
      expect(result[2]).assertEqual(480);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_getOverrideResourceManager_0600
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideResourceManager_0600
     * @tc.desc with getOverrideResourceManager
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0600', Level.LEVEL3, () => {
      let overrideConfigurationFive: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_WEARABLE,
        screenDensity: resourceManager.ScreenDensity.SCREEN_XXXLDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager(overrideConfigurationFive);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0600 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0600 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0600 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0600 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x06);
      expect(result[2]).assertEqual(640);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_getOverrideResourceManager_0700
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideResourceManager_0700
     * @tc.desc with getOverrideResourceManager
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0700', Level.LEVEL3, () => {
      let overrideConfigurationSix: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_2IN1,
        screenDensity: resourceManager.ScreenDensity.SCREEN_XXXLDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager(overrideConfigurationSix);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0700 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0700 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0700 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0700 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x07);
      expect(result[2]).assertEqual(640);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0200
     * @tc.number SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0200
     * @tc.desc with updateOverrideConfiguration
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0200', Level.LEVEL3, () => {
      let overrideConfigurationOne: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_TABLET,
        screenDensity: resourceManager.ScreenDensity.SCREEN_MDPI,
        colorMode: resourceManager.ColorMode.LIGHT
      };
      let value = res.getOverrideResourceManager();
      value.updateOverrideConfiguration(overrideConfigurationOne);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0200 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0200 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0200 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0200 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x01);
      expect(result[2]).assertEqual(160);
      expect(result[3]).assertEqual(1);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0300
     * @tc.number SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0300
     * @tc.desc with updateOverrideConfiguration
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0300', Level.LEVEL3, () => {
      let overrideConfigurationTwo: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_CAR,
        screenDensity: resourceManager.ScreenDensity.SCREEN_LDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager();
      value.updateOverrideConfiguration(overrideConfigurationTwo);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0300 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0300 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0300 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0300 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x02);
      expect(result[2]).assertEqual(240);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0400
     * @tc.number SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0400
     * @tc.desc with updateOverrideConfiguration
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0400', Level.LEVEL3, () => {
      let overrideConfigurationThree: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_PC,
        screenDensity: resourceManager.ScreenDensity.SCREEN_XLDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager();
      value.updateOverrideConfiguration(overrideConfigurationThree);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0400 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0400 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0400 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0400 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x03);
      expect(result[2]).assertEqual(320);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0500
     * @tc.number SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0500
     * @tc.desc with updateOverrideConfiguration
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0500', Level.LEVEL3, () => {
      let overrideConfigurationFour: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_TV,
        screenDensity: resourceManager.ScreenDensity.SCREEN_XXLDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager();
      value.updateOverrideConfiguration(overrideConfigurationFour);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0500 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0500 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0500 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0500 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x04);
      expect(result[2]).assertEqual(480);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0600
     * @tc.number SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0600
     * @tc.desc with updateOverrideConfiguration
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0600', Level.LEVEL3, () => {
      let overrideConfigurationFive: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_WEARABLE,
        screenDensity: resourceManager.ScreenDensity.SCREEN_XXXLDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager();
      value.updateOverrideConfiguration(overrideConfigurationFive);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0600 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0600 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0600 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0600 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x06);
      expect(result[2]).assertEqual(640);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0700
     * @tc.number SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0700
     * @tc.desc with updateOverrideConfiguration
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0700', Level.LEVEL3, () => {
      let overrideConfigurationSix: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_VERTICAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_2IN1,
        screenDensity: resourceManager.ScreenDensity.SCREEN_XXXLDPI,
        colorMode: resourceManager.ColorMode.DARK
      };
      let value = res.getOverrideResourceManager();
      value.updateOverrideConfiguration(overrideConfigurationSix);
      let result: Array<number> = [];
      result.push(value.getOverrideConfiguration().direction);
      result.push(value.getOverrideConfiguration().deviceType);
      result.push(value.getOverrideConfiguration().screenDensity);
      result.push(value.getOverrideConfiguration().colorMode);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0700 result:', result[0]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0700 result:', result[1]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0700 result:', result[2]);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0700 result:', result[3]);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0x07);
      expect(result[2]).assertEqual(640);
      expect(result[3]).assertEqual(0);
    })

    /**
     * @tc.name getDeviceCapability_stage_test_0100
     * @tc.number getDeviceCapability_stage_test_0100
     * @tc.desc with callback deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDeviceCapability_stage_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getDeviceCapability((err, value) => {
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PHONE;
        console.log('getDeviceCapability_stage_test_0100 phone:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TABLET;
        console.log('getDeviceCapability_stage_test_0100 table:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TABLET);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_CAR;
        console.log('getDeviceCapability_stage_test_0100 car:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_CAR);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PC;
        console.log('getDeviceCapability_stage_test_0100 pc:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PC);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TV;
        console.log('getDeviceCapability_stage_test_0100 tv:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TV);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_WEARABLE;
        console.log('getDeviceCapability_stage_test_0100 wearable:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_2IN1;
        console.log('getDeviceCapability_stage_test_0100 2in1:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_2IN1);
        done();
      })
    })

    /**
     * @tc.name getDeviceCapability_stage_test_0200
     * @tc.number getDeviceCapability_stage_test_0200
     * @tc.desc with callback deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDeviceCapability_stage_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getDeviceCapability((err, value) => {
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_SDPI;
        console.log('getDeviceCapability_stage_test_0200 SCREEN_SDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_SDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_MDPI;
        console.log('getDeviceCapability_stage_test_0200 SCREEN_MDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_MDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_LDPI;
        console.log('getDeviceCapability_stage_test_0200 SCREEN_LDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_LDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XLDPI;
        console.log('getDeviceCapability_stage_test_0200 SCREEN_XLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XLDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXLDPI;
        console.log('getDeviceCapability_stage_test_0200 SCREEN_XXLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXLDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXXLDPI;
        console.log('getDeviceCapability_stage_test_0200 SCREEN_XXXLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXXLDPI);
        done();
      })
    })

    /**
     * @tc.name getDeviceCapability_stage_test_0300
     * @tc.number getDeviceCapability_stage_test_0300
     * @tc.desc with promise deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDeviceCapability_stage_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getDeviceCapability().then((value) => {
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PHONE;
        console.log('getDeviceCapability_stage_test_0300 phone:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TABLET;
        console.log('getDeviceCapability_stage_test_0300 table:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TABLET);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_CAR;
        console.log('getDeviceCapability_stage_test_0300 car:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_CAR);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PC;
        console.log('getDeviceCapability_stage_test_0300 pc:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PC);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TV;
        console.log('getDeviceCapability_stage_test_0300 tv:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TV);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_WEARABLE;
        console.log('getDeviceCapability_stage_test_0300 wearable:', +value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_2IN1;
        console.log('getDeviceCapability_stage_test_0300 2in1:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_2IN1);
        done();
      })
    })

    /**
     * @tc.name getDeviceCapability_stage_test_0400
     * @tc.number getDeviceCapability_stage_test_0400
     * @tc.desc with promise deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDeviceCapability_stage_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getDeviceCapability().then((value) => {
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_SDPI;
        console.log('getDeviceCapability_stage_test_0400 SCREEN_SDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_SDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_MDPI;
        console.log('getDeviceCapability_stage_test_0400 SCREEN_MDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_MDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_LDPI;
        console.log('getDeviceCapability_stage_test_0400 SCREEN_LDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_LDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XLDPI;
        console.log('getDeviceCapability_stage_test_0400 SCREEN_XLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XLDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXLDPI;
        console.log('getDeviceCapability_stage_test_0400 SCREEN_XXLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXLDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXXLDPI;
        console.log('getDeviceCapability_stage_test_0400 SCREEN_XXXLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXXLDPI);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_0100
     * @tc.number getConfiguration_stage_0100
     * @tc.desc callback locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     *
     */
    it('getConfiguration_stage_0100', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration((err, value) => {
        value.locale = 'zh_Hans_CN';
        console.log('getConfiguration_stage_0100 locale:' + value.locale);
        expect(value.locale).assertEqual('zh_Hans_CN');
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_test_0200
     * @tc.number getConfiguration_stage_test_0200
     * @tc.desc with callback direction
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getConfiguration_stage_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration((err, value) => {
        value.direction = resourceManager.Direction.DIRECTION_VERTICAL;
        console.log('getConfiguration_stage_test_0200 DIRECTION_VERTICAL:' + value.direction);
        expect(value.direction).assertEqual(resourceManager.Direction.DIRECTION_VERTICAL);
        value.direction = resourceManager.Direction.DIRECTION_HORIZONTAL;
        console.log('getConfiguration_stage_test_0200 DIRECTION_HORIZONTAL:' + value.direction);
        expect(value.direction).assertEqual(resourceManager.Direction.DIRECTION_HORIZONTAL);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_test_0300
     * @tc.number getConfiguration_stage_test_0300
     * @tc.desc with callback deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getConfiguration_stage_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration((err, value) => {
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PHONE;
        console.log('getConfiguration_stage_test_0300 phone:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TABLET;
        console.log('getConfiguration_stage_test_0300 table:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TABLET);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_CAR;
        console.log('getConfiguration_stage_test_0300 car:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_CAR);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PC;
        console.log('getConfiguration_stage_test_0300 pc:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PC);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TV;
        console.log('getConfiguration_stage_test_0300 tv:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TV);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_WEARABLE;
        console.log('getConfiguration_stage_test_0300 wearable:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_2IN1;
        console.log('getConfiguration_stage_test_0300 2in1:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_2IN1);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_test_0400
     * @tc.number getConfiguration_stage_test_0400
     * @tc.desc with callback screenDensity
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getConfiguration_stage_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration((err, value) => {
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_SDPI;
        console.log('getConfiguration_stage_test_0400 SCREEN_SDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_SDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_MDPI;
        console.log('getConfiguration_stage_test_0400 SCREEN_MDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_MDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_LDPI;
        console.log('getConfiguration_stage_test_0400 SCREEN_LDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_LDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XLDPI;
        console.log('getConfiguration_stage_test_0400 SCREEN_XLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XLDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXLDPI;
        console.log('getConfiguration_stage_test_0400 SCREEN_XXLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXLDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXXLDPI;
        console.log('getConfiguration_stage_test_0400 SCREEN_XXXLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXXLDPI);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_test_0500
     * @tc.number getConfiguration_stage_test_0500
     * @tc.desc with callback colorMode
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getConfiguration_stage_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration((err, value) => {
        value.colorMode = resourceManager.ColorMode.DARK;
        console.log('getConfiguration_stage_test_0500 DARK:' + value.colorMode);
        expect(value.colorMode).assertEqual(resourceManager.ColorMode.DARK);
        value.colorMode = resourceManager.ColorMode.LIGHT;
        console.log('getConfiguration_stage_test_0500 LIGHT:' + value.colorMode);
        expect(value.colorMode).assertEqual(resourceManager.ColorMode.LIGHT);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_0600
     * @tc.number getConfiguration_stage_0600
     * @tc.desc callback mcc
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     *
     */
    it('getConfiguration_stage_0600', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration((err, value) => {
        value.mcc = 460;
        console.log('getConfiguration_stage_0600 locale:' + value.mcc);
        expect(value.mcc).assertEqual(460);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_0700
     * @tc.number getConfiguration_stage_0700
     * @tc.desc callback mcc
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     *
     */
    it('getConfiguration_stage_0700', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration((err, value) => {
        value.mnc = 60;
        console.log('getConfiguration_stage_0700 locale:' + value.mnc);
        expect(value.mnc).assertEqual(60);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_0800
     * @tc.number getConfiguration_stage_0800
     * @tc.desc promise locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     *
     */
    it('getConfiguration_stage_0800', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration().then((value) => {
        value.locale = 'zh_Hans_CN';
        console.log('getConfiguration_stage_0800 locale:' + value.locale);
        expect(value.locale).assertEqual('zh_Hans_CN');
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_0900
     * @tc.number getConfiguration_stage_0900
     * @tc.desc promise direction
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     *
     */
    it('getConfiguration_stage_0900', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration().then((value) => {
        value.direction = resourceManager.Direction.DIRECTION_VERTICAL;
        console.log('getConfiguration_stage_0900 DIRECTION_VERTICAL:' + value.direction);
        expect(value.direction).assertEqual(resourceManager.Direction.DIRECTION_VERTICAL);
        value.direction = resourceManager.Direction.DIRECTION_HORIZONTAL;
        console.log('getConfiguration_stage_0900 DIRECTION_HORIZONTAL:' + value.direction);
        expect(value.direction).assertEqual(resourceManager.Direction.DIRECTION_HORIZONTAL);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_1000
     * @tc.number getConfiguration_stage_1000
     * @tc.desc promise deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     *
     */
    it('getConfiguration_stage_1000', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration().then((value) => {
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PHONE;
        console.log('getConfiguration_stage_1000 phone:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TABLET;
        console.log('getConfiguration_stage_1000 table:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TABLET);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_CAR;
        console.log('getConfiguration_stage_1000 car:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_CAR);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PC;
        console.log('getConfiguration_stage_1000 pc:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PC);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TV;
        console.log('getConfiguration_stage_1000 tv:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TV);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_WEARABLE;
        console.log('getConfiguration_stage_1000 wearable:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE);
        value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_2IN1;
        console.log('getConfiguration_stage_1000 2in1:' + value.deviceType);
        expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_2IN1);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_1100
     * @tc.number getConfiguration_stage_1100
     * @tc.desc promise deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     *
     */
    it('getConfiguration_stage_1100', Level.LEVEL3, async (done: Function) => {
      res.getConfiguration().then((value) => {
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_SDPI;
        console.log('getConfiguration_stage_1100 SCREEN_SDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_SDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_MDPI;
        console.log('getConfiguration_stage_1100 SCREEN_MDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_MDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_LDPI;
        console.log('getConfiguration_stage_1100 SCREEN_LDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_LDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XLDPI;
        console.log('getConfiguration_stage_1100 SCREEN_XLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XLDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXLDPI;
        console.log('getConfiguration_stage_1100 SCREEN_XXLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXLDPI);
        value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXXLDPI;
        console.log('getConfiguration_stage_1100 SCREEN_XXXLDPI:' + value.screenDensity);
        expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXXLDPI);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_test_1200
     * @tc.number getConfiguration_stage_test_1200
     * @tc.desc promise colorMode
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfiguration_stage_test_1200', Level.LEVEL2, async (done: Function) => {
      res.getConfiguration().then((value) => {
        value.colorMode = resourceManager.ColorMode.DARK;
        console.log('getConfiguration_stage_test_1200 DARK:' + value.colorMode);
        expect(value.colorMode).assertEqual(resourceManager.ColorMode.DARK);
        value.colorMode = resourceManager.ColorMode.LIGHT;
        console.log('getConfiguration_stage_test_1200 LIGHT:' + value.colorMode);
        expect(value.colorMode).assertEqual(resourceManager.ColorMode.LIGHT);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_test_1300
     * @tc.number getConfiguration_stage_test_1300
     * @tc.desc promise mcc
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfiguration_stage_test_1300', Level.LEVEL2, async (done: Function) => {
      res.getConfiguration().then((value) => {
        value.mcc = 460;
        console.log('getConfiguration_stage_test_1300 value:' + value.mcc);
        expect(value.mcc).assertEqual(460);
        done();
      })
    })

    /**
     * @tc.name getConfiguration_stage_test_1400
     * @tc.number getConfiguration_stage_test_1400
     * @tc.desc promise mnc
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfiguration_stage_test_1400', Level.LEVEL2, async (done: Function) => {
      res.getConfiguration().then((value) => {
        value.mnc = 60;
        console.log('getConfiguration_stage_test_1400 value:' + value.mnc);
        expect(value.mnc).assertEqual(60);
        done();
      })
    })

    /**
     * @tc.name getDrawableDescriptor_stage_test_1400
     * @tc.number getDrawableDescriptor_stage_test_1400
     * @tc.desc id
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getDrawableDescriptor_stage_test_1400', Level.LEVEL2, () => {
      let value: DrawableDescriptor = res.getDrawableDescriptor($r('app.media.icon').id, 0, 1);
      console.log('getDrawableDescriptor_stage_test_1400 value:' + value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name getDrawableDescriptorByName_stage_test_0300
     * @tc.number getDrawableDescriptorByName_stage_test_0300
     * @tc.desc by name
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getDrawableDescriptorByName_stage_test_0300', Level.LEVEL2, () => {
      let value: DrawableDescriptor = res.getDrawableDescriptorByName('icon', 0, 1);
      console.log('getDrawableDescriptorByName_stage_test_0300 value:' + value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name getDrawableDescriptor_stage_test_1500
     * @tc.number getDrawableDescriptor_stage_test_1500
     * @tc.desc object
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getDrawableDescriptor_stage_test_1500', Level.LEVEL2, () => {
      let value: DrawableDescriptor = res.getDrawableDescriptor($r('app.media.icon'), 0, 1);
      console.log('getDrawableDescriptor_stage_test_1500 value:' + value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name getConfigurationSync_stage_test_0100
     * @tc.number getConfigurationSync_stage_test_0100
     * @tc.desc locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfigurationSync_stage_test_0100', Level.LEVEL2, () => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      value.locale = 'zh_Hans_CN';
      console.log('getConfigurationSync_stage_test_0100 locale:' + value.locale);
      expect(value.locale).assertEqual('zh_Hans_CN');
    })

    /**
     * @tc.name getConfigurationSync_stage_test_0200
     * @tc.number getConfigurationSync_stage_test_0200
     * @tc.desc direction
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfigurationSync_stage_test_0200', Level.LEVEL2, () => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      value.direction = resourceManager.Direction.DIRECTION_VERTICAL;
      console.log('getConfigurationSync_stage_test_0200 DIRECTION_VERTICAL:' + value.direction);
      expect(value.direction).assertEqual(resourceManager.Direction.DIRECTION_VERTICAL);
      value.direction = resourceManager.Direction.DIRECTION_HORIZONTAL;
      console.log('getConfigurationSync_stage_test_0200 DIRECTION_HORIZONTAL:' + value.direction);
      expect(value.direction).assertEqual(resourceManager.Direction.DIRECTION_HORIZONTAL);
    })

    /**
     * @tc.name getConfigurationSync_stage_test_0300
     * @tc.number getConfigurationSync_stage_test_0300
     * @tc.desc deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfigurationSync_stage_test_0300', Level.LEVEL2, () => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PHONE;
      console.log('getConfigurationSync_stage_test_0300 phone:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TABLET;
      console.log('getConfigurationSync_stage_test_0300 table:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TABLET);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_CAR;
      console.log('getConfigurationSync_stage_test_0300 car:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_CAR);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PC;
      console.log('getConfigurationSync_stage_test_0300 pc:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PC);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TV;
      console.log('getConfigurationSync_stage_test_0300 tv:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TV);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_WEARABLE;
      console.log('getConfigurationSync_stage_test_0300 wearable:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_2IN1;
      console.log('getConfigurationSync_stage_test_0300 2in1:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_2IN1);
    })

    /**
     * @tc.name getConfigurationSync_stage_test_0400
     * @tc.number getConfigurationSync_stage_test_0400
     * @tc.desc screenDensity
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfigurationSync_stage_test_0400', Level.LEVEL2, () => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_SDPI;
      console.log('getConfigurationSync_stage_test_0400 SCREEN_SDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_SDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_MDPI;
      console.log('getConfigurationSync_stage_test_0400 SCREEN_MDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_MDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_LDPI;
      console.log('getConfigurationSync_stage_test_0400 SCREEN_LDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_LDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_XLDPI;
      console.log('getConfigurationSync_stage_test_0400 SCREEN_XLDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XLDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXLDPI;
      console.log('getConfigurationSync_stage_test_0400 SCREEN_XXLDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXLDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXXLDPI;
      console.log('getConfigurationSync_stage_test_0400 SCREEN_XXXLDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXXLDPI);
    })

    /**
     * @tc.name getConfigurationSync_stage_test_0500
     * @tc.number getConfigurationSync_stage_test_0500
     * @tc.desc colorMode
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfigurationSync_stage_test_0500', Level.LEVEL2, () => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      value.colorMode = resourceManager.ColorMode.DARK;
      console.log('getConfigurationSync_stage_test_0500 DARK:' + value.colorMode);
      expect(value.colorMode).assertEqual(resourceManager.ColorMode.DARK);
      value.colorMode = resourceManager.ColorMode.LIGHT;
      console.log('getConfigurationSync_stage_test_0500 LIGHT:' + value.colorMode);
      expect(value.colorMode).assertEqual(resourceManager.ColorMode.LIGHT);
    })

    /**
     * @tc.name getConfigurationSync_stage_test_0600
     * @tc.number getConfigurationSync_stage_test_0600
     * @tc.desc mcc
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfigurationSync_stage_test_0600', Level.LEVEL2, () => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      value.mcc = 460;
      console.log('getConfigurationSync_stage_test_0600 value:' + value.mcc);
      expect(value.mcc).assertEqual(460);
    })

    /**
     * @tc.name getConfigurationSync_stage_test_0700
     * @tc.number getConfigurationSync_stage_test_0700
     * @tc.desc mnc
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getConfigurationSync_stage_test_0700', Level.LEVEL2, () => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      value.mnc = 60;
      console.log('getConfigurationSync_stage_test_0700 value:' + value.mnc);
      expect(value.mnc).assertEqual(60);
    })

    /**
     * @tc.name getDeviceCapabilitySync_stage_test_0100
     * @tc.number getDeviceCapabilitySync_stage_test_0100
     * @tc.desc deviceType
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('getDeviceCapabilitySync_stage_test_0100', Level.LEVEL2, () => {
      let value: resourceManager.DeviceCapability = res.getDeviceCapabilitySync();
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PHONE;
      console.log('getDeviceCapabilitySync_stage_test_0100 phone:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TABLET;
      console.log('getDeviceCapabilitySync_stage_test_0100 table:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TABLET);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_CAR;
      console.log('getDeviceCapabilitySync_stage_test_0100 car:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_CAR);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_PC;
      console.log('getDeviceCapabilitySync_stage_test_0100 pc:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PC);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_TV;
      console.log('getDeviceCapabilitySync_stage_test_0100 tv:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_TV);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_WEARABLE;
      console.log('getDeviceCapabilitySync_stage_test_0100 wearable:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE);
      value.deviceType = resourceManager.DeviceType.DEVICE_TYPE_2IN1;
      console.log('getDeviceCapabilitySync_stage_test_0100 2in1:' + value.deviceType);
      expect(value.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_2IN1);
    })

    /**
     * @tc.number getDeviceCapabilitySync_stage_test_0200
     * @tc.name getDeviceCapabilitySync_stage_test_0200
     * @tc.desc screenDensity
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getDeviceCapabilitySync_stage_test_0200', Level.LEVEL2, () => {
      let value: resourceManager.DeviceCapability = res.getDeviceCapabilitySync();
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_SDPI;
      console.log('getDeviceCapabilitySync_stage_test_0200 SCREEN_SDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_SDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_MDPI;
      console.log('getDeviceCapabilitySync_stage_test_0200 SCREEN_MDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_MDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_LDPI;
      console.log('getDeviceCapabilitySync_stage_test_0200 SCREEN_LDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_LDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_XLDPI;
      console.log('getDeviceCapabilitySync_stage_test_0200 SCREEN_XLDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XLDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXLDPI;
      console.log('getDeviceCapabilitySync_stage_test_0200 SCREEN_XXLDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXLDPI);
      value.screenDensity = resourceManager.ScreenDensity.SCREEN_XXXLDPI;
      console.log('getDeviceCapabilitySync_stage_test_0200 SCREEN_XXXLDPI:' + value.screenDensity);
      expect(value.screenDensity).assertEqual(resourceManager.ScreenDensity.SCREEN_XXXLDPI);
    })

    /**
     * @tc.number getColorSync_test_0200
     * @tc.name getColorSync_test_0200
     * @tc.desc 9001001
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('getColorSync_test_0200', Level.LEVEL3, () => {
      try {
        let value: number = res.getColorSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: 12345678
        });
        console.log('getColorSync_test_0200 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let err = e as BusinessError;
        console.log('getColorSync_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(9001001);
      }
    })

    /**
     * @tc.number getColorSync_test_0300
     * @tc.name getColorSync_test_0300
     * @tc.desc 9001002
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('getColorSync_test_0300', Level.LEVEL3, () => {
      try {
        let value: number = res.getColorSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.media.icon').id
        });
        console.log('getColorSync_test_0300 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let err = e as BusinessError;
        console.log('getColorSync_test_0300 err:' + err.code);
        expect(Number(err.code)).assertEqual(9001002);
      }
    })

    /**
     * @tc.number getColorSync_test_0400
     * @tc.name getColorSync_test_0400
     * @tc.desc 9001006
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('getColorSync_test_0400', Level.LEVEL3, () => {
      try {
        let value: number = res.getColorSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.color.color_loop').id
        });
        console.log('getColorSync_test_0400 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let err = e as BusinessError;
        console.log('getColorSync_test_0400 err:' + err.code);
        expect(Number(err.code)).assertEqual(9001006);
      }
    })

    console.log('*************end FivePointOne_resMgrStageTest*************');
  })
}