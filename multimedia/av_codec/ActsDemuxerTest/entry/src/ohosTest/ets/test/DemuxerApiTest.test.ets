import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import testNapi from 'libdemuxer_test.so';
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

export default function DemuxerApiTestTest() {
  describe('DemuxerApiTest', () => {
    beforeAll(async () => {
      console.info('DemuxerApiTest beforeAll called');
      
      try {
        let context = getContext();
        let filesDir = context.filesDir;
        let mediaDir = filesDir + '/media';
        let audioDir = mediaDir + '/audio';
        
        if (!fs.accessSync(mediaDir)) {
          fs.mkdirSync(mediaDir);
          console.info(`Created directory: ${mediaDir}`);
        }
        
        if (!fs.accessSync(audioDir)) {
          fs.mkdirSync(audioDir);
          console.info(`Created directory: ${audioDir}`);
        }
        
        const filesToCopy: FileCopyInfo[] = [
          { raw: '01_video_audio.mp4', target: mediaDir + '/01_video_audio.mp4' },
          { raw: 'avcc_10sec.mp4', target: mediaDir + '/avcc_10sec.mp4' }
        ];
        
        for (const file of filesToCopy) {
          try {
            await copyRawFileToSandbox(context, file.raw, file.target);
          } catch (e) {
            console.warn(`Failed to copy ${file.raw}, test may fail: ${JSON.stringify(e)}`);
          }
        }
        
        console.info('[beforeAll] File preparation completed');
      } catch (error) {
        console.error(`[beforeAll] Setup failed: ${JSON.stringify(error)}`);
      }
    });

    afterAll(() => {
      console.info('DemuxerApiTest afterAll called');
    });

    beforeEach(() => {
      console.info('DemuxerApiTest beforeEach called');
    });

    afterEach(() => {
      console.info('DemuxerApiTest afterEach called');
    });

    /**
     * @tc.name OH_AVSource_CreateWithDataSource_0100
     * @tc.number OH_AVSource_CreateWithDataSource_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_AVSource_CreateWithDataSource_0100', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name OH_AVSource_CreateWithDataSourceExt_0100
     * @tc.number OH_AVSource_CreateWithDataSourceExt_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_AVSource_CreateWithDataSourceExt_0100', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0100
     * @tc.number DEMUXER_ILLEGAL_PARA_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0100', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0200
     * @tc.number DEMUXER_ILLEGAL_PARA_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0200', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0700
     * @tc.number DEMUXER_ILLEGAL_PARA_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0700', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0800
     * @tc.number DEMUXER_ILLEGAL_PARA_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0800', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0300
     * @tc.number DEMUXER_ILLEGAL_PARA_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0300', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0400
     * @tc.number DEMUXER_ILLEGAL_PARA_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0400', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0500
     * @tc.number DEMUXER_ILLEGAL_PARA_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0500', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0600
     * @tc.number DEMUXER_ILLEGAL_PARA_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0600', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_2300
     * @tc.number DEMUXER_ILLEGAL_PARA_2300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_2300', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_0900
     * @tc.number DEMUXER_ILLEGAL_PARA_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_0900', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(11);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_1000
     * @tc.number DEMUXER_ILLEGAL_PARA_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_1000', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(12);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_1100
     * @tc.number DEMUXER_ILLEGAL_PARA_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_1100', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(13);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_1200
     * @tc.number DEMUXER_ILLEGAL_PARA_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_1200', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(14);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_1300
     * @tc.number DEMUXER_ILLEGAL_PARA_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_1300', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_1400
     * @tc.number DEMUXER_ILLEGAL_PARA_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_1400', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_1500
     * @tc.number DEMUXER_ILLEGAL_PARA_1500
    * @tc.desc   function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_1500', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(17);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_1600
     * @tc.number DEMUXER_ILLEGAL_PARA_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_1600', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(18);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_ILLEGAL_PARA_1700
     * @tc.number DEMUXER_ILLEGAL_PARA_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_ILLEGAL_PARA_1700', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(19);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_API_0200
     * @tc.number DEMUXER_API_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_API_0200', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(20);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_API_1100
     * @tc.number DEMUXER_API_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_API_1100', Level.LEVEL0, () => {
      let result:number = testNapi.runApiTest(21);
      expect(result).assertEqual(0);
    });

  });
}
