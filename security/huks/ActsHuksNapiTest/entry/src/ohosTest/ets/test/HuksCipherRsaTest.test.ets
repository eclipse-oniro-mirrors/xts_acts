import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksCipherRsaTest() {
  describe('HuksCipherRsaTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_CIPHER_RSA_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_CIPHER_RSA_0100
     * @tc.desc   alg-RSA pur-ENCRYPT-DECRYPT size-4096 pad-OAEP dig-SHA384 mode-ECB.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HUKS_NAPI_CIPHER_RSA_0100', Level.LEVEL1, async () => {
      try {
        const result = await libHuks.HuksCipherRsaTestAsync(0);
        expect(result).assertEqual(0);
      } catch (error) {
        expect(error).assertEqual(0);
      }
    })
  })
}
