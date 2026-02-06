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

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0100
    * @tc.name      : testubrk_setUText_0100
    * @tc.desc      : ubrk_setUText with {0x41,0x42, 0x20,0}
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testubrk_setUText_0100', Level.LEVEL0, () => {
      expect(testNapi.testubrk_setUText_0100()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0200
    * @tc.name      : testubrk_setUText_0200
    * @tc.desc      : ubrk_setUText with {0x41,0x42, 0x43, 0x44, 0x45, 0}
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_0200', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0200()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0300
    * @tc.name      : testubrk_setUText_0300
    * @tc.desc      : ubrk_setUText with 'he's from'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_0300', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0300()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0400
    * @tc.name      : testubrk_setUText_0400
    * @tc.desc      : ubrk_setUText with 'Couldn't open'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_0400', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0400()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0500
    * @tc.name      : testubrk_setUText_0500
    * @tc.desc      : ubrk_setUText with 'Cloned Iterator failed'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_0500', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0500()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0600
    * @tc.name      : testubrk_setUText_0600
    * @tc.desc      : ubrk_setUText with NULL
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_0600', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0600()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0700
    * @tc.name      : testubrk_setUText_0700
    * @tc.desc      : ubrk_setUText with '马到成功'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_0700', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0700()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0800
    * @tc.name      : testubrk_setUText_0800
    * @tc.desc      : ubrk_setUText with '不知道我的国家'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_0800', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0800()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_0900
    * @tc.name      : testubrk_setUText_0900
    * @tc.desc      : ubrk_setUText with '我的国家'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_0900', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_0900()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_setUText_1000
    * @tc.name      : testubrk_setUText_1000
    * @tc.desc      : ubrk_setUText with '我我我我我'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_setUText_1000', Level.LEVEL2, () => {
      expect(testNapi.testubrk_setUText_1000()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_clone_0100
    * @tc.name      : testubrk_clone_0100
    * @tc.desc      : ubrk_clone with 'he's from Africa. Mr.'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testubrk_clone_0100', Level.LEVEL1, () => {
      expect(testNapi.testubrk_clone_0100()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_clone_0200
    * @tc.name      : testubrk_clone_0200
    * @tc.desc      : ubrk_clone with 'he's from Africa. Mr.'*2
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_clone_0200', Level.LEVEL2, () => {
      expect(testNapi.testubrk_clone_0200()).assertTrue()
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18n_testubrk_clone_0300
    * @tc.name      : testubrk_clone_0300
    * @tc.desc      : ubrk_clone with NULL
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testubrk_clone_0300', Level.LEVEL2, () => {
      expect(testNapi.testubrk_clone_0300()).assertTrue()
    })

  })
}