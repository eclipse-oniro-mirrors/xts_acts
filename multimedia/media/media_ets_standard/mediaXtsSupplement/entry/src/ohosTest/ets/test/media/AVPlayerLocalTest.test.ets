/*
 * Copyright (C) 2025-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'

const TAG = 'xts.AVPlayerLocalSuppTest:';
let avPlayer: media.AVPlayer;

async function getFdRead(pathName: string): Promise<number> {
  let fdReturn: number = 0;
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const path = testContext.filesDir + "/" + pathName;
  console.log("pathName is " + path)
  await fileio.open(path).then((fdNumber) => {
    fdReturn = fdNumber;
    console.info('[fileio]case open fd success, fd is ' + fdReturn);
  })
  return fdReturn;
}

async function closeFdNumber(fdNumber: number) {
  await fileio.close(fdNumber);
}

async function getTrackDescriptionTestPrepared(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'prepared':
          avPlayer.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
            if ((arrList) != null) {
              console.info(TAG, testName, 'Succeeded in doing getTrackDescription', JSON.stringify(arrList));
              callback(arrList);
            } else {
              console.error(TAG, testName, `Failed to do getTrackDescription, error:`, JSON.stringify(error),
                error.code);
              expect().assertFail();
            }
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          });
          break;
        case 'initialized':
          avPlayer?.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function getTrackDescriptionTestPromisePrepared(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'prepared':
          avPlayer.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
            console.info(TAG, testName, 'Succeeded in getting TrackDescription', JSON.stringify(arrList));
            callback(arrList);
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to get TrackDescription, error:`, JSON.stringify(error),
              error.code);
            expect().assertFail();
          }).finally(() => {
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          })
          break;
        case 'initialized':
          avPlayer?.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function getSelectedTracksTestPromisePrepared(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<number>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'prepared':
          avPlayer.getSelectedTracks().then((arrList: Array<number>) => {
            console.info(TAG, testName, 'Succeeded in getting TrackDescription', JSON.stringify(arrList));
            callback(arrList);
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to get TrackDescription, error:`, JSON.stringify(error),
              error.code);
            expect().assertFail();
          }).finally(() => {
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          })
          break;
        case 'initialized':
          avPlayer?.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function getTrackDescriptionTestPlaying(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'playing':
          avPlayer.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
            if ((arrList) != null) {
              console.info(TAG, testName, 'Succeeded in doing getTrackDescription', JSON.stringify(arrList));
              callback(arrList);
            } else {
              console.error(TAG, testName, `Failed to do getTrackDescription, error:`, JSON.stringify(error),
                error.code);
              expect().assertFail();
            }
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          });
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function getTrackDescriptionTestPromisePlaying(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'playing':
          avPlayer.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
            console.info(TAG, testName, 'Succeeded in getting TrackDescription', JSON.stringify(arrList));
            callback(arrList);
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to get TrackDescription, error:`, JSON.stringify(error),
              error.code);
            expect().assertFail();
          }).finally(() => {
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          })
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer?.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function getSelectedTracksTestPromisePlaying(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<number>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'playing':
          avPlayer.getSelectedTracks().then((arrList: Array<number>) => {
            console.info(TAG, testName, 'Succeeded in getting TrackDescription', JSON.stringify(arrList));
            callback(arrList);
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to get TrackDescription, error:`, JSON.stringify(error),
              error.code);
            expect().assertFail();
          }).finally(() => {
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          })
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer?.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function getTrackDescriptionTestPaused(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'paused':
          avPlayer.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
            if ((arrList) != null) {
              console.info(TAG, testName, 'Succeeded in doing getTrackDescription', JSON.stringify(arrList));
              callback(arrList);
            } else {
              console.error(TAG, testName, `Failed to do getTrackDescription, error:`, JSON.stringify(error),
                error.code);
              expect().assertFail();
            }
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          });
          break;
        case 'playing':
          avPlayer.pause();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function getTrackDescriptionTestPromisePaused(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'paused':
          avPlayer.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
            console.info(TAG, testName, 'Succeeded in getting TrackDescription', JSON.stringify(arrList));
            callback(arrList);
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to get TrackDescription, error:`, JSON.stringify(error),
              error.code);
            expect().assertFail();
          }).finally(() => {
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          })
          break;
        case 'playing':
          avPlayer.pause();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer?.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function getSelectedTracksTestPromisePaused(done: Function, testName: string, FileName: string,
  callback: (arrList: Array<number>) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'paused':
          avPlayer.getSelectedTracks().then((arrList: Array<number>) => {
            console.info(TAG, testName, 'Succeeded in getting TrackDescription', JSON.stringify(arrList));
            callback(arrList);
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to get TrackDescription, error:`, JSON.stringify(error),
              error.code);
            expect().assertFail();
          }).finally(() => {
            avPlayer.release();
            closeFdNumber(rawFileContent);
            done();
          })
          break;
        case 'playing':
          avPlayer.pause();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer?.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

export default function AVPlayerLocalSuppTest() {
  describe('AVPlayerLocalSuppTest', () => {
    let avPlayer: media.AVPlayer;
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0100';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0200';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0300';
      let FileName: string = '1vp9_320x240_30.mp4';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0400';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0500';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0600';
      let FileName: string = '1vp9_320x240_30.mp4';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0700';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0800';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_0900';
      let FileName: string = '1vp9_320x240_30.mp4';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1000
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1000
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1000';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1100';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1200';
      let FileName: string = '1vp9_320x240_30.mp4';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1300';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1400';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1500';
      let FileName: string = '1vp9_320x240_30.mp4';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1600';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1700';
      let FileName: string = '1vp9_320x240_30.mp4';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_1800';
      let FileName: string = '1vp9_320x240_30.mp4';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0100';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0200';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0300';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0400';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0500';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0600';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0700';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0800';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MP3_0900';
      let FileName: string = 'MP3_48000_32_1.mp3';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0100';
      let FileName: string = '1h264_320x240_60.3gp';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0200';
      let FileName: string = '1h264_320x240_60.3gp';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0300';
      let FileName: string = '1h264_320x240_60.3gp';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0400';
      let FileName: string = '1h264_320x240_60.3gp';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0500';
      let FileName: string = '1h264_320x240_60.3gp';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0600';
      let FileName: string = '1h264_320x240_60.3gp';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0700';
      let FileName: string = '1h264_320x240_60.3gp';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0800';
      let FileName: string = '1h264_320x240_60.3gp';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3PG_0900';
      let FileName: string = '1h264_320x240_60.3gp';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0100';
      let FileName: string = '1h264_720x480_30.3g2';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0200';
      let FileName: string = '1h264_720x480_30.3g2';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0300';
      let FileName: string = '1h264_720x480_30.3g2';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0400';
      let FileName: string = '1h264_720x480_30.3g2';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0500';
      let FileName: string = '1h264_720x480_30.3g2';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0600';
      let FileName: string = '1h264_720x480_30.3g2';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0700';
      let FileName: string = '1h264_720x480_30.3g2';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0800';
      let FileName: string = '1h264_720x480_30.3g2';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_3G2_0900';
      let FileName: string = '1h264_720x480_30.3g2';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0100';
      let FileName: string = 'audio_2video.avi';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0200';
      let FileName: string = 'audio_2video.avi';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0300';
      let FileName: string = 'audio_2video.avi';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0400';
      let FileName: string = 'audio_2video.avi';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0500';
      let FileName: string = 'audio_2video.avi';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0600';
      let FileName: string = 'audio_2video.avi';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0700';
      let FileName: string = 'audio_2video.avi';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0800';
      let FileName: string = 'audio_2video.avi';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_AVI_0900';
      let FileName: string = 'audio_2video.avi';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0100';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0200';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0300';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0400';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0500';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0600';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0700';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0800';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_TS_0900';
      let FileName: string = 'mpeg4_mp3_480p_25r.ts';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0100';
      let FileName: string = 'h263_352x288_30.mov';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0200';
      let FileName: string = 'h263_352x288_30.mov';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0300';
      let FileName: string = 'h263_352x288_30.mov';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0400';
      let FileName: string = 'h263_352x288_30.mov';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0500';
      let FileName: string = 'h263_352x288_30.mov';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0600';
      let FileName: string = 'h263_352x288_30.mov';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0700';
      let FileName: string = 'h263_352x288_30.mov';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0800';
      let FileName: string = 'h263_352x288_30.mov';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MOV_0900';
      let FileName: string = 'h263_352x288_30.mov';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0100';
      let FileName: string = 'OGG_48000_1.ogg';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0200';
      let FileName: string = 'OGG_48000_1.ogg';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0300';
      let FileName: string = 'OGG_48000_1.ogg';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0400';
      let FileName: string = 'OGG_48000_1.ogg';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0500';
      let FileName: string = 'OGG_48000_1.ogg';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0600';
      let FileName: string = 'OGG_48000_1.ogg';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0700';
      let FileName: string = 'OGG_48000_1.ogg';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0800';
      let FileName: string = 'OGG_48000_1.ogg';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_OGG_0900';
      let FileName: string = 'OGG_48000_1.ogg';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0100';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0200';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0300';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0400';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0500';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0600';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0700';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0800';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_MKV_0900';
      let FileName: string = 'libvpx-vp9_1280x720_30.mkv';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0100';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0200';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0300';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0400';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0500';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0600';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0700';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0800';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0900';
      let FileName: string = 'flac_48ksr_16kbr_1ch.flac';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0100';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0200';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0300';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0400';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0500';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0600';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0700';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0800';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_WAV_0900';
      let FileName: string = 'pcm_48ksr_16kbr_1ch.wav';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0100
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0100';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0200
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0200';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0300
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0300';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0400
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0400';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0500
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0500';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0600
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0600';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0700
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0700';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0800
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0800';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0900
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_ARM_0900';
      let FileName: string = 'amrnb_4.75k_8000.amr';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0100
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0100
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0100';
      let FileName: string = 'h264_720x480_60.f4v';
      getTrackDescriptionTestPrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0200
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0200
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0200';
      let FileName: string = 'h264_720x480_60.f4v';
      getTrackDescriptionTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0300
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0300
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0300';
      let FileName: string = 'h264_720x480_60.f4v';
      getSelectedTracksTestPromisePrepared(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0400
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0400
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0400';
      let FileName: string = 'h264_720x480_60.f4v';
      getTrackDescriptionTestPlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0500
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0500
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0500';
      let FileName: string = 'h264_720x480_60.f4v';
      getTrackDescriptionTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0600
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0600
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0600';
      let FileName: string = 'h264_720x480_60.f4v';
      getSelectedTracksTestPromisePlaying(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0700
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0700
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0700';
      let FileName: string = 'h264_720x480_60.f4v';
      getTrackDescriptionTestPaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0800
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0800
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0800';
      let FileName: string = 'h264_720x480_60.f4v';
      getTrackDescriptionTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0900
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0900
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_GET_TRACK_DESCRIPTION_F4V_0900';
      let FileName: string = 'h264_720x480_60.f4v';
      getSelectedTracksTestPromisePaused(done, testName, FileName, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });
  })
}
