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

export default function NormalizerInI18nTest() {

  describe("NormalizerInI18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start NormalizerInI18nTest*************');

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
     * @tc.name   i18n_normalizer_test_static_0100
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0100
     * @tc.desc   normalize the '1e9b 0323' in NFC mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_normalizer_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0100 ' + 'start');
      let str = '\u1e9b\u0323';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0100 ' + value);
      expect(value).assertEqual('\u1e9b\u0323');
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0200
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0200
     * @tc.desc   normalize the '1e9b 0323' in NFD mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_normalizer_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0200 ' + 'start');
      let str = '\u1e9b\u0323';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFD);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0200 ' + value);
      expect(value).assertEqual('\u017f\u0323\u0307');
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0300
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0300
     * @tc.desc   normalize the '1e9b 0323' in NFKC mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_normalizer_test_static_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0300 ' + 'start');
      let str = '\u1e9b\u0323';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFKC);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0300 ' + value);
      expect(value).assertEqual('\u1e69');
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0400
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0400
     * @tc.desc   normalize the '1e9b 0323' in NFKD mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_normalizer_test_static_0400', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0400 ' + 'start');
      let str = '\u1e9b\u0323';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFKD);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0400 ' + value);
      expect(value).assertEqual('\u0073\u0323\u0307');
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0500
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0500
     * @tc.desc   normalize the '0032 2075' in NFC mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_normalizer_test_static_0500', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0500 ' + 'start');
      let str = '\u0032\u2075';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0500 ' + value);
      expect(value).assertEqual('\u0032\u2075');
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0600
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0600
     * @tc.desc   normalize the '0032 2075' in NFD mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_normalizer_test_static_0600', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0600 ' + 'start');
      let str = '\u0032\u2075';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFD);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0600 ' + value);
      expect(value).assertEqual('\u0032\u2075');
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0700
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0700
     * @tc.desc   normalize the '0032 2075' in NFKC mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_normalizer_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0700 ' + 'start');
      let str = '\u0032\u2075';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFKC);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0700 ' + value);
      expect(value).assertEqual('\u0032\u0035');
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0800
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0800
     * @tc.desc   normalize the '0032 2075' in NFKD mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_normalizer_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0800 ' + 'start');
      let str = '\u0032\u2075';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFKD);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0800 ' + value);
      expect(value).assertEqual('\u0032\u0035');
    })
 
    /**
     * @tc.name   i18n_normalizer_test_static_0900
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0900
     * @tc.desc   test the getInstance error code, getInstance method return 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_normalizer_test_static_0900', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0900 ' + 'start');
      let str = '\u0032\u2075';
      try{
        let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
      } catch (error) {
        error = error as BusinessError;
        console.log('i18n_normalizer_test_static_0900 ' + error.code);
        console.log('i18n_normalizer_test_static_0900 ' + error.message);
        expect(error.code == 401).assertTrue();
      }
    })
    
    /**
     * @tc.name   i18n_normalizer_test_static_1000
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_1000
     * @tc.desc   normalize method return 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('i18n_normalizer_test_static_1000', Level.LEVEL3, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_1000 ' + 'start');
      let str = '\u0032\u2075';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
      try {
        let value = normal.normalize('1234');
      } catch (error) {
        error = error as BusinessError;
        console.log('i18n_normalizer_test_static_1000 ' + error.code);
        console.log('i18n_normalizer_test_static_1000 ' + error.message);
        expect(error.code == 401).assertTrue();
      }
    })
    console.log('*************end NormalizerInI18nTest*************');
  })
}