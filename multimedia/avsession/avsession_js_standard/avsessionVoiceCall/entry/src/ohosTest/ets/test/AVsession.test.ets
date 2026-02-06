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


let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}



let context: common.UIAbilityContext;

export default function abilityTest() {
  describe('AVSessionTest', () => {
    let TAG: string = "[AVSessionTest]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'VoiceCallXTS';
    let keyItem: Key = {code:0x49, pressedTime:2, deviceId:0};
    let event:KeyEvent = {id:1, deviceId:0, actionTime:1, screenId:1, windowId:1, action:2, key:keyItem, unicodeChar:0, keys:[keyItem], ctrlKey:false, altKey:false, shiftKey:false, logoKey:false, fnKey:false, capsLock:false, numLock:false, scrollLock:false};
    let event1: string = 'aaa'
    let customdata: Record<string,string> = {'customData': 'appdata'}


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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_1100
     * @tc.name      : getAVCastController(promise) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test getAVCastController(promise) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const isExtendedDisplayCast = canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast');
      if (isExtendedDisplayCast) {
        await session.destroy()
        await sleep(500)
        let aVCastController: avSession.AVCastController;
        await session.getAVCastController().then((avcontroller: avSession.AVCastController) => {
            aVCastController = avcontroller;
            console.info('getAVCastController11 : SUCCESS');
            expect(false).assertTrue();
        }).catch((err: BusinessError) => {
            console.info(`getAVCastController11 BusinessError: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(6600102);
        });
        session = null;
        done();
      } else {
       console.info(`SystemCapability.Multimedia.AVSession.ExtendedDisplayCast false`);
       done();
      }
    })


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_1200
     * @tc.name      : getAVCastController() with avsession does not exit(errcode 6600102)
     * @tc.desc      : test getAVCastController() errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      let aVCastController: avSession.AVCastController;
      await session.getAVCastController((err: BusinessError, avcontroller: avSession.AVCastController) => {
        if (err) {
          console.info(`getAVCastController11 BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600102);
        } else {
          aVCastController = avcontroller;
          console.info('getAVCastController11 : SUCCESS');
          expect(false).assertTrue();
        }  
      });
      session = null;
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_1300
     * @tc.name      : on(pause) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(pause) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_STOP_1400
     * @tc.name      : on(stop) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(stop) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_1500
     * @tc.name      : on(playNext) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(playNext) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_1600
     * @tc.name      : on(playPrevious) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(playPrevious) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_1700
     * @tc.name      : on(fastForward) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(fastForward) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_REWIND_1800
     * @tc.name      : on(rewind) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(rewind) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_1900
     * @tc.name      : off(play) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(play) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_2000
     * @tc.name      : off(pause) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(pause) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_STOP_2100
     * @tc.name      : off(stop) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(stop) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_2200
     * @tc.name      : off(playNext) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(playNext) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_2300
     * @tc.name      : off(playPrevious) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(playPrevious) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_2400
     * @tc.name      : off(fastForward) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(fastForward) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_2500
     * @tc.name      : off(rewind) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(rewind) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PLAYFROMASSETID_2600
     * @tc.name      : on(playFromAssetId) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(playFromAssetId) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYFROMASSETID_2700
     * @tc.name      : off(playFromAssetId) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(playFromAssetId) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SEEK_2800
     * @tc.name      : on(seek) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(seek) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_2900
     * @tc.name      : off(seek) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(seek) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_3000
     * @tc.name      : on(setSpeed) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(setSpeed) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_3100
     * @tc.name      : off(setSpeed) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(setSpeed) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_3200
     * @tc.name      : on(setLoopMode) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(setLoopMode) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_3300
     * @tc.name      : off(setLoopMode) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(setLoopMode) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_3400
     * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_3400
     * @tc.desc      : test on(toggleFavorite) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_3500
     * @tc.name      : off(toggleFavorite) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(toggleFavorite) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_3600
     * @tc.name      : on(handleKeyEvent) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(handleKeyEvent) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_3700
     * @tc.name      : off(handleKeyEvent) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(handleKeyEvent) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_3800
     * @tc.name      : on(outputDeviceChange) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(outputDeviceChange) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_3900
     * @tc.name      : off(outputDeviceChange) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(outputDeviceChange) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_4000
     * @tc.name      : on(commonCommand) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(commonCommand) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_4100
     * @tc.name      : off(commonCommand) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(commonCommand) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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



    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_4200
     * @tc.name      : on(skipToQueueItem) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(skipToQueueItem) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_4300
     * @tc.name      : off(skipToQueueItem) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(skipToQueueItem) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_4400
     * @tc.name      : off(castDisplayChange) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(castDisplayChange) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      try {
        await session.off('castDisplayChange');
      } catch (err) {
        let error =err as BusinessError;
        console.info(`off castDisplayChange entry11 error,error code: ${error.code}, message: ${error.message}`);
        expect(err.code).assertEqual(6600102);
      }
      session = null;
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_4500
     * @tc.name      : getAVMetadata() with avsession does not exit(errcode 6600102)
     * @tc.desc      : test getAVMetadata() errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600
     * @tc.name      : getAVMetadata(promise) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test getAVMetadata(promise) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getAVMetadata().then((metadata: avSession.AVMetadata) => {
        console.info(`GetAVMetadata12 : SUCCESS : assetId : ${metadata.assetId}`);
      }).catch((err: BusinessError) => {
        console.error(`GetAVMetadata12 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      });
      session = null;
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700
     * @tc.name      : getLaunchAbility() with avsession does not exit(errcode 6600102)
     * @tc.desc      : test getLaunchAbility() errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getLaunchAbility((err: BusinessError, agent: object) => {
      if (err) {
        console.error(`GetLaunchAbility11 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      } else {
        console.info(`GetLaunchAbility11 : SUCCESS : wantAgent : ${agent}`);
      }
    });
      session = null;
      done();
    })


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800
     * @tc.name      : getLaunchAbility(promise) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test getLaunchAbility(promise) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getLaunchAbility().then((agent: object) => {
        console.info(`GetLaunchAbility12 : SUCCESS : wantAgent : ${agent}`);
      }).catch((err: BusinessError) => {
        console.error(`GetLaunchAbility12 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      });
      session = null;
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900
     * @tc.name      : isActive(promise) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test isActive(promise) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.isActive().then((isActive: boolean) => {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }).catch((err: BusinessError) => {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      });
      session = null;
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000
     * @tc.name      : isActive() with avsession does not exit(errcode 6600102)
     * @tc.desc      : test isActive() errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.isActive((err: BusinessError, isActive: boolean) => {
      if (err) {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      } else {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }
    });
      session = null;
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100
     * @tc.name      : getAVPlaybackState(promise) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test getAVPlaybackState(promise) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getAVPlaybackState().then((state: avSession.AVPlaybackState) => {
        console.info('getAVPlaybackState : SUCCESS');
      }).catch((err: BusinessError) => {
        console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      })
      session = null;
      done();
    })


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200
     * @tc.name      : getAVPlaybackState() with avsession does not exit(errcode 6600102)
     * @tc.desc      : test getAVPlaybackState() errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getAVPlaybackState((err: BusinessError, state: avSession.AVPlaybackState) => {
      if (err) {
        console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      } else {
        console.info('getAVPlaybackState : SUCCESS');
      }
    });
      session = null;
      done();
    })


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PLAY_5300
     * @tc.name      : on(play) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(rewind) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_5400
     * @tc.name      : setAVMetadata - promise - set bundleIcon
     * @tc.desc      : Testing call setAVMetadata(promise) set bundleIcon
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let metadata0: avSession.AVMetadata = {
        assetId: '121278',
      };
      await session.setAVMetadata(metadata0).then(() => {
        console.info('TestLog: Set bundleIcon Successfully');
      }).catch((err: BusinessError ) => {
        console.info(`TestLog: Set bundleIcon error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data: avSession.AVMetadata) => {
        if (data.bundleIcon ) {
          console.info(`${data.bundleIcon} TestLog: Get bundleIcon Successfully`);
          expect(true).assertTrue();
        } else {
          console.info('TestLog: Get bundleIcon failed');
          console.info(`TestLog: bundleIcon is: ${data.bundleIcon}`);
          expect(true).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0100
     * @tc.name      : bind callbacks on setTargetLoopMode events
     * @tc.desc      : Testing on setTargetLoopMode callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        session.on('setTargetLoopMode', (callback: number) => {
            if (callback === 1) {
                console.info('TestLog: Set TargetLoopMode command callback registration successful');
                expect(true).assertTrue();
            } else {
                console.error(`TestLog: Set TargetLoopMode command callback registration error`);
                expect(false).assertTrue();
            };
        });

        try {
            await controller.sendControlCommand({
                command: 'setTargetLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SINGLE
            });
            console.info('TestLog: Controller sent setTargetLoopMode command successfully');
        } catch (err) {
            console.error(`TestLog: Controller command error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        };
        await sleep(500);
        done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0200
     * @tc.name      : on(setTargetLoopMode) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test on(setTargetLoopMode) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0300
     * @tc.name      : on(setTargetLoopMode) with parameter check failed(errcode 401)
     * @tc.desc      : test on(setTargetLoopMode) errcode 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0100
     * @tc.name      : unbind all callbacks on setTargetLoopMode events
     * @tc.desc      : Testing off setTargetLoopMode all callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
            expect(true).assertTrue();
        };
        await sleep(500);
        done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0200
      * @tc.name      : Unbind the specified callback on setTargetLoopMode events
      * @tc.desc      : Testing off setTargetLoopMode specified callback
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level2
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
            parameter: avSession.LoopMode.LOOP_MODE_SINGLE
        });
            console.info('TestLog: Controller send command successfully');
        } catch(err) {
            console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        };
        await sleep(500);
        done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0300
     * @tc.name      : off(setTargetLoopMode) with avsession does not exit(errcode 6600102)
     * @tc.desc      : test off(setTargetLoopMode) errcode 6600102
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_0400
     * @tc.name      : off(setTargetLoopMode) with parameter check failed(errcode 401)
     * @tc.desc      : test off(setTargetLoopMode) errcode 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
    


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_5500
     * @tc.name      : setAVPlaybackState - promise 
     * @tc.desc      : Testing call setAVPlaybackState(promise) 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
      session.setAVPlaybackState(PlaybackState).then(() => {
        console.info('SetAVPlaybackState successfully');
        expect(true).assertTrue();
        done()
      }).catch((err: BusinessError) => {
        console.error(`SetAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
      });
      done();
    })


     /* *
      * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_5600
      * @tc.name      : getAllCastDisplays
      * @tc.desc      : Testing call getAllCastDisplays(6600102)
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level2
      */
    it('SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const isExtendedDisplayCast = canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast');
        if (isExtendedDisplayCast) {
          await session.destroy()
          await sleep(500)
            session.getAllCastDisplays().then((data: Array< avSession.CastDisplayInfo >) => {
                console.info(`getAllCastDisplays success: ${JSON.stringify(data)}`);
                expect(true).assertTrue();
            }).catch((err: BusinessError) => {
                console.info(`getAllCastDisplays successfully: ${err.code}, message: ${err.message}`)
                expect(err.code).assertEqual(6600102);
            });
            session = null;
            done();            
        } else {
            console.info(`SystemCapability.Multimedia.AVSession.ExtendedDisplayCast false`);
            done();
        }
    })


    /* *
      * @tc.number    : SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_5600
      * @tc.name      : stopCasting - callback
      * @tc.desc      : Testing call stopCasting(callback)
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level2
      */
    it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            await session.stopCasting((err:BusinessError) => {
              if (err) {
                  console.info(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
              } else {
                  console.info(`stopCasting successfully`);
                  expect(true).assertTrue();
              };
          });
        } catch (error) {
            console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(6600109);
            if (error.message == "Cannot read property catch of undefined") {
                console.info(`stopCasting callback successfully`);
                expect(true).assertTrue()
            }
        }
        done();
    })
    
    /* *
      * @tc.number    : SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_5700
      * @tc.name      : stopCasting - promise
      * @tc.desc      : Testing call stopCasting(promise)
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level2
      */
    it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            await session.stopCasting().then(() => {
              console.info('stopCasting successfully');
            }).catch((err: BusinessError) => {
              console.error(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
            });
        } catch (error) {
            console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
            if (error.message == "Cannot read property catch of undefined" || error.code == 6600109) {
                console.info(`stopCasting callback successfully`);
                expect(true).assertTrue()
            }
        }
        done();
    })
    
    /* *
      * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_5800
      * @tc.name      : getavcastcontroller - promise
      * @tc.desc      : Testing call getavcastcontroller(promise)
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level2
      */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            if (controller != null) {
              await controller.destroy()
            }
            let aVCastController: avSession.AVCastController;
            await session.getAVCastController().then((avcontroller: avSession.AVCastController) => {
                aVCastController = avcontroller;
                console.info(`getAVCastController : SUCCESS : sessionid `);
            }).catch((err: BusinessError) => {
                console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
            });
        } catch (error) {
            console.info(`getAVCastController failed: code: ${error.code}, message: ${error.message}`);
            if (error.message == "Cannot read property then of undefined" || error.code == 6600109 ) {
                console.info(`getAVCastController callback successfully`);
                expect(true).assertTrue()
            }
        }
        done();
    })


    /* *
      * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_5900
      * @tc.name      : getavcastcontroller - callback
      * @tc.desc      : Testing call getavcastcontroller(callback)
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level2
      */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            if (controller != null) {
              await controller.destroy()
            }
            let aVCastController: avSession.AVCastController;
            await session.getAVCastController((err: BusinessError, avcontroller: avSession.AVCastController) => {
              if (err) {
                console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
              } else {
                aVCastController = avcontroller;
                console.info('getAVCastController : SUCCESS');
              }
            });
        } catch (error) {
            console.error(`getAVCastController BusinessError: code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(6600109);
            if (error.message == "Cannot read property catch of undefined") {
                console.info(`getAVCastController promise successfully`);
                expect(true).assertTrue()
            }
        }
        done();
    })


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000
     * @tc.name      : getLaunchAbility() with controller does not exit(errcode 6600103)
     * @tc.desc      : test getLaunchAbility() errcode 6600103
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy()
      await sleep(500)
      await controller.getLaunchAbility((err: BusinessError, agent: object) => {
      if (err) {
        console.error(`GetLaunchAbility14 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      } else {
        console.info(`GetLaunchAbility14 : SUCCESS : wantAgent : ${agent}`);
      }
    });
      controller = null;
      done();
    })


    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100
     * @tc.name      : getLaunchAbility(promise) with controller does not exit(errcode 6600103)
     * @tc.desc      : test getLaunchAbility(promise) errcode 6600103
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy()
      await sleep(500)
      await controller.getLaunchAbility().then((agent: object) => {
        console.info(`GetLaunchAbility13 : SUCCESS : wantAgent : ${agent}`);
      }).catch((err: BusinessError) => {
        console.error(`GetLaunchAbility13 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      controller = null;
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE6200
     * @tc.name      : isActive(promise) with controller does not exit(errcode 6600103)
     * @tc.desc      : test isActive(promise) errcode 6600103
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy()
      await sleep(500)
      await controller.isActive().then((isActive: boolean) => {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }).catch((err: BusinessError) => {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      controller = null;
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300
     * @tc.name      : isActive() with controller does not exit(errcode 6600103)
     * @tc.desc      : test isActive() errcode 6600103
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy()
      await sleep(500)
      await controller.isActive((err: BusinessError, isActive: boolean) => {
      if (err) {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      } else {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }
    });
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2500
    * @tc.name      : setAVMetadata - promise - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(promise) set singleLyricText-set singleLyricText in different languages
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level2
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
            if (JSON.stringify(data.singleLyricText) === JSON.stringify(metadata.singleLyricText)) {
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Get filter failed');
                expect(false).assertTrue();
            }
        }).catch((err:BusinessError) => {
            console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2600
    * @tc.name      : setAVMetadata - promise - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(promise) set singleLyricText - set singleLyricText with special characters
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level3
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
            if (JSON.stringify(data.singleLyricText) === JSON.stringify(metadata.singleLyricText)) {
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Get filter failed');
                expect(false).assertTrue();
            }
        }).catch((err:BusinessError) => {
            console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2700
    * @tc.name      : setAVMetadata - promise - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(promise) set singleLyricText - set singleLyricText to None
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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
            if (JSON.stringify(data.singleLyricText) === JSON.stringify(metadata.singleLyricText)) {
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Get filter failed');
                expect(false).assertTrue();
            }
        }).catch((err:BusinessError) => {
            console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2800
    * @tc.name      : setAVMetadata - promise - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(promise) set singleLyricText - max length
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const str = 'a'.repeat(40960)
        let metadata:avSession.AVMetadata = {
            assetId: '121278',
            singleLyricText:str.substring(0,40959)
        };
        await session.setAVMetadata(metadata).then(() => {
            console.info('TestLog: Set singleLyricText successfully');
        }).catch((err:BusinessError) => {
            console.error(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        });

        await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
            if (JSON.stringify(data.singleLyricText) === JSON.stringify(metadata.singleLyricText)) {
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Get filter failed');
                expect(false).assertTrue();
            }
        }).catch((err:BusinessError) => {
            console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2900
    * @tc.name      : setAVMetadata - promise - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(promise) set singleLyricText - exceed max length
    * @tc.size      : MediumTest
    * @tc.type      : Fault Tolerance
    * @tc.level     : Level 4
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
            if (JSON.stringify(data.singleLyricText) === JSON.stringify(metadata.singleLyricText)) {
                expect(false).assertTrue();
            } else {
                console.info('TestLog: Get filter failed');
                expect(true).assertTrue();
            }
        }).catch((err:BusinessError) => {
            console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2100
    * @tc.name      : setAVMetadata - callback - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(callback) set singleLyricText-set singleLyricText in different languages
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
            await session.setAVMetadata(metadata, (err:BusinessError) => {
                if (err) {
                    console.info(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
                        if (err) {
                            console.info(`TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (data) {
                            console.info('TestLog: Get singleLyricText Successfully');
                            expect(data.assetId).assertEqual(metadata.assetId);
                            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
                        } else {
                            console.info(`TestLog: Get singleLyricText failed:${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    })
                }
            })
        } catch (err) {
            console.info(`TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
        }
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2200
    * @tc.name      : setAVMetadata - callback - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(callback) set singleLyricText- set singleLyricText with special characters
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */

    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        try {
            await session.setAVMetadata(metadata, (err:BusinessError) => {
                if (err) {
                    console.info(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
                        if (err) {
                            console.info(`TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (data) {
                            console.info('TestLog: Get singleLyricText Successfully');
                            expect(data.assetId).assertEqual(metadata.assetId);
                            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
                        } else {
                            console.info(`TestLog: Get singleLyricText failed:${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    })
                }
            })
        } catch (err) {
            console.info(`TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2300
    * @tc.name      : setAVMetadata - callback - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(callback) set singleLyricText - set singleLyricText to None
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let metadata:avSession.AVMetadata = {
            assetId: '121278',
            singleLyricText:''
        };
        try {
            await session.setAVMetadata(metadata, (err:BusinessError) => {
                if (err) {
                    console.info(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
                        if (err) {
                            console.info(`TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (data) {
                            console.info('TestLog: Get singleLyricText Successfully');
                            expect(data.assetId).assertEqual(metadata.assetId);
                            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
                        } else {
                            console.info(`TestLog: Get singleLyricText failed:${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    })
                }
            })
        } catch (err) {
            console.info(`TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
        }
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2400
    * @tc.name      : setAVMetadata - callback - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(callback) set singleLyricText - max length
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const str = 'a'.repeat(40960)
        let metadata:avSession.AVMetadata = {
            assetId: '121278',
            singleLyricText:str.substring(0,40959)
        };
        try {
            await session.setAVMetadata(metadata, (err:BusinessError) => {
                if (err) {
                    console.info(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
                        if (err) {
                            console.info(`TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (data) {
                            console.info('TestLog: Get singleLyricText Successfully');
                            expect(data.assetId).assertEqual(metadata.assetId);
                            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
                        } else {
                            console.info(`TestLog: Get singleLyricText failed:${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    })
                }
            })
        } catch (err) {
            console.info(`TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
        }
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2500
    * @tc.name      : setAVMetadata - callback - set singleLyricText
    * @tc.desc      : Testing call setAVMetadata(callback) set singleLyricText- exceed max length
    * @tc.size      : MediumTest
    * @tc.type      : Fault Tolerance
    * @tc.level     : Level4
    */

    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const str = 'a'.repeat(40960)
        let metadata:avSession.AVMetadata = {
            assetId: '121278',
            singleLyricText:str.substring(0,40960)
        };
        try {
            await session.setAVMetadata(metadata, (err:BusinessError) => {
                if (err) {
                    console.info(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                } else {
                    controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
                        if (err) {
                            console.info(`TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (data) {
                            console.info('TestLog: Get singleLyricText Successfully');
                            expect(data.assetId).assertEqual(metadata.assetId);
                            expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
                        } else {
                            console.info(`TestLog: Get singleLyricText failed:${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    })
                }
            })
        } catch (err) {
            console.info(`TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
        }
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2600
    * @tc.name      : setAVMetadata - callback - set filter
    * @tc.desc      : Testing call setAVMetadata(callback) set filter- TYPE_CAST_PLUS_AUDIO
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let metadata:avSession.AVMetadata = {
            assetId: '121278',
            filter : avSession.ProtocolType.TYPE_CAST_PLUS_AUDIO
        };
        try {
            await session.setAVMetadata(metadata, (err:BusinessError) => {
                if (err) {
                    console.info(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                } else {
                    controller.getAVMetadata((err:BusinessError, data:avSession.AVMetadata) => {
                        if (err) {
                            console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (data) {
                            console.info('TestLog: Get filter Successfully');
                            expect(data.assetId).assertEqual(metadata.assetId);
                            expect(data.filter).assertEqual(metadata.filter);
                        } else {
                            console.info(`TestLog: Get singleLyricText failed:${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    })
                }
            })
        } catch (err) {
            console.info(`TestLog: set & get filter error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
        }
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_3000
    * @tc.name      : setAVMetadata - promise - set filter
    * @tc.desc      : Testing call setAVMetadata(promise) set filter- TYPE_CAST_PLUS_AUDIO
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let metadata:avSession.AVMetadata = {
            assetId: '121278',
            filter : avSession.ProtocolType.TYPE_CAST_PLUS_AUDIO
        };
        await session.setAVMetadata(metadata).then(() => {
            console.info('TestLog: Set filter successfully');
        }).catch((err:BusinessError) => {
            console.error(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
        });

        await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
            if (JSON.stringify(data.filter) === JSON.stringify(metadata.filter)) {
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Get filter failed');
                expect(false).assertTrue();
            }
        }).catch((err:BusinessError) => {
            console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_2200
    * @tc.name      : getOutputDevice - promise - streamInfos not undefined
    * @tc.desc      : Testing call getOutputDevice(promise) streamInfos not undefined
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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
                expect(true).assertTrue();
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


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_2300
    * @tc.name      : getOutputDevice - callback - streamInfos not undefined
    * @tc.desc      : Testing call getOutputDevice(callback) streamInfos not undefined
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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
              expect(true).assertTrue();
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


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2400
    * @tc.name      : getOutputDevice - promise - set pcmSrc -true
    * @tc.desc      : Testing call getOutputDevice(promise)  set pcmSrc -true
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2500
    * @tc.name      : getOutputDevice - promise - set pcmSrc -false
    * @tc.desc      : Testing call getOutputDevice(promise)  set pcmSrc -false
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2600
    * @tc.name      : getOutputDevice - promise - set pcmSrc -undefined
    * @tc.desc      : Testing call getOutputDevice(promise)  set pcmSrc -undefined
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 4
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2700
    * @tc.name      : getOutputDevice - callback - set pcmSrc -true
    * @tc.desc      : Testing call getOutputDevice(callback)  set pcmSrc -true
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2800
    * @tc.name      : getOutputDevice - callback - set pcmSrc -false
    * @tc.desc      : Testing call getOutputDevice(callback)  set pcmSrc -false
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_2900
    * @tc.name      : getOutputDevice - callback - set pcmSrc -undefined
    * @tc.desc      : Testing call getOutputDevice(callback)  set pcmSrc -undefined
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 4
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


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0900
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0900
    * @tc.desc      : Testing sendCommonCommand errcode 6600102
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      let commandName = "my_command";
      await controller.sendCommonCommand(commandName, {command : "This is my command"}, (err: BusinessError) => {
        if (err) {
          console.error(`SendCommonCommand BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600102);
        }
      })
      await sleep(500);
      done();
    })


   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_1100
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_1100
    * @tc.desc      : Testing sendCommonCommand errcode 6600102
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      let commandName = "my_command";
      await controller.sendCommonCommand(commandName, {command : "This is my command"}).then(() => {
        console.info('SendCommonCommand successfully');
      }).catch((err: BusinessError) => {
        console.error(`SendCommonCommand BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      })
      await sleep(500);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0300
    * @tc.desc      : Testing setextras to boolean
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0400
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0400
    * @tc.desc      : Testing setextras to number
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0500
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0500
    * @tc.desc      : Testing setextras to array
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0600
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0600
    * @tc.desc      : Testing setextras to boolean
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0700
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0700
    * @tc.desc      : Testing setextras to number
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0800
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0800
    * @tc.desc      : Testing setextras to array
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0300
    * @tc.desc      : Testing on(handleKeyEvent) errcode 401
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_0300
    * @tc.desc      : Testing off(handleKeyEvent) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1200
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1200
    * @tc.desc      : Testing sendAVKeyEvent-promise errcode 6600102
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      await controller.sendAVKeyEvent(event).then(() => {
        console.info('SendAVKeyEvent Successfully');
      }).catch((err: BusinessError) => {
        console.error(`SendAVKeyEvent BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      });
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1000
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1000
    * @tc.desc      : Testing sendAVKeyEvent-callback errcode 6600102
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      await controller.sendAVKeyEvent(event, (err: BusinessError) => {
        if (err) {
          console.error(`SendAVKeyEvent BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600102);
        } else {
          console.info('SendAVKeyEvent Successfully');
        }
      });
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0900
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0900
    * @tc.desc      : Testing sendAVKeyEvent-callback errcode 401
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.sendAVKeyEvent(event1, (err: BusinessError) => {
        if (err) {
          console.error(`SendAVKeyEvent BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        } else {
          console.info('SendAVKeyEvent Successfully');
        }
      });
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1100
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1100
    * @tc.desc      : Testing sendAVKeyEvent-promise errcode 401
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.sendAVKeyEvent(event1).then(() => {
        console.info('SendAVKeyEvent Successfully');
      }).catch((err: BusinessError) => {
        console.error(`SendAVKeyEvent BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWORD_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWORD_ERRORCODE_0300
    * @tc.desc      : Testing off(fastForward) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_ERRORCODE_0300
    * @tc.desc      : Testing off(pause) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_ERRORCODE_0300
    * @tc.desc      : Testing off(play) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_ERRORCODE_0300
    * @tc.desc      : Testing off(playPrevious) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_ERRORCODE_0300
    * @tc.desc      : Testing off(rewind) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_ERRORCODE_0300
    * @tc.desc      : Testing off(seek) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_ERRORCODE_0300
    * @tc.desc      : Testing off(setLoopMode) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_ERRORCODE_0300
    * @tc.desc      : Testing off(setSpeed) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_ERRORCODE_0300
    * @tc.desc      : Testing off(setTargetLoopMode) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('setTargetLoopMode')
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }      
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_STOP_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_STOP_ERRORCODE_0300
    * @tc.desc      : Testing off(stop) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_ERRORCODE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_ERRORCODE_0300
    * @tc.desc      : Testing off(toggleFavorite) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DESTORY_ERRORCODE_0500
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_DESTORY_ERRORCODE_0500
    * @tc.desc      : Testing off(toggleFavorite) errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_AVSESSION_DESTORY_ERRORCODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try{
        await controller.destroy();
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      }      
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_3000
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_3000
    * @tc.desc      : Testing call getOutputDevice(callback)  set launchClientData
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
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

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0100
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0100
    * @tc.desc      : Testing call sendCustomData(data) of avsession
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('avsession sendCustomData Start');
      await session.sendCustomData(customdata).then(() => {
        console.info('avsession sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`avsession sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0200
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0200
    * @tc.desc      : Testing call sendCustomData(data) of controller
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('controller sendCustomData Start');
      await controller.sendCustomData(customdata).then(() => {
        console.info('controller sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0300
    * @tc.desc      : Testing call sendCustomData(data) of session errcode 6600102
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try{
        await session.sendCustomData(customdata);
      } catch(err) {
        console.info(`session sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      };
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0400
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0400
    * @tc.desc      : Testing call sendCustomData(data) of session errcode 401
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let customdata1: string = 'appdata'
      console.info('session sendCustomData Start');
      await session.sendCustomData(customdata1).then(() => {
        console.info('session sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`session sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0500
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0500
    * @tc.desc      : Testing call sendCustomData(data) of controller errcode 6600103
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try{
        await controller.sendCustomData(customdata);
      } catch(err) {
        console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      };
      await sleep(300);
      done();
    })

  /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0600
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0600
    * @tc.desc      : Testing call sendCustomData(data) of session errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let customdata2: Record<string,string>  = {'appdata' : 'aaa'}
      console.info('session sendCustomData Start');
      await session.sendCustomData(customdata2).then(() => {
        console.info('session sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`session sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      });
      await sleep(300);
      done();
    })

  /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0700
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0700
    * @tc.desc      : Testing call sendCustomData(data) of controller errcode 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let customdata2: Record<string,string>  = {'appdata' : 'aaa'}
      console.info('controller sendCustomData Start');
      await controller.sendCustomData(customdata2).then(() => {
        console.info('controller sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      });
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0800
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0800
    * @tc.desc      : Testing call sendCustomData(data) of controller errcode 6600102
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try{
        await controller.sendCustomData(customdata);
      } catch(err) {
        console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      };
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0100
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0100
    * @tc.desc      : Testing call on(customDataChange) of session
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.on('customDataChange',(data: Record<string,string>) => {
        console.info(`session on_customDataChange Successfully ${data}`)
        session.off('customDataChange');
        expect(true).assertTrue();
        done();
      })    
      await session.sendCustomData(customdata);
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0200
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0200
    * @tc.desc      : Testing call on(customDataChange) of session 6600102
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try{
        await session.on('customDataChange',(data: Record<string,string>) => {
        console.info(`on_customDataChange Successfully ${data}`);
        });
      } catch(err) {
        console.info(`session on_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      };
      await sleep(300);
      done();
    })    

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0300
    * @tc.desc      : Testing call on(customDataChange) of controller
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.on('customDataChange',(data: Record<string,string>) => {
        console.info(`session on_customDataChange Successfully ${data}`)
        controller.off('customDataChange');
        expect(true).assertTrue();
        done();
      })    
      await controller.sendCustomData(customdata);
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0400
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0400
    * @tc.desc      : Testing call on(customDataChange) of controller 6600103
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try{
        await controller.on('customDataChange',(data: Record<string,string>) => {
        console.info(`on_customDataChange Successfully ${data}`);
        });
      } catch(err) {
        console.info(`controller on_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      };
      await sleep(300);
      done();
    })    

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0100
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0100
    * @tc.desc      : Testing call off(customDataChange) of session
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.on('customDataChange',(data: Record<string,string>) => {
        console.info(`session on_customDataChange Successfully ${data}`);
        expect(false).assertTrue();
        done();
      })
      await session.off('customDataChange');
      console.info('session off_customDataChange end')    
      await session.sendCustomData(customdata);
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0200
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0200
    * @tc.desc      : Testing call off(customDataChange) of session 6600101
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('customDataChange');
      } catch(err) {
        console.info(`session off_customDataChangeBusinessError: code: ${err.code}, message: ${err.message}`);    
        expect(err.code).assertEqual(6600101);
      };
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0300
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0300
    * @tc.desc      : Testing call off(customDataChange) of controller
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.on('customDataChange',(data: Record<string,string>) => {
        console.info(`controller on_customDataChange Successfully ${data}`);
        expect(false).assertTrue();
        done();
      })
      await controller.off('customDataChange');
      console.info('controller off_customDataChange end')    
      await controller.sendCustomData(customdata);
      await sleep(300);
      done();
    })

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0400
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0400
    * @tc.desc      : Testing call off(customDataChange) of controller 6600103
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try{
        await controller.off('customDataChange');
      } catch(err) {
        console.info(`controller off_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      };
      await sleep(300);
      done();
    })   

   /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0500
    * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0500
    * @tc.desc      : Testing call off(customDataChange) of controller 6600102
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */

    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try{
        await session.off('customDataChange');
      } catch(err) {
        console.info(`session off_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      };
      await sleep(300);
      done();
    })   




  })
}

