import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libvcodec_encoder_test.so';
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

export default function VideoEncoderSetparamTest() {
  describe('VideoEncoderSetparamTest', () => {
    beforeAll(async () => {
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
          { raw: 'test.rgba', target: mediaDir + '/test.rgba' },
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
      
      testNapi.initTests();
      console.info('[beforeAll] initTests completed');
    });

    afterAll(() => {
      console.info('VideoEncoderSetparamTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderSetparamTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderSetparamTest afterEach called');
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0200', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0300', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0400', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0500', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0600', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0800', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0900', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1000', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1100', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1200', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(11);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0100', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(12);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1200', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(13);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1300', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(14);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1400', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(15);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(16);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(17);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(18);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(19);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(20);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(21);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(22);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(23);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(24);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(25);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(26);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(27);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(28);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(29);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(30);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(31);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(32);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(33);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(34);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(35);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(36);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(37);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1300', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(38);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1400', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(39);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(40);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(41);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(42);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(43);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(44);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(45);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(46);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(47);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(48);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(49);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(50);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(51);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(52);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(53);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(54);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(55);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(56);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(57);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(58);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(59);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(60);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(61);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(62);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(63);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(64);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(65);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(66);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1100', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(67);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1200', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(68);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0100', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(69);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0200', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(70);
      expect(result).assertEqual(0);
    });
  });
}
