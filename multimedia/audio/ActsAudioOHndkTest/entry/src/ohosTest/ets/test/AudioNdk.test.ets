import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import audio_native_test from 'libaudio_native_test.so';

export default function audioNativeTest() {
  describe('ActsAudioNativeTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'AudioNativeTest', 'beforeAll: Audio native test suite start');
    })
    
    beforeEach(() => {
      hilog.info(0x0000, 'AudioNativeTest', 'beforeEach: test case start');
    })
    
    afterEach(() => {
      hilog.info(0x0000, 'AudioNativeTest', 'afterEach: test case end');
    })
    
    afterAll(() => {
      hilog.info(0x0000, 'AudioNativeTest', 'afterAll: Audio native test suite end');
    })

    /**
     * @tc.name   AudioNativeTest
     * @tc.number SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_GetUnderflowCount_0100
     * @tc.desc   test the normal condition of OH_AudioRenderer_GetUnderflowCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AudioNativeTest', Level.LEVEL0, () => {
      hilog.info(0x0000, 'AudioNativeTest', 'AudioNativeTest start');

      // Call native test function
      let result:number = audio_native_test.audioNativeTest();

      // Assert result is 0 (success)
      expect(result).assertEqual(0);

      hilog.info(0x0000, 'AudioNativeTest', 'add end, result=%{public}d', result);
    })

  })
}
