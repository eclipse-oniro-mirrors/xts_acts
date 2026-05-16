import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksSignVerifyRsaTest() {
  describe('HuksSignVerifyRsaTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_RSA_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_RSA_0100
     * @tc.desc   alg-RSA pur-Sign pad-PKCS1_V1_5 digest-MD5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_RSA_0100', Level.LEVEL0, async (done: Function) => {
      try {
        const result = await libHuks.HuksSignVerifyRsaTest(0);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
