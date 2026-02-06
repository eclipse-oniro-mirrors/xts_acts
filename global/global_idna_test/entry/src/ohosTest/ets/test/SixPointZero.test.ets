import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import testNapi from 'libentry.so'

export default function SixPointZeroTest() {
  describe('SixPointZeroTest', () => {
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
     * @tc.name   testubrk_setUText_0100
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0100
     * @tc.desc   ubrk_setUText with {0x41,0x42, 0x20,0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testubrk_setUText_0100', Level.LEVEL0, () => {
      expect(testNapi.testubrk_setUText_0100()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_0200
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0200
     * @tc.desc   ubrk_setUText with {0x41,0x42, 0x43, 0x44, 0x45, 0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_0200', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0200()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_0300
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0300
     * @tc.desc   ubrk_setUText with 'he's from'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_0300', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0300()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_0400
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0400
     * @tc.desc   ubrk_setUText with 'Couldn't open'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_0400', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0400()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_0500
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0500
     * @tc.desc   ubrk_setUText with 'Cloned Iterator failed'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_0500', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0500()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_0600
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0600
     * @tc.desc   ubrk_setUText with NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_0600', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0600()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_0700
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0700
     * @tc.desc   ubrk_setUText with '马到成功'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_0700', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0700()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_0800
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0800
     * @tc.desc   ubrk_setUText with '不知道我的国家'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_0800', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0800()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_0900
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_0900
     * @tc.desc   ubrk_setUText with '我的国家'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_0900', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0900()).assertTrue()
    })

    /**
     * @tc.name   testubrk_setUText_1000
     * @tc.number SUB_GLOBAL_I18n_testubrk_setUText_1000
     * @tc.desc   ubrk_setUText with '我我我我我'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_setUText_1000', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_1000()).assertTrue()
    })

    /**
     * @tc.name   testubrk_clone_0100
     * @tc.number SUB_GLOBAL_I18n_testubrk_clone_0100
     * @tc.desc   ubrk_clone with 'he's from Africa. Mr.'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testubrk_clone_0100', Level.LEVEL1, () => {
      expect(testNapi.testubrk_clone_0100()).assertTrue()
    })

    /**
     * @tc.name   testubrk_clone_0200
     * @tc.number SUB_GLOBAL_I18n_testubrk_clone_0200
     * @tc.desc   ubrk_clone with 'he's from Africa. Mr.'*2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_clone_0200', Level.LEVEL2, () => {
      expect(testNapi.testubrk_clone_0200()).assertTrue()
    })

    /**
     * @tc.name   testubrk_clone_0300
     * @tc.number SUB_GLOBAL_I18n_testubrk_clone_0300
     * @tc.desc   ubrk_clone with NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testubrk_clone_0300', Level.LEVEL2, () => {
      expect(testNapi.testubrk_clone_0300()).assertTrue()
    })

    /**
     * @tc.name   testU_getUnicodeVersion
     * @tc.number SUB_GLOBAL_Icu_testU_getUnicodeVersion_0100
     * @tc.desc   u_getUnicodeVersion with {0 ,0 ,0, 0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_getUnicodeVersion', Level.LEVEL2, () => {
      expect(testNapi.testU_getUnicodeVersion()).assertTrue();
    })

    /**
     * @tc.name   testU_charAge
     * @tc.number SUB_GLOBAL_Icu_testU_charAge_0100
     * @tc.desc   charAge with {7, 2, 0, 0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_charAge', Level.LEVEL2, () => {
      expect(testNapi.testU_charAge()).assertTrue();
    })

    /**
     * @tc.name   testuldn_localeDisplayName
     * @tc.number SUB_GLOBAL_Icu_testuldn_localeDisplayName_0100
     * @tc.desc   uldn_localeDisplayName with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_localeDisplayName', Level.LEVEL2, () => {
      expect(testNapi.testuldn_localeDisplayName()).assertTrue();
    })

    /**
     * @tc.name   testUldn_getLocale
     * @tc.number SUB_GLOBAL_Icu_testUldn_getLocale_0100
     * @tc.desc   uldn_getLocale with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUldn_getLocale', Level.LEVEL2, () => {
      expect(testNapi.testUldn_getLocale()).assertTrue();
    })

    /**
     * @tc.name   testUldn_getDialectHandling
     * @tc.number SUB_GLOBAL_Icu_testUldn_getDialectHandling_0100
     * @tc.desc   uldn_getDialectHandling with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUldn_getDialectHandling', Level.LEVEL2, () => {
      expect(testNapi.testUldn_getDialectHandling()).assertTrue();
    })

    /**
     * @tc.name   testuldn_languageDisplayName
     * @tc.number SUB_GLOBAL_Icu_testuldn_languageDisplayName_0100
     * @tc.desc   uldn_languageDisplayName with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_languageDisplayName', Level.LEVEL2, () => {
      expect(testNapi.testuldn_languageDisplayName()).assertTrue();
    })

    /**
     * @tc.name   testuldn_scriptDisplayName
     * @tc.number SUB_GLOBAL_Icu_testuldn_scriptDisplayName_0100
     * @tc.desc   uldn_scriptDisplayName with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_scriptDisplayName', Level.LEVEL2, () => {
      expect(testNapi.testuldn_scriptDisplayName()).assertTrue();
    })

    /**
     * @tc.name   testuldn_scriptaCodeDisplayName
     * @tc.number SUB_GLOBAL_Icu_testuldn_scriptaCodeDisplayName_0100
     * @tc.desc   uldn_scriptaCodeDisplayName with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_scriptaCodeDisplayName', Level.LEVEL2, () => {
      expect(testNapi.testuldn_scriptaCodeDisplayName()).assertTrue();
    })

    /**
     * @tc.name   testuldn_regionDisplayName
     * @tc.number SUB_GLOBAL_Icu_testuldn_regionDisplayName_0100
     * @tc.desc   uldn_regionDisplayName with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_regionDisplayName', Level.LEVEL2, () => {
      expect(testNapi.testuldn_regionDisplayName()).assertTrue();
    })

    /**
     * @tc.name   testuldn_variantDisplayName
     * @tc.number SUB_GLOBAL_Icu_testuldn_variantDisplayName_0100
     * @tc.desc   uldn_variantDisplayName with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_variantDisplayName', Level.LEVEL2, () => {
      expect(testNapi.testuldn_variantDisplayName()).assertTrue();
    })

    /**
     * @tc.name   testuldn_keyDisplayName
     * @tc.number SUB_GLOBAL_Icu_testuldn_keyDisplayName_0100
     * @tc.desc   uldn_keyDisplayName with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_keyDisplayName', Level.LEVEL2, () => {
      expect(testNapi.testuldn_keyDisplayName()).assertTrue();
    })

    /**
     * @tc.name   testuldn_keyValueDisplayName
     * @tc.number SUB_GLOBAL_Icu_testuldn_keyValueDisplayName_0100
     * @tc.desc   uldn_keyValueDisplayName with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_keyValueDisplayName', Level.LEVEL2, () => {
      expect(testNapi.testuldn_keyValueDisplayName()).assertTrue();
    })

    /**
     * @tc.name   testuldn_openForContext
     * @tc.number SUB_GLOBAL_Icu_testuldn_openForContext_0100
     * @tc.desc   uldn_openForContext with item.displayLocale, contexts, 3,  &status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testuldn_openForContext', Level.LEVEL2, () => {
      expect(testNapi.testuldn_openForContext()).assertTrue();
    })

    /**
     * @tc.name   testulocdata_getCLDRVersion
     * @tc.number SUB_GLOBAL_Icu_testulocdata_getCLDRVersion_0100
     * @tc.desc   uldn_getCLDRVersion with U_ZERO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testulocdata_getCLDRVersion', Level.LEVEL2, () => {
      expect(testNapi.testulocdata_getCLDRVersion()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_UNICODE_NONCHAR
     * @tc.number SUB_GLOBAL_Icu_testU_IS_UNICODE_NONCHAR_0100
     * @tc.desc   uldn_IS_UNICODE_NONCHAR with 0xfdd0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_UNICODE_NONCHAR', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_UNICODE_NONCHAR()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_UNICODE_CHAR
     * @tc.number SUB_GLOBAL_Icu_testU_IS_UNICODE_CHAR_0100
     * @tc.desc   uldn_IS_UNICODE_CHAR with 0xd700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_UNICODE_CHAR', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_UNICODE_CHAR()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_BMP
     * @tc.number SUB_GLOBAL_Icu_testU_IS_BMP_0100
     * @tc.desc   U_IS_BMP with 0xfdd0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_BMP', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_BMP()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_SUPPLEMENTARY
     * @tc.number SUB_GLOBAL_Icu_testU_IS_SUPPLEMENTARY_0100
     * @tc.desc   U_IS_SUPPLEMENTARY with 0x10005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_SUPPLEMENTARY', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_SUPPLEMENTARY()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_LEAD
     * @tc.number SUB_GLOBAL_Icu_testU_IS_LEAD_0100
     * @tc.desc   U_IS_LEAD with 0x0000d966
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_LEAD', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_LEAD()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_TRAIL
     * @tc.number SUB_GLOBAL_Icu_testU_IS_TRAIL_0100
     * @tc.desc   U_IS_TRAIL with 0xdc00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_TRAIL', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_TRAIL()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_SURROGATE
     * @tc.number SUB_GLOBAL_Icu_testU_IS_SURROGATE_0100
     * @tc.desc   U_IS_SURROGATE with 0xd800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_SURROGATE', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_SURROGATE()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_SURROGATE_LEAD
     * @tc.number SUB_GLOBAL_Icu_testU_IS_SURROGATE_LEAD_0100
     * @tc.desc   U_IS_SURROGATE_LEAD with 0x0df
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_SURROGATE_LEAD', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_SURROGATE_LEAD()).assertTrue();
    })

    /**
     * @tc.name   testU_IS_SURROGATE_TRAIL
     * @tc.number SUB_GLOBAL_Icu_testU_IS_SURROGATE_TRAIL_0100
     * @tc.desc   U_IS_SURROGATE_TRAIL with 0xfdd0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU_IS_SURROGATE_TRAIL', Level.LEVEL2, () => {
      expect(testNapi.testU_IS_SURROGATE_TRAIL()).assertTrue();
    })

    /**
     * @tc.name   testU16_IS_SINGLE
     * @tc.number SUB_GLOBAL_Icu_testU16_IS_SINGLE_0100
     * @tc.desc   U16_IS_SINGLE with 0xd830
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_IS_SINGLE', Level.LEVEL2, () => {
      expect(testNapi.testU16_IS_SINGLE()).assertTrue();
    })

    /**
     * @tc.name   testU16_IS_LEAD
     * @tc.number SUB_GLOBAL_Icu_testU16_IS_LEAD_0100
     * @tc.desc   U16_IS_LEAD with 0xd900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_IS_LEAD', Level.LEVEL2, () => {
      expect(testNapi.testU16_IS_LEAD()).assertTrue();
    })

    /**
     * @tc.name   testU16_IS_TRAIL
     * @tc.number SUB_GLOBAL_Icu_testU16_IS_TRAIL_0100
     * @tc.desc   U16_IS_TRAIL with 0xdd00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_IS_TRAIL', Level.LEVEL2, () => {
      expect(testNapi.testU16_IS_TRAIL()).assertTrue();
    })

    /**
     * @tc.name   testU16_IS_SURROGATE
     * @tc.number SUB_GLOBAL_Icu_testU16_IS_SURROGATE_0100
     * @tc.desc   U16_IS_SURROGATE with '0x0000d966'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_IS_SURROGATE', Level.LEVEL2, () => {
      expect(testNapi.testU16_IS_SURROGATE()).assertTrue();
    })

    /**
     * @tc.name   testU16_IS_SURROGATE_LEAD
     * @tc.number SUB_GLOBAL_Icu_testU16_IS_SURROGATE_LEAD_0100
     * @tc.desc   U16_IS_SURROGATE_LEAD with 0xd830
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_IS_SURROGATE_LEAD', Level.LEVEL2, () => {
      expect(testNapi.testU16_IS_SURROGATE_LEAD()).assertTrue();
    })

    /**
     * @tc.name   testU16_IS_SURROGATE_TRAIL
     * @tc.number SUB_GLOBAL_Icu_testU16_IS_SURROGATE_TRAIL_0100
     * @tc.desc   U16_IS_SURROGATE_TRAIL with 0x401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_IS_SURROGATE_TRAIL', Level.LEVEL2, () => {
      expect(testNapi.testU16_IS_SURROGATE_TRAIL()).assertTrue();
    })

    /**
     * @tc.name   testU16_LEAD
     * @tc.number SUB_GLOBAL_Icu_testU16_LEAD_0100
     * @tc.desc   U16_LEAD with 0xd800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_LEAD', Level.LEVEL2, () => {
      expect(testNapi.testU16_LEAD()).assertTrue();
    })

    /**
     * @tc.name   testU16_TRAIL
     * @tc.number SUB_GLOBAL_Icu_testU16_TRAIL_0100
     * @tc.desc   U16_TRAIL with 0xd830
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_TRAIL', Level.LEVEL2, () => {
      expect(testNapi.testU16_TRAIL()).assertTrue();
    })

    /**
     * @tc.name   testU16_LENGTH
     * @tc.number SUB_GLOBAL_Icu_testU16_LENGTH_0100
     * @tc.desc   U16_LENGTH with 0xd800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_LENGTH', Level.LEVEL2, () => {
      expect(testNapi.testU16_LENGTH()).assertTrue();
    })

    /**
     * @tc.name   testU16_GET_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_GET_UNSAFE_0100
     * @tc.desc   U16_GET_UNSAFE with UChar input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_GET_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_GET_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_GET
     * @tc.number SUB_GLOBAL_Icu_testU16_GET_0100
     * @tc.desc   U16_GET with UChar input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_GET', Level.LEVEL2, () => {
      expect(testNapi.testU16_GET()).assertTrue();
    })

    /**
     * @tc.name   testU16_GET_OR_FFFD
     * @tc.number SUB_GLOBAL_Icu_testU16_GET_OR_FFFD_0100
     * @tc.desc   U16_GET_OR_FFFD with UChar input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_GET_OR_FFFD', Level.LEVEL2, () => {
      expect(testNapi.testU16_GET_OR_FFFD()).assertTrue();
    })

    /**
     * @tc.name   testU16_NEXT_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_NEXT_UNSAFE_0100
     * @tc.desc   U16_NEXT_UNSAFE with UChar input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_NEXT_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_NEXT_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_NEXT
     * @tc.number SUB_GLOBAL_Icu_testU16_NEXT_0100
     * @tc.desc   U16_NEXT with UChar input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_NEXT', Level.LEVEL2, () => {
      expect(testNapi.testU16_NEXT()).assertTrue();
    })

    /**
     * @tc.name   testU16_NEXT_OR_FFFD
     * @tc.number SUB_GLOBAL_Icu_testU16_NEXT_OR_FFFD_0100
     * @tc.desc   U16_NEXT_OR_FFFD with UChar input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_NEXT_OR_FFFD', Level.LEVEL2, () => {
      expect(testNapi.testU16_NEXT_OR_FFFD()).assertTrue();
    })

    /**
     * @tc.name   testU16_APPEND_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_APPEND_UNSAFE_0100
     * @tc.desc   U16_APPEND_UNSAFE with UChar input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_APPEND_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_APPEND_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testu_versionFromString
     * @tc.number SUB_GLOBAL_Icu_testu_versionFromString_0100
     * @tc.desc   u_versionFromString with ver[40] = "72.1"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testu_versionFromString', Level.LEVEL2, () => {
      expect(testNapi.testu_versionFromString()).assertTrue();
    })

    /**
     * @tc.name   testu_versionToString
     * @tc.number SUB_GLOBAL_Icu_testu_versionToString_0100
     * @tc.desc   u_versionToString with {72, 1, 0, 0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testu_versionToString', Level.LEVEL2, () => {
      expect(testNapi.testu_versionToString()).assertTrue();
    })

    /**
     * @tc.name   testu_getVersion
     * @tc.number SUB_GLOBAL_Icu_testu_getVersion_0100
     * @tc.desc   u_getVersion with icuVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testu_getVersion', Level.LEVEL2, () => {
      expect(testNapi.testu_getVersion()).assertTrue();
    })

    /**
     * @tc.name   testu_versionFromUString
     * @tc.number SUB_GLOBAL_Icu_testu_versionFromUString_0100
     * @tc.desc   u_versionFromUString with str[] = u"72.1"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testu_versionFromUString', Level.LEVEL2, () => {
      expect(testNapi.testu_versionFromUString()).assertTrue();
    })

    /**
     * @tc.name   testUCPMapValueFilter
     * @tc.number SUB_GLOBAL_Icu_testUCPMapValueFilter_0100
     * @tc.desc   UCPMapValueFilter with value = 233
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUCPMapValueFilter', Level.LEVEL2, () => {
      expect(testNapi.testUCPMapValueFilter()).assertTrue();
    })

    /**
     * @tc.name   testU16_APPEND
     * @tc.number SUB_GLOBAL_Icu_testU16_APPEND_0100
     * @tc.desc   U16_APPEND with 0xdbff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_APPEND', Level.LEVEL2, () => {
      expect(testNapi.testU16_APPEND()).assertTrue();
    })

    /**
     * @tc.name   testU16_FWD_1_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_FWD_1_UNSAFE_0100
     * @tc.desc   U16_FWD_1_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_FWD_1_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_FWD_1_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_FWD_1
     * @tc.number SUB_GLOBAL_Icu_testU16_FWD_1_0100
     * @tc.desc   U16_FWD_1 with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_FWD_1', Level.LEVEL2, () => {
      expect(testNapi.testU16_FWD_1()).assertTrue();
    })

    /**
     * @tc.name   testU16_FWD_N_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_FWD_N_UNSAFE_0100
     * @tc.desc   U16_FWD_N_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_FWD_N_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_FWD_N_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_FWD_N
     * @tc.number SUB_GLOBAL_Icu_testU16_FWD_N_0100
     * @tc.desc   U16_FWD_N with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_FWD_N', Level.LEVEL2, () => {
      expect(testNapi.testU16_FWD_N()).assertTrue();
    })

    /**
     * @tc.name   testU16_SET_CP_START_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_SET_CP_START_UNSAFE_0100
     * @tc.desc   U16_SET_CP_START_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_SET_CP_START_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_SET_CP_START_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_SET_CP_START
     * @tc.number SUB_GLOBAL_Icu_testU16_SET_CP_START_0100
     * @tc.desc   U16_SET_CP_START with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_SET_CP_START', Level.LEVEL2, () => {
      expect(testNapi.testU16_SET_CP_START()).assertTrue();
    })

    /**
     * @tc.name   testU16_PREV_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_PREV_UNSAFE_0100
     * @tc.desc   U16_PREV_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_PREV_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_PREV_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_PREV
     * @tc.number SUB_GLOBAL_Icu_testU16_PREV_0100
     * @tc.desc   U16_PREV with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_PREV', Level.LEVEL2, () => {
      expect(testNapi.testU16_PREV()).assertTrue();
    })

    /**
     * @tc.name   testU16_PREV_OR_FFFD
     * @tc.number SUB_GLOBAL_Icu_testU16_PREV_OR_FFFD_0100
     * @tc.desc   U16_PREV_OR_FFFD with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_PREV_OR_FFFD', Level.LEVEL2, () => {
      expect(testNapi.testU16_PREV_OR_FFFD()).assertTrue();
    })

    /**
     * @tc.name   testU16_BACK_1_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_BACK_1_UNSAFE_0100
     * @tc.desc   U16_BACK_1_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_BACK_1_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_BACK_1_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_BACK_1
     * @tc.number SUB_GLOBAL_Icu_testU16_BACK_1_0100
     * @tc.desc   U16_BACK_1 with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_BACK_1', Level.LEVEL2, () => {
      expect(testNapi.testU16_BACK_1()).assertTrue();
    })

    /**
     * @tc.name   testU16_BACK_N_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_BACK_N_UNSAFE_0100
     * @tc.desc   U16_BACK_N_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_BACK_N_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_BACK_N_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_BACK_N
     * @tc.number SUB_GLOBAL_Icu_testU16_BACK_N_0100
     * @tc.desc   U16_BACK_N with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_BACK_N', Level.LEVEL2, () => {
      expect(testNapi.testU16_BACK_N()).assertTrue();
    })

    /**
     * @tc.name   testU16_SET_CP_LIMIT_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU16_SET_CP_LIMIT_UNSAFE_0100
     * @tc.desc   U16_SET_CP_LIMIT_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_SET_CP_LIMIT_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU16_SET_CP_LIMIT_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU16_SET_CP_LIMIT
     * @tc.number SUB_GLOBAL_Icu_testU16_SET_CP_LIMIT_0100
     * @tc.desc   U16_SET_CP_LIMIT with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU16_SET_CP_LIMIT', Level.LEVEL2, () => {
      expect(testNapi.testU16_SET_CP_LIMIT()).assertTrue();
    })

    /**
     * @tc.name   testU8_IS_SINGLE
     * @tc.number SUB_GLOBAL_Icu_testU8_IS_SINGLE_0100
     * @tc.desc   U8_IS_SINGLE with 0x7a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_IS_SINGLE', Level.LEVEL2, () => {
      expect(testNapi.testU8_IS_SINGLE()).assertTrue();
    })

    /**
     * @tc.name   testU8_IS_LEAD
     * @tc.number SUB_GLOBAL_Icu_testU8_IS_LEAD_0100
     * @tc.desc   U8_IS_LEAD with 0xc2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_IS_LEAD', Level.LEVEL2, () => {
      expect(testNapi.testU8_IS_LEAD()).assertTrue();
    })

    /**
     * @tc.name   testU8_IS_TRAIL
     * @tc.number SUB_GLOBAL_Icu_testU8_IS_TRAIL_0100
     * @tc.desc   U8_IS_TRAIL with 0x80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_IS_TRAIL', Level.LEVEL2, () => {
      expect(testNapi.testU8_IS_TRAIL()).assertTrue();
    })

    /**
     * @tc.name   testU8_LENGTH
     * @tc.number SUB_GLOBAL_Icu_testU8_LENGTH_0100
     * @tc.desc   U8_LENGTH with 0x80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_LENGTH', Level.LEVEL2, () => {
      expect(testNapi.testU8_LENGTH()).assertTrue();
    })

    /**
     * @tc.name   testU8_GET_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_GET_UNSAFE_0100
     * @tc.desc   U8_GET_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_GET_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_GET_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_GET
     * @tc.number SUB_GLOBAL_Icu_testU8_GET_0100
     * @tc.desc   U8_GET with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_GET', Level.LEVEL2, () => {
      expect(testNapi.testU8_GET()).assertTrue();
    })

    /**
     * @tc.name   testU8_GET_OR_FFFD
     * @tc.number SUB_GLOBAL_Icu_testU8_GET_OR_FFFD_0100
     * @tc.desc   U8_GET_OR_FFFD with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_GET_OR_FFFD', Level.LEVEL2, () => {
      expect(testNapi.testU8_GET_OR_FFFD()).assertTrue();
    })

    /**
     * @tc.name   testU8_NEXT_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_NEXT_UNSAFE_0100
     * @tc.desc   U8_NEXT_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_NEXT_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_NEXT_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_NEXT
     * @tc.number SUB_GLOBAL_Icu_testU8_NEXT_0100
     * @tc.desc   U8_NEXT with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_NEXT', Level.LEVEL2, () => {
      expect(testNapi.testU8_NEXT()).assertTrue();
    })

    /**
     * @tc.name   testU8_NEXT_OR_FFFD
     * @tc.number SUB_GLOBAL_Icu_testU8_NEXT_OR_FFFD_0100
     * @tc.desc   U8_NEXT_OR_FFFD with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_NEXT_OR_FFFD', Level.LEVEL2, () => {
      expect(testNapi.testU8_NEXT_OR_FFFD()).assertTrue();
    })

    /**
     * @tc.name   testU8_APPEND_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_APPEND_UNSAFE_0100
     * @tc.desc   U8_APPEND_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_APPEND_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_APPEND_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_APPEND
     * @tc.number SUB_GLOBAL_Icu_testU8_APPEND_0100
     * @tc.desc   U8_APPEND with 0x8d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_APPEND', Level.LEVEL2, () => {
      expect(testNapi.testU8_APPEND()).assertTrue();
    })

    /**
     * @tc.name   testU8_FWD_1_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_FWD_1_UNSAFE_0100
     * @tc.desc   U8_FWD_1_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_FWD_1_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_FWD_1_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_FWD_1
     * @tc.number SUB_GLOBAL_Icu_testU8_FWD_1_0100
     * @tc.desc   U8_FWD_1 with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_FWD_1', Level.LEVEL2, () => {
      expect(testNapi.testU8_FWD_1()).assertTrue();
    })

    /**
     * @tc.name   testU8_FWD_N_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_FWD_N_UNSAFE_0100
     * @tc.desc   U8_FWD_N_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_FWD_N_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_FWD_N_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_FWD_N
     * @tc.number SUB_GLOBAL_Icu_testU8_FWD_N_0100
     * @tc.desc   U8_FWD_N with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_FWD_N', Level.LEVEL2, () => {
      expect(testNapi.testU8_FWD_N()).assertTrue();
    })

    /**
     * @tc.name   testU8_SET_CP_START_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_SET_CP_START_UNSAFE_0100
     * @tc.desc   U8_SET_CP_START_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_SET_CP_START_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_SET_CP_START_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_SET_CP_START
     * @tc.number SUB_GLOBAL_Icu_testU8_SET_CP_START_0100
     * @tc.desc   U8_SET_CP_START with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_SET_CP_START', Level.LEVEL2, () => {
      expect(testNapi.testU8_SET_CP_START()).assertTrue();
    })

    /**
     * @tc.name   testU8_TRUNCATE_IF_INCOMPLETE
     * @tc.number SUB_GLOBAL_Icu_testU8_TRUNCATE_IF_INCOMPLETE_0100
     * @tc.desc   U8_TRUNCATE_IF_INCOMPLETE with "\xED\xA0"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_TRUNCATE_IF_INCOMPLETE', Level.LEVEL2, () => {
      expect(testNapi.testU8_TRUNCATE_IF_INCOMPLETE()).assertTrue();
    })

    /**
     * @tc.name   testU8_PREV_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_PREV_UNSAFE_0100
     * @tc.desc   U8_PREV_UNSAFE with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_PREV_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_PREV_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_PREV
     * @tc.number SUB_GLOBAL_Icu_testU8_PREV_0100
     * @tc.desc   U8_PREV with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_PREV', Level.LEVEL2, () => {
      expect(testNapi.testU8_PREV()).assertTrue();
    })

    /**
     * @tc.name   testU8_PREV_OR_FFFD
     * @tc.number SUB_GLOBAL_Icu_testU8_PREV_OR_FFFD_0100
     * @tc.desc   U8_PREV_OR_FFFD with input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_PREV_OR_FFFD', Level.LEVEL2, () => {
      expect(testNapi.testU8_PREV_OR_FFFD()).assertTrue();
    })

    /**
     * @tc.name   testU8_BACK_1_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_BACK_1_UNSAFE_0100
     * @tc.desc   U8_BACK_1_UNSAFE with uint8_t s[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_BACK_1_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_BACK_1_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_BACK_1
     * @tc.number SUB_GLOBAL_Icu_testU8_BACK_1_0100
     * @tc.desc   U8_BACK_1 with uint8_t s[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_BACK_1', Level.LEVEL2, () => {
      expect(testNapi.testU8_BACK_1()).assertTrue();
    })

    /**
     * @tc.name   testU8_BACK_N_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_BACK_N_UNSAFE_0100
     * @tc.desc   U8_BACK_N_UNSAFE with uint8_t s[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_BACK_N_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_BACK_N_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_BACK_N
     * @tc.number SUB_GLOBAL_Icu_testU8_BACK_N_0100
     * @tc.desc   U8_BACK_N with uint8_t s[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_BACK_N', Level.LEVEL2, () => {
      expect(testNapi.testU8_BACK_N()).assertTrue();
    })

    /**
     * @tc.name   testU8_SET_CP_LIMIT_UNSAFE
     * @tc.number SUB_GLOBAL_Icu_testU8_SET_CP_LIMIT_UNSAFE_0100
     * @tc.desc   U8_SET_CP_LIMIT_UNSAFE uint8_t s[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_SET_CP_LIMIT_UNSAFE', Level.LEVEL2, () => {
      expect(testNapi.testU8_SET_CP_LIMIT_UNSAFE()).assertTrue();
    })

    /**
     * @tc.name   testU8_SET_CP_LIMIT
     * @tc.number SUB_GLOBAL_Icu_testU8_SET_CP_LIMIT_0100
     * @tc.desc   U8_SET_CP_LIMIT uint8_t s[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testU8_SET_CP_LIMIT', Level.LEVEL2, () => {
      expect(testNapi.testU8_SET_CP_LIMIT()).assertTrue();
    })

    /**
     * @tc.name   testutf8_back1SafeBody
     * @tc.number SUB_GLOBAL_Icu_testutf8_back1SafeBody_0100
     * @tc.desc   utf8_back1SafeBody uint8_t input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testutf8_back1SafeBody', Level.LEVEL2, () => {
      expect(testNapi.testutf8_back1SafeBody()).assertTrue();
    })

    /**
     * @tc.name   testutf8_prevCharSafeBody
     * @tc.number SUB_GLOBAL_Icu_testutf8_prevCharSafeBody_0100
     * @tc.desc   utf8_prevCharSafeBody uint8_t input[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testutf8_prevCharSafeBody', Level.LEVEL2, () => {
      expect(testNapi.testutf8_prevCharSafeBody()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0100
     * @tc.name      testOH_i18n_GetTimeZoneRules_0100
     * @tc.desc      OH_i18n_GetTimeZoneRules with Asia/Shanghai
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testOH_i18n_GetTimeZoneRules_0100', Level.LEVEL0, () => {
      expect(testNapi.testOH_i18n_GetTimeZoneRules_0100()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0200
     * @tc.name      testOH_i18n_GetTimeZoneRules_0200
     * @tc.desc      OH_i18n_GetTimeZoneRules with aaa
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetTimeZoneRules_0200', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetTimeZoneRules_0200()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0300
     * @tc.name      testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRules_0300
     * @tc.desc      OH_i18n_GetTimeZoneRules with Asia/Shanghai
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRules_0300', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRules_0300()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0400
     * @tc.name      testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRules_0400
     * @tc.desc      OH_i18n_GetTimeZoneRules with Asia/Shanghai
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRules_0400', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRules_0400()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0500
     * @tc.name      testOH_i18n_GetNextStartFromTimeArrayTimeZoneRules_0500
     * @tc.desc      OH_i18n_GetTimeZoneRules with Asia/Shanghai
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetNextStartFromTimeArrayTimeZoneRules_0500', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetNextStartFromTimeArrayTimeZoneRules_0500()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0600
     * @tc.name      testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRules_0600
     * @tc.desc      OH_i18n_GetTimeZoneRules with Asia/Shanghai
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRules_0600', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRules_0600()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0700
     * @tc.name      testOH_i18n_GetStartTimeAt_0700
     * @tc.desc      OH_i18n_GetTimeZoneRules with Asia/Shanghai
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetStartTimeAt_0700', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetStartTimeAt_0700()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0800
     * @tc.name      testOH_i18n_GetTimeZoneRules_0800
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetTimeZoneRules_0800', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetTimeZoneRules_0800()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_0900
     * @tc.name      testOH_i18n_GetFirstStartFromAnnualTimeZoneRules_0900
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetFirstStartFromAnnualTimeZoneRules_0900', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetFirstStartFromAnnualTimeZoneRules_0900()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1000
     * @tc.name      testOH_i18n_GetFinalStartFromAnnualTimeZoneRules_1000
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetFinalStartFromAnnualTimeZoneRules_1000', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetFinalStartFromAnnualTimeZoneRules_1000()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1100
     * @tc.name      testOH_i18n_GetNextStartFromAnnualTimeZoneRules_1100
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetNextStartFromAnnualTimeZoneRules_1100', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetNextStartFromAnnualTimeZoneRules_1100()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1200
     * @tc.name      testOH_i18n_GetPrevStartFromAnnualTimeZoneRules_1200
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetPrevStartFromAnnualTimeZoneRules_1200', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetPrevStartFromAnnualTimeZoneRules_1200()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1300
     * @tc.name      testOH_i18n_GetStartInYear_1300
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetStartInYear_1300', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetStartInYear_1300()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1400
     * @tc.name      testOH_i18n_GetTimeZoneRules_1400
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetTimeZoneRules_1400', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetTimeZoneRules_1400()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1500
     * @tc.name      testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRule_1500
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRule_1500', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRule_1500()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1600
     * @tc.name      testOH_i18n_GetFirstStartFromAnnualTimeZoneRule_1600
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetFirstStartFromAnnualTimeZoneRule_1600', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetFirstStartFromAnnualTimeZoneRule_1600()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1700
     * @tc.name      testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRule_1700
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRule_1700', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRule_1700()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_1900
     * @tc.name      testOH_i18n_GetNextStartFromTimeArrayTimeZoneRule_1900
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetNextStartFromTimeArrayTimeZoneRule_1900', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetNextStartFromTimeArrayTimeZoneRule_1900()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2000
     * @tc.name      testOH_i18n_GetNextStartFromAnnualTimeZoneRule_2000
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetNextStartFromAnnualTimeZoneRule_2000', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetNextStartFromAnnualTimeZoneRule_2000()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2100
     * @tc.name      testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRule_2100
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRule_2100', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRule_2100()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2200
     * @tc.name      testOH_i18n_GetPrevStartFromAnnualTimeZoneRule_2200
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetPrevStartFromAnnualTimeZoneRule_2200', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetPrevStartFromAnnualTimeZoneRule_2200()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2300
     * @tc.name      testOH_i18n_GetStartTimeAt_2300
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetStartTimeAt_2300', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetStartTimeAt_2300()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2400
     * @tc.name      testOH_i18n_GetStartInYear_2400
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetStartInYear_2400', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetStartInYear_2400()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2500
     * @tc.name      testOH_i18n_TimeZoneRuleQuery_2500
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_TimeZoneRuleQuery_2500', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_TimeZoneRuleQuery_2500()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2600
     * @tc.name      testTimeArrayZoneRule_2600
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimeArrayZoneRule_2600', Level.LEVEL2, () => {
      expect(testNapi.testTimeArrayZoneRule_2600()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2700
     * @tc.name      testOH_i18n_GetTimeZoneRules_2700
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetTimeZoneRules_2700', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetTimeZoneRules_2700()).assertTrue();
    })

    /**
     * @tc.number    SUB_GLOBAL_I18n_C_API_GetTimeZoneInformation_2800
     * @tc.name      testOH_i18n_GetTimeZoneRules_2800
     * @tc.desc      OH_i18n_GetTimeZoneRules with America/Santiago
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOH_i18n_GetTimeZoneRules_2800', Level.LEVEL2, () => {
      expect(testNapi.testOH_i18n_GetTimeZoneRules_2800()).assertTrue();
    })

  })
}