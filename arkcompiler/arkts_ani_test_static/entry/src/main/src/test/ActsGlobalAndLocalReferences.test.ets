import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function globalAndLocalReferencesTest() {

  describe("ActsGlobalAndLocalReferencesTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : GlobalReference_Create_0100
     * @tc.name      : GlobalReference_Create_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("GlobalReference_Create_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'GlobalReference_Create_0100 start');
        let cls = new Foo();
        let result = cls.test_GlobalReference_Create();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'GlobalReference_Create_0100 done');
        done();
        hilog.info(domain, tag, 'GlobalReference_Create_0100 end');
      })

    /*
     * @tc.number    : Reference_StrictEquals_0100
     * @tc.name      : Reference_StrictEquals_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Reference_StrictEquals_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Reference_StrictEquals_0100 start');
        let cls = new Foo();
        let result = cls.test_Reference_StrictEquals();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Reference_StrictEquals_0100 done');
        done();
        hilog.info(domain, tag, 'Reference_StrictEquals_0100 end');
      })

    /*
     * @tc.number    : GlobalReference_Delete_0100
     * @tc.name      : GlobalReference_Delete_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("GlobalReference_Delete_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'GlobalReference_Delete_0100 start');
        let cls = new Foo();
        let result = cls.test_GlobalReference_Delete();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'GlobalReference_Delete_0100 done');
        done();
        hilog.info(domain, tag, 'GlobalReference_Delete_0100 end');
      })

    /*
     * @tc.number    : Reference_Delete_0100
     * @tc.name      : Reference_Delete_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Reference_Delete_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Reference_Delete_0100 start');
        let cls = new Foo();
        let result = cls.test_Reference_Delete();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Reference_Delete_0100 done');
        done();
        hilog.info(domain, tag, 'Reference_Delete_0100 end');
      })

    /*
     * @tc.number    : EnsureEnoughReferences_0100
     * @tc.name      : EnsureEnoughReferences_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("EnsureEnoughReferences_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'EnsureEnoughReferences_0100 start');
        let cls = new Foo();
        let result = cls.test_EnsureEnoughReferences();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'EnsureEnoughReferences_0100 done');
        done();
        hilog.info(domain, tag, 'EnsureEnoughReferences_0100 end');
      })
  })
}