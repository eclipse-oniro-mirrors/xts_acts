import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libvcodec_encoder_test.so';
import hilog from '@ohos.hilog';
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

export default function VideoEncoderFuncTest() {
  describe('VideoEncoderFuncTest', () => {
    beforeAll(async () => {
      console.info('VideoEncoderFuncTest beforeAll called');
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
      console.info('VideoEncoderFuncTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderFuncTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderFuncTest afterEach called');
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_0100
     * @tc.number VIDEO_ENCODE_FUNCTION_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_FUNCTION_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_0300
     * @tc.number VIDEO_ENCODE_FUNCTION_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_0700
     * @tc.number VIDEO_ENCODE_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_0800
     * @tc.number VIDEO_ENCODE_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_0810
     * @tc.number VIDEO_ENCODE_FUNCTION_0810
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_0810', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_0900
     * @tc.number VIDEO_ENCODE_FUNCTION_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_1000
     * @tc.number VIDEO_ENCODE_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_1600
     * @tc.number VIDEO_ENCODE_FUNCTION_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_1600', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_1700
     * @tc.number VIDEO_ENCODE_FUNCTION_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_1700', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_1800
     * @tc.number VIDEO_ENCODE_FUNCTION_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_1800', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_FUNCTION_2000
     * @tc.number VIDEO_ENCODE_FUNCTION_2000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_ENCODE_FUNCTION_2000', Level.LEVEL1, async () => {
      let result: number = await testNapi.runFuncTest(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0100
     * @tc.number VIDEO_ENCODE_CAPABILITY_0100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(11);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0200
     * @tc.number VIDEO_ENCODE_CAPABILITY_0200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(12);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0300
     * @tc.number VIDEO_ENCODE_CAPABILITY_0300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(13);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0400
     * @tc.number VIDEO_ENCODE_CAPABILITY_0400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(14);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0500
     * @tc.number VIDEO_ENCODE_CAPABILITY_0500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(15);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_9900
     * @tc.number VIDEO_ENCODE_CAPABILITY_9900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_9900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(16);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0600
     * @tc.number VIDEO_ENCODE_CAPABILITY_0600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(17);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0700
     * @tc.number VIDEO_ENCODE_CAPABILITY_0700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(18);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0800
     * @tc.number VIDEO_ENCODE_CAPABILITY_0800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(19);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_0900
     * @tc.number VIDEO_ENCODE_CAPABILITY_0900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(20);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1000
     * @tc.number VIDEO_ENCODE_CAPABILITY_1000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(21);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1100
     * @tc.number VIDEO_ENCODE_CAPABILITY_1100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(22);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1200
     * @tc.number VIDEO_ENCODE_CAPABILITY_1200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(23);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1300
     * @tc.number VIDEO_ENCODE_CAPABILITY_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(24);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1310
     * @tc.number VIDEO_ENCODE_CAPABILITY_1310
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1310', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(25);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1400
     * @tc.number VIDEO_ENCODE_CAPABILITY_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(26);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1500
     * @tc.number VIDEO_ENCODE_CAPABILITY_1500
     * @tc.desc   VIDEO_ENCODE_CAPABILITY_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(27);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1700
     * @tc.number VIDEO_ENCODE_CAPABILITY_1700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(28);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1800
     * @tc.number VIDEO_ENCODE_CAPABILITY_1800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(29);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_1900
     * @tc.number VIDEO_ENCODE_CAPABILITY_1900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_1900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(30);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_8400
     * @tc.number VIDEO_ENCODE_CAPABILITY_8400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_8400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(31);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_8500
     * @tc.number VIDEO_ENCODE_CAPABILITY_8500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_8500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(32);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_8600
     * @tc.number VIDEO_ENCODE_CAPABILITY_8600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_8600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(33);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_2000
     * @tc.number VIDEO_ENCODE_CAPABILITY_2000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_2000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(34);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_2100
     * @tc.number VIDEO_ENCODE_CAPABILITY_2100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_2100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(35);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_2200
     * @tc.number VIDEO_ENCODE_CAPABILITY_2200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_2200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(36);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_2300
     * @tc.number VIDEO_ENCODE_CAPABILITY_2300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_2300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(37);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_2400
     * @tc.number VIDEO_ENCODE_CAPABILITY_2400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_2400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(38);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_2500
     * @tc.number VIDEO_ENCODE_CAPABILITY_2500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_2500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(39);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_2700
     * @tc.number VIDEO_ENCODE_CAPABILITY_2700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_2700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(40);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_2800
     * @tc.number VIDEO_ENCODE_CAPABILITY_2800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_2800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(41);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3100
     * @tc.number VIDEO_ENCODE_CAPABILITY_3100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(42);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3200
     * @tc.number VIDEO_ENCODE_CAPABILITY_3200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(43);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3300
     * @tc.number VIDEO_ENCODE_CAPABILITY_3300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(44);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3400
     * @tc.number VIDEO_ENCODE_CAPABILITY_3400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(45);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3500
     * @tc.number VIDEO_ENCODE_CAPABILITY_3500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(46);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3600
     * @tc.number VIDEO_ENCODE_CAPABILITY_3600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(47);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3700
     * @tc.number VIDEO_ENCODE_CAPABILITY_3700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(48);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3800
     * @tc.number VIDEO_ENCODE_CAPABILITY_3800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(49);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_3900
     * @tc.number VIDEO_ENCODE_CAPABILITY_3900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_3900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(50);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_4100
     * @tc.number VIDEO_ENCODE_CAPABILITY_4100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_4100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(51);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_4200
     * @tc.number VIDEO_ENCODE_CAPABILITY_4200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_4200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(52);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_4300
     * @tc.number VIDEO_ENCODE_CAPABILITY_4300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_4300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(53);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_4500
     * @tc.number VIDEO_ENCODE_CAPABILITY_4500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_4500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(54);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_4600
     * @tc.number VIDEO_ENCODE_CAPABILITY_4600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_4600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(55);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_4800
     * @tc.number VIDEO_ENCODE_CAPABILITY_4800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_4800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(56);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_4900
     * @tc.number VIDEO_ENCODE_CAPABILITY_4900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_4900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(57);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_9800
     * @tc.number VIDEO_ENCODE_CAPABILITY_9800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_9800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest(58);
      expect(result).assertEqual(0);
    });
  });
}