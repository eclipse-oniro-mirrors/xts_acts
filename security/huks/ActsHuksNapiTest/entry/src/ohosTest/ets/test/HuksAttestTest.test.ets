import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksAttestTest() {
  describe('HuksAttestTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_ATTEST_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_ATTEST_0100
     * @tc.desc   attest with right params and validate success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HUKS_NAPI_ATTEST_0100', Level.LEVEL0, async () => {
      try {
        const result = await libHuks.HuksAttestTest(0);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })
  })
}
