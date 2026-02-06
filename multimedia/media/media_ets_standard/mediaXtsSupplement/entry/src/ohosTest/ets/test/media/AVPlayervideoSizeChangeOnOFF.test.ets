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
import { sleep } from '../common';

const TAG = 'xts.AVPlayervideoSizeChangeSuppTest';
let avPlayer: media.AVPlayer;

async function getFdRead(pathName: string): Promise<number> {
  let fdReturn: number = 0;
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const path = testContext.filesDir + "/" + pathName;
  console.log(TAG,"pathName is " + path)
  await fileio.open(path).then((fdNumber) => {
    fdReturn = fdNumber;
    console.info(TAG,'[fileio]case open fd success, fd is ' + fdReturn);
  })
  return fdReturn;
}

async function closeFdNumber(fdNumber: number) {
  await fileio.close(fdNumber);
}

async function videoSizeChangeSupp(done: Function, testName: string, fileName: string,
  callback:(path:string) => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = testContext.filesDir + "/" + fileName;
    callback(path);
    let rawFileContent = await getFdRead(fileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer rawFileContent successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

export default function AVPlayervideoSizeChangeSuppTest() {
  describe('AVPlayervideoSizeChangeSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty', '');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      avPlayer?.release();
    });
    afterAll(async () => {
      console.info('afterAll case');
      AppStorage.delete('empty');
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_01
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_01
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_01', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_01';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange', (state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                 avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                    done();
                  }
                })
                break;
            }
          });
            avPlayer.on('videoSizeChange', (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.url = path;
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_02
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_02
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_02', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_02';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                break;
              case 'playing':
                console.info(TAG, testName, 'state playing called');
                break;
              case 'paused':
                console.info(TAG, testName, 'state paused called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
            }
          });
            avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_03
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_03
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_03', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_03';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
      * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_04
      * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_04
      * @tc.desc   AVPlayer_setDisplaySurface
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
      */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_04', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_04';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                break;
              case 'playing':
                console.info(TAG, testName, 'state playing called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
              case 'paused':
                console.info(TAG, testName, 'state paused called');
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_05
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_05
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_05', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_05';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                break;
              case 'playing':
                console.info(TAG, testName, 'state playing called');
                break;
              case 'paused':
                console.info(TAG, testName, 'state paused called');
                break;
              case 'completed':
                console.info(TAG, testName, 'state completed called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_06
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_06
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_06', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_06';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                break;
              case 'playing':
                console.info(TAG, testName, 'state playing called');
                break;
              case 'paused':
                console.info(TAG, testName, 'state paused called');
                break;
              case 'completed':
                console.info(TAG, testName, 'state completed called');
                break;
              case 'stopped':
                console.info(TAG, testName, 'state stopped called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_07
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_07
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_07', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_07';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange', (state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                    done();
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', () => {
            console.log(TAG, testName, `视频分辨率变化监听打开`);
          });
          avPlayer.url = path;
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_08
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_08
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_08', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_08';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange', (state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                    done();
                  }
                })
                break;
            }
          });
          AppStorage.setOrCreate('key', null);
          avPlayer.on('videoSizeChange', AppStorage.get('key') as media.OnVideoSizeChangeHandler);
          avPlayer.url = path;
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_09
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_09
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_09', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_09';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange', (state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                    done();
                  }
                })
                break;
            }
          });
          AppStorage.setOrCreate('key', undefined);
          avPlayer.on('videoSizeChange', AppStorage.get('key') as media.OnVideoSizeChangeHandler);
          avPlayer.url = path;
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_01
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_01
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_01', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_01';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange', (state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                    done();
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.off('videoSizeChange');
          console.log(TAG, testName, `视频分辨率变化: 关闭监听`);
          avPlayer.url = path;
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_02
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_02
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_02', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_02';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                break;
              case 'playing':
                console.info(TAG, testName, 'state playing called');
                break;
              case 'paused':
                console.info(TAG, testName, 'state paused called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.off('videoSizeChange');
          console.log(TAG, testName, `视频分辨率变化: 关闭监听`);
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_03
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_03
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_03', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_03';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.off('videoSizeChange');
          console.log(TAG, testName, `视频分辨率变化: 关闭监听`);
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_04
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_04
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_04', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_04';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                break;
              case 'playing':
                console.info(TAG, testName, 'state playing called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
              case 'paused':
                console.info(TAG, testName, 'state paused called');
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.off('videoSizeChange');
          console.log(TAG, testName, `视频分辨率变化: 关闭监听`);
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_05
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_05
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_05', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_05';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                break;
              case 'playing':
                console.info(TAG, testName, 'state playing called');
                break;
              case 'paused':
                console.info(TAG, testName, 'state paused called');
                break;
              case 'completed':
                console.info(TAG, testName, 'state completed called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.off('videoSizeChange');
          console.log(TAG, testName, `视频分辨率变化: 关闭监听`);
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_06
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_06
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_06', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_06';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange',(state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                break;
              case 'prepared':
                console.info(TAG, testName, 'state prepared called');
                break;
              case 'playing':
                console.info(TAG, testName, 'state playing called');
                break;
              case 'paused':
                console.info(TAG, testName, 'state paused called');
                break;
              case 'completed':
                console.info(TAG, testName, 'state completed called');
                break;
              case 'stopped':
                console.info(TAG, testName, 'state stopped called');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', async (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          avPlayer.off('videoSizeChange');
          console.log(TAG, testName, `视频分辨率变化: 关闭监听`);
          avPlayer.url = path;
          await sleep(1500);
          done();
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_07
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_07
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_07', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_07';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange', (state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                    done();
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          AppStorage.setOrCreate('key', null);
          avPlayer.off('videoSizeChange', AppStorage.get('key') as media.OnVideoSizeChangeHandler);
          console.log(TAG, testName, `视频分辨率变化: 关闭监听`);
          avPlayer.url = path;
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_08
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_08
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_08', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_08';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange', (state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                    done();
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          AppStorage.setOrCreate('key', undefined);
          avPlayer.off('videoSizeChange', AppStorage.get('key') as media.OnVideoSizeChangeHandler);
          console.log(TAG, testName, `视频分辨率变化: 关闭监听`);
          avPlayer.url = path;
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_09
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_09
     * @tc.desc   AVPlayer_setDisplaySurface
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_09', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_VIDEO_SIZE_CHANGE_OFF_09';
      let fileName: string = '1vp9_320x240_30.mp4';
      videoSizeChangeSupp(done, testName, fileName, async (path) => {
        try {
          avPlayer.on('stateChange', (state) => {
            console.info(TAG, testName, `State changed: `, state);
            switch (state) {
              case 'initialized':
                console.info(TAG, testName, 'State is initialized. Ready for next operation.');
                avPlayer.prepare((err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName, 'Failed to prepare,error message is :' + err.message);
                  } else {
                    console.info(TAG, testName, 'Succeeded in preparing');
                    done();
                  }
                })
                break;
            }
          });
          avPlayer.on('videoSizeChange', (width: number, height: number) => {
            console.log(TAG, testName, `视频分辨率变化: 宽度=${width}, 高度=${height}`);
          });
          // AppStorage.setOrCreate('key', undefined);
          avPlayer.off('videoSizeChange',() => {
            console.log(TAG, testName, `视频分辨率变化监听打开`);
          });
          avPlayer.url = path;
        }catch (error) {
          console.error(TAG, testName, "videoSizeChange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
  })
}