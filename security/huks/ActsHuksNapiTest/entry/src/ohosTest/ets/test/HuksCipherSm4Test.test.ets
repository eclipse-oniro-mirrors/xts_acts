import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksCipherSm4Test() {
  describe('HuksCipherSm4Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_CIPHER_SM4_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_CIPHER_SM4_0100
     * @tc.desc   alg-SM4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HUKS_NAPI_CIPHER_SM4_0100', Level.LEVEL0, () => {
      const result = libHuks.HuksCipherSm4Test(0);
      expect(result).assertEqual(0);
    })
  })
}
