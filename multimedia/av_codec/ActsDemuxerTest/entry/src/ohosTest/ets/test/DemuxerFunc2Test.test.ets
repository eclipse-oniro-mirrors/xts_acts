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

export default function DemuxerFunc2TestTest() {
  describe('DemuxerFunction2Test', () => {
    beforeAll(async () => {
      console.info('DemuxerFunction2Test beforeAll called');
      
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
          { raw: 'vtt_6100.vtt', target: mediaDir + '/vtt_6100.vtt' },
          { raw: 'wav_alaw_410_8b_1.wav', target: audioDir + '/wav_alaw_410_8b_1.wav' },
          { raw: 'wav_alaw_8K_8b_2.wav', target: audioDir + '/wav_alaw_8K_8b_2.wav' },
          { raw: 'wav_alaw_16K_8b_2.wav', target: audioDir + '/wav_alaw_16K_8b_2.wav' },
          { raw: 'wav_alaw_48K_8b_1.wav', target: audioDir + '/wav_alaw_48K_8b_1.wav' },
          { raw: 'wav_alaw_768001_8b_2.wav', target: audioDir + '/wav_alaw_768001_8b_2.wav' },
          { raw: 'Muxer_Auxiliary.mp4', target: mediaDir + '/Muxer_Auxiliary.mp4' },
          { raw: 'Muxer_Auxiliary_01.mp4', target: mediaDir + '/Muxer_Auxiliary_01.mp4' },
          { raw: 'Muxer_Auxiliary_02.mp4', target: mediaDir + '/Muxer_Auxiliary_02.mp4' },
          { raw: 'Muxer_Auxiliary_03.mp4', target: mediaDir + '/Muxer_Auxiliary_03.mp4' },
          { raw: 'Muxer_Auxiliary_04.mp4', target: mediaDir + '/Muxer_Auxiliary_04.mp4' },
          { raw: 'test_size_large.mp4', target: mediaDir + '/test_size_large.mp4' },
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
      console.info('DemuxerFunction2Test afterAll called');
    });

    beforeEach(() => {
      console.info('DemuxerFunction2Test beforeEach called');
    });

    afterEach(() => {
      console.info('DemuxerFunction2Test afterEach called');
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_VTT_6100
     * @tc.number SUB_MEDIA_DEMUXER_VTT_6100
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_DEMUXER_VTT_6100', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_META_0090
     * @tc.number DEMUXER_META_0090
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_META_0090', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0001
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0001
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_WAV_ALAW_FUNC_0001', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0002
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0002
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_WAV_ALAW_FUNC_0002', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0003
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0003
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_WAV_ALAW_FUNC_0003', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0004
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0004
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_WAV_ALAW_FUNC_0004', Level.LEVEL1, () => {
      let result:number = testNapi.runFunc2Test(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0005
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0005
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_WAV_ALAW_FUNC_0005', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0006
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0006
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_WAV_ALAW_FUNC_0006', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0007
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0007
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_WAV_ALAW_FUNC_0007', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0008
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0008
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_WAV_ALAW_FUNC_0008', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0009
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0009
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_WAV_ALAW_FUNC_0009', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_WAV_ALAW_FUNC_0010
     * @tc.number DEMUXER_WAV_ALAW_FUNC_0010
      * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_WAV_ALAW_FUNC_0010', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(11);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0010
     * @tc.number DEMUXER_FUNCTION_TRACK_0010
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_TRACK_0010', Level.LEVEL1, () => {
      let result:number = testNapi.runFunc2Test(12);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0020
     * @tc.number DEMUXER_FUNCTION_TRACK_0020
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_TRACK_0020', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(13);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0030
     * @tc.number DEMUXER_FUNCTION_TRACK_0030
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_TRACK_0030', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(14);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0040
     * @tc.number DEMUXER_FUNCTION_TRACK_0040
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_TRACK_0040', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0050
     * @tc.number DEMUXER_FUNCTION_TRACK_0050
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0050', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0060
     * @tc.number DEMUXER_FUNCTION_TRACK_0060
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0060', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(17);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0061
     * @tc.number DEMUXER_FUNCTION_TRACK_0061
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0061', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(18);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0070
     * @tc.number DEMUXER_FUNCTION_TRACK_0070
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_TRACK_0070', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(19);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0080
     * @tc.number DEMUXER_FUNCTION_TRACK_0080
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_TRACK_0080', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(20);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0090
     * @tc.number DEMUXER_FUNCTION_TRACK_0090
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_TRACK_0090', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(21);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0130
     * @tc.number DEMUXER_FUNCTION_TRACK_0130
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0130', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(22);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0140
     * @tc.number DEMUXER_FUNCTION_TRACK_0140
      * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0140', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(23);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0150
     * @tc.number DEMUXER_FUNCTION_TRACK_0150
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0150', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(24);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0160
     * @tc.number DEMUXER_FUNCTION_TRACK_0160
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0160', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(25);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0170
     * @tc.number DEMUXER_FUNCTION_TRACK_0170
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0170', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(26);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0180
     * @tc.number DEMUXER_FUNCTION_TRACK_0180
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0180', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(27);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_TRACK_0190
     * @tc.number DEMUXER_FUNCTION_TRACK_0190
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_TRACK_0190', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(28);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0010
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0010
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0010', Level.LEVEL1, () => {
      let result:number = testNapi.runFunc2Test(29);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0020
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0020
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0020', Level.LEVEL1, () => {
      let result:number = testNapi.runFunc2Test(30);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0030
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0030
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0030', Level.LEVEL1, () => {
      let result:number = testNapi.runFunc2Test(31);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0040
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0040
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0040', Level.LEVEL1, () => {
      let result:number = testNapi.runFunc2Test(32);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0050
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0050
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0050', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(33);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0060
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0060
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0060', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(34);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0061
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0061
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0061', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(35);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0070
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0070
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0070', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(36);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0080
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0080
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0080', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(37);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0090
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0090
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0090', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0130
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0130
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0130', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(39);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0140
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0140
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0140', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(40);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0150
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0150
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0150', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(41);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0160
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0160
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0160', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0170
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0170
      * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0170', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(43);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0180
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0180
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0180', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(44);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_AUDIO_TRACK_0190
     * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0190
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DEMUXER_FUNCTION_AUDIO_TRACK_0190', Level.LEVEL0, () => {
      let result:number = testNapi.runFunc2Test(45);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_ADD_0010
     * @tc.number DEMUXER_FUNCTION_ADD_0010
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_ADD_0010', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(46);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_ADD_0020
     * @tc.number DEMUXER_FUNCTION_ADD_0020
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_ADD_0020', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(47);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name DEMUXER_FUNCTION_ADD_0030
     * @tc.number DEMUXER_FUNCTION_ADD_0030
     * @tc.desc test
     * @tc.type FUNC
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DEMUXER_FUNCTION_ADD_0030', Level.LEVEL2, () => {
      let result:number = testNapi.runFunc2Test(48);
      expect(result).assertEqual(0);
    });

  });
}
