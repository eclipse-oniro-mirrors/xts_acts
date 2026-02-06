/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';
import featureAbility from '@ohos.ability.featureAbility';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

/**
 * This testcase works for:
 * interface CallMetadata
 * interface AVCallState
 * interface AVControlCommand
 * interface AVMetadata
 * interface AVPlaybackState
 */



let changedata: avSession.AVMetadata = {
  assetId : '9526',
  title: "lose yourself",
  artist: "Eminem",
  author: "ST",
  avQueueName: "session queuename",
  avQueueId: "session queueid",
  avQueueImage: "session queueimage",
  album: "Slim shady",
  writer: "ST",
  composer: "ST",
  duration: 2222,
  mediaImage: "https://www.example.com/example.jpg",
  publishDate: new Date(1994,1,1,1),
  subtitle: "8 Mile",
  description: "Rap",
  lyric: "lrc格式歌词内容",
  singleLyricText: "单条歌词内容",
  previousAssetId: "121277",
  nextAssetId: "121279",
  filter: 2,
  drmSchemes: ['123123','456456'],
  skipIntervals: 10,
  displayTags: 1
};

let playbackstate: avSession.AVPlaybackState = {
  state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
  speed: 1.0,
  position: {elapsedTime:10, updateTime:(new Date()).getTime()},
  bufferedTime: 1000,
  loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
  isFavorite: true,
  activeItemId: 123456,
  volume: 4,
  maxVolume: 15,
  muted: true,
  duration: 123,
  videoWidth: 30,
  videoHeight: 20,
  extras: {'EX': 'this is session ex'}
};

let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface Size_Pixel {
  height: number,
  width: number
}

interface Opts {
  editable: boolean,
  pixelFormat: number,
  size: Size_Pixel,
  AlphaType: number
};

interface callMetadata0 {
  name: string,
  phoneNumber: string,
  avatar?: ESObject
};

interface callMetadata1 {
  name: number
};

interface callMetadata2 {
  phoneNumber: number
};

interface callMetadata3 {
  avatar: number
};

interface callMetadata5 {
  name: string,
  phoneNumber: string
};

interface callMetadata6 {
  name: string
};

interface callMetadata7 {
  phoneNumber: string
};

interface callMetadataOne {
  name: string,
  phoneNumber: string
};

interface avCallState {
  state?: number | string,
  muted?: boolean | string,
};

interface callMetadata {
  name: string,
  phoneNumber: string
};

interface AVCallState {
  state: number,
  muted: boolean
};

let context: common.UIAbilityContext;


export default function abilityTest() {
  describe('AVSessionMetadata', () => {
    let TAG: string = "[AVSessionMetadata]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let receivedCallback1: boolean = false;
    let receivedCallback2: boolean = false;
    let tag: string = 'MetadataXTS';
    let assetId: string = 'assetIdTest';
    let assetId1: string = '';
    let assetId2: string = '';
    let assetId3: string = '~!@#$%^&*()_+{}:">?,./123456789'+'a'.repeat(40928);
    let assetId4: string = 'a'.repeat(40960)
    let assetId5: number = 123

    let getPixelMap = async () => {
      let color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      bufferArr.fill(3, 0, 95);
      let opts: Opts = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4, width: 6
        },
        AlphaType: 3
      };
      return image.createPixelMap(color, opts);
    }

    let callMetadataChangeCallback1 = (callMetadata: ESObject) => {
      console.info(`${TAG}: callMetadataChangeCallback1 received callMetadata: ${JSON.stringify(callMetadata)}`);
      if (callMetadata.name != '123456789' || callMetadata.phoneNumber != '65432111' || callMetadata.avatar != null) {
        console.error(`${TAG}: callMetadataChangeCallback1 received callMetadata unmatch`);
        expect().assertFail();
      }
      receivedCallback1 = true;
    }

    let callMetadataChangeCallback2 = (callMetadata: ESObject) => {
      console.info(`${TAG}: callMetadataChangeCallback2 received callMetadata: ${JSON.stringify(callMetadata)}`);
      if (callMetadata.name != '123456789' || callMetadata.phoneNumber != '65432111' || callMetadata.avatar != null) {
        console.error(`${TAG}: callMetadataChangeCallback2 received callMetadata unmatch`);
        expect().assertFail();
      }
      receivedCallback2 = true;
    }

    let callStateChangeCallback1 = (callState: ESObject) => {
      console.info(`${TAG}: callStateChangeCallback1 received callState: ${JSON.stringify(callState)}`);
      if (callState.state != avSession.CallState.CALL_STATE_WAITING || callState.muted) {
        console.error(`${TAG}: callStateChangeCallback1 received callState unmatch`);
        expect().assertFail();
      }
      receivedCallback1 = true;
    }

    let callStateChangeCallback2 = (callState: ESObject) => {
      console.info(`${TAG}: callStateChangeCallback2 received callState: ${JSON.stringify(callState)}`);
      if (callState.state != avSession.CallState.CALL_STATE_WAITING || callState.muted) {
        console.error(`${TAG}: callStateChangeCallback2 received callState unmatch`);
        expect().assertFail();
      }
      receivedCallback2 = true;
    }

    let answerCallback1 = () => {
      console.info(`${TAG}: answerCallback1 received`);
      receivedCallback1 = true;
    }

    let answerCallback2 = () => {
      console.info(`${TAG}: answerCallback2 received`);
      receivedCallback2 = true;
    }

    let hangUpCallback1 = () => {
      console.info(`${TAG}: hangUpCallback1 received`);
      receivedCallback1 = true;
    }

    let hangUpCallback2 = () => {
      console.info(`${TAG}: hangUpCallback2 received`);
      receivedCallback2 = true;
    }

    let toggleCallMuteCallback1 = () => {
      console.info(`${TAG}: toggleCallMuteCallback1 received`);
      receivedCallback1 = true;
    }

    let toggleCallMuteCallback2 = () => {
      console.info(`${TAG}: toggleCallMuteCallback2 received`);
      receivedCallback2 = true;
    }

    let playWithAssetIdCallback1 = (data: string) => {
      console.info(`${TAG}: playWithAssetIdCallback1 received ${data}`);
      assetId1 = data;
    }

    let playWithAssetIdCallback2 = (data: string) => {
      console.info(`${TAG}: playWithAssetIdCallback2 received ${data}`);
      assetId2 = data;
    }

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context, tag, 'voice_call').then((data) => {
        session = data;
        session.sessionType = 'voice_call';
        console.info(`${TAG}: avSession create success`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
      });
      await session.activate().then(() => {
        console.info(`${TAG}: Session activate`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
      });
      try {
        controller = await session.getController();
      } catch (err) {
        console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
      }
      await sleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
      if (session != null) {
        await session.destroy().then(() => {
          console.info(`${TAG}: Session destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Session is already destroy`);
      }
      if (controller != null) {
        await controller.destroy().then(() => {
          console.info(`${TAG}: Controller destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Controller is already destroy`);
      }
      console.info(`${TAG}: afterEach out`);
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll in`);
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0100
     * @tc.desc   Testing set callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let pixelMap = await getPixelMap();
      let readBuffer0 = new ArrayBuffer(96);
      await pixelMap.readPixelsToBuffer(readBuffer0);
      let bufferArr0 = new Uint8Array(readBuffer0);
      let callMetadata0: callMetadata0 = {
        name: '12345678',
        phoneNumber: '65432111',
        avatar: pixelMap
      };
      await session.setCallMetadata(callMetadata0).then(() => {
        console.info(`${TAG}: setCallMetadata set avatar successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      let pixMap: ESObject;
      await controller.getCallMetadata().then((data: ESObject) => {
        if (data.name === '12345678' && data.phoneNumber === '65432111') {
          console.info(`${TAG}: getCallMetadata get name and phoneNumber Successfully`);
        } else {
          console.info(`${TAG}: getCallMetadata get name and phoneNumber failed`);
          console.info(`${TAG}: name is: ${data.name}, phoneNumber is ${data.phoneNumber}`);
          expect(false).assertTrue();
          done();
        }
        pixMap = data.avatar;
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      let pixelSize: ESObject = pixMap.getPixelBytesNumber();
      console.info(`${TAG}: pixelSize is: ${pixelSize}`);
      let readBuffer = new ArrayBuffer(pixelSize);
      await pixMap.readPixelsToBuffer(readBuffer);
      let bufferArr2 = new Uint8Array(readBuffer);
      for (let i = 0; i < bufferArr2.length; i++) {
        expect(bufferArr0[i]).assertEqual(bufferArr2[i]);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0200
     * @tc.desc   Testing set error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata1: callMetadata1 = {
        name: 1
      };
      await session.setCallMetadata(callMetadata1).then(() => {
        console.info(`${TAG}: setCallMetadata with error callMetadata test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata with error, error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0300
     * @tc.desc   Testing set error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata2: callMetadata2 = {
        phoneNumber: 123
      };
      await session.setCallMetadata(callMetadata2).then(() => {
        console.info(`${TAG}: setCallMetadata with error callMetadata test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata with error, error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0400
     * @tc.desc   Testing set error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata3: callMetadata3 = {
        avatar: 1
      };
      await session.setCallMetadata(callMetadata3).then(() => {
        console.info(`${TAG}: setCallMetadata with error callMetadata test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata with error, error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0500
     * @tc.desc   Testing set error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata4: ESObject = {};
      await session.setCallMetadata(callMetadata4).then(() => {
        console.info(`${TAG}: setCallMetadata with error callMetadata test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata with error, error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0700
     * @tc.desc   Testing set name - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata6: callMetadata6 = {
        name: '12345678'
      };
      await session.setCallMetadata(callMetadata6).then(() => {
        console.info(`${TAG}: setCallMetadata set name successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata set name error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getCallMetadata().then((data: ESObject) => {
        console.info(`${TAG}: getCallMetadata get name , name:${data.name}.`);
        expect(data.name).assertEqual(callMetadata6.name);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getCallMetadata get name error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0800
     * @tc.desc   Testing set phoneNumber - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata7: callMetadata7 = {
        phoneNumber: '65432111'
      };
      await session.setCallMetadata(callMetadata7).then(() => {
        console.info(`${TAG}: setCallMetadata set phoneNumber successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata set phoneNumber error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getCallMetadata().then((data: ESObject) => {
        console.info(`${TAG}: getCallMetadata get phoneNumber is: ${data.phoneNumber}`);
        expect(data.phoneNumber).assertEqual(callMetadata7.phoneNumber); 
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getCallMetadata get phoneNumber error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0900
     * @tc.desc   Testing set avatar - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let pixelMap = await getPixelMap();
      let readBuffer0 = new ArrayBuffer(96);
      await pixelMap.readPixelsToBuffer(readBuffer0);
      let bufferArr0 = new Uint8Array(readBuffer0);
      let callMetadata8: ESObject = {
        avatar: pixelMap
      };
      await session.setCallMetadata(callMetadata8).then(() => {
        console.info(`${TAG}: setCallMetadata set avatar successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      let pixMap: ESObject;
      await controller.getCallMetadata().then((data: ESObject) => {
        pixMap = data.avatar;
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      let pixelSize: ESObject = pixMap.getPixelBytesNumber();
      console.info(`${TAG}: pixelSize is: ${pixelSize}`);
      let readBuffer = new ArrayBuffer(pixelSize);
      await pixMap.readPixelsToBuffer(readBuffer);
      let bufferArr2 = new Uint8Array(readBuffer);
      for (let i = 0; i < bufferArr2.length; i++) {
        expect(bufferArr0[i]).assertEqual(bufferArr2[i]);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0100
     * @tc.desc   Testing set callMetadata0 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let pixelMap = await getPixelMap();
        let readBuffer0 = new ArrayBuffer(96);
        await pixelMap.readPixelsToBuffer(readBuffer0);
        let bufferArr0 = new Uint8Array(readBuffer0);
        let callMetadata0: callMetadata0 = {
          name: '12345678',
          phoneNumber: '65432111',
          avatar: pixelMap
        };
        session.setCallMetadata(callMetadata0, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setCallMetadataCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setCallMetadataCallback set successfully`);
            let pixMap: ESObject;
            controller.getCallMetadata((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getCallMetadataCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
              } else {
                if (data.name === '12345678' && data.phoneNumber === '65432111') {
                  console.info(`${TAG}: getCallMetadataCallback get name and phoneNumber Successfully`);
                } else {
                  console.info(`${TAG}: getCallMetadataCallback failed, name is: ${data.name}, phoneNumber is ${data.phoneNumber}`);
                  expect(false).assertTrue();
                  done();
                }
                pixMap = data.avatar;
                let pixelSize: ESObject = pixMap.getPixelBytesNumber();
                console.info(`${TAG}: pixelSize is: ${pixelSize}`);
                let readBuffer = new ArrayBuffer(pixelSize);
                pixMap.readPixelsToBuffer(readBuffer);
                let bufferArr2 = new Uint8Array(readBuffer);
                for (let i = 0; i < bufferArr2.length; i++) {
                  expect(bufferArr0[i]).assertEqual(bufferArr2[i]);
                }
                done();
              }
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0200
     * @tc.desc   Testing set error callMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata1: callMetadata1 = {
        name: 1
      };
      try {
        await session.setCallMetadata(callMetadata1, (err: BusinessError, data: ESObject) => {
          console.info(`${TAG}: setCallMetadataCallback with error callMetadata test, error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        })
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0300
     * @tc.desc   Testing set error callMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata2: callMetadata2 = {
        phoneNumber: 123
      };
      try {
        await session.setCallMetadata(callMetadata2, (err: BusinessError, data: ESObject) => {
          console.info(`${TAG}: setCallMetadataCallback with error callMetadata test, error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        })
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0400
     * @tc.desc   Testing set error callMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata3: callMetadata3 = {
        avatar: 1
      };
      try {
        await session.setCallMetadata(callMetadata3, (err: BusinessError, data: ESObject) => {
          console.info(`${TAG}: setCallMetadataCallback with error callMetadata test, error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        })
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0500
     * @tc.desc   Testing set error callMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata4: ESObject = {};
      session.setCallMetadata(callMetadata4, (err: BusinessError, data: ESObject) => {
        console.info(`${TAG}: setCallMetadataCallback with error callMetadata test, error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0070
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0070
     * @tc.desc   Testing set name - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata6: callMetadata6 = {
        name: '12345678'
      };
      try {
        session.setCallMetadata(callMetadata6, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setCallMetadataCallback set name error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: setCallMetadataCallback set name successfully`);
            controller.getCallMetadata().then((data: ESObject) => {
              console.info(`${TAG}: getCallMetadata name is: ${data.name}`);
              expect(data.name).assertEqual(callMetadata6.name);
            }).catch((err: BusinessError) => {
              console.info(`${TAG}: getCallMetadata get name error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            });
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0080
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0080
     * @tc.desc   Testing set phoneNumber - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata7: callMetadata7 = {
        phoneNumber: '65432111'
      };
      try {
        session.setCallMetadata(callMetadata7, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setCallMetadataCallback set phoneNumber error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: setCallMetadataCallback set phoneNumber successfully`);
            controller.getCallMetadata().then((data: ESObject) => {
              console.info(`${TAG}: getCallMetadata get phoneNumber is: ${data.name}`);
              expect(data.phoneNumber).assertEqual(callMetadata7.phoneNumber);
            }).catch((err: BusinessError) => {
              console.info(`${TAG}: getCallMetadata get phoneNumber error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            });
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0090
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0090
     * @tc.desc   Testing set avatar - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let pixelMap = await getPixelMap();
        let readBuffer0 = new ArrayBuffer(96);
        await pixelMap.readPixelsToBuffer(readBuffer0);
        let bufferArr0 = new Uint8Array(readBuffer0);
        let callMetadata8: ESObject = {
          avatar: pixelMap
        };
        session.setCallMetadata(callMetadata8, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setCallMetadataCallback set avatar error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: setCallMetadataCallback set avatar successfully`);
            let pixMap: ESObject;
            controller.getCallMetadata((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getCallMetadataCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
              } else {
                pixMap = data.avatar;
                let pixelSize: ESObject = pixMap.getPixelBytesNumber();
                console.info(`${TAG}: pixelSize is: ${pixelSize}`);
                let readBuffer = new ArrayBuffer(pixelSize);
                pixMap.readPixelsToBuffer(readBuffer);
                let bufferArr2 = new Uint8Array(readBuffer);
                for (let i = 0; i < bufferArr2.length; i++) {
                  expect(bufferArr0[i]).assertEqual(bufferArr2[i]);
                }
              }
            })
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0100
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState0: avCallState = {
        state: avSession.CallState.CALL_STATE_ACTIVE,
        muted: true,
      };
      await session.setAVCallState(avCallState0).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        console.info(`${TAG}: getAVCallState, callState: ${JSON.stringify(data)}`);
        expect(data.state).assertEqual(avCallState0.state);
        expect(data.muted).assertEqual(avCallState0.muted);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0200
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState1: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: true,
      };
      await session.setAVCallState(avCallState1).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        console.info(`${TAG}: getAVCallState, callState: ${JSON.stringify(data)}`);
        expect(data.state).assertEqual(avCallState1.state);
        expect(data.muted).assertEqual(avCallState1.muted);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0300
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState2: avCallState = {
        state: avSession.CallState.CALL_STATE_INCOMING,
        muted: true,
      };
      await session.setAVCallState(avCallState2).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        console.info(`${TAG}: getAVCallState, callState: ${JSON.stringify(data)}`);
        expect(data.state).assertEqual(avCallState2.state);
        expect(data.muted).assertEqual(avCallState2.muted);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0400
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState3: avCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: true,
      };
      await session.setAVCallState(avCallState3).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        console.info(`${TAG}: getAVCallState, callState: ${JSON.stringify(data)}`);
        expect(data.state).assertEqual(avCallState3.state);
        expect(data.muted).assertEqual(avCallState3.muted);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0500
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState4: avCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: true,
      };
      await session.setAVCallState(avCallState4).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        console.info(`${TAG}: getAVCallState, callState: ${JSON.stringify(data)}`);
        expect(data.state).assertEqual(avCallState4.state);
        expect(data.muted).assertEqual(avCallState4.muted);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0600
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState5: avCallState = {
        state: avSession.CallState.CALL_STATE_HOLDING,
        muted: true,
      };
      await session.setAVCallState(avCallState5).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        console.info(`${TAG}: getAVCallState, callState: ${JSON.stringify(data)}`);
        expect(data.state).assertEqual(avCallState5.state);
        expect(data.muted).assertEqual(avCallState5.muted);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0700
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState6: avCallState = {
        state: avSession.CallState.CALL_STATE_DISCONNECTING,
        muted: true,
      };
      await session.setAVCallState(avCallState6).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        console.info(`${TAG}: getAVCallState, callState: ${JSON.stringify(data)}`);
        expect(data.state).assertEqual(avCallState6.state);
        expect(data.muted).assertEqual(avCallState6.muted);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0800
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState7: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: false,
      };
      await session.setAVCallState(avCallState7).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        console.info(`${TAG}: getAVCallState, callState: ${JSON.stringify(data)}`);
        expect(data.state).assertEqual(avCallState7.state);
        expect(data.muted).assertEqual(avCallState7.muted);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0900
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState8: avCallState = {
        state: -1,
        muted: true,
      };
      await session.setAVCallState(avCallState8).then(() => {
        console.info(`${TAG}: setAVCallState with error state test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState with error state test, error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1000
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState9: avCallState = {
        state: 8,
        muted: true,
      };
      await session.setAVCallState(avCallState9).then(() => {
        console.info(`${TAG}: setAVCallState with error state test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState with error state test, error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1100
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState10: avCallState = {
        state: '123',
        muted: true,
      };
      await session.setAVCallState(avCallState10).then(() => {
        console.info(`${TAG}: setAVCallState with error state test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState with error state test, error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1200
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState11: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: '123',
      };
      await session.setAVCallState(avCallState11).then(() => {
        console.info(`${TAG}: setAVCallState with error muted test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState with error state test, error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1400
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState13: avCallState = {
        state: avSession.CallState.CALL_STATE_DISCONNECTING,
      };
      await session.setAVCallState(avCallState13).then(() => {
        console.info(`${TAG}: setAVCallState without muted test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState with error state test, error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1500
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState14: avCallState = {
        muted: true,
      };
      await session.setAVCallState(avCallState14).then(() => {
        console.info(`${TAG}: setAVCallState without state test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState with error state test, error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0100
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState0: avCallState = {
        state: avSession.CallState.CALL_STATE_ACTIVE,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState0, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback success, state: ${data.state}, muted: ${data.muted}`);
                expect(data.state).assertEqual(avCallState0.state);
                expect(data.muted).assertEqual(avCallState0.muted);
              }
            })
            done();
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0200
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState1: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState1, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback success, state: ${data.state}, muted: ${data.muted}`);
                expect(data.state).assertEqual(avCallState1.state);
                expect(data.muted).assertEqual(avCallState1.muted);
              }
            })
            done();
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0300
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState2: avCallState = {
        state: avSession.CallState.CALL_STATE_INCOMING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState2, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback success, state: ${data.state}, muted: ${data.muted}`);
                expect(data.state).assertEqual(avCallState2.state);
                expect(data.muted).assertEqual(avCallState2.muted);
              }
            })
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0400
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState3: avCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState3, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback success, state: ${data.state}, muted: ${data.muted}`);
                expect(data.state).assertEqual(avCallState3.state);
                expect(data.muted).assertEqual(avCallState3.muted);
              }
            })
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0500
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState4: avCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState4, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback success, state: ${data.state}, muted: ${data.muted}`);
                expect(data.state).assertEqual(avCallState4.state);
                expect(data.muted).assertEqual(avCallState4.muted);
              }
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0600
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState5: avCallState = {
        state: avSession.CallState.CALL_STATE_HOLDING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState5, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback success, state: ${data.state}, muted: ${data.muted}`);
                expect(data.state).assertEqual(avCallState5.state);
                expect(data.muted).assertEqual(avCallState5.muted);
              }
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0700
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState6: avCallState = {
        state: avSession.CallState.CALL_STATE_DISCONNECTING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState6, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback success, state: ${data.state}, muted: ${data.muted}`);
                expect(data.state).assertEqual(avCallState6.state);
                expect(data.muted).assertEqual(avCallState6.muted);
              }
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0800
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState7: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: false,
      };
      try {
        session.setAVCallState(avCallState7, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback success, state: ${data.state}, muted: ${data.muted}`);
                expect(data.state).assertEqual(avCallState7.state);
                expect(data.muted).assertEqual(avCallState7.muted);
              }
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0900
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState8: avCallState = {
        state: -1,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState8, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback with error state, error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${TAG}: setAVCallStateCallback with error state test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1000
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState9: avCallState = {
        state: 8,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState9, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback with error state, error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${TAG}: setAVCallStateCallback with error state test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1100
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState10: avCallState = {
        state: '123',
        muted: true,
      };
      try {
        session.setAVCallState(avCallState10, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback with error state, error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${TAG}: setAVCallStateCallback with error state test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1200
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState11: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: '123',
      };
      try {
        session.setAVCallState(avCallState11, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback with error state, error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${TAG}: setAVCallStateCallback with error muted test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1400
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState13: avCallState = {
        state: avSession.CallState.CALL_STATE_DISCONNECTING,
      };
      try {
        session.setAVCallState(avCallState13, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback with error state, error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${TAG}: setAVCallStateCallback without muted test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1500
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState14: avCallState = {
        muted: false,
      };
      try {
        session.setAVCallState(avCallState14, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback with error state, error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${TAG}: setAVCallStateCallback without state test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0100
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
          if (callMetadata.name != '12345678' || callMetadata.phoneNumber != '65432111' ||
            callMetadata.avatar != null) {
            console.error(`${TAG}: on callMetadataChange received callMetadata unmatch`);
            expect(false).assertTrue();
          } 
          done();
        });
        await session.setCallMetadata(callMetadata);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0200
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '12345678',
        phoneNumber: '654321111'
      };
      try {
        controller.on('callMetadataChange', 'all', (callMetadata: ESObject) => {
          console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
          if (callMetadata.name != '12345678' || callMetadata.phoneNumber != '654321111' ||
            callMetadata.avatar != null) {
            console.error(`${TAG}: on callMetadataChange received callMetadata unmatch`);
            expect(false).assertTrue();
          } 
          done();
        });
        await session.setCallMetadata(callMetadata);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0300
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      let flag = false;
      try {
        controller.on('callMetadataChange', 'all', (callMetadata: ESObject) => {
          console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
          flag = true;
        });
        await controller.off('callMetadataChange');
        await session.setCallMetadata(callMetadata);
        await sleep(500);
        expect(flag).assertFalse();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0400
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '123456789',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback1);
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback2);
        await session.setCallMetadata(callMetadata).catch((err: BusinessError) => {
          console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        console.log(`${TAG}: on callMetadataChange 1 received: ${receivedCallback1}`);
        console.log(`${TAG}: on callMetadataChange 2 received: ${receivedCallback2}`);
        expect(receivedCallback1).assertTrue();
        expect(receivedCallback2).assertTrue();
        
        receivedCallback1 = false;
        receivedCallback2 = false;
        await controller.off('callMetadataChange');
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0500
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '123456789',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback1);
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback2);
        await controller.off('callMetadataChange', callMetadataChangeCallback1);
        await session.setCallMetadata(callMetadata).catch((err: BusinessError) => {
          console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
        });
        await sleep(500);
        console.log(`${TAG}: on callMetadataChange 1 received: ${receivedCallback1}`);
        console.log(`${TAG}: on callMetadataChange 2 received: ${receivedCallback2}`);
        expect(receivedCallback1).assertFalse();
        expect(receivedCallback2).assertTrue();

        receivedCallback1 = false;
        receivedCallback2 = false;
        await controller.off('callMetadataChange');
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0600
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '123456789',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback1);
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback2);
        await controller.off('callMetadataChange');
        await session.setCallMetadata(callMetadata).catch((err: BusinessError) => {
          console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
        });
        await sleep(500);
        console.log(`${TAG}: on callMetadataChange 1 received: ${receivedCallback1}`);
        console.log(`${TAG}: on callMetadataChange 2 received: ${receivedCallback2}`);
        expect(receivedCallback1).assertEqual(false);
        expect(receivedCallback2).assertEqual(false);

        receivedCallback1 = false;
        receivedCallback2 = false;
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0700
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '123456789',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['avatar'];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.info(`${TAG}: on callMetadataChange called!`);
          if (callMetadata.avatar != null || callMetadata.name != null || callMetadata.phoneNumber != null) {
            console.info(`${TAG}: callMetadata is not empty, test failed! callMetadata: ${JSON.stringify(callMetadata)}`);
            expect(false).assertTrue();
          } 
          done();
        });
        await session.setCallMetadata(callMetadata);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_1000
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        controller.on(-1, 'all', (callMetadata: ESObject) => {
          console.error(`${TAG}: on callMetadataChange called, test failed!`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`${TAG}: on callMetadataChange with error metadata, error: code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0100
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: false
      };
      try {
        let state = ['state'];
        controller.on('callStateChange', state, (callState: ESObject) => {
          console.info(`on callStateChange callState : ${JSON.stringify(callState)}`);
          if (callState.state != avSession.CallState.CALL_STATE_DIALING || callState.muted != null) {
            console.error(`${TAG}: on callStateChange received callState unmatch`);
            expect(false).assertTrue();
          }
          done();
        });
        await session.setAVCallState(AVCallState);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0200
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_INCOMING,
        muted: true
      };
      try {
        controller.on('callStateChange', 'all', (callState: ESObject) => {
          console.info(`on callStateChange callState : ${JSON.stringify(callState)}`);
          if (callState.state != avSession.CallState.CALL_STATE_INCOMING || !callState.muted) {
            console.error(`${TAG}: on callStateChange received callState unmatch`);
            expect(false).assertTrue();
          }
          done();
        });
        await session.setAVCallState(AVCallState);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0300
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_HOLDING,
        muted: true
      };
      let flag = false;
      try {
        controller.on('callStateChange', 'all', (stateChange: ESObject) => {
          console.info(`on callStateChange stateChange : ${JSON.stringify(stateChange)}`);
          flag = true;
        });
        await controller.off('callStateChange');
        await session.setAVCallState(AVCallState);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: callStateChange off fail, on callStateChange called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: callStateChange off`);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0400
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: false
      };
      try {
        controller.on('callStateChange', 'all', callStateChangeCallback2);
        controller.on('callStateChange', 'all', callStateChangeCallback1);
        await session.setAVCallState(AVCallState).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on callStateChange called!`);
        } else {
          console.error(`${TAG}: on callStateChange not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await controller.off('callStateChange');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0500
     * @tc.desc   Testing on('callStateChange')f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: false
      };
      try {
        controller.on('callStateChange', 'all', callStateChangeCallback2);
        controller.on('callStateChange', 'all', callStateChangeCallback1);
        await controller.off('callStateChange', callStateChangeCallback2);
        await session.setAVCallState(AVCallState).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off callStateChange success and on callStateChange called!`);
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await controller.off('callStateChange');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0600
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: false
      };
      try {
        controller.on('callStateChange', 'all', callStateChangeCallback2);
        controller.on('callStateChange', 'all', callStateChangeCallback1);
        await controller.off('callStateChange');
        await session.setAVCallState(AVCallState).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off callStateChange success!`);
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0700
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: false
      };
      try {
        let state = ['state'];
        controller.on('callStateChange', state, (callState: ESObject) => {
          console.info(`on callStateChange called, callState : ${JSON.stringify(callState)}`);
          if (callState.state != avSession.CallState.CALL_STATE_DIALING || callState.muted != null) {
            console.info(`${TAG}: on callStateChange test failed!`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: on callStateChange test success, muted is empty`);
          }
          done();
        });
        await session.setAVCallState(AVCallState);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_1000
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        controller.on(-1, 'all', (stateChange: ESObject) => {
          console.info(`${TAG}: on callStateChange with error param test failed! stateChange: ${JSON.stringify(stateChange)}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 401) {
          console.info(`${TAG}: on callStateChange with error param test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on callStateChange errorCode != 401, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0100
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      let flag = false;
      try {
        await session.on('answer', () => {
          console.info(`${TAG}: on answer called`);
          flag = true;
        });
        await controller.sendControlCommand(command);
        await sleep(300);
        expect(flag).assertTrue();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0200
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      let flag = false;
      try {
        session.on('answer', () => {
          console.info(`${TAG}: on answer called`);
          flag = true;
        });
        await session.off('answer');
        await controller.sendControlCommand(command);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: answer off fail, on answer called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: answer off`);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0300
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      try {
        session.on('answer', answerCallback1);
        session.on('answer', answerCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on answer called!`);
        } else {
          console.error(`${TAG}: on answer not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('answer');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0400
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      try {
        session.on('answer', answerCallback1);
        session.on('answer', answerCallback2);
        await session.off('answer', answerCallback1);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: off answer success and on answer called!`);
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('answer');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0500
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      try {
        session.on('answer', answerCallback1);
        session.on('answer', answerCallback2);
        await session.off('answer');
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: answer off called`);
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0700
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        session.on('123456', () => {
          console.info(`${TAG}: on answer called`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 401) {
          console.info(`${TAG}: on answer with error param test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on answer errorCode != 401, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0100
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      let flag = false;
      try {
        session.on('hangUp', () => {
          console.info(`${TAG}: on hangUp called`);
          flag = true;
        });
        await controller.sendControlCommand(command);
        await sleep(200);
        expect(flag).assertTrue();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0200
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      let flag = false;
      try {
        session.on('hangUp', () => {
          console.info(`${TAG}: on hangUp called`);
          flag = true;
        });
        await session.off('hangUp');
        await controller.sendControlCommand(command);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: hangUp off fail, on hangUp called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: hangUp off`);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0300
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      try {
        session.on('hangUp', hangUpCallback1);
        session.on('hangUp', hangUpCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on hangUp called!`);
        } else {
          console.error(`${TAG}: on hangUp not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('hangUp');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0400
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      try {
        session.on('hangUp', hangUpCallback1);
        session.on('hangUp', hangUpCallback2);
        await session.off('hangUp', hangUpCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off hangUp success and on hangUp called!`);
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('hangUp');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0500
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      try {
        session.on('hangUp', hangUpCallback1);
        session.on('hangUp', hangUpCallback2);
        await session.off('hangUp');
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: hangUp off called`);
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0100
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      try {
        session.on('toggleCallMute', () => {
          console.info(`${TAG}: on toggleCallMute called`);
          done();
        });
        await controller.sendControlCommand(command);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0200
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      let flag = false;
      try {
        session.on('toggleCallMute', () => {
          console.info(`${TAG}: on toggleCallMute called`);
          flag = true;
        });
        session.off('toggleCallMute');
        await controller.sendControlCommand(command);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: toggleCallMute off fail, on toggleCallMute called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: toggleCallMute off`);
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0300
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      try {
        session.on('toggleCallMute', toggleCallMuteCallback1);
        session.on('toggleCallMute', toggleCallMuteCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on toggleCallMute called!`);
        } else {
          console.error(`${TAG}: on toggleCallMute not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('toggleCallMute');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0400
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      try {
        session.on('toggleCallMute', toggleCallMuteCallback1);
        session.on('toggleCallMute', toggleCallMuteCallback2);
        await session.off('toggleCallMute', toggleCallMuteCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off toggleCallMute success and on toggleCallMute called!`);
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('toggleCallMute');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0500
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      try {
        session.on('toggleCallMute', toggleCallMuteCallback1);
        session.on('toggleCallMute', toggleCallMuteCallback2);
        await session.off('toggleCallMute');
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: toggleCallMute off called`);
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0100
     * @tc.desc   Testing on('playWithAssetId') -- one on function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', (data: string) => {
          console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
          expect(data === assetId).assertTrue();
          done();
        });
        await controller.sendControlCommand(command)
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0200
     * @tc.desc   Testing on('playWithAssetId') -- many on functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', playWithAssetIdCallback1);
        session.on('playWithAssetId', playWithAssetIdCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if ((assetId1 === assetId) && (assetId2 === assetId)) {
          console.log(`${TAG}: on playWithAssetId called`);
        } else {
          console.error(`${TAG}: on playWithAssetId not received`);
          expect(false).assertTrue();
        }
        assetId1 = '';
        assetId2 = '';
        await session.off('playWithAssetId');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0200
     * @tc.desc   Testing off('playWithAssetId') -- off select on functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', playWithAssetIdCallback1);
        session.on('playWithAssetId', playWithAssetIdCallback2);
        await session.off('playWithAssetId', playWithAssetIdCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (assetId2 === assetId) {
          console.log(`${TAG}: on playWithAssetId called`);
          expect(false).assertTrue();
        } else {
          console.error(`${TAG}: on playWithAssetId not received`);
        }
        assetId1 = '';
        assetId2 = '';
        await session.off('playWithAssetId');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1200
     * @tc.desc   Testing sendControlCommand(command)-promise-special characters &max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId3
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId3 = ${data}`);
            expect(data == assetId3).assertTrue();
            session.off('playWithAssetId')
            done();
          });
        await controller.sendControlCommand(command);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1300
     * @tc.desc   Testing sendControlCommand(command)-promise-exceed max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId4
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId4 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1400
     * @tc.desc   Testing sendControlCommand(command)-promise-with no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1500
     * @tc.desc   Testing sendControlCommand(command)-promise-type error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId5
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId5 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1600
     * @tc.desc   Testing sendControlCommand(command)-promise-parameter to None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId1
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId1 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1200
     * @tc.desc   Testing sendControlCommand(command)-callback-special characters &max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId3
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId3 = ${data}`);
            expect(data == assetId3).assertTrue();
            session.off('playWithAssetId')
            done();
          });
        await controller.sendControlCommand(command, (err: BusinessError) => {
          if (err) {
            console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
          } else {
            console.info('SendControlCommand successfully');
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1300
     * @tc.desc   Testing sendControlCommand(command)-callback-exceed max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId4
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId4 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command, (err: BusinessError) => {
            if (err) {
              console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.info('SendControlCommand successfully');
            }
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1400
     * @tc.desc   Testing sendControlCommand(command)-callback-with no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command, (err: BusinessError) => {
            if (err) {
              console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.info('SendControlCommand successfully');
            }
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1500
     * @tc.desc   Testing sendControlCommand(command)-callback-type error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId5
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId5 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command, (err: BusinessError) => {
            if (err) {
              console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.info('SendControlCommand successfully');
            }
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1600
     * @tc.desc   Testing sendControlCommand(command)-callback-parameter to None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId1
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId1 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command, (err: BusinessError) => {
            if (err) {
              console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.info('SendControlCommand successfully');
            }
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0400
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0400
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;

      await controller.on('metadataChange', 'all', (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });

      await session.setAVMetadata(changedata);
      await session.setAVMetadata(changedata);
      await sleep(300);

      if (flag == 2) {
        console.info(`metadatachange all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0500
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0500
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;

      await controller.on('metadataChange', 'all', (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });
      await session.setAVMetadata(changedata);

      let changedata1: avSession.AVMetadata = {
        assetId : '9527',
        title: "lose yourself1",
        artist: "Eminem1",
        author: "ST1",
        avQueueName: "session queuename1",
        avQueueId: "session queueid1",
        avQueueImage: "session queueimage1",
        album: "Slim shady1",
        writer: "ST1",
        composer: "ST1",
        duration: 22221,
        mediaImage: "https://www.example.com/example.jpg1",
        publishDate: new Date(1994,1,1,2),
        subtitle: "8 Mile1",
        description: "Rap1",
        lyric: "lrc格式歌词内容1",
        singleLyricText: "单条歌词内容1",
        previousAssetId: "1212771",
        nextAssetId: "1212791",
        filter: 3,
        drmSchemes: ['123123','4564561'],
        skipIntervals: 15,
        displayTags: 1
      };

      await session.setAVMetadata(changedata1);
      await sleep(300);

      if (flag !== 2) {
        console.info(`metadatachange changeall failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0600
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0600
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = ['assetId','title','artist','author','avQueueName','avQueueId','avQueueImage',
        'album','writer','composer','duration','mediaImage','publishDate','subtitle',
        'description','lyric','singleLyricText','previousAssetId','nextAssetId',
        'filter','drmSchemes','skipIntervals','displayTags']
      let flag = 0;

      await controller.on('metadataChange', filter, (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });

      await session.setAVMetadata(changedata);

      let changedata1: avSession.AVMetadata = {
        assetId : '9527',
        title: "lose yourself1",
        artist: "Eminem1",
        author: "ST1",
        avQueueName: "session queuename1",
        avQueueId: "session queueid1",
        avQueueImage: "session queueimage1",
        album: "Slim shady1",
        writer: "ST1",
        composer: "ST1",
        duration: 22221,
        mediaImage: "https://www.example.com/example.jpg1",
        publishDate: new Date(1994,1,1,2),
        subtitle: "8 Mile1",
        description: "Rap1",
        lyric: "lrc格式歌词内容1",
        singleLyricText: "单条歌词内容1",
        previousAssetId: "1212771",
        nextAssetId: "1212791",
        filter: 3,
        drmSchemes: ['123123','4564561'],
        skipIntervals: 15,
        displayTags: 1
      };

      await session.setAVMetadata(changedata1);

      await sleep(300);

      if (flag !== 2) {
        console.info(`metadatachange filter changeall failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0700
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0700
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = ['assetId','title','artist','author','avQueueName','avQueueId','avQueueImage',
        'album','writer','composer','duration','mediaImage','publishDate','subtitle',
        'description','lyric','singleLyricText','previousAssetId','nextAssetId',
        'filter','drmSchemes','skipIntervals','displayTags']
      let flag = 0;

      await controller.on('metadataChange', filter, (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });

      await session.setAVMetadata(changedata);
      await session.setAVMetadata(changedata);
      await sleep(300);

      if (flag == 2) {
        console.info(`metadatachange filter all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0800
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0800
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = []
      let flag = 0;

      await controller.on('metadataChange', filter, (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });
      await session.setAVMetadata(changedata);
      await session.setAVMetadata(changedata);
      await sleep(300);

      if (flag == 2) {
        console.info(`metadatachange filter None failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0400
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0400
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;

      await controller.on('playbackStateChange', 'all', (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);
      await session.setAVPlaybackState(playbackstate);
      await sleep(300);

      if (flag !== 2) {
        console.info(`playbackStateChange all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0500
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0500
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;

      await controller.on('playbackStateChange', 'all', (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);

      let playbackstate1: avSession.AVPlaybackState = {
        state: 3,
        speed: 1.5,
        position: {elapsedTime:10, updateTime:(new Date()).getTime()},
        bufferedTime: 2000,
        loopMode: 2,
        isFavorite: false,
        activeItemId: 123457,
        volume: 5,
        maxVolume: 10,
        muted: false,
        duration: 124,
        videoWidth: 40,
        videoHeight: 50,
        extras: {'EX': 'this is session ex1'}
      };

      await session.setAVPlaybackState(playbackstate1);
      await sleep(300);

      if (flag !== 2) {
        console.info(`playbackStateChange changeall failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0600
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0600
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = ['state','speed','position','bufferedTime','loopMode','isFavorite','activeItemId',
        'volume','maxVolume','muted','duration','videoWidth','videoHeight','extras']
      let flag = 0;

      await controller.on('playbackStateChange', filter, (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);

      let playbackstate1: avSession.AVPlaybackState = {
        state: 3,
        speed: 1.5,
        position: {elapsedTime:10, updateTime:(new Date()).getTime()},
        bufferedTime: 2000,
        loopMode: 2,
        isFavorite: false,
        activeItemId: 123457,
        volume: 5,
        maxVolume: 10,
        muted: false,
        duration: 124,
        videoWidth: 40,
        videoHeight: 50,
        extras: {'EX': 'this is session ex1'}
      };

      await session.setAVPlaybackState(playbackstate1);
      await sleep(300);
      if (flag !== 2) {
        console.info(`playbackStateChange filter changeall failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0700
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0700
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = ['state','speed','position','bufferedTime','loopMode','isFavorite','activeItemId',
        'volume','maxVolume','muted','duration','videoWidth','videoHeight','extras']
      let flag = 0;

      await controller.on('playbackStateChange', filter, (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);
      await session.setAVPlaybackState(playbackstate);
      await sleep(300);

      if (flag !== 2) {
        console.info(`playbackStateChange filter all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0800
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0800
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = []
      let flag = 0;

      await controller.on('playbackStateChange', filter, (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);
      await session.setAVPlaybackState(playbackstate);
      await sleep(300);

      if (flag == 2) {
        console.info(`playbackStateChange filter all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0100
     * @tc.desc   Testing off playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await controller.off('playbackStateChange');
      }catch(err){
        console.info(`playbackStateChange off failed flag : ${err.code}  ${err.message}`)
        expect().assertFail()
      }

      await sleep(300);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0200
     * @tc.desc   Testing off playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await controller.off('playbackStateChange');
      }catch(err){
        console.info(`playbackStateChange off failed flag : ${err.code}  ${err.message}`)
        expect().assertFail()
      }

      await sleep(300);

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:
        'start中文ハッハッBonjour|Guten Tag.*&……（@@愛愛हह안녕하세요ههههها ها ها ها' +
          '英文环境：    Test1~ !@#$%^&()_+-{}[] .\n' +
          '中文环境：  \\  /Test1~ !@ #$%^&()_+-{}[].~！@#￥%……&（）——-+{}【】、：“”\n' +
          '繁体字：鸞、嵐、濫、藍、襤、臘、蠟、來、爐、盧、蘆、虜、魯、鷺、魯、鷺、葉等；\n'+
          '其他国家语言：Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω\n' +
          'α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ σ τ υ φ χ ψ ωā á ǎ à ē é ě è ī í ǐ ì ō ó ǒ ò ū ú ǔ ù ǖ ǘ ǚ ǜ üΑ Β Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω\n' +
          'α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ σ τ υ φ χ ψ ω\n' +
          '═ ║ ╒ ╓ ╔ ╕ ╖ ╗ ╘ ╙ ╚ ╛ ╜ ╝ ╞ ╟ ╠ ╡ ╢ ╣ ╤ ╥ ╦ ╧ ╨ ╩ ╪ ╫ ╬\n'
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set singleLyricText successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:
        '>~·！@#￥%……&amp;【】{}’‘“”《》。、？「」『』é「」「」—…×%\n' +
          'абвгдеёжзийклмнопрстуфхцчшщъыьэюя\n' +
          'が ぎゃ ご ぎょ ご ぎょ ぐ ぎゅ ぐ ぎ\n' +
          '测试~·！@#￥%……&amp;*（）——-{【}】|、：；“”’‘《，》。？、' +
          '〒※→①' +
          'ё !№ % : ? * () _' +
          '(ü)[{]}[})()[]{}(_)(-).echoの⊙◇--__(paddinggg' +
          'lgt' +
          '&lt;测试&gt;&lt;/测试&gt;'+
          'ç´іѳѣѵѷѕѯѱѡѫѧѭѩㅏㅑㅓㅕㅗㅛㅜㅠㅡㅣㄱ가갸거겨고교구규그기㉠㉡㉢㉣㉤㉥㉦㉧㉨㉩㉪㉫㉬㉭㉮㉯㉰㉱㉲㉳㉴㉵㉶㉷㉸㉹㉺㉻㈀㈁㈂㈃㈄㈅㈆㈇㈈㈉㈊㈋㈌㈍㈎㈏㈐'+
          '\\\'\r\n\t\b\\\f\v\\\x11\\\u1111'
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set singleLyricText successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:''
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set singleLyricText successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2800
     * @tc.desc   test too long singleLyricText(length =40959 which is the permitted max length)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:str.substring(1,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set singleLyricText successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        console.info(`TestLog: data.singleLyricText is ${data.singleLyricText}`);
        console.info(`TestLog: input singleLyricText is ${metadata.singleLyricText}`);
        expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2900
     * @tc.desc   test too long singleLyricText(length =40960 while the permitted max length is 40959)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set singleLyricText successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        console.info(`TestLog: data.singleLyricText is ${data.singleLyricText}`);
        console.info(`TestLog: input singleLyricText is ${metadata.singleLyricText}`);
        expect(data.singleLyricText).assertEqual(undefined);
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG="[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2100]";
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:
        'start中文ハッハッBonjour|Guten Tag.*&……（@@愛愛हह안녕하세요ههههها ها ها ها' +
          '英文环境：    Test1~ !@#$%^&()_+-{}[] .\n' +
          '中文环境：  \\  /Test1~ !@ #$%^&()_+-{}[].~！@#￥%……&（）——-+{}【】、：“”\n' +
          '繁体字：鸞、嵐、濫、藍、襤、臘、蠟、來、爐、盧、蘆、虜、魯、鷺、魯、鷺、葉等；\n'+
          '其他国家语言：Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω\n' +
          'α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ σ τ υ φ χ ψ ωā á ǎ à ē é ě è ī í ǐ ì ō ó ǒ ò ū ú ǔ ù ǖ ǘ ǚ ǜ üΑ Β Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω\n' +
          'α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ σ τ υ φ χ ψ ω\n' +
          '═ ║ ╒ ╓ ╔ ╕ ╖ ╗ ╘ ╙ ╚ ╛ ╜ ╝ ╞ ╟ ╠ ╡ ╢ ╣ ╤ ╥ ╦ ╧ ╨ ╩ ╪ ╫ ╬\n'
      };
      try {
        session.setAVMetadata(metadata, (err:BusinessError) => {
          if (err) {
            console.info(`${TAG}TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
        controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
          if (err) {
            console.info(`${TAG}TestLog: getAVMetadata singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
          if (data) {
            console.info(`${TAG}TestLog: getAVMetadata singleLyricText Successfully`);
            expect(data.assetId).assertEqual(metadata.assetId);
            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
          } else {
            console.info(`${TAG}TestLog: getAVMetadata singleLyricText failed:${data}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
      } catch (err) {
        console.info(`${TAG}TestLog: set & get avmetadata singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG="[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2200]";
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:
        '>~·！@#￥%……&amp;【】{}’‘“”《》。、？「」『』é「」「」—…×%\n' +
          'абвгдеёжзийклмнопрстуфхцчшщъыьэюя\n' +
          'が ぎゃ ご ぎょ ご ぎょ ぐ ぎゅ ぐ ぎ\n' +
          '测试~·！@#￥%……&amp;*（）——-{【}】|、：；“”’‘《，》。？、' +
          '〒※→①' +
          'ё !№ % : ? * () _' +
          '(ü)[{]}()[]{}(_)(-).echoの⊙◇--__(paddinggg' +
          'lgt' +
          '&lt;测试&gt;&lt;/测试&gt;'+
          'ç´іѳѣѵѷѕѯѱѡѫѧѭѩㅏㅑㅓㅕㅗㅛㅜㅠㅡㅣㄱ가갸거겨고교구규그기㉠㉡㉢㉣㉤㉥㉦㉧㉨㉩㉪㉫㉬㉭㉮㉯㉰㉱㉲㉳㉴㉵㉶㉷㉸㉹㉺㉻㈀㈁㈂㈃㈄㈅㈆㈇㈈㈉㈊㈋㈌㈍㈎㈏㈐'+
          '\\\'\r\n\t\b\\\f\v\\\x11\\\u1111'
      };
      try {
        session.setAVMetadata(metadata, (err:BusinessError) => {
          if (err) {
            console.info(`${TAG}TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
        controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
          if (err) {
            console.info(`${TAG}TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}TestLog: Get singleLyricText data ${data.singleLyricText}`);
            expect(data.assetId).assertEqual(metadata.assetId);
            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
          }
        })
        await sleep(200);
      } catch (err) {
        console.info(`${TAG}TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG="[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2300]";
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:''
      };
      try {
        session.setAVMetadata(metadata, (err:BusinessError) => {
          if (err) {
            console.info(`${TAG}TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
        controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
          if (err) {
            console.info(`${TAG}TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else if (data) {
            console.info(`${TAG}TestLog: Get singleLyricText Successfully`);
            expect(data.assetId).assertEqual(metadata.assetId);
            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
          } else {
            console.info(`${TAG}TestLog: Get singleLyricText failed:${data}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
      } catch (err) {
        console.info(`${TAG}TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG="[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2400]";
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:str.substring(0,40959)
      };
      try {
        session.setAVMetadata(metadata, (err:BusinessError) => {
          if (err) {
            console.info(`${TAG}TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
        controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
          if (err) {
            console.info(`${TAG}TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else if (data) {
            console.info(`${TAG}TestLog: Get singleLyricText Successfully`);
            expect(data.assetId).assertEqual(metadata.assetId);
            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
          } else {
            console.info(`${TAG}TestLog: Get singleLyricText failed:${data}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
      } catch (err) {
        console.info(`${TAG}TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG="[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2500]";
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        singleLyricText:str.substring(0,40960)
      };
      try {
        session.setAVMetadata(metadata, (err:BusinessError) => {
          if (err) {
            console.info(`${TAG}TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          } else{
            console.info(`${TAG}TestLog: check input parm metadata failed.`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
      } catch (err) {
        console.info(`${TAG}TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG="[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2600]";
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        filter : avSession.ProtocolType.TYPE_CAST_PLUS_AUDIO
      };
      try {
        session.setAVMetadata(metadata, (err:BusinessError) => {
          if (err) {
            console.info(`${TAG}TestLog: Set metadata filter = TYPE_CAST_PLUS_AUDIO error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
        controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
          if (err) {
            console.info(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else if (data) {
            console.info(`${TAG}TestLog: Get filter Successfully`);
            expect(data.assetId).assertEqual(metadata.assetId);
            expect(data.filter).assertEqual(metadata.filter);
          } else {
            console.info(`${TAG}TestLog: Get avmetadata with filter failed:${data}`);
            expect(false).assertTrue();
          }
        })
        await sleep(200);
      } catch (err) {
        console.info(`${TAG}TestLog: set & get filter error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_3000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_3000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG="[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_3000]";
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        filter : avSession.ProtocolType.TYPE_CAST_PLUS_AUDIO
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info(`${TAG}TestLog: Set filter successfully`);
      }).catch((err:BusinessError) => {
        console.error(`${TAG}TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.filter).assertEqual(metadata.filter);
      }).catch((err:BusinessError) => {
        console.error(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        album:str.substring(0,40960),
        title: 'this is a title'
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set album Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        artist:str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set artist Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        author:str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set author Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        avQueueId:str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set avQueueId error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set avQueueId Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        composer:str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set composer Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        description:str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set description error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set description Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        lyric: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set lyric Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        mediaImage: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set mediaImage Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        nextAssetId: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set nextAssetId error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set nextAssetId Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        subtitle: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set subtitle Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        writer: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set writer Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        previousAssetId: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set previousAssetId error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set previousAssetId Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        avQueueName: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set avQueueName error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set avQueueName Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        avQueueImage: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata, (err:BusinessError) => {
        if (err) {
          console.info(`TestLog: Set avQueueImage error: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(`TestLog: Set avQueueImage Successfully `);
          expect(false).assertTrue();
          done();
        }
      })
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        album: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set album successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        artist: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set artist successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        author: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set author successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        avQueueId: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set avQueueId successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set avQueueId error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        composer: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set composer successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        description: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set description successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set description error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        lyric: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set lyric successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        mediaImage: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set mediaImage successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        nextAssetId: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set nextAssetId successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set nextAssetId error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        subtitle: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set subtitle successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        writer: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set writer successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        previousAssetId: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set previousAssetId successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set previousAssetId error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        avQueueName: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set avQueueName successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set avQueueName error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const str = 'a'.repeat(40960)
      let metadata:avSession.AVMetadata = {
        assetId: '121278',
        avQueueImage: str.substring(0,40960)
      };
      await session.setAVMetadata(metadata).then(() => {
        console.info('TestLog: Set avQueueImage successfully');
      }).catch((err:BusinessError) => {
        console.error(`TestLog: Set avQueueImage error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


  })
}





