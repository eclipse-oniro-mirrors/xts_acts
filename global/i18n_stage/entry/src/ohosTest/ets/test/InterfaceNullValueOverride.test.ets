import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n, intl } from '@kit.LocalizationKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function InterfaceNullValueOverrideTest() {
  describe('InterfaceNullValueOverrideTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name getDisplayCountry_null_test_0100
     * @tc.number getDisplayCountry_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayCountry_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.getDisplayCountry(null, "en-US", true);
        console.log('getDisplayCountry_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getDisplayCountry_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getDisplayCountry_null_test_0200
     * @tc.number getDisplayCountry_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayCountry_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getDisplayCountry('zh-Hans-CN', null, true);
        console.log('getDisplayCountry_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getDisplayCountry_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getDisplayCountry_nullString_test_0100
     * @tc.number getDisplayCountry_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayCountry_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.getDisplayCountry('', "en-US", true);
      console.log('getDisplayCountry_nullString_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name getDisplayCountry_nullString_test_0200
     * @tc.number getDisplayCountry_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayCountry_nullString_test_0200', Level.LEVEL3, () => {
      let value = i18n.getDisplayCountry('zh-Hans-CN', "", true);
      console.log('getDisplayCountry_nullString_test_0200 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name getDisplayLanguage_null_test_0100
     * @tc.number getDisplayLanguage_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayLanguage_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.getDisplayLanguage(null, "en-US");
        console.log('getDisplayLanguage_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getDisplayLanguage_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getDisplayLanguage_null_test_0200
     * @tc.number getDisplayLanguage_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayLanguage_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getDisplayLanguage('zh-Hans-CN', null);
        console.log('getDisplayLanguage_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getDisplayLanguage_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getDisplayLanguage_nullString_test_0100
     * @tc.number getDisplayLanguage_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayLanguage_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.getDisplayLanguage('', "en-US");
      console.log('getDisplayLanguage_nullString_test_0100 value:', value);
      expect(value).assertEqual('Unknown language');
    })

    /**
     * @tc.name getDisplayLanguage_nullString_test_0200
     * @tc.number getDisplayLanguage_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayLanguage_nullString_test_0200', Level.LEVEL3, () => {
      let value = i18n.getDisplayLanguage('zh-Hans-CN', '');
      console.log('getDisplayLanguage_nullString_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name system_getDisplayCountry_null_test_0100
     * @tc.number system_getDisplayCountry_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayCountry_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayCountry(null, "en-US", true);
        console.log('system_getDisplayCountry_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayCountry_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getDisplayCountry_null_test_0200
     * @tc.number system_getDisplayCountry_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayCountry_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayCountry('zh-Hans-CN', null, true);
        console.log('system_getDisplayCountry_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayCountry_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getDisplayCountry_nullString_test_0100
     * @tc.number system_getDisplayCountry_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayCountry_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.System.getDisplayCountry('', "en-US", true);
      console.log('system_getDisplayCountry_nullString_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name system_getDisplayCountry_nullString_test_0200
     * @tc.number system_getDisplayCountry_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayCountry_nullString_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayCountry('zh-Hans-CN', '', true);
        console.log('system_getDisplayCountry_nullString_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayCountry_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name system_getDisplayLanguage_null_test_0100
     * @tc.number system_getDisplayLanguage_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayLanguage_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayLanguage(null, "en-US");
        console.log('system_getDisplayLanguage_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayLanguage_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getDisplayLanguage_null_test_0200
     * @tc.number system_getDisplayLanguage_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayLanguage_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayLanguage('zh-Hans-CN', null);
        console.log('system_getDisplayLanguage_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayLanguage_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getDisplayLanguage_nullString_test_0100
     * @tc.number system_getDisplayLanguage_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayLanguage_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.System.getDisplayLanguage('', "en-US");
      console.log('system_getDisplayLanguage_nullString_test_0100 value:', value);
      expect(value).assertEqual('Unknown language');
    })

    /**
     * @tc.name system_getDisplayLanguage_nullString_test_0200
     * @tc.number system_getDisplayLanguage_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayLanguage_nullString_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayLanguage('zh-Hans-CN', '');
        console.log('system_getDisplayLanguage_nullString_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayLanguage_nullString_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name system_getSystemCountries_null_test_0100
     * @tc.number system_getSystemCountries_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getSystemCountries_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getSystemCountries(null);
        console.log('system_getSystemCountries_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getSystemCountries_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getSystemCountries_nullString_test_0100
     * @tc.number system_getSystemCountries_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getSystemCountries_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.System.getSystemCountries('');
      console.log('system_getSystemCountries_nullString_test_0100 value:', value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name system_isSuggested_null_test_0100
     * @tc.number system_isSuggested_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_isSuggested_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.isSuggested(null, 'CN');
        console.log('system_isSuggested_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_isSuggested_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_isSuggested_null_test_0200
     * @tc.number system_isSuggested_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_isSuggested_null_test_0200', Level.LEVEL3, () => {
      let value = i18n.System.isSuggested('zh', null);
      console.log('system_isSuggested_null_test_0200 value:', value);
      expect(value).assertEqual(true);
    })

    /**
     * @tc.name system_isSuggested_nullString_test_0100
     * @tc.number system_isSuggested_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_isSuggested_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.System.isSuggested('', 'CN');
      console.log('system_isSuggested_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name system_isSuggested_nullString_test_0200
     * @tc.number system_isSuggested_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_isSuggested_nullString_test_0200', Level.LEVEL3, () => {
      let value = i18n.System.isSuggested('zh', '');
      console.log('system_isSuggested_nullString_test_0200 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name system_setAppPreferredLanguage_null_test_0100
     * @tc.number system_setAppPreferredLanguage_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_setAppPreferredLanguage_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.setAppPreferredLanguage(null);
        console.log('system_setAppPreferredLanguage_null_test_0100 value:', value);
        expect(typeof(value)).assertFail();
      } catch (e) {
        console.log('system_setAppPreferredLanguage_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_setAppPreferredLanguage_nullString_test_0100
     * @tc.number system_setAppPreferredLanguage_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_setAppPreferredLanguage_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.setAppPreferredLanguage('');
        console.log('system_setAppPreferredLanguage_nullString_test_0100 value:', value);
        expect(typeof(value)).assertFail();
      } catch (e) {
        console.log('system_setAppPreferredLanguage_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name system_getSimplifiedLanguage_null_test_0100
     * @tc.number system_getSimplifiedLanguage_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getSimplifiedLanguage_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.System.getSimplifiedLanguage(null);
      console.log('system_getSimplifiedLanguage_null_test_0100 value:', value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name system_getSimplifiedLanguage_nullString_test_0100
     * @tc.number system_getSimplifiedLanguage_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getSimplifiedLanguage_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getSimplifiedLanguage('');
        console.log('system_getSimplifiedLanguage_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getSimplifiedLanguage_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name unitConvert_null_test_0100
     * @tc.number unitConvert_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: null, measureSystem: null},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        1000,
        'zh-CN',
        'long');
      console.log('unitConvert_null_test_0100 value:', value);
      expect(value).assertEqual('1,000');
    })

    /**
     * @tc.name unitConvert_null_test_0200
     * @tc.number unitConvert_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_null_test_0200', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: null, measureSystem: null},
        1000,
        'zh-CN',
        'long');
      console.log('unitConvert_null_test_0200 value:', value);
      expect(value).assertEqual('1,000米');
    })

    /**
     * @tc.name unitConvert_null_test_0300
     * @tc.number unitConvert_null_test_0300
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_null_test_0300', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        null,
        'zh-CN',
        'long');
      console.log('unitConvert_null_test_0300 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name unitConvert_null_test_0400
     * @tc.number unitConvert_null_test_0400
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_null_test_0400', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        1000,
        null,
        'long');
      console.log('unitConvert_null_test_0400 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name unitConvert_null_test_0500
     * @tc.number unitConvert_null_test_0500
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_null_test_0500', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        1000,
        'zh-CN',
        null);
      console.log('unitConvert_null_test_0500 value:', value);
      expect(value).assertEqual('1,000米');
    })

    /**
     * @tc.name unitConvert_nullString_test_0100
     * @tc.number unitConvert_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: '', measureSystem: ''},
        1000,
        'zh-CN',
        'long');
      console.log('unitConvert_nullString_test_0100 value:', value);
      expect(value).assertEqual('1,000米');
    })

    /**
     * @tc.name unitConvert_nullString_test_0200
     * @tc.number unitConvert_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_nullString_test_0200', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        1000,
        '',
        'long');
      console.log('unitConvert_nullString_test_0200 value:', value);
      expect(value).assertEqual('1,000米');
    })

    /**
     * @tc.name unitConvert_nullString_test_0300
     * @tc.number unitConvert_nullString_test_0300
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_nullString_test_0300', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        1000,
        'zh-CN',
        '');
      console.log('unitConvert_nullString_test_0300 value:', value);
      expect(value).assertEqual('1,000米');
    })

    /**
     * @tc.name getDateOrder_null_test_0100
     * @tc.number getDateOrder_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDateOrder_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.getDateOrder(null);
      console.log('getDateOrder_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getDateOrder_nullString_test_0100
     * @tc.number getDateOrder_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDateOrder_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.getDateOrder('');
      console.log('getDateOrder_nullString_test_0100 value:', value);
      expect(value).assertEqual('y-LLL-d');
    })

    /**
     * @tc.name getTimePeriodName_null_test_0100
     * @tc.number getTimePeriodName_null_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimePeriodName_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getTimePeriodName(null, 'en-US');
        console.log('getTimePeriodName_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getTimePeriodName_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getTimePeriodName_null_test_0200
     * @tc.number getTimePeriodName_null_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimePeriodName_null_test_0200', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.getTimePeriodName(5, null);
      console.log('getTimePeriodName_null_test_0200 value:', value);
      expect(value).assertEqual('早上');
    })

    /**
     * @tc.name getTimePeriodName_nullString_test_0100
     * @tc.number getTimePeriodName_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimePeriodName_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getTimePeriodName(5, '');
        console.log('getTimePeriodName_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getTimePeriodName_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name getBestMatchLocale_null_test_0100
     * @tc.number getBestMatchLocale_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getBestMatchLocale_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.getBestMatchLocale(null, ['zh-Hant-CN']);
      console.log('getBestMatchLocale_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getBestMatchLocale_null_test_0200
     * @tc.number getBestMatchLocale_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getBestMatchLocale_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getBestMatchLocale("en-US", null);
        console.log('getBestMatchLocale_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getBestMatchLocale_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getBestMatchLocale_nullString_test_0100
     * @tc.number getBestMatchLocale_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getBestMatchLocale_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getBestMatchLocale("", null);
        console.log('getBestMatchLocale_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getBestMatchLocale_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name getThreeLetterLanguage_null_test_0100
     * @tc.number getThreeLetterLanguage_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getThreeLetterLanguage_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getThreeLetterLanguage(null);
        console.log('getThreeLetterLanguage_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getThreeLetterLanguage_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getThreeLetterLanguage_nullString_test_0100
     * @tc.number getThreeLetterLanguage_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getThreeLetterLanguage_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getThreeLetterLanguage('');
        console.log('getThreeLetterLanguage_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getThreeLetterLanguage_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name getThreeLetterRegion_null_test_0100
     * @tc.number getThreeLetterRegion_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getThreeLetterRegion_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getThreeLetterRegion(null);
        console.log('getThreeLetterRegion_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getThreeLetterRegion_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getThreeLetterRegion_nullString_test_0100
     * @tc.number getThreeLetterRegion_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getThreeLetterRegion_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getThreeLetterRegion('');
        console.log('getThreeLetterRegion_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getThreeLetterRegion_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name getUnicodeWrappedFilePath_null_test_0100
     * @tc.number getUnicodeWrappedFilePath_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getUnicodeWrappedFilePath_null_test_0100', Level.LEVEL3, () => {
      try {
        let delimiter: string = '/';
        let local: Intl.Locale = new Intl.Locale("zh");
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(null, delimiter, local);
        console.log('getUnicodeWrappedFilePath_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getUnicodeWrappedFilePath_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getUnicodeWrappedFilePath_null_test_0200
     * @tc.number getUnicodeWrappedFilePath_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getUnicodeWrappedFilePath_null_test_0200', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let local: Intl.Locale = new Intl.Locale("zh");
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, null, local);
        console.log('getUnicodeWrappedFilePath_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getUnicodeWrappedFilePath_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getUnicodeWrappedFilePath_null_test_0300
     * @tc.number getUnicodeWrappedFilePath_null_test_0300
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getUnicodeWrappedFilePath_null_test_0300', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '/';
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, null);
        console.log('getUnicodeWrappedFilePath_null_test_0300 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getUnicodeWrappedFilePath_null_test_0300 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getUnicodeWrappedFilePath_nullString_test_0100
     * @tc.number getUnicodeWrappedFilePath_nullString_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getUnicodeWrappedFilePath_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let path: string = '';
        let delimiter: string = '/';
        let local: Intl.Locale = new Intl.Locale("zh");
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, local);
        console.log('getUnicodeWrappedFilePath_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getUnicodeWrappedFilePath_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name getUnicodeWrappedFilePath_nullString_test_0200
     * @tc.number getUnicodeWrappedFilePath_nullString_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getUnicodeWrappedFilePath_nullString_test_0200', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '';
        let local: Intl.Locale = new Intl.Locale("zh");
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, local);
        console.log('getUnicodeWrappedFilePath_nullString_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getUnicodeWrappedFilePath_nullString_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name PhoneNumberFormat_isValidNumber_null_test_0100
     * @tc.number PhoneNumberFormat_isValidNumber_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_isValidNumber_null_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.isValidNumber(null);
      console.log('PhoneNumberFormat_isValidNumber_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name PhoneNumberFormat_isValidNumber_nullString_test_0100
     * @tc.number PhoneNumberFormat_isValidNumber_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_isValidNumber_nullString_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.isValidNumber('');
      console.log('PhoneNumberFormat_isValidNumber_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name PhoneNumberFormat_format_null_test_0100
     * @tc.number PhoneNumberFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_format_null_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.format(null);
      console.log('PhoneNumberFormat_format_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name PhoneNumberFormat_format_nullString_test_0100
     * @tc.number PhoneNumberFormat_format_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_format_nullString_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.format('');
      console.log('PhoneNumberFormat_format_nullString_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name PhoneNumberFormat_getLocationName_null_test_0100
     * @tc.number PhoneNumberFormat_getLocationName_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_getLocationName_null_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.getLocationName(null, 'zh-CN');
      console.log('PhoneNumberFormat_getLocationName_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name PhoneNumberFormat_getLocationName_null_test_0200
     * @tc.number PhoneNumberFormat_getLocationName_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_getLocationName_null_test_0200', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.getLocationName('027-5937411', null);
      console.log('PhoneNumberFormat_getLocationName_null_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name PhoneNumberFormat_getLocationName_nullString_test_0100
     * @tc.number PhoneNumberFormat_getLocationName_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_getLocationName_nullString_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.getLocationName('', 'zh-CN');
      console.log('PhoneNumberFormat_getLocationName_nullString_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name PhoneNumberFormat_getLocationName_nullString_test_0200
     * @tc.number PhoneNumberFormat_getLocationName_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_getLocationName_nullString_test_0200', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.getLocationName('027-5937411', '');
      console.log('PhoneNumberFormat_getLocationName_nullString_test_0200 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name getCalendar_null_test_0100
     * @tc.number getCalendar_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCalendar_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar(null, 'chinese');
      let value = calendar.getDisplayName('zh');
      console.log('getCalendar_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getCalendar_null_test_0200
     * @tc.number getCalendar_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCalendar_null_test_0200', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh', null);
      let value = calendar.getDisplayName('zh');
      console.log('getCalendar_null_test_0200 value:', value);
      expect(value).assertEqual('公历');
    })

    /**
     * @tc.name getCalendar_nullString_test_0100
     * @tc.number getCalendar_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCalendar_nullString_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('', 'chinese');
      let value = calendar.getDisplayName('zh');
      console.log('getCalendar_nullString_test_0100 value:', value);
      expect(value).assertEqual('农历');
    })

    /**
     * @tc.name getCalendar_nullString_test_0200
     * @tc.number getCalendar_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCalendar_nullString_test_0200', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh', '');
      let value = calendar.getDisplayName('zh');
      console.log('getCalendar_nullString_test_0200 value:', value);
      expect(value).assertEqual('公历');
    })

    /**
     * @tc.name calendar_setTime_null_test_0100
     * @tc.number calendar_setTime_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setTime_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.setTime(null);
      console.log('calendar_setTime_null_test_0100 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_null_test_0100
     * @tc.number calendar_set_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(null, 11, 11, 8, 0, 0);
      console.log('calendar_set_null_test_0100 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_null_test_0200
     * @tc.number calendar_set_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_null_test_0200', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, null, 11, 8, 0, 0);
      console.log('calendar_set_null_test_0200 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_null_test_0300
     * @tc.number calendar_set_null_test_0300
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_null_test_0300', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, 11, null, 8, 0, 0);
      console.log('calendar_set_null_test_0300 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_null_test_0400
     * @tc.number calendar_set_null_test_0400
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_null_test_0400', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, 11, 11, null, 0, 0);
      console.log('calendar_set_null_test_0400 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_null_test_0500
     * @tc.number calendar_set_null_test_0500
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_null_test_0500', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, 11, 11, 8, null, 0);
      console.log('calendar_set_null_test_0500 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_null_test_0600
     * @tc.number calendar_set_null_test_0600
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_null_test_0600', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, 11, 11, 8, 0, null);
      console.log('calendar_set_null_test_0600 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_setTimeZone_null_test_0100
     * @tc.number calendar_setTimeZone_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setTimeZone_null_test_0100', Level.LEVEL3, () => {
      let calendar: i18n.Calendar = i18n.getCalendar('zh');
      calendar.setTimeZone(null);
      let value: string = calendar.getTimeZone();
      console.log('calendar_setTimeZone_null_test_0100 value:', value);
      expect(value).assertEqual('CST');
    })

    /**
     * @tc.name calendar_setTimeZone_nullString_test_0100
     * @tc.number calendar_setTimeZone_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setTimeZone_nullString_test_0100', Level.LEVEL3, () => {
      let calendar: i18n.Calendar = i18n.getCalendar('zh');
      calendar.setTimeZone('');
      let value: string = calendar.getTimeZone();
      console.log('calendar_setTimeZone_nullString_test_0100 value:', value);
      expect(value).assertEqual('Etc/Unknown');
    })

    /**
     * @tc.name calendar_setFirstDayOfWeek_null_test_0100
     * @tc.number calendar_setFirstDayOfWeek_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setFirstDayOfWeek_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh');
      calendar.setFirstDayOfWeek(null);
      let value = calendar.getFirstDayOfWeek();
      console.log('calendar_setFirstDayOfWeek_null_test_0100 value:', value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name calendar_setMinimalDaysInFirstWeek_null_test_0100
     * @tc.number calendar_setMinimalDaysInFirstWeek_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setMinimalDaysInFirstWeek_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh');
      calendar.setMinimalDaysInFirstWeek(null);
      let value = calendar.getMinimalDaysInFirstWeek();
      console.log('calendar_setMinimalDaysInFirstWeek_null_test_0100 value:', value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name calendar_get_null_test_0100
     * @tc.number calendar_get_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_get_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      calendar.set(2021, 11, 11, 8, 0, 0);
      let value = calendar.get(null);
      console.log('calendar_get_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name calendar_get_nullString_test_0100
     * @tc.number calendar_get_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_get_nullString_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      calendar.set(2021, 11, 11, 8, 0, 0);
      let value = calendar.get('');
      console.log('calendar_get_nullString_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name calendar_getDisplayName_null_test_0100
     * @tc.number calendar_getDisplayName_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_getDisplayName_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh', 'chinese');
      let value = calendar.getDisplayName(null);
      console.log('calendar_getDisplayName_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name calendar_getDisplayName_nullString_test_0100
     * @tc.number calendar_getDisplayName_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_getDisplayName_nullString_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh', 'chinese');
      let value = calendar.getDisplayName('');
      console.log('calendar_getDisplayName_nullString_test_0100 value:', value);
      expect(value).assertEqual('chinese');
    })

    /**
     * @tc.name calendar_isWeekend_null_test_0100
     * @tc.number calendar_isWeekend_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_isWeekend_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh');
      let value = calendar.isWeekend(null);
      console.log('calendar_isWeekend_null_test_0100 value:', value);
      expect(typeof(value)).assertEqual('boolean');
    })

    /**
     * @tc.name calendar_add_null_test_0100
     * @tc.number calendar_add_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_add_null_test_0100', Level.LEVEL3, () => {
      try {
        let calendar = i18n.getCalendar('zh-CN');
        calendar.set(2021, 11, 11, 8, 0, 0);
        calendar.add(null, 8);
        let value = calendar.get('year');
        console.log('calendar_add_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('calendar_add_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name calendar_add_null_test_0200
     * @tc.number calendar_add_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_add_null_test_0200', Level.LEVEL3, () => {
      try {
        let calendar = i18n.getCalendar('zh-CN');
        calendar.set(2021, 11, 11, 8, 0, 0);
        calendar.add('year', null);
        let value = calendar.get('year');
        console.log('calendar_add_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('calendar_add_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name calendar_add_nullString_test_0100
     * @tc.number calendar_add_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_add_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let calendar = i18n.getCalendar('zh-CN');
        calendar.set(2021, 11, 11, 8, 0, 0);
        calendar.add('', 8);
        let value = calendar.get('year');
        console.log('calendar_add_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('calendar_add_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name calendar_compareDays_null_test_0100
     * @tc.number calendar_compareDays_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_compareDays_null_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.compareDays(null);
      console.log('calendar_compareDays_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isRTL_null_test_0100
     * @tc.number isRTL_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isRTL_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.isRTL(null);
      console.log('isRTL_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isRTL_nullString_test_0100
     * @tc.number isRTL_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isRTL_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.isRTL('');
      console.log('isRTL_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name getLineInstance_null_test_0100
     * @tc.number getLineInstance_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getLineInstance_null_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance(null);
      iterator.setLineBreakText('123');
      let value = iterator.last();
      console.log('getLineInstance_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getLineInstance_nullString_test_0100
     * @tc.number getLineInstance_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getLineInstance_nullString_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('');
      iterator.setLineBreakText('123');
      let value = iterator.last();
      console.log('getLineInstance_nullString_test_0100 value:', value);
      expect(value).assertEqual(3);
    })

    /**
     * @tc.name next_null_test_0100
     * @tc.number next_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('next_null_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('123');
      let value = iterator.next(null);
      console.log('next_null_test_0100 value:', value);
      expect(value).assertEqual(3);
    })

    /**
     * @tc.name setLineBreakText_null_test_0100
     * @tc.number setLineBreakText_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('setLineBreakText_null_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText(null);
      let value = iterator.last();
      console.log('setLineBreakText_null_test_0100 value:', value);
      expect(value).assertEqual(0);
    })

    /**
     * @tc.name setLineBreakText_nullString_test_0100
     * @tc.number setLineBreakText_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('setLineBreakText_nullString_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('');
      let value = iterator.last();
      console.log('setLineBreakText_nullString_test_0100 value:', value);
      expect(value).assertEqual(0);
    })

    /**
     * @tc.name following_null_test_0100
     * @tc.number following_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('following_null_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('123');
      let value = iterator.following(null);
      console.log('following_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isBoundary_null_test_0100
     * @tc.number isBoundary_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isBoundary_null_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('123');
      let value = iterator.isBoundary(null);
      console.log('isBoundary_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getInstance_null_test_0100
     * @tc.number getInstance_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getInstance_null_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance(null);
      let value = index.getIndex('z');
      console.log('getInstance_null_test_0100 value:', value);
      expect(value).assertEqual('Z');
    })

    /**
     * @tc.name getInstance_nullString_test_0100
     * @tc.number getInstance_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getInstance_nullString_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance('');
      let value = index.getIndex('z');
      console.log('getInstance_nullString_test_0100 value:', value);
      expect(value).assertEqual('Z');
    })

    /**
     * @tc.name addLocale_null_test_0100
     * @tc.number addLocale_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('addLocale_null_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance('zh');
      index.addLocale(null);
      let value = index.getIndex('a');
      console.log('addLocale_null_test_0100 value:', value);
      expect(value).assertEqual('A');
    })

    /**
     * @tc.name addLocale_nullString_test_0100
     * @tc.number addLocale_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('addLocale_nullString_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance('zh');
      index.addLocale('');
      let value = index.getIndex('a');
      console.log('addLocale_nullString_test_0100 value:', value);
      expect(value).assertEqual('A');
    })

    /**
     * @tc.name getIndex_null_test_0100
     * @tc.number getIndex_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getIndex_null_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance('zh');
      let value = index.getIndex(null);
      console.log('getIndex_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getIndex_nullString_test_0100
     * @tc.number getIndex_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getIndex_nullString_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance('zh');
      let value = index.getIndex('');
      console.log('getIndex_nullString_test_0100 value:', value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name isDigit_null_test_0100
     * @tc.number isDigit_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isDigit_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isDigit(null);
      console.log('isDigit_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isDigit_nullString_test_0100
     * @tc.number isDigit_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isDigit_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isDigit('');
      console.log('isDigit_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name isSpaceChar_null_test_0100
     * @tc.number isSpaceChar_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isSpaceChar_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isSpaceChar(null);
      console.log('isSpaceChar_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isSpaceChar_nullString_test_0100
     * @tc.number isSpaceChar_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isSpaceChar_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isSpaceChar('');
      console.log('isSpaceChar_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name isWhitespace_null_test_0100
     * @tc.number isWhitespace_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isWhitespace_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isWhitespace(null);
      console.log('isWhitespace_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isWhitespace_nullString_test_0100
     * @tc.number isWhitespace_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isWhitespace_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isWhitespace('');
      console.log('isWhitespace_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name character_isRTL_null_test_0100
     * @tc.number character_isRTL_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('character_isRTL_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isRTL(null);
      console.log('character_isRTL_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name character_isRTL_nullString_test_0100
     * @tc.number character_isRTL_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('character_isRTL_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isRTL('');
      console.log('character_isRTL_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name isIdeograph_null_test_0100
     * @tc.number isIdeograph_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isIdeograph_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isIdeograph(null);
      console.log('isIdeograph_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isIdeograph_nullString_test_0100
     * @tc.number isIdeograph_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isIdeograph_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isIdeograph('');
      console.log('isIdeograph_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name isLetter_null_test_0100
     * @tc.number isLetter_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isLetter_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isLetter(null);
      console.log('isLetter_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isLetter_nullString_test_0100
     * @tc.number isLetter_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isLetter_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isLetter('');
      console.log('isLetter_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name isLowerCase_null_test_0100
     * @tc.number isLowerCase_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isLowerCase_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isLowerCase(null);
      console.log('isLowerCase_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isLowerCase_nullString_test_0100
     * @tc.number isLowerCase_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isLowerCase_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isLowerCase('');
      console.log('isLowerCase_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name isUpperCase_null_test_0100
     * @tc.number isUpperCase_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isUpperCase_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isUpperCase(null);
      console.log('isUpperCase_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isUpperCase_nullString_test_0100
     * @tc.number isUpperCase_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isUpperCase_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isUpperCase('');
      console.log('isUpperCase_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name getType_null_test_0100
     * @tc.number getType_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getType_null_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.getType(null);
      console.log('getType_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getType_nullString_test_0100
     * @tc.number getType_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getType_nullString_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.getType('');
      console.log('getType_nullString_test_0100 value:', value);
      expect(value).assertEqual('U_UNASSIGNED');
    })

    /**
     * @tc.name Unicode_isDigit_null_test_0100
     * @tc.number Unicode_isDigit_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isDigit_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isDigit(null);
      console.log('Unicode_isDigit_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isDigit_nullString_test_0100
     * @tc.number Unicode_isDigit_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isDigit_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isDigit('');
      console.log('Unicode_isDigit_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name Unicode_isSpaceChar_null_test_0100
     * @tc.number Unicode_isSpaceChar_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isSpaceChar_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isSpaceChar(null);
      console.log('Unicode_isSpaceChar_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isSpaceChar_nullString_test_0100
     * @tc.number Unicode_isSpaceChar_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isSpaceChar_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isSpaceChar('');
      console.log('Unicode_isSpaceChar_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name Unicode_isWhitespace_null_test_0100
     * @tc.number Unicode_isWhitespace_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isWhitespace_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isWhitespace(null);
      console.log('Unicode_isWhitespace_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isWhitespace_nullString_test_0100
     * @tc.number Unicode_isWhitespace_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isWhitespace_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isWhitespace('');
      console.log('Unicode_isWhitespace_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name Unicode_isRTL_null_test_0100
     * @tc.number Unicode_isRTL_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isRTL_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isRTL(null);
      console.log('Unicode_isRTL_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isRTL_nullString_test_0100
     * @tc.number Unicode_isRTL_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isRTL_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isRTL('');
      console.log('Unicode_isRTL_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name Unicode_isIdeograph_null_test_0100
     * @tc.number Unicode_isIdeograph_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isIdeograph_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isIdeograph(null);
      console.log('Unicode_isIdeograph_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isIdeograph_nullString_test_0100
     * @tc.number Unicode_isIdeograph_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isIdeograph_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isIdeograph('');
      console.log('Unicode_isIdeograph_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name Unicode_isLetter_null_test_0100
     * @tc.number Unicode_isLetter_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isLetter_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isLetter(null);
      console.log('Unicode_isLetter_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isLetter_nullString_test_0100
     * @tc.number Unicode_isLetter_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isLetter_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isLetter('');
      console.log('Unicode_isLetter_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name Unicode_isLowerCase_null_test_0100
     * @tc.number Unicode_isLowerCase_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isLowerCase_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isLowerCase(null);
      console.log('Unicode_isLowerCase_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isLowerCase_nullString_test_0100
     * @tc.number Unicode_isLowerCase_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isLowerCase_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isLowerCase('');
      console.log('Unicode_isLowerCase_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name Unicode_isUpperCase_null_test_0100
     * @tc.number Unicode_isUpperCase_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isUpperCase_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isUpperCase(null);
      console.log('Unicode_isUpperCase_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isUpperCase_nullString_test_0100
     * @tc.number Unicode_isUpperCase_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isUpperCase_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isUpperCase('');
      console.log('Unicode_isUpperCase_nullString_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name Unicode_getType_null_test_0100
     * @tc.number Unicode_getType_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_getType_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.getType(null);
      console.log('Unicode_getType_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_getType_nullString_test_0100
     * @tc.number Unicode_getType_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_getType_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.getType('');
      console.log('Unicode_getType_nullString_test_0100 value:', value);
      expect(value).assertEqual('U_UNASSIGNED');
    })

    /**
     * @tc.name addPreferredLanguage_null_test_0100
     * @tc.number addPreferredLanguage_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('addPreferredLanguage_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.addPreferredLanguage(null, 1);
      console.log('addPreferredLanguage_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name addPreferredLanguage_null_test_0200
     * @tc.number addPreferredLanguage_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('addPreferredLanguage_null_test_0200', Level.LEVEL3, () => {
      let value = i18n.addPreferredLanguage('zh-Hans-CN', null);
      console.log('addPreferredLanguage_null_test_0200 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name addPreferredLanguage_nullString_test_0100
     * @tc.number addPreferredLanguage_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('addPreferredLanguage_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.addPreferredLanguage('', 1);
      console.log('addPreferredLanguage_nullString_test_0100 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name removePreferredLanguage_null_test_0100
     * @tc.number removePreferredLanguage_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('removePreferredLanguage_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.removePreferredLanguage(null);
      console.log('removePreferredLanguage_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getTimeZone_null_test_0100
     * @tc.number getTimeZone_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimeZone_null_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone(null);
      let value = timeZone.getID();
      console.log('getTimeZone_null_test_0100 value:', value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name getTimeZone_nullString_test_0100
     * @tc.number getTimeZone_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimeZone_nullString_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone('');
      let value = timeZone.getID();
      console.log('getTimeZone_nullString_test_0100 value:', value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name getDisplayName_null_test_0100
     * @tc.number getDisplayName_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayName_null_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone();
      let value = timeZone.getDisplayName(null);
      console.log('getDisplayName_null_test_0100 value:', value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name getDisplayName_nullString_test_0100
     * @tc.number getDisplayName_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayName_nullString_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone();
      let value = timeZone.getDisplayName('');
      console.log('getDisplayName_nullString_test_0100 value:', value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name getOffset_null_test_0100
     * @tc.number getOffset_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getOffset_null_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone();
      let value = timeZone.getOffset(null);
      console.log('getOffset_null_test_0100 value:', value);
      expect(value > 0).assertTrue();
    })

    /**
     * @tc.name getCityDisplayName_null_test_0100
     * @tc.number getCityDisplayName_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCityDisplayName_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getCityDisplayName(null, 'zh');
      console.log('getCityDisplayName_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getCityDisplayName_null_test_0200
     * @tc.number getCityDisplayName_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCityDisplayName_null_test_0200', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getCityDisplayName('Auckland', null);
      console.log('getCityDisplayName_null_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getCityDisplayName_nullString_test_0100
     * @tc.number getCityDisplayName_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCityDisplayName_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getCityDisplayName('', 'zh');
      console.log('getCityDisplayName_nullString_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name getCityDisplayName_nullString_test_0200
     * @tc.number getCityDisplayName_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCityDisplayName_nullString_test_0200', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getCityDisplayName('Auckland', '');
      console.log('getCityDisplayName_nullString_test_0200 value:', value);
      expect(value != '').assertTrue();
    })

    /**
     * @tc.name getTimezoneFromCity_null_test_0100
     * @tc.number getTimezoneFromCity_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimezoneFromCity_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getTimezoneFromCity(null);
      console.log('getTimezoneFromCity_null_test_0100 value:', value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name getTimezoneFromCity_nullString_test_0100
     * @tc.number getTimezoneFromCity_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimezoneFromCity_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getTimezoneFromCity('');
      console.log('getTimezoneFromCity_nullString_test_0100 value:', value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name getTimezonesByLocation_null_test_0100
     * @tc.number getTimezonesByLocation_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimezonesByLocation_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(null, 43);
        console.log('getTimezonesByLocation_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getTimezonesByLocation_null_test_0100' + e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getTimezonesByLocation_null_test_0200
     * @tc.number getTimezonesByLocation_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimezonesByLocation_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(87, null);
        console.log('getTimezonesByLocation_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getTimezonesByLocation_null_test_0200' + e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })


    /**
     * @tc.name nextTransition_null_test_0100
     * @tc.number nextTransition_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('nextTransition_null_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone('America/Tijuana');
      let zoneRules = timeZone.getZoneRules();
      let value = zoneRules.nextTransition(null);
      console.log('nextTransition_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Transliterator_getInstance_null_test_0100
     * @tc.number Transliterator_getInstance_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Transliterator_getInstance_null_test_0100', Level.LEVEL3, () => {
      let value = i18n.Transliterator.getInstance(null);
      console.log('Transliterator_getInstance_null_test_0100 value:', value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name Transliterator_getInstance_nullString_test_0100
     * @tc.number Transliterator_getInstance_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Transliterator_getInstance_nullString_test_0100', Level.LEVEL3, () => {
      let value = i18n.Transliterator.getInstance('');
      console.log('Transliterator_getInstance_nullString_test_0100 value:', value);
      expect(value !== null).assertTrue();
    })


    /**
     * @tc.name Transliterator_transform_null_test_0100
     * @tc.number Transliterator_transform_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Transliterator_transform_null_test_0100', Level.LEVEL3, () => {
      let trans = i18n.Transliterator.getInstance('Any-Accents');
      let value = trans.transform(null);
      console.log('Transliterator_transform_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })


    /**
     * @tc.name Transliterator_transform_nullString_test_0100
     * @tc.number Transliterator_transform_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Transliterator_transform_nullString_test_0100', Level.LEVEL3, () => {
      let trans = i18n.Transliterator.getInstance('Any-Accents');
      let value = trans.transform('');
      console.log('Transliterator_transform_nullString_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name normalize_null_test_0100
     * @tc.number normalize_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('normalize_null_test_0100', Level.LEVEL3, () => {
      try {
        let trans = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
        let value = trans.normalize(null);
        console.log('normalize_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('normalize_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name normalize_nullString_test_0100
     * @tc.number normalize_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('normalize_nullString_test_0100', Level.LEVEL3, () => {
      let trans = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
      let value = trans.normalize('');
      console.log('normalize_nullString_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name isHoliday_null_test_0100
     * @tc.number isHoliday_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isHoliday_null_test_0100', Level.LEVEL3, () => {
      let holidayManager = new i18n.HolidayManager('/system/lib/TR.ics');
      let value = holidayManager.isHoliday(null);
      console.log('isHoliday_null_test_0100 value:', value);
      expect(value == false).assertTrue();
    })

    /**
     * @tc.name getHolidayInfoItemArray_null_test_0100
     * @tc.number getHolidayInfoItemArray_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getHolidayInfoItemArray_null_test_0100', Level.LEVEL3, () => {
      let holidayManager = new i18n.HolidayManager('/system/lib/TR.ics');
      let value = holidayManager.getHolidayInfoItemArray(null);
      console.log('getHolidayInfoItemArray_null_test_0100 value:', value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name findEntityInfo_null_test_0100
     * @tc.number findEntityInfo_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('findEntityInfo_null_test_0100', Level.LEVEL3, () => {
      try {
        let entityRecognizer = new i18n.EntityRecognizer('zh-CN');
        let value = entityRecognizer.findEntityInfo(null);
        console.log('findEntityInfo_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('findEntityInfo_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name findEntityInfo_nullString_test_0100
     * @tc.number findEntityInfo_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('findEntityInfo_nullString_test_0100', Level.LEVEL3, () => {
      let entityRecognizer = new i18n.EntityRecognizer('zh-CN');
      let value = entityRecognizer.findEntityInfo('');
      console.log('findEntityInfo_nullString_test_0100 value:', value);
      expect(value.length == 0).assertTrue();
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0100
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0100
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{language: ""});
        let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0200
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0200
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0200', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{script: ""});
        let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0200 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0300
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0300
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0300', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{region: ""});
        let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0300 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0300 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0400
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0400
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0400', Level.LEVEL3, () => {
      let locale = new Intl.Locale('zh-Hans-CN',{baseName: ""});
      let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0400 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0500
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0500
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0500', Level.LEVEL3, () => {
      let locale = new intl.Locale('zh-Hans-CN',{caseFirst: ""});
      let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0500 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0600
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0600
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0600', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{calendar: ""});
        let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0600 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0600 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0700
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0700
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0700', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{collation: ""});
        let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0700 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0700 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0800
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0800
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0800', Level.LEVEL3, () => {
      let locale = new intl.Locale('zh-Hans-CN',{hourCycle: ""});
      let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0800 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_0900
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_0900
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_0900', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{numberingSystem: ""});
        let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0900 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_0900 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_1000
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_1000
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_1000', Level.LEVEL3, () => {
      let locale = new Intl.Locale('zh-Hans-CN',{numeric: true});
      let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_1000 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_locale_test_1100
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_locale_test_1100
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_locale_test_1100', Level.LEVEL3, () => {
      let locale = new Intl.Locale('zh-Hans-CN',{numeric: false});
      let value = i18n.getSimpleDateTimeFormatByPattern("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatByPattern_locale_test_1100 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_null_test_0100
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatByPattern(null, locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_nullString_test_0100
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatByPattern("", locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatByPattern_null_test_0100
     * @tc.number getSimpleDateTimeFormatByPattern_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatByPattern_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatByPattern(null, locale);
        console.log('getSimpleDateTimeFormatByPattern_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatByPattern_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatByPattern_null_test_0200
     * @tc.number getSimpleDateTimeFormatByPattern_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatByPattern_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getSimpleDateTimeFormatByPattern('yMdhms', null);
        console.log('getSimpleDateTimeFormatByPattern_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatByPattern_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatByPattern_nullString_test_0100
     * @tc.number getSimpleDateTimeFormatByPattern_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatByPattern_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatByPattern("", locale);
        console.log('getSimpleDateTimeFormatByPattern_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatByPattern_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0100
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0100
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{language: ""});
        let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0200
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0200
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0200', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{script: ""});
        let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0200 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0300
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0300
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0300', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{region: ""});
        let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0300 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0300 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0400
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0400
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0400', Level.LEVEL3, () => {
      let locale = new Intl.Locale('zh-Hans-CN',{baseName: ""});
      let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0400 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0500
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0500
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0500', Level.LEVEL3, () => {
      let locale = new intl.Locale('zh-Hans-CN',{caseFirst: ""});
      let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0500 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0600
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0600
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0600', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{calendar: ""});
        let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0600 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0600 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0700
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0700
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0700', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{collation: ""});
        let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0700 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0700 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0800
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0800
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0800', Level.LEVEL3, () => {
      let locale = new intl.Locale('zh-Hans-CN',{hourCycle: ""});
      let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0800 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0900
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0900
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0900', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{numberingSystem: ""});
        let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0900 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_0900 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_1000
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_1000
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_1000', Level.LEVEL3, () => {
      let locale = new Intl.Locale('zh-Hans-CN',{numeric: true});
      let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_1000 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_locale_test_1100
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_locale_test_1100
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_1100', Level.LEVEL3, () => {
      let locale = new Intl.Locale('zh-Hans-CN',{numeric: false});
      let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", locale);
      console.log('Intl_getSimpleDateTimeFormatBySkeleton_locale_test_1100 value:', value);
      expect(JSON.stringify(value)).assertEqual('{}');
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_null_test_0100
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatBySkeleton(null, locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_nullString_test_0100
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatBySkeleton('', locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatBySkeleton_null_test_0100
     * @tc.number getSimpleDateTimeFormatBySkeleton_null_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatBySkeleton_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatBySkeleton(null, locale);
        console.log('getSimpleDateTimeFormatBySkeleton_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatBySkeleton_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatBySkeleton_null_test_0200
     * @tc.number getSimpleDateTimeFormatBySkeleton_null_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatBySkeleton_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", null);
        console.log('getSimpleDateTimeFormatBySkeleton_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatBySkeleton_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatBySkeleton_nullString_test_0100
     * @tc.number getSimpleDateTimeFormatBySkeleton_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatBySkeleton_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatBySkeleton('', locale);
        console.log('getSimpleDateTimeFormatBySkeleton_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatBySkeleton_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0100
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0100
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{language: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0200
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0200
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0200', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{script: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0200 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0300
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0300
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0300', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{region: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0300 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0300 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0400
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0400
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0400', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{baseName: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0400 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0400 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0500
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0500
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0500', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN',{caseFirst: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0500 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0500 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0600
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0600
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0600', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{calendar: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0600 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0600 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0700
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0700
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0700', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{collation: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0700 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0700 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0800
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0800
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0800', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN',{hourCycle: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0800 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0800 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_0900
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_0900
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_0900', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{numberingSystem: ""});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0900 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_0900 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_1000
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_1000
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_1000', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{numeric: true});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_1000 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_1000 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_locale_test_1100
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_locale_test_1100
     * @tc.desc with locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_locale_test_1100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN',{numeric: false});
        let value = i18n.getSimpleNumberFormatBySkeleton("yMdhms", locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_1100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_locale_test_1100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_null_test_0100
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleNumberFormatBySkeleton(null, locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_nullString_test_0100
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleNumberFormatBySkeleton('', locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name getSimpleNumberFormatBySkeleton_null_test_0100
     * @tc.number getSimpleNumberFormatBySkeleton_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleNumberFormatBySkeleton_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleNumberFormatBySkeleton(null, locale);
        console.log('getSimpleNumberFormatBySkeleton_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleNumberFormatBySkeleton_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleNumberFormatBySkeleton_null_test_0200
     * @tc.number getSimpleNumberFormatBySkeleton_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleNumberFormatBySkeleton_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getSimpleNumberFormatBySkeleton('yMdhms', null);
        console.log('getSimpleNumberFormatBySkeleton_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleNumberFormatBySkeleton_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleNumberFormatBySkeleton_nullString_test_0100
     * @tc.number getSimpleNumberFormatBySkeleton_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleNumberFormatBySkeleton_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleNumberFormatBySkeleton('', locale);
        console.log('getSimpleNumberFormatBySkeleton_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleNumberFormatBySkeleton_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name SimpleDateTimeFormat_format_null_test_0100
     * @tc.number SimpleDateTimeFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SimpleDateTimeFormat_format_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d' 'h':'m':'s')'", locale);
        let value = SimpleDateTimeFormat.format(null);
        console.log('SimpleDateTimeFormat_format_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('SimpleDateTimeFormat_format_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name SimpleNumberFormat_format_null_test_0100
     * @tc.number SimpleNumberFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SimpleNumberFormat_format_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton('decimal-always', locale);
        let value = SimpleNumberFormat.format(null);
        console.log('SimpleNumberFormat_format_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('SimpleNumberFormat_format_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name StyledNumberFormat_format_null_test_0100
     * @tc.number StyledNumberFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('StyledNumberFormat_format_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh');
        let simpleNumFmt = i18n.getSimpleNumberFormatBySkeleton("percent", locale);
        let styledNumberFormat = new i18n.StyledNumberFormat(simpleNumFmt);
        let value = styledNumberFormat.format(null);
        console.log('StyledNumberFormat_format_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('StyledNumberFormat_format_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name StyledDateTimeFormat_format_null_test_0100
     * @tc.number StyledDateTimeFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('StyledDateTimeFormat_format_null_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let simpleTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton("hhmmss", locale);
        let StyledTimeFormat = new i18n.StyledDateTimeFormat(simpleTimeFormat);
        let value = StyledTimeFormat.format(null);
        console.log('StyledDateTimeFormat_format_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('StyledDateTimeFormat_format_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name AdvancedMeasureFormat_format_null_test_0100
     * @tc.number AdvancedMeasureFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('AdvancedMeasureFormat_format_null_test_0100', Level.LEVEL3, () => {
      let numFmt = new Intl.NumberFormat('zh-Hans-CN', {style: 'unit', unit: 'fahrenheit'});
      let advancedMeasureFormat = new i18n.AdvancedMeasureFormat(numFmt, {unitUsage: i18n.UnitUsage.TEMPERATURE_PERSON});
      let value = advancedMeasureFormat.format(null);
      console.log('AdvancedMeasureFormat_format_null_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0100
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0100
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0100', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '/';
        let locale = new Intl.Locale('zh', {language: ''});
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_null_test_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0200
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0200
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0200', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '/';
        let locale = new Intl.Locale('zh', {script: ''});
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0200 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0300
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0300
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0300', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '/';
        let locale = new Intl.Locale('zh', {region: ''});
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0300 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0300 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0400
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0400
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0400', Level.LEVEL3, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale = new Intl.Locale('zh', {baseName: ''});
      let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0400 value:', value);
      expect(value).assertEqual('/data/out/tmp');
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0500
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0500
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0500', Level.LEVEL3, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale = new intl.Locale('zh', {caseFirst: ''});
      let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0500 value:', value);
      expect(value).assertEqual('/data/out/tmp');
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0600
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0600
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0600', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '/';
        let locale = new Intl.Locale('zh', {calendar: ''});
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0600 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0600 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0700
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0700
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0700', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '/';
        let locale = new Intl.Locale('zh', {collation: ''});
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0700 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0700 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0800
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0800
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0800', Level.LEVEL3, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale = new intl.Locale('zh', {hourCycle: ''});
      let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0800 value:', value);
      expect(value).assertEqual('/data/out/tmp');
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_0900
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_0900
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_0900', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '/';
        let locale = new Intl.Locale('zh', {numberingSystem: ''});
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0900 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_Locale_test_0900 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_1000
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_1000
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_1000', Level.LEVEL3, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale = new Intl.Locale('zh', {numeric: true});
      let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      console.log('Intl_getUnicodeWrappedFilePath_Locale_test_1000 value:', value);
      expect(value).assertEqual('/data/out/tmp');
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_Locale_test_1100
     * @tc.number Intl_getUnicodeWrappedFilePath_Locale_test_1100
     * @tc.desc with Locale
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_Locale_test_1100', Level.LEVEL3, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale = new Intl.Locale('zh', {numeric: false});
      let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      console.log('Intl_getUnicodeWrappedFilePath_Locale_test_1100 value:', value);
      expect(value).assertEqual('/data/out/tmp');
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_null_test_0100
     * @tc.number Intl_getUnicodeWrappedFilePath_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_null_test_0100', Level.LEVEL3, () => {
      try {
        let delimiter: string = '/';
        let locale = new intl.Locale('zh');
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(null, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_null_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_null_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_null_test_0200
     * @tc.number Intl_getUnicodeWrappedFilePath_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_null_test_0200', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let locale = new intl.Locale('zh');
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, null, locale);
        console.log('Intl_getUnicodeWrappedFilePath_null_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_null_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_nullString_test_0100
     * @tc.number Intl_getUnicodeWrappedFilePath_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_nullString_test_0100', Level.LEVEL3, () => {
      try {
        let path: string = '';
        let delimiter: string = '/';
        let locale = new intl.Locale('zh');
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_nullString_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_nullString_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_nullString_test_0200
     * @tc.number Intl_getUnicodeWrappedFilePath_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_nullString_test_0200', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '';
        let locale = new intl.Locale('zh');
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_nullString_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_nullString_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(890001);
      }
    })

    /**
     * @tc.name dateTimeFormat_format_null_test_0100
     * @tc.number dateTimeFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('dateTimeFormat_format_null_test_0100', Level.LEVEL3, () => {
      let dateFmt = new intl.DateTimeFormat('zh-CN', {dateStyle: 'full'});
      let value = dateFmt.format(null);
      console.log('dateTimeFormat_format_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name dateTimeFormat_formatRange_null_test_0100
     * @tc.number dateTimeFormat_formatRange_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('dateTimeFormat_formatRange_null_test_0100', Level.LEVEL3, () => {
      let date = new Date(2026, 1, 1, 60, 24, 10, 123)
      let dateFmt = new intl.DateTimeFormat('zh-CN', {dateStyle: 'full'});
      let value = dateFmt.formatRange(null, date);
      console.log('dateTimeFormat_formatRange_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name dateTimeFormat_formatRange_null_test_0200
     * @tc.number dateTimeFormat_formatRange_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('dateTimeFormat_formatRange_null_test_0200', Level.LEVEL3, () => {
      let date = new Date(2026, 1, 1, 60, 24, 10, 123)
      let dateFmt = new intl.DateTimeFormat('zh-CN', {dateStyle: 'full'});
      let value = dateFmt.formatRange(date, null);
      console.log('dateTimeFormat_formatRange_null_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name NumberFormat_format_null_test_0100
     * @tc.number NumberFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('NumberFormat_format_null_test_0100', Level.LEVEL3, () => {
      let numOptions: intl.NumberOptions = {maximumFractionDigits: 2, roundingIncrement: 2}
      let numFmt = new intl.NumberFormat('zh-hans-CN', numOptions);
      let value = numFmt.format(null);
      console.log('NumberFormat_format_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name NumberFormat_formatRange_null_test_0100
     * @tc.number NumberFormat_formatRange_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('NumberFormat_formatRange_null_test_0100', Level.LEVEL3, () => {
      let numFmt = new intl.NumberFormat('zh-hans-CN');
      let value = numFmt.formatRange(null, 9);
      console.log('NumberFormat_formatRange_null_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name NumberFormat_formatRange_null_test_0200
     * @tc.number NumberFormat_formatRange_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('NumberFormat_formatRange_null_test_0200', Level.LEVEL3, () => {
      let numFmt = new intl.NumberFormat('zh-hans-CN');
      let value = numFmt.formatRange(0, null);
      console.log('NumberFormat_formatRange_null_test_0200 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name collator_compare_null_test_0100
     * @tc.number collator_compare_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('collator_compare_null_test_0100', Level.LEVEL3, () => {
      let coll = new intl.Collator();
      let value = coll.compare(null, 'b');
      console.log('collator_compare_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name collator_compare_null_test_0200
     * @tc.number collator_compare_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('collator_compare_null_test_0200', Level.LEVEL3, () => {
      let coll = new intl.Collator();
      let value = coll.compare('a', null);
      console.log('collator_compare_null_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name relativeTimeFormat_format_null_test_0100
     * @tc.number relativeTimeFormat_format_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_format_null_test_0100', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.format(null, 'second');
      console.log('relativeTimeFormat_format_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name relativeTimeFormat_format_null_test_0200
     * @tc.number relativeTimeFormat_format_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_format_null_test_0200', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.format(100, null);
      console.log('relativeTimeFormat_format_null_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name relativeTimeFormat_formatToParts_null_test_0100
     * @tc.number relativeTimeFormat_formatToParts_null_test_0100
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_formatToParts_null_test_0100', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.formatToParts(null, 'second');
      console.log('relativeTimeFormat_formatToParts_null_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name relativeTimeFormat_formatToParts_null_test_0200
     * @tc.number relativeTimeFormat_formatToParts_null_test_0200
     * @tc.desc with null
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_formatToParts_null_test_0200', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.formatToParts(100, null);
      console.log('relativeTimeFormat_formatToParts_null_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name collator_compare_nullString_test_0100
     * @tc.number collator_compare_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('collator_compare_nullString_test_0100', Level.LEVEL3, () => {
      let coll = new intl.Collator();
      let value = coll.compare('', 'b');
      console.log('collator_compare_nullString_test_0100 value:', value);
      expect(value).assertEqual(-1);
    })

    /**
     * @tc.name collator_compare_nullString_test_0200
     * @tc.number collator_compare_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('collator_compare_nullString_test_0200', Level.LEVEL3, () => {
      let coll = new intl.Collator();
      let value = coll.compare('a', '');
      console.log('collator_compare_nullString_test_0200 value:', value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name relativeTimeFormat_format_nullString_test_0100
     * @tc.number relativeTimeFormat_format_nullString_test_0100
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_format_nullString_test_0100', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.format(100, '');
      console.log('relativeTimeFormat_format_nullString_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name relativeTimeFormat_formatToParts_nullString_test_0200
     * @tc.number relativeTimeFormat_formatToParts_nullString_test_0200
     * @tc.desc with nullString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_formatToParts_nullString_test_0200', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.formatToParts(100, '');
      console.log('relativeTimeFormat_formatToParts_nullString_test_0200 value:', value);
      expect(value.toString()).assertEqual('');
    })

    /**
     * @tc.name getDisplayCountry_undefined_test_0100
     * @tc.number getDisplayCountry_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayCountry_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.getDisplayCountry(undefined, "en-US", true);
        console.log('getDisplayCountry_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getDisplayCountry_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getDisplayCountry_undefined_test_0200
     * @tc.number getDisplayCountry_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayCountry_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getDisplayCountry('zh-Hans-CN', undefined, true);
        console.log('getDisplayCountry_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getDisplayCountry_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getDisplayLanguage_undefined_test_0100
     * @tc.number getDisplayLanguage_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayLanguage_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.getDisplayLanguage(undefined, "en-US");
        console.log('getDisplayLanguage_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getDisplayLanguage_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getDisplayLanguage_undefined_test_0200
     * @tc.number getDisplayLanguage_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayLanguage_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getDisplayLanguage('zh-Hans-CN', undefined);
        console.log('getDisplayLanguage_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getDisplayLanguage_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getDisplayCountry_undefined_test_0100
     * @tc.number system_getDisplayCountry_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayCountry_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayCountry(undefined, "en-US", true);
        console.log('system_getDisplayCountry_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayCountry_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getDisplayCountry_undefined_test_0200
     * @tc.number system_getDisplayCountry_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayCountry_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayCountry('zh-Hans-CN', undefined, true);
        console.log('system_getDisplayCountry_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayCountry_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getDisplayLanguage_undefined_test_0100
     * @tc.number system_getDisplayLanguage_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayLanguage_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayLanguage(undefined, "en-US");
        console.log('system_getDisplayLanguage_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayLanguage_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getDisplayLanguage_undefined_test_0200
     * @tc.number system_getDisplayLanguage_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getDisplayLanguage_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getDisplayLanguage('zh-Hans-CN', undefined);
        console.log('system_getDisplayLanguage_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getDisplayLanguage_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getSystemCountries_undefined_test_0100
     * @tc.number system_getSystemCountries_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getSystemCountries_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.getSystemCountries(undefined);
        console.log('system_getSystemCountries_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_getSystemCountries_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_isSuggested_undefined_test_0100
     * @tc.number system_isSuggested_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_isSuggested_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.isSuggested(undefined, 'CN');
        console.log('system_isSuggested_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('system_isSuggested_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_isSuggested_undefined_test_0200
     * @tc.number system_isSuggested_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_isSuggested_undefined_test_0200', Level.LEVEL3, () => {
      let value = i18n.System.isSuggested('zh', undefined);
      console.log('system_isSuggested_undefined_test_0200 value:', value);
      expect(value).assertEqual(true);
    })

    /**
     * @tc.name system_setAppPreferredLanguage_undefined_test_0100
     * @tc.number system_setAppPreferredLanguage_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_setAppPreferredLanguage_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.System.setAppPreferredLanguage(undefined);
        console.log('system_setAppPreferredLanguage_undefined_test_0100 value:', value);
        expect(typeof(value)).assertFail();
      } catch (e) {
        console.log('system_setAppPreferredLanguage_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name system_getSimplifiedLanguage_undefined_test_0100
     * @tc.number system_getSimplifiedLanguage_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('system_getSimplifiedLanguage_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.System.getSimplifiedLanguage(undefined);
      console.log('system_getSimplifiedLanguage_undefined_test_0100 value:', value);
      expect(value != undefined).assertTrue();
    })

    /**
     * @tc.name unitConvert_undefined_test_0100
     * @tc.number unitConvert_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: undefined, measureSystem: undefined},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        1000,
        'zh-CN',
        'long');
      console.log('unitConvert_undefined_test_0100 value:', value);
      expect(value).assertEqual('1,000');
    })

    /**
     * @tc.name unitConvert_undefined_test_0200
     * @tc.number unitConvert_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_undefined_test_0200', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: undefined, measureSystem: undefined},
        1000,
        'zh-CN',
        'long');
      console.log('unitConvert_undefined_test_0200 value:', value);
      expect(value).assertEqual('1,000米');
    })

    /**
     * @tc.name unitConvert_undefined_test_0300
     * @tc.number unitConvert_undefined_test_0300
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_undefined_test_0300', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        undefined,
        'zh-CN',
        'long');
      console.log('unitConvert_undefined_test_0300 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name unitConvert_undefined_test_0400
     * @tc.number unitConvert_undefined_test_0400
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_undefined_test_0400', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        1000,
        undefined,
        'long');
      console.log('unitConvert_undefined_test_0400 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name unitConvert_undefined_test_0500
     * @tc.number unitConvert_undefined_test_0500
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('unitConvert_undefined_test_0500', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'},
        {unit: 'meter-per-second', measureSystem: 'SI'},
        1000,
        'zh-CN',
        undefined);
      console.log('unitConvert_undefined_test_0500 value:', value);
      expect(value).assertEqual('1,000米');
    })

    /**
     * @tc.name getDateOrder_undefined_test_0100
     * @tc.number getDateOrder_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDateOrder_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.getDateOrder(undefined);
      console.log('getDateOrder_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getTimePeriodName_undefined_test_0100
     * @tc.number getTimePeriodName_undefined_test_0100
     * @tc.desc with undefinedString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimePeriodName_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getTimePeriodName(undefined, 'en-US');
        console.log('getTimePeriodName_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getTimePeriodName_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getTimePeriodName_undefined_test_0200
     * @tc.number getTimePeriodName_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimePeriodName_undefined_test_0200', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.getTimePeriodName(5, undefined);
      console.log('getTimePeriodName_undefined_test_0200 value:', value);
      expect(value).assertEqual('早上');
    })

    /**
     * @tc.name getBestMatchLocale_undefined_test_0100
     * @tc.number getBestMatchLocale_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getBestMatchLocale_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.I18NUtil.getBestMatchLocale(undefined, ['zh-Hant-CN']);
      console.log('getBestMatchLocale_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getBestMatchLocale_undefined_test_0200
     * @tc.number getBestMatchLocale_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getBestMatchLocale_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getBestMatchLocale("en-US", undefined);
        console.log('getBestMatchLocale_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getBestMatchLocale_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getThreeLetterLanguage_undefined_test_0100
     * @tc.number getThreeLetterLanguage_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getThreeLetterLanguage_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getThreeLetterLanguage(undefined);
        console.log('getThreeLetterLanguage_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getThreeLetterLanguage_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getThreeLetterRegion_undefined_test_0100
     * @tc.number getThreeLetterRegion_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getThreeLetterRegion_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.I18NUtil.getThreeLetterRegion(undefined);
        console.log('getThreeLetterRegion_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getThreeLetterRegion_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getUnicodeWrappedFilePath_undefined_test_0100
     * @tc.number getUnicodeWrappedFilePath_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getUnicodeWrappedFilePath_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let delimiter: string = '/';
        let local: Intl.Locale = new Intl.Locale("zh");
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(undefined, delimiter, local);
        console.log('getUnicodeWrappedFilePath_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getUnicodeWrappedFilePath_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getUnicodeWrappedFilePath_undefined_test_0200
     * @tc.number getUnicodeWrappedFilePath_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getUnicodeWrappedFilePath_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let local: Intl.Locale = new Intl.Locale("zh");
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, undefined, local);
        console.log('getUnicodeWrappedFilePath_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getUnicodeWrappedFilePath_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getUnicodeWrappedFilePath_undefined_test_0300
     * @tc.number getUnicodeWrappedFilePath_undefined_test_0300
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getUnicodeWrappedFilePath_undefined_test_0300', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let delimiter: string = '/';
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, undefined);
        console.log('getUnicodeWrappedFilePath_undefined_test_0300 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getUnicodeWrappedFilePath_undefined_test_0300 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name PhoneNumberFormat_isValidNumber_undefined_test_0100
     * @tc.number PhoneNumberFormat_isValidNumber_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_isValidNumber_undefined_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.isValidNumber(undefined);
      console.log('PhoneNumberFormat_isValidNumber_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name PhoneNumberFormat_format_undefined_test_0100
     * @tc.number PhoneNumberFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.format(undefined);
      console.log('PhoneNumberFormat_format_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name PhoneNumberFormat_getLocationName_undefined_test_0100
     * @tc.number PhoneNumberFormat_getLocationName_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_getLocationName_undefined_test_0100', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.getLocationName(undefined, 'zh-CN');
      console.log('PhoneNumberFormat_getLocationName_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name PhoneNumberFormat_getLocationName_undefined_test_0200
     * @tc.number PhoneNumberFormat_getLocationName_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('PhoneNumberFormat_getLocationName_undefined_test_0200', Level.LEVEL3, () => {
      let phoneNumber = new i18n.PhoneNumberFormat('CN');
      let value = phoneNumber.getLocationName('027-5937411', undefined);
      console.log('PhoneNumberFormat_getLocationName_undefined_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getCalendar_undefined_test_0100
     * @tc.number getCalendar_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCalendar_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar(undefined, 'chinese');
      let value = calendar.getDisplayName('zh');
      console.log('getCalendar_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getCalendar_undefined_test_0200
     * @tc.number getCalendar_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCalendar_undefined_test_0200', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh', undefined);
      let value = calendar.getDisplayName('zh');
      console.log('getCalendar_undefined_test_0200 value:', value);
      expect(value).assertEqual('公历');
    })

    /**
     * @tc.name calendar_setTime_undefined_test_0100
     * @tc.number calendar_setTime_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setTime_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.setTime(undefined);
      console.log('calendar_setTime_undefined_test_0100 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_undefined_test_0100
     * @tc.number calendar_set_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(undefined, 11, 11, 8, 0, 0);
      console.log('calendar_set_undefined_test_0100 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_undefined_test_0200
     * @tc.number calendar_set_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_undefined_test_0200', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, undefined, 11, 8, 0, 0);
      console.log('calendar_set_undefined_test_0200 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_undefined_test_0300
     * @tc.number calendar_set_undefined_test_0300
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_undefined_test_0300', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, 11, undefined, 8, 0, 0);
      console.log('calendar_set_undefined_test_0300 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_undefined_test_0400
     * @tc.number calendar_set_undefined_test_0400
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_undefined_test_0400', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, 11, 11, undefined, 0, 0);
      console.log('calendar_set_undefined_test_0400 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_undefined_test_0500
     * @tc.number calendar_set_undefined_test_0500
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_undefined_test_0500', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, 11, 11, 8, undefined, 0);
      console.log('calendar_set_undefined_test_0500 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_set_undefined_test_0600
     * @tc.number calendar_set_undefined_test_0600
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_set_undefined_test_0600', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.set(2021, 11, 11, 8, 0, undefined);
      console.log('calendar_set_undefined_test_0600 value:', value);
      expect(typeof (value)).assertEqual('undefined');
    })

    /**
     * @tc.name calendar_setTimeZone_undefined_test_0100
     * @tc.number calendar_setTimeZone_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setTimeZone_undefined_test_0100', Level.LEVEL3, () => {
      let calendar: i18n.Calendar = i18n.getCalendar('zh');
      calendar.setTimeZone(undefined);
      let value: string = calendar.getTimeZone();
      console.log('calendar_setTimeZone_undefined_test_0100 value:', value);
      expect(value).assertEqual('CST');
    })

    /**
     * @tc.name calendar_setFirstDayOfWeek_undefined_test_0100
     * @tc.number calendar_setFirstDayOfWeek_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setFirstDayOfWeek_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh');
      calendar.setFirstDayOfWeek(undefined);
      let value = calendar.getFirstDayOfWeek();
      console.log('calendar_setFirstDayOfWeek_undefined_test_0100 value:', value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name calendar_setMinimalDaysInFirstWeek_undefined_test_0100
     * @tc.number calendar_setMinimalDaysInFirstWeek_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_setMinimalDaysInFirstWeek_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh');
      calendar.setMinimalDaysInFirstWeek(undefined);
      let value = calendar.getMinimalDaysInFirstWeek();
      console.log('calendar_setMinimalDaysInFirstWeek_undefined_test_0100 value:', value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name calendar_get_undefined_test_0100
     * @tc.number calendar_get_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_get_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      calendar.set(2021, 11, 11, 8, 0, 0);
      let value = calendar.get(undefined);
      console.log('calendar_get_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name calendar_getDisplayName_undefined_test_0100
     * @tc.number calendar_getDisplayName_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_getDisplayName_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh', 'chinese');
      let value = calendar.getDisplayName(undefined);
      console.log('calendar_getDisplayName_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name calendar_isWeekend_undefined_test_0100
     * @tc.number calendar_isWeekend_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_isWeekend_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh');
      let value = calendar.isWeekend(undefined);
      console.log('calendar_isWeekend_undefined_test_0100 value:', value);
      expect(typeof(value)).assertEqual('boolean');
    })

    /**
     * @tc.name calendar_add_undefined_test_0100
     * @tc.number calendar_add_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_add_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let calendar = i18n.getCalendar('zh-CN');
        calendar.set(2021, 11, 11, 8, 0, 0);
        calendar.add(undefined, 8);
        let value = calendar.get('year');
        console.log('calendar_add_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('calendar_add_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name calendar_add_undefined_test_0200
     * @tc.number calendar_add_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_add_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let calendar = i18n.getCalendar('zh-CN');
        calendar.set(2021, 11, 11, 8, 0, 0);
        calendar.add('year', undefined);
        let value = calendar.get('year');
        console.log('calendar_add_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('calendar_add_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name calendar_compareDays_undefined_test_0100
     * @tc.number calendar_compareDays_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('calendar_compareDays_undefined_test_0100', Level.LEVEL3, () => {
      let calendar = i18n.getCalendar('zh-CN');
      let value = calendar.compareDays(undefined);
      console.log('calendar_compareDays_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isRTL_undefined_test_0100
     * @tc.number isRTL_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isRTL_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.isRTL(undefined);
      console.log('isRTL_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getLineInstance_undefined_test_0100
     * @tc.number getLineInstance_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getLineInstance_undefined_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance(undefined);
      iterator.setLineBreakText('123');
      let value = iterator.last();
      console.log('getLineInstance_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name next_undefined_test_0100
     * @tc.number next_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('next_undefined_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('123');
      let value = iterator.next(undefined);
      console.log('next_undefined_test_0100 value:', value);
      expect(value).assertEqual(3);
    })

    /**
     * @tc.name setLineBreakText_undefined_test_0100
     * @tc.number setLineBreakText_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('setLineBreakText_undefined_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText(undefined);
      let value = iterator.last();
      console.log('setLineBreakText_undefined_test_0100 value:', value);
      expect(value).assertEqual(0);
    })

    /**
     * @tc.name following_undefined_test_0100
     * @tc.number following_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('following_undefined_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('123');
      let value = iterator.following(undefined);
      console.log('following_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isBoundary_undefined_test_0100
     * @tc.number isBoundary_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isBoundary_undefined_test_0100', Level.LEVEL3, () => {
      let iterator = i18n.getLineInstance('en');
      iterator.setLineBreakText('123');
      let value = iterator.isBoundary(undefined);
      console.log('isBoundary_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getInstance_undefined_test_0100
     * @tc.number getInstance_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getInstance_undefined_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance(undefined);
      let value = index.getIndex('z');
      console.log('getInstance_undefined_test_0100 value:', value);
      expect(value).assertEqual('Z');
    })

    /**
     * @tc.name addLocale_undefined_test_0100
     * @tc.number addLocale_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('addLocale_undefined_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance('zh');
      index.addLocale(undefined);
      let value = index.getIndex('a');
      console.log('addLocale_undefined_test_0100 value:', value);
      expect(value).assertEqual('A');
    })

    /**
     * @tc.name getIndex_undefined_test_0100
     * @tc.number getIndex_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getIndex_undefined_test_0100', Level.LEVEL3, () => {
      let index = i18n.getInstance('zh');
      let value = index.getIndex(undefined);
      console.log('getIndex_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isDigit_undefined_test_0100
     * @tc.number isDigit_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isDigit_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isDigit(undefined);
      console.log('isDigit_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isSpaceChar_undefined_test_0100
     * @tc.number isSpaceChar_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isSpaceChar_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isSpaceChar(undefined);
      console.log('isSpaceChar_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isWhitespace_undefined_test_0100
     * @tc.number isWhitespace_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isWhitespace_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isWhitespace(undefined);
      console.log('isWhitespace_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name character_isRTL_undefined_test_0100
     * @tc.number character_isRTL_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('character_isRTL_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isRTL(undefined);
      console.log('character_isRTL_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isIdeograph_undefined_test_0100
     * @tc.number isIdeograph_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isIdeograph_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isIdeograph(undefined);
      console.log('isIdeograph_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isLetter_undefined_test_0100
     * @tc.number isLetter_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isLetter_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isLetter(undefined);
      console.log('isLetter_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isLowerCase_undefined_test_0100
     * @tc.number isLowerCase_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isLowerCase_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isLowerCase(undefined);
      console.log('isLowerCase_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name isUpperCase_undefined_test_0100
     * @tc.number isUpperCase_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isUpperCase_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.isUpperCase(undefined);
      console.log('isUpperCase_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getType_undefined_test_0100
     * @tc.number getType_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getType_undefined_test_0100', Level.LEVEL3, () => {
      let character = new i18n.Character();
      let value = character.getType(undefined);
      console.log('getType_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isDigit_undefined_test_0100
     * @tc.number Unicode_isDigit_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isDigit_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isDigit(undefined);
      console.log('Unicode_isDigit_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isSpaceChar_undefined_test_0100
     * @tc.number Unicode_isSpaceChar_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isSpaceChar_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isSpaceChar(undefined);
      console.log('Unicode_isSpaceChar_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isWhitespace_undefined_test_0100
     * @tc.number Unicode_isWhitespace_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isWhitespace_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isWhitespace(undefined);
      console.log('Unicode_isWhitespace_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isRTL_undefined_test_0100
     * @tc.number Unicode_isRTL_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isRTL_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isRTL(undefined);
      console.log('Unicode_isRTL_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isIdeograph_undefined_test_0100
     * @tc.number Unicode_isIdeograph_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isIdeograph_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isIdeograph(undefined);
      console.log('Unicode_isIdeograph_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isLetter_undefined_test_0100
     * @tc.number Unicode_isLetter_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isLetter_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isLetter(undefined);
      console.log('Unicode_isLetter_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isLowerCase_undefined_test_0100
     * @tc.number Unicode_isLowerCase_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isLowerCase_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isLowerCase(undefined);
      console.log('Unicode_isLowerCase_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_isUpperCase_undefined_test_0100
     * @tc.number Unicode_isUpperCase_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_isUpperCase_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.isUpperCase(undefined);
      console.log('Unicode_isUpperCase_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Unicode_getType_undefined_test_0100
     * @tc.number Unicode_getType_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Unicode_getType_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Unicode.getType(undefined);
      console.log('Unicode_getType_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name addPreferredLanguage_undefined_test_0100
     * @tc.number addPreferredLanguage_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('addPreferredLanguage_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.addPreferredLanguage(undefined, 1);
      console.log('addPreferredLanguage_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name addPreferredLanguage_undefined_test_0200
     * @tc.number addPreferredLanguage_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('addPreferredLanguage_undefined_test_0200', Level.LEVEL3, () => {
      let value = i18n.addPreferredLanguage('zh-Hans-CN', undefined);
      console.log('addPreferredLanguage_undefined_test_0200 value:', value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name removePreferredLanguage_undefined_test_0100
     * @tc.number removePreferredLanguage_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('removePreferredLanguage_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.removePreferredLanguage(undefined);
      console.log('removePreferredLanguage_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getTimeZone_undefined_test_0100
     * @tc.number getTimeZone_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimeZone_undefined_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone(undefined);
      let value = timeZone.getID();
      console.log('getTimeZone_undefined_test_0100 value:', value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name getDisplayName_undefined_test_0100
     * @tc.number getDisplayName_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getDisplayName_undefined_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone();
      let value = timeZone.getDisplayName(undefined);
      console.log('getDisplayName_undefined_test_0100 value:', value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name getOffset_undefined_test_0100
     * @tc.number getOffset_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getOffset_undefined_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone();
      let value = timeZone.getOffset(undefined);
      console.log('getOffset_undefined_test_0100 value:', value);
      expect(value > 0).assertTrue();
    })

    /**
     * @tc.name getCityDisplayName_undefined_test_0100
     * @tc.number getCityDisplayName_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCityDisplayName_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getCityDisplayName(undefined, 'zh');
      console.log('getCityDisplayName_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getCityDisplayName_undefined_test_0200
     * @tc.number getCityDisplayName_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getCityDisplayName_undefined_test_0200', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getCityDisplayName('Auckland', undefined);
      console.log('getCityDisplayName_undefined_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name getTimezoneFromCity_undefined_test_0100
     * @tc.number getTimezoneFromCity_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimezoneFromCity_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.TimeZone.getTimezoneFromCity(undefined);
      console.log('getTimezoneFromCity_undefined_test_0100 value:', value);
      expect(value != undefined).assertTrue();
    })

    /**
     * @tc.name getTimezonesByLocation_undefined_test_0100
     * @tc.number getTimezonesByLocation_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimezonesByLocation_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(undefined, 43);
        console.log('getTimezonesByLocation_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getTimezonesByLocation_undefined_test_0100' + e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getTimezonesByLocation_undefined_test_0200
     * @tc.number getTimezonesByLocation_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getTimezonesByLocation_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(87, undefined);
        console.log('getTimezonesByLocation_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getTimezonesByLocation_undefined_test_0200' + e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })


    /**
     * @tc.name nextTransition_undefined_test_0100
     * @tc.number nextTransition_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('nextTransition_undefined_test_0100', Level.LEVEL3, () => {
      let timeZone = i18n.getTimeZone('America/Tijuana');
      let zoneRules = timeZone.getZoneRules();
      let value = zoneRules.nextTransition(undefined);
      console.log('nextTransition_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name Transliterator_getInstance_undefined_test_0100
     * @tc.number Transliterator_getInstance_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Transliterator_getInstance_undefined_test_0100', Level.LEVEL3, () => {
      let value = i18n.Transliterator.getInstance(undefined);
      console.log('Transliterator_getInstance_undefined_test_0100 value:', value);
      expect(value !== undefined).assertTrue();
    })


    /**
     * @tc.name Transliterator_transform_undefined_test_0100
     * @tc.number Transliterator_transform_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Transliterator_transform_undefined_test_0100', Level.LEVEL3, () => {
      let trans = i18n.Transliterator.getInstance('Any-Accents');
      let value = trans.transform(undefined);
      console.log('Transliterator_transform_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name normalize_undefined_test_0100
     * @tc.number normalize_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('normalize_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let trans = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
        let value = trans.normalize(undefined);
        console.log('normalize_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('normalize_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name isHoliday_undefined_test_0100
     * @tc.number isHoliday_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('isHoliday_undefined_test_0100', Level.LEVEL3, () => {
      let holidayManager = new i18n.HolidayManager('/system/lib/TR.ics');
      let value = holidayManager.isHoliday(undefined);
      console.log('isHoliday_undefined_test_0100 value:', value);
      expect(value == false).assertTrue();
    })

    /**
     * @tc.name getHolidayInfoItemArray_undefined_test_0100
     * @tc.number getHolidayInfoItemArray_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getHolidayInfoItemArray_undefined_test_0100', Level.LEVEL3, () => {
      let holidayManager = new i18n.HolidayManager('/system/lib/TR.ics');
      let value = holidayManager.getHolidayInfoItemArray(undefined);
      console.log('getHolidayInfoItemArray_undefined_test_0100 value:', value);
      expect(value != undefined).assertTrue();
    })

    /**
     * @tc.name findEntityInfo_undefined_test_0100
     * @tc.number findEntityInfo_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('findEntityInfo_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let entityRecognizer = new i18n.EntityRecognizer('zh-CN');
        let value = entityRecognizer.findEntityInfo(undefined);
        console.log('findEntityInfo_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('findEntityInfo_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatByPattern_undefined_test_0100
     * @tc.number Intl_getSimpleDateTimeFormatByPattern_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatByPattern_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatByPattern(undefined, locale);
        console.log('Intl_getSimpleDateTimeFormatByPattern_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatByPattern_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatByPattern_undefined_test_0100
     * @tc.number getSimpleDateTimeFormatByPattern_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatByPattern_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatByPattern(undefined, locale);
        console.log('getSimpleDateTimeFormatByPattern_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatByPattern_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatByPattern_undefined_test_0200
     * @tc.number getSimpleDateTimeFormatByPattern_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatByPattern_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getSimpleDateTimeFormatByPattern('yMdhms', undefined);
        console.log('getSimpleDateTimeFormatByPattern_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatByPattern_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getSimpleDateTimeFormatBySkeleton_undefined_test_0100
     * @tc.number Intl_getSimpleDateTimeFormatBySkeleton_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleDateTimeFormatBySkeleton_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatBySkeleton(undefined, locale);
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleDateTimeFormatBySkeleton_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatBySkeleton_undefined_test_0100
     * @tc.number getSimpleDateTimeFormatBySkeleton_undefined_test_0100
     * @tc.desc with undefinedString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatBySkeleton_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleDateTimeFormatBySkeleton(undefined, locale);
        console.log('getSimpleDateTimeFormatBySkeleton_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatBySkeleton_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleDateTimeFormatBySkeleton_undefined_test_0200
     * @tc.number getSimpleDateTimeFormatBySkeleton_undefined_test_0200
     * @tc.desc with undefinedString
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleDateTimeFormatBySkeleton_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getSimpleDateTimeFormatBySkeleton("yMdhms", undefined);
        console.log('getSimpleDateTimeFormatBySkeleton_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleDateTimeFormatBySkeleton_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getSimpleNumberFormatBySkeleton_undefined_test_0100
     * @tc.number Intl_getSimpleNumberFormatBySkeleton_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getSimpleNumberFormatBySkeleton_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new Intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleNumberFormatBySkeleton(undefined, locale);
        console.log('Intl_getSimpleNumberFormatBySkeleton_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getSimpleNumberFormatBySkeleton_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleNumberFormatBySkeleton_undefined_test_0100
     * @tc.number getSimpleNumberFormatBySkeleton_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleNumberFormatBySkeleton_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let value = i18n.getSimpleNumberFormatBySkeleton(undefined, locale);
        console.log('getSimpleNumberFormatBySkeleton_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleNumberFormatBySkeleton_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name getSimpleNumberFormatBySkeleton_undefined_test_0200
     * @tc.number getSimpleNumberFormatBySkeleton_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('getSimpleNumberFormatBySkeleton_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let value = i18n.getSimpleNumberFormatBySkeleton('yMdhms', undefined);
        console.log('getSimpleNumberFormatBySkeleton_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('getSimpleNumberFormatBySkeleton_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name SimpleDateTimeFormat_format_undefined_test_0100
     * @tc.number SimpleDateTimeFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SimpleDateTimeFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d' 'h':'m':'s')'", locale);
        let value = SimpleDateTimeFormat.format(undefined);
        console.log('SimpleDateTimeFormat_format_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('SimpleDateTimeFormat_format_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name SimpleNumberFormat_format_undefined_test_0100
     * @tc.number SimpleNumberFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SimpleNumberFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton('decimal-always', locale);
        let value = SimpleNumberFormat.format(undefined);
        console.log('SimpleNumberFormat_format_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('SimpleNumberFormat_format_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name StyledNumberFormat_format_undefined_test_0100
     * @tc.number StyledNumberFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('StyledNumberFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh');
        let simpleNumFmt = i18n.getSimpleNumberFormatBySkeleton("percent", locale);
        let styledNumberFormat = new i18n.StyledNumberFormat(simpleNumFmt);
        let value = styledNumberFormat.format(undefined);
        console.log('StyledNumberFormat_format_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('StyledNumberFormat_format_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name StyledDateTimeFormat_format_undefined_test_0100
     * @tc.number StyledDateTimeFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('StyledDateTimeFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let locale = new intl.Locale('zh-Hans-CN');
        let simpleTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton("hhmmss", locale);
        let StyledTimeFormat = new i18n.StyledDateTimeFormat(simpleTimeFormat);
        let value = StyledTimeFormat.format(undefined);
        console.log('StyledDateTimeFormat_format_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('StyledDateTimeFormat_format_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name AdvancedMeasureFormat_format_undefined_test_0100
     * @tc.number AdvancedMeasureFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('AdvancedMeasureFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      let numFmt = new Intl.NumberFormat('zh-Hans-CN', {style: 'unit', unit: 'fahrenheit'});
      let advancedMeasureFormat = new i18n.AdvancedMeasureFormat(numFmt, {unitUsage: i18n.UnitUsage.TEMPERATURE_PERSON});
      let value = advancedMeasureFormat.format(undefined);
      console.log('AdvancedMeasureFormat_format_undefined_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_undefined_test_0100
     * @tc.number Intl_getUnicodeWrappedFilePath_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_undefined_test_0100', Level.LEVEL3, () => {
      try {
        let delimiter: string = '/';
        let locale = new intl.Locale('zh');
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(undefined, delimiter, locale);
        console.log('Intl_getUnicodeWrappedFilePath_undefined_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_undefined_test_0100 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name Intl_getUnicodeWrappedFilePath_undefined_test_0200
     * @tc.number Intl_getUnicodeWrappedFilePath_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('Intl_getUnicodeWrappedFilePath_undefined_test_0200', Level.LEVEL3, () => {
      try {
        let path: string = '/data/out/tmp';
        let locale = new intl.Locale('zh');
        let value = i18n.I18NUtil.getUnicodeWrappedFilePath(path, undefined, locale);
        console.log('Intl_getUnicodeWrappedFilePath_undefined_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('Intl_getUnicodeWrappedFilePath_undefined_test_0200 code&message:', e.code + e.message);
        expect(Number(e.code)).assertEqual(401);
      }
    })

    /**
     * @tc.name dateTimeFormat_format_undefined_test_0100
     * @tc.number dateTimeFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('dateTimeFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      let dateFmt = new intl.DateTimeFormat('zh-CN', {dateStyle: 'full'});
      let value = dateFmt.format(undefined);
      console.log('dateTimeFormat_format_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name dateTimeFormat_formatRange_undefined_test_0100
     * @tc.number dateTimeFormat_formatRange_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('dateTimeFormat_formatRange_undefined_test_0100', Level.LEVEL3, () => {
      let date = new Date(2026, 1, 1, 60, 24, 10, 123)
      let dateFmt = new intl.DateTimeFormat('zh-CN', {dateStyle: 'full'});
      let value = dateFmt.formatRange(undefined, date);
      console.log('dateTimeFormat_formatRange_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name dateTimeFormat_formatRange_undefined_test_0200
     * @tc.number dateTimeFormat_formatRange_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('dateTimeFormat_formatRange_undefined_test_0200', Level.LEVEL3, () => {
      let date = new Date(2026, 1, 1, 60, 24, 10, 123)
      let dateFmt = new intl.DateTimeFormat('zh-CN', {dateStyle: 'full'});
      let value = dateFmt.formatRange(date, undefined);
      console.log('dateTimeFormat_formatRange_undefined_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name NumberFormat_format_undefined_test_0100
     * @tc.number NumberFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('NumberFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      let numOptions: intl.NumberOptions = {maximumFractionDigits: 2, roundingIncrement: 2}
      let numFmt = new intl.NumberFormat('zh-hans-CN', numOptions);
      let value = numFmt.format(undefined);
      console.log('NumberFormat_format_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name NumberFormat_formatRange_undefined_test_0100
     * @tc.number NumberFormat_formatRange_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('NumberFormat_formatRange_undefined_test_0100', Level.LEVEL3, () => {
      let numFmt = new intl.NumberFormat('zh-hans-CN');
      let value = numFmt.formatRange(undefined, 9);
      console.log('NumberFormat_formatRange_undefined_test_0100 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name NumberFormat_formatRange_undefined_test_0200
     * @tc.number NumberFormat_formatRange_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('NumberFormat_formatRange_undefined_test_0200', Level.LEVEL3, () => {
      let numFmt = new intl.NumberFormat('zh-hans-CN');
      let value = numFmt.formatRange(0, undefined);
      console.log('NumberFormat_formatRange_undefined_test_0200 value:', value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name collator_compare_undefined_test_0100
     * @tc.number collator_compare_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('collator_compare_undefined_test_0100', Level.LEVEL3, () => {
      let coll = new intl.Collator();
      let value = coll.compare(undefined, 'b');
      console.log('collator_compare_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name collator_compare_undefined_test_0200
     * @tc.number collator_compare_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('collator_compare_undefined_test_0200', Level.LEVEL3, () => {
      let coll = new intl.Collator();
      let value = coll.compare('a', undefined);
      console.log('collator_compare_undefined_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name relativeTimeFormat_format_undefined_test_0100
     * @tc.number relativeTimeFormat_format_undefined_test_0100
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_format_undefined_test_0100', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.format(undefined, 'second');
      console.log('relativeTimeFormat_format_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name relativeTimeFormat_format_undefined_test_0200
     * @tc.number relativeTimeFormat_format_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_format_undefined_test_0200', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.format(100, undefined);
      console.log('relativeTimeFormat_format_undefined_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name relativeTimeFormat_formatToParts_undefined_test_0100
     * @tc.number relativeTimeFormat_formatToParts_undefined_test_0100git 
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_formatToParts_undefined_test_0100', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.formatToParts(undefined, 'second');
      console.log('relativeTimeFormat_formatToParts_undefined_test_0100 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name relativeTimeFormat_formatToParts_undefined_test_0200
     * @tc.number relativeTimeFormat_formatToParts_undefined_test_0200
     * @tc.desc with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('relativeTimeFormat_formatToParts_undefined_test_0200', Level.LEVEL3, () => {
      let relativeTimeFmt = new intl.RelativeTimeFormat('en',{style: 'long'});
      let value = relativeTimeFmt.formatToParts(100, undefined);
      console.log('relativeTimeFormat_formatToParts_undefined_test_0200 value:', value);
      expect(value).assertEqual(undefined);
    })

    /**
     * @tc.name i18n_HolidayInfoItem_test_0100
     * @tc.number i18n_HolidayInfoItem_test_0100
     * @tc.desc with HolidayInfoItem
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayInfoItem_test_0100', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item = holiday.getHolidayInfoItemArray(2023);
        let value = JSON.stringify(item[0].baseName);
        console.log('i18n_HolidayInfoItem_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayInfoItem_test_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name i18n_HolidayInfoItem_test_0200
     * @tc.number i18n_HolidayInfoItem_test_0200
     * @tc.desc with HolidayInfoItem
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayInfoItem_test_0200', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item = holiday.getHolidayInfoItemArray(2023);
        let value = JSON.stringify(item[1].year);
        console.log('i18n_HolidayInfoItem_test_0200 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayInfoItem_test_0200 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name i18n_HolidayInfoItem_test_0300
     * @tc.number i18n_HolidayInfoItem_test_0300
     * @tc.desc with HolidayInfoItem
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayInfoItem_test_0300', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item = holiday.getHolidayInfoItemArray(2023);
        let value = JSON.stringify(item[2].month);
        console.log('i18n_HolidayInfoItem_test_0300 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayInfoItem_test_0300 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name i18n_HolidayInfoItem_test_0400
     * @tc.number i18n_HolidayInfoItem_test_0400
     * @tc.desc with HolidayInfoItem
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayInfoItem_test_0400', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item = holiday.getHolidayInfoItemArray(2023);
        let value = JSON.stringify(item[3].day);
        console.log('i18n_HolidayInfoItem_test_0400 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayInfoItem_test_0400 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name i18n_HolidayLocalName_test_0100
     * @tc.number i18n_HolidayLocalName_test_0100
     * @tc.desc with HolidayLocalName
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayLocalName_test_0100', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item = holiday.getHolidayInfoItemArray(2023);
        let value = JSON.stringify(item[0].localNames![1].language);
        console.log('i18n_HolidayLocalName_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayLocalName_test_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name i18n_HolidayLocalName_test_0200
     * @tc.number i18n_HolidayLocalName_test_0200
     * @tc.desc with HolidayLocalName
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_HolidayLocalName_test_0200', Level.LEVEL3, () => {
      try {
        let holiday = new i18n.HolidayManager('/system/lib/US.ics');
        let item = holiday.getHolidayInfoItemArray(2023);
        let value = JSON.stringify(item[0].localNames![1].name);
        console.log('i18n_HolidayLocalName_test_0100 value:', value);
        expect(value).assertFail();
      } catch (e) {
        console.log('i18n_HolidayLocalName_test_0100 code&message:', e.code + e.message);
        expect(e.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name i18n_removePreferredLanguage_NonePermissions_test_0100
     * @tc.number i18n_removePreferredLanguage_NonePermissions_test_0100
     * @tc.desc with NonePermissions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_removePreferredLanguage_NonePermissions_test_0100', Level.LEVEL3, () => {
      let value = i18n.removePreferredLanguage(0);
      console.log('i18n_removePreferredLanguage_NonePermissions_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name i18n_set24HourClock_NonePermissions_test_0100
     * @tc.number i18n_set24HourClock_NonePermissions_test_0100
     * @tc.desc with NonePermissions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_set24HourClock_NonePermissions_test_0100', Level.LEVEL3, () => {
      let value = i18n.set24HourClock(true);
      console.log('i18n_set24HourClock_NonePermissions_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

    /**
     * @tc.name i18n_addPreferredLanguage_NonePermissions_test_0100
     * @tc.number i18n_addPreferredLanguage_NonePermissions_test_0100
     * @tc.desc with NonePermissions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('i18n_addPreferredLanguage_NonePermissions_test_0100', Level.LEVEL3, () => {
      let value = i18n.addPreferredLanguage('zh');
      console.log('i18n_addPreferredLanguage_NonePermissions_test_0100 value:', value);
      expect(value).assertEqual(false);
    })

  })
}