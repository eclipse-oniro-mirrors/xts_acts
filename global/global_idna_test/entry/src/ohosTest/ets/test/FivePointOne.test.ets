import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so'
export default function FivePointOneTest() {
  describe('FivePointOneTest', () => {
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
    * @tc.number    : SUB_GLOBAL_utext_openUTF8_0100
    * @tc.name      : testutext_openUTF8_0100
    * @tc.desc      : testutext_openUTF8
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_openUTF8_0100',0,() =>{
      expect(testNapi.testutext_openUTF8()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utext_openUTF8_close_0100
    * @tc.name      : testutext_openUTF8_close_0100
    * @tc.desc      : testutext_openUTF8_close
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_openUTF8_close_0100',0,() =>{
      expect(testNapi.testutext_openUTF8_close()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_clone_0100
    * @tc.name      : testutext_clone_0100
    * @tc.desc      : testutext_clone
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_clone_0100',0,() =>{
      expect(testNapi.testutext_clone()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_equals_0100
    * @tc.name      : testutext_equals_0100
    * @tc.desc      : testutext_equals
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_equals_0300',0,() =>{
      expect(testNapi.testutext_equals()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_nativeLength_0100
    * @tc.name      : testutext_nativeLength_0100
    * @tc.desc      : testutext_nativeLength
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_nativeLength_0100',0,() =>{
      expect(testNapi.testutext_nativeLength()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utext_char32At_0100
    * @tc.name      : testutext_char32At_0100
    * @tc.desc      : testutext_char32At
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_char32At_0100',0,() =>{
      expect(testNapi.testutext_char32At()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_current32_0100
    * @tc.name      : testutext_current32_0100
    * @tc.desc      : testutext_current32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_current32_0100',0,() =>{
      expect(testNapi.testutext_current32()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_next32_0100
    * @tc.name      : testutext_next32_0100
    * @tc.desc      : testutext_next32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_next32_0100',0,() =>{
      expect(testNapi.testutext_next32()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_previous32_0100
    * @tc.name      : testutext_previous32_0100
    * @tc.desc      : testutext_previous32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_previous32_0100',0,() =>{
      expect(testNapi.testutext_previous32()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_next32From_0100
    * @tc.name      : testutext_next32From_0100
    * @tc.desc      : testutext_next32From
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_next32From_0100',0,() =>{
      expect(testNapi.testutext_next32From()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_previous32From_0100
    * @tc.name      : testutext_previous32From_0100
    * @tc.desc      : testutext_previous32From
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_previous32From_0100',0,() =>{
      expect(testNapi.testutext_previous32From()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_getNativeIndex_0100
    * @tc.name      : testutext_getNativeIndex_0100
    * @tc.desc      : testutext_getNativeIndex
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_getNativeIndex_0100',0,() =>{
      expect(testNapi.testutext_getNativeIndex()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_setNativeIndex_moveIndex32_0100
    * @tc.name      : testutext_setNativeIndex_moveIndex32_0100
    * @tc.desc      : testutext_setNativeIndex_moveIndex32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_setNativeIndex_moveIndex32_0100',0,() =>{
      expect(testNapi.testutext_setNativeIndex_moveIndex32()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_getPreviousNativeIndex_0100
    * @tc.name      : testutext_getPreviousNativeIndex_0100
    * @tc.desc      : testutext_getPreviousNativeIndex
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_getPreviousNativeIndex_0100',0,() =>{
      expect(testNapi.testutext_getPreviousNativeIndex()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_utest_extract_0100
    * @tc.name      : testutext_extract_0100
    * @tc.desc      : testutext_extract
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testutext_extract_0100',0,() =>{
      expect(testNapi.testutext_extract()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strlen_0100
    * @tc.name      : testu_strlen_0100
    * @tc.desc      : testu_strlen
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strlen_0100',0,() =>{
      expect(testNapi.testu_strlen()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_countChar32_0100
    * @tc.name      : testu_countChar32_0100
    * @tc.desc      : testu_countChar32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_countChar32_0100',0,() =>{
      expect(testNapi.testu_countChar32()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strHasMoreChar32Than_0100
    * @tc.name      : testu_strHasMoreChar32Than_0100
    * @tc.desc      : testu_strHasMoreChar32Than
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strHasMoreChar32Than_0100',0,() =>{
      expect(testNapi.testu_strHasMoreChar32Than()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strcat_0100
    * @tc.name      : testu_strcat_0100
    * @tc.desc      : testu_strcat
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strcat_0100',0,() =>{
      expect(testNapi.testu_strcat()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strncat_0100
    * @tc.name      : testu_strncat_0100
    * @tc.desc      : testu_strncat
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strncat_0100',0,() =>{
      expect(testNapi.testu_strncat()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strstr_0100
    * @tc.name      : testu_strstr_0100
    * @tc.desc      : testu_strstr
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strstr_0100',0,() =>{
      expect(testNapi.testu_strstr()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strFindFirst_0100
    * @tc.name      : testu_strFindFirst_0100
    * @tc.desc      : testu_strFindFirst
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strFindFirst_0100',0,() =>{
      expect(testNapi.testu_strFindFirst()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strchr_0100
    * @tc.name      : testu_strchr_0100
    * @tc.desc      : testu_strchr
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strchr_0100',0,() =>{
      expect(testNapi.testu_strchr()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strchr32_0100
    * @tc.name      : testu_strchr32_0100
    * @tc.desc      : testu_strchr32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strchr32_0100',0,() =>{
      expect(testNapi.testu_strchr32()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strrstr_0100
    * @tc.name      : testu_strrstr_0100
    * @tc.desc      : testu_strrstr
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strrstr_0100',0,() =>{
      expect(testNapi.testu_strrstr()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strFindLast_0100
    * @tc.name      : testu_strFindLast_0100
    * @tc.desc      : testu_strFindLast
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strFindLast_0100',0,() =>{
      expect(testNapi.testu_strFindLast()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strrchr_0100
    * @tc.name      : testu_strrchr_0100
    * @tc.desc      : testu_strrchr
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strrchr_0100',0,() =>{
      expect(testNapi.testu_strrchr()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strrchr32_0100
    * @tc.name      : testu_strrchr32_0100
    * @tc.desc      : testu_strrchr32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strrchr32_0100',0,() =>{
      expect(testNapi.testu_strrchr32()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strpbrk_0100
    * @tc.name      : testu_strpbrk_0100
    * @tc.desc      : testu_strpbrk
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strpbrk_0100',0,() =>{
      expect(testNapi.testu_strpbrk()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strcspn_0100
    * @tc.name      : testu_strcspn_0100
    * @tc.desc      : testu_strcspn
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strcspn_0100',0,() =>{
      expect(testNapi.testu_strcspn()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strspn_0100
    * @tc.name      : testu_strspn_0100
    * @tc.desc      : testu_strspn
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strspn_0100',0,() =>{
      expect(testNapi.testu_strspn()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strtok_r_0100
    * @tc.name      : testu_strtok_r_0100
    * @tc.desc      : testu_strtok_r
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strtok_r_0100',0,() =>{
      expect(testNapi.testu_strtok_r()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strcmp_0100
    * @tc.name      : testu_strcmp_0100
    * @tc.desc      : testu_strcmp
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strcmp_0100',0,() =>{
      expect(testNapi.testu_strcmp()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strcmpCodePointOrder_0100
    * @tc.name      : testu_strcmpCodePointOrder_0100
    * @tc.desc      : testu_strcmpCodePointOrder
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strcmpCodePointOrder_0100',0,() =>{
      expect(testNapi.testu_strcmpCodePointOrder()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strCompare_0100
    * @tc.name      : testu_strCompare_0100
    * @tc.desc      : testu_strCompare
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strCompare_0100',0,() =>{
      expect(testNapi.testu_strCompare()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strCaseCompare_0100
    * @tc.name      : testu_strCaseCompare_0100
    * @tc.desc      : testu_strCaseCompare
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strCaseCompare_0100',0,() =>{
      expect(testNapi.testu_strCaseCompare()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strncmp_0100
    * @tc.name      : testu_strncmp_0100
    * @tc.desc      : testu_strncmp
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strncmp_0100',0,() =>{
      expect(testNapi.testu_strncmp()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strncmpCodePointOrder_0100
    * @tc.name      : testu_strncmpCodePointOrder_0100
    * @tc.desc      : testu_strncmpCodePointOrder
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strncmpCodePointOrder_0100',0,() =>{
      expect(testNapi.testu_strncmpCodePointOrder()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strcasecmp_0100
    * @tc.name      : testu_strcasecmp_0100
    * @tc.desc      : testu_strcasecmp
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strcasecmp_0100',0,() =>{
      expect(testNapi.testu_strcasecmp()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strncasecmp_0100
    * @tc.name      : testu_strncasecmp_0100
    * @tc.desc      : testu_strncasecmp
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strncasecmp_0100',0,() =>{
      expect(testNapi.testu_strncasecmp()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memcasecmp_0100
    * @tc.name      : testu_memcasecmp_0100
    * @tc.desc      : testu_memcasecmp
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memcasecmp_0100',0,() =>{
      expect(testNapi.testu_memcasecmp()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strcpy_0100
    * @tc.name      : testu_strcpy_0100
    * @tc.desc      : testu_strcpy
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strcpy_0100',0,() =>{
      expect(testNapi.testu_strcpy()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strncpy_0100
    * @tc.name      : testu_strncpy_0100
    * @tc.desc      : testu_strncpy
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strncpy_0100',0,() =>{
      expect(testNapi.testu_strncpy()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memcpy_0100
    * @tc.name      : testu_memcpy_0100
    * @tc.desc      : testu_memcpy
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memcpy_0100',0,() =>{
      expect(testNapi.testu_memcpy()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memmove_0100
    * @tc.name      : testu_memmove_0100
    * @tc.desc      : testu_memmove
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memmove_0100',0,() =>{
      expect(testNapi.testu_memmove()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memset_0100
    * @tc.name      : testu_memset_0100
    * @tc.desc      : testu_memset
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memset_0100',0,() =>{
      expect(testNapi.testu_memset()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memcmp_0100
    * @tc.name      : testu_memcmp_0100
    * @tc.desc      : testu_memcmp
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memcmp_0100',0,() =>{
      expect(testNapi.testu_memcmp()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memcmpCodePointOrder_0100
    * @tc.name      : testu_memcmpCodePointOrder_0100
    * @tc.desc      : testu_memcmpCodePointOrder
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memcmpCodePointOrder_0100',0,() =>{
      expect(testNapi.testu_memcmpCodePointOrder()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memchr_0100
    * @tc.name      : testu_memchr_0100
    * @tc.desc      : testu_memchr
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memchr_0100',0,() =>{
      expect(testNapi.testu_memchr()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memchr32_0100
    * @tc.name      : testu_memchr32_0100
    * @tc.desc      : testu_memchr32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memchr32_0100',0,() =>{
      expect(testNapi.testu_memchr32()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memrchr_0100
    * @tc.name      : testu_memrchr_0100
    * @tc.desc      : testu_memrchr
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memrchr_0100',0,() =>{
      expect(testNapi.testu_memrchr()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_memrchr32_0100
    * @tc.name      : testu_memrchr32_0100
    * @tc.desc      : testu_memrchr32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_memrchr32_0100',0,() =>{
      expect(testNapi.testu_memrchr32()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strToUpper_0100
    * @tc.name      : testu_strToUpper_0100
    * @tc.desc      : testu_strToUpper
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strToUpper_0100',0,() =>{
      expect(testNapi.testu_strToUpper()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strToLower_0100
    * @tc.name      : testu_strToLower_0100
    * @tc.desc      : testu_strToLower
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strToLower_0100',0,() =>{
      expect(testNapi.testu_strToLower()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strToTitle_0100
    * @tc.name      : testu_strToTitle_0100
    * @tc.desc      : testu_strToTitle
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strToTitle_0100',0,() =>{
      expect(testNapi.testu_strToTitle()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strFoldCase_0100
    * @tc.name      : testu_strFoldCase_0100
    * @tc.desc      : testu_strFoldCase
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strFoldCase_0100',0,() =>{
      expect(testNapi.testu_strFoldCase()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strToUTF8_0100
    * @tc.name      : testu_strToUTF8_0100
    * @tc.desc      : testu_strToUTF8
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strToUTF8_0100',0,() =>{
      expect(testNapi.testu_strToUTF8()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strFromUTF8_0100
    * @tc.name      : testu_strFromUTF8_0100
    * @tc.desc      : testu_strFromUTF8
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strFromUTF8_0100',0,() =>{
      expect(testNapi.testu_strFromUTF8()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strToUTF8WithSub_0100
    * @tc.name      : testu_strToUTF8WithSub_0100
    * @tc.desc      : testu_strToUTF8WithSub
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strToUTF8WithSub_0100',0,() =>{
      expect(testNapi.testu_strToUTF8WithSub()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strFromUTF8WithSub_0100
    * @tc.name      : testu_strFromUTF8WithSub_0100
    * @tc.desc      : testu_strFromUTF8WithSub
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strFromUTF8WithSub_0100',0,() =>{
      expect(testNapi.testu_strFromUTF8WithSub()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strFromUTF8Lenient_0100
    * @tc.name      : testu_strFromUTF8Lenient_0100
    * @tc.desc      : testu_strFromUTF8Lenient
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strFromUTF8Lenient_0100',0,() =>{
      expect(testNapi.testu_strFromUTF8Lenient()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strToUTF32_0100
    * @tc.name      : testu_strToUTF32_0100
    * @tc.desc      : testu_strToUTF32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strToUTF32_0100',0,() =>{
      expect(testNapi.testu_strToUTF32()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strFromUTF32_0100
    * @tc.name      : testu_strFromUTF32_0100
    * @tc.desc      : testu_strFromUTF32
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strFromUTF32_0100',0,() =>{
      expect(testNapi.testu_strFromUTF32()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strToUTF32WithSub_0100
    * @tc.name      : testu_strToUTF32WithSub_0100
    * @tc.desc      : testu_strToUTF32WithSub
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strToUTF32WithSub_0100',0,() =>{
      expect(testNapi.testu_strToUTF32WithSub()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_strFromUTF32WithSub_0100
    * @tc.name      : testu_strFromUTF32WithSub_0100
    * @tc.desc      : testu_strFromUTF32WithSub
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_strFromUTF32WithSub_0100',0,() =>{
      expect(testNapi.testu_strFromUTF32WithSub()).assertFalse()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_u_errorName_0100
    * @tc.name      : testu_errorName_0100
    * @tc.desc      : testu_errorName
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testu_errorName_0100',0,() =>{
      expect(testNapi.testu_errorName()).assertTrue()
    })

  })
}