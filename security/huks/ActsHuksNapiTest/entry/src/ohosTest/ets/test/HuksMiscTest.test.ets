import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksMiscTest() {
  describe('HuksMiscTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_MISC_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_MISC_0100
     * @tc.desc   misc test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HUKS_NAPI_MISC_0100', Level.LEVEL0, () => {
      const result = libHuks.HuksMiscTest(0);
      expect(result).assertEqual(0);
    })
  })
}
