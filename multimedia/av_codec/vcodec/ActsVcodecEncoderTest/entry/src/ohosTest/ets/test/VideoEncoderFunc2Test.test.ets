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

export default function VideoEncoderFunc2Test() {
  describe('VideoEncoderFunc2Test', () => {
    beforeAll(async () => {
      console.info('VideoEncoderFunc2Test beforeAll called');
      
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
          { raw: '176_144_rgba1010102.yuv', target: mediaDir + '/176_144_rgba1010102.yuv' },
          { raw: '1280_720_rgba1010102.yuv', target: mediaDir + '/1280_720_rgba1010102.yuv' },
          { raw: '1280_720_yuv420p_01.yuv', target: mediaDir + '/1280_720_yuv420p_01.yuv' },
          { raw: '1920_1080_rgba1010102.yuv', target: mediaDir + '/1920_1080_rgba1010102.yuv' },
          { raw: '4096_4096_rgba1010102.yuv', target: mediaDir + '/4096_4096_rgba1010102.yuv' },
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
      console.info('VideoEncoderFunc2Test afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderFunc2Test beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderFunc2Test afterEach called');
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3100Test start');
      let result: number = await testNapi.runFunc2Test(33);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3200', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3200Test start');
      let result: number = await testNapi.runFunc2Test(34);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3300Test start');
      let result: number = await testNapi.runFunc2Test(35);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3400', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3400Test start');
      let result: number = await testNapi.runFunc2Test(36);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3500', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3500Test start');
      let result: number = await testNapi.runFunc2Test(37);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3600', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3600Test start');
      let result: number = await testNapi.runFunc2Test(38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3700', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3700Test start');
      let result: number = await testNapi.runFunc2Test(39);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3800', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3800Test start');
      let result: number = await testNapi.runFunc2Test(40);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3900', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_3900Test start');
      let result: number = await testNapi.runFunc2Test(41);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4000', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4000Test start');
      let result: number = await testNapi.runFunc2Test(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4100Test start');
      let result: number = await testNapi.runFunc2Test(43);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4200', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4200Test start');
      let result: number = await testNapi.runFunc2Test(44);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4300Test start');
      let result: number = await testNapi.runFunc2Test(45);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4400', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4400Test start');
      let result: number = await testNapi.runFunc2Test(46);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4500', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4500Test start');
      let result: number = await testNapi.runFunc2Test(47);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4600', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4600Test start');
      let result: number = await testNapi.runFunc2Test(48);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4700', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4700Test start');
      let result: number = await testNapi.runFunc2Test(49);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4800', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4800Test start');
      let result: number = await testNapi.runFunc2Test(50);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_4900', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_4900Test start');
      let result: number = await testNapi.runFunc2Test(51);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5000', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_5000Test start');
      let result: number = await testNapi.runFunc2Test(52);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_5100Test start');
      let result: number = await testNapi.runFunc2Test(53);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8700', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_CAPABILITY_8700Test start');
      let result: number = await testNapi.runFunc2Test(54);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8800', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_CAPABILITY_8800Test start');
      let result: number = await testNapi.runFunc2Test(55);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8900', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_CAPABILITY_8900Test start');
      let result: number = await testNapi.runFunc2Test(56);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9000', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_CAPABILITY_9000Test start');
      let result: number = await testNapi.runFunc2Test(57);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5500', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_5500Test start');
      let result: number = await testNapi.runFunc2Test(58);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5600Test
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5600Test', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_5600Test start');
      let result: number = await testNapi.runFunc2Test(59);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5700', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_5700Test start');
      let result: number = await testNapi.runFunc2Test(60);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5800', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_5800Test start');
      let result: number = await testNapi.runFunc2Test(61);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5900', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_HEVC_CAPABILITY_5900Test start');
      let result: number = await testNapi.runFunc2Test(62);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0010Test start');
      let result: number = await testNapi.runFunc2Test(30);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0200', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0020Test start');
      let result: number = await testNapi.runFunc2Test(31);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0030Test start');
      let result: number = await testNapi.runFunc2Test(32);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0400', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0040Test start');
      let result: number = await testNapi.runFunc2Test(33);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0500', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0050Test start');
      let result: number = await testNapi.runFunc2Test(34);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0700', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0070Test start');
      let result: number = await testNapi.runFunc2Test(35);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0800', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0080Test start');
      let result: number = await testNapi.runFunc2Test(36);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_0900', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0090Test start');
      let result: number = await testNapi.runFunc2Test(37);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_1000', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0100Test start');
      let result: number = await testNapi.runFunc2Test(38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0110Test start');
      let result: number = await testNapi.runFunc2Test(39);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0120Test start');
      let result: number = await testNapi.runFunc2Test(40);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0130Test start');
      let result: number = await testNapi.runFunc2Test(41);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0140Test start');
      let result: number = await testNapi.runFunc2Test(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_SIX_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_SIX_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_SIX_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0150Test start');
      let result: number = await testNapi.runFunc2Test(43);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_SEVEN_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_SEVEN_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_SEVEN_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0160Test start');
      let result: number = await testNapi.runFunc2Test(44);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0200', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0210Test start');
      let result: number = await testNapi.runFunc2Test(45);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0200', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0220Test start');
      let result: number = await testNapi.runFunc2Test(46);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0200', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0230Test start');
      let result: number = await testNapi.runFunc2Test(47);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0200', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0240Test start');
      let result: number = await testNapi.runFunc2Test(48);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_ONE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_ONE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_ONE_0300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0360Test start');
      let result: number = await testNapi.runFunc2Test(49);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_TWO_0300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0370Test start');
      let result: number = await testNapi.runFunc2Test(50);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_THREE_0300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0380Test start');
      let result: number = await testNapi.runFunc2Test(51);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FOUR_0300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0390Test start');
      let result: number = await testNapi.runFunc2Test(52);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_FIVE_0300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0400Test start');
      let result: number = await testNapi.runFunc2Test(53);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_ONE_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_ONE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_SYNC_FUNC_PART_ONE_0400', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_SYNC_FUNC_0410Test start');
      let result: number = await testNapi.runFunc2Test(54);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0010Test start');
      let result: number = await testNapi.runFunc2Test(55);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0200', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0020Test start');
      let result: number = await testNapi.runFunc2Test(56);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0030Test start');
      let result: number = await testNapi.runFunc2Test(57);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_0400', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0040Test start');
      let result: number = await testNapi.runFunc2Test(58);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0110Test start');
      let result: number = await testNapi.runFunc2Test(59);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1300', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0130Test start');
      let result: number = await testNapi.runFunc2Test(60);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1500', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0150Test start');
      let result: number = await testNapi.runFunc2Test(61);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1700', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0170Test start');
      let result: number = await testNapi.runFunc2Test(62);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1800', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0180Test start');
      let result: number = await testNapi.runFunc2Test(63);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_RGBA1010102_1900', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_RGBA1010102_0190Test start');
      let result: number = await testNapi.runFunc2Test(64);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_PIXE_FORMAT_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_PIXE_FORMAT_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_PIXE_FORMAT_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_PIXE_FORMAT_0010Test start');
      let result: number = await testNapi.runFunc2Test(65);
      expect(result).assertEqual(0);
    });

     /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_ANOTHER_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_ANOTHER_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_ANOTHER_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_ENCODE_ANOTHER_0010Test start');
      let result: number = await testNapi.runFunc2Test(66);
      expect(result).assertEqual(0);
    });

     /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_CAPABILITY_CONFIG_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_CAPABILITY_CONFIG_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_CAPABILITY_CONFIG_0100', Level.LEVEL2, async () => {
      console.info('VIDEO_CAPABILITY_CONFIG_0010Test start');
      let result: number = await testNapi.runFunc2Test(67);
      expect(result).assertEqual(0);
    });

     /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_CAPABILITY_CONFIG_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_CAPABILITY_CONFIG_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_CAPABILITY_CONFIG_0200', Level.LEVEL2, async () => {
      console.info('VIDEO_CAPABILITY_CONFIG_0020Test start');
      let result: number = await testNapi.runFunc2Test(68);
      expect(result).assertEqual(0);
    });
  });
}
