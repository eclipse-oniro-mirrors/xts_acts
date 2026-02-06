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

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function CollatorInIntlTest() {

  describe("CollatorInIntlTest", (): void => {
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
    /* *
     * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3500
     * @tc.name    collator_test_static_3500
     * @tc.desc    compare two different strings
     */
    it('collator_test_static_3500', Level.LEVEL0, async (): Promise<void> => {
      let coll = new Intl.Collator();
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3500 ' + value);
      expect(value).assertEqual(-1);
    })
    /* *
     * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3510
     * @tc.name    collator_test_static_3510
     * @tc.desc    compare the same strings
    */
    it('collator_test_static_3510', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator();
      let value = coll.compare('a', 'a');
      console.log('collator_test_static_3100 ' + value);
      expect(value).assertEqual(0);
    })

    /* *
     * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3520
     * @tc.name    collator_test_static_3520
     * @tc.desc    compare two different strings and return positive value
    */
    it('collator_test_static_3520', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator();
      let value = coll.compare('b', 'a');
      console.log('collator_test_static_3200 ' + value);
      expect(value).assertEqual(1);
    })

    /* *
   * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3600
   * @tc.name    collator_test_static_3600
   * @tc.desc    compare two different strings with zh locale
  */
    it('collator_test_static_3600', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh');
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3600 ' + value);
      expect(value).assertEqual(-1);
    })

    /* *
     * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3620
     * @tc.name    collator_test_static_3620
     * @tc.desc    compare two different strings with zh locale and undefined options
    */
    it('collator_test_static_3620', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh', undefined);
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3620 ' + value);
      expect(value).assertEqual(-1);
    })

    /* *
     * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3640
     * @tc.name    collator_test_static_3640
     * @tc.desc    compare two different strings with zh locale and null options
    */
    it('collator_test_static_3640', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh', {});
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3640 ' + value);
      expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3700
    * @tc.name    collator_test_static_3700
    * @tc.desc    compare two different strings with zh locale and eor collation
    */
    it('collator_test_static_3700', Level.LEVEL2, async (): Promise<void> => {
      let coll = new intl.Collator('zh', {'collation': 'eor'});
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3700 ' + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().collation).assertEqual('eor');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3800
    * @tc.name    collator_test_static_3800
    * @tc.desc    compare two different strings with zh locale and base sensitivity
   */
    it('collator_test_static_3800', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh', {'sensitivity': 'base'});
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3800 ' + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().sensitivity).assertEqual('base');
    })

    /* *
     * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_3900
     * @tc.name    collator_test_static_3900
     * @tc.desc    compare two different strings with zh locale and upper caseFirst
    */
    it('collator_test_static_3900', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh', {'caseFirst': 'upper'});
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3900 ' + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().caseFirst).assertEqual('upper');
    })

    /* *
     * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_4000
     * @tc.name    collator_test_static_4000
     * @tc.desc    compare two different strings with zh locale and true numeric
    */
    it('collator_test_static_4000', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh', {'numeric': true});
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_4000 ' + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().numeric).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_4100
    * @tc.name    collator_test_static_4100
    * @tc.desc    compare two different strings with zh locale and true ignorePunctuation
    */
    it('collator_test_static_4100', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh', {'ignorePunctuation': true});
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_4100 ' + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_static_4200
    * @tc.name    collator_test_static_4200
    * @tc.desc        * @tc.name    collator_test_static_4200
    */
    it('collator_test_static_4200', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh', {'usage': 'sort'});
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_4200 ' + value);
      expect(value).assertEqual(-1);
      expect(coll.resolvedOptions().usage).assertEqual('sort');
    })

    console.log('*************end CollatorInIntlTest*************');
  })
}