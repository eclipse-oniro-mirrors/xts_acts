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
     * @tc.number   : SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.name     : resourceManager_test_getIntPluralStringValueSync_0100
     * @tc.desc     : getIntPluralStringValueSync with id
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('resourceManager_test_getIntPluralStringValueSync_0100', Level.LEVEL2, () => {
      let value = res.getIntPluralStringValueSync($r('app.plural.p_str4').id, 2, 2, 'test');
      console.log('resourceManager_test_getIntPluralStringValueSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.number   : SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.name     : resourceManager_test_getIntPluralStringValueSync_0200
     * @tc.desc     : getIntPluralStringValueSync with object
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.name     : resourceManager_test_getIntPluralStringByNameSync_0100
     * @tc.desc     : getIntPluralStringByNameSync with name
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('resourceManager_test_getIntPluralStringByNameSync_0100', Level.LEVEL2, () => {
      let value = res.getIntPluralStringByNameSync('p_str4', 2, 2, 'test');
      console.log('resourceManager_test_getIntPluralStringByNameSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.number   : SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.name     : resourceManager_test_getDoublePluralStringValueSync_0100
     * @tc.desc     : getDoublePluralStringValueSync with id
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('resourceManager_test_getDoublePluralStringValueSync_0100', Level.LEVEL2, () => {
      let value = res.getDoublePluralStringValueSync($r('app.plural.p_str4').id, 2.1, 2, 'test');
      console.log('resourceManager_test_getDoublePluralStringValueSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.number   : SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.name     : resourceManager_test_getDoublePluralStringValueSync_0200
     * @tc.desc     : getDoublePluralStringValueSync with object
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_GLOBAL_ResourceManager_Plural_0310
     * @tc.name     : resourceManager_test_getDoublePluralStringByNameSync_0100
     * @tc.desc     : getDoublePluralStringByNameSync with name
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_0100', Level.LEVEL2, () => {
      let value = res.getDoublePluralStringByNameSync('p_str4', 2.1, 2, 'test');
      console.log('resourceManager_test_getDoublePluralStringByNameSync_0100:' + value);
      expect(value).assertEqual('2 apples');
    })

    /**
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_0970
     * @tc.name      : resourceManager_test_getIntPluralStringValueSync_0970
     * @tc.desc      : error code 9001001 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_0980
     * @tc.name      : resourceManager_test_getIntPluralStringValueSync_0980
     * @tc.desc      : error code 9001001 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_0990
     * @tc.name      : resourceManager_test_getDoublePluralStringValueSync_0990
     * @tc.desc      : error code 9001001 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1000
     * @tc.name      : resourceManager_test_getDoublePluralStringValueSync_1000
     * @tc.desc      : error code 9001001 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1010
     * @tc.name      : resourceManager_test_getIntPluralStringValueSync_1010
     * @tc.desc      : error code 9001002 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1020
     * @tc.name      : resourceManager_test_getIntPluralStringValueSync_1020
     * @tc.desc      : error code 9001002 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1030
     * @tc.name      : resourceManager_test_getDoublePluralStringValueSync_1030
     * @tc.desc      : error code 9001002 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1040
     * @tc.name      : resourceManager_test_getDoublePluralStringValueSync_1040
     * @tc.desc      : error code 9001002 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1050
     * @tc.name      : resourceManager_test_getIntPluralStringValueSync_1050
     * @tc.desc      : error code 9001006 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1060
     * @tc.name      : resourceManager_test_getIntPluralStringValueSync_1060
     * @tc.desc      : error code 9001006 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1070
     * @tc.name      : resourceManager_test_getDoublePluralStringValueSync_1070
     * @tc.desc      : error code 9001006 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1080
     * @tc.name      : resourceManager_test_getDoublePluralStringValueSync_1080
     * @tc.desc      : error code 9001006 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1090
     * @tc.name      : resourceManager_test_getIntPluralStringValueSync_1090
     * @tc.desc      : error code 9001007 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1100
     * @tc.name      : resourceManager_test_getIntPluralStringValueSync_1100
     * @tc.desc      : error code 9001007 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1110
     * @tc.name      : resourceManager_test_getDoublePluralStringValueSync_1110
     * @tc.desc      : error code 9001007 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1120
     * @tc.name      : resourceManager_test_getDoublePluralStringValueSync_1120
     * @tc.desc      : error code 9001007 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1130
     * @tc.name      : resourceManager_test_getIntPluralStringByNameSync_1130
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1140
     * @tc.name      : resourceManager_test_getDoublePluralStringByNameSync_1140
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1150
     * @tc.name      : resourceManager_test_getIntPluralStringByNameSync_1150
     * @tc.desc      : error code 9001006 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1160
     * @tc.name      : resourceManager_test_getDoublePluralStringByNameSync_1160
     * @tc.desc      : error code 9001006 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1170
     * @tc.name      : resourceManager_test_getIntPluralStringByNameSync_1170
     * @tc.desc      : error code 9001008 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1180
     * @tc.name      : resourceManager_test_getDoublePluralStringByNameSync_1180
     * @tc.desc      : error code 9001008 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getDoublePluralStringByNameSync_1180', Level.LEVEL3, () => {
      try {
        res.getDoublePluralStringByNameSync('string_format7', 2.1, 'test');
      } catch (err) {
        console.log('resourceManager_test_getDoublePluralStringByNameSync_1180 error code:' + err.code);
        expect(err.code).assertEqual('9001008');
      }
    })

    console.log('*************end FivePointOne_resMgrStageTest*************');
  })
}
