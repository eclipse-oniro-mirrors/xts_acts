/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { Key, KeyEvent } from '@kit.InputKit';
import deviceInfo from '@ohos.deviceInfo';

let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let context: common.UIAbilityContext;


export default function abilityTest() {
  describe('AVSessionCore', () => {
    let TAG: string = "[AVSessionCore]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'AVSessionCoreXTS';
    let keyItem: Key = {code:0x49, pressedTime:2, deviceId:0};
    let event:KeyEvent = {id:1, deviceId:0, actionTime:1, screenId:1, windowId:1, action:2, key:keyItem, unicodeChar:0, keys:[keyItem], ctrlKey:false, altKey:false, shiftKey:false, logoKey:false, fnKey:false, capsLock:false, numLock:false, scrollLock:false};
    let event1: string = 'aaa'
    let customdata: Record<string,string> = {'customData': 'appdata'}
    let eventName = 'dynamic_lyric'


    let invalidSession = async (validFunc:Function) => {
        await session.destroy().then(async () => {
            console.info('TestLog: session destroy success');
            await validFunc();
            session = null;
        }).catch((err: BusinessError) => {
            console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
        })
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_5400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_5400
     * @tc.desc   Testing call setAVMetadata(promise) set bundleIcon - readonly , can't be set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let metadata0: avSession.AVMetadata = {
        assetId: '121278',
      };
      await session.setAVMetadata(metadata0).then(() => {
        console.info('TestLog: Set metadata Successfully');
      }).catch((err: BusinessError ) => {
        console.info(`TestLog: Set metadata error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data: avSession.AVMetadata) => {
        console.info(`${data.assetId} TestLog: Get assetId Successfully`);
        expect(data.assetId).assertEqual(metadata0.assetId);
        console.info(`${data.bundleIcon} TestLog: Get bundleIcon Successfully`);
        expect(data.bundleIcon).assertEqual(undefined);
      }).catch((err: BusinessError) => {
        console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0100
     * @tc.desc   Testing on setTargetLoopMode callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        session.on('setTargetLoopMode', (callback: number) => {
            expect(callback).assertEqual(1);
            console.info('TestLog: Set TargetLoopMode command callback registration');
        });

        try {
            await controller.sendControlCommand({
                command: 'setTargetLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SINGLE
            });
            console.info('TestLog: Controller sent setTargetLoopMode command successfully, LoopMode=SINGLE, value=1');
        } catch (err) {
            console.error(`TestLog: Controller command error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        };
        await sleep(500);
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.on('setTargetLoopMode'+'1', () => {
          console.info('on setTargetLoopMode entry');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on setTargetLoopMode entry error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0100
     * @tc.desc   Testing off setTargetLoopMode all callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const callback1 = (data: number) => {
            if (data === 1) {
                console.info('TestLog: setTargetLoopMode command registration1 success');
                expect(false).assertTrue();
            }
        };

        const callback2 = (data: number) => {
            if (data === 2) {
                console.info('TestLog: setTargetLoopMode command registration2 success');
                expect(false).assertTrue();
            }
        };

        session.on('setTargetLoopMode', callback1);

        session.on('setTargetLoopMode', callback2);

        session.off('setTargetLoopMode');

        try{
            await controller.sendControlCommand({
            command: 'setTargetLoopMode',
            parameter: avSession.LoopMode.LOOP_MODE_SINGLE
        });
            console.info('TestLog: Controller send command successfully');
        } catch(err) {
            console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(6600105);
        };
        await sleep(500);
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0200
     * @tc.desc   Testing off setTargetLoopMode specified callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const callback1 = (data: number) => {
          if (data === 1) {
              console.info('TestLog: setTargetLoopMode command registration1 success');
              expect(false).assertTrue();
          }
      };

      const callback2 = (data: number) => {
          if (data === 2) {
              console.info('TestLog: setTargetLoopMode command registration2 success');
              expect(false).assertTrue();
          }
      };

      session.on('setTargetLoopMode', callback1);

      session.on('setTargetLoopMode', callback2);

      session.off('setTargetLoopMode', callback1);
      try{
          await controller.sendControlCommand({
          command: 'setTargetLoopMode',
          parameter: avSession.LoopMode.LOOP_MODE_SINGLE});
          console.info('TestLog: Controller send command successfully');
      } catch(err) {
          console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
      };
      await sleep(500);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0400
     * @tc.desc   test off(setTargetLoopMode) errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.off('setTargetLoopMode'+'1');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off setTargetLoopMode entry error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    })  
    

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_5500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_5500
     * @tc.desc   Testing call setAVPlaybackState(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let PlaybackState: avSession.AVPlaybackState = {
        state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
        speed: 1.0,
        position:{elapsedTime:10, updateTime:(new Date()).getTime()},
        bufferedTime:1000,
        loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
        isFavorite:true,
        volume: 3,
        extras: {extras: 'any'}
      };
      await session.setAVPlaybackState(PlaybackState).then(() => {
        console.info('SetAVPlaybackState successfully');
      }).catch((err: BusinessError) => {
        console.error(`SetAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
      });
      await controller.getAVPlaybackState().then((state: avSession.AVPlaybackState) => {
        console.info('getAVPlaybackState : SUCCESS');
        expect(state.state).assertEqual(PlaybackState.state)
      }).catch((err: BusinessError) => {
        console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_2200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
         await session.getOutputDevice().then((device_Info: avSession.OutputDeviceInfo) => {
            console.info('Get device successfully');
            let deviceInfo: avSession.DeviceInfo = device_Info.devices[0];
            console.info(`getOutputDevice successfully ${JSON.stringify(deviceInfo)}`);
            if (deviceInfo && deviceInfo.castCategory !== undefined && 
                deviceInfo.deviceId !== undefined && deviceInfo.deviceName !== undefined && 
                deviceInfo.deviceType !== undefined && deviceInfo.audioCapabilities?.streamInfos !== undefined) {
                console.info('getOutputDevice value success.')
            } else {
                console.info('getOutputDevice value error.')
                expect(false).assertTrue();
            }
            done();
          }).catch((err: BusinessError) => {
            console.error(`GetOutputDevice BusinessError: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          })

      } catch(err) {
          console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
      }
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_2300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_2300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
         await session.getOutputDevice((err: BusinessError, device_Info: avSession.OutputDeviceInfo) => {
          if (err) {
            console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
          console.info('getOutputDevice successfully');
          let deviceInfo: avSession.DeviceInfo = device_Info.devices[0];
          console.info(`getOutputDevice successfully ${JSON.stringify(deviceInfo)}`);
          if (deviceInfo && deviceInfo.castCategory !== undefined && deviceInfo.deviceId !== undefined &&
              deviceInfo.deviceName !== undefined && deviceInfo.deviceType !== undefined && 
              deviceInfo.audioCapabilities?.streamInfos !== undefined) {
              console.info('getOutputDevice value success.')
          } else {
              console.info('getOutputDevice value error.')
              expect(false).assertTrue();
          }
          done();
        });
      } catch(err) {
          console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
      }
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let queueItemDescription_1: avSession.AVMediaDescription = {
        assetId: '001',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: true,
        mediaImage: 'Image',
        extras: {extras:'any'}
      };
      let queueItem_1: avSession.AVQueueItem = {
        itemId: 1,
        description: queueItemDescription_1
      };
      let queueItemDescription_2: avSession.AVMediaDescription = {
        assetId: '002',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: true,
        mediaImage: 'Image',
        extras: {extras:'any'}
      };
      let queueItem_2: avSession.AVQueueItem = {
        itemId: 2,
        description: queueItemDescription_2
      };
      let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
      await session.setAVQueueItems(queueItemsArray).then(() => {
        console.info('SetAVQueueItems successfully');
        controller.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
          console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
          expect(items[0].description?.pcmSrc).assertEqual(queueItem_1.description?.pcmSrc);
          done();
        }).catch((err: BusinessError) => {
          console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
        });
      }).catch((err: BusinessError) => {
        console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let queueItemDescription_1: avSession.AVMediaDescription = {
        assetId: '001',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: false,
        extras: {extras:'any'}
      };
      let queueItem_1: avSession.AVQueueItem = {
        itemId: 1,
        description: queueItemDescription_1
      };
      let queueItemDescription_2: avSession.AVMediaDescription = {
        assetId: '002',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: false,
        extras: {extras:'any'}
      };
      let queueItem_2: avSession.AVQueueItem = {
        itemId: 2,
        description: queueItemDescription_2
      };
      let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
      await session.setAVQueueItems(queueItemsArray).then(() => {
        console.info('SetAVQueueItems successfully');
        controller.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
          console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
          expect(items[0].description?.pcmSrc).assertEqual(queueItem_1.description?.pcmSrc);
          done();
        }).catch((err: BusinessError) => {
          console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
        });
      }).catch((err: BusinessError) => {
        console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let queueItemDescription_1: avSession.AVMediaDescription = {
        assetId: '001',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: false,
        extras: {extras:'any'}
      };
      let queueItem_1: avSession.AVQueueItem = {
        itemId: 1,
        description: queueItemDescription_1
      };
      await session.setAVQueueItems(queueItem_1).then(() => {
        console.info('SetAVQueueItems successfully');
      }).catch((err: BusinessError) => {
        console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let queueItemDescription_1: avSession.AVMediaDescription = {
        assetId: '001',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: true,
        extras: {extras:'any'}
      };
      let queueItem_1: avSession.AVQueueItem = {
        itemId: 1,
        description: queueItemDescription_1
      };
      let queueItemDescription_2: avSession.AVMediaDescription = {
        assetId: '002',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: true,
        extras: {extras:'any'}
      };
      let queueItem_2: avSession.AVQueueItem = {
        itemId: 2,
        description: queueItemDescription_2
      };
      let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
      await session.setAVQueueItems(queueItemsArray, (err: BusinessError) => {
        if (err) {
          console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        } else {
          controller.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
            console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
            expect(items[0].description?.pcmSrc).assertEqual(queueItem_1.description?.pcmSrc);
            done();
          }).catch((err: BusinessError) => {
            console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
          });
          console.info('SetAVQueueItems successfully');
        }
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let queueItemDescription_1: avSession.AVMediaDescription = {
        assetId: '001',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: false,
        extras: {extras:'any'}
      };
      let queueItem_1: avSession.AVQueueItem = {
        itemId: 1,
        description: queueItemDescription_1
      };
      let queueItemDescription_2: avSession.AVMediaDescription = {
        assetId: '002',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: false,
        extras: {extras:'any'}
      };
      let queueItem_2: avSession.AVQueueItem = {
        itemId: 2,
        description: queueItemDescription_2
      };
      let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
      await session.setAVQueueItems(queueItemsArray, (err: BusinessError) => {
        if (err) {
          console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info('SetAVQueueItems successfully');
          controller.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
            console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
            expect(items[0].description?.pcmSrc).assertEqual(queueItem_1.description?.pcmSrc);
            done();
          }).catch((err: BusinessError) => {
            console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
          });
        }
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let queueItemDescription_1: avSession.AVMediaDescription = {
        assetId: '001',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        pcmSrc: false,
        extras: {extras:'any'}
      };
      let queueItem_1: avSession.AVQueueItem = {
        itemId: 1,
        description: queueItemDescription_1
      };
      await session.setAVQueueItems(queueItem_1, (err: BusinessError) => {
        if (err) {
          console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        } else {
          console.info('SetAVQueueItems successfully');
        }
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0300
     * @tc.desc   Testing setextras to boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.setExtras({extras : true}, (err: BusinessError) => {
        if (err) {
          console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      })
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0400
     * @tc.desc   Testing setextras to number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.setExtras({extras : 123}, (err: BusinessError) => {
        if (err) {
          console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      })
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0500
     * @tc.desc   Testing setextras to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.setExtras({extras : [123,'123']}, (err: BusinessError) => {
        if (err) {
          console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      })
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0600
     * @tc.desc   Testing setextras to boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.setExtras({extras : true}).then(() => {
          console.info('setExtras successfully');
        }).catch((err: BusinessError) => {
          console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        })
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0700
     * @tc.desc   Testing setextras to number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.setExtras({extras : 123}).then(() => {
          console.info('setExtras successfully');
        }).catch((err: BusinessError) => {
          console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        })
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0800
     * @tc.desc   Testing setextras to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.setExtras({extras : [123,'123']}).then(() => {
          console.info('setExtras successfully');
        }).catch((err: BusinessError) => {
          console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        })
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0300
     * @tc.desc   Testing on(handleKeyEvent) errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.on('handleKeyEvent', 111);
      } catch(err){
        console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401)
      } 
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_3000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_3000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let queueItemDescription_1: avSession.AVMediaDescription = {
        assetId: '001',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        launchClientData: 'any',
        extras: {extras:'any'}
      };
      let queueItem_1: avSession.AVQueueItem = {
        itemId: 1,
        description: queueItemDescription_1
      };
      let queueItemDescription_2: avSession.AVMediaDescription = {
        assetId: '002',
        title: 'music_name',
        subtitle: 'music_sub_name',
        description: 'music_description',
        launchClientData: 'any',
        extras: {extras:'any'}
      };
      let queueItem_2: avSession.AVQueueItem = {
        itemId: 2,
        description: queueItemDescription_2
      };
      let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
      await session.setAVQueueItems(queueItemsArray, (err: BusinessError) => {
        if (err) {
          console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        } else {
          controller.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
            console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
            expect(items[0].description?.launchClientData).assertEqual(queueItem_1.description?.launchClientData);
            done();
          }).catch((err: BusinessError) => {
            console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
          });
          console.info('SetAVQueueItems successfully');
        }
        done();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      await sleep(1000);
      await avSession.createAVSession(context, tag, 'voice_call').then((data) => {
        session = data;
        session.sessionType = 'voice_call';
        console.info(`${TAG}: avSession create success`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })   


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      await sleep(1000);
      await avSession.createAVSession(context, tag, 'voice_call', (err: BusinessError, data: avSession.AVSession) => {
        if(err) {
          console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }else{
          session = data;
          session.sessionType = 'voice_call';
          console.info(`${TAG}: avSession create success`);
        }
      });
      done();
    })   


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      await sleep(1000);
      await avSession.createAVSession(context, tag, 'video_call').then((data) => {
        session = data;
        session.sessionType = 'video_call';
        console.info(`${TAG}: avSession create success`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })   


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      await sleep(1000);
      await avSession.createAVSession(context, tag, 'video_call', (err: BusinessError, data: avSession.AVSession) => {
        if(err) {
          console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }else{
          session = data;
          session.sessionType = 'video_call';
          console.info(`${TAG}: avSession create success`);
        }
      });
      done();
    })  


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await session.dispatchSessionEvent(eventName, {lyric : 123 }, (err: BusinessError) => {
                if (err) {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
                }
            })
      done();
    }) 


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await session.dispatchSessionEvent(eventName, {lyric : true }, (err: BusinessError) => {
                if (err) {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
                }
            })
      done();
    }) 


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await session.dispatchSessionEvent(eventName, {lyric : [123,'123'] }, (err: BusinessError) => {
                if (err) {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
                }
            })
      done();
    }) 


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await session.dispatchSessionEvent(eventName, {lyric : 123 }).then(() => {
                console.info('dispatchSessionEvent successfully');
            }).catch((err: BusinessError) => {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
            })

      done();
    }) 


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await session.dispatchSessionEvent(eventName, {lyric : true }).then(() => {
                console.info('dispatchSessionEvent successfully');
            }).catch((err: BusinessError) => {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
            })

      done();
    }) 


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await session.dispatchSessionEvent(eventName, {lyric : [123,'123'] }).then(() => {
                console.info('dispatchSessionEvent successfully');
            }).catch((err: BusinessError) => {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
            })

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        avSession.getAVSession(context).then((data) => {
          session = data;
          console.info('getAVSession successfully${session.sessionType}');
        })
      } catch (err) {
        console.info('getAVSession failed${err.code} message:${err.message}');
        expect(false).assertTrue()
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_REVENT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_REVENT_0100
     * @tc.desc   Testing on setTargetLoopMode callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_REVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        await session.on('setTargetLoopMode', (mode: number) => {
            if(mode == 1){
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_SINGLE)
            }else if(mode == 0){
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_SEQUENCE)
            }else if(mode == 2){
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_LIST)
            }else if(mode == 3){
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_SHUFFLE)
            }else{
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_CUSTOM)
            }
        });
        await sleep(500);
        await session.off('setTargetLoopMode')
        done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_1100
     * @tc.desc   test onPlayNext callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlayNext((info:avSession.CommandInfo) => {
          console.info(`onPlayNext entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await controller.sendControlCommand({command:'playNext',commandInfo:{callerModuleName:'Center'}});

        await sleep(300);
      } catch (err) {
        console.info(`on playNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })



    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1200
     * @tc.desc   test offPlayNext callback unregistration with specified onCallback
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let onCallback1 = (info:avSession.CommandInfo) => {
        console.info(`onPlayNext 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag+=10
      }
      let onCallback2 = (info:avSession.CommandInfo) => {
        console.info(`onPlayNext 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      }
      try {
        await session.onPlayNext(onCallback2);
        await session.onPlayNext(onCallback1);
        await sleep(500);

        await session.offPlayNext(onCallback2);
        await controller.sendControlCommand({command:'playNext',commandInfo:{callerModuleName:'Center'}});
        await sleep(200);
        expect(flag).assertEqual(10);
      } catch (err) {
        console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_1100
     * @tc.desc   test onPlayPrevious callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlayPrevious((info:avSession.CommandInfo) => {
          console.info(`onPlayPrevious entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await controller.sendControlCommand({command:'playPrevious',commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1200
     * @tc.desc   test offPlayPrevious callback unregistration with specified onCallback
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let onCallback1 = (info:avSession.CommandInfo) => {
        console.info(`onPlayPrevious 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag+=10
      }
      let onCallback2 = (info:avSession.CommandInfo) => {
        console.info(`onPlayPrevious 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      }
      try {
        await session.onPlayPrevious(onCallback1);
        await session.onPlayPrevious(onCallback2);
        await sleep(500);

        await session.offPlayPrevious(onCallback1);
        await controller.sendControlCommand({command:'playPrevious',commandInfo:{callerModuleName:'Center'}});
        await sleep(200);
        expect(flag).assertEqual(1);
      } catch (err) {
        console.info(`offPlayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }

      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_1100
     * @tc.desc   test onPlay callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlay((info:avSession.CommandInfo) => {
          console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await controller.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1200
     * @tc.desc   test offPlay callback unregistration with param
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let onCallback1 = (info:avSession.CommandInfo) => {
        console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      }

      let onCallback2 = (info:avSession.CommandInfo) => {
        console.info(`onPlay 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      }

      try {
        await session.onPlay(onCallback1);
        await session.onPlay(onCallback2);
        await session.offPlay(onCallback1);
        await controller.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_1100
     * @tc.desc   test onRewind callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      })
      try {
        await session.onRewind(infocallback);
        await controller.sendControlCommand({command:'rewind',commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_1200
     * @tc.desc   test onRewind callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      })
      try {
        await session.onRewind(infocallback);
        await controller.sendControlCommand({command:'rewind',parameter:10,commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1200
     * @tc.desc   test offRewind callback unregistration with specified onCallback
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        let onCallback1 = (info:avSession.CommandInfo) => {
          console.info(`onRewind 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag+=10
        }
        let onCallback2 = (info:avSession.CommandInfo) => {
          console.info(`onRewind 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        }
        await session.onRewind(onCallback1);
        await session.onRewind(onCallback2);

        await session.offRewind(onCallback2);
        await controller.sendControlCommand({command:'rewind',commandInfo:{callerModuleName:'Center'}});
        await sleep(200);
        expect(flag).assertEqual(10);
      } catch (err) {
        console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })





    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1100
     * @tc.desc   test onFastForward callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      })
      try {
        await session.onFastForward(infocallback);
        await controller.sendControlCommand({command:'fastForward',commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1200
     * @tc.desc   test onFastForward callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      })
      try {
        await session.onFastForward(infocallback);
        await controller.sendControlCommand({command:'fastForward',parameter:10,commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1200
     * @tc.desc   test offFastForward callback unregistration with specified onCallback
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        let onCallback1 = (info:avSession.CommandInfo) => {
          console.info(`onFastForward 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag+=10
        }
        let onCallback2 = (info:avSession.CommandInfo) => {
          console.info(`onFastForward 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        }
        await session.onFastForward(onCallback1);
        await session.onFastForward(onCallback2);

        await session.offFastForward(onCallback1);
        await controller.sendControlCommand({command:'fastForward',commandInfo:{callerModuleName:'Center'}});
        await sleep(200);
        expect(flag).assertEqual(1);
      } catch (err) {
        console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICSUPPORTED_0100
     * @tc.desc   Test isDesktopLyricSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICSUPPORTED_0100';
        try {
          const deviceType: string = deviceInfo.deviceType;
          const supportDeskTopLyricDevices: string[] = [
            deviceInfo.DeviceTypes.TYPE_PHONE,
            deviceInfo.DeviceTypes.TYPE_TABLET,
            deviceInfo.DeviceTypes.TYPE_2IN1,
          ]
          const isDeviceSupported: boolean = supportDeskTopLyricDevices.includes(deviceType);
          let isSupported = await avSession.isDesktopLyricSupported();
          expect(isSupported).assertEqual(isDeviceSupported);
        } catch (err) {
          console.error(`${TAG}: BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0100
     * @tc.desc   Testing enableDesktopLyric with enable=true (normal scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0200
     * @tc.desc   Testing enableDesktopLyric with enable=false (normal scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0100
     * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          await session.setDesktopLyricVisible(true);
          const getVisibleResult: boolean = await session.isDesktopLyricVisible();
          expect(getVisibleResult).assertEqual(true);
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0200
     * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          await session.setDesktopLyricVisible(false);
          const getVisibleResult: boolean = await session.isDesktopLyricVisible();
          expect(getVisibleResult).assertEqual(false);
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.desc   Testing onDesktopLyricVisibilityChanged - callback equals true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData: boolean = false;
          let callbackTriggered: boolean = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: onDesktopLyricVisibilityChanged callback triggered , data = ${data})`);
          }
          await session.enableDesktopLyric(true);
          session.onDesktopLyricVisibilityChanged(callback);
          await session.setDesktopLyricVisible(true);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
          expect(callbackData).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_2200
     * @tc.desc   Testing onDesktopLyricVisibilityChanged - callback equals false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_2200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData: boolean = true;
          let callbackTriggered: boolean = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: onDesktopLyricVisibilityChanged callback triggered , data = ${data})`);
          }
          await session.enableDesktopLyric(true);
          await session.setDesktopLyricVisible(true);
          session.onDesktopLyricVisibilityChanged(callback);
          await session.setDesktopLyricVisible(false);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
          expect(callbackData).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters all callbacks (verify no trigger after unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: boolean) => {
            callback1Triggered = data;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          }
          let callback2 = (data: boolean) => {
            callback2Triggered = data;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          session.onDesktopLyricVisibilityChanged(callback1);
          session.onDesktopLyricVisibilityChanged(callback2);
          session.offDesktopLyricVisibilityChanged(callback1);
          await session.setDesktopLyricVisible(true);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters specific callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: boolean) => {
            callback1Triggered = data;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          }
          let callback2 = (data: boolean) => {
            callback2Triggered = data;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          session.onDesktopLyricVisibilityChanged(callback1);
          session.onDesktopLyricVisibilityChanged(callback2);
          session.offDesktopLyricVisibilityChanged();
          await session.setDesktopLyricVisible(true);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0100
     * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: true) - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          let state: avSession.DesktopLyricState = { isLocked: true };
          await session.setDesktopLyricState(state);
          let getState: avSession.DesktopLyricState = await session.getDesktopLyricState();
          expect(getState.isLocked).assertEqual(true)
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0200
     * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: false) - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          let state: avSession.DesktopLyricState = { isLocked: false };
          await session.setDesktopLyricState(state);
          let getState: avSession.DesktopLyricState = await session.getDesktopLyricState();
          expect(getState.isLocked).assertEqual(false)
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_0100
     * @tc.desc   Testing onDesktopLyricStateChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackTriggered: boolean = false;
          let callback = (data: avSession.DesktopLyricState) => {
            callbackTriggered = data.isLocked;
            console.info(`${TAG}: boolean: callback triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          session.onDesktopLyricStateChanged(callback);
          let state: avSession.DesktopLyricState = { isLocked: true };
          await session.setDesktopLyricState(state);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0100
     * @tc.desc   Testing offDesktopLyricStateChanged unregisters all callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: avSession.DesktopLyricState) => {
            callback1Triggered = data.isLocked;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          }
          let callback2 = (data: avSession.DesktopLyricState) => {
            callback2Triggered = data.isLocked;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          session.onDesktopLyricStateChanged(callback1);
          session.onDesktopLyricStateChanged(callback2);
          session.offDesktopLyricStateChanged(callback1);
          let state: avSession.DesktopLyricState = { isLocked: true };
          await session.setDesktopLyricState(state);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0200
     * @tc.desc   Testing offDesktopLyricStateChanged unregisters specified callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: avSession.DesktopLyricState) => {
            callback1Triggered = data.isLocked;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          }
          let callback2 = (data: avSession.DesktopLyricState) => {
            callback2Triggered = data.isLocked;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          session.onDesktopLyricStateChanged(callback1);
          session.onDesktopLyricStateChanged(callback2);
          session.offDesktopLyricStateChanged();
          let state: avSession.DesktopLyricState = { isLocked: true };
          await session.setDesktopLyricState(state);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

  })
}

