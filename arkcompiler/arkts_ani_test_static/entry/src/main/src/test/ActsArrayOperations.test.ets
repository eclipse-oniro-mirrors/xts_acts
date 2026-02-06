import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ArrayOperationsTest() {

  describe("ActsArrayOperationsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch (e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : test_array_region_byte_0100
     * @tc.name      : test_array_region_byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_region_byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_region_byte_0100 start');
        let cls = new Foo();
        let result = cls.test_array_region_byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_region_byte_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_region_byte_0100 end');
      })

    /*
     * @tc.number    : test_array_region_char_0100
     * @tc.name      : test_array_region_char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_region_char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_region_char_0100 start');
        let cls = new Foo();
        let result = cls.test_array_region_char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_region_char_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_region_char_0100 end');
      })

    /*
     * @tc.number    : test_array_region_boolean_0100
     * @tc.name      : test_array_region_boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_region_boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_region_boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_array_region_boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_region_boolean_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_region_boolean_0100 end');
      })

    /*
     * @tc.number    : test_array_region_double_0100
     * @tc.name      : test_array_region_double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_region_double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_region_double_0100 start');
        let cls = new Foo();
        let result = cls.test_array_region_double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_region_double_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_region_double_0100 end');
      })

    /*
     * @tc.number    : test_array_region_float_0100
     * @tc.name      : test_array_region_float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_region_float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_region_float_0100 start');
        let cls = new Foo();
        let result = cls.test_array_region_float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_region_float_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_region_float_0100 end');
      })

    /*
     * @tc.number    : test_array_region_int_0100
     * @tc.name      : test_array_region_int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_region_int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_region_int_0100 start');
        let cls = new Foo();
        let result = cls.test_array_region_int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_region_int_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_region_int_0100 end');
      })

    /*
     * @tc.number    : test_array_region_long_0100
     * @tc.name      : test_array_region_long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_region_long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_region_long_0100 start');
        let cls = new Foo();
        let result = cls.test_array_region_long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_region_long_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_region_long_0100 end');
      })

    /*
     * @tc.number    : test_array_region_short_0100
     * @tc.name      : test_array_region_short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_region_short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_region_short_0100 start');
        let cls = new Foo();
        let result = cls.test_array_region_short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_region_short_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_region_short_0100 end');
      })

    /*
     * @tc.number    : test_array_set_with_get_ref_0100
     * @tc.name      : test_array_set_with_get_ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_set_with_get_ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_set_with_get_ref_0100 start');
        let cls = new Foo();
        let result = cls.test_array_set_with_get_ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_set_with_get_ref_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_set_with_get_ref_0100 end');
      })

    /*
     * @tc.number    : test_array_getLength_0100
     * @tc.name      : test_array_getLength_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_getLength_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_getLength_0100 start');
        let cls = new Foo();
        let result = cls.test_array_getLength();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_getLength_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_getLength_0100 end');
      })

    /*
     * @tc.number    : test_array_CreateBuffer_0100
     * @tc.name      : test_array_CreateBuffer_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_array_CreateBuffer_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_array_CreateBuffer_0100 start');
        let cls = new Foo();
        let result = cls.test_array_CreateBuffer();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_array_CreateBuffer_0100 done');
        done();
        hilog.info(domain, tag, 'test_array_CreateBuffer_0100 end');
      })
  })
}