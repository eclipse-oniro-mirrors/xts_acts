/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function IndexUtilInI18nTest() {

  describe("IndexUtilInI18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start i18nStageTest*************');

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
     * @tc.name   i18n_test_indexutil_static_0100
     * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_static_0100
     * @tc.desc   test getIndex interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_test_indexutil_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_indexutil_static_0100 ' + 'start');
      let index = i18n.getInstance();
      let value = index.getIndex('a');
      console.log('i18n_test_indexutil_static_0100 ' + value);
      expect(value).assertEqual('A');
    })

    /**
     * @tc.name   i18n_test_indexutil_static_0200
     * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_static_0200
     * @tc.desc   test getIndexList interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_test_indexutil_static_0200', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_indexutil_static_0200 ' + 'start');
      let index = i18n.getInstance();
      let value = index.getIndexList();
      let len = value.length;
      console.log('i18n_test_indexutil_static_0200 ' + value);
      expect(len>0).assertTrue();
    })

    /**
     * @tc.name   i18n_test_indexutil_static_0300
     * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_static_0300
     * @tc.desc   test addLocale interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_indexutil_static_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_indexutil_static_0300 ' + 'start');
      let index = i18n.getInstance();
      index.addLocale('en');
      let value = index.getIndex('a');
      console.log('i18n_test_indexutil_static_0300 ' + value);
      expect(value).assertEqual('A');
    })

    /**
     * @tc.name   i18n_test_indexutil_static_0400
     * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_static_0400
     * @tc.desc   test getInstance interface with zh locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_indexutil_static_0400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_indexutil_static_0400 ' + 'start');
      let index = i18n.getInstance('zh');
      let value = index.getIndex('z');
      console.log('i18n_test_indexutil_static_0400 ' + value);
      expect(value).assertEqual('Z');
    })

    console.log('*************end I18NTest*************');
  })
}