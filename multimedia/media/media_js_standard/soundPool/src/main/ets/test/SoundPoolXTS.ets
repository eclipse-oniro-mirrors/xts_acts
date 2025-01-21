/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function soundPoolTest() {
  describe('soundPoolTest', function () {
    let TAG = "[soundPoolTest]";
    let filePath = null;
    let soundPool: media.SoundPool;
    let maxStreams = 3;
    let soundId = -1;
    let returnMsg :string = ``;
    let uri1: string = "";
    let uri2: string = "";
    let uri3: string = "";
    let uri4: string = "";
    let fd1 = -1;
    let fd2 = -1;
    let fd3 = -1;
    let fd4 = -1;
    let length1 = -1;
    let length2 = -1;
    let length3 = -1;
    let length4 = -1;
    let audioRendererInfo = {
      content: audio.ContentType.CONTENT_TYPE_SPEECH,
      usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
      rendererFlags: 1
    }
    let PlayParameters = {
      loop: 0,
      rate: audio.AudioRendererRate.RENDER_RATE_DOUBLE,
      leftVolume: 0.2,
      rightVolume: 0.8,
      priority: 0,
      parallelPlayFlag: true
    }

    function expectFalse() {
      try {
        expect().assertFail();
      }catch (err){
        console.info(`${TAG}: assertion failure`);
      }
    };
    const sleep = function (timeout) {
      return new Promise(resolve => {
        setTimeout(() => {
          resolve(null);
        }, timeout);
      });
    };
    async function failureCallback(error){
      returnMsg = `case failureCallback called, errMessage is ${error.message}`;
      console.info(`${TAG}: case failureCallback called, errMessage is ${error.message}`);
    }
    async function catchCallback(error){
      returnMsg = `case failureCallback called, errMessage is ${error.message}`;
      console.info(`${TAG}: case catchCallback called, errMessage is ${error.message}`);
    }

    async function getFileUrl(path, uri) {
      console.info(`${TAG}: getFileUrl called`);
      let stat = await fs.stat(filePath + path);
      console.info(`${TAG}: stat: ${JSON.stringify(stat)}`);
      console.info(`${TAG}: size: ${stat.size}`);
      await fs.open(filePath + path, fs.OpenMode.READ_ONLY).then((file) => {
        console.info(`${TAG}: file fd: ${file.fd}`);
        switch (uri) {
          case uri1:
            uri1 = 'fd://' + (file.fd).toString()
            fd1 = file.fd;
            length1 = stat.size;
            break;
          case uri2:
            uri2 = 'fd://' + (file.fd).toString()
            fd2 = file.fd;
            length2 = stat.size;
            break;
          case uri3:
            uri3 = 'fd://' + (file.fd).toString()
            fd3 = file.fd;
            length3 = stat.size;
            break;
          case uri4:
            uri4 = 'fd://' + (file.fd).toString()
            fd4 = file.fd;
            length4 = stat.size;
            break;
        }
      }).catch((err) => {
        console.info(`${TAG}: open file failed with error message: ${err.message}, error code: ${err.code}`);
      });
      console.info(`${TAG}: getFileUrl done`);
    }

    async function createSoundPool() {
      await media.createSoundPool(maxStreams, audioRendererInfo).then((soundPool_) => {
        console.info(`${TAG}: case createSoundPool called`);
        if (soundPool_) {
          soundPool = soundPool_;
          console.info(`${TAG}: soundPool: ${soundPool}`);
        } else {
          console.info(`${TAG}: case create soundPool failed!!!`);
          expectFalse();
          return;
        }
      }, failureCallback).catch(catchCallback);
      console.info(`${TAG}: case createSoundPool out`);
    }


    beforeAll(async function () {
      console.info(`${TAG}: beforeAll in`);
      var context = featureAbility.getContext();
      await context.getFilesDir().then((data) => {
        filePath = data;
        console.info(`${TAG}: filePath: ${filePath}`);
      }).catch((Error) => {
        console.error(`${TAG}: getFilesDir err: ${Error.message}`);
      })
      await getFileUrl('/test_01.mp3', uri1);
      await getFileUrl('/test_02.mp3', uri2);
      await getFileUrl('/test_03.mp3', uri3);
      await getFileUrl('/test_04.mp3', uri4);
      console.info(`${TAG}: uri1 is: ${uri1}; uri2 is: ${uri2}; uri3 is: ${uri3}; uri4 is: ${uri4}`);
      console.info(`${TAG}: fd1 is: ${fd1}; fd2 is: ${fd2}; fd3 is: ${fd3}; fd4 is: ${fd4}`);
    });
    beforeEach(async function () {
      console.info(`${TAG}: beforeEach in`);
    })
    afterEach(async function () {
      await sleep(200);
      console.info(`${TAG}: afterEach in`);
      if (soundId != -1) {
        console.info(`${TAG}: unload enter`);
        await soundPool.unload(soundId);
        soundId = -1;
      }
      if (soundPool != null) {
        console.info(`${TAG}: release enter`);
        await soundPool.release();
        soundPool = null;
      }
    })
    afterAll(function () {
      console.info(`${TAG}: afterAll in`);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0100
        * @tc.name      : 001.test Promise createSoundPool test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0100 in`);
      try {
        await media.createSoundPool(maxStreams, audioRendererInfo).then((soundPool_) => {
          if (soundPool_) {
            console.info(`${TAG}: createSoundPool Success, soundPool: ${soundPool_}`);
            soundPool = soundPool_;
          } else {
            console.error(`${TAG}: error! soundPool = undefined`);
            expectFalse();
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0200
        * @tc.name      : 002.test Promise createSoundPool test --Optional input maxStream is invalid
        * @tc.desc      : Function test. Error code: 5400101
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0200 in`);
      try {
        await media.createSoundPool(-1, audioRendererInfo).then((soundPool_) => {
          console.info(`${TAG}: Test createSoundPool with invalid maxStream fail, create success!`);
          expectFalse();
        });
      } catch (error) {
        if (error.code == 5400101) {
          console.info(`${TAG}: Test createSoundPool with invalid maxStream success, error: [${error.code}, ${error.message}]`);
        } else {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        }
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0300
        * @tc.name      : 003.test Promise createSoundPool test --Optional input audioRendererInfo is invalid
        * @tc.desc      : Function test. Error code: 5400101
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_0300 in`);
      let invalidInfo = {
        content: -1,
        usage: -1,
        rendererFlags: 1
      }
      try {
        await media.createSoundPool(maxStreams, invalidInfo).then((soundPool_) => {
          console.info(`${TAG}: Test createSoundPool with invalid audioRendererInfo fail, create success!`);
          expectFalse();
        });
      } catch (error) {
        if (error.code == 5400101) {
          console.info(`${TAG}: Test createSoundPool with invalid audioRendererInfo success, error: [${error.code}, ${error.message}]`);
        } else {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        }
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0100
        * @tc.name      : 001.test Async createSoundPool test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0100 in`);
      try {
        media.createSoundPool(maxStreams, audioRendererInfo, (error, soundPool_) => {
          if (error) {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0200
        * @tc.name      : 002.test Async createSoundPool test --Optional input maxStream is invalid
        * @tc.desc      : Function test. Error code: 5400101
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0200 in`);
      try {
        media.createSoundPool(-1, audioRendererInfo, (error, soundPool_) => {
          if (error) {
            if (error.code == 5400101) {
              console.info(`${TAG}: Test createSoundPoolCallback with invalid maxStream success, error: [${error.code}, ${error.message}]`);
            } else {
              console.error(`${TAG}: Test createSoundPoolCallback with invalid maxStream fail, errCode != 5400101, err: [${error.code}, ${error.message}]`);
              expectFalse();
            }
          } else {
            console.error(`${TAG}: Test createSoundPoolCallback with invalid maxStream fail, create success!`);
            expectFalse();
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0300
        * @tc.name      : 003.test Async createSoundPool test --Optional input audioRendererInfo is invalid
        * @tc.desc      : Function test. Error code: 5400101
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_CREATE_AYSNC_0300 in`);
      let invalidInfo = {
        content: -1,
        usage: -1,
        rendererFlags: 1
      }
      try {
        media.createSoundPool(maxStreams, invalidInfo, (error, soundPool_) => {
          if (error) {
            if (error.code == 5400101) {
              console.info(`${TAG}: Test createSoundPoolCallback with invalid audioRendererInfo success, error: [${error.code}, ${error.message}]`);
            } else {
              console.error(`${TAG}: Test createSoundPoolCallback with invalid audioRendererInfo fail, errCode != 5400101, err: [${error.code}, ${error.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test createSoundPoolCallback with invalid audioRendererInfo fail, create success!`);
            expectFalse();
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0100
        * @tc.name      : 001.test Promise load(uri) test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load(uri1).then((soundId_) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(uri) success, soundId: ${soundId_}`);
            soundId = soundId_;
          } else {
            console.info(`${TAG}: load(uri) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: load(uri) fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0200
        * @tc.name      : 002.test Promise load(uri) test --Optional input uri is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0200 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load('').then((soundId_) => {
          console.info(`${TAG}: Test load(uri) with invalid uri fail, load success! soundId: ${soundId_}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400103) {
            console.info(`${TAG}: Test load(uri) with invalid uri success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test load(uri) with invalid uri fail, errCode != 5400103, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0300
        * @tc.name      : 003.test Promise load(fd, offset, length) test --0 offset
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0300 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load(fd1, 0, length1).then((soundId_) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(fd, offset, length) success, offset = 0, soundId: ${soundId_}`);
            soundId = soundId_;
          } else {
            console.info(`${TAG}: load(fd, offset, length) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: load(fd, offset, length) fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0400
        * @tc.name      : 004.test Promise load(fd, offset, length) test --1/3 length
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0400 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load(fd2, length2 / 3, length2).then((soundId_) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(fd, offset, length) success, offset = 1/3 length, soundId: ${soundId_}`);
            soundId = soundId_;
          } else {
            console.info(`${TAG}: load(fd, offset, length) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: load(fd, offset, length) fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0500
        * @tc.name      : 005.test Promise load(fd, offset, length) test --length < fileSize
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0500', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0500 in`);
      try {
        let streamId = -1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load(fd1, 0, length1 / 2).then((soundId_) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(fd, offset, length) success, length < fileSize, soundId: ${soundId_}`);
            soundId = soundId_;
          } else {
            console.info(`${TAG}: load(fd, offset, length) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: load(fd, offset, length) fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.play(soundId).then((streamId_) => {
          if (streamId_ > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId_}`);
            streamId = streamId_;
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        if (streamId != -1) {
          await soundPool.stop(streamId);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0600
        * @tc.name      : 006.test Promise load(fd, offset, length) test --length > fileSize
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0600', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0600 in`);
      try {
        let streamId = -1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load(fd2, 0, length2 + 1).then((soundId_) => {
          if (soundId_ > 0) {
            console.info(`${TAG}: load(fd, offset, length) success, length > fileSize, soundId: ${soundId_}`);
            soundId = soundId_;
          } else {
            console.info(`${TAG}: load(fd, offset, length) fail! soundId: ${soundId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(TAG + `load(fd, offset, length) fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.play(soundId).then((streamId_) => {
          if (streamId_ > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId_}`);
            streamId = streamId_;
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        if (streamId != -1) {
          await soundPool.stop(streamId);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0700
        * @tc.name      : 007.test Promise load(fd, offset, length) test --Optional input fd is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0700', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0700 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load(-1, 0, length1).then((soundId) => {
          console.info(`${TAG}: Test load(fd, offset, length) with invalid fd fail, load success! soundId: ${soundId}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400103) {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid fd success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid fd fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0800
        * @tc.name      : 008.test Promise load(fd, offset, length) test --Optional input offset is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0800', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0800 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load(fd1, -1, length1).then((soundId) => {
          console.info(`${TAG}: Test load(fd, offset, length) with invalid offset fail, load success! soundId: ${soundId}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400103) {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid offset success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid offset fail, errCode != 5400103, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0900
        * @tc.name      : 009.test Promise load(fd, offset, length) test --Optional input length is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0900', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_0900 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.load(fd1, 0, -1).then((soundId) => {
          console.info(`${TAG}: Test load(fd, offset, length) with invalid length fail, load success! soundId: ${soundId}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400103) {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid length success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test load(fd, offset, length) with invalid length fail, errCode != 5400103, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0100
        * @tc.name      : 001.test Async load(uri) test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load(uri1, (err, soundId_) => {
          if (err) {
            console.info(`${TAG}: loadCallback(uri) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_ > 0) {
              console.info(`${TAG}: loadCallback(uri) success, soundId: ${soundId_}`);
              soundId = soundId_;
            } else {
              console.info(`${TAG}: loadCallback(uri) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0200
        * @tc.name      : 002.test Async load(uri) test --Optional input uri is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0200 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load('', (err, soundId_) => {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0300
        * @tc.name      : 003.test Async load(fd, offset, length) test --0 offset
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0300 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load(fd1, 0, length1, (err, soundId_) => {
          if (err) {
            console.info(`${TAG}: loadCallback(fd, offset, length) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_ > 0) {
              console.info(`${TAG}: loadCallback(fd, offset, length) success, offset = 0, soundId: ${soundId_}`);
              soundId = soundId_;
            } else {
              console.info(`${TAG}: loadCallback(fd, offset, length) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0400
        * @tc.name      : 004.test Async load(fd, offset, length) test --1/3 offset
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0400 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load(fd2, length2 / 3, length2, (err, soundId_) => {
          if (err) {
            console.info(`${TAG}: loadCallback(fd, offset, length) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_ > 0) {
              console.info(`${TAG}: loadCallback(fd, offset, length) success, offset = 1/3 length, soundId: ${soundId_}`);
              soundId = soundId_;
            } else {
              console.info(`${TAG}: loadCallback(fd, offset, length) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0500
        * @tc.name      : 005.test Async load(fd, offset, length) test --length < fileSize
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0500', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0500 in`);
      try {
        let streamId = -1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load(fd1, 0, length1 / 2, (err, soundId_) => {
          if (err) {
            console.info(`${TAG}: loadCallback(fd, offset, length) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_ > 0) {
              console.info(`${TAG}: loadCallback(fd, offset, length) success, length < fileSize, soundId: ${soundId_}`);
              soundId = soundId_;
            } else {
              console.info(`${TAG}: loadCallback(fd, offset, length) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
        })
        await sleep(2000);
        await soundPool.play(soundId).then((streamId_) => {
          if (streamId_ > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId_}`);
            streamId = streamId_;
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        if (streamId != -1) {
          await soundPool.stop(streamId);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0600
        * @tc.name      : 006.test Async load(fd, offset, length) test --length > fileSize
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0600', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0600 in`);
      try {
        let streamId = -1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load(fd2, 0, length2 + 1, (err, soundId_) => {
          if (err) {
            console.info(`${TAG}: loadCallback(fd, offset, length) error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (soundId_ > 0) {
              console.info(`${TAG}: loadCallback(fd, offset, length) success, length > fileSize, soundId: ${soundId_}`);
              soundId = soundId_;
            } else {
              console.info(`${TAG}: oadCallback(fd, offset, length) fail! soundId: ${soundId_}`);
              expectFalse();
            }
          }
        })
        await sleep(2000);
        await soundPool.play(soundId).then((streamId_) => {
          if (streamId_ > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId_}`);
            streamId = streamId_;
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId_}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play fail! catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        if (streamId != -1) {
          await soundPool.stop(streamId);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0700
        * @tc.name      : 007.test Async load(fd, offset, length) test --Optional input fd is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0700', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0700 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load(-1, 0, length1, (err, soundId_) => {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0800
        * @tc.name      : 008.test Async load(fd, offset, length) test --Optional input offset is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0800', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0800 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load(fd1, -1, length1, (err, soundId_) => {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0900
        * @tc.name      : 009.test Async load(fd, offset, length) test --Optional input length is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0900', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_LOAD_ASYNC_0900 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.load(fd1, 0, -1, (err, soundId_) => {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0100
        * @tc.name      : 001.test Promise unload test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.unload(soundId).then(() => {
          console.info(`${TAG}: unload success, unload soundId: ${soundId}`);
          soundId = -1;
        }).catch((error) => {
          console.info(`${TAG}: unload fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0200
        * @tc.name      : 002.test Promise unload test --Optional input soundId is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0200 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.unload(-1).then(() => {
          console.info(`${TAG}: Test unload with invalid soundId fail, unload Success! unload soundId: -1`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400103) {
            console.info(`${TAG}: Test unload with invalid soundId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test unload with invalid soundId fail, errCode != 5400103, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0300
        * @tc.name      : 003.test Promise unload test --Optional input soundId is unloaded
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_0300 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.unload(soundId + 1).then(() => {
          console.info(`${TAG}: Test unload with unloaded soundId fail, unload Success! unload soundId: ${(soundId + 1)}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test unload with unloaded soundId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test unload with unloaded soundId fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0100
        * @tc.name      : 001.test Async unload test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        soundPool.unload(soundId, (err) => {
          if (err) {
            console.info(`${TAG}: unloadCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: unloadCallback success, unload soundId: ${soundId}`);
            soundId = -1;
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0200
        * @tc.name      : 002.test Async unload test --Optional input soundId is invalid
        * @tc.desc      : Function test. Error code: 5400103
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0200 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        soundPool.unload(-1, (err) => {
          if (err) {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0300
        * @tc.name      : 003.test Async unload test --Optional input soundId is unloaded
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_UNLOAD_ASYNC_0300 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        soundPool.unload(soundId + 1, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test unloadCallback with unloaded soundId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test unloadCallback with unloaded soundId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test unloadCallback with unloaded soundId fail, unload Success! unload soundId: ${(soundId + 1)}`);
            expectFalse();
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0100
        * @tc.name      : 001.test Promise play(soundID) test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        await soundPool.play(soundId).then((streamId) => {
          if (streamId > 0) {
            console.info(`${TAG}: play success, streamId: ${streamId}`);
            streamId_ = streamId;
          } else {
            console.info(`${TAG}: play fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0200
        * @tc.name      : 002.test Promise play(soundID) test --Optional input soundId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0200 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.play(-1).then((streamId) => {
          console.info(`${TAG}: Test play with invalid soundId fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 401) {
            console.info(`${TAG}: Test play with invalid soundId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test play with invalid soundId fail, errCode != 401, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0300
        * @tc.name      : 003.test Promise play(soundID) test --Optional input soundId is unloaded
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0300 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.play(soundId + 1).then((streamId) => {
          console.info(`${TAG}: Test play with unloaded soundId fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test play with unloaded soundId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test play with unloaded soundId fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0400
        * @tc.name      : 004.test Promise play(soundID, params) test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0400 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        await soundPool.play(soundId, PlayParameters).then((streamId) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) success, streamId: ${streamId}`);
            streamId_ = streamId;
          } else {
            console.info(`${TAG}: play(soundID, params) fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play(soundID, params) fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0500
        * @tc.name      : 005.test Promise play(soundID, params) test --Optional input soundId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0500', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0500 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.play(-1, PlayParameters).then((streamId) => {
          console.info(`${TAG}: Test play with invalid soundId fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 401) {
            console.info(`${TAG}: Test play(soundID, params) with invalid soundId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test play(soundID, params) with invalid soundId fail, errCode != 401, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0600
        * @tc.name      : 006.test Promise play(soundID, params) test --Optional input soundId is unloaded
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0600', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0600 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.play(soundId + 1, PlayParameters).then((streamId) => {
          console.info(`${TAG}: Test play(soundID, params) with unloaded soundId fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test play(soundID, params) with unloaded soundId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test play(soundID, params) with unloaded soundId fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0700
        * @tc.name      : 007.test Promise play(soundID, params) test --Optional param.loop
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0700', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0700 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          loop: 2,
        }
        await soundPool.play(soundId, parameters).then((streamId) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.loop success, streamId: ${streamId}`);
            streamId_ = streamId;
          } else {
            console.info(`${TAG}: play(soundID, params) with params.loop fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play(soundID, params) with params.loop fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0800
        * @tc.name      : 008.test Promise play(soundID, params) test --Optional param.rate
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0800', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0800 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          rate: audio.AudioRendererRate.RENDER_RATE_HALF,
        }
        await soundPool.play(soundId, parameters).then((streamId) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.rate success, streamId: ${streamId}`);
            streamId_ = streamId;
          } else {
            console.info(`${TAG}: play(soundID, params) with params.rate fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play(soundID, params) with params.rate fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0900
        * @tc.name      : 009.test Promise play(soundID, params) test --Optional param.leftVolume
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0900', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_0900 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          leftVolume: 0.5,
        }
        await soundPool.play(soundId, parameters).then((streamId) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.leftVolume success, streamId: ${streamId}`);
            streamId_ = streamId;
          } else {
            console.info(`${TAG}: play(soundID, params) with params.leftVolume fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play(soundID, params) with params.leftVolume fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1000
        * @tc.name      : 010.test Promise play(soundID, params) test --Optional param.rightVolume
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1000', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1000 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          rightVolume: 0.5,
        }
        await soundPool.play(soundId, parameters).then((streamId) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.rightVolume success, streamId: ${streamId}`);
            streamId_ = streamId;
          } else {
            console.info(`${TAG}: play(soundID, params) with params.rightVolume fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play(soundID, params) with params.rightVolume fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1100
        * @tc.name      : 011.test Promise play(soundID, params) test --Optional param.priority
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          priority: 3,
        }
        await soundPool.play(soundId, parameters).then((streamId) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.priority success, streamId: ${streamId}`);
            streamId_ = streamId;
          } else {
            console.info(`${TAG}: play(soundID, params) with params.priority fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play(soundID, params) with params.priority fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1200
        * @tc.name      : 012.test Promise play(soundID, params) test --Optional param.parallelPlayFlag
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_1200 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          parallelPlayFlag: true,
        }
        await soundPool.play(soundId, parameters).then((streamId) => {
          if (streamId > 0) {
            console.info(`${TAG}: play(soundID, params) with params.parallelPlayFlag success, streamId: ${streamId}`);
            streamId_ = streamId;
          } else {
            console.info(`${TAG}: play(soundID, params) with params.parallelPlayFlag fail! streamId: ${streamId}`);
            expectFalse();
          }
        }).catch((error) => {
          console.info(`${TAG}: play(soundID, params) with params.parallelPlayFlag fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0100
        * @tc.name      : 001.test Async play(soundID) test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        soundPool.play(soundId, (err, streamId) => {
          if (err) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: playCallback success, streamId: ${streamId}`);
              streamId_ = streamId;
            } else {
              console.info(`${TAG}: playCallback fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0200
        * @tc.name      : 002.test Async play(soundID) test --Optional input soundId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0200 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        soundPool.play(-1, (err, streamId) => {
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
          return;
        })
      } catch (error) {
        console.info(TAG + `catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0300
        * @tc.name      : 003.test Async play(soundID) test --Optional input soundId is unloaded
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0300 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        soundPool.play(soundId + 1, (err, streamId) => {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0400
        * @tc.name      : 004.test Async play(soundID, params) test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0400 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        soundPool.play(soundId, PlayParameters, (err, streamId) => {
          if (err) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: playCallback success, streamId: ${streamId}`);
              streamId_ = streamId;
            } else {
              console.info(`${TAG}: playCallback fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0500
        * @tc.name      : 005.test Async play(soundID, params) test --Optional input soundId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0500', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0500 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        soundPool.play(-1, PlayParameters, (err, streamId) => {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0600
        * @tc.name      : 006.test Async play(soundID, params) test --Optional input soundId is unloaded
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0600', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0600 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        soundPool.play(soundId + 1, PlayParameters, (err, streamId) => {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0700
        * @tc.name      : 007.test Async play(soundID, params) test --Optional param.loop
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0700', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0700 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          loop: 0,
        }
        soundPool.play(soundId, parameters, (err, streamId) => {
          if (err) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: playCallback with param.loop success, streamId: ${streamId}`);
              streamId_ = streamId;
            } else {
              console.info(`${TAG}: playCallback with param.loop fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0800
        * @tc.name      : 008.test Async play(soundID, params) test --Optional param.rate
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0800', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0800 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          rate: audio.AudioRendererRate.RENDER_RATE_DOUBLE,
        }
        soundPool.play(soundId, parameters, (err, streamId) => {
          if (err) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: playCallback with param.rate success, streamId: ${streamId}`);
              streamId_ = streamId;
            } else {
              console.info(`${TAG}: playCallback with param.rate fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0900
        * @tc.name      : 009.test Async play(soundID, params) test --Optional param.leftVolume
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0900', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_0900 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          leftVolume: 0.6,
        }
        soundPool.play(soundId, parameters, (err, streamId) => {
          if (err) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: playCallback with param.leftVolume success, streamId: ${streamId}`);
              streamId_ = streamId;
            } else {
              console.info(`${TAG}: playCallback with param.leftVolume fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1000
        * @tc.name      : 010.test Async play(soundID, params) test --Optional param.rightVolume
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1000', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1000 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          rightVolume: 0.6,
        }
        soundPool.play(soundId, parameters, (err, streamId) => {
          if (err) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: playCallback with param.rightVolume success, streamId: ${streamId}`);
              streamId_ = streamId;
            } else {
              console.info(`${TAG}: playCallback with param.rightVolume fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1100
        * @tc.name      : 011.test Async play(soundID, params) test --Optional param.priority
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          priority: 2,
        }
        soundPool.play(soundId, parameters, (err, streamId) => {
          if (err) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: playCallback with param.priority success, streamId: ${streamId}`);
              streamId_ = streamId;
            } else {
              console.info(`${TAG}: playCallback with param.priority fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1200
        * @tc.name      : 012.test Async play(soundID, params) test --Optional param.parallelPlayFlag
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_ASYNC_1200 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        let streamId_ = -1;
        let parameters = {
          parallelPlayFlag: true
        }
        soundPool.play(soundId, parameters, (err, streamId) => {
          if (err) {
            console.info(`${TAG}: playCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: playCallback with param.parallelPlayFlag success, streamId: ${streamId}`);
              streamId_ = streamId;
            } else {
              console.info(`${TAG}: playCallback with param.parallelPlayFlag fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
        })
        await sleep(500);
        if (streamId_ != -1) {
          await sleep(5000);
          await soundPool.stop(streamId_);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0100
        * @tc.name      : 001.test Promise stop test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0100 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(5000);
        await soundPool.stop(streamId).then(() => {
          console.info(`${TAG}: stop success, stop streamId: ${streamId}`);
        }).catch((error) => {
          console.info(`${TAG}: stop fail! error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0200
        * @tc.name      : 002.test Promise stop test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        await soundPool.stop(-1).then(() => {
          console.info(`${TAG}: Test stop with invalid streamId fail, stop success! stop streamId: -1`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 401) {
            console.info(`${TAG}: Test stop with invalid streamId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test stop with invalid streamId fail, errCode != 401, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0300
        * @tc.name      : 003.test Promise stop test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_0300 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        await soundPool.stop(streamId + 1).then(() => {
          console.info(`${TAG}: Test stop with unplayed streamId fail, stop success! stop streamId: ${(streamId + 1)}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test stop with unplayed streamId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test stop with unplayed streamId fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0100
        * @tc.name      : 001.test Async stop test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0100 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(5000);
        soundPool.stop(streamId, (err) => {
          if (err) {
            console.info(`${TAG}: stopCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: stopCallback success, stop streamId: ${streamId}`);
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0200
        * @tc.name      : 002.test Async stop test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        soundPool.stop(-1, (err) => {
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
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0300
        * @tc.name      : 003.test Async stop test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_ASYNC_0300 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        soundPool.stop(streamId + 1, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test stopCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test stopCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test stopCallback with unplayed streamId fail, stop success! stop streamId: ${(streamId + 1)}`);
            expectFalse();
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0100
        * @tc.name      : 001.test Promise setLoop test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0100 in`);
      try {
        let streamId = 0;
        let loopForever = -1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        await soundPool.setLoop(streamId, loopForever).then(() => {
          console.info(`${TAG}: setLoop success, loop: ${loopForever}`);
        }).catch((error) => {
          console.info(`${TAG}: setLoop fail! error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0200
        * @tc.name      : 002.test Promise setLoop test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0200 in`);
      try {
        let streamId = 0;
        let loop = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        await soundPool.setLoop(-1, loop).then(() => {
          console.info(`${TAG}: Test setLoop with invalid streamId fail, setLoop success! setLoop streamId: -1`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 401) {
            console.info(`${TAG}: Test setLoop with invalid streamId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test setLoop with invalid streamId fail, errCode != 401, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0300
        * @tc.name      : 003.test Promise setLoop test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_0300 in`);
      try {
        let streamId = 0;
        let loop = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        await soundPool.setLoop(streamId + 1, loop).then(() => {
          console.info(`${TAG}: Test setLoop with unplayed streamId fail, setLoop success! setLoop streamId: ${(streamId + 1)}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test setLoop with unplayed streamId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test setLoop with unplayed streamId fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0100
        * @tc.name      : 001.test Async setLoop test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0100 in`);
      try {
        let streamId = 0;
        let loopForever = -1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        soundPool.setLoop(streamId, loopForever, (err) => {
          if (err) {
            console.info(`${TAG}: setLoopCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: setLoopCallback success, loop: ${loopForever}`);
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0200
        * @tc.name      : 002.test Async setLoop test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0200 in`);
      try {
        let streamId = 0;
        let loop = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        soundPool.setLoop(-1, loop, (err) => {
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
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0300
        * @tc.name      : 003.test Async setLoop test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETLOOP_ASYNC_0300 in`);
      try {
        let streamId = 0;
        let loop = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        soundPool.setLoop(streamId + 1, loop, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test setLoopCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setLoopCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setLoopCallback with unplayed streamId fail, setLoop success! setLoop streamId: ${(streamId + 1)}`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0100
        * @tc.name      : 001.test Promise setPriority test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0100 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        await soundPool.setPriority(streamId, lowest).then(() => {
          console.info(`${TAG}: setPriority success, priority: ${lowest}`);
        }).catch((error) => {
          console.info(`${TAG}: setPriority fail! error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0200
        * @tc.name      : 002.test Promise setPriority test --Optional input priority is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        await soundPool.setPriority(streamId, -1).then(() => {
          console.info(`${TAG}: Test setPriority with invalid priority fail, setPriority success! priority: -1`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 401) {
            console.info(`${TAG}: Test setPriority with invalid priority success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test setPriority with invalid priority fail, errCode != 401, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0300
        * @tc.name      : 003.test Promise setPriority test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0300 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        await soundPool.setPriority(-1, lowest).then(() => {
          console.info(`${TAG}: Test setPriority with invalid streamId fail, setPriority success! streamId: -1`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 401) {
            console.info(`${TAG}: Test setPriority with invalid streamId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test setPriority with invalid streamId fail, errCode != 401, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0400
        * @tc.name      : 004.test Promise setPriority test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_0400 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        await soundPool.setPriority(streamId + 1, lowest).then(() => {
          console.info(`${TAG}: Test setPriority with unplayed streamId fail, setPriority success! streamId: ${(streamId + 1)}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test setPriority with unplayed streamId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test setPriority with unplayed streamId fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0100
        * @tc.name      : 001.test Async setPriority test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0100 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        soundPool.setPriority(streamId, lowest, (err) => {
          if (err) {
            console.info(`${TAG}: setPriorityCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: setPriorityCallback success, priority: ${lowest}`);
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0200
        * @tc.name      : 002.test Async setPriority test --Optional input priority is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        soundPool.setPriority(streamId, -1, (err) => {
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
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0300
        * @tc.name      : 003.test Async setPriority test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0300 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        soundPool.setPriority(-1, lowest, (err) => {
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
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0400
        * @tc.name      : 004.test Async setPriority test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETPRIORITY_ASYNC_0400 in`);
      try {
        let streamId = 0;
        let lowest = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(200);
        soundPool.setPriority(streamId + 1, lowest, (err) => {
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
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0100
        * @tc.name      : 001.test Promise setRate test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0100 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          await soundPool.setRate(streamId, audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
            console.info(`${TAG}: setRate success, rate: ${audio.AudioRendererRate.RENDER_RATE_DOUBLE}`);
          }).catch((error) => {
            console.info(`${TAG}: setRate fail! error: [${error.code}, ${error.message}]`);
            expectFalse();
          })
          await sleep(2000);
          await soundPool.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0200
        * @tc.name      : 002.test Promise setRate test --Optional input rate is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0200 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          await soundPool.setRate(streamId, -1).then(() => {
            console.info(`${TAG}: Test setRate with invalid rate success, setRate success! rate: -1 will be change to normal`);
          }).catch((error) => {
            console.info(`${TAG}: Test setRate with invalid rate fail, error: [${error.code}, ${error.message}]`);
            expectFalse();
          })
          await sleep(2000);
          await soundPool.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0300
        * @tc.name      : 003.test Promise setRate test --Optional input rate is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0300 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          await soundPool.setRate(streamId, 1.5).then(() => {
            console.info(`${TAG}: Test setRate with invalid rate success, setRate success! rate: 1.5 will be change to normal`);
          }).catch((error) => {
            console.info(`${TAG}: Test setRate with invalid rate fail, error: [${error.code}, ${error.message}]`);
            expectFalse();
          })
          await sleep(2000);
          await soundPool.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0400
        * @tc.name      : 004.test Promise setRate test --Optional input rate is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0400 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          await soundPool.setRate(streamId, 3).then(() => {
            console.info(`${TAG}: Test setRate with invalid rate success, setRate success! rate: 3 will be change to normal`);
          }).catch((error) => {
            console.info(`${TAG}: Test setRate with invalid rate fail, error: [${error.code}, ${error.message}]`);
            expectFalse();
          })
          await sleep(2000);
          await soundPool.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0500
        * @tc.name      : 005.test Promise setRate test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0500', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0500 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          await soundPool.setRate(-1, audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
            console.info(`${TAG}: Test setRate with invalid streamId fail, setRate success! streamId: -1`);
            expectFalse();
          }).catch((error) => {
            if (error.code == 401) {
              console.info(`${TAG}: Test setRate with invalid streamId success, error: [${error.code}, ${error.message}]`);
            } else {
              console.info(`${TAG}: Test setRate with invalid streamId fail, errCode != 401, error: [${error.code}, ${error.message}]`);
              expectFalse();
            }
          })
          await sleep(2000);
          await soundPool.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0600
        * @tc.name      : 006.test Promise setRate test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0600', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_0600 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          await soundPool.setRate(streamId + 1, audio.AudioRendererRate.RENDER_RATE_HALF).then(() => {
            console.info(`${TAG}: Test setRate with unplayed streamId fail, setRate success! streamId: ${(streamId + 1)}`);
            expectFalse();
          }).catch((error) => {
            if (error.code == 5400102) {
              console.info(`${TAG}: Test setRate with unplayed streamId success, error: [${error.code}, ${error.message}]`);
            } else {
              console.info(`${TAG}: Test setRate with unplayed streamId fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
              expectFalse();
            }
          })
          await sleep(2000);
          await soundPool.stop(streamId);
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0100
        * @tc.name      : 001.test Async setRate test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0100 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
            return;
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          soundPool.setRate(streamId, audio.AudioRendererRate.RENDER_RATE_HALF, (err) => {
            if (err) {
              console.info(`${TAG}: setRateCallback error: ${JSON.stringify(err)}`);
              expectFalse();
            } else {
              console.info(`${TAG}: setRateCallback success, rate: ${audio.AudioRendererRate.RENDER_RATE_HALF}`);
            }
          })
          await sleep(2000);
          await soundPool.stop(streamId);
          done();
          return;
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0200
        * @tc.name      : 002.test Async setRate test --Optional input rate is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0200 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
            return;
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          soundPool.setRate(streamId, -1, (err) => {
            if (err) {
              console.info(`${TAG}: Test setRateCallback with invalid rate fail, error: [${err.code}, ${err.message}]`);
              expectFalse();
            } else {
              console.info(`${TAG}: Test setRateCallback with invalid rate success, rate: -1 will be changed to normal`);
            }
          })
          await sleep(2000);
          await soundPool.stop(streamId);
          done();
          return;
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0300
        * @tc.name      : 003.test Async setRate test --Optional input rate is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0300 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
            return;
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          soundPool.setRate(streamId, 1.5, (err) => {
            if (err) {
              console.info(`${TAG}: Test setRateCallback with invalid rate fail, error: [${err.code}, ${err.message}]`);
              expectFalse();
            } else {
              console.info(`${TAG}: Test setRateCallback with invalid rate success, rate: 1.5 will be changed to normal`);
            }
          })
          await sleep(2000);
          await soundPool.stop(streamId);
          done();
          return;
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0400
        * @tc.name      : 004.test Async setRate test --Optional input rate is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0400 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
            return;
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          soundPool.setRate(streamId, 3, (err) => {
            if (err) {
              console.info(`${TAG}: Test setRateCallback with invalid rate fail, error: [${err.code}, ${err.message}]`);
              expectFalse();
            } else {
              console.info(`${TAG}: Test setRateCallback with invalid rate success, rate: 3 will be changed to normal`);
            }
          })
          await sleep(2000);
          await soundPool.stop(streamId);
          done();
          return;
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0500
        * @tc.name      : 005.test Async setRate test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0500', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0500 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
            return;
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          soundPool.setRate(-1, audio.AudioRendererRate.RENDER_RATE_DOUBLE, (err) => {
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
          await soundPool.stop(streamId);
          done();
          return;
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0600
        * @tc.name      : 006.test Async setRate test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0600', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETRATE_ASYNC_0600 in`);
      if (deviceInfo.deviceType === 'default') {
        try {
          let streamId = 0;
          await createSoundPool();
          soundPool.on('error', (error) => {
            console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
            expectFalse();
            done();
            return;
          })
          soundId = await soundPool.load(fd1, 0, length1);
          await sleep(2000);
          streamId = await soundPool.play(soundId);
          await sleep(200);
          soundPool.setRate(streamId + 1, audio.AudioRendererRate.RENDER_RATE_DOUBLE, (err) => {
            if (err) {
              if (err.code == 5400102) {
                console.info(`${TAG}: Test setRateCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
              } else {
                console.info(`${TAG}: Test setRateCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
                expectFalse();
              }
            } else {
              console.info(`${TAG}: Test setRateCallback with unplayed streamId fail, setRate success! streamId: ${(streamId + 1)}`);
              expectFalse();
            }
          })
          await sleep(2000);
          await soundPool.stop(streamId);
          done();
          return;
        } catch (error) {
          console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }
      } else {
        console.info(`${TAG}: This device does not support setRate! Ignore this case.`);
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0100
        * @tc.name      : 001.test Promise setVolume test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0100 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        await soundPool.setVolume(streamId, left, right).then(() => {
          console.info(`${TAG}: setVolume success, left: ${left}; right: ${right}`);
        }).catch((error) => {
          console.info(`${TAG}: setVolume fail! error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0200
        * @tc.name      : 002.test Promise setVolume test --Optional input left volume is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0200 in`);
      try {
        let streamId = 0;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        await soundPool.setVolume(streamId, -0.1, right).then(() => {
          console.info(`${TAG}: Test setVolume with invalid left volume success, left volume: -0.1 will be changed to 1.0`);
        }).catch((error) => {
          console.info(`${TAG}: Test setVolume with invalid left volume fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0300
        * @tc.name      : 003.test Promise setVolume test --Optional input left volume is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0300 in`);
      try {
        let streamId = 0;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        await soundPool.setVolume(streamId, 1.5, right).then(() => {
          console.info(`${TAG}: Test setVolume with invalid left volume success, left volume: 1.5 will be changed to 1.0`);
        }).catch((error) => {
          console.info(`${TAG}: Test setVolume with invalid left volume fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0400
        * @tc.name      : 004.test Promise setVolume test --Optional input right volume is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0400 in`);
      try {
        let streamId = 0;
        let left = 0.5;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        await soundPool.setVolume(streamId, left, -0.1).then(() => {
          console.info(`${TAG}: Test setVolume with invalid right volume success, right volume: -0.1 will be changed to 1.0`);
        }).catch((error) => {
          console.info(`${TAG}: Test setVolume with invalid right volume fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0500
        * @tc.name      : 005.test Promise setVolume test --Optional input right volume is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0500', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0500 in`);
      try {
        let streamId = 0;
        let left = 0.5;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        await soundPool.setVolume(streamId, left, 1.5).then(() => {
          console.info(`${TAG}: Test setVolume with invalid right volume success, right volume: 1.5 will be changed to 1.0`);
        }).catch((error) => {
          console.info(`${TAG}: Test setVolume with invalid right volume fail, error: [${error.code}, ${error.message}]`);
          expectFalse();
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0600
        * @tc.name      : 006.test Promise setVolume test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0600', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0600 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        await soundPool.setVolume(-1, left, right).then(() => {
          console.info(`${TAG}: Test setVolume with invalid streamId fail, setVolume success! streamId: -1`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 401) {
            console.info(`${TAG}: Test setVolume with invalid streamId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test setVolume with invalid streamId fail, errCode != 401, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0700
        * @tc.name      : 007.test Promise setVolume test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0700', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_0700 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        await soundPool.setVolume(streamId + 1, left, right).then(() => {
          console.info(`${TAG}: Test setVolume with unplayed streamId fail, setVolume success! streamId: ${(streamId + 1)}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test setVolume with unplayed streamId success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test setVolume with unplayed streamId fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0100
        * @tc.name      : 001.test Async setVolume test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0100 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(1000);
        soundPool.setVolume(streamId, left, right, (err) => {
          if (err) {
            console.info(`${TAG}: setVolumeCallback error: ${JSON.stringify(err)}`);
            expectFalse();
          } else {
            console.info(`${TAG}: setVolumeCallback success, left: ${left}; right: ${right}`);
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0200
        * @tc.name      : 002.test Async setVolume test --Optional input left volume is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0200 in`);
      try {
        let streamId = 0;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        soundPool.setVolume(streamId, -0.1, right, (err) => {
          if (err) {
            console.info(`${TAG}: Test setVolumeCallback with invalid left volume fail, error: [${err.code}, ${err.message}]`);
            expectFalse();
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid left volume success, left volume: -0.1 will be changed to 1.0`);
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0300
        * @tc.name      : 003.test Async setVolume test --Optional input left volume is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0300 in`);
      try {
        let streamId = 0;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        soundPool.setVolume(streamId, 1.5, right, (err) => {
          if (err) {
            console.info(`${TAG}: Test setVolumeCallback with invalid left volume fail, error: [${err.code}, ${err.message}]`);
            expectFalse();
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid left volume success, left volume: 1.5 will be changed to 1.0`);
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0400
        * @tc.name      : 004.test Async setVolume test --Optional input right volume is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0400 in`);
      try {
        let streamId = 0;
        let left = 0.5;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        soundPool.setVolume(streamId, left, -0.1, (err) => {
          if (err) {
            console.info(`${TAG}: Test setVolumeCallback with invalid right volume fail, error: [${err.code}, ${err.message}]`);
            expectFalse();
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid right volume success, right volume: -0.1 will be changed to 1.0`);
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0500
        * @tc.name      : 005.test Async setVolume test --Optional input right volume is invalid
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0500', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0500 in`);
      try {
        let streamId = 0;
        let left = 0.5;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId, PlayParameters);
        await sleep(1000);
        soundPool.setVolume(streamId, left, 1.5, (err) => {
          if (err) {
            console.info(`${TAG}: Test setVolumeCallback with invalid right volume fail, error: [${err.code}, ${err.message}]`);
            expectFalse();
          } else {
            console.info(`${TAG}: Test setVolumeCallback with invalid right volume success, right volume: 1.5 will be changed to 1.0`);
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0600
        * @tc.name      : 006.test Async setVolume test --Optional input streamId is invalid
        * @tc.desc      : Function test. Error code: 401
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0600', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0600 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        soundPool.setVolume(-1, left, right, (err) => {
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
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0700
        * @tc.name      : 007.test Async setVolume test --Optional input streamId is unplayed
        * @tc.desc      : Function test. Error code: 5400102
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0700', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_SETVOLUME_ASYNC_0700 in`);
      try {
        let streamId = 0;
        let left = 0.8;
        let right = 0.2;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        soundPool.setVolume(streamId + 1, left, right, (err) => {
          if (err) {
            if (err.code == 5400102) {
              console.info(`${TAG}: Test setVolumeCallback with unplayed streamId success, error: [${err.code}, ${err.message}]`);
            } else {
              console.info(`${TAG}: Test setVolumeCallback with unplayed streamId fail, errCode != 5400102, error: [${err.code}, ${err.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test setVolumeCallback with unplayed streamId fail, setVolume success! streamId: ${(streamId + 1)}`);
            expectFalse();
          }
        })
        await sleep(2000);
        await soundPool.stop(streamId);
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0100
        * @tc.name      : 001.test on('loadComplete') test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.on('loadComplete', (soundId_) => {
          console.info(`${TAG}: on loadComplete called, soundId: ${soundId_}`);
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0200
        * @tc.name      : 002.test on('playFinished') test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0200', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0200 in`);
      try {
        let streamId = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.on('playFinished', () => {
          console.info(`${TAG}: on playFinished called!`);
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(2000);
        await soundPool.stop(streamId);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0300
        * @tc.name      : 003.test off('loadComplete') test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0300', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0300 in`);
      let flag = false;
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.on('loadComplete', (soundId_) => {
          console.info(`${TAG}: on loadComplete called, soundId: ${soundId_}`);
          flag = true;
        })
        soundPool.on('loadComplete', (soundId_) => {
          console.info(`${TAG}: on loadComplete called, soundId: ${soundId_}`);
          flag = true;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(500);
        await soundPool.off('loadComplete');
        flag = false;
        soundId = await soundPool.load(fd2, 0, length2);
        await sleep(500);
        if (flag) {
          console.error(`${TAG}: loadComplete off fail, on loadComplete called!`);
          expectFalse();
        } else {
          console.info(`${TAG}: loadComplete off`);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0400
        * @tc.name      : 004.test off('playFinished') test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0400', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_ON_0400 in`);
      let flag = false;
      let streamId = 0;
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundPool.on('playFinished', () => {
          console.info(`${TAG}: on playFinished called`);
          flag = true;
        })
        soundPool.on('playFinished', () => {
          console.info(`${TAG}: on playFinished called`);
          flag = true;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId = await soundPool.play(soundId);
        await sleep(500);
        await soundPool.stop(streamId);
        await soundPool.off('playFinished');
        flag = false;
        streamId = await soundPool.play(soundId);
        await sleep(500);
        await soundPool.stop(streamId);
        if (flag) {
          console.error(`${TAG}: playFinished off fail, on playFinished called!`);
          expectFalse();
        } else {
          console.info(`${TAG}: playFinished off`);
        }
        done();
        return;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_WITHOUT_LOAD_0100
        * @tc.name      : 001.test Promise play without load test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_WITHOUT_LOAD_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_WITHOUT_LOAD_0100 in`);
      try {
        let soundId_ = 1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        await soundPool.play(soundId_).then((streamId) => {
          console.info(`${TAG}: Test play without load fail, play success! streamId: ${streamId}`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test play without load success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test play without load fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_AFTER_UNLOAD_0100
        * @tc.name      : 002.test Async play after unload the soundId test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_AFTER_UNLOAD_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_AFTER_UNLOAD_0100 in`);
      try {
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.unload(soundId);
        await sleep(1000);
        soundPool.play(soundId, (error, streamId) => {
          if (error) {
            if (error.code == 5400102) {
              console.info(`${TAG}: Test playCallback after unload success, error: [${error.code}, ${error.message}]`);
            } else {
              console.info(`${TAG}: Test playCallback after unload fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
              expectFalse();
            }
          } else {
            console.info(`${TAG}: Test playCallback after unload fail, play success! streamId: ${streamId}`);
            expectFalse();
          }
          soundId = -1;
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_WITHOUT_PLAY_0100
        * @tc.name      : 003.test Promise stop without play test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_WITHOUT_PLAY_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_STOP_WITHOUT_PLAY_0100 in`);
      try {
        let streamId_ = 1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        await soundPool.stop(streamId_).then(() => {
          console.info(`${TAG}: Test stop without play fail, stop success!`);
          expectFalse();
        }).catch((error) => {
          if (error.code == 5400102) {
            console.info(`${TAG}: Test stop without play success, error: [${error.code}, ${error.message}]`);
          } else {
            console.info(`${TAG}: Test stop without play fail, errCode != 5400102, error: [${error.code}, ${error.message}]`);
            expectFalse();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_STOP_PLAY_0100
        * @tc.name      : 004.test Async create-load-play-stop-play-unload-release
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_STOP_PLAY_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_PLAY_STOP_PLAY_0100 in`);
      try {
        let streamId_ = -1;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
          done();
          return;
        })
        soundId = await soundPool.load(fd1, 0, length1);
        await sleep(2000);
        streamId_ = await soundPool.play(soundId);
        await sleep(2000);
        await soundPool.stop(streamId_);
        await sleep(2000);
        soundPool.play(soundId, (error, streamId) => {
          if (error) {
            console.info(`${TAG}: Test play-stop-play fail, error: [${error.code}, ${error.message}]`);
            expectFalse();
          } else {
            if (streamId > 0) {
              console.info(`${TAG}: Test play-stop-play success! streamId: ${streamId}`);
            } else {
              console.info(`${TAG}: Test play-stop-play fail! streamId: ${streamId}`);
              expectFalse();
            }
          }
          done();
          return;
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_0100
        * @tc.name      : 005.test Promise play three sounds test
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_0100 in`);
      try {
        let streamId_ = [];
        let soundId_ = [];
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundId_[0] = await soundPool.load(fd1, 0, length1);
        soundId_[1] = await soundPool.load(fd2, length2 / 3, length2);
        soundId_[2] = await soundPool.load(uri3);
        await sleep(1000);
        streamId_[0] = await soundPool.play(soundId_[0]);
        streamId_[1] = await soundPool.play(soundId_[1]);
        streamId_[2] = await soundPool.play(soundId_[2], PlayParameters);
        for (let i = 0; i < 3; i++) {
          await sleep(3000);
          await soundPool.stop(streamId_[i]);
          await soundPool.unload(soundId_[i]);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_EXCEEDED_MAXSTREAMS_0100
        * @tc.name      : 006.test Promise play four sounds, but maxstreams = 3
        * @tc.desc      : Function test
        */
    it('SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_EXCEEDED_MAXSTREAMS_0100', 0, async function (done) {
      console.info(`${TAG}: SUB_MULTIMEDIA_MEDIA_SOUNDPOOL_FUNCTION_MULTI_PLAY_EXCEEDED_MAXSTREAMS_0100 in`);
      try {
        let streamId_ = [];
        let soundId_ = [];
        let time = 0;
        let loadCount = 0;
        let sleepTotalTime = 0;
        await createSoundPool();
        soundPool.on('error', (error) => {
          console.error(`${TAG}: onError called! error happened, message is: ${error.message}`);
          expectFalse();
        })
        soundPool.on('loadComplete', (soundId_) => {
          console.info(`${TAG}: on loadComplete called, soundId: ${soundId_}`);
          loadCount++;
        })
        soundPool.on('playFinished', () => {
          console.info(`${TAG}: on playFinished called!`);
          time++;
        })
        soundId_[0] = await soundPool.load(fd1, 0, length1);
        soundId_[1] = await soundPool.load(fd2, length2 / 3, length2);
        soundId_[2] = await soundPool.load(uri3);
        soundId_[3] = await soundPool.load(fd4, length4 / 3, length4);
        while(loadCount != 4) {
          sleepTotalTime++;
          if(sleepTotalTime > 15){
            expectFalse();
            break;
          }
          await sleep(1000);
        }
        for (let i = 0; i < 4; i++) {
          streamId_[i] = await soundPool.play(soundId_[i]);
        }
        await sleep(8000);
        for (let i = 0; i < 4; i++) {
          await soundPool.stop(streamId_[i]);
        }
        for (let i = 0; i < 4; i++) {
          await soundPool.unload(soundId_[i]);
        }
        if (time == 4) {
          console.info(`${TAG}: four stream play success`);
        } else {
          console.info(`${TAG}: four stream play fail! time: ${time}`);
          expectFalse();
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
      }
      done();
      return;
    })
  })
}
