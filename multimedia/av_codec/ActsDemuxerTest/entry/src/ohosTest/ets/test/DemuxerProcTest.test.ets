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

export default function DemuxerProcTestTest() {
  describe('DemuxerProcessTest', () => {
    beforeAll(async () => {
      console.info('DemuxerProcessTest beforeAll called');
      
      try {
        let context = getContext();
        let filesDir = context.filesDir;
        
        // 创建必要的目录
        let mediaDir = filesDir + "/media";
        let audioDir = mediaDir + "/audio";
        
        if (!fs.accessSync(mediaDir)) {
          fs.mkdirSync(mediaDir);
          console.info(`Created directory: ${mediaDir}`);
        }
        
        if (!fs.accessSync(audioDir)) {
          fs.mkdirSync(audioDir);
          console.info(`Created directory: ${audioDir}`);
        }
        
        // 复制测试文件（只复制已准备的文件）
        // 如果 rawfile 中有文件，就复制；如果没有，跳过
        const filesToCopy: FileCopyInfo[] = [
          { raw: 'avc_mp3.flv', target: mediaDir + '/avc_mp3.flv' },
          { raw: 'video_2audio.mp4', target: mediaDir + '/video_2audio.mp4' },
          { raw: 'video_9audio.mp4', target: mediaDir + '/video_9audio.mp4' },
          { raw: 'hevc_pcm_a.flv', target: mediaDir + '/hevc_pcm_a.flv' },
          { raw: 'avc_mp3_error.flv', target: mediaDir + '/avc_mp3_error.flv' },
          { raw: 'ape.ape', target: mediaDir + '/audio/ape.ape' },
          { raw: 'srt_test.srt', target: mediaDir + '/srt_test.srt' },
          { raw: 'srt_2800.srt', target: mediaDir + '/srt_2800.srt' },
          { raw: 'srt_2900.srt', target: mediaDir + '/srt_2900.srt' },
          { raw: 'srt_3000.srt', target: mediaDir + '/srt_3000.srt' },
          { raw: 'srt_3100.srt', target: mediaDir + '/srt_3100.srt' },
          { raw: 'srt_3200.srt', target: mediaDir + '/srt_3200.srt' },
          { raw: '01_video_audio.mp4', target: mediaDir + '/01_video_audio.mp4' },
          { raw: 'test_265_B_Gop25_4sec.mp4', target: mediaDir + '/test_265_B_Gop25_4sec.mp4' },
          { raw: 'test_starttime.mp4', target: mediaDir + '/test_starttime.mp4' },
          { raw: 'srt_3300.srt', target: mediaDir + '/srt_3300.srt' },
          { raw: 'm4v_fmp4.mp4', target: mediaDir + '/m4v_fmp4.mp4' },
          { raw: 'm4a_fmp4.mp4', target: mediaDir + '/m4a_fmp4.mp4' },
          { raw: 'h265_aac_1mvex_fmp4.mp4', target: mediaDir + '/h265_aac_1mvex_fmp4.mp4' },
          { raw: 'h264_mp3_3mevx_fmp4.mp4', target: mediaDir + '/h264_mp3_3mevx_fmp4.mp4' },
          { raw: 'audiovivid_hdrvivid_1s_fmp4.mp4', target: mediaDir + '/audiovivid_hdrvivid_1s_fmp4.mp4' }
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
      console.info('DemuxerProcessTest afterAll called');
    });

    beforeEach(() => {
      console.info('DemuxerProcessTest beforeEach called');
    });

    afterEach(() => {
      console.info('DemuxerProcessTest afterEach called');
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_1400
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1400
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_1400', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_1500
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1500
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_1500', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_1600
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1600
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_1600', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_1700
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1700
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_1700', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_1800
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1800
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_1800', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_1900
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1900
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_1900', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2000
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2000
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2000', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2100
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2100
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2100', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2200
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2200
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2200', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2300
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2300
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2300', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2400
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2400
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2400', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2600
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2600
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2600', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(11);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2700
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2700
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2700', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(12);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2800
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2800
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2800', Level.LEVEL2, () => {
      let result:number = testNapi.runProcTest(13);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_2900
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2900
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_2900', Level.LEVEL2, () => {
      let result:number = testNapi.runProcTest(14);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3000
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3000
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3000', Level.LEVEL2, () => {
      let result:number = testNapi.runProcTest(15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3100
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3100
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3100', Level.LEVEL2, () => {
      let result:number = testNapi.runProcTest(16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3200
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3200
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3200', Level.LEVEL2, () => {
      let result:number = testNapi.runProcTest(17);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3300
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3300
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3300', Level.LEVEL2, () => {
      let result:number = testNapi.runProcTest(18);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3400
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3400
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3400', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(19);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3800
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3800
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3800', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(20);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3700
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3700
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3700', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(21);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3600
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3600
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3600', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(22);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3510
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3510
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3510', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(23);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MEDIA_DEMUXER_PROCESS_3500
     * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3500
     * @tc.desc   process test
     * @tc.type   PROCESS
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_DEMUXER_PROCESS_3500', Level.LEVEL0, () => {
      let result:number = testNapi.runProcTest(24);
      expect(result).assertEqual(0);
    });

  });
}
