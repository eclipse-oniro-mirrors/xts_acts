import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import player from 'libplayer.so';
import { common } from '@kit.AbilityKit';
import OhLppPlayerNDKTestBase from './OhLppPlayerNDKTestBase';
import { resourceManager } from '@kit.LocalizationKit';

let lppBase = new OhLppPlayerNDKTestBase();
const SUCC: number = 0;
let FAIL: number = -1;
let errorCode: number = -1;
// ErrCode;
const AV_ERR_OK = 0 //操作成功;
const AV_ERR_NO_MEMORY = 1 //无内存;
const AV_ERR_OPERATE_NOT_PERMIT = 2 //操作不允许;
const AV_ERR_INVALID_VAL = 3 //无效值;
const AV_ERR_IO = 4 //IO错误;
const AV_ERR_TIMEOUT = 5 //超时错误;
const AV_ERR_UNKNOWN = 6 //未知错误;
const mySteps_Test: string[] = [
  //set filename
  lppBase.INIT_FD_EVENT,
  //createPrepareNative
  lppBase.CREATE_PREPARE_NATIVE_EVENT,
  //video start decoder
  lppBase.VIDEO_START_DECODER_EVENT,
  //video first frame
  lppBase.VIDEO_RENDER_FIRSTFRAME_EVENT,
  //video start rendering
  lppBase.VIDEO_AUDIO_START_RENDER_EVENT,

  lppBase.WAIT_LPP_PLAYER_EVENT,
  lppBase.VIDEO_SET_SPEED_EVENT,
  //pause
  // lppBase.VIDEO_PAUSE_EVENT,
  //stop
  lppBase.STOP_EVENT,
  // destory
  lppBase.DESTROY_EVENT,
  //done recorder
  lppBase.END_EVENT
];
const mySteps_Audio_Error_Test: string[] = [
  //set filename
  lppBase.INIT_FD_EVENT,
  //createPrepareNative
  lppBase.CREATE_PREPARE_NATIVE_EVENT,
  //video start decoder
  lppBase.VIDEO_START_DECODER_ERROR_EVENT,
  // destory
  lppBase.DESTROY_EVENT,
  //done recorder
  lppBase.END_EVENT
];

errorCode = 0;
export default function OhLPPMp4NDKTest() {

  const TAG: string = 'Sample_Player'
  describe('OhLPPMp4NDKTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0100
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0100
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0100', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0100 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "1hevc_720x480_60.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0100 test end `);
    });

    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0101
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0101
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0101', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0101 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "1mpeg4_720x480_30.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0101 test end `);
    });

    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0102
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0102
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0102', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0102 test start `);
      let mySteps =  [...mySteps_Audio_Error_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 2,
        fdPath: "H264_NONE.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0102 test end `);
    });

    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0103
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0103
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0103', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0103 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "h263_aac.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0103 test end `);
    });


    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0104
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0104
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0104', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0104 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "h263_mp3.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0104 test end `);
    });


    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0105
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0105
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0105', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0105 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "h264_1280x720_30.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0105 test end `);
    });


    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0106
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0106
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0106', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0106 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "H264_AAC.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0106 test end `);
    });


    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0108
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0108
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0108', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0108 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "h264_aac_320x320_30r.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0108 test end `);
    });


    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0109
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0109
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0109', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0109 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "H264_AAC_Matedata.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0109 test end `);
    });


    /**
     * @tc.number     : TESTOHLPP_MP4_ERROREVENT_0110
     * @tc.name       : TESTOHLPP_MP4_ERROREVENT_0110
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TESTOHLPP_MP4_ERROREVENT_0110', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_MP4_ERROREVENT_0110 test start `);
      let mySteps =  [...mySteps_Test];
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "H264_MP3.mp4"
      }
      await lppBase.toNextStep(config, "", mySteps, errorCode, done);
      console.info(`TESTOHLPP_MP4_ERROREVENT_0110 test end `);
    });

  })
}