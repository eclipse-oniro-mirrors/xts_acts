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
     * @tc.name RESET_BITRATE_001
     * @tc.number RESET_BITRATE_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_BITRATE_001', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_002
     * @tc.number RESET_BITRATE_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_002', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_003
     * @tc.number RESET_BITRATE_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_003', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_004
     * @tc.number RESET_BITRATE_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_004', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_005
     * @tc.number RESET_BITRATE_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_005', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_006
     * @tc.number RESET_BITRATE_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_006', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_007
     * @tc.number RESET_BITRATE_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_BITRATE_007', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_008
     * @tc.number RESET_BITRATE_008
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_008', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_009
     * @tc.number RESET_BITRATE_009
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_009', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_010
     * @tc.number RESET_BITRATE_010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_010', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_011
     * @tc.number RESET_BITRATE_011
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_011', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_BITRATE_012
     * @tc.number RESET_BITRATE_012
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_BITRATE_012', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(11);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_001
     * @tc.number RESET_FRAMERATE_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_FRAMERATE_001', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(12);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_012
     * @tc.number RESET_FRAMERATE_012
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_FRAMERATE_012', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(13);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_013
     * @tc.number RESET_FRAMERATE_013
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_FRAMERATE_013', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(14);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_014
     * @tc.number RESET_FRAMERATE_014
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RESET_FRAMERATE_014', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(15);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_002
     * @tc.number RESET_FRAMERATE_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_002', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(16);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_003
     * @tc.number RESET_FRAMERATE_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_003', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(17);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_004
     * @tc.number RESET_FRAMERATE_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_004', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(18);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_005
     * @tc.number RESET_FRAMERATE_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_005', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(19);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_006
     * @tc.number RESET_FRAMERATE_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_006', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(20);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_007
     * @tc.number RESET_FRAMERATE_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_007', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(21);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_008
     * @tc.number RESET_FRAMERATE_008
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_008', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(22);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_009
     * @tc.number RESET_FRAMERATE_009
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_009', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(23);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_010
     * @tc.number RESET_FRAMERATE_010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_010', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(24);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_FRAMERATE_011
     * @tc.number RESET_FRAMERATE_011
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_FRAMERATE_011', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(25);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_001
     * @tc.number RESET_QP_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_001', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(26);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_002
     * @tc.number RESET_QP_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_002', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(27);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_003
     * @tc.number RESET_QP_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_003', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(28);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_004
     * @tc.number RESET_QP_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_004', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(29);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_005
     * @tc.number RESET_QP_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_005', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(30);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_006
     * @tc.number RESET_QP_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_006', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(31);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_007
     * @tc.number RESET_QP_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_007', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(32);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_008
     * @tc.number RESET_QP_008
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_008', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(33);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_009
     * @tc.number RESET_QP_009
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_009', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(34);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_010
     * @tc.number RESET_QP_010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_010', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(35);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_011
     * @tc.number RESET_QP_011
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_011', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(36);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_012
     * @tc.number RESET_QP_012
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_012', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(37);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_013
     * @tc.number RESET_QP_013
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_013', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(38);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name RESET_QP_014
     * @tc.number RESET_QP_014
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RESET_QP_014', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(39);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_PROFILE_001
     * @tc.number SET_PROFILE_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_PROFILE_001', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(40);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_PROFILE_002
     * @tc.number SET_PROFILE_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_PROFILE_002', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(41);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_PROFILE_003
     * @tc.number SET_PROFILE_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_PROFILE_003', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(42);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_PROFILE_004
     * @tc.number SET_PROFILE_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_PROFILE_004', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(43);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_PROFILE_005
     * @tc.number SET_PROFILE_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_PROFILE_005', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(44);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_RANGE_FLAG_001
     * @tc.number SET_RANGE_FLAG_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_RANGE_FLAG_001', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(45);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_RANGE_FLAG_002
     * @tc.number SET_RANGE_FLAG_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_RANGE_FLAG_002', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(46);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_COLORSPACE_001
     * @tc.number SET_COLORSPACE_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_COLORSPACE_001', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(47);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_COLORSPACE_002
     * @tc.number SET_COLORSPACE_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_COLORSPACE_002', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(48);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_FORCE_IDR_001
     * @tc.number SET_FORCE_IDR_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_FORCE_IDR_001', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(49);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SET_FORCE_IDR_002
     * @tc.number SET_FORCE_IDR_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SET_FORCE_IDR_002', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(50);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_001
     * @tc.number COLORSPACE_CONFIG_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_001', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(51);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_002
     * @tc.number COLORSPACE_CONFIG_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_002', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(52);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_003
     * @tc.number COLORSPACE_CONFIG_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_003', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(53);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_004
     * @tc.number COLORSPACE_CONFIG_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_004', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(54);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_005
     * @tc.number COLORSPACE_CONFIG_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_005', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(55);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_006
     * @tc.number COLORSPACE_CONFIG_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_006', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(56);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_001
     * @tc.number COLORSPACE_CONFIG_ADD_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_001', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(57);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_002
     * @tc.number COLORSPACE_CONFIG_ADD_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_002', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(58);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_003
     * @tc.number COLORSPACE_CONFIG_ADD_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_003', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(59);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_004
     * @tc.number COLORSPACE_CONFIG_ADD_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_004', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(60);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_005
     * @tc.number COLORSPACE_CONFIG_ADD_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_005', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(61);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_006
     * @tc.number COLORSPACE_CONFIG_ADD_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_006', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(62);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_007
     * @tc.number COLORSPACE_CONFIG_ADD_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_007', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(63);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_008
     * @tc.number COLORSPACE_CONFIG_ADD_008
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_008', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(64);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_009
     * @tc.number COLORSPACE_CONFIG_ADD_009
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_009', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(65);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_010
     * @tc.number COLORSPACE_CONFIG_ADD_010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_010', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(66);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_011
     * @tc.number COLORSPACE_CONFIG_ADD_011
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_011', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(67);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name COLORSPACE_CONFIG_ADD_012
     * @tc.number COLORSPACE_CONFIG_ADD_012
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('COLORSPACE_CONFIG_ADD_012', Level.LEVEL1, async () => {
      let result: number = await testNapi.runSetparamTest(68);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name FRAMENUM_JUDGMENT_001
     * @tc.number FRAMENUM_JUDGMENT_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FRAMENUM_JUDGMENT_001', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(69);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name FRAMENUM_JUDGMENT_002
     * @tc.number FRAMENUM_JUDGMENT_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FRAMENUM_JUDGMENT_002', Level.LEVEL0, async () => {
      let result: number = await testNapi.runSetparamTest(70);
      expect(result).assertEqual(0);
    });
  });
}
