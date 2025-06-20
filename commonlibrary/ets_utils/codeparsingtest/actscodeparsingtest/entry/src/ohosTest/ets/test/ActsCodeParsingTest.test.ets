/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function actscodeparsingtest() {
  describe('ActsCodeParsingTest', () => {

    /*
     * @tc.number: SUB_Runtime_Language_PublicFundation_StringParsing_0100
     * @tc.name: Hexadecimal parsing.
     * @tc.desc: Hexadecimal parsing.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('SUB_Runtime_Language_PublicFundation_StringParsing_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let TAG = 'SUB_Runtime_Language_PublicFundation_StringParsing_0100 ';
        let ustr1 = '\\uD800\\uDC11';
        let ustr2 = '\\uD80C\\uDC00';
        let ustr3 = '\\uDBFF\\uDC11';
        let ustr4 = '\\uD80c\\uDFFF';
        let jsonstr1 = '{"ustr": " ' + ustr1 + '"}';
        let jsonstr2 = '{"ustr": " ' + ustr2 + '"}';
        let jsonstr3 = '{"ustr": " ' + ustr3 + '"}';
        let jsonstr4 = '{"ustr": " ' + ustr4 + '"}';
        let ustr_n1: string = '';
        let ustr_n2: string = '';
        let ustr_n3: string = '';
        let ustr_n4: string = '';
        try {
          let obj1: Record<string, string> = JSON.parse(jsonstr1);
          ustr_n1 = obj1.ustr;
          console.info(TAG + 'obj1: ' + obj1);
        } catch (err) {
          console.info(TAG + 'obj1 catch: ' + err.code + '; ' + err.message);
          expect().assertFail();
        }
        try {
          let obj2: Record<string, string> = JSON.parse(jsonstr2);
          ustr_n2 = obj2.ustr;
          console.info(TAG + 'obj2: ' + obj2);
        } catch (err) {
          console.info(TAG + 'obj2 catch: ' + err.code + '; ' + err.message);
          expect().assertFail();
        }
        try {
          let obj3: Record<string, string> = JSON.parse(jsonstr3);
          ustr_n3 = obj3.ustr;
          console.info(TAG + 'obj3: ' + obj3);
        } catch (err) {
          console.info(TAG + 'obj3 catch: ' + err.code + '; ' + err.message);
          expect().assertFail();
        }
        try {
          let obj4: Record<string, string> = JSON.parse(jsonstr4);
          ustr_n4 = obj4.ustr;
          console.info(TAG + 'obj4: ' + obj4);
        } catch (err) {
          console.info(TAG + 'obj4 catch: ' + err.code + '; ' + err.message);
          expect().assertFail();
        }
        expect(ustr_n1 != undefined).assertTrue();
        expect(ustr_n2 != undefined).assertTrue();
        expect(ustr_n3 != undefined).assertTrue();
        expect(ustr_n4 != undefined).assertTrue();
        done();
      })
  })
}