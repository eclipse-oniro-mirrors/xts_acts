import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libentry from "libentry.so"
import Utils, { Log } from './Util.test';

const fileArr = [
  "mpeg4_mainlevel4_1920x1080_30.m4v",
]

export default function FuncTest() {
  describe('FuncTest', () => {
    beforeAll(async () => {
      let context = getContext()
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i]
        Utils.copyRawfileToFilesDirSync(fileName, context)
      }
      Log.info(`[rawfile_copy_to_sandbox] sandbox path: ${context.filesDir}/`)
      await Utils.sleep(500)
    })
    beforeEach(async () => {
      let context = getContext()
      Log.info(`AudioText beforeEach`);
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i];
        if (Utils.fileCheckSync(fileName, context)) {
          Log.info(`AudioText ${fileName} file exists`);
        } else {
          Log.info(`AudioText ${fileName} file does not exists!`);
        }
      }
      await Utils.sleep(500)
    })

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
     * @tc.name   DEMUXER_DEC_ENC_MUXER_FUNC_009
     * @tc.number DEMUXER_DEC_ENC_MUXER_FUNC_009
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_DEC_ENC_MUXER_FUNC_009', Level.LEVEL1, async (done: Function) => {
      const result = await libentry.DEMUXER_DEC_ENC_MUXER_FUNC_009();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   DEMUXER_DEC_ENC_MUXER_FUNC_010
     * @tc.number DEMUXER_DEC_ENC_MUXER_FUNC_010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_DEC_ENC_MUXER_FUNC_010', Level.LEVEL1, async (done: Function) => {
      const result = await libentry.DEMUXER_DEC_ENC_MUXER_FUNC_010();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   DEMUXER_DEC_ENC_MUXER_FUNC_011
     * @tc.number DEMUXER_DEC_ENC_MUXER_FUNC_011
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_DEC_ENC_MUXER_FUNC_011', Level.LEVEL1, async (done: Function) => {
      const result = await libentry.DEMUXER_DEC_ENC_MUXER_FUNC_011();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   DEMUXER_DEC_ENC_MUXER_FUNC_012
     * @tc.number DEMUXER_DEC_ENC_MUXER_FUNC_012
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_DEC_ENC_MUXER_FUNC_012', Level.LEVEL1, async (done: Function) => {
      const result = await libentry.DEMUXER_DEC_ENC_MUXER_FUNC_012();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   DEMUXER_DEC_ENC_MUXER_FUNC_013
     * @tc.number DEMUXER_DEC_ENC_MUXER_FUNC_013
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_DEC_ENC_MUXER_FUNC_013', Level.LEVEL1, async (done: Function) => {
      const result = await libentry.DEMUXER_DEC_ENC_MUXER_FUNC_013();
      expect(result).assertEqual(0);
      done();
    })
  })
}