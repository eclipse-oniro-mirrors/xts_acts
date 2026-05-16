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

export default function OhLPPVideoNDKTest() {

  const TAG: string = 'Sample_Player'
  describe('OhLPPVideoNDKTest', () => {
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
     * @tc.name   TESTOHLPPVIDEO_NULL_ERROREVENT_0100
     * @tc.number TESTOHLPPVIDEO_NULL_ERROREVENT_0100
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TESTOHLPPVIDEO_NULL_ERROREVENT_0100', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPPVIDEO_NULL_ERROREVENT_0100 test start `);

      let mySteps: string[] = new Array(
        //set filename
        lppBase.INIT_FD_EVENT,
        lppBase.VIDEO_CREATE_NULL_EVENT,
        lppBase.VIDEO_SET_PARAMETER_ERROR_EVENT,
        //CALLBACK or Listener
        lppBase.VIDEO_CB_CREATE_CALLBACK_NULL_EVENT,
        lppBase.VIDEO_CB_SET_DATA_LISTENER_EVENT,
        lppBase.VIDEO_CB_SET_STREAMCHANGE_LISTENER_EVENT,
        lppBase.VIDEO_CB_SET_ERROR_LISTENER_EVENT,
        lppBase.VIDEO_CB_SET_RENDERSTART_LISTENER_EVENT,
        lppBase.VIDEO_CB_SET_FIRSTFRAME_LISTENER_EVENT,
        lppBase.VIDEO_CB_SET_TARGET_STARTFRAME_EVENT,
        lppBase.VIDEO_CB_RETURN_FRAMES_EVENT,
        lppBase.VIDEO_CB_SET_EOS_LISTENER_EVENT,

        //createPrepareNative
        lppBase.VIDEO_PREPARE_ERROR_EVENT,
        //video start decoder
        lppBase.VIDEO_START_DECODER_ERROR_EVENT,
        //video first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_ERROR_EVENT,
        //video start rendering
        lppBase.VIDEO_START_RENDER_ERROR_EVENT,
        //set speed
        lppBase.VIDEO_SET_SPEED_ERROR_EVENT,
        //lppBase.VIDEO_GET_PARAMETER_ERROR_EVENT,
        //video stop
        lppBase.VIDEO_STOP_ERROR_EVENT,
        lppBase.VIDEO_RESUME_ERROR_EVENT,
        lppBase.VIDEO_PAUSE_ERROR_EVENT,
        lppBase.VIDEO_FLUSH_ERROR_EVENT,
        lppBase.VIDEO_RESET_ERROR_EVENT,
        // destory
        lppBase.VIDEO_CALLBACKDESTROY_EVENT,
        lppBase.VIDEO_DESTROY_EVENT,
        //done recorder
        lppBase.END_EVENT
      );
      errorCode = 0;
      let config: ESObject = {
        sucCode: 3,
        speed: 2,
        errorCode: 3,
        fdPath: "H264_AAC.mp4"
      }
      await lppBase.toNextStep(config, "",  mySteps, errorCode, done);
      console.info(`TESTOHLPPVIDEO_NULL_ERROREVENT_0100 test end `);
    });

    /**
     * @tc.name   TESTOHLPPVIDEO_MP4_ERROREVENT_0100
     * @tc.number TESTOHLPPVIDEO_MP4_ERROREVENT_0100
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TESTOHLPPVIDEO_MP4_ERROREVENT_0100', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPPVIDEO_MP4_ERROREVENT_0100 test start `);

      let mySteps: string[] = new Array(
        //set filename
        lppBase.INIT_FD_EVENT,
        //createPrepareNative
        lppBase.CREATE_PREPARE_NATIVE_EVENT,
        //video start decoder
        lppBase.VIDEO_START_DECODER_EVENT,
        //video first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_EVENT,
        //video start rendering
        lppBase.VIDEO_START_RENDER_EVENT,
        //set speed
        lppBase.VIDEO_SET_SPEED_EVENT,
        lppBase.WAIT_LPP_PLAYER_EVENT,
        //video stop
        lppBase.VIDEO_STOP_EVENT,
        // destory
        lppBase.DESTROY_EVENT,
        //done recorder
        lppBase.END_EVENT
      );
      errorCode = 0;
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "H264_AAC.mp4"
      }
      await lppBase.toNextStep(config, "",  mySteps, errorCode, done);
      console.info(`TESTOHLPPVIDEO_MP4_ERROREVENT_0100 test end `);
    });

    /**
     * @tc.name   TESTOHLPPVIDEO_MP4_ERROREVENT_0102
     * @tc.number TESTOHLPPVIDEO_MP4_ERROREVENT_0102
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TESTOHLPPVIDEO_MP4_ERROREVENT_0102', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPPVIDEO_MP4_ERROREVENT_0102 test start `);

      let mySteps: string[] = new Array(
        //set filename
        lppBase.INIT_FD_EVENT,
        //createPrepareNative
        lppBase.CREATE_PREPARE_NATIVE_EVENT,
        //video start decoder
        lppBase.VIDEO_START_DECODER_EVENT,
        //video first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_EVENT,
        //video start rendering
        lppBase.VIDEO_START_RENDER_EVENT,

        lppBase.WAIT_LPP_PLAYER_EVENT,
        //pause
        lppBase.VIDEO_PAUSE_EVENT,
        //set speed
        lppBase.VIDEO_SET_SPEED_EVENT,
        //2s
        lppBase.WAIT_LPP_PLAYER_EVENT,
        //resume
        lppBase.VIDEO_RESUME_EVENT,
        lppBase.VIDEO_SET_SPEED_EVENT,
        lppBase.WAIT_LPP_PLAYER_EVENT,
        // destory
        lppBase.DESTROY_EVENT,
        //done recorder
        lppBase.END_EVENT
      );
      errorCode = 0;
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 0,
        fdPath: "h264_1280x720_30.mp4"
      }
      await lppBase.toNextStep(config, "",  mySteps, errorCode, done);
      console.info(`TESTOHLPPVIDEO_MP4_ERROREVENT_0102 test end `);
    });

    /**
     * @tc.name   TESTOHLPPVIDEO_MP4_ERROREVENT_0103
     * @tc.number TESTOHLPPVIDEO_MP4_ERROREVENT_0103
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TESTOHLPPVIDEO_MP4_ERROREVENT_0103', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPPVIDEO_MP4_ERROREVENT_0103 test start `);

      let mySteps: string[] = new Array(
        //set filename
        lppBase.INIT_FD_EVENT,
        //createPrepareNative
        lppBase.CREATE_PREPARE_NATIVE_EVENT,
        //video start decoder
        lppBase.VIDEO_START_DECODER_EVENT,
        //video first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_EVENT,
        //video start rendering
        lppBase.VIDEO_START_RENDER_EVENT,
        //2s
        lppBase.WAIT_LPP_PLAYER_EVENT,
        //Error first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_ERROR_EVENT,
        //pause
        lppBase.VIDEO_PAUSE_EVENT,
        //Error first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_ERROR_EVENT,
        //set speed
        lppBase.VIDEO_SET_SPEED_EVENT,
        //Error first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_ERROR_EVENT,
        //2s
        lppBase.WAIT_LPP_PLAYER_EVENT,
        //resume
        lppBase.VIDEO_RESUME_EVENT,
        //Error first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_ERROR_EVENT,
        lppBase.VIDEO_SET_SPEED_EVENT,
        //Error first frame
        lppBase.VIDEO_RENDER_FIRSTFRAME_ERROR_EVENT,
        lppBase.WAIT_LPP_PLAYER_EVENT,
        // destory
        lppBase.DESTROY_EVENT,
        //done recorder
        lppBase.END_EVENT
      );
      errorCode = 6;
      let config: ESObject = {
        sucCode: 0,
        speed: 2,
        errorCode: 2,
        fdPath: "H264_AAC_Matedata.mp4"
      }
      await lppBase.toNextStep(config, "",  mySteps, errorCode, done);
      console.info(`TESTOHLPPVIDEO_MP4_ERROREVENT_0103 test end `);
    });
  })
}