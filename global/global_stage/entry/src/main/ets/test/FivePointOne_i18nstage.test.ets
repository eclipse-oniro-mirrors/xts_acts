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

import Ability from '@ohos.app.ability.UIAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import I18n from '@ohos.i18n';

export default function FivePointOne_i18nStageTest() {
  describe("FivePointOne_i18nStageTest", () => {
    console.log('*************start FivePointOne_i18nStageTest*************');

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0100
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0100
     * @tc.desc     : en-GB & en-Latn-US
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getSimplifiedLanguage_01_0100', Level.LEVEL2, () => {
      let type_one = I18n.System.getSimplifiedLanguage('en-GB');
      console.log('I18N_test_getSimplifiedLanguage_01_0100 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('en-Latn-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0100 type_two:' + type_two);
      expect(type_one).assertEqual('en-GB');
      expect(type_two).assertEqual('en');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0200
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0200
     * @tc.desc     : zh-Hant-HK & zh-Hant-TW
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getSimplifiedLanguage_01_0200', Level.LEVEL2, () => {
      let type_one = I18n.System.getSimplifiedLanguage('zh-Hant-HK');
      console.log('I18N_test_getSimplifiedLanguage_01_0200 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('zh-Hant-TW');
      console.log('I18N_test_getSimplifiedLanguage_01_0200 type_two:' + type_two);
      expect(type_one).assertEqual('zh-HK');
      expect(type_two).assertEqual('zh-TW');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0300
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0300
     * @tc.desc     : es-ES & es-US
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getSimplifiedLanguage_01_0300', Level.LEVEL2, () => {
      let type_one = I18n.System.getSimplifiedLanguage('es-ES');
      console.log('I18N_test_getSimplifiedLanguage_01_0300 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('es-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0300 type_two:' + type_two);
      expect(type_one).assertEqual('es');
      expect(type_two).assertEqual('es-US');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0400
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0400
     * @tc.desc     : pt-PT & pt-BR
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('I18N_test_getSimplifiedLanguage_01_0400', Level.LEVEL2, () => {
      let type_one = I18n.System.getSimplifiedLanguage('pt-PT');
      console.log('I18N_test_getSimplifiedLanguage_01_0400 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('pt-BR');
      console.log('I18N_test_getSimplifiedLanguage_01_0400 type_two:' + type_two);
      expect(type_one).assertEqual('pt-PT');
      expect(type_two).assertEqual('pt');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0500
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0500
     * @tc.desc     : en-CN & en-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('I18N_test_getSimplifiedLanguage_01_0500', Level.LEVEL3, () => {
      let type_one = I18n.System.getSimplifiedLanguage('en-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0500 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('en-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0500 type_two:' + type_two);
      expect(type_one).assertEqual('en-CN');
      expect(type_two).assertEqual('en-Test');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0600
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0600
     * @tc.desc     : zh-Hant-CN & zh-Hant-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('I18N_test_getSimplifiedLanguage_01_0600', Level.LEVEL3, () => {
      let type_one = I18n.System.getSimplifiedLanguage('zh-Hant-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0600 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('zh-Hant-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0600 type_two:' + type_two);
      expect(type_one).assertEqual('zh-Hant-CN');
      expect(type_two).assertEqual('zh');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0700
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0700
     * @tc.desc     : es-CN & es-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('I18N_test_getSimplifiedLanguage_01_0700', Level.LEVEL3, () => {
      let type_one = I18n.System.getSimplifiedLanguage('es-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0700 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('es-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0700 type_two:' + type_two);
      expect(type_one).assertEqual('es-CN');
      expect(type_two).assertEqual('es-Test');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0800
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0800
     * @tc.desc     : pt-CN & pt-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('I18N_test_getSimplifiedLanguage_01_0800', Level.LEVEL3, () => {
      let type_one = I18n.System.getSimplifiedLanguage('pt-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0800 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('pt-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0800 type_two:' + type_two);
      expect(type_one).assertEqual('pt-CN');
      expect(type_two).assertEqual('pt-Test');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0900
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0900
     * @tc.desc     : bo-CN & bo-Test & bo-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('I18N_test_getSimplifiedLanguage_01_0900', Level.LEVEL3, () => {
      let type_one = I18n.System.getSimplifiedLanguage('bo-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_one:' + type_one);
      let type_two = I18n.System.getSimplifiedLanguage('bo-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_two:' + type_two);
      let type_three = I18n.System.getSimplifiedLanguage('bo-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_three:' + type_three);
      expect(type_one).assertEqual('bo');
      expect(type_two).assertEqual('bo-US');
      expect(type_three).assertEqual('bo-Test');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_1000
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_1000
     * @tc.desc     : pt-CN & pt-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('I18N_test_getSimplifiedLanguage_01_1000', Level.LEVEL3, () => {
      try {
        I18n.System.getSimplifiedLanguage("0");
      } catch (e) {
        console.log('I18N_test_getSimplifiedLanguage_01_1000 code&message:' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    console.log('*************end FivePointOne_i18nStageTest*************');
  })
}