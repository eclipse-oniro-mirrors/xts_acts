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

let mySteps_Test: string[] = new Array(
  //set filename
  lppBase.INIT_FD_EVENT,
  lppBase.CREATELPP_SET_EVENT,

  //create
  lppBase.AUDIO_CREATE_BYMIME_EVENT,
  //aduio set par
  lppBase.AUDIO_SET_PARAMETER_EVENT,
  //aduio prepare
  lppBase.AUDIO_PREPARE_EVENT,
  //2s
  lppBase.WAIT_LPP_PLAYER_EVENT,
  //pause
  lppBase.AUDIO_PAUSE_ERROR_EVENT,
  //set speed
  lppBase.AUDIO_SET_SPEED_EVENT,
  lppBase.AUDIO_SET_VOLUME_UP_EVENT,
  lppBase.WAIT_LPP_PLAYER_EVENT,
  //resume
  lppBase.AUDIO_RESUME_ERROR_EVENT,
  // destory
  lppBase.AUDIO_DESTROY_EVENT,
  //done recorder
  lppBase.END_EVENT
);
export function CanIUseLPPTest() {

  const TAG: string = 'Sample_Player'
  describe('CanIUseLPPTest', () => {
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
     * @tc.number     : TESTOHLPP_CANIUSE_ERROREVENT_0100
     * @tc.name       : TESTOHLPP_CANIUSE_ERROREVENT_0100
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('TESTOHLPP_CANIUSE_ERROREVENT_0100', Level.LEVEL0, async (done: Function) => {
      console.info(`TESTOHLPP_CANIUSE_ERROREVENT_0100 test start `);
      let isSupport = canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink");
      if (isSupport) {
        console.log("support SystemCapability.Multimedia.Media.LowPowerAVSink")
        expect(isSupport).assertEqual(true);
        done();
        return;
      } else {
        console.log("nonsupport SystemCapability.Multimedia.Media.LowPowerAVSink")
        expect(isSupport).assertEqual(false);
        done();
        return;
      }
      console.info(`TESTOHLPP_CANIUSE_ERROREVENT_0100 test end `);
    });

  })
}

export function executeLowPowerAVSink() : boolean {
  let isSupport = canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink");
  console.log("SystemCapability.Multimedia.Media.LowPowerAVSink="+isSupport)
  return isSupport;
}