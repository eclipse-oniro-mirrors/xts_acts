/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import deviceInfo from '@ohos.deviceInfo';
import audio from '@ohos.multimedia.audio';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs'
import { SoundPool, PlayParameters, ErrorInfo, ErrorType } from 'multimedia.soundPool'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import { BusinessError, ErrorCallback, Callback } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Hypium } from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AbilityMonitor } from "application.AbilityMonitor";
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

let TAG = "[soundPoolTest]";
let filePath: string | null = null;
let soundPool: media.SoundPool | null = null;
let maxStreams = 3;
let soundId = -1;
let returnMsg: string = ``;
let uri1: string = "";
let uri2: string = "";
let uri3: string = "";
let uri4: string = "";
let uri5: string = "";
let fd1 = -1;
let fd2 = -1;
let fd3 = -1;
let fd4 = -1;
let fd5 = -1;
let length1 = -1;
let length2 = -1;
let length3 = -1;
let length4 = -1;
let length5 = -1;

let audioRendererInfo: audio.AudioRendererInfo = {
  usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
  rendererFlags: 1
}
let playParameters: PlayParameters = {
  loop: 0,
  leftVolume: 0.2,
  rightVolume: 0.8,
  priority: 0
}
function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`${TAG}: assertion failure`);
  }
};

function sleep(time: int) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

async function failureCallback(error: BusinessError) {
  returnMsg = `case failureCallback called, errMessage is ${error.message}`;
  console.info(`${TAG}: case failureCallback called, errMessage is ${error.message}`);
}

async function catchCallback(error: Error) {
  returnMsg = `case failureCallback called, errMessage is ${error.message}`;
  console.info(`${TAG}: case catchCallback called, errMessage is ${error.message}`);
}

async function getFileUrl(path: string, uri: string) {
  console.info(`${TAG}: getFileUrl called`);
  let stat = await fs.stat(filePath + path);
  console.info(`${TAG}: stat: ${JSON.stringify(stat)}`);
  console.info(`${TAG}: size: ${stat.size}`);
  await fs.open(filePath + path, fs.OpenMode.READ_ONLY).then((file: fs.File) => {
    console.info(`${TAG}: file fd: ${file.fd}`);
    hilog.info(0x00000, 'SoundPoolTaihe', 'getFileUrl function is : %{public}s', file.fd);
    switch (path) {
      case "/test_01.mp3":
        uri1 = 'fd://' + file.fd
        fd1 = Double.toInt(file.fd);
        length1 = Double.toInt(stat.size);
        hilog.info(0x00000, 'SoundPoolTaihe', 'sound pool load url: %{public}s', uri1);
        break;
      case "/test_02.mp3":
        uri2 = 'fd://' + file.fd
        fd2 = Double.toInt(file.fd);
        length2 = Double.toInt(stat.size);
        break;
      case "/test_03.mp3":
        uri3 = 'fd://' + file.fd
        fd3 = Double.toInt(file.fd);
        length3 = Double.toInt(stat.size);
        break;
      case "/test_04.mp3":
        uri4 = 'fd://' + file.fd
        fd4 = Double.toInt(file.fd);
        length4 = Double.toInt(stat.size);
        break;
      case "/test_05.wav":
        uri5 = 'fd://' + file.fd
        fd5 = Double.toInt(file.fd);
        length5 = Double.toInt(stat.size);
        break;
    }
  }).catch((err: Error) => {
    console.info(`${TAG}: open file failed with error message: ${err.message}, error code: `);
  });
  console.info(`${TAG}: getFileUrl done`);
}

async function createSoundPool() {
  console.info(`${TAG}: case createSoundPool in`);
  await media.createSoundPool(maxStreams, audioRendererInfo).then((soundPool_: media.SoundPool | undefined) => {
    console.info(`${TAG}: case createSoundPool called`);
    if (soundPool_) {
      soundPool = soundPool_;
      console.info(`${TAG}: soundPool: ${soundPool}`);
    } else {
      console.info(`${TAG}: case create soundPool failed!!!`);
      expectFalse();
    }
  }).catch(catchCallback);
  console.info(`${TAG}: case createSoundPool out`);
}

export default function soundPoolTest() {
  describe('soundPoolTest', () => {

    beforeAll(async () => {
      console.info(`${TAG}: beforeAll in`);
      filePath = Utils.abilityContext!!.filesDir

      await getFileUrl('/test_01.mp3', uri1);
      await getFileUrl('/test_02.mp3', uri2);
      await getFileUrl('/test_03.mp3', uri3);
      await getFileUrl('/test_04.mp3', uri4);
      await getFileUrl('/test_05.wav', uri5);
      console.info(`${TAG}: uri1 is: ${uri1}; uri2 is: ${uri2}; uri3 is: ${uri3}; uri4 is: ${uri4}; uri5 is: ${uri5}`);
      console.info(`${TAG}: fd1 is: ${fd1}; fd2 is: ${fd2}; fd3 is: ${fd3}; fd4 is: ${fd4}; fd5 is: ${fd5}`);
    });
    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
    })
    afterEach(async () => {
      await sleep(200);
      console.info(`${TAG}: afterEach in`);
      if (soundId != -1) {
        console.info(`${TAG}: unload enter`);
        if (soundPool != null) {
          await soundPool!!.unload(soundId);
        }
        soundId = -1;
      }
      if (soundPool != null) {
        console.info(`${TAG}: release enter`);
        await soundPool!!.release();
        soundPool = null;
      }
    })
    afterAll(() => {
      console.info(`${TAG}: afterAll in`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0100 in`);
      try {
        await media.createSoundPool(maxStreams, audioRendererInfo).then((soundPool_: media.SoundPool | undefined) => {
          if (soundPool_) {
            console.info(`${TAG}: createSoundPool Success, soundPool: ${soundPool_}`);
            soundPool = soundPool_;
          } else {
            console.error(`${TAG}: error! soundPool = undefined`);
            expectFalse();
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: ${JSON.stringify(error)}`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_static_0200
     * @tc.desc   Function test. Error code: 5400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0200 in`);
      try {
        await media.createSoundPool(-1, audioRendererInfo).then((soundPool_: media.SoundPool | undefined) => {
          if (!soundPool_) {
            console.info(`${TAG}: Test createSoundPool with invalid maxStream fail, create success!`);
          }
        });
      } catch (error) {
        let err: BusinessError = error as BusinessError
        if (err.code == 5400101) {
          console.info(`${TAG}: Test createSoundPool with invalid maxStream success, error: [${JSON.stringify(error)}]`);
        } else {
          console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0100 in`);
      try {
        media.createSoundPool(maxStreams, audioRendererInfo, (error: BusinessError | null, soundPool_: media.SoundPool | undefined) => {
          if (error != null) {
            console.info(`${TAG}: createSoundPoolCallback error: ${JSON.stringify(error)}`);
            expectFalse();
          } else {
            if (soundPool_) {
              console.info(`${TAG}: createSoundPool Success, soundPool: ${soundPool_}`);
              soundPool = soundPool_;
            } else {
              console.error(`${TAG}: error! soundPool_ = undefined`);
              expectFalse();
            }
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool?.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        hilog.info(0x00000, 'SoundPoolTaihe', 'sound pool load url: %{public}s', uri1);
        await soundPool!!.load(uri1).then((soundId_: int) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(uri) success, soundId: ${soundId_}`);
            soundId = Double.toInt(soundId_);
          } else {
            console.info(`${TAG}: load(uri) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: load(uri) fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0200
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0200 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.load('').then((soundId_: int) => {
          console.info(`${TAG}: Test load(uri) with invalid uri fail, load success! soundId: ${soundId_}`);
          expectFalse();
        }).catch((error: Error) => {
          let err = error as BusinessError
          console.error(`${TAG}: catch error, code: ${err.code}, message: ${err.message}`);
          if (err.code == 5400103) {
            console.info(`${TAG}: Test load(uri) with invalid uri success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test load(uri) with invalid uri fail, errCode != 5400103, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0300 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.load(fd1, 0, length1).then((soundId_: int) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(fd, offset, length) success, offset = 0, soundId: ${soundId_}`);
            soundId = Double.toInt(soundId_);
          } else {
            console.info(`${TAG}: load(fd, offset, length) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: load(fd, offset, length) fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0400 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.load(fd2, length2 / 3, length2).then((soundId_: int) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(fd, offset, length) success, offset = 1/3 length, soundId: ${soundId_}`);
            soundId = Double.toInt(soundId_);
          } else {
            console.info(`${TAG}: load(fd, offset, length) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: load(fd, offset, length) fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0500 in`);
      try {
        let streamId = -1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.load(fd1, 0, length1 / 2).then((soundId_: int) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(fd, offset, length) success, length < fileSize, soundId: ${soundId_}`);
            soundId = Double.toInt(soundId_);
          } else {
            console.info(`${TAG}: load(fd, offset, length) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: load(fd, offset, length) fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.play(soundId).then((streamId_: int) => {
          if (streamId_ > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId_}`);
            streamId = Double.toInt(streamId_);
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        if (streamId != -1) {
          await soundPool!!.stop(streamId);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0600 in`);
      try {
        let streamId = -1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.load(fd2, 0, length2 + 1).then((soundId_: int) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(fd, offset, length) success, length > fileSize, soundId: ${soundId_}`);
            soundId = Double.toInt(soundId_);
          } else {
            console.info(`${TAG}: load(fd, offset, length) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(TAG + `load(fd, offset, length) fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.play(soundId).then((streamId_: int) => {
          if (streamId_ > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId_}`);
            streamId = Double.toInt(streamId_);
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        if (streamId != -1) {
          await soundPool!!.stop(streamId);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0700
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0700 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.load(-1, 0, length1).then((soundId: int) => {
          console.info(`${TAG}: Test load(fd, offset, length) with invalid fd fail, load success! soundId: ${soundId}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400103) {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid fd success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid fd fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0800
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0800 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.load(fd1, -1, length1).then((soundId: int) => {
          console.info(`${TAG}: Test load(fd, offset, length) with invalid offset fail, load success! soundId: ${soundId}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400103) {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid offset success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid offset fail, errCode != 5400103, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0900
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0900 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.load(fd1, 0, -1).then((soundId: int) => {
          console.info(`${TAG}: Test load(fd, offset, length) with invalid length fail, load success! soundId: ${soundId}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400103) {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid length success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid length fail, errCode != 5400103, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load(uri1, (err: BusinessError | null, soundId_: int | undefined) => {
          if (err != null) {
            console.info(`${TAG}: loadCallback(uri) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_! > 0) {
              console.info(`${TAG}: loadCallback(uri) success, soundId: ${soundId_}`);
              soundId = Double.toInt(soundId_!);
            } else {
              console.info(`${TAG}: loadCallback(uri) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0200
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0200 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load('', (err: BusinessError | null, soundId_: int | undefined) => {
          if (err) {
            if (err.code == 5400103) {
              console.info(`${TAG}: Test loadCallback(uri) with invalid uri success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test loadCallback(uri) with invalid uri fail, errCode != 5400103, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test loadCallback(uri) with invalid uri fail, load success! soundId: ${soundId_}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0300 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load(fd1, 0, length1, (err: BusinessError | null, soundId_: int | undefined) => {
          if (err != null) {
            console.info(`${TAG}: loadCallback(fd, offset, length) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_! > 0) {
              console.info(`${TAG}: loadCallback(fd, offset, length) success, offset = 0, soundId: ${soundId_}`);
              soundId = Double.toInt(soundId_!);
            } else {
              console.info(`${TAG}: loadCallback(fd, offset, length) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0400 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load(fd2, length2 / 3, length2, (err: BusinessError | null, soundId_: int | undefined) => {
          if (err != null) {
            console.info(`${TAG}: loadCallback(fd, offset, length) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_! > 0) {
              console.info(`${TAG}: loadCallback(fd, offset, length) success, offset = 1/3 length, soundId: ${soundId_}`);
              soundId = Double.toInt(soundId_!);
            } else {
              console.info(`${TAG}: loadCallback(fd, offset, length) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0500 in`);
      try {
        let streamId = -1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load(fd1, 0, length1 / 2, (err: BusinessError | null, soundId_: int | undefined) => {
          if (err != null) {
            console.info(`${TAG}: loadCallback(fd, offset, length) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_! > 0) {
              console.info(`${TAG}: loadCallback(fd, offset, length) success, length < fileSize, soundId: ${soundId_}`);
              soundId = Double.toInt(soundId_!);
            } else {
              console.info(`${TAG}: loadCallback(fd, offset, length) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
        })
        await sleep(2000);
        await soundPool!!.play(soundId).then((streamId_: int) => {
          if (streamId_ > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId_}`);
            streamId = Double.toInt(streamId_);
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        if (streamId != -1) {
          await soundPool!!.stop(streamId);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0600 in`);
      try {
        let streamId = -1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load(fd2, 0, length2 + 1, (err: BusinessError | null, soundId_: int | undefined) => {
          if (err != null) {
            console.info(`${TAG}: loadCallback(fd, offset, length) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_! > 0) {
              console.info(`${TAG}: loadCallback(fd, offset, length) success, length > fileSize, soundId: ${soundId_}`);
              soundId = Double.toInt(soundId_!);
            } else {
              console.info(`${TAG}: oadCallback(fd, offset, length) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
        })
        await sleep(2000);
        await soundPool!!.play(soundId).then((streamId_: int) => {
          if (streamId_ > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId_}`);
            streamId = Double.toInt(streamId_);
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        if (streamId != -1) {
          await soundPool!!.stop(streamId);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0700
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0700 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load(-1, 0, length1, (err: BusinessError | null, soundId_: int | undefined) => {
          if (err) {
            if (err.code == 5400103) {
              console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid fd success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid fd fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid fd fail, load success! soundId: ${soundId_}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0800
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0800 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load(fd1, -1, length1, (err: BusinessError | null, soundId_: int | undefined) => {
          if (err) {
            if (err.code == 5400103) {
              console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid offset success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid offset fail, errCode != 5400103, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid offset fail, load success! soundId: ${soundId_}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0900
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0900 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.load(fd1, 0, -1, (err: BusinessError | null, soundId_: int | undefined) => {
          if (err) {
            if (err.code == 5400103) {
              console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid length success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid length fail, errCode != 5400103, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test loadCallback(fd, offset, length) with invalid length fail, load success! soundId: ${soundId_}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.unload(soundId).then(() => {
          console.info(`${TAG}: unload success, unload soundId: ${soundId}`);
          soundId = -1;
        }).catch((error: Error) => {
          console.info(`${TAG}: unload fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0200
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0200 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.unload(-1).then(() => {
          console.info(`${TAG}: Test unload with invalid soundId fail, unload Success! unload soundId: -1`);
          expectFalse();
        }).catch((error: Error) => {
          let err = error as BusinessError
          console.error(`${TAG}: catch error, code: ${err.code}, message: ${err.message}`);
          if ((error as BusinessError).code == 5400103) {
            console.info(`${TAG}: Test unload with invalid soundId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test unload with invalid soundId fail, errCode != 5400103, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0300
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0300 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.unload(soundId + 1).then(() => {
          console.info(`${TAG}: Test unload with unloaded soundId fail, unload Success! unload soundId: ${(soundId +
            1)}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test unload with unloaded soundId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test unload with unloaded soundId fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        soundPool!!.unload(soundId, (err) => {
          if (err != null) {
            console.info(`${TAG}: unloadCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: unloadCallback success, unload soundId: ${soundId}`);
            soundId = -1;
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0200
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0200 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        soundPool!!.unload(-1, (err) => {
          if (err) {
            console.info(`${TAG}: un with invalid offset success, error: [${err.code}, ${err.message}]`);
            if (err.code == 5400103) {
              console.info(`${TAG}: Test unloadCallback with invalid soundId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test unloadCallback with invalid soundId fail, errCode != 5400103, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test unloadCallback with invalid soundId fail, unload Success! unload soundId: -1`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0300
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0300 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        soundPool!!.unload(soundId + 1, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test unloadCallback with unloaded soundId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test unloadCallback with unloaded soundId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test unloadCallback with unloaded soundId fail, unload Success! unload soundId: ${(soundId +
              1)}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        await soundPool!!.play(soundId).then((streamId: int) => {
          if (streamId > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId}`);
            streamId_ = Double.toInt(streamId);
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0200
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0200 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.play(-1).then((streamId: int) => {
          console.info(`${TAG}: Test play with invalid soundId fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error: Error) => {
          console.info(`${TAG}: FUNCTION_PLAY error.code = ${(error as BusinessError).code}`);
          if ((error as BusinessError).code == 401) {
            console.info(`${TAG}: Test play with invalid soundId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test play with invalid soundId fail, errCode != 401, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0300
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0300 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.play(soundId + 1).then((streamId: int) => {
          console.info(`${TAG}: Test play with unloaded soundId fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test play with unloaded soundId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test play with unloaded soundId fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0400 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        await soundPool!!.play(soundId, playParameters).then((streamId: int) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) success, streamId: ${streamId}`);
            streamId_ = Double.toInt(streamId);
          } else {
            console.info(`${TAG}: play(soundID, params) fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play(soundID, params) fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0500
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0500 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.play(-1, playParameters).then((streamId: int) => {
          console.info(`${TAG}: Test play with invalid soundId fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 401) {
            console.info(`${TAG}: Test play(soundID, params) with invalid soundId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test play(soundID, params) with invalid soundId fail, errCode != 401, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0600
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0600 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.play(soundId + 1, playParameters).then((streamId: int) => {
          console.info(`${TAG}: Test play(soundID, params) with unloaded soundId fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test play(soundID, params) with unloaded soundId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test play(soundID, params) with unloaded soundId fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0700 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        await soundPool!!.play(soundId, {
          loop: 2
        }).then((streamId: int) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.loop success, streamId: ${streamId}`);
            streamId_ = Double.toInt(streamId);
          } else {
            console.info(`${TAG}: play(soundID, params) with params.loop fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play(soundID, params) with params.loop fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0900 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        await soundPool!!.play(soundId, {
          leftVolume: 0.5
        }).then((streamId: int) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.leftVolume success, streamId: ${streamId}`);
            streamId_ = Double.toInt(streamId);
          } else {
            console.info(`${TAG}: play(soundID, params) with params.leftVolume fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play(soundID, params) with params.leftVolume fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1000 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        await soundPool!!.play(soundId, {
          rightVolume: 0.5
        }).then((streamId: int) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.rightVolume success, streamId: ${streamId}`);
            streamId_ = Double.toInt(streamId);
          } else {
            console.info(`${TAG}: play(soundID, params) with params.rightVolume fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play(soundID, params) with params.rightVolume fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        await soundPool!!.play(soundId, {
          priority: 3
        }).then((streamId: int) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.priority success, streamId: ${streamId}`);
            streamId_ = Double.toInt(streamId);
          } else {
            console.info(`${TAG}: play(soundID, params) with params.priority fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play(soundID, params) with params.priority fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1200 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        await soundPool!!.play(soundId, {
          loop: 1
        }).then((streamId: int) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.parallelPlayFlag success, streamId: ${streamId}`);
            streamId_ = Double.toInt(streamId);
          } else {
            console.info(`${TAG}: play(soundID, params) with params.parallelPlayFlag fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: play(soundID, params) with params.parallelPlayFlag fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        soundPool!!.play(soundId, (err, streamId) => {
          if (err != null) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId! > 0) {
              console.info(`${TAG}: playCallback success, streamId: ${streamId}`);
              streamId_ = Double.toInt(streamId!);
            } else {
              console.info(`${TAG}: playCallback fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0200
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0200 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        soundPool!!.play(-1, (err, streamId) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: Test playCallback with invalid soundId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test playCallback with invalid soundId fail, errCode != 401, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test playCallback with invalid soundId fail, play success! streamId: ${streamId}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(TAG + `catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0300
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0300 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        soundPool!!.play(soundId + 1, (err, streamId) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test playCallback with unloaded soundId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test playCallback with unloaded soundId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test playCallback with unloaded soundId fail, play success! streamId: ${streamId}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0400 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        soundPool!!.play(soundId, playParameters, (err, streamId) => {
          if (err != null) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId! > 0) {
              console.info(`${TAG}: playCallback success, streamId: ${streamId}`);
              streamId_ = Double.toInt(streamId!);
            } else {
              console.info(`${TAG}: playCallback fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0500
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0500 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        soundPool!!.play(-1, playParameters, (err, streamId) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: Test playCallback with invalid soundId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test playCallback with invalid soundId fail, errCode != 401, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test playCallback with invalid soundId fail, play success! streamId: ${streamId}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0600
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0600 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        soundPool!!.play(soundId + 1, playParameters, (err, streamId) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test playCallback with unloaded soundId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test playCallback with unloaded soundId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test playCallback with unloaded soundId fail, play success! streamId: ${streamId}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0700 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        soundPool!!.play(soundId, {
          loop: 0
        }, (err, streamId) => {
          if (err != null) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId! > 0) {
              console.info(`${TAG}: playCallback with param.loop success, streamId: ${streamId}`);
              streamId_ = Double.toInt(streamId!);
            } else {
              console.info(`${TAG}: playCallback with param.loop fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0900 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        soundPool!!.play(soundId, {
          leftVolume: 0.6
        }, (err, streamId) => {
          if (err != null) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId! > 0) {
              console.info(`${TAG}: playCallback with param.leftVolume success, streamId: ${streamId}`);
              streamId_ = Double.toInt(streamId!);
            } else {
              console.info(`${TAG}: playCallback with param.leftVolume fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1000 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        soundPool!!.play(soundId, {
          rightVolume: 0.6
        }, (err, streamId) => {
          if (err != null) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId! > 0) {
              console.info(`${TAG}: playCallback with param.rightVolume success, streamId: ${streamId}`);
              streamId_ = Double.toInt(streamId!);
            } else {
              console.info(`${TAG}: playCallback with param.rightVolume fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        soundPool!!.play(soundId, {
          priority: 2
        }, (err, streamId) => {
          if (err != null) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId! > 0) {
              console.info(`${TAG}: playCallback with param.priority success, streamId: ${streamId}`);
              streamId_ = Double.toInt(streamId!);
            } else {
              console.info(`${TAG}: playCallback with param.priority fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1200 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        let streamId_ = -1;
        soundPool!!.play(soundId, {
          loop: 1
        }, (err, streamId) => {
          if (err != null) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId! > 0) {
              console.info(`${TAG}: playCallback with param.parallelPlayFlag success, streamId: ${streamId}`);
              streamId_ = Double.toInt(streamId!);
            } else {
              console.info(`${TAG}: playCallback with param.parallelPlayFlag fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool!!.stop(streamId_);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0100 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(5000);
        await soundPool!!.stop(streamId).then(() => {
          console.info(`${TAG}: stop success, stop streamId: ${streamId}`);
        }).catch((error: Error) => {
          console.info(`${TAG}: stop fail! error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0200
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        await soundPool!!.stop(-1).then(() => {
          console.info(`${TAG}: Test stop with invalid streamId fail, stop success! stop streamId: -1`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 401) {
            console.info(`${TAG}: Test stop with invalid streamId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test stop with invalid streamId fail, errCode != 401, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0300
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0300 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        await soundPool!!.stop(streamId + 1).then(() => {
          console.info(`${TAG}: Test stop with unplayed streamId fail, stop success! stop streamId: ${(streamId + 1)}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test stop with unplayed streamId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test stop with unplayed streamId fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0100 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(5000);
        soundPool!!.stop(streamId, (err) => {
          if (err != null) {
            console.info(`${TAG}: stopCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: stopCallback success, stop streamId: ${streamId}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0200
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        soundPool!!.stop(-1, (err) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: Test stopCallback with invalid streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test stopCallback with invalid streamId fail, errCode != 401, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test stopCallback with invalid streamId fail, stop success! stop streamId: -1`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0300
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0300 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        soundPool!!.stop(streamId + 1, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test stopCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test stopCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test stopCallback with unplayed streamId fail, stop success! stop streamId: ${(streamId +
              1)}`);
            expectFalse();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0100 in`);
      try {
        let streamId = 0;
        let loopForever = -1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        await soundPool!!.setLoop(streamId, loopForever).then(() => {
          console.info(`${TAG}: setLoop success, loop: ${loopForever}`);
        }).catch((error: Error) => {
          console.info(`${TAG}: setLoop fail! error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0200
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0200 in`);
      try {
        let streamId = 0;
        let loop = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        await soundPool!!.setLoop(-1, loop).then(() => {
          console.info(`${TAG}: Test setLoop with invalid streamId fail, setLoop success! setLoop streamId: -1`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 401) {
            console.info(`${TAG}: Test setLoop with invalid streamId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test setLoop with invalid streamId fail, errCode != 401, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0300
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0300 in`);
      try {
        let streamId = 0;
        let loop = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        await soundPool!!.setLoop(streamId + 1, loop).then(() => {
          console.info(`${TAG}: Test setLoop with unplayed streamId fail, setLoop success! setLoop streamId: ${(streamId +
            1)}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test setLoop with unplayed streamId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test setLoop with unplayed streamId fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0100 in`);
      try {
        let streamId = 0;
        let loopForever = -1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        soundPool!!.setLoop(streamId, loopForever, (err) => {
          if (err != null) {
            console.info(`${TAG}: setLoopCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: setLoopCallback success, loop: ${loopForever}`);
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0200
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0200 in`);
      try {
        let streamId = 0;
        let loop = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        soundPool!!.setLoop(-1, loop, (err) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: Test setLoopCallback with invalid streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setLoopCallback with invalid streamId fail, errCode != 401, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setLoopCallback with invalid streamId fail, setLoop success! setLoop streamId: -1`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0300
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0300 in`);
      try {
        let streamId = 0;
        let loop = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        soundPool!!.setLoop(streamId + 1, loop, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test setLoopCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setLoopCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setLoopCallback with unplayed streamId fail, setLoop success! setLoop streamId: ${(streamId +
              1)}`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0100 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        await soundPool!!.setPriority(streamId, lowest).then(() => {
          console.info(`${TAG}: setPriority success, priority: ${lowest}`);
        }).catch((error: Error) => {
          console.info(`${TAG}: setPriority fail! error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0200
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        await soundPool!!.setPriority(streamId, -1).then(() => {
          console.info(`${TAG}: Test setPriority with invalid priority fail, setPriority success! priority: -1`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 401) {
            console.info(`${TAG}: Test setPriority with invalid priority success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test setPriority with invalid priority fail, errCode != 401, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0300
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0300 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        await soundPool!!.setPriority(-1, lowest).then(() => {
          console.info(`${TAG}: Test setPriority with invalid streamId fail, setPriority success! streamId: -1`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 401) {
            console.info(`${TAG}: Test setPriority with invalid streamId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test setPriority with invalid streamId fail, errCode != 401, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0400
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0400 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        await soundPool!!.setPriority(streamId + 1, lowest).then(() => {
          console.info(`${TAG}: Test setPriority with unplayed streamId fail, setPriority success! streamId: ${(streamId +
            1)}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test setPriority with unplayed streamId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test setPriority with unplayed streamId fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0100 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        soundPool!!.setPriority(streamId, lowest, (err) => {
          if (err != null) {
            console.info(`${TAG}: setPriorityCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: setPriorityCallback success, priority: ${lowest}`);
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0200
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        soundPool!!.setPriority(streamId, -1, (err) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: Test setPriorityCallback with invalid priority success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setPriorityCallback with invalid priority fail, errCode != 401, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setPriorityCallback with invalid priority fail, setPriority success! setPriority priority: -1`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0300
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0300 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        soundPool!!.setPriority(-1, lowest, (err) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: Test setPriorityCallback with invalid streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setPriorityCallback with invalid streamId fail, errCode != 401, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setPriorityCallback with invalid streamId fail, setPriority success! streamId: -1`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0400
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0400 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(200);
        soundPool!!.setPriority(streamId + 1, lowest, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test setPriorityCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setPriorityCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setPriorityCallback with unplayed streamId fail, setPriority success! streamId: -1`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0100 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        await soundPool!!.setVolume(streamId, left, right).then(() => {
          console.info(`${TAG}: setVolume success, left: ${left}; right: ${right}`);
        }).catch((error: Error) => {
          console.info(`${TAG}: setVolume fail! error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0200 in`);
      try {
        let streamId = 0;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        await soundPool!!.setVolume(streamId, -0.1, right).then(() => {
          console.info(`${TAG}: Test setVolume with invalid left volume success, left volume: -0.1 will be changed to 1.0`);
        }).catch((error: Error) => {
          console.info(`${TAG}: Test setVolume with invalid left volume fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0300 in`);
      try {
        let streamId = 0;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        await soundPool!!.setVolume(streamId, 1.5, right).then(() => {
          console.info(`${TAG}: Test setVolume with invalid left volume success, left volume: 1.5 will be changed to 1.0`);
        }).catch((error: Error) => {
          console.info(`${TAG}: Test setVolume with invalid left volume fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0400 in`);
      try {
        let streamId = 0;
        let left = 0.5;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        await soundPool!!.setVolume(streamId, left, -0.1).then(() => {
          console.info(`${TAG}: Test setVolume with invalid right volume success, right volume: -0.1 will be changed to 1.0`);
        }).catch((error: Error) => {
          console.info(`${TAG}: Test setVolume with invalid right volume fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0500 in`);
      try {
        let streamId = 0;
        let left = 0.5;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        await soundPool!!.setVolume(streamId, left, 1.5).then(() => {
          console.info(`${TAG}: Test setVolume with invalid right volume success, right volume: 1.5 will be changed to 1.0`);
        }).catch((error: Error) => {
          console.info(`${TAG}: Test setVolume with invalid right volume fail, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0600
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0600 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        await soundPool!!.setVolume(-1, left, right).then(() => {
          console.info(`${TAG}: Test setVolume with invalid streamId fail, setVolume success! streamId: -1`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 401) {
            console.info(`${TAG}: Test setVolume with invalid streamId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test setVolume with invalid streamId fail, errCode != 401, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0700
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0700 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        await soundPool!!.setVolume(streamId + 1, left, right).then(() => {
          console.info(`${TAG}: Test setVolume with unplayed streamId fail, setVolume success! streamId: ${(streamId +
            1)}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test setVolume with unplayed streamId success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test setVolume with unplayed streamId fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0100 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(1000);
        soundPool!!.setVolume(streamId, left, right, (err) => {
          if (err != null) {
            console.info(`setVolume error:` , err!!.code);
            console.info(`${TAG}: setVolumeCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: setVolumeCallback success, left: ${left}; right: ${right}`);
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0200 in`);
      try {
        let streamId = 0;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        soundPool!!.setVolume(streamId, -0.1, right, (err) => {
          if (err != null) {
            console.info(`${TAG}: Test setVolumeCallback with invalid left volume fail, error: [${err!!.code}, ${err!!.message}]`);
            expectFalse();
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid left volume success, left volume: -0.1 will be changed to 1.0`);
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0300 in`);
      try {
        let streamId = 0;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        soundPool!!.setVolume(streamId, 1.5, right, (err) => {
          if (err!!.code !=0) {
            console.info(`${TAG}: Test setVolumeCallback with invalid left volume fail, error: [${err!!.code}, ${err!!.message}]`);
            expectFalse();
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid left volume success, left volume: 1.5 will be changed to 1.0`);
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0400 in`);
      try {
        let streamId = 0;
        let left = 0.5;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        soundPool!!.setVolume(streamId, left, -0.1, (err) => {
          if (err!!.code !=0) {
            console.info(`${TAG}: Test setVolumeCallback with invalid right volume fail, error: [${err!!.code}, ${err!!.message}]`);
            expectFalse();
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid right volume success, right volume: -0.1 will be changed to 1.0`);
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0500 in`);
      try {
        let streamId = 0;
        let left = 0.5;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = await soundPool!!.play(soundId, playParameters) as int;
        await sleep(1000);
        soundPool!!.setVolume(streamId, left, 1.5, (err) => {
          if (err!!.code !=0) {
            console.info(`${TAG}: Test setVolumeCallback with invalid right volume fail, error: [${err!!.code}, ${err!!.message}]`);
            expectFalse();
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid right volume success, right volume: 1.5 will be changed to 1.0`);
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0600
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0600 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        soundPool!!.setVolume(-1, left, right, (err) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: Test setVolumeCallback with invalid streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setVolumeCallback with invalid streamId fail, errCode != 401, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid streamId fail, setVolume success! streamId: -1`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0700
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0700 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        soundPool!!.setVolume(streamId + 1, left, right, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test setVolumeCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setVolumeCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setVolumeCallback with unplayed streamId fail, setVolume success! streamId: ${(streamId +
              1)}`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool!!.stop(streamId);
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.onLoadComplete((soundId_: int) => {
          console.info(`${TAG}: on loadComplete called, soundId: ${soundId_}`);
          done();
        })
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.onPlayFinished(() => {
          console.info(`${TAG}: on playFinished called!`);
          done();
        } as Callback<void>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        await soundPool!!.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0300 in`);
      let flag = false;
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.onLoadComplete((soundId_: int) => {
          console.info(`${TAG}: on loadComplete called, soundId: ${soundId_}`);
          flag = true;
        })
        soundPool!!.onLoadComplete((soundId_: int) => {
          console.info(`${TAG}: on loadComplete called, soundId: ${soundId_}`);
          flag = true;
        })
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(500);
        soundPool!!.offLoadComplete();
        flag = false;
        soundId = (await soundPool!!.load(fd2, 0, length2)) as int;
        await sleep(500);
        if (flag) {
          console.error(`${TAG}: loadComplete off fail, on loadComplete called!`);
          expectFalse();
        } else {
          console.info(`${TAG}: loadComplete off`);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0400 in`);
      let flag = false;
      let streamId = 0;
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundPool!!.onPlayFinished(() => {
          console.info(`${TAG}: on playFinished called`);
          flag = true;
        } as Callback<void>)
        soundPool!!.onPlayFinished(() => {
          console.info(`${TAG}: on playFinished called`);
          flag = true;
        } as Callback<void>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(500);
        await soundPool!!.stop(streamId);
        soundPool!!.offPlayFinished();
        flag = false;
        streamId = (await soundPool!!.play(soundId)) as int;
        await sleep(500);
        await soundPool!!.stop(streamId);
        if (flag) {
          console.error(`${TAG}: playFinished off fail, on playFinished called!`);
          expectFalse();
        } else {
          console.info(`${TAG}: playFinished off`);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_WITHOUT_LOAD_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_WITHOUT_LOAD_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_WITHOUT_LOAD_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_WITHOUT_LOAD_0100 in`);
      try {
        let soundId_ = 1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        await soundPool!!.play(soundId_).then((streamId: int) => {
          console.info(`${TAG}: Test play without load fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test play without load success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test play without load fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_AFTER_UNLOAD_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_AFTER_UNLOAD_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_AFTER_UNLOAD_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_AFTER_UNLOAD_0100 in`);
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.unload(soundId);
        await sleep(1000);
        soundPool!!.play(soundId, (error, streamId) => {
          if (error) {
            if ((error as BusinessError).code == 5400102) {
              console.info(`${TAG}: Test playCallback after unload success, error: [${JSON.stringify(error)}]`);
            } else {
              console.info(`${TAG}: Test playCallback after unload fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test playCallback after unload fail, play success! streamId: ${streamId}`);
            expectFalse();
          }
          soundId = -1;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_WITHOUT_PLAY_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_WITHOUT_PLAY_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_WITHOUT_PLAY_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_WITHOUT_PLAY_0100 in`);
      try {
        let streamId_ = 1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        await soundPool!!.stop(streamId_).then(() => {
          console.info(`${TAG}: Test stop without play fail, stop success!`);
          expectFalse();
        }).catch((error: Error) => {
          if ((error as BusinessError).code == 5400102) {
            console.info(`${TAG}: Test stop without play success, error: [${JSON.stringify(error)}]`);
          } else {
            console.info(`${TAG}: Test stop without play fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_STOP_PLAY_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_STOP_PLAY_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_STOP_PLAY_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_STOP_PLAY_0100 in`);
      try {
        let streamId_ = -1;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
        } as ErrorCallback<BusinessError>)
        soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
        await sleep(2000);
        streamId_ = (await soundPool!!.play(soundId)) as int;
        await sleep(2000);
        await soundPool!!.stop(streamId_);
        await sleep(2000);
        soundPool!!.play(soundId, (error:BusinessError | null, streamId: int | undefined) => {
          if (error != null) {
            console.info(`${TAG}: Test play-stop-play fail, error: [${JSON.stringify(error)}]`);
            expectFalse();
          } else {
            if (streamId !== undefined && streamId > 0) {
              console.info(`${TAG}: Test play-stop-play success! streamId: ${streamId}`);
            } else {
              console.info(`${TAG}: Test play-stop-play fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_0100 in`);
      try {
        let streamId_: Array<int> = [];
        let soundId_: Array<int> = [];
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)

        soundId_.push(await soundPool!!.load(fd1, 0, length1));
        soundId_.push(await soundPool!!.load(fd2, length2 / 3, length2));
        soundId_.push(await soundPool!!.load(uri3));

        await sleep(1000);

        streamId_.push(await soundPool!!.play(soundId_[0]));
        streamId_.push(await soundPool!!.play(soundId_[1]));
        streamId_.push(await soundPool!!.play(soundId_[2], playParameters));

        for (let i = 0; i < 3; i++) {
          await sleep(3000);
          await soundPool!!.stop(streamId_[i]);
          await soundPool!!.unload(soundId_[i]);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_EXCEEDED_MAXSTREAMS_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_EXCEEDED_MAXSTREAMS_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_EXCEEDED_MAXSTREAMS_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_EXCEEDED_MAXSTREAMS_0100 in`);
      try {
        let streamId_: Array<int> = [];
        let soundId_: Array<int> = [];
        let time = 0;
        let loadCount = 0;
        let sleepTotalTime = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundPool!!.onLoadComplete((soundId_: int) => {
          console.info(`${TAG}: on loadComplete called, soundId: ${soundId_}`);
          loadCount++;
        })
        soundPool!!.onPlayFinished(() => {
          console.info(`${TAG}: on playFinished called!`);
          time++;
        } as Callback<void>)

        soundId_.push(await soundPool!!.load(fd1, 0, length1));
        soundId_.push(await soundPool!!.load(fd2, length2 / 3, length2));
        soundId_.push(await soundPool!!.load(uri3));
        soundId_.push(await soundPool!!.load(fd4, length4 / 3, length4));
        while (loadCount != 4) {
          sleepTotalTime++;
          if (sleepTotalTime > 15) {
            expectFalse();
            break;
          }
          await sleep(1000);
        }
        for (let i = 0; i < 4; i++) {
          streamId_.push(await soundPool!!.play(soundId_[i]));
        }
        await sleep(8000);
        for (let i = 0; i < 4; i++) {
          await soundPool!!.stop(streamId_[i]);
        }
        for (let i = 0; i < 4; i++) {
          await soundPool!!.unload(soundId_[i]);
        }
        if (time == 4) {
          console.info(`${TAG}: four stream play success`);
        } else {
          console.info(`${TAG}: four stream play fail! time: ${time}`);
          expectFalse();
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_FINISH_WITH_STREAMID_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_FINISH_WITH_STREAMID_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_FINISH_WITH_STREAMID_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_FINISH_WITH_STREAMID_0100 in`);
      try {
        let streamId_: Array<int> = [];
        let soundId_: Array<int> = [];
        let playStreamId_: Array<int> = [];

        let time = 0;
        let matchNum = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundPool!!.onPlayFinishedWithStreamId((streamId: int) => {
          console.info(`${TAG}: on playFinished called! streamId is: ${streamId}`);
          playStreamId_.push(streamId);
        });
        soundId_.push(await soundPool!!.load(fd4, 0, length4));
        soundId_.push(await soundPool!!.load(fd2, 0, length2));
        await sleep(2000);

        streamId_.push(await soundPool!!.play(soundId_[0]));
        streamId_.push(await soundPool!!.play(soundId_[1]));
        await sleep(8000);

        for (let i = 0; i < streamId_.length; i++) {
          await soundPool!!.stop(streamId_[i]);
          await soundPool!!.unload(soundId_[i]);
        }

        if (playStreamId_.length == 2) {
          console.info(`${TAG}: two stream play success`);
        } else {
          console.info(`${TAG}: two stream play fail! time: ${time}`);
          expectFalse();
        }

        for (let i = 0; i < playStreamId_.length; i++) {
          for (let j = 0; j < streamId_.length; j++) {
            console.info(`i value = , j value =`, i,j);
            if (playStreamId_[i] == streamId_[j]) {
              matchNum++;
            }
          }
        }
        if (matchNum == 2) {
          console.info(`${TAG}: two stream match`);
        } else {
          console.info(`${TAG}: two stream match fail! matchNum: ${matchNum}`);
          expectFalse();
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_FINISH_WITH_TWO_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_FINISH_WITH_TWO_CALLBACK_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_FINISH_WITH_TWO_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_FINISH_WITH_TWO_CALLBACK_0100 in`);
      try {
        let streamId_: Array<int> = [];
        let soundId_: Array<int> = [];
        let playStreamId_: Array<int> = [];
        let time = 0;
        let timeStreamId = 0;
        let matchNum = 0;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onError((error: BusinessError) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundPool!!.onPlayFinished(() => {
          console.info(`${TAG}: on playFinished called!`);
          time++;
        } as Callback<void>)
        soundPool!!.onPlayFinishedWithStreamId((streamId: int) => {
          console.info(`${TAG}: on playFinished called! streamId is: ${streamId}`);
          playStreamId_.push(streamId);
        })

        soundId_.push(await soundPool!!.load(fd1, 0, length1));
        soundId_.push(await soundPool!!.load(fd2, 0, length2));

        await sleep(1000);

        streamId_.push(await soundPool!!.play(soundId_[0]));
        streamId_.push(await soundPool!!.play(soundId_[1]));

        await sleep(8000);
        for (let i = 0; i < 2; i++) {
          await soundPool!!.stop(streamId_[i]);
          await soundPool!!.unload(soundId_[i]);
        }

        if (time == 0) {
          console.info(`${TAG}: two stream play success`);
        } else {
          console.info(`${TAG}: two stream play fail! time: ${time}`);
          expectFalse();
        }

        if (playStreamId_.length == 2) {
          console.info(`${TAG}: two stream play success`);
        } else {
          console.info(`${TAG}: two stream play fail! timeStreamId: ${timeStreamId}`);
          expectFalse();
        }

        for (let i = 0; i < 2; i++) {
          for (let j = 0; j < 2; j++) {
            if (playStreamId_[i] == streamId_[j]) {
              matchNum++;
            }
          }
        }
        if (matchNum == 2) {
          console.info(`${TAG}: two stream match`);
        } else {
          console.info(`${TAG}: two stream match fail! matchNum: ${matchNum}`);
          expectFalse();
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_MULTI_INSTANCE_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_MULTI_INSTANCE_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_MULTI_INSTANCE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_MULTI_INSTANCE_0100 in`);
      try {
        let streamId_: Array<int> = [];
        let soundId_: Array<int> = [];
        let loadCount1 = 0;
        let loadCount2 = 0;
        let playTime1 = 0;
        let playTime2 = 0;
        let sleepTotalTime = 0;

        let soundPool1 = await media.createSoundPool(maxStreams, audioRendererInfo);
        let soundPool2 = await media.createSoundPool(maxStreams, audioRendererInfo);

        if (soundPool1 == null || soundPool2 == null) {
          console.error(`${TAG}:createSoundPool soundPool1 or soundPool2 is null`);
          expectFalse();
          done();
        }
        soundPool1!!.onError((error: BusinessError) => {
          console.error(`${TAG}: soundPool1 onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundPool1!!.onLoadComplete((soundId: int) => {
          console.info(`${TAG}: soundPool1 on loadComplete called, soundId: ${soundId}`);
          loadCount1++;
        })
        soundPool1!!.onPlayFinished(() => {
          console.info(`${TAG}: soundPool1 on playFinished called!`);
          playTime1++;
        } as Callback<void>)
        soundPool2!!.onError((error: BusinessError) => {
          console.error(`${TAG}: soundPool2 onError called! error happened, message is: ${error.message}`);
          expectFalse();
        } as ErrorCallback<BusinessError>)
        soundPool2!!.onLoadComplete((soundId: int) => {
          console.info(`${TAG}: soundPool2 on loadComplete called, soundId: ${soundId}`);
          loadCount2++;
        })
        soundPool2!!.onPlayFinished(() => {
          console.info(`${TAG}: soundPool2 on playFinished called!`);
          playTime2++;
        } as Callback<void>)

        soundId_.push(await soundPool1!!.load(fd1, 0, length1));
        soundId_.push(await soundPool1!!.load(fd2, length2 / 3, length2));
        soundId_.push(await soundPool2!!.load(uri3));
        soundId_.push(await soundPool2!!.load(fd4, length4 / 3, length4));

        while (loadCount1 != 2 && loadCount2 != 2) {
          sleepTotalTime++;
          if (sleepTotalTime > 15) {
            expectFalse();
            break;
          }
          await sleep(1000);
        }

        streamId_.push(await soundPool1!!.play(soundId_[0]));
        streamId_.push(await soundPool1!!.play(soundId_[1]));
        streamId_.push(await soundPool2!!.play(soundId_[2]));
        streamId_.push(await soundPool2!!.play(soundId_[3]));

        await sleep(8000);

        await soundPool1!!.stop(streamId_[0]);
        await soundPool1!!.stop(streamId_[1]);
        await soundPool2!!.stop(streamId_[2]);
        await soundPool2!!.stop(streamId_[3]);

        await soundPool1!!.unload(soundId_[0]);
        await soundPool1!!.unload(soundId_[1]);
        await soundPool2!!.unload(soundId_[2]);
        await soundPool2!!.unload(soundId_[3]);

        if (playTime1 == 2 && playTime2 == 2) {
          console.info(`${TAG}: four stream play success`);
        } else {
          console.info(`${TAG}: four stream play fail! playTime1: ${playTime1}, playTime2: ${playTime2}`);
          expectFalse();
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0100 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          if (!soundPool) {
            console.error(`${TAG}:createSoundPool soundPool is null`);
            expectFalse();
            done();
          }
          soundPool!!.onError((error: BusinessError) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          } as ErrorCallback<BusinessError>)
          soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
          await sleep(2000);
          streamId = (await soundPool!!.play(soundId)) as int;
          await sleep(200);
          await soundPool!!.setRate(streamId, audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
            console.info(`${TAG}: setRate success, rate: ${audio.AudioRendererRate.RENDER_RATE_DOUBLE}`);
          }).catch((error: Error) => {
            console.info(`${TAG}: setRate fail! error: [${JSON.stringify(error)}]`);
            expectFalse();
          })
          await sleep(2000);
          await soundPool!!.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0500
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0500 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          if (!soundPool) {
            console.error(`${TAG}:createSoundPool soundPool is null`);
            expectFalse();
            done();
          }
          soundPool!!.onError((error: BusinessError) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          } as ErrorCallback<BusinessError>)
          soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
          await sleep(2000);
          streamId = (await soundPool!!.play(soundId)) as int;
          await sleep(200);
          await soundPool!!.setRate(-1, audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
            console.info(`${TAG}: Test setRate with invalid streamId fail, setRate success! streamId: -1`);
            expectFalse();
          }).catch((error: Error) => {
            if ((error as BusinessError).code == 401) {
              console.info(`${TAG}: Test setRate with invalid streamId success, error: [${JSON.stringify(error)}]`);
            } else {
              console.info(`${TAG}: Test setRate with invalid streamId fail, errCode != 401, error: [${JSON.stringify(error)}]`);
              expectFalse();
            }
          })
          await sleep(2000);
          await soundPool!!.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0600
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0600 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          if (!soundPool) {
            console.error(`${TAG}:createSoundPool soundPool is null`);
            expectFalse();
            done();
          }
          soundPool!!.onError((error: BusinessError) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          } as ErrorCallback<BusinessError>)
          soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
          await sleep(2000);
          streamId = (await soundPool!!.play(soundId)) as int;
          await sleep(200);
          await soundPool!!.setRate(streamId + 1, audio.AudioRendererRate.RENDER_RATE_HALF).then(() => {
            console.info(`${TAG}: Test setRate with unplayed streamId fail, setRate success! streamId: ${(streamId +
              1)}`);
            expectFalse();
          }).catch((error: Error) => {
            if ((error as BusinessError).code == 5400102) {
              console.info(`${TAG}: Test setRate with unplayed streamId success, error: [${JSON.stringify(error)}]`);
            } else {
              console.info(`${TAG}: Test setRate with unplayed streamId fail, errCode != 5400102, error: [${JSON.stringify(error)}]`);
              expectFalse();
            }
          })
          await sleep(2000);
          await soundPool!!.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0100 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          if (!soundPool) {
            console.error(`${TAG}:createSoundPool soundPool is null`);
            expectFalse();
            done();
          }
          soundPool!!.onError((error: BusinessError) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
          } as ErrorCallback<BusinessError>)
          soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
          await sleep(2000);
          streamId = (await soundPool!!.play(soundId)) as int;
          await sleep(200);
          soundPool!!.setRate(streamId, audio.AudioRendererRate.RENDER_RATE_HALF, (err) => {
            if (err) {
              console.info(`${TAG}: setRateCallback error: ${JSON.stringify(err)}`);
              expectFalse();
            } else {
              console.info(`${TAG}: setRateCallback success, rate: ${audio.AudioRendererRate.RENDER_RATE_HALF}`);
            }
          })
          await sleep(2000);
          await soundPool!!.stop(streamId);
          done();
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
          done();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0500
     * @tc.desc   Function test. Error code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0500 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          if (!soundPool) {
            console.error(`${TAG}:createSoundPool soundPool is null`);
            expectFalse();
            done();
          }
          soundPool!!.onError((error: BusinessError) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
          } as ErrorCallback<BusinessError>)
          soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
          await sleep(2000);
          streamId = (await soundPool!!.play(soundId)) as int;
          await sleep(200);
          soundPool!!.setRate(-1, audio.AudioRendererRate.RENDER_RATE_DOUBLE, (err) => {
            if (err) {
              if (err.code == 401) {
                console.info(`${TAG}: Test setRateCallback with invalid streamId success, error: [${err.code}, ${err.message}]`);
              } else {
                console.info(`${TAG}: Test setRateCallback with invalid streamId fail, errCode != 401, error: [${err.code}, ${err.message}]`);
                expectFalse();
              }
            } else {
              console.info(`${TAG}: Test setRateCallback with invalid streamId fail, setRate success! streamId: -1`);
              expectFalse();
            }
          })
          await sleep(2000);
          await soundPool!!.stop(streamId);
          done();
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
          done();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0600
     * @tc.desc   Function test. Error code: 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0600 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          if (!soundPool) {
            console.error(`${TAG}:createSoundPool soundPool is null`);
            expectFalse();
            done();
          }
          soundPool!!.onError((error: BusinessError) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
          } as ErrorCallback<BusinessError>)
          soundId = (await soundPool!!.load(fd1, 0, length1)) as int;
          await sleep(2000);
          streamId = (await soundPool!!.play(soundId)) as int;
          await sleep(200);
          soundPool!!.setRate(streamId + 1, audio.AudioRendererRate.RENDER_RATE_DOUBLE, (err) => {
            if (err) {
              if (err.code == 5400102) {
                console.info(`${TAG}: Test setRateCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
              } else {
                console.info(`${TAG}: Test setRateCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
                expectFalse();
              }
            } else {
              console.info(`${TAG}: Test setRateCallback with unplayed streamId fail, setRate success! streamId: ${(streamId +
                1)}`);
              expectFalse();
            }
          })
          await sleep(2000);
          await soundPool!!.stop(streamId);
          done();
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
          done();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ERROR_OCCURRED_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ERROR_OCCURRED_static_0100
     * @tc.desc   Function test. Error code: 5400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ERROR_OCCURRED_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ERROR_OCCURRED_static_0100 in`);
      try {
        let soundId = 1;
        let isExpected = false;
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onErrorOccurred((errorInfo_: ErrorInfo) => {
          expect(errorInfo_).not().assertNull;
          console.error(`${TAG}: onErrorOccurred called! error happened, message is: ${errorInfo_.errorCode.message}`);
          console.error(`${TAG}: onErrorOccurred called! error happened, message is: ${errorInfo_.errorType}`);
          let errType = errorInfo_.errorType as ErrorType;
          isExpected = errorInfo_.soundId == soundId && errorInfo_.errorType != undefined && errType == ErrorType.PLAY_ERROR &&
            errorInfo_.errorCode.code == 5400103;
        })
        await soundPool!!.load(uri5).then((soundId_: int) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(uri) success, soundId: ${soundId_}`);
            soundId = Double.toInt(soundId_);
          } else {
            console.info(`${TAG}: load(uri) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: load(uri) fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(5000);
        if (isExpected) {
          console.info(`${TAG}: Test onErrorOccurred when loadfailed success`);
        } else {
          console.info(`${TAG}: Test onErrorOccurred when loadfailed failed`);
          expectFalse();
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${JSON.stringify(error)}]`);
        expectFalse();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ERROR_OCCURRED_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ERROR_OCCURRED_static_0200
     * @tc.desc   Function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ERROR_OCCURRED_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ERROR_OCCURRED_static_0200 in`);
      let flag = false;
      try {
        await createSoundPool();
        if (!soundPool) {
          console.error(`${TAG}:createSoundPool soundPool is null`);
          expectFalse();
          done();
        }
        soundPool!!.onErrorOccurred((errorInfo_: ErrorInfo) => {
          console.error(`${TAG}: onErrorOccurred called! error happened, message is: ${errorInfo_.errorCode.message}`);
          flag = true;
        })
        soundPool!!.offErrorOccurred();
        await sleep(500);
        await soundPool!!.load(uri5).then((soundId_: int) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(uri) success, soundId: ${soundId_}`);
            soundId = Double.toInt(soundId_);
          } else {
            console.info(`${TAG}: load(uri) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error: Error) => {
          console.info(`${TAG}: load(uri) fail! catch error, error: [${JSON.stringify(error)}]`);
          expectFalse();
        })
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: Test onErrorOccurred off failed`);
          expectFalse();
        } else {
          console.info(`${TAG}: onErrorOccurred off`);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
      }
    });
  })
}
