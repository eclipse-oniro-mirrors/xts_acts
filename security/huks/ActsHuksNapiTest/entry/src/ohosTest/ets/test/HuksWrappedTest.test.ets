import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksWrappedTest() {
  describe('HuksWrappedTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_WRAPPED_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_WRAPPED_0100
     * @tc.desc   Test import wrapped aes256-gcm-no_padding key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HUKS_NAPI_WRAPPED_0100', Level.LEVEL0, async () => {
      try {
        const result = await libHuks.HuksWrappedTest(0);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })  // 超时 120 秒（120000 毫秒）
  })
}
