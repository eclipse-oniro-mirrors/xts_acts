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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
export default function etsIntlPtsFunTest() {
describe('etsIntlPtsFunTest', function () {
    console.log('*************start IntlPPtsFunTest*************');
    var stringTest = "ä";

    console.log('*************string prototype object*************');
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_001
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_001', 0, function () {
        stringTest = "ä";
        var value = stringTest.localeCompare('c');
        console.log('StringTest001 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_002
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_002', 0, function () {
        stringTest = "ä";
        var value = stringTest.localeCompare('ä');
        console.log('StringTest002 :' + value);
        expect(value).assertEqual(0);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_003
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_003', 0, function () {
        stringTest = "ä";
        var value = stringTest.localeCompare('a');
        console.log('StringTest003 :' + value);
        expect(value).assertEqual(1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_004
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_004', 0, function () {
        var value = stringTest.localeCompare('z', 'de');
        console.log('StringTest004 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_005
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_005', 0, function () {
        var value = stringTest.localeCompare('z', 'sv');
        console.log('StringTest005 :' + value);
        expect(value).assertEqual(1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_006
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_006', 0, function () {
        stringTest = "ä";
        var value = stringTest.localeCompare('ff', 'de');
        console.log('StringTest006 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_007
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_007', 0, function () {
        stringTest = "ä";
        var value = stringTest.localeCompare('fff', 'sv');
        console.log('StringTest007 :' + value);
        expect(value).assertEqual(1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_008
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_008', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('c', 'de', { sensitivity: 'base' });
        console.log('StringTest008 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_009
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_009', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('A', 'de', { sensitivity: 'base' });
        console.log('StringTest009 :' + value);
        expect(value).assertEqual(0);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_010
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_010', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('á', 'de', { sensitivity: 'base' });
        console.log('StringTest010 :' + value);
        expect(value).assertEqual(0);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_011
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_011', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('zz', 'sv', { sensitivity: 'base' });
        console.log('StringTest011 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_012
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_012', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('b', 'de', { sensitivity: 'accent' });
        console.log('StringTest012 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_013
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_013', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('á', 'de', { sensitivity: 'accent' });
        console.log('StringTest013 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_014
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_014', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('A', 'de', { sensitivity: 'accent' });
        console.log('StringTest014 :' + value);
        expect(value).assertEqual(0);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_015
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_015', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('zz', 'sv', { sensitivity: 'accent' });
        console.log('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_015 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_016
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_016', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('c', 'de', { sensitivity: 'case' });
        console.log('StringTest016 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_017
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_017', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('c', 'de', { sensitivity: 'case' });
        console.log('StringTest017 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_018
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_018', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('c', 'de', { sensitivity: 'case' });
        console.log('StringTest018 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_019
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_019', 0, function () {
        stringTest = "a";
        var value = stringTest.localeCompare('c', 'de', { sensitivity: 'case' });
        console.log('StringTest019 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_020
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_020', 0, function () {
        stringTest = "ä";
        var value = stringTest.localeCompare('c', 'de', { sensitivity: 'variant',usage:'sort' });
        console.log('StringTest020 :' + value);
        expect(value).assertEqual(-1);
    })
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_021
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string localeCompare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_021', 0, function () {
        stringTest = "Test";
        var value = stringTest.localeCompare('c', 'de', { sensitivity: 'variant',usage:'search' });
        console.log('StringTest021 :' + value);
        expect(value).assertEqual(1);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_022
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleLowerCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_022', 0, function () {
        stringTest = "TEST";
        var value = stringTest.toLocaleLowerCase();
        console.log('StringTest022 :' + value);
        expect(value).assertEqual("test");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_023
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleLowerCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_023', 0, function () {
        stringTest = "\u0130";
        var value = stringTest.toLocaleLowerCase();
        console.log('StringTest023 :' + value);
        expect(value).assertEqual("i̇");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_024
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleLowerCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_024', 0, function () {
        stringTest = "TEST";
        var value = stringTest.toLocaleLowerCase('tr');
        console.log('StringTest024 :' + value);
        expect(value).assertEqual("test");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_025
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleLowerCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_025', 0, function () {
        stringTest = "i";
        var value = stringTest.toLocaleLowerCase('tr');
        console.log('StringTest025 :' + value);
        expect(value).assertEqual("i");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_026
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleLowerCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_026', 0, function () {
        stringTest = "i";
        var value = stringTest.toLocaleLowerCase('en-US');
        console.log('StringTest026 :' + value);
        expect(value).assertEqual("i");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_027
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleLowerCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_027', 0, function () {
        stringTest = "\u0130";
        var value1 = stringTest.toLocaleLowerCase('en-US');
        var value2 = stringTest.toLocaleLowerCase('tr');
        console.log('StringTest027 :' + value1);
        expect((value1 == value2)).assertFalse();
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_028
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleLowerCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_028', 0, function () {
        stringTest = "\u0130";
        var locales = ['tr', 'TR', 'tr-TR', 'tr-u-co-search', 'tr-x-turkish'];
        var value = stringTest.toLocaleLowerCase(locales);
        console.log('StringTest028 :' + value);
        expect(value).assertEqual("i");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_029
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleUpperCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_029', 0, function () {
        stringTest = "test";
        var value = stringTest.toLocaleUpperCase();
        console.log('StringTest029 :' + value);
        expect(value).assertEqual("TEST");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_030
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleUpperCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_030', 0, function () {
        stringTest = "\u0130";
        var value = stringTest.toLocaleUpperCase();
        console.log('StringTest030 :' + value);
        expect(value).assertEqual("İ");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_031
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleUpperCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_031', 0, function () {
        stringTest = "test";
        var value = stringTest.toLocaleUpperCase('lt-LT');
        console.log('StringTest031 :' + value);
        expect(value).assertEqual("TEST");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_032
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleUpperCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_032', 0, function () {
        stringTest = "\u0130";
        var value = stringTest.toLocaleUpperCase('lt-LT');
        console.log('StringTest032 :' + value);
        expect(value).assertEqual("İ");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_033
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleUpperCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_033', 0, function () {
        stringTest = "\u0130";
        var value = stringTest.toLocaleUpperCase('en-US');
        console.log('StringTest033 :' + value);
        expect(value).assertEqual("İ");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_034
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleUpperCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_034', 0, function () {
        stringTest = "\u0130";
        var value1 = stringTest.toLocaleUpperCase('en-US');
        var value2 = stringTest.toLocaleUpperCase('lt-LT');
        console.log('StringTest034 :' + value1);
        expect((value1 == value2)).assertTrue();
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_STRING_PROTOTYPE_035
     * @tc.name      : Sting Prototype Object
     * @tc.desc      : The current function handles string toLocaleUpperCase
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_STRING_PROTOTYPE_035', 0, function () {
        stringTest = "i\u0307";
        var locales = ['lt', 'LT', 'lt-LT', 'lt-u-co-phonebk', 'lt-x-lietuva'];
        var value = stringTest.toLocaleUpperCase(locales);
        console.log('StringTest035 :' + value);
        expect(value).assertEqual("I");
    })


    console.log('*************number prototype object*************');
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_001
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_001', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString();
        console.log('NumberTest001 :' + value);
        expect(value).assertEqual('123,456.789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_002
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_002', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString('ar-EG');
        console.log('NumberTest002 :' + value);
        expect(value).assertEqual("١٢٣٬٤٥٦٫٧٨٩");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_003
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_003', 0, function () {
        var number = '123456.789';
        var value = number.toLocaleString('ar-EG');
        console.log('NumberTest003 :' + value);
        expect(value).assertEqual("123456.789");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_004
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_004', 0, function () {
        var number = NaN;
        var value = number.toLocaleString('ar-EG');
        console.log('NumberTest004 :' + value);
        expect(value).assertEqual("ليس رقم");
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_005
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_005', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString('de-DE');
        console.log('NumberTest005 :' + value);
        expect(value).assertEqual('123.456,789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_006
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_006', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString('en-IN');
        console.log('NumberTest006 :' + value);
        expect(value).assertEqual('1,23,456.789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_007
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_007', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString('zh-Hans-CN-u-nu-hanidec');
        console.log('NumberTest007 :' + value);
        expect(value).assertEqual('一二三,四五六.七八九');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_008
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_008', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString(['ban', 'id']);
        console.log('NumberTest008 :' + value);
        expect(value).assertEqual('123.456,789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_009
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_009', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString('de-DE', { style: 'currency', currency: 'EUR' });
        console.log('NumberTest009 :' + value);
        expect(value).assertEqual('123.456,79 €');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_010
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_010', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
        console.log('NumberTest010 :' + value);
        expect(value).assertEqual('￥123,457');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_011
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_011', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString('en-IN', { maximumSignificantDigits: 3 });
        console.log('NumberTest011 :' + value);
        expect(value).assertEqual('1,23,000');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_012
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_012', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString(undefined, { maximumSignificantDigits: 3 });
        console.log('NumberTest012 :' + value);
        expect(value).assertEqual('123,000');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_013
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_013', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        console.log('NumberTest013 :' + value);
        expect(value).assertEqual('123,456.79');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_014
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_014', 0, function () {
        try {
            var number = 123456.789;
            var value = number.toLocaleString(undefined, { minimumFractionDigits: 112, maximumFractionDigits: 112 });
            console.log('NumberTest014 :' + value);
        } catch(e) {
            console.log('NumberTest014 Err:' + e);
            expect(e == "RangeError").assertTrue();
        }
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_015
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_015', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString('ja-JP', { style: undefined, currency: undefined});
        console.log('NumberTest015 :' + value);
        expect(value).assertEqual('123,456.789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_016
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_016', 0, function () {
        var number = 123456.789;
        var value = number.toLocaleString({ style: undefined, currency: undefined});
        console.log('NumberTest016 :' + value);
        expect(value).assertEqual('123,456.789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_017
     * @tc.name      : Number Prototype Object
     * @tc.desc      : The current function handles number toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_NUMBER_PROTOTYPE_017', 0, function () {
        var number = -1.3365;
        var value = number.toLocaleString({ style: undefined, currency: undefined});
        console.log('NumberTest016 :' + value);
        expect(value).assertEqual('-1.337');
    })

    console.log('*************bigint prototype object*************');
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_001
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_001', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString();
        console.log('BigintTest001 :' + value);
        expect(value).assertEqual('123,456,789,123,456,789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_002
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_002', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString('de-DE');
        console.log('BigintTest002 :' + value);
        expect(value).assertEqual('123.456.789.123.456.789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_003
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_003', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString('ar-EG');
        console.log('BigintTest003 :' + value);
        expect(value).assertEqual('١٢٣٬٤٥٦٬٧٨٩٬١٢٣٬٤٥٦٬٧٨٩');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_004
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_004', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString('en-IN');
        console.log('BigintTest004 :' + value);
        expect(value).assertEqual('1,23,45,67,89,12,34,56,789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_005
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_005', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString('zh-Hans-CN-u-nu-hanidec');
        console.log('BigintTest005 :' + value);
        expect(value).assertEqual('一二三,四五六,七八九,一二三,四五六,七八九');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_006
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_006', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString(['ban', 'id']);
        console.log('BigintTest006 :' + value);
        expect(value).assertEqual('123.456.789.123.456.789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_007
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_007', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString('de-DE', { style: 'currency', currency: 'EUR' });
        console.log('BigintTest007 :' + value);
        expect(value).assertEqual('123.456.789.123.456.789,00 €');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_008
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_008', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
        console.log('BigintTest008 :' + value);
        expect(value).assertEqual('￥123,456,789,123,456,789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_009
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_009', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString('en-IN', { maximumSignificantDigits: 3 });
        console.log('BigintTest009 :' + value);
        expect(value).assertEqual('1,23,00,00,00,00,00,00,000');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_009
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_010', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString('en-IN', {minimumFractionDigits: 3, maximumSignificantDigits: 3 });
        console.log('BigintTest009 :' + value);
        expect(value).assertEqual('1,23,00,00,00,00,00,00,000');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_011
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_011', 0, function () {
        try {
            var bigint = 123456789123456789n;
            var value = bigint.toLocaleString('en-IN', {minimumFractionDigits: 113, maximumSignificantDigits: 113 });
            console.log('BigintTest011 :' + value);
        } catch(e) {
            console.log('BigintTest011 Err:' + e);
            expect(e == "RangeError").assertTrue();
        }
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_012
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_012', 0, function () {
        try {
            var bigint = 123456789123456789n;
            var value = bigint.toLocaleString('en-IN', {minimumFractionDigits: 113, maximumSignificantDigits: 113 });
            console.log('BigintTest012 :' + value);
        } catch(e) {
            console.log('BigintTest012 Err:' + e);
            expect(e == "RangeError").assertTrue();
        }
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_013
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_013', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString(undefined);
        console.log('BigintTest013 :' + value);
        expect(value).assertEqual('123,456,789,123,456,789');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_014
     * @tc.name      : Bigint Prototype Object
     * @tc.desc      : The current function handles bigint toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_BIGINT_PROTOTYPE_014', 0, function () {
        var bigint = 123456789123456789n;
        var value = bigint.toLocaleString(undefined, { style: undefined, currency: undefined });
        console.log('BigintTest014 :' + value);
        expect(value).assertEqual('123,456,789,123,456,789');
    })

    console.log('*************date prototype object*************');
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_001
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_001', 0, function () {
        let date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        let value = date.toLocaleString('en-US', {timeZone: 'UTC'});
        let zerotime = "10/20/2022, 6:00:00 PM";
        expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_002
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_002', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleString('en-GB', {timeZone: 'UTC'});
        var zerotime = "20/10/2022, 18:00:00";
        expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_003
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_003', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleString('ko-KR', {timeZone: 'UTC'});
        var zerotime = "2022. 10. 20. 오후 6:00:00";
        expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_004
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_004', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleString('en-GB', { timeZone: 'UTC' });
        console.log('DateTest004 :' + value);
        expect(value).assertEqual('20/10/2022, 18:00:00');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_005
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_005', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleString('ko-KR', { timeZone: 'UTC' });
        console.log('DateTest005 :' + value);
        expect(value).assertEqual('2022. 10. 20. 오후 6:00:00');
    })
    
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_006
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_006', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var zerotime = "2022/10/20 下午6:00:00";
        let value = date.toLocaleString('zh', { timeZone: 'UTC' });
        expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_007
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_007', 0, function () {
        var date = new Date(0);
        var value = date.toLocaleString('zh', { timeZone: 'UTC' });
        console.log('DateTest007 :' + value);
        expect(value).assertEqual('1970/1/1 上午12:00:00');
    })
    
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_008
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_008', 0, function () {
        var date = new Date(0);
        var value = date.toLocaleString('zh', { timeZone: 'UTC', weekday: 'long', year: 'numeric', month: 'long',
            day: 'numeric'});
        console.log('DateTest008 :' + value);
        expect(value).assertEqual('1970年1月1日星期四');

    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_008
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_009', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleString('zh', { hour12: false, weekday: 'long', year: 'numeric', month: 'long',
            day: 'numeric', timeZone: 'UTC' });
        console.log('DateTest009 :' + value);
        expect(value).assertEqual('2022年10月20日星期四');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_010
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_010', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleString('zh', { hour12: true, weekday: 'long', year: 'numeric', month: 'long',
            day: 'numeric', timeZone: 'UTC'});
        console.log('DateTest010 :' + value);
        expect(value).assertEqual('2022年10月20日星期四');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_011
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleDateString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_011', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleDateString('zh', { timeZone: 'UTC' });
        console.log('DateTest011 :' + value);
        expect(value).assertEqual('2022/10/20');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_012
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleDateString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_012', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleDateString('de-DE', { timeZone: 'UTC' });
        console.log('DateTest012 :' + value);
        expect(value).assertEqual('20.10.2022');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_013
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleDateString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_013', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleDateString('ja', { timeZone: 'UTC' });
        console.log('DateTest013 :' + value);
        expect(value).assertEqual('2022/10/20');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_014
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleDateString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_014', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleDateString('de-DE', { timeZone: 'UTC' });
        console.log('DateTest014 :' + value);
        expect(value).assertEqual('20.10.2022');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_015
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleDateString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_015', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleDateString(undefined, { hour12: true, weekday: 'long', year: 'numeric',
            month: 'long', day: 'numeric', timeZone: 'UTC' });
        console.log('DateTest015 :' + value);
        expect(value).assertEqual('Thursday, October 20, 2022');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_016
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleDateString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_016', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleDateString('de-DE', { hour12: false, weekday: 'long', year: 'numeric', month: 'long',
            day: 'numeric', timeZone: 'UTC' });
        var zerotime = "Donnerstag, 20. Oktober 2022";
        expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_017
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleTimeString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_017', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        let value = date.toLocaleTimeString('en-US', { timeZone: 'UTC' });
        let zerotime = "6:00:00 PM";
        expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_018
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleTimeString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_018', 0, function () {
        try {
            var date = new Date('August 19, 1975 23:15:30 GMT+00:00');
            var value = date.toLocaleTimeString('en-US');
            console.log('DateTest018 :' + value);
        } catch(e) {
            console.log('DateTest018 Err:' + e);
            expect(e == "RangeError").assertTrue();
        }
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_019
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleTimeString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_019', 0, function () {
        try { 
            var date = new Date('August 19, 1975 23:15:30 GMT+00:00');
            var value = date.toLocaleTimeString('it-IT');
            console.log('DateTest019 :' + value);
        } catch(e) {
            console.log('DateTest018 Err:' + e);
            expect(e == "RangeError").assertTrue();
        }
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_020
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleTimeString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_020', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleTimeString('it-IT', { timeZone: 'UTC' });
        var zerotime = "18:00:00";
        console.log('DateTest020 :' + value);
        expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_020
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleTimeString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_021', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 18, 0, 0));
        var value = date.toLocaleTimeString('it-IT', { hour12: false, timeZone: 'UTC', timeZoneName: 'short' });
        var zerotime = "18:00:00 UTC";
        console.log('DateTest021 :' + value);
        expect(value).assertEqual(zerotime);
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_DATE_PROTOTYPE_018
     * @tc.name      : Date Prototype Object
     * @tc.desc      : The current function handles date toLocaleTimeString 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_DATE_PROTOTYPE_022', 0, function () {
        var date = new Date(Date.UTC(2022, 9, 20, 20, 0, 0));
        let value = date.toLocaleTimeString('en-US', { timeZone: 'UTC' });
        let zerotime = "8:00:00 PM";
        expect(value).assertEqual(zerotime);
    })

    console.log('*************array prototype object*************');
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_001
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_001', 0, function () {
        var array = [1, 'a', new Date('21 Dec 2022 14:12:00 UTC')];
        var value = array.toLocaleString('en', { timeZone: 'UTC' });
        console.log('ArrayTest001 :' + value);
        expect(value).assertEqual('1,a,12/21/2022, 2:12:00 PM');
    })
    
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_002
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_002', 0, function () {
        var array = [1, 'a', new Date('21 Dec 2022 14:12:00 UTC')];
        var value = array.toLocaleString('en', { timeZone: 'UTC' });
        console.log('ArrayTest002 :' + value);
        expect(value).assertEqual('1,a,12/21/2022, 2:12:00 PM');
    })
    
    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_003
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_003', 0, function () {
        var array = [1, 'a', new Date('21 Dec 2022 14:12:00 UTC')];
        var value = array.toLocaleString('en', { timeZone: 'UTC' });
        console.log('ArrayTest003 :' + value);
        expect(value).assertEqual('1,a,12/21/2022, 2:12:00 PM');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_004
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_004', 0, function () {
        var array = [1, 'a', '测试'];
        var value = array.toLocaleString('zh');
        console.log('ArrayTest004 :' + value);
        expect(value).assertEqual('1,a,测试');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_005
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_005', 0, function () {
        var array = [1, 'a', '测试', undefined];
        var value = array.toLocaleString('zh');
        console.log('ArrayTest005 :' + value);
        expect(value).assertEqual('1,a,测试,');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_006
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_006', 0, function () {
        try {
            var array = undefined;
            var value = array.toLocaleString();
        } catch(e) {
            console.log('ArrayTest006 :' + e);
            expect(e == "TypeError: Cannot read property toLocaleString of undefined").assertTrue();
        }
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_007
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_007', 0, function () {
        var array = ['￥7', 500, 8123, 12];
        var value = array.toLocaleString('ja-JP');
        console.log('ArrayTest007 :' + value);
        expect(value).assertEqual('￥7,500,8,123,12');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_008
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_008', 0, function () {
        var array = ['￥7', 500, 8123, 12];
        var value = array.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
        console.log('ArrayTest008 :' + value);
        expect(value).assertEqual('￥7,￥500,￥8,123,￥12');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_009
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_009', 0, function () {
        var array = ['￥7', 500, 8123, 12, undefined];
        var value = array.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY', timeZone: "UTC" });
        console.log('ArrayTest009 :' + value);
        expect(value).assertEqual('￥7,￥500,￥8,123,￥12,');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_010
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_010', 0, function () {
        var array = [];
        var value = array.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
        console.log('ArrayTest010 :' + value);
        expect(value).assertEqual('');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_011
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_011', 0, function () {
        var array = [1, , 3, ,"ABC"];
        var value = array.toLocaleString('en');
        console.log('ArrayTest011 :' + value);
        expect(value).assertEqual('1,,3,,ABC');
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_012
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_012', 0, function () {
        var array = [{a:1},{b:2}];
        var value = array.toLocaleString('en');
        console.log('ArrayTest012 :' + value);
        expect(value.length == 31).assertTrue();
        expect(value == '[object Object],[object Object]').assertTrue();
    })

    /**
     * @tc.number    : SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_013
     * @tc.name      : Array Prototype Object
     * @tc.desc      : The current function handles array toLocaleString
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('SUB_ARK_ETS_INTL_ARRAY_PROTOTYPE_013', 0, function () {
        var array = { length:3, 0:1, 1:2, 2:3 };
        var value = Array.prototype.toLocaleString.call(array);
        console.log('ArrayTest013 :' + value);
        expect(value).assertEqual('1,2,3');
    })
    console.log('*************end IntlPPtsFunTest*************');
})
}