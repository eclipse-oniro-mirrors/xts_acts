import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
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

export default function VideoEncoderApiTest() {
  describe('VideoEncoderApiTest', () => {
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
          { raw: '1280_720_nv.yuv', target: mediaDir + '/1280_720_nv.yuv' }
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
      console.info('[beforeAll] initTests called');
    });

    afterAll(() => {
      console.info('VideoEncoderApiTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderApiTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderApiTest afterEach called');
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0100
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0200
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0300
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0400
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0500
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0600
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0700
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0800
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_0900
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_0900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_1100
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_1100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_1400
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_1500
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_1500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_1500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(11);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_1600
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_1600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_1600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(12);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_1700
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_1700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(13);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_1800
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_1800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_1800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(14);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_1900
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_1900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_1900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(15);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2000
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(16);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2100
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(17);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2200
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(18);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2300
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(19);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2500
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(20);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2600
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(21);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2700
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(22);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2800
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(23);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_ILLEGAL_PARA_2900
     * @tc.number VIDEO_ENCODE_ILLEGAL_PARA_2900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_ILLEGAL_PARA_2900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(24);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0100
     * @tc.number VIDEO_ENCODE_API_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(25);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_3100
     * @tc.number VIDEO_ENCODE_API_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_3100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(26);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0200
     * @tc.number VIDEO_ENCODE_API_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(27);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0300
     * @tc.number VIDEO_ENCODE_API_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(28);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0400
     * @tc.number VIDEO_ENCODE_API_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(29);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0500
     * @tc.number VIDEO_ENCODE_API_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(30);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0600
     * @tc.number VIDEO_ENCODE_API_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(31);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0700
     * @tc.number VIDEO_ENCODE_API_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(32);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0800
     * @tc.number VIDEO_ENCODE_API_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(33);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_0900
     * @tc.number VIDEO_ENCODE_API_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(34);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_1000
     * @tc.number VIDEO_ENCODE_API_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(35);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_1100
     * @tc.number VIDEO_ENCODE_API_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(36);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_1200
     * @tc.number VIDEO_ENCODE_API_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(37);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_1300
     * @tc.number VIDEO_ENCODE_API_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(38);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_1400
     * @tc.number VIDEO_ENCODE_API_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(39);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_API_1410
     * @tc.number VIDEO_ENCODE_API_1410
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_API_1410', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(40);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_SYNC_API_0010
     * @tc.number VIDEO_ENCODE_SYNC_API_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_SYNC_API_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(41);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_SYNC_API_0040
     * @tc.number VIDEO_ENCODE_SYNC_API_0040
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_SYNC_API_0040', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(42);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_SYNC_API_0050
     * @tc.number VIDEO_ENCODE_SYNC_API_0050
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_SYNC_API_0050', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(43);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_SYNC_API_0060
     * @tc.number VIDEO_ENCODE_SYNC_API_0060
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_SYNC_API_0060', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(44);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_SYNC_API_0070
     * @tc.number VIDEO_ENCODE_SYNC_API_0070
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_SYNC_API_0070', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(45);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_SYNC_API_0080
     * @tc.number VIDEO_ENCODE_SYNC_API_0080
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_SYNC_API_0080', Level.LEVEL2, async () => {
      let result: number = await testNapi.runApiTest(46);
      expect(result).assertEqual(0);
    });
  });
}
