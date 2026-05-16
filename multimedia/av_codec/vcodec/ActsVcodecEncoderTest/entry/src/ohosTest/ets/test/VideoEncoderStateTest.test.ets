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

export default function VideoEncoderStateTest() {
  describe('VideoEncoderStateTest', () => {
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
      testNapi.initTests()
    });

    afterAll(() => {
      console.info('VideoEncoderStateTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderStateTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderStateTest afterEach called');
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0100', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0100Test start');
      let result: number = await testNapi.runStateTest(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_PART_ONE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_PART_ONE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_PART_ONE_0100', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0101Test start');
      let result: number = await testNapi.runStateTest(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0200', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0200Test start');
      let result: number = await testNapi.runStateTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0300', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0300Test start');
      let result: number = await testNapi.runStateTest(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0400', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0400Test start');
      let result: number = await testNapi.runStateTest(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0500', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0500Test start');
      let result: number = await testNapi.runStateTest(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0600', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0600Test start');
      let result: number = await testNapi.runStateTest(6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0700', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0700Test start');
      let result: number = await testNapi.runStateTest(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0800', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0800Test start');
      let result: number = await testNapi.runStateTest(8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_0900', Level.LEVEL2, async () => {
      console.info('VideoEncodeState0900Test start');
      let result: number = await testNapi.runStateTest(9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1000', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1000Test start');
      let result: number = await testNapi.runStateTest(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1100', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1100Test start');
      let result: number = await testNapi.runStateTest(11);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1200', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1200Test start');
      let result: number = await testNapi.runStateTest(12);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1300', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1300Test start');
      let result: number = await testNapi.runStateTest(13);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1400', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1400Test start');
      let result: number = await testNapi.runStateTest(14);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1500', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1500Test start');
      let result: number = await testNapi.runStateTest(15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1600', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1600Test start');
      let result: number = await testNapi.runStateTest(16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1700', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1700Test start');
      let result: number = await testNapi.runStateTest(17);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1800', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1800Test start');
      let result: number = await testNapi.runStateTest(18);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_1900', Level.LEVEL2, async () => {
      console.info('VideoEncodeState1900Test start');
      let result: number = await testNapi.runStateTest(19);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2000', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2000Test start');
      let result: number = await testNapi.runStateTest(20);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2100', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2100Test start');
      let result: number = await testNapi.runStateTest(21);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2200', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2200Test start');
      let result: number = await testNapi.runStateTest(22);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2300', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2300Test start');
      let result: number = await testNapi.runStateTest(23);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2400', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2400Test start');
      let result: number = await testNapi.runStateTest(24);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2500', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2500Test start');
      let result: number = await testNapi.runStateTest(25);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2600', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2600Test start');
      let result: number = await testNapi.runStateTest(26);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2700', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2700Test start');
      let result: number = await testNapi.runStateTest(27);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2800', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2800Test start');
      let result: number = await testNapi.runStateTest(28);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_2900', Level.LEVEL2, async () => {
      console.info('VideoEncodeState2900Test start');
      let result: number = await testNapi.runStateTest(29);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3000', Level.LEVEL2, async () => {
      console.info('VideoEncodeState3000Test start');
      let result: number = await testNapi.runStateTest(30);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3100', Level.LEVEL2, async () => {
      console.info('VideoEncodeState3100Test start');
      let result: number = await testNapi.runStateTest(31);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3200', Level.LEVEL2, async () => {
      console.info('VideoEncodeState3200Test start');
      let result: number = await testNapi.runStateTest(32);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3300', Level.LEVEL2, async () => {
      console.info('VideoEncodeState3300Test start');
      let result: number = await testNapi.runStateTest(33);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3400', Level.LEVEL2, async () => {
      console.info('VideoEncodeState3400Test start');
      let result: number = await testNapi.runStateTest(34);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3500', Level.LEVEL1, async () => {
      console.info('VideoEncodeState3500Test start');
      let result: number = await testNapi.runStateTest(35);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3600', Level.LEVEL2, async () => {
      console.info('VideoEncodeState3600Test start');
      let result: number = await testNapi.runStateTest(36);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3700', Level.LEVEL1, async () => {
      console.info('VideoEncodeState3700Test start');
      let result: number = await testNapi.runStateTest(37);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3800', Level.LEVEL1, async () => {
      console.info('VideoEncodeState3800Test start');
      let result: number = await testNapi.runStateTest(38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_3900', Level.LEVEL1, async () => {
      console.info('VideoEncodeState3900Test start');
      let result: number = await testNapi.runStateTest(39);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_4000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_4000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_STATE_4000', Level.LEVEL1, async () => {
      console.info('VideoEncodeState4000Test start');
      let result: number = await testNapi.runStateTest(40);
      expect(result).assertEqual(0);
    });
  });
}
