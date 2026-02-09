import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe,
 expect, it, TestType, Size, Level } from '@ohos/hypium';
import audiocapturerplaybacktest from 'libaudiocapturerplaybacktest.so';

enum TEST_RESULT {
  TEST_FAIL = 0,
  TEST_PASS = 1
}

export default function AudioCapturerPlaybackTest() {
  describe('AudioCapturerPlaybackTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   AudioCapturer_RequestPlaybackStart_Callback_0007
     * @tc.number AudioCapturer_RequestPlaybackStart_Callback_0007
     * @tc.desc   AudioCapturerPlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioCapturer_RequestPlaybackStart_Callback_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiocapturerplaybacktest.AudioCapturer_RequestPlaybackStart_Callback_0007();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
  })
}