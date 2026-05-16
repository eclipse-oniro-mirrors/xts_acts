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
import { Key, KeyEvent } from '@kit.InputKit';


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
  describe('AVSessionERRCode', () => {
    let TAG: string = "[AVSessionERRCode]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'AVSessionERRCodeXTS';
    let keyItem: Key = {code:0x49, pressedTime:2, deviceId:0};
    let event:KeyEvent = {id:1, deviceId:0, actionTime:1, screenId:1, windowId:1, action:2, key:keyItem, unicodeChar:0, keys:[keyItem], ctrlKey:false, altKey:false, shiftKey:false, logoKey:false, fnKey:false, capsLock:false, numLock:false, scrollLock:false};
    let event1: string = 'aaa'
    let customdata: Record<string,string> = {'customData': 'appdata'}
    let eventName = 'dynamic_lyric';
    let assetId: string = 'assetIdTest';
    let assetId1: string = '';
    let assetId2: string = '';
    let assetId3: string = '~!@#$%^&*()_+{}:">?,./123456789'+'a'.repeat(40928);
    let assetId4: string = 'a'.repeat(40960)
    let assetId5: number = 123


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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_0300
     * @tc.desc   Testing off(handleKeyEvent) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('handleKeyEvent');
      } catch(err){
        console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101)
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWORD_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWORD_ERRORCODE_0300
     * @tc.desc   Testing off(fastForward) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWORD_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('fastForward')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_ERRORCODE_0300
     * @tc.desc   Testing off(pause) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('pause')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_ERRORCODE_0300
     * @tc.desc   Testing off(play) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('play')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_ERRORCODE_0300
     * @tc.desc   Testing off(playPrevious) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('playPrevious')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_ERRORCODE_0300
     * @tc.desc   Testing off(rewind) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('rewind')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_ERRORCODE_0300
     * @tc.desc   Testing off(seek) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('seek')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_ERRORCODE_0300
     * @tc.desc   Testing off(setLoopMode) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('setLoopMode')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_ERRORCODE_0300
     * @tc.desc   Testing off(setSpeed) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('setSpeed')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0500
     * @tc.desc   Testing off(setTargetLoopMode) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('setTargetLoopMode')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_STOP_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_STOP_ERRORCODE_0300
     * @tc.desc   Testing off(stop) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_STOP_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('stop')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_ERRORCODE_0300
     * @tc.desc   Testing off(toggleFavorite) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('toggleFavorite')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAY_5300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAY_5300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_PLAY_5300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAY_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('play', () => {
          console.info('on play entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on play entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_1300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('pause', () => {
          console.info('on pause entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on pause entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_STOP_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_STOP_1400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_STOP_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_STOP_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('stop', () => {
          console.info('on stop entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on stop entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_1500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('playNext', () => {
          console.info('on playNext entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on playNext entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_1600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_1600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('playPrevious', () => {
          console.info('on playPrevious entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on playPrevious entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_1700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_1700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('fastForward', (time?: number) => {
          console.info('on fastForward entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on fastForward entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_REWIND_1800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_REWIND_1800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_REWIND_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_REWIND_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('rewind', (time?: number) => {
          console.info('on rewind entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on rewind entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_1900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_1900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('play');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off play entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_2000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_2000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('pause');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off pause entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_STOP_2100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_STOP_2100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_STOP_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_STOP_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('stop');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off stop entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_2200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('playNext');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off playNext entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_2300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_2300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('playPrevious');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off playPrevious entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_2400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_2400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('fastForward');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off fastForward entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_2500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_2500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('rewind');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off rewind entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYFROMASSETID_2600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYFROMASSETID_2600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_PLAYFROMASSETID_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYFROMASSETID_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('playFromAssetId', (assetId: number) => {
          console.info('on playFromAssetId entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on playFromAssetId entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SEEK_2800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SEEK_2800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_SEEK_2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SEEK_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('seek', (assetId: number) => {
          console.info('on playFromAssetId entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on seek entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_2900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_2900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('seek');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off seek entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_3000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_3000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('setSpeed', () => {
          console.info('on setSpeed entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on setSpeed entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_3100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_3100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('setSpeed');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off setSpeed entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_3300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_3300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_3300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('setLoopMode', () => {
          console.info('on setLoopMode entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on setLoopMode entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_3300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_3300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_3300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('setLoopMode');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off setLoopMode entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_3400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_3400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_3400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('toggleFavorite', () => {
          console.info('on toggleFavorite entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on toggleFavorite entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_3500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_3500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_3500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('toggleFavorite');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off toggleFavorite entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_3600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_3600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_3600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('handleKeyEvent', () => {
          console.info('on handleKeyEvent entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on handleKeyEvent entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_3700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_3700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_3700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('handleKeyEvent');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off handleKeyEvent entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_3800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_3800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_3800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('outputDeviceChange', () => {
          console.info('on outputDeviceChange entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on outputDeviceChange entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_3900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_3900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_3900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('outputDeviceChange');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off outputDeviceChange entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_4000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_4000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_4000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('commonCommand', () => {
          console.info('on commonCommand entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on commonCommand entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_4100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_4100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_4100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('commonCommand');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off commonCommand entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_4200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_4200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_4200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('skipToQueueItem', () => {
          console.info('on skipToQueueItem entry11');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on skipToQueueItem entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_4300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_4300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_4300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('skipToQueueItem');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off skipToQueueItem entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_4500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_4500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_4500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getAVMetadata((err: BusinessError, metadata: avSession.AVMetadata) => {
        if (err) {
          console.error(`GetAVMetadata11 BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600102);
        } else {
          console.info(`GetAVMetadata11 : SUCCESS : assetId : ${metadata.assetId}`);
        }
      });
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.on('setTargetLoopMode', () => {
          console.info('on setTargetLoopMode entry');
        });
      } catch (err) {
        let error =err as BusinessError;
        console.info(`on setTargetLoopMode entry error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('setTargetLoopMode');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off setTargetLoopMode entry error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try{
        await sleep(500);
        avSession.getAVSession(context).then((data) => {
          expect(data.sessionTag).assertEqual(session.sessionTag)
          console.info('getAVSession successfully${data.sessionType}');
          expect(false).assertTrue();
        })
      } catch (err) {
        console.info('getAVSession failed${err.code} message:${err.message}');
        expect(err.code).assertEqual(6600102)
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYFROMASSERTID_2700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYFROMASSERTID_2700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYFROMASSERTID_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYFROMASSERTID_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('playFromAssetId');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off playFromAssetId entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_1100
     * @tc.desc   test onPlayNext errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.onPlayNext((info:avSession.CommandInfo) => {
          console.info(`onPlayNext entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          expect(false).assertTrue()
        });
      } catch (err) {
        console.info(`onplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1100
     * @tc.desc   test offPlayNext callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        await session.onPlayNext(onCallback1);
        await session.onPlayNext(onCallback2);
        await sleep(300);
        await session.offPlayNext();
        await controller.sendControlCommand({command:'playNext',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1100
     * @tc.desc   test offPlayNext errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offPlayNext();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1300
     * @tc.desc   test offPlayNext errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offPlayNext();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_1100
     * @tc.desc   test onPlayPrevious errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.onPlayPrevious((info:avSession.CommandInfo) => {
          console.info(`onPlayPrevious entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          expect(false).assertTrue()
        });
      } catch (err) {
        console.info(`onplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1100
     * @tc.desc   test offPlayPrevious callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlayPrevious((info:avSession.CommandInfo) => {
          console.info(`onPlayPrevious 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.onPlayPrevious((info:avSession.CommandInfo) => {
          console.info(`onPlayPrevious 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offPlayPrevious();
        await controller.sendControlCommand({command:'playPrevious',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`off playPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1100
     * @tc.desc   test offPlayPrevious errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offPlayPrevious();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1300
     * @tc.desc   test offPlayPrevious errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offPlayPrevious();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_1100
     * @tc.desc   test onPlay errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.onPlay((info:avSession.CommandInfo) => {
          console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          expect(false).assertTrue()
        });
      } catch (err) {
        console.info(`onplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1100
     * @tc.desc   test offPlay callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlay((info:avSession.CommandInfo) => {
          console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offPlay();
        await controller.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1100
     * @tc.desc   test offPlay errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offPlay();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1300
     * @tc.desc   test offPlay errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offPlay();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_1100
     * @tc.desc   test onRewind errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        expect(false).assertTrue()
      })
      try {
        await session.onRewind(infocallback);
      } catch (err) {
        console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1100
     * @tc.desc   test offRewind callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onRewind((info:avSession.CommandInfo) => {
          console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offRewind();
        await controller.sendControlCommand({command:'rewind',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1100
     * @tc.desc   test offRewind errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offRewind();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1300
     * @tc.desc   test offRewind errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offRewind();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_1100
     * @tc.desc   test onFastForward errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        expect(false).assertTrue()
      })
      try {
        await session.onFastForward(infocallback);
      } catch (err) {
        console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1100
     * @tc.desc   test offFastForward callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onFastForward((info:avSession.CommandInfo) => {
          console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offFastForward();
        await controller.sendControlCommand({command:'fastForward',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1100
     * @tc.desc   test offFastForward errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offFastForward();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1300
     * @tc.desc   test offFastForward errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offFastForward();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0300
     * @tc.desc   Testing off('playWithAssetId') -- off all on functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: 'assetIdTest'
      }
      try {
        session.on('playWithAssetId', playWithAssetIdCallback1);
        session.on('playWithAssetId', playWithAssetIdCallback2);
        await session.off('playWithAssetId');
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(6600105);
          done();
        });
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0400
     * @tc.desc   Testing not on('playWithAssetId') before off('playWithAssetId')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.off('playWithAssetId');
      } catch (error) {
        if (error.code == 6600101) {
          console.info(`${TAG}: off playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: off playWithAssetId errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0500
     * @tc.desc   Testing destroy before off('playWithAssetId')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.off('playWithAssetId')
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: off playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: off playWithAssetId errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0600
     * @tc.desc   Testing destroy before setCallMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata5: callMetadata5 = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      await session.destroy();
      await session.setCallMetadata(callMetadata5).then(() => {
        console.info(`${TAG}: setCallMetadata without avsession test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 6600102) {
          console.info(`${TAG}: setCallMetadata without avsession test success, error: code: ${err.code}, message: ${err.message}`);
        } else {
          console.info(`${TAG}: setCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0100
     * @tc.desc   Testing destroy before getCallMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata0: callMetadata0 = {
        name: '1234568',
        phoneNumber: '65432111'
      };
      await session.setCallMetadata(callMetadata0).then(() => {
        console.info(`${TAG}: setCallMetadata successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      await session.destroy();
      await controller.getCallMetadata().then(() => {
        console.info(`${TAG}: getCallMetadata without avsession test fail, get successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err) {
          if (err.code == 6600102) {
            console.info(`${TAG}: getCallMetadata without avsession test success, error: code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${TAG}: getCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        } else {
          console.info(`${TAG}: getCallMetadata get successful without avsession test fail, get successful!`);
          expect(false).assertTrue();
        }
      });
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0200
     * @tc.desc   Testing destroy before getCallMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata1: callMetadataOne = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      await session.setCallMetadata(callMetadata1).then(() => {
        console.info(`${TAG}: setCallMetadata successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      await controller.destroy();
      await controller.getCallMetadata().then(() => {
        console.info(`${TAG}: getCallMetadata without controller test fail, get successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err) {
          if (err.code == 6600103) {
            console.info(`${TAG}: getCallMetadata without controller test success, error: code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${TAG}: getCallMetadata errorCode != 6600103, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        } else {
          console.info(`${TAG}: getCallMetadata without controller test fail, get successful!`);
          expect(false).assertTrue();
        }
      });
      controller = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0600
     * @tc.desc   Testing destroy before setCallMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata5: callMetadata5 = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      try {
        await session.destroy();
        session.setCallMetadata(callMetadata5, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600102) {
              console.info(`${TAG}: setCallMetadataCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
            } else {
              console.info(`${TAG}: setCallMetadataCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setCallMetadataCallback without avsession test fail, set successful!`);
            expect(false).assertTrue();
          }
          session = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0100
     * @tc.desc   Testing destroy before getCallMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        controller.getCallMetadata((err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600102) {
              console.info(`${TAG}: getCallMetadataCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
            } else {
              console.info(`${TAG}: getCallMetadataCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: getCallMetadataCallback without avsession test fail, get successful!`);
            expect(false).assertTrue();
          }
          session = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0200
     * @tc.desc   Testing destroy before getCallMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await controller.destroy();
        controller.getCallMetadata((err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600103) {
              console.info(`${TAG}: getCallMetadataCallback without controller test success, error: code: ${err.code}, message: ${err.message}`);
            } else {
              console.info(`${TAG}: getCallMetadataCallback errorCode != 6600103, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: getCallMetadataCallback without avsession test fail, get successful!`);
            expect(false).assertTrue();
          }
          controller = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1300
     * @tc.desc   Testing destroy before setAVCallState - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState12: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: true,
      };
      await session.destroy();
      await session.setAVCallState(avCallState12).then(() => {
        console.info(`${TAG}: setAVCallState without avsession test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 6600102) {
          console.info(`${TAG}: setAVCallState without avsession test success, error: code: ${err.code}, message: ${err.message}`);
        } else {
          console.info(`${TAG}: setAVCallState errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0100
     * @tc.desc   Testing destroy before getAVCallState - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState0: avCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: true,
      };
      try {
        await session.setAVCallState(avCallState0).then(() => {
          console.info(`${TAG}: setAVCallState successfully`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
        await session.destroy();
        await controller.getAVCallState().then(() => {
          console.info(`${TAG}: getAVCallState without session test fail, get successful!`);
          expect(false).assertTrue();
        }).catch((err: BusinessError) => {
          if (err.code == 6600102) {
            console.info(`${TAG}: getCallMetadata without session test success, error: code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${TAG}: getCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        });
        session = null;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0200
     * @tc.desc   Testing destroy before getAVCallState - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState1: avCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: true,
      };
      try {
        await session.setAVCallState(avCallState1).then(() => {
          console.info(`${TAG}: setAVCallState successfully`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
        await controller.destroy();
        await controller.getAVCallState().then(() => {
          console.info(`${TAG}: getAVCallState without controller test fail, get successful!`);
          expect(false).assertTrue();
        }).catch((err: BusinessError) => {
          if (err.code == 6600103) {
            console.info(`${TAG}: getCallMetadata without controller test success, error: code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${TAG}: getCallMetadata errorCode != 6600103, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        });
        controller = null;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1300
     * @tc.desc   Testing destroy before setAVCallState - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState12: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: true,
      };
      try {
        await session.destroy();
        session.setAVCallState(avCallState12, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600102) {
              console.info(`${TAG}: setAVCallStateCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
            } else {
              console.info(`${TAG}: setAVCallStateCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setAVCallStateCallback without avsession test fail, set successful!`);
            expect(false).assertTrue();
          }
          session = null;
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0100
     * @tc.desc   Testing destroy before getAVCallState - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        controller.getAVCallState((err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600102) {
              console.info(`${TAG}: getAVCallStateCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
            } else {
              console.info(`${TAG}: getAVCallStateCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: getAVCallStateCallback without avsession test fail, get successful!`);
            expect(false).assertTrue();
          }
          session = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0200
     * @tc.desc   Testing destroy before getAVCallState - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await controller.destroy();
        controller.getAVCallState((err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600103) {
              console.info(`${TAG}: getAVCallStateCallback without controller test success, error: code: ${err.code}, message: ${err.message}`);
            } else {
              console.info(`${TAG}: getAVCallStateCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: getAVCallStateCallback without controller test fail, get successful!`);
            expect(false).assertTrue();
          }
          controller = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0800
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await controller.destroy();
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.error(`${TAG}: on callMetadataChange called, test failed!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600103) {
          console.info(`${TAG}: on callMetadataChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on callMetadataChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        controller = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0900
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let metadata = ['abc'];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.error(`${TAG}: on callMetadataChange called, test failed!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600101) {
          console.info(`${TAG}: on callMetadataChange with error metadata test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on callMetadataChange errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_0100
     * @tc.desc   Testing off('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try {
        await controller.off('callMetadataChange');
      } catch (error) {
        if (error.code == 6600103) {
          console.info(`${TAG}: off callMetadataChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: off callMetadataChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        controller = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0800
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await controller.destroy();
        let state = ['muted'];
        controller.on('callStateChange', state, (stateChange: ESObject) => {
          console.info(`${TAG}: on callStateChange called, stateChange: ${JSON.stringify(stateChange)}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600103) {
          console.info(`${TAG}: on callStateChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on callStateChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        controller = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0900
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let state = ['abc'];
        controller.on('callStateChange', state, (stateChange: ESObject) => {
          console.info(`${TAG}: on callStateChange with error param test failed! stateChange: ${JSON.stringify(stateChange)}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600101) {
          console.info(`${TAG}: on callStateChange with error param test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on callStateChange errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_0100
     * @tc.desc   Testing off('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try {
        await controller.off('callStateChange');
      } catch (error) {
        if (error.code == 6600103) {
          console.info(`${TAG}: off callStateChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: off callStateChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        controller = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0600
     * @tc.desc   Testing destroy before on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        session.on('answer', () => {
          console.info(`${TAG}: on answer called`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: on answer test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on answer errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_0100
     * @tc.desc   Testing destroy before off('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.off('answer');
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: off answer test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: off answer errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0600
     * @tc.desc   Testing destroy before on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        session.on('hangUp', () => {
          console.info(`${TAG}: on hangUp called`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: on hangUp without avsession test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on hangUp errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_0100
     * @tc.desc   Testing destroy before off('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.off('hangUp');
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: off hangUp without avsession test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: off hangUp errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0600
     * @tc.desc   Testing destroy before on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        session.on('toggleCallMute', () => {
          console.info(`${TAG}: on toggleCallMute called`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: on toggleCallMute without avsession test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on toggleCallMute errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_0100
     * @tc.desc   Testing destroy before off('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.off('toggleCallMute');
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: off toggleCallMute without avsession test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: off toggleCallMute errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0300
     * @tc.desc   Testing destroy before on('playWithAssetId')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        session.on('playWithAssetId', (data: string) => {
          console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: on playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
        } else {
          console.info(`${TAG}: on playWithAssetId errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0100
     * @tc.desc   Testing off('playWithAssetId') --off one function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', (data: string) => {
          console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
          assetId1=data;
        });
        await session.off('playWithAssetId')
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(6600105);
          done();
        });
        await sleep(500);
        if (assetId1 === assetId) {
          console.log(`${TAG}: off playWithAssetId fail, on playWithAssetId called`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: playWithAssetId off`);
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0300
     * @tc.desc   Testing enableDesktopLyric when session not exit (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0300';
        try {
          await session.destroy();
          try {
            await session.enableDesktopLyric(true);
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0400
     * @tc.desc   Testing enableDesktopLyric when desktop lyrics feature is not supported (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_0400';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0100
     * @tc.desc   Testing setDesktopLyricVisible when desktop lyrics feature is not supported (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          await session.setDesktopLyricVisible(true);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0200
     * @tc.desc   Testing setDesktopLyricVisible when desktop lyrics feature of this application is not enabled (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
          await session.setDesktopLyricVisible(true);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0300
     * @tc.desc   Testing setDesktopLyricVisible when session does not exist (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_0300';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.destroy();
          try {
            await session.setDesktopLyricVisible(true);
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0100
     * @tc.desc   Testing isDesktopLyricVisible when desktop lyrics feature is not supported (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          await session.isDesktopLyricVisible();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0200
     * @tc.desc   Testing isDesktopLyricVisible when desktop lyrics feature of this application is not enabled (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
          await session.isDesktopLyricVisible();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0300
     * @tc.desc   Testing isDesktopLyricVisible when session does not exist (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_0300';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.destroy();
          try {
            await session.isDesktopLyricVisible();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.desc   Testing onDesktopLyricVisibilityChanged when session not exit (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_0200';
        try {
          await session.destroy();
          try {
            session.onDesktopLyricVisibilityChanged((data: boolean) => {
            });
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0300
     * @tc.desc   Testing offDesktopLyricVisibilityChanged when session not exit (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_0300';
        try {
          await session.destroy();
          try {
            session.offDesktopLyricVisibilityChanged();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0100
     * @tc.desc   Testing setDesktopLyricState when desktop lyrics feature is not supported. (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          let state: avSession.DesktopLyricState = { isLocked: false };
          await session.setDesktopLyricState(state);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0200
     * @tc.desc   Testing setDesktopLyricState when desktop lyrics feature of this application is not enabled. (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
          let state: avSession.DesktopLyricState = { isLocked: false };
          await session.setDesktopLyricState(state);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0300
     * @tc.desc   Testing setDesktopLyricState when session does not exist. (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_0300';
        try {
          await session.destroy();
          try {
            let state: avSession.DesktopLyricState = { isLocked: false };
            await session.setDesktopLyricState(state);
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0100
     * @tc.desc   Testing getDesktopLyricState when desktop lyrics feature is not supported. (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          await session.getDesktopLyricState();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0200
     * @tc.desc   Testing getDesktopLyricState when desktop lyrics feature of this application is not enabled. (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
          await session.getDesktopLyricState();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0300
     * @tc.desc   Testing getDesktopLyricState when session does not exist. (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_0300';
        try {
          await session.destroy();
          try {
            await session.getDesktopLyricState();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_0200
     * @tc.desc   Testing onDesktopLyricStateChanged when session not exit (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_0200';
        try {
          await session.destroy();
          try {
            session.onDesktopLyricStateChanged((data: avSession.DesktopLyricState) => {
            });
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0300
     * @tc.desc   Testing offDesktopLyricStateChanged when session not exit (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_0300';
        try {
          await session.destroy();
          try {
            session.offDesktopLyricStateChanged();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0200
     * @tc.desc   Testing isDesktopLyricEnabled when the session does not exist.(throw 6600102）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0200';
        try {
          await session.destroy();
          try {
            await controller.isDesktopLyricEnabled();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0300
     * @tc.desc   Test isDesktopLyricEnabled when the controller does not exit. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0300';
        try {
          await controller.destroy();
          try {
            await controller.isDesktopLyricEnabled();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0400
     * @tc.desc   Test isDesktopLyricEnabled when the desktop lyrics feature is not supported. (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0400';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          await controller.isDesktopLyricEnabled();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0200
     * @tc.desc   Testing onDesktopLyricEnabled when session controller does not exist. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0200';
        try {
          await controller.destroy();
          try {
            controller.onDesktopLyricEnabled((data: boolean) => {
            });
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0300
     * @tc.desc   Testing offDesktopLyricEnabled when session controller not exist(throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0300';
        try {
          await controller.destroy();
          try {
            controller.offDesktopLyricEnabled();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0100
     * @tc.desc   Testing setDesktopLyricVisible when desktop lyrics feature is not supported (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          await controller.setDesktopLyricVisible(true);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0200
     * @tc.desc   Testing setDesktopLyricVisible when desktop lyrics feature of this application is not enabled (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
          await controller.setDesktopLyricVisible(true);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0300
     * @tc.desc   Testing setDesktopLyricVisible when session does not exist (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0300';
        try {
          await session.destroy();
          try {
            await controller.setDesktopLyricVisible(true);
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0400
     * @tc.desc   Testing setDesktopLyricVisible when session controller does not exist (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_0400';
        try {
          await controller.destroy();
          try {
            await controller.setDesktopLyricVisible(true);
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0100
     * @tc.desc   Testing isDesktopLyricVisible when desktop lyrics feature is not supported (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          await controller.isDesktopLyricVisible();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0200
     * @tc.desc   Testing isDesktopLyricVisible when desktop lyrics feature of this application is not enabled (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
          await controller.isDesktopLyricVisible();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0300
     * @tc.desc   Testing isDesktopLyricVisible when session does not exist (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0300';
        try {
          await session.destroy();
          try {
            await controller.isDesktopLyricVisible();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0400
     * @tc.desc   Testing isDesktopLyricVisible when session controller does not exist. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_0400';
        try {
          await controller.destroy();
          try {
            await controller.isDesktopLyricVisible();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.desc   Testing onDesktopLyricVisibilityChanged when session controller does not exist. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0200';
        try {
          await controller.destroy();
          try {
            controller.onDesktopLyricVisibilityChanged((data: boolean) => {
            });
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0300
     * @tc.desc   Testing offDesktopLyricVisibilityChanged when session controller does not exist.(throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0300';
        try {
          await controller.destroy();
          try {
            controller.offDesktopLyricVisibilityChanged();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0100
     * @tc.desc   Testing setDesktopLyricState when desktop lyrics feature is not supported. (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          let state: avSession.DesktopLyricState = { isLocked: false };
          await controller.setDesktopLyricState(state);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0200
     * @tc.desc   Testing setDesktopLyricState when desktop lyrics feature of this application is not enabled. (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
          let state: avSession.DesktopLyricState = { isLocked: false };
          await controller.setDesktopLyricState(state);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0300
     * @tc.desc   Testing setDesktopLyricState when session does not exist. (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0300';
        try {
          await session.destroy();
          try {
            let state: avSession.DesktopLyricState = { isLocked: false };
            await controller.setDesktopLyricState(state);
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0400
     * @tc.desc   Testing setDesktopLyricState when session controller does not exist.(throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_0400';
        try {
          await controller.destroy();
          try {
            let state: avSession.DesktopLyricState = { isLocked: false };
            await controller.setDesktopLyricState(state);
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0100
     * @tc.desc   Testing getDesktopLyricState when desktop lyrics feature is not supported. (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (isSupported) {
            done();
            return;
          }
          await controller.getDesktopLyricState();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0200
     * @tc.desc   Testing getDesktopLyricState when desktop lyrics feature of this application is not enabled. (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(false);
          await controller.getDesktopLyricState();
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0300
     * @tc.desc   Testing getDesktopLyricState when session does not exist. (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0300';
        try {
          await session.destroy();
          try {
            await controller.getDesktopLyricState();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0400
     * @tc.desc   Testing getDesktopLyricState when session controller does not exist. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_0400';
        try {
          await controller.destroy();
          try {
            await controller.getDesktopLyricState();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0200
     * @tc.desc   Testing onDesktopLyricStateChanged when session not exit (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0200';
        try {
          await controller.destroy();
          try {
            controller.onDesktopLyricStateChanged((data: avSession.DesktopLyricState) => {
            });
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0300
     * @tc.desc   Testing offDesktopLyricStateChanged when session not exit (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0300';
        try {
          await controller.destroy();
          try {
            controller.offDesktopLyricStateChanged();
            expect(false).assertTrue();
          } catch (err) {
            console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
          }
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETALLSESSIONDESCRIPTORS_ERRCODE_0201
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETALLSESSIONDESCRIPTORS_ERRCODE_0201
     * @tc.desc   Testing getAllSessionDescriptors without permission (throw 201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETALLSESSIONDESCRIPTORS_ERRCODE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_GETALLSESSIONDESCRIPTORS_ERRCODE_0201';
      try {
        avSession.getAllSessionDescriptors();
      } catch (err) {
        console.info(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_ERRCODE_0201
     * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_ERRCODE_0201
     * @tc.desc   Testing createController without permission (throw 201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_ERRCODE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_ERRCODE_0201';
      try {
        avSession.createController('sessionid');
      } catch (err) {
        console.info(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONCREATE_ERRCODE_0201
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONCREATE_ERRCODE_0201
     * @tc.desc   Testing onSessionCreate without permission (throw 201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONSESSIONCREATE_ERRCODE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONSESSIONCREATE_ERRCODE_0201';
      try {
        avSession.onSessionCreate(()=>{
          console.info(`[${TAG}] Testlog: onSessionCreate registered successfully`)
        });
      } catch (err) {
        console.info(`[${TAG}]: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONDESTROY_ERRCODE_0201
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONDESTROY_ERRCODE_0201
     * @tc.desc   Testing onSessionDestroy without permission (throw 201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONSESSIONDESTROY_ERRCODE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONSESSIONDESTROY_ERRCODE_0201';
      try {
        avSession.onSessionDestroy(()=>{
          console.info(`[${TAG}] Testlog: onSessionDestroy registered successfully`)
        });
      } catch (err) {
        console.info(`[${TAG}]: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONTOPSESSIONCHANGE_ERRCODE_0201
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONTOPSESSIONCHANGE_ERRCODE_0201
     * @tc.desc   Testing onTopSessionChange without permission (throw 201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONTOPSESSIONCHANGE_ERRCODE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONTOPSESSIONCHANGE_ERRCODE_0201';
      try {
        avSession.onTopSessionChange(()=>{
          console.info(`[${TAG}] Testlog: onTopSessionChange registered successfully`)
        });
      } catch (err) {
        console.info(`[${TAG}]: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSESSIONCREATE_ERRCODE_0201
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSESSIONCREATE_ERRCODE_0201
     * @tc.desc   Testing offSessionCreate without permission (throw 201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFSESSIONCREATE_ERRCODE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFSESSIONCREATE_ERRCODE_0201';
      try {
        avSession.offSessionCreate();
      } catch (err) {
        console.info(`[${TAG}]: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSESSIONDESTROY_ERRCODE_0201
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSESSIONDESTROY_ERRCODE_0201
     * @tc.desc   Testing offSessionDestroy without permission (throw 201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFSESSIONDESTROY_ERRCODE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFSESSIONDESTROY_ERRCODE_0201';
      try {
        avSession.offSessionDestroy();
      } catch (err) {
        console.info(`[${TAG}]: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFTOPSESSIONCHANGE_ERRCODE_0201
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFTOPSESSIONCHANGE_ERRCODE_0201
     * @tc.desc   Testing offTopSessionChange without permission (throw 201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFTOPSESSIONCHANGE_ERRCODE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFTOPSESSIONCHANGE_ERRCODE_0201';
      try {
        avSession.offTopSessionChange();
      } catch (err) {
        console.info(`[${TAG}]: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
      }
      done();
    })


  })
}





