/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { LOG_TAG, SLEEP_TIME_20, SLEEP_TIME_200, SLEEP_TIME_2000, SLEEP_TIME_500 } from "../Constants";
import { closeFd, driveFn, getFd, sleep } from "../common";
import AVRecorderCommon from "./AVRecorderCommon";
import { Permissions } from "@kit.AbilityKit";

const TAG = LOG_TAG + 'AVScreenCaptureRecorderTest';
let commonFun: AVRecorderCommon = new AVRecorderCommon();
let mScreenCapture: media.AVScreenCaptureRecorder | undefined;
let fileName: string = 'screenCapture.mp4';
let infoType: media.AVScreenCaptureStateCode = -1;

let captureConfig: media.AVScreenCaptureRecordConfig = {
  // 开发者可以根据自身的需要设置宽高。
  frameWidth: 768,
  frameHeight: 1280,
  // 参考应用文件访问与管理开发示例新建并读写一个文件fd。
  fd: -1,
  // 可选参数及其默认值。
  videoBitrate: 10000000,
  audioSampleRate: 48000,
  audioChannelCount: 2,
  audioBitrate: 96000,
  displayId: 0,
  preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
  fillMode: media.AVScreenCaptureFillMode.PRESERVE_ASPECT_RATIO
};

async function initConfig(testName: string) {
  if (mScreenCapture !== undefined) {
    captureConfig.fd = await getFd(fileName);
    await mScreenCapture.init(captureConfig).then(() => {
      console.info(TAG, testName + ' Succeeded in initting AVScreenCaptureRecorder.');
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to init AVScreenCaptureRecorder, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, testName + ' screenCapture is undefined.');
    expect().assertFail();
  }
}

async function createAVScreenCaptureRecorder(done: Function, testName: string) {
  await media.createAVScreenCaptureRecorder().then((screenCapture: media.AVScreenCaptureRecorder) => {
    if (screenCapture) {
      mScreenCapture = screenCapture;
      console.info(TAG, testName + ' Succeeded in creating AVScreenCaptureRecorder.');
      expect(true).assertTrue();
    }
  }).catch((error: BusinessError) => {
    console.error(TAG,
      testName + ' Failed to create AVScreenCaptureRecorder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  });
}

async function startRecording(testName: string) {
  if (mScreenCapture !== undefined) {
    await mScreenCapture.startRecording().then(async () => {
      console.info(TAG, testName + ' Succeeded in starting Recording.');
      await driveFn();
      await sleep(SLEEP_TIME_2000);
      console.info(TAG, testName + ' The current status is: ' + infoType);
      expect(infoType).assertEqual(media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STARTED);
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to start Recording, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, testName + ' screenCapture is undefined.');
    expect().assertFail();
  }
}

async function stopRecording(testName: string) {
  if (mScreenCapture !== undefined) {
    await mScreenCapture.stopRecording().then(async () => {
      console.info(TAG, testName + ' Succeeded in stopping Recording.');
      await sleep(SLEEP_TIME_200);
      console.info(TAG, testName + ' The current status is: ' + infoType);
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to stop Recording, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, testName + ' screenCapture is undefined.');
    expect().assertFail();
  }
}

async function skipPrivacyMode(testName: string, windowIDs: Array<number>) {
  if (mScreenCapture !== undefined) {
    await mScreenCapture.skipPrivacyMode(windowIDs).then(async () => {
      console.info(TAG, testName + ' Succeeded in skipping privacy mode');
      await sleep(SLEEP_TIME_20);
      console.info(TAG, testName + ' The current status is: ' + infoType);
      expect(infoType).assertEqual(media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_ENTER_PRIVATE_SCENE);
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to skip privacy mode, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, testName + ' screenCapture is undefined.');
    expect().assertFail();
  }
}

async function setMicEnabled(testName: string, micEnabled: boolean) {
  if (mScreenCapture !== undefined) {
    await mScreenCapture.setMicEnabled(micEnabled).then(async () => {
      console.info(TAG, testName + ' Succeeded in setting MicEnabled.');
      await sleep(SLEEP_TIME_20);
      console.info(TAG, testName + ' The current status is: ' + infoType);
      if (micEnabled) {
        console.info(TAG, testName + ' mic has closed.');
        expect(infoType).assertEqual(media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNMUTED_BY_USER);
      } else {
        console.info(TAG, testName + ' mic has opened.');
        expect(infoType).assertEqual(media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_MUTED_BY_USER);
      }
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to set MicEnabled, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, testName + ' screenCapture is undefined.');
    expect().assertFail();
  }
}

async function release(testName: string) {
  if (mScreenCapture !== undefined) {
    await mScreenCapture.release().then(async () => {
      console.info(TAG, testName + ' Succeeded in releasing AVScreenCaptureRecorder.');
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to release AVScreenCaptureRecorder, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, testName + ' screenCapture is undefined.');
    expect().assertFail();
  }
}

function onListen(testName: string) {
  if (mScreenCapture) {
    mScreenCapture.on('stateChange', (state: media.AVScreenCaptureStateCode) => {
      infoType = state;
      switch (state) {
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STARTED:
          console.info(TAG, testName + ' state: ' + state + ' Screen recording has started successfully.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_CANCELED:
          mScreenCapture?.release();
          mScreenCapture = undefined;
          console.info(TAG, testName + ' state: ' + state + ' Not allowed to use screen recording function');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER:
          mScreenCapture?.release();
          mScreenCapture = undefined;
          console.info(TAG, testName + ' state: ' + state + ' The user stops recording the screen.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_INTERRUPTED_BY_OTHER:
          console.info(TAG, testName + ' state: ' + state + ' Screen recording stopped due to other interruptions.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_CALL:
          console.info(TAG, testName + ' state: ' + state +
            ' The screen recording process was interrupted due to a call interruption.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNAVAILABLE:
          console.info(TAG, testName + ' state: ' + state + ' The screen recording microphone is not available.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_MUTED_BY_USER:
          console.info(TAG, testName + ' state: ' + state + ' The recording microphone has been muted by the user.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNMUTED_BY_USER:
          console.info(TAG, testName + ' state: ' + state + ' The recording microphone has been unmuted by the user.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_ENTER_PRIVATE_SCENE:
          // 目前可以从系统直接注册监听到进入隐私场景。
          console.info(TAG, testName + ' state: ' + state + ' Record the screen and enter the privacy scene.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_EXIT_PRIVATE_SCENE:
          console.info(TAG, testName + ' state: ' + state + ' Screen recording exits the privacy scene.');
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER_SWITCHES:
          console.info(TAG, testName + ' state: ' + state + ' User account switching, screen recording stops.');
          break;
        default:
          break;
      }
    });
    mScreenCapture.on('error', (error: BusinessError) => {
      console.error(TAG, testName + ' Failed to set MicEnabled, code: ' + error.code + ', msg: ' + error.message);
    });
  }
}

function offListen() {
  if (mScreenCapture !== undefined) {
    mScreenCapture.off('stateChange');
    mScreenCapture.off('error');
    console.info(TAG, 'stop listen.');
  }
}

export default function AVScreenCaptureRecorderTest() {
  describe('AVScreenCaptureRecorderTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MICROPHONE', 'ohos.permission.READ_MEDIA',
          'ohos.permission.WRITE_MEDIA'];
      await commonFun.getPermission(permissionNames);
      await commonFun.msleepAsync(SLEEP_TIME_500);
      await commonFun.driveFn();
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
      await sleep(SLEEP_TIME_20);
      if (mScreenCapture !== undefined) {
        await mScreenCapture.release();
        mScreenCapture = undefined;
      }
      infoType = -1;
      console.info(TAG, 'afterEach end');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await closeFd(captureConfig.fd);
    });

    /**
     * @tc.name   createAVScreenCaptureRecorder_001
     * @tc.number AV_SCREEN_CAPTURE_RECORDER_TEST_001
     * @tc.desc   Test normal scene of create AVScreenCaptureRecorder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVScreenCaptureRecorder_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVScreenCaptureRecorder_001';
      await createAVScreenCaptureRecorder(done, testName);
      done();
    })

    /**
     * @tc.name   init_001
     * @tc.number AV_SCREEN_CAPTURE_RECORDER_TEST_002
     * @tc.desc   Test normal scene of init screen record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('init_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'init_001';
      await createAVScreenCaptureRecorder(done, testName);
      await initConfig(testName);
      done();
    })

    /**
     * @tc.name   startRecording_001
     * @tc.number AV_SCREEN_CAPTURE_RECORDER_TEST_003
     * @tc.desc   Test normal scene of start screen record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('startRecording_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'startRecording_001';
      await createAVScreenCaptureRecorder(done, testName);
      onListen(testName);
      await initConfig(testName);
      await startRecording(testName);
      offListen();
      done();
    })

    /**
     * @tc.name   stopRecording_001
     * @tc.number AV_SCREEN_CAPTURE_RECORDER_TEST_004
     * @tc.desc   Test normal scene of stop screen record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopRecording_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stopRecording_001';
      await createAVScreenCaptureRecorder(done, testName);
      onListen(testName);
      await initConfig(testName);
      await startRecording(testName);
      await stopRecording(testName);
      offListen();
      done();
    })

    /**
     * @tc.name   setMicEnabled_001
     * @tc.number AV_SCREEN_CAPTURE_RECORDER_TEST_006
     * @tc.desc   Test normal scene of stop screen record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setMicEnabled_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMicEnabled_001';
      await createAVScreenCaptureRecorder(done, testName);
      onListen(testName);
      await initConfig(testName);
      await startRecording(testName);
      await setMicEnabled(testName, false);
      offListen();
      done();
    })

    /**
     * @tc.name   setMicEnabled_002
     * @tc.number AV_SCREEN_CAPTURE_RECORDER_TEST_007
     * @tc.desc   Test normal scene of stop screen record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setMicEnabled_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMicEnabled_002';
      await createAVScreenCaptureRecorder(done, testName);
      onListen(testName);
      await initConfig(testName);
      await startRecording(testName);
      await setMicEnabled(testName, true);
      offListen();
      done();
    })

    /**
     * @tc.name   release_recorder_001
     * @tc.number AV_SCREEN_CAPTURE_RECORDER_TEST_008
     * @tc.desc   Test normal scene of release AVScreenCaptureRecorder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_recorder_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_recorder_001';
      await createAVScreenCaptureRecorder(done, testName);
      onListen(testName);
      await initConfig(testName);
      await startRecording(testName);
      await release(testName);
      offListen();
      done();
    })
  })
}