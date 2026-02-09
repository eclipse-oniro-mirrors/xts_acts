import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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

export default function DemuxerFuncTestTest() {
  describe('DemuxerFunctionTest', () => {
    beforeAll(async () => {
      console.info('DemuxerFunctionTest beforeAll called');
      
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
        { raw: 'avcc_10sec.mp4', target: mediaDir + '/avcc_10sec.mp4' },
        { raw: 'hvcc.mp4', target: mediaDir + '/hvcc.mp4' },
        { raw: 'mpeg2.mp4', target: mediaDir + '/mpeg2.mp4' },
        { raw: 'zero_track.mp4', target: mediaDir + '/zero_track.mp4' },
        { raw: 'MP3_avcc_10sec.bin', target: mediaDir + '/MP3_avcc_10sec.bin' },
        { raw: 'test_video_avcc_10sec.bin', target: mediaDir + '/test_video_avcc_10sec.bin' },
        { raw: 'INVALID.mp4', target: mediaDir + '/INVALID.mp4' },
        { raw: 'hevc_v_a.ts', target: mediaDir + '/hevc_v_a.ts' },
        { raw: 'hevc_v.ts', target: mediaDir + '/hevc_v.ts' },
        { raw: 'M4A_48000_1.m4a', target: audioDir + '/M4A_48000_1.m4a' },
        { raw: 'AAC_48000_1.aac', target: audioDir + '/AAC_48000_1.aac' },
        { raw: 'MP3_48000_1.mp3', target: audioDir + '/MP3_48000_1.mp3' },
        { raw: 'OGG_48000_1.ogg', target: audioDir + '/OGG_48000_1.ogg' },
        { raw: 'FLAC_48000_1.flac', target: audioDir + '/FLAC_48000_1.flac' },
        { raw: 'wav_48000_1.wav', target: audioDir + '/wav_48000_1.wav' },
        { raw: 'amr_nb_8000_1.amr', target: audioDir + '/amr_nb_8000_1.amr' },
        { raw: 'amr_wb_16000_1.amr', target: audioDir + '/amr_wb_16000_1.amr' },
        { raw: 'mkv.mkv', target: mediaDir + '/mkv.mkv' },
        { raw: 'ts_video.ts', target: mediaDir + '/ts_video.ts' },
        { raw: 'MP3_OGG_48000_1.bin', target: mediaDir + '/MP3_OGG_48000_1.bin' }
      ];
      
      for (const file of filesToCopy) {
        try {
          await copyRawFileToSandbox(context, file.raw, file.target);
        } catch (e) {
          console.error(`Skip file ${file.raw}: not found in rawfile`);
        }
      }
      } catch (e) {
        console.error(`beforeAll error: ${JSON.stringify(e)}`);
      }
    });

    afterAll(() => {
      console.info('DemuxerFunctionTest afterAll called');
    });

    beforeEach(() => {
      console.info('DemuxerFunctionTest beforeEach called');
    });

    afterEach(() => {
      console.info('DemuxerFunctionTest afterEach called');
    });

    /**
     * @tc.name DEMUXER_FUNCTION_0200
     * @tc.number DEMUXER_FUNCTION_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('DEMUXER_FUNCTION_0200', 0, () => {
    //   let result:number = await testNapi.runFuncTest(0);
    //   expect(result).assertEqual(0);
    // });
    //
    // /**
    //  * @tc.name DEMUXER_FUNCTION_0300
    //  * @tc.desc test
    //  * @tc.type FUNC
    //  * @tc.require
    //  */
    // it('DEMUXER_FUNCTION_0300', 0, () => {
    //   let result:number = await testNapi.runFuncTest(1);
    //   expect(result).assertEqual(0);
    // });

    /**
     * @tc.name DEMUXER_FUNCTION_0400
     * @tc.number DEMUXER_FUNCTION_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_0400', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_0500
     * @tc.number DEMUXER_FUNCTION_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_0500', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_0700
     * @tc.number DEMUXER_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_0700', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_0800
     * @tc.number DEMUXER_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_0800', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_0900
     * @tc.number DEMUXER_FUNCTION_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_0900', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1000
     * @tc.number DEMUXER_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_1000', Level.LEVEL2, async () => {
      let result:number = await testNapi.runFuncTest(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1100
     * @tc.number DEMUXER_FUNCTION_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_1100', Level.LEVEL2, async () => {
      let result:number = await testNapi.runFuncTest(8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1200
     * @tc.number DEMUXER_FUNCTION_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_1200', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1300
     * @tc.number DEMUXER_FUNCTION_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_1300', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1400
     * @tc.number DEMUXER_FUNCTION_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_1400', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(11);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1500
     * @tc.number DEMUXER_FUNCTION_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_1500', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(12);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1600
     * @tc.number DEMUXER_FUNCTION_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_1600', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(13);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1700
     * @tc.number DEMUXER_FUNCTION_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_1700', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(14);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1800
     * @tc.number DEMUXER_FUNCTION_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_1800', Level.LEVEL2, async () => {
      let result:number = await testNapi.runFuncTest(15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_1900
     * @tc.number DEMUXER_FUNCTION_1900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_1900', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_2000
     * @tc.number DEMUXER_FUNCTION_2000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_2000', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(17);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_2100
     * @tc.number DEMUXER_FUNCTION_2100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_2100', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(18);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_2200
     * @tc.number DEMUXER_FUNCTION_2200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_2200', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTestAsync(19);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_2300
     * @tc.number DEMUXER_FUNCTION_2300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_2300', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTestAsync(20);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_2400
     * @tc.number DEMUXER_FUNCTION_2400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_2400', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(21);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3100
     * @tc.number DEMUXER_FUNCTION_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_3100', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(22);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3200
     * @tc.number DEMUXER_FUNCTION_3200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_3200', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(23);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3300
     * @tc.number DEMUXER_FUNCTION_3300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_3300', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(24);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3400
     * @tc.number DEMUXER_FUNCTION_3400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_3400', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(25);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3500
     * @tc.number DEMUXER_FUNCTION_3500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_3500', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(26);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3600
     * @tc.number DEMUXER_FUNCTION_3600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_3600', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(27);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3700
     * @tc.number DEMUXER_FUNCTION_3700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_3700', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(28);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3800
     * @tc.number DEMUXER_FUNCTION_3800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_3800', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(29);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_3900
     * @tc.number DEMUXER_FUNCTION_3900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_3900', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(30);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_4000
     * @tc.number DEMUXER_FUNCTION_4000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_4000', Level.LEVEL2, async () => {
      let result:number = await testNapi.runFuncTest(31);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_4100
     * @tc.number DEMUXER_FUNCTION_4100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_4100', Level.LEVEL2, async () => {
      let result:number = await testNapi.runFuncTest(32);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_4200
     * @tc.number DEMUXER_FUNCTION_4200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_4200', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(33);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_4300
     * @tc.number DEMUXER_FUNCTION_4300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_4300', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(34);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_4400
     * @tc.number DEMUXER_FUNCTION_4400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_4400', Level.LEVEL1, async () => {
      let result:number = await testNapi.runFuncTest(35);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_4500
     * @tc.number DEMUXER_FUNCTION_4500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_4500', Level.LEVEL2, async () => {
      let result:number = await testNapi.runFuncTest(36);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7000
     * @tc.number DEMUXER_FUNCTION_7000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7000', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(37);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7100
     * @tc.number DEMUXER_FUNCTION_7100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7100', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7200
     * @tc.number DEMUXER_FUNCTION_7200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7200', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(39);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7300
     * @tc.number DEMUXER_FUNCTION_7300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7300', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(40);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7400
     * @tc.number DEMUXER_FUNCTION_7400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7400', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(41);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7500
     * @tc.number DEMUXER_FUNCTION_7500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7500', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7600
     * @tc.number DEMUXER_FUNCTION_7600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7600', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(43);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7700
     * @tc.number DEMUXER_FUNCTION_7700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7700', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(44);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7800
     * @tc.number DEMUXER_FUNCTION_7800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7800', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(45);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_7900
     * @tc.number DEMUXER_FUNCTION_7900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_7900', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(46);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8000
     * @tc.number DEMUXER_FUNCTION_8000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8000', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(47);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8100
     * @tc.number DEMUXER_FUNCTION_8100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8100', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(48);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8200
     * @tc.number DEMUXER_FUNCTION_8200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8200', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(49);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8300
     * @tc.number DEMUXER_FUNCTION_8300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8300', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(50);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8400
     * @tc.number DEMUXER_FUNCTION_8400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8400', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(51);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8500
     * @tc.number DEMUXER_FUNCTION_8500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8500', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(52);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8600
     * @tc.number DEMUXER_FUNCTION_8600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8600', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(53);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8700
     * @tc.number DEMUXER_FUNCTION_8700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8700', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(54);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8800
     * @tc.number DEMUXER_FUNCTION_8800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8800', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(55);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_8900
     * @tc.number DEMUXER_FUNCTION_8900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_8900', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(56);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_9000
     * @tc.number DEMUXER_FUNCTION_9000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_9000', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(57);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_FUNCTION_0200
     * @tc.number SUB_MEDIA_DEMUXER_FUNCTION_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_FUNCTION_0200', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(58);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_FUNCTION_0300
     * @tc.number SUB_MEDIA_DEMUXER_FUNCTION_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_FUNCTION_0300', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(59);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_FUNCTION_1000
     * @tc.number SUB_MEDIA_DEMUXER_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_FUNCTION_1000', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(60);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_FUNCTION_1100
     * @tc.number SUB_MEDIA_DEMUXER_FUNCTION_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_FUNCTION_1100', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(61);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_FUNCTION_1200
     * @tc.number SUB_MEDIA_DEMUXER_FUNCTION_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_FUNCTION_1200', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(62);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_FUNCTION_1300
     * @tc.number SUB_MEDIA_DEMUXER_FUNCTION_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_FUNCTION_1300', Level.LEVEL0, async () => {
      let result:number = await testNapi.runFuncTest(63);
      expect(result).assertEqual(0);
    });

  });
}
