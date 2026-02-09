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
import MediaTestBase from "./MediaTestBase";
import { LOG_TAG, MediaErrorCode, SLEEP_TIME_500, SLEEP_TIME_5000, SLEEP_TIME_200, SLEEP_TIME_20 } from "../Constants";
import { common } from "@kit.AbilityKit";
import { closeFd, getFd, sleep } from '../common';

const TAG = LOG_TAG + 'AVTranscoderTest';
const VIDEO_SOURCE = 'H264_AAC.mp4';

let mediaTestBase = new MediaTestBase();
let fileDescriptor: media.AVFileDescriptor;
let mTranscoder: media.AVTranscoder | undefined;
let currentProgress: number = 0;

let avTranscoderConfig: media.AVTranscoderConfig = {
  audioBitrate: 200000,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 3000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
};

function openFileFailed() {
  console.info(TAG, 'openFileFailed case file fail');
}

async function createAVTranscoder(done: Function, context: common.UIAbilityContext, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  await media.createAVTranscoder().then(async (transcoder: media.AVTranscoder) => {
    if (transcoder) {
      mTranscoder = transcoder;
      mTranscoder.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd('H264_AAC.mp4');
      mTranscoder.fdDst = await getFd('output.mp4');
      console.info(TAG, testName + ' Succeeded in creating AVTranscoder, fd: ' + mTranscoder.fdSrc.fd + ', offset: ' +
      mTranscoder.fdSrc.offset + ', length: ' + mTranscoder.fdSrc.length + ', fdDst: ' + mTranscoder.fdDst);
      expect(true).assertTrue();
    } else {
      console.error(TAG, testName + ' transcoder is undefined.');
      expect().assertFail();
    }
  }).catch((error: BusinessError) => {
    console.error(TAG, testName + ' Failed to create AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  });
}

async function prepareAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.prepare(avTranscoderConfig).then(() => {
      console.info(TAG, testName + ' prepare success.');
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to prepare AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  }
}

async function startAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.start().then(() => {
      console.info(TAG, testName + ' start AVTranscoder success.');
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to start AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function pauseAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.pause().then(() => {
      console.info(TAG, testName + ' pause AVTranscoder success.');
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to pause AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function resumeAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.resume().then(() => {
      console.info(TAG, testName + ' resume AVTranscoder success.');
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to resume AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function cancelAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.cancel().then(() => {
      console.info(TAG, testName + ' cancel AVTranscoder success.');
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to cancel AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function releaseAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.release().then(() => {
      console.info(TAG, testName + ' release AVTranscoder success.');
      mTranscoder = undefined;
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to release AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function progressUpdateListen(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  try {
    if (mTranscoder !== undefined) {
      mTranscoder.on('progressUpdate', async (progress: number) => {
        console.info(TAG, testName + ' avTranscoder progressUpdate. progress: ' + progress);
        currentProgress = progress;
      });
      mTranscoder.on('error', async (error: BusinessError) => {
        console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
      });
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await sleep(SLEEP_TIME_500);
      mTranscoder.off('progressUpdate');
      mTranscoder.off('error');
      expect(currentProgress > 0).assertTrue();
      done();
    }
  } catch (error) {
    console.error(TAG,
      testName + ' Failed to progressUpdate-listen AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

async function completeListen(done: Function, testName: string) {
  console.info(TAG, testName + ' completeListen begin.');
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  try {
    if (mTranscoder !== undefined) {
      mTranscoder.on('progressUpdate', async (progress: number) => {
        console.info(TAG, testName + ' avTranscoder progressUpdate. progress: ' + progress);
        currentProgress = progress;
      });
      mTranscoder.on('complete', async () => {
        console.info(TAG, testName + ' avTranscoder complete.');
        mTranscoder!.off('complete');
        mTranscoder!.off('progressUpdate');
        await releaseAVTranscoder(done, testName);
        expect(true).assertTrue();
      });
      mTranscoder.on('error', async (error: BusinessError) => {
        console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
      });
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await sleep(SLEEP_TIME_5000);
    }
    done();
  } catch (error) {
    console.error(TAG,
      testName + ' Failed to complete-listen AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

async function errorListen(done: Function, testName: string, context: common.UIAbilityContext) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  try {
    if (mTranscoder !== undefined) {
      mTranscoder.on('error', async (error: BusinessError) => {
        console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
        expect(true).assertTrue();
      });
      // await createAVTranscoder(done, context, testName);
      mTranscoder.start();
      await sleep(SLEEP_TIME_500);
      mTranscoder.off('error');
    }
  } catch (error) {
    console.error(TAG,
      testName + ' Failed to error-listen AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

export default function AVTranscoderTest() {
  describe('AVTranscoderTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor = res;
      });
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
      await sleep(SLEEP_TIME_200);
      if (mTranscoder !== undefined) {
        await mTranscoder.release();
        await closeFd(mTranscoder.fdDst);
        mTranscoder = undefined;
      }
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
    });

    /**
     * @tc.name   createAVTranscoder_001
     * @tc.number AV_TRANSCODER_TEST_001
     * @tc.desc   Test normal scene of create AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVTranscoder_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVTranscoder_001';
      await createAVTranscoder(done, testContext, testName);
      done();
    })

    /**
     * @tc.name   prepare_001
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   start_001
     * @tc.number AV_TRANSCODER_TEST_003
     * @tc.desc   Test normal scene of start AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('start_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   start_abnormal_001
     * @tc.number AV_TRANSCODER_TEST_004
     * @tc.desc   Test normal scene of video transcoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('start_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_abnormal_001';
      await createAVTranscoder(done, testContext, testName);
      await startAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   pause_001
     * @tc.number AV_TRANSCODER_TEST_005
     * @tc.desc   Test normal scene of pause AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pause_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'pause_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await pauseAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   pause_abnormal_001
     * @tc.number AV_TRANSCODER_TEST_006
     * @tc.desc   Test normal scene of video transcoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pause_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'pause_abnormal_001';
      await createAVTranscoder(done, testContext, testName);
      await pauseAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   resume_001
     * @tc.number AV_TRANSCODER_TEST_007
     * @tc.desc   Test normal scene of resume AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resume_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'resume_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await pauseAVTranscoder(done, testName);
      await resumeAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   resume_abnormal_001
     * @tc.number AV_TRANSCODER_TEST_008
     * @tc.desc   Test normal scene of video transcoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resume_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'resume_abnormal_001';
      await createAVTranscoder(done, testContext, testName);
      await resumeAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   cancel_001
     * @tc.number AV_TRANSCODER_TEST_009  //TODO 报错5400102
     * @tc.desc   cancel after prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await sleep(SLEEP_TIME_20);
      await cancelAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   cancel_002
     * @tc.number AV_TRANSCODER_TEST_010
     * @tc.desc   cancel after start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_002';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await cancelAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   cancel_003
     * @tc.number AV_TRANSCODER_TEST_011
     * @tc.desc   cancel after pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_003';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await pauseAVTranscoder(done, testName);
      await cancelAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   cancel_004
     * @tc.number AV_TRANSCODER_TEST_012
     * @tc.desc   cancel after resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_004';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await pauseAVTranscoder(done, testName);
      await resumeAVTranscoder(done, testName);
      await cancelAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   release_001
     * @tc.number AV_TRANSCODER_TEST_013
     * @tc.desc   Test normal scene of release AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await releaseAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   progressUpdate_listen_001
     * @tc.number AV_TRANSCODER_TEST_014
     * @tc.desc   Test normal scene of listen progressUpdate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('progressUpdate_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'progressUpdate_listen_001';
      await createAVTranscoder(done, testContext, testName);
      await progressUpdateListen(done, testName);
      done();
    })

    /**
     * @tc.name   complete_listen_001
     * @tc.number AV_TRANSCODER_TEST_015
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('complete_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'complete_listen_001';
      await createAVTranscoder(done, testContext, testName);
      completeListen(done, testName);
    })
  })
}