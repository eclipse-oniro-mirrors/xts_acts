import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksSignVerifyDsaTest() {
  describe('HuksSignVerifyDsaTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_DSA_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_DSA_0100
     * @tc.desc   alg-DSA pur-Sign-verify dig-SHA1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_DSA_0100', Level.LEVEL0, () => {
      const result = libHuks.HuksSignVerifyDsaTest(0);
      expect(result).assertEqual(0);
    })
  })
}
