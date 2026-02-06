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
import Utils from './Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';


export default function TransliteratorIni18nTest() {

  describe("TransliteratorIni18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start TransliteratorIni18nTest*************');

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
     * @tc.name   transliterator_test_static_0100
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0100
     * @tc.desc   test getAvailableIDs,get the ID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('transliterator_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('transliterator_test_static_0100 ' + 'start');
      let value = i18n.Transliterator.getAvailableIDs();
      let len = value.length;
      console.log('transliterator_test_static_0100 ' + value);
      console.log('transliterator_test_static_0100 ' + len);
      expect(value !== null).assertTrue();
      expect(len > 0).assertTrue();
      while (len > 0) {
        console.log('transliterator_test_static_0100 ' + value[len-1]);
        len--;
      }
    })

    /**
     * @tc.name   transliterator_test_static_0200
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0200
     * @tc.desc   test getInstance with a param,get the instance value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0200 ' + 'start');
      let value = i18n.Transliterator.getInstance('a');
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   transliterator_test_static_0300
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0300
     * @tc.desc   test transform with 中国 param get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0300 ' + 'start');
      let trans = i18n.Transliterator.getInstance('Any-Accents');
      let value = trans.transform('中国');
      console.log('transliterator_test_static_0300 ' + value);
      expect(value).assertEqual('中国');
    })

    /**
     * @tc.name   transliterator_test_static_0400
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0400
     * @tc.desc   test transform with Any-Latn param,get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0400', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0400 ' + 'start');
      let trans = i18n.Transliterator.getInstance('Any-Latn');
      let value = trans.transform('中国');
      console.log('transliterator_test_static_0400 ' + value);
      expect(value).assertEqual('zhōng guó');
    })

    /**
     * @tc.name   transliterator_test_static_0500
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0500
     * @tc.desc   get the transform value,test transform with Any-Thai param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0500', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0500 ' + 'start');
      let trans = i18n.Transliterator.getInstance('Any-Thai');
      let value = trans.transform('中国');
      console.log('transliterator_test_static_0500 ' + value);
      expect(value).assertEqual('中国');
    })

    /**
     * @tc.name   transliterator_test_static_0600
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0600
     * @tc.desc   test transform with Any-zh param,get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0600', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0600 ' + 'start');
      let trans = i18n.Transliterator.getInstance('Any-zh');
      let value = trans.transform('nihao');
      console.log('transliterator_test_static_0600 ' + value);
      expect(value).assertEqual('nihao');
    })

    /**
     * @tc.name   transliterator_test_static_0700
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0700
     * @tc.desc   test transform with Any-Hant param,get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0700 ' + 'start');
      let trans = i18n.Transliterator.getInstance('Any-Hant');
      let value = trans.transform('hello');
      console.log('transliterator_test_static_0700 ' + value);
      expect(value).assertEqual('hello');
    })

    /**
     * @tc.name   transliterator_test_static_0800
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0800
     * @tc.desc   test transform with Any-Kannada param,get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0800 ' + 'start');
      let trans = i18n.Transliterator.getInstance('Any-Kannada');
      let value = trans.transform('hello');
      console.log('transliterator_test_static_0800 ' + value);
      expect(value).assertEqual('ಹೆಲ್ಲೊ');
    })
    console.log('*************end TransliteratorIni18nTest*************');
  })
}