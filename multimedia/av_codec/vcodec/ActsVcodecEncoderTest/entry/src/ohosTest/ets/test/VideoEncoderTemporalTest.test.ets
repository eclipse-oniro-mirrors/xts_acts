import hilog from '@ohos.hilog';
import testNapi from 'libvcodec_encoder_test.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

interface FileCopyInfo {
  raw: string;
  target: string;
}

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

async function copyRawFileToSandbox(context: Context, rawFileName: string, targetPath: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    context.resourceManager.getRawFileContent(rawFileName, (error, buffer) => {
      if (error) {
        console.error(`[copyRawFile] ${rawFileName} copy failed: ${error.code}, message: ${error.message}`);
        reject(error);
      } else {
        try {
          let file = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, buffer.buffer);
          fs.closeSync(file);
          console.info(`[copyRawFile] ${rawFileName} copy success to ${targetPath}`);
          resolve();
        } catch (e) {
          console.error(`[copyRawFile] ${rawFileName} write failed: ${JSON.stringify(e)}`);
          reject(e);
        }
      }
    });
  });
}

export default function VideoEncoderTemporalTest() {
  describe('VideoEncoderTemporalTest', () => {
    beforeAll(async() => {
      console.info('VideoEncoderSetparamTest beforeAll called');
      try {
        let context = getContext();
        let filesDir = context.filesDir;
        let mediaDir = filesDir + '/media';

        console.info(`[beforeAll] filesDir: ${filesDir}`);
        console.info(`[beforeAll] mediaDir: ${mediaDir}`);

        if (!fs.accessSync(mediaDir)) {
          fs.mkdirSync(mediaDir);
          console.info(`[beforeAll] Created directory: ${mediaDir}`);
        } else {
          console.info(`[beforeAll] Directory already exists: ${mediaDir}`);
        }

        const filesToCopy: FileCopyInfo[] = [
          { raw: '1280_720_nv.yuv', target: mediaDir + '/1280_720_nv.yuv' },
        ];

        let successCount = 0;
        let failCount = 0;

        for (const file of filesToCopy) {
          try {
            console.info(`[beforeAll] Attempting to copy: ${file.raw}`);
            await copyRawFileToSandbox(context, file.raw, file.target);
            successCount++;
            console.info(`[beforeAll] Successfully copied: ${file.raw}`);
          } catch (e) {
            failCount++;
            console.error(`[beforeAll] Failed to copy ${file.raw}: ${JSON.stringify(e)}`);
          }
        }

        console.info(`[beforeAll] File preparation completed: ${successCount} success, ${failCount} failed`);
      } catch (error) {
        console.error(`[beforeAll] Setup failed: ${JSON.stringify(error)}`);
      }
      testNapi.initTests()
    });

    afterAll(() => {
      console.info('VideoEncoderTemporalTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderTemporalTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderTemporalTest afterEach called');
    });

    /**
     * @tc.name VideoTemporalEncodeApi0020Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoTemporalEncodeApi0020Test', Level.LEVEL2, async () => {
      console.info('VideoTemporalEncodeApi0020Test start');
      let result: number = await testNapi.runTemporalTest(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeApi0030Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0030
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoTemporalEncodeApi0030Test', Level.LEVEL2, async () => {
      console.info('VideoTemporalEncodeApi0030Test start');
      let result: number = await testNapi.runTemporalTest(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0010Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0010Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0010Test start');
      let result: number = await testNapi.runTemporalTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0020Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0020Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0020Test start');
      let result: number = await testNapi.runTemporalTest(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0100Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0100Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0100Test start');
      let result: number = await testNapi.runTemporalTest(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0140Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0140
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0140Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0140Test start');
      let result: number = await testNapi.runTemporalTest(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0100Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VideoUniformlyEncodeFunction0100Test', Level.LEVEL0, async () => {
      console.info('VideoUniformlyEncodeFunction0100Test start');
      let result: number = await testNapi.runTemporalTest(6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0200Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0200Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0200Test start');
      let result: number = await testNapi.runTemporalTest(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0300Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0300Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0300Test start');
      let result: number = await testNapi.runTemporalTest(8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0400Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0400Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0400Test start');
      let result: number = await testNapi.runTemporalTest(9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0500Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0500Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0500Test start');
      let result: number = await testNapi.runTemporalTest(10);
      expect(result).assertEqual(0);
    });
  });
}
