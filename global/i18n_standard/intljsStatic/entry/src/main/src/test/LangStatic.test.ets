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

export default function LangTest() {

  describe("LangTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start LangTest*************');


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
     * @tc.name   lang_test_static_8900
     * @tc.number lang_test_static_8900
     * @tc.desc   test isRTL interface with en-US param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('lang_test_static_8900', Level.LEVEL2, (): void => {
      hilog.info(domain, tag, '%{public}s', 'i18n_test_static_8900 start');
      let value: boolean = i18n.isRTL('en-US');
      hilog.info(domain, tag, '%{public}s', 'i18n_test_static_8900 ' + value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name   i18n_test_9000
     * @tc.number i18n_test_9000
     * @tc.desc   test isRTL interface with ar param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_9000', Level.LEVEL2, (): void => {
      hilog.info(domain, tag, '%{public}s', 'i18n_test_9000 start');
      let value: boolean = i18n.isRTL('ar');
      hilog.info(domain, tag, '%{public}s', 'i18n_test_9000 ' + value);
      //error:expect true, actualValue is false
      expect(value).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_EntityRecognizer_static_0100
     * @tc.number SUB_GLOBAL_I18N_EntityRecognizer_static_0100
     * @tc.desc   findEntityInfo - Identifying Entity Information in Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let entityRecognizer: i18n.EntityRecognizer = new i18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系13801048417";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0100 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0100 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_static_0100 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 8).assertTrue();
      expect(result[0].end == 19).assertTrue();
    })

    /**
     * @tc.name   transfer_test_static_0100
     * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_static_0100
     * @tc.desc   check the transfer result, transfer from lower to upper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('transfer_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let date = 'hello';
      let value = date.toLocaleUpperCase('zh-CN');
      console.log('transfer_test_static_0100 ' + value);
      expect(value).assertEqual('HELLO');
    })

    /**
     * @tc.name   transfer_test_static_0200
     * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_static_0200
     * @tc.desc   check the transfer result, transfer from upper to lower
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('transfer_test_static_0200', Level.LEVEL0, async (): Promise<void> => {
      let date = 'WORLD';
      let value = date.toLocaleLowerCase('zh-CN');
      console.log('transfer_test_static_0200 ' + value);
      expect(value).assertEqual('world');
    })

    /**
     * @tc.name   transfer_test_static_0300
     * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_static_0300
     * @tc.desc   check the transfer result,transfer to upper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('transfer_test_static_0300', Level.LEVEL0, async (): Promise<void> => {
      let date = 'My name is Jack.';
      let value = date.toLocaleUpperCase('en-US');
      console.log('transfer_test_static_0300 ' + value);
      expect(value).assertEqual('MY NAME IS JACK.');
    })

    /**
     * @tc.name   transfer_test_static_0400
     * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_static_0400
     * @tc.desc   check the transfer result, transfer to lower
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('transfer_test_static_0400', Level.LEVEL0, async (): Promise<void> => {
      let date = 'The sky is in BLUE-STYLE!';
      let value = date.toLocaleLowerCase('en-US');
      console.log('transfer_test_static_0400 ' + value);
      expect(value).assertEqual('the sky is in blue-style!');
    })
    console.log('*************end I18NTest*************');
  })
}