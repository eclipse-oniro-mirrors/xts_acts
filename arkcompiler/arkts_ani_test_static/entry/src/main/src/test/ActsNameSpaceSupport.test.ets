import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function nameSpaceSupportTest() {

  describe("ActsNameSpaceSupportTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch (e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : Namespace_FindNamespace_0100
     * @tc.name      : Namespace_FindNamespace_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Namespace_FindNamespace_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Namespace_FindNamespace_0100 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindNamespace();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Namespace_FindNamespace_0100 done');
        done();
        hilog.info(domain, tag, 'Namespace_FindNamespace_0100 end');
      })

    /*
     * @tc.number    : Namespace_FindClass_0100
     * @tc.name      : Namespace_FindClass_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Namespace_FindClass_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Namespace_FindClass_0100 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindClass();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Namespace_FindClass_0100 done');
        done();
        hilog.info(domain, tag, 'Namespace_FindClass_0100 end');
      })

    /*
     * @tc.number    : Namespace_FindEnum_0100
     * @tc.name      : Namespace_FindEnum_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Namespace_FindEnum_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Namespace_FindEnum_0100 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindEnum();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Namespace_FindEnum_0100 done');
        done();
        hilog.info(domain, tag, 'Namespace_FindEnum_0100 end');
      })

    /*
     * @tc.number    : Namespace_FindFunction_0100
     * @tc.name      : Namespace_FindFunction_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Namespace_FindFunction_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Namespace_FindFunction_0100 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Namespace_FindFunction_0100 done');
        done();
        hilog.info(domain, tag, 'Namespace_FindFunction_0100 end');
      })
  })
}