/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '../../../hypium/index'
export default function etsIntlPtsFunTest() {
  describe('etsIntlPtsFunTest',  ()=> {
    console.log('*************start IntlPPtsFunTest*************');
    let stringTest = "ä";

    console.log('*************string prototype object*************');
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_001
     * @tc.name testStingPrototypeObject001
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "ä";
      let value = stringTest.localeCompare('c');
      console.log('StringTest001 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_002
     * @tc.name testStingPrototypeObject002
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "ä";
      let value = stringTest.localeCompare('ä');
      console.log('StringTest002 :' + value);
      expect(value).assertEqual(0);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_003
     * @tc.name testStingPrototypeObject003
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "ä";
      let value = stringTest.localeCompare('a');
      console.log('StringTest003 :' + value);
      expect(value).assertEqual(1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_004
     * @tc.name testStingPrototypeObject004
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let value = stringTest.localeCompare('z', 'de');
      console.log('StringTest004 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_005
     * @tc.name testStingPrototypeObject005
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let value = stringTest.localeCompare('z', 'sv');
      console.log('StringTest005 :' + value);
      expect(value).assertEqual(1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_006
     * @tc.name testStingPrototypeObject006
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "ä";
      let value = stringTest.localeCompare('ff', 'de');
      console.log('StringTest006 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_007
     * @tc.name testStingPrototypeObject007
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "ä";
      let value = stringTest.localeCompare('fff', 'sv');
      console.log('StringTest007 :' + value);
      expect(value).assertEqual(1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_008
     * @tc.name testStingPrototypeObject008
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('c', 'de', { sensitivity: 'base' });
      console.log('StringTest008 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_009
     * @tc.name testStingPrototypeObject009
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('A', 'de', { sensitivity: 'base' });
      console.log('StringTest009 :' + value);
      expect(value).assertEqual(0);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_010
     * @tc.name testStingPrototypeObject010
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('á', 'de', { sensitivity: 'base' });
      console.log('StringTest010 :' + value);
      expect(value).assertEqual(0);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_011
     * @tc.name testStingPrototypeObject011
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('zz', 'sv', { sensitivity: 'base' });
      console.log('StringTest011 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_012
     * @tc.name testStingPrototypeObject012
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('b', 'de', { sensitivity: 'accent' });
      console.log('StringTest012 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_013
     * @tc.name testStingPrototypeObject13
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('á', 'de', { sensitivity: 'accent' });
      console.log('StringTest013 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_014
     * @tc.name testStingPrototypeObject014
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('A', 'de', { sensitivity: 'accent' });
      console.log('StringTest014 :' + value);
      expect(value).assertEqual(0);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_015
     * @tc.name testStingPrototypeObject015
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('zz', 'sv', { sensitivity: 'accent' });
      console.log('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_015 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_016
     * @tc.name testStingPrototypeObject016
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStingPrototypeObject016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('c', 'de', { sensitivity: 'case' });
      console.log('StringTest016 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_017
     * @tc.name testStingPrototypeObject017
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('c', 'de', { sensitivity: 'case' });
      console.log('StringTest017 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_018
     * @tc.name testStingPrototypeObject018
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('c', 'de', { sensitivity: 'case' });
      console.log('StringTest018 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_019
     * @tc.name testStingPrototypeObject019
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "a";
      let value = stringTest.localeCompare('c', 'de', { sensitivity: 'case' });
      console.log('StringTest019 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_020
     * @tc.name testStingPrototypeObject020
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "ä";
      let value = stringTest.localeCompare('c', 'de', { sensitivity: 'variant',usage:'sort' });
      console.log('StringTest020 :' + value);
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_021
     * @tc.name testStingPrototypeObject021
     * @tc.desc The current function handles string localeCompare
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "Test";
      let value = stringTest.localeCompare('c', 'de', { sensitivity: 'variant',usage:'search' });
      console.log('StringTest021 :' + value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_022
     * @tc.name testStingPrototypeObject022
     * @tc.desc The current function handles string toLocaleLowerCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "TEST";
      let value = stringTest.toLocaleLowerCase();
      console.log('StringTest022 :' + value);
      expect(value).assertEqual("test");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_023
     * @tc.name testStingPrototypeObject023
     * @tc.desc The current function handles string toLocaleLowerCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "\u0130";
      let value = stringTest.toLocaleLowerCase();
      console.log('StringTest023 :' + value);
      expect(value).assertEqual("i̇");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_024
     * @tc.name testStingPrototypeObject024
     * @tc.desc The current function handles string toLocaleLowerCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "TEST";
      let value = stringTest.toLocaleLowerCase('tr');
      console.log('StringTest024 :' + value);
      expect(value).assertEqual("test");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_025
     * @tc.name testStingPrototypeObject025
     * @tc.desc The current function handles string toLocaleLowerCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "i";
      let value = stringTest.toLocaleLowerCase('tr');
      console.log('StringTest025 :' + value);
      expect(value).assertEqual("i");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_026
     * @tc.name testStingPrototypeObject026
     * @tc.desc The current function handles string toLocaleLowerCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "i";
      let value = stringTest.toLocaleLowerCase('en-US');
      console.log('StringTest026 :' + value);
      expect(value).assertEqual("i");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_027
     * @tc.name testStingPrototypeObject027
     * @tc.desc The current function handles string toLocaleLowerCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "\u0130";
      let value1 = stringTest.toLocaleLowerCase('en-US');
      let value2 = stringTest.toLocaleLowerCase('tr');
      console.log('StringTest027 :' + value1);
      expect((value1 == value2)).assertFalse();
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_028
     * @tc.name testStingPrototypeObject028
     * @tc.desc The current function handles string toLocaleLowerCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "\u0130";
      let locales = ['tr', 'TR', 'tr-TR', 'tr-u-co-search', 'tr-x-turkish'];
      let value = stringTest.toLocaleLowerCase(locales);
      console.log('StringTest028 :' + value);
      expect(value).assertEqual("i");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_029
     * @tc.name testStingPrototypeObject029
     * @tc.desc The current function handles string toLocaleUpperCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "test";
      let value = stringTest.toLocaleUpperCase();
      console.log('StringTest029 :' + value);
      expect(value).assertEqual("TEST");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_030
     * @tc.name testStingPrototypeObject030
     * @tc.desc The current function handles string toLocaleUpperCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "\u0130";
      let value = stringTest.toLocaleUpperCase();
      console.log('StringTest030 :' + value);
      expect(value).assertEqual("İ");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_031
     * @tc.name testStingPrototypeObject031
     * @tc.desc The current function handles string toLocaleUpperCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "test";
      let value = stringTest.toLocaleUpperCase('lt-LT');
      console.log('StringTest031 :' + value);
      expect(value).assertEqual("TEST");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_032
     * @tc.name testStingPrototypeObject032
     * @tc.desc The current function handles string toLocaleUpperCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "\u0130";
      let value = stringTest.toLocaleUpperCase('lt-LT');
      console.log('StringTest032 :' + value);
      expect(value).assertEqual("İ");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_033
     * @tc.name testStingPrototypeObject033
     * @tc.desc The current function handles string toLocaleUpperCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "\u0130";
      let value = stringTest.toLocaleUpperCase('en-US');
      console.log('StringTest033 :' + value);
      expect(value).assertEqual("İ");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_034
     * @tc.name testStingPrototypeObject034
     * @tc.desc The current function handles string toLocaleUpperCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "\u0130";
      let value1 = stringTest.toLocaleUpperCase('en-US');
      let value2 = stringTest.toLocaleUpperCase('lt-LT');
      console.log('StringTest034 :' + value1);
      expect((value1 == value2)).assertTrue();
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_STRING_PROTOTYPE_035
     * @tc.name testStingPrototypeObject035
     * @tc.desc The current function handles string toLocaleUpperCase
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStingPrototypeObject035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      stringTest = "i\u0307";
      let locales = ['lt', 'LT', 'lt-LT', 'lt-u-co-phonebk', 'lt-x-lietuva'];
      let value = stringTest.toLocaleUpperCase(locales);
      console.log('StringTest035 :' + value);
      expect(value).assertEqual("I");
    })


    console.log('*************testNumberPrototypeObject*************');
    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_001
     * @tc.name testNumberPrototypeObject001
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString();
      console.log('NumberTest001 :' + value);
      expect(value).assertEqual('123,456.789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_002
     * @tc.name testNumberPrototypeObject002
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString('ar-EG');
      console.log('NumberTest002 :' + value);
      expect(value).assertEqual("١٢٣٬٤٥٦٫٧٨٩");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_004
     * @tc.name testNumberPrototypeObject004
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = NaN;
      let value = number1.toLocaleString('ar-EG');
      console.log('NumberTest004 :' + value);
      expect(value).assertEqual("ليس رقم");
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_005
     * @tc.name testNumberPrototypeObject005
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString('de-DE');
      console.log('NumberTest005 :' + value);
      expect(value).assertEqual('123.456,789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_006
     * @tc.name testNumberPrototypeObject006
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString('en-IN');
      console.log('NumberTest006 :' + value);
      expect(value).assertEqual('1,23,456.789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_007
     * @tc.name testNumberPrototypeObject007
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString('zh-Hans-CN-u-nu-hanidec');
      console.log('NumberTest007 :' + value);
      expect(value).assertEqual('一二三,四五六.七八九');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_008
     * @tc.name testNumberPrototypeObject008
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString(['ban', 'id']);
      console.log('NumberTest008 :' + value);
      expect(value).assertEqual('123.456,789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_009
     * @tc.name testNumberPrototypeObject009
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString('de-DE', { style: 'currency', currency: 'EUR' });
      console.log('NumberTest009 :' + value);
      expect(value).assertEqual('123.456,79 €');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_010
     * @tc.name testNumberPrototypeObject010
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
      console.log('NumberTest010 :' + value);
      expect(value).assertEqual('￥123,457');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_011
     * @tc.name testNumberPrototypeObject011
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString('en-IN', { maximumSignificantDigits: 3 });
      console.log('NumberTest011 :' + value);
      expect(value).assertEqual('1,23,000');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_012
     * @tc.name testNumberPrototypeObject012
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString(undefined, { maximumSignificantDigits: 3 });
      console.log('NumberTest012 :' + value);
      expect(value).assertEqual('123,000');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_013
     * @tc.name testNumberPrototypeObject013
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
      console.log('NumberTest013 :' + value);
      expect(value).assertEqual('123,456.79');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_014
     * @tc.name testNumberPrototypeObject014
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1:double = 123456.789;
        let value = number1.toLocaleString(undefined, { minimumFractionDigits: 112, maximumFractionDigits: 112 });
        console.log('NumberTest014 :' + value);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          expect(err.name).assertEqual('RangeError');
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_015
     * @tc.name testNumberPrototypeObject015
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString('ja-JP', { style: undefined, currency: undefined});
      console.log('NumberTest015 :' + value);
      expect(value).assertEqual('123,456.789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_016
     * @tc.name testNumberPrototypeObject016
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = 123456.789;
      let value = number1.toLocaleString();
      console.log('NumberTest016 :' + value);
      expect(value).assertEqual('123,456.789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_017
     * @tc.name testNumberPrototypeObject017
     * @tc.desc The current function handles number toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberPrototypeObject017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let number1:double = -1.3365;
      let value = number1.toLocaleString();
      console.log('NumberTest016 :' + value);
      expect(value).assertEqual('-1.337');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_001
     * @tc.name testBigintPrototypeObject001
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString();
      console.log('BigintTest001 :' + value);
      expect(value).assertEqual('123,456,789,123,456,789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_002
     * @tc.name testBigintPrototypeObject002
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString('de-DE');
      console.log('BigintTest002 :' + value);
      expect(value).assertEqual('123.456.789.123.456.789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_003
     * @tc.name testBigintPrototypeObject003
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString('ar-EG');
      console.log('BigintTest003 :' + value);
      expect(value).assertEqual('١٢٣٬٤٥٦٬٧٨٩٬١٢٣٬٤٥٦٬٧٨٩');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_004
     * @tc.name testBigintPrototypeObject004
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString('en-IN');
      console.log('BigintTest004 :' + value);
      expect(value).assertEqual('1,23,45,67,89,12,34,56,789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_005
     * @tc.name testBigintPrototypeObject005
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString('zh-Hans-CN-u-nu-hanidec');
      console.log('BigintTest005 :' + value);
      expect(value).assertEqual('一二三,四五六,七八九,一二三,四五六,七八九');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_006
     * @tc.name testBigintPrototypeObject006
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString(['ban', 'id']);
      console.log('BigintTest006 :' + value);
      expect(value).assertEqual('123.456.789.123.456.789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_007
     * @tc.name testBigintPrototypeObject007
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString('de-DE', { style: 'currency', currency: 'EUR' });
      console.log('BigintTest007 :' + value);
      expect(value).assertEqual('123.456.789.123.456.789,00 €');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_008
     * @tc.name testBigintPrototypeObject008
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
      console.log('BigintTest008 :' + value);
      expect(value).assertEqual('￥123,456,789,123,456,789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_009
     * @tc.name testBigintPrototypeObject009
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString('en-IN', { maximumSignificantDigits: 3 });
      console.log('BigintTest009 :' + value);
      expect(value).assertEqual('1,23,00,00,00,00,00,00,000');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_010
     * @tc.name testBigintPrototypeObject010
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString('en-IN', {minimumFractionDigits: 3, maximumSignificantDigits: 3 });
      console.log('BigintTest009 :' + value);
      expect(value).assertEqual('1,23,00,00,00,00,00,00,000');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_011
     * @tc.name testBigintPrototypeObject011
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let bigint1 = 123456789123456789n;
        let value = bigint1.toLocaleString('en-IN', {minimumFractionDigits: 113, maximumSignificantDigits: 113 });
        console.log('BigintTest011 :' + value);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          expect(err.name).assertEqual('RangeError');
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }      
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_012
     * @tc.name testBigintPrototypeObject012
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let bigint1 = 123456789123456789n;
        let value = bigint1.toLocaleString('en-IN', {minimumFractionDigits: 113, maximumSignificantDigits: 113 });
        console.log('BigintTest012 :' + value);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          expect(err.name).assertEqual('RangeError');
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }        
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_013
     * @tc.name testBigintPrototypeObject013
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString(undefined);
      console.log('BigintTest013 :' + value);
      expect(value).assertEqual('123,456,789,123,456,789');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_014
     * @tc.name testBigintPrototypeObject014
     * @tc.desc The current function handles bigint toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigintPrototypeObject014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint1 = 123456789123456789n;
      let value = bigint1.toLocaleString(undefined, { style: undefined, currency: undefined });
      console.log('BigintTest014 :' + value);
      expect(value).assertEqual('123,456,789,123,456,789');
    })

    console.log('*************testDatePrototypeObject*************');
    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_001
     * @tc.name testDatePrototypeObject001
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleString('en-US', {timeZone: 'UTC'});
      let zerotime = "10/20/2022, 6:00:00 PM";
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_002
     * @tc.name testDatePrototypeObject002
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleString('en-GB', {timeZone: 'UTC'});
      let zerotime = "20/10/2022, 18:00:00";
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_003
     * @tc.name testDatePrototypeObject003
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleString('ko-KR', {timeZone: 'UTC'});
      let zerotime = "2022. 10. 20. 오후 6:00:00";
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_004
     * @tc.name testDatePrototypeObject004
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleString('en-GB', { timeZone: 'UTC' });
      console.log('DateTest004 :' + value);
      expect(value).assertEqual('20/10/2022, 18:00:00');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_005
     * @tc.name testDatePrototypeObject005
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleString('ko-KR', { timeZone: 'UTC' });
      console.log('DateTest005 :' + value);
      expect(value).assertEqual('2022. 10. 20. 오후 6:00:00');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_006
     * @tc.name testDatePrototypeObject006
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let zerotime = "2022/10/20 下午6:00:00";
      let value = date.toLocaleString('zh', { timeZone: 'UTC' });
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_007
     * @tc.name testDatePrototypeObject007
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(0);
      let value = date.toLocaleString('zh', { timeZone: 'UTC' });
      console.log('DateTest007 :' + value);
      expect(value).assertEqual('1970/1/1 上午12:00:00');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_008
     * @tc.name testDatePrototypeObject008
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(0);
      let value = date.toLocaleString('zh', { timeZone: 'UTC', weekday: 'long', year: 'numeric', month: 'long',
        day: 'numeric'});
      console.log('DateTest008 :' + value);
      expect(value).assertEqual('1970年1月1日星期四');

    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_009
     * @tc.name testDatePrototypeObject009
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleString('zh', { hour12: false, weekday: 'long', year: 'numeric', month: 'long',
        day: 'numeric', timeZone: 'UTC' });
      console.log('DateTest009 :' + value);
      expect(value).assertEqual('2022年10月20日星期四');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_010
     * @tc.name testDatePrototypeObject010
     * @tc.desc The current function handles date toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleString('zh', { hour12: true, weekday: 'long', year: 'numeric', month: 'long',
        day: 'numeric', timeZone: 'UTC'});
      console.log('DateTest010 :' + value);
      expect(value).assertEqual('2022年10月20日星期四');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_011
     * @tc.name testDatePrototypeObject011
     * @tc.desc The current function handles date toLocaleDateString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleDateString('zh', { timeZone: 'UTC' });
      console.log('DateTest011 :' + value);
      expect(value).assertEqual('2022/10/20');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_012
     * @tc.name testDatePrototypeObject012
     * @tc.desc The current function handles date toLocaleDateString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleDateString('de-DE', { timeZone: 'UTC' });
      console.log('DateTest012 :' + value);
      expect(value).assertEqual('20.10.2022');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_013
     * @tc.name testDatePrototypeObject013
     * @tc.desc The current function handles date toLocaleDateString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleDateString('ja', { timeZone: 'UTC' });
      console.log('DateTest013 :' + value);
      expect(value).assertEqual('2022/10/20');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_014
     * @tc.name testDatePrototypeObject014
     * @tc.desc The current function handles date toLocaleDateString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleDateString('de-DE', { timeZone: 'UTC' });
      console.log('DateTest014 :' + value);
      expect(value).assertEqual('20.10.2022');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_015
     * @tc.name testDatePrototypeObject015
     * @tc.desc The current function handles date toLocaleDateString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleDateString(undefined, { hour12: true, weekday: 'long', year: 'numeric',
        month: 'long', day: 'numeric', timeZone: 'UTC' });
      console.log('DateTest015 :' + value);
      expect(value).assertEqual('Thursday, October 20, 2022');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_016
     * @tc.name testDatePrototypeObject016
     * @tc.desc The current function handles date toLocaleDateString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleDateString('de-DE', { hour12: false, weekday: 'long', year: 'numeric', month: 'long',
        day: 'numeric', timeZone: 'UTC' });
      let zerotime = "Donnerstag, 20. Oktober 2022";
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_017
     * @tc.name testDatePrototypeObject017
     * @tc.desc The current function handles date toLocaleTimeString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleTimeString('en-US', { timeZone: 'UTC' });
      let zerotime = "6:00:00 PM";
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_018
     * @tc.name testDatePrototypeObject018
     * @tc.desc The current function handles date toLocaleTimeString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let date = new Date('August 19, 1975 23:15:30 GMT+00:00');
        let value = date.toLocaleTimeString('en-US');
        console.log('DateTest018 :' + value);
      } catch(e) {
        e = e as Error;
        console.log('DateTest018 Err:' + e);
        expect(e.name == "RangeError").assertTrue();
      }
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_019
     * @tc.name testDatePrototypeObject019
     * @tc.desc The current function handles date toLocaleTimeString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let date = new Date('August 19, 1975 23:15:30 GMT+00:00');
        let value = date.toLocaleTimeString('it-IT');
        console.log('DateTest019 :' + value);
      } catch(e) {
        e = e as Error;
        console.log('DateTest018 Err:' + e);
        expect(e.name == "RangeError").assertTrue();
      }
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_020
     * @tc.name testDatePrototypeObject020
     * @tc.desc The current function handles date toLocaleTimeString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleTimeString('it-IT', { timeZone: 'UTC' });
      let zerotime = "18:00:00";
      console.log('DateTest020 :' + value);
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_021
     * @tc.name testDatePrototypeObject021
     * @tc.desc The current function handles date toLocaleTimeString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
      let value = date.toLocaleTimeString('it-IT', { hour12: false, timeZone: 'UTC', timeZoneName: 'short' });
      let zerotime = "18:00:00 UTC";
      console.log('DateTest021 :' + value);
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_DATE_PROTOTYPE_022
     * @tc.name testDatePrototypeObject022
     * @tc.desc The current function handles date toLocaleTimeString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDatePrototypeObject022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date = new Date(Date.UTC(2022, 9, 20, 20, 0, 0));
      let value = date.toLocaleTimeString('en-US', { timeZone: 'UTC' });
      let zerotime = "8:00:00 PM";
      expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_004
     * @tc.name testArrayPrototypeObject004
     * @tc.desc The current function handles array toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayPrototypeObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let array = [1, 'a', '测试'];
      let value = array.toLocaleString();
      console.log('ArrayTest004 :' + value);
      expect(value).assertEqual('1,a,测试');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_005
     * @tc.name testArrayPrototypeObject005
     * @tc.desc The current function handles array toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayPrototypeObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let array = [1, 'a', '测试', undefined];
      let value = array.toLocaleString();
      console.log('ArrayTest005 :' + value);
      expect(value).assertEqual('1,a,测试,');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_007
     * @tc.name testArrayPrototypeObject007
     * @tc.desc The current function handles array toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayPrototypeObject007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let array = ['￥7', 500, 8123, 12];
      let value = array.toLocaleString();
      console.log('ArrayTest007 :' + value);
      expect(value).assertEqual('￥7,500,8,123,12');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_011
     * @tc.name testArrayPrototypeObject011
     * @tc.desc The current function handles array toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayPrototypeObject011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let array:Array<Int|string> = [1 , 3, "ABC"];
      let value = array.toLocaleString();
      console.log('ArrayTest011 :' + value);
      expect(value).assertEqual('1,3,ABC');
    })

    /**
     * @tc.number SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_012
     * @tc.name testArrayPrototypeObject012
     * @tc.desc The current function handles array toLocaleString
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayPrototypeObject012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let array = [new arr()];
      let value = array.toLocaleString();
      console.log('ArrayTest012 :' + value);
      expect(value.length).assertEqual(15);
      expect(value == '[object Object]').assertTrue();
    })
    console.log('*************end IntlPPtsFunTest*************');
  })
}
class arr{
  a:int=1
  b:int=2
}
