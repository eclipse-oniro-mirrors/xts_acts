import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function stringOperationsTest() {

  describe("ActsStringOperationsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch (e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : test_String_UTF8_0100
     * @tc.name      : test_String_UTF8_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_String_UTF8_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_String_UTF8_0100 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_String_UTF8_0100 done');
        done();
        hilog.info(domain, tag, 'test_String_UTF8_0100 end');
      })

    /*
     * @tc.number    : test_String_UTF16_0100
     * @tc.name      : test_String_UTF16_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_String_UTF16_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_String_UTF16_0100 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_String_UTF16_0100 done');
        done();
        hilog.info(domain, tag, 'test_String_UTF16_0100 end');
      })
  })
}