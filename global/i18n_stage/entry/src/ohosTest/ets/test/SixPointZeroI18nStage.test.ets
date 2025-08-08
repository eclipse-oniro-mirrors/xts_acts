import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n, intl } from '@kit.LocalizationKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function SixPointZeroI18nStageTest() {
  describe('SixPointZeroI18nStageTest', () => {
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

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0100
    * @tc.name      : testi18n_getMilliseconds_0100
    * @tc.desc      : getMilliseconds with Africa/Cairo
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testi18n_getMilliseconds_0100', Level.LEVEL0, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone('Africa/Cairo');
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date = new Date(2025, 3, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj = zoneOffsetTransition.getMilliseconds();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        timeZone: 'Africa/Cairo',
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      expect(dateFormat).assertEqual('2025/4/25 GMT+3 01:00:00');
      expect(sj2).assertEqual(3);
      expect(sj3).assertEqual(2);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0200
    * @tc.name      : testi18n_getMilliseconds_0200
    * @tc.desc      : getMilliseconds with America/Tijuana
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testi18n_getMilliseconds_0200', Level.LEVEL2, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone('America/Tijuana');
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date = new Date(2025, 4, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj = zoneOffsetTransition.getMilliseconds();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        timeZone: 'America/Tijuana',
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      expect(dateFormat).assertEqual('2025/11/2 GMT-8 01:00:00');
      expect(sj2).assertEqual(-8);
      expect(sj3).assertEqual(-7);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0300
    * @tc.name      : testi18n_getMilliseconds_0300
    * @tc.desc      : getMilliseconds with NULL
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testi18n_getMilliseconds_0300', Level.LEVEL2, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date = new Date(2025, 1, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj = zoneOffsetTransition.getMilliseconds();
      let tmzid = timeZone.getID();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        timeZone: tmzid,
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      expect(dateFormat).assertEqual('1970/1/1 GMT+8 08:00:00');
      expect(sj2).assertEqual(0);
      expect(sj3).assertEqual(0);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0400
    * @tc.name      : testi18n_getMilliseconds_0400
    * @tc.desc      : getMilliseconds with abcd
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testi18n_getMilliseconds_0400', Level.LEVEL2, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone('abcd');
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date = new Date(2025, 1, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj = zoneOffsetTransition.getMilliseconds();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      let getid = timeZone.getID();
      expect(dateFormat).assertEqual('1970/1/1 GMT+8 08:00:00');
      expect(sj2).assertEqual(0);
      expect(sj3).assertEqual(0);
      expect(getid).assertEqual('Etc/Unknown');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0500
    * @tc.name      : testi18n_getMilliseconds_0500
    * @tc.desc      : nextTransition with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testi18n_getMilliseconds_0500', Level.LEVEL2, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition();
      let sj = zoneOffsetTransition.getMilliseconds();
      let tmzid = timeZone.getID();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        timeZone: tmzid,
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter();
      let sj3 = zoneOffsetTransition.getOffsetBefore();
      expect(dateFormat).assertEqual('1970/1/1 GMT+8 08:00:00');
      expect(sj2).assertEqual(0);
      expect(sj3).assertEqual(0);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetUnicodeWrappedFilePath_0100
    * @tc.name      : test_getUnicodeWrappedFilePath_0100
    * @tc.desc      : Locale with en
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_getUnicodeWrappedFilePath_0100', Level.LEVEL0, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale: Intl.Locale = new Intl.Locale("en");
      let mirrorpath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      expect(mirrorpath).assertEqual('/data/out/tmp')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetUnicodeWrappedFilePath_0200
    * @tc.name      : test_getUnicodeWrappedFilePath_0200
    * @tc.desc      : Locale with zh
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getUnicodeWrappedFilePath_0200', Level.LEVEL2, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale: Intl.Locale = new Intl.Locale("zh");
      let mirrorpath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      expect(mirrorpath).assertEqual('/data/out/tmp')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetUnicodeWrappedFilePath_0400
    * @tc.name      : test_getUnicodeWrappedFilePath_0400
    * @tc.desc      : Locale with error
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getUnicodeWrappedFilePath_0400', Level.LEVEL2, () => {
      let delimiter: string = '/';
      let locale: Intl.Locale = new Intl.Locale("zh");
      try {
        i18n.I18NUtil.getUnicodeWrappedFilePath('error', delimiter, locale);
      } catch (e) {
        console.log('test_getUnicodeWrappedFilePath_0400 error code:' + e.code);
        expect(e.code).assertEqual('890001')
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatByPattern_0100
    * @tc.name      : test_getSimpleDateTimeFormatByPattern_0100
    * @tc.desc      : Locale with ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_getSimpleDateTimeFormatByPattern_0100', Level.LEVEL0, () => {
      let date: Date = new Date(2024, 11, 13);
      let locale: Intl.Locale = new Intl.Locale('ar');
      let formatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("'month('M')'", locale);
      let formatteDate: string = formatter.format(date);
      expect(formatteDate).assertEqual('month(١٢)')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatByPattern_0200
    * @tc.name      : test_getSimpleDateTimeFormatByPattern_0200
    * @tc.desc      : Locale with zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleDateTimeFormatByPattern_0200', Level.LEVEL2, () => {
      let date: Date = new Date(2024, 11, 13);
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let formatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("'month('M')'", locale);
      let formatteDate: string = formatter.format(date);
      expect(formatteDate).assertEqual('month(12)')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatByPattern_0400
    * @tc.name      : test_getSimpleDateTimeFormatByPattern_0400
    * @tc.desc      : Locale with error
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleDateTimeFormatByPattern_0400', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      try {
        i18n.getSimpleDateTimeFormatByPattern("error", locale);
      } catch (e) {
        console.log('test_getSimpleDateTimeFormatByPattern_0400 error code:' + e.code);
        expect(e.code).assertEqual('890001')
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatBySkeleton_0100
    * @tc.name      : test_getSimpleDateTimeFormatBySkeleton_0100
    * @tc.desc      : Locale with ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_getSimpleDateTimeFormatBySkeleton_0100', Level.LEVEL0, () => {
      let date: Date = new Date(2024, 11, 13);
      let locale: Intl.Locale = new Intl.Locale('ar');
      let skeletonFormatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton("yMd", locale);
      let formatteDate: string = skeletonFormatter.format(date);
      expect(formatteDate).assertEqual('١٣‏/١٢‏/٢٠٢٤')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatBySkeleton_0200
    * @tc.name      : test_getSimpleDateTimeFormatBySkeleton_0200
    * @tc.desc      : Locale with zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleDateTimeFormatBySkeleton_0200', Level.LEVEL2, () => {
      let date: Date = new Date(2024, 11, 13);
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let skeletonFormatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton("yMd", locale);
      let formatteDate: string = skeletonFormatter.format(date);
      expect(formatteDate).assertEqual('2024/12/13')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatBySkeleton_0400
    * @tc.name      : test_getSimpleDateTimeFormatBySkeleton_0400
    * @tc.desc      : Locale with error
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleDateTimeFormatBySkeleton_0400', Level.LEVEL2, () => {
      try {
        let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
        i18n.getSimpleDateTimeFormatBySkeleton("error", locale);
      } catch (e) {
        console.log('test_getSimpleDateTimeFormatBySkeleton_0400 error code:' + e.code);
        expect(e.code).assertEqual('890001')
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleNumberFormatBySkeleton_0100
    * @tc.name      : test_getSimpleNumberFormatBySkeleton_0100
    * @tc.desc      : Locale with ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_getSimpleNumberFormatBySkeleton_0100', Level.LEVEL0, () => {
      let locale: Intl.Locale = new Intl.Locale('ar');
      let formatter: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("%", locale);
      let formattedNumber: string = formatter.format(10);
      expect(formattedNumber).assertEqual('١٠٪؜‏')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleNumberFormatBySkeleton_0200
    * @tc.name      : test_getSimpleNumberFormatBySkeleton_0200
    * @tc.desc      : Locale with zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleNumberFormatBySkeleton_0200', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let formatter: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("%", locale);
      let formattedNumber: string = formatter.format(10);
      expect(formattedNumber).assertEqual('10%')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleNumberFormatBySkeleton_0400
    * @tc.name      : test_getSimpleNumberFormatBySkeleton_0400
    * @tc.desc      : Locale with error
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleNumberFormatBySkeleton_0400', Level.LEVEL2, () => {
      try {
        let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
        i18n.getSimpleNumberFormatBySkeleton("%", locale);
      } catch (e) {
        console.log('test_getSimpleNumberFormatBySkeleton_0400 error code:' + e.code);
        expect(e.code).assertEqual('890001')
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18N_getSystemLocaleInstance_0100
    * @tc.name      : testGetSystemLocaleInstance_0100
    * @tc.desc      : obtain the locale of current system
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testGetSystemLocaleInstance_0100', Level.LEVEL2, () => {
      let value = i18n.System.getSystemLocaleInstance();
      console.log('testGetSystemLocaleInstance_0100' + value.toString());
      expect(value.toString() == null).assertFalse();
      expect(value.baseName == null).assertFalse();
      expect(value.language == null).assertFalse();
    })

  })
}