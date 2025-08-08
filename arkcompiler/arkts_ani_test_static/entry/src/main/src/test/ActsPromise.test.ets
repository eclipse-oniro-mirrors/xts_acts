import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function promiseTest() {

  describe("ActsPromiseTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch (e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : Promise_New_0100
     * @tc.name      : Promise_New_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Promise_New_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Promise_New_0100 start');
        let cls = new Foo();
        let result = cls.test_Promise_New();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Promise_New_0100 done');
        done();
        hilog.info(domain, tag, 'Promise_New_0100 end');
      })

    /*
     * @tc.number    : PromiseResolver_Reject_0100
     * @tc.name      : PromiseResolver_Reject_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("PromiseResolver_Reject_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'PromiseResolver_Reject_0100 start');
        let cls = new Foo();
        let result = cls.test_PromiseResolver_Reject();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'PromiseResolver_Reject_0100 done');
        done();
        hilog.info(domain, tag, 'PromiseResolver_Reject_0100 end');
      })

    /*
     * @tc.number    : PromiseResolver_Resolve_0100
     * @tc.name      : PromiseResolver_Resolve_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("PromiseResolver_Resolve_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'PromiseResolver_Resolve_0100 start');
        let cls = new Foo();
        let result = cls.test_PromiseResolver_Resolve();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'PromiseResolver_Resolve_0100 done');
        done();
        hilog.info(domain, tag, 'PromiseResolver_Resolve_0100 end');
      })
  })
}