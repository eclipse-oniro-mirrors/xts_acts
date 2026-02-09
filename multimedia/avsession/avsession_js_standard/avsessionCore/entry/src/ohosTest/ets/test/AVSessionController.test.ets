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
  describe('AVSessionController', () => {
    let TAG: string = "[AVSessionController]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'VoiceCallXTS';
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_6200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_6200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_6200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0900
     * @tc.desc   Testing sendCommonCommand errcode 6600102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_1100
     * @tc.desc   Testing sendCommonCommand errcode 6600102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1200
     * @tc.desc   Testing sendAVKeyEvent-promise errcode 6600102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1000
     * @tc.desc   Testing sendAVKeyEvent-callback errcode 6600102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0900
     * @tc.desc   Testing sendAVKeyEvent-callback errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1100
     * @tc.desc   Testing sendAVKeyEvent-promise errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DESTORY_ERRORCODE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DESTORY_ERRORCODE_0500
     * @tc.desc   Testing off(toggleFavorite) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_PROMISE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_PROMISE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.isActive().then((isActive: boolean) => {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }).catch((err: BusinessError) => {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_PROMISE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_PROMISE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.destroy();
      await controller.isActive().then((isActive: boolean) => {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_CALLBACK_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_CALLBACK_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.isActive((err: BusinessError, isActive: boolean) => {
        if (err) {
          console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_CALLBACK_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_CALLBACK_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.destroy();
      await controller.isActive((err: BusinessError, isActive: boolean) => {
        if (err) {
          console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600103);
        } else {
          console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
          expect(false).assertTrue();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.destroy();
      await controller.getAVPlaybackState((err: BusinessError, state: avSession.AVPlaybackState) => {
        if (err) {
          console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600103);
        } else {
          console.info(`getAVPlaybackState : SUCCESS`);
          expect(false).assertTrue();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.destroy();
      await controller.getAVPlaybackState().then((state: avSession.AVPlaybackState) => {
        console.info(`getAVPlaybackState : SUCCESS `);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      await controller.getAVMetadata((err: BusinessError, metadata: avSession.AVMetadata) => {
          if (err) {
            console.error(`GetAVMetadata BusinessError: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(6600103);
          } else {
            console.info(`GetAVMetadata : SUCCESS : assetId : ${metadata.assetId}`);
            expect(false).assertTrue();
          }
        });
      done();
    })   


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      await controller.getAVMetadata().then((metadata: avSession.AVMetadata) => {
        console.info(`GetAVMetadata : SUCCESS : assetId : ${metadata.assetId}`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.error(`GetAVMetadata BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        await controller.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
                if(items.length){
                    console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);           
                    expect(items.length>0).assertTrue();            
                }else{
                    console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
                    expect(items.length==0).assertTrue();
                }
            }).catch((err: BusinessError) => {
            });
      } catch (err) {
        console.info('GetAVQueueItems failed${err.code} message:${err.message}');
        done();
      }
      done();
    })  


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        await controller.getAVQueueItems((err: BusinessError, items: avSession.AVQueueItem[]) => {
            if (err) {
                expect(items.length>0).assertTrue();
                console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
            } else {
                expect(items.length==0).assertTrue();
                console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
            }
            })
      } catch (err) {
        console.info('GetAVQueueItems failed${err.code} message:${err.message}');
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSSYNC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSSYNC_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSSYNC_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSSYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let currentQueueItems: Array<avSession.AVQueueItem> = await controller.getAVQueueItemsSync();
        if(currentQueueItems.length){
            console.info(`GetAVQueueItemsSync : SUCCESS : length : ${currentQueueItems.length}`);           
            expect(currentQueueItems.length>0).assertTrue();            
        }else{
            console.info(`GetAVQueueItemsSync : SUCCESS : length : ${currentQueueItems.length}`);
            expect(currentQueueItems.length==0).assertTrue();
        }
      } catch (err) {
        let error = err as BusinessError;
        console.error(`getAVQueueItemsSync error, error code: ${error.code}, error message: ${error.message}`);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try{
          await controller.isActive().then((isActive: boolean) => {
            if (isActive) {
                expect(isActive).assertEqual(true);
            } else {
                expect(isActive).assertEqual(false);
                console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
            }
          }).catch((err: BusinessError) => {
            console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
          });
        } catch (err) {
        console.info('IsActive failed${err.code} message:${err.message}');
        done();
      }
      done();
    })          


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await controller.isActive((err: BusinessError, isActive: boolean) => {
            if (err) {
                expect(isActive).assertEqual(false);
                console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
            } else {
                expect(isActive).assertEqual(true);
                console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
            }
            });
        } catch (err) {
        console.info('IsActive failed${err.code} message:${err.message}');
        done();
      }
      done();
    })  



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
            let isActive: boolean = await controller.isActiveSync();
            if(isActive){
                console.info(`isActiveSync : SUCCESS :  ${isActive}`);           
                expect(isActive).assertEqual(true);            
            }else{
                console.info(`isActiveSync : SUCCESS :  ${isActive}`);
                expect(isActive).assertEqual(false); 
            }
        } catch (err) {
            let error = err as BusinessError;
            console.error(`isActiveSync error, error code: ${error.code}, error message: ${error.message}`);
        }
      done();
    })  


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        await controller.getValidCommands().then((validCommands: avSession.AVControlCommandType[]) => {
                if(validCommands.length){
                    console.info(`GetvalidCommands : SUCCESS : length : ${validCommands.length}`);           
                    expect(validCommands.length>0).assertTrue();            
                }else{
                    console.info(`GetvalidCommands : SUCCESS : length : ${validCommands.length}`);
                    expect(validCommands.length==0).assertTrue();
                }
            }).catch((err: BusinessError) => {

            console.error(`getValidCommands BusinessError: code: ${err.code}, message: ${err.message}`);
            });
      } catch (err) {
        console.info('getValidCommands failed${err.code} message:${err.message}');
        done();
      }
      done();
    })  


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        await controller.getValidCommands((err: BusinessError, validCommands: avSession.AVControlCommandType[]) => {
            if (err) {
                expect(validCommands.length>0).assertTrue();
                console.error(`GetvalidCommands BusinessError: code: ${err.code}, message: ${err.message}`);
            } else {
                expect(validCommands.length==0).assertTrue();
                console.info(`GetvalidCommands : SUCCESS : length : ${validCommands.length}`);
            }
            })
      } catch (err) {
        console.info('GetvalidCommands failed${err.code} message:${err.message}');
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let validCommands: Array<avSession.AVControlCommandType> = await controller.getValidCommandsSync();
        if(validCommands.length){
            console.info(`GetvalidCommandsSync : SUCCESS : length : ${validCommands.length}`);           
            expect(validCommands.length>0).assertTrue();            
        }else{
            console.info(`GetvalidCommandsSync : SUCCESS : length : ${validCommands.length}`);
            expect(validCommands.length==0).assertTrue();
        }
      } catch (err) {
        let error = err as BusinessError;
        console.error(`GetvalidCommandsSync error, error code: ${error.code}, error message: ${error.message}`);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG}: before SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100 ${controller}`);
        const COMMON_COMMAND_STRING = undefined;
        await controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then(() => {
            console.info(`${TAG}: getExtrasWithEvent successfully`);
            expect(false).assertTrue();
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(err.code).assertEqual(401);
        })
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0200
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_XXX";
        await controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then(() => {
            console.info(`${TAG}: getExtrasWithEvent successfully`);
        }).catch((err: BusinessError) => {
            if (err.message == 'expect true, actualValue is false' || err.code == 6600105){
                console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            } else {
                console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }           
        })
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0300
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_VOLUME";
        let extras: avSession.ExtraInfo = await controller.getExtrasWithEvent(COMMON_COMMAND_STRING);
        console.info(`${TAG}: aduio get volume with ${JSON.stringify(extras)}`);
        if (JSON.stringify(extras) == '{}' || 0 <= extras[COMMON_COMMAND_STRING] && extras[COMMON_COMMAND_STRING] <= 15){
          console.info(`${TAG}: aduio get volume with ${extras[COMMON_COMMAND_STRING]}`);
        } else {
          expect(false).assertTrue();
        }           
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0400
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_AVAILABLE_DEVICES";
        controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then((extras: avSession.ExtraInfo) => {
            console.info(` AUDIO_GET_AVAILABLE_DEVICES ${extras[COMMON_COMMAND_STRING]}`);
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(false).assertTrue();
        })
        done();
    })
    

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0500
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_PREFERRED_OUTPUT_DEVICE_FOR_RENDERER_INFO";
        controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then((extras: avSession.ExtraInfo) => {
            console.info(` AUDIO_GET_PREFERRED_OUTPUT_DEVICE_FOR_RENDERER_INFO ${extras[COMMON_COMMAND_STRING]}`);
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(false).assertTrue();
        })
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0100
     * @tc.desc   Testing isDesktopLyricEnabled = true (normal scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0100';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          let isEnable: boolean = await controller.isDesktopLyricEnabled();
          console.info(`${TAG}: isDesktopLyricEnabled SUCCESS: isEnable: ${isEnable}`)
          expect(isEnable).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_2200
     * @tc.desc   Testing isDesktopLyricEnabled = false (normal scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_2200';
        let isEnable: boolean = true;
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          isEnable = await controller.isDesktopLyricEnabled();
          console.info(`${TAG}: isDesktopLyricEnabled SUCCESS: isEnable: ${isEnable}`)
          await session.enableDesktopLyric(false);
          isEnable = await controller.isDesktopLyricEnabled();
          console.info(`${TAG}: isDesktopLyricEnabled SUCCESS: isEnable: ${isEnable}`)
          expect(isEnable).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0100
     * @tc.desc   Testing onDesktopLyricEnabled - callback equals true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0100';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData = false;
          let callbackTriggered = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: TestLog: onDesktopLyricEnabled callback data = ${data})`);
          }
          controller.onDesktopLyricEnabled(callback);
          await session.enableDesktopLyric(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_2200
     * @tc.desc   Testing onDesktopLyricEnabled - callback equals false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_2200';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData = false;
          let callbackTriggered = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: TestLog: onDesktopLyricEnabled callback data = ${data})`);
          }
          await session.enableDesktopLyric(true);
          await sleep(200);
          controller.onDesktopLyricEnabled(callback);
          await session.enableDesktopLyric(false);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0100
     * @tc.desc   Testing offDesktopLyricEnabled unregisters all callbacks (verify no trigger after unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0100';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: boolean) => {
            callback1Triggered = data;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          };
          let callback2 = (data: boolean) => {
            callback2Triggered = data;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          };
          controller.onDesktopLyricEnabled(callback1);
          controller.onDesktopLyricEnabled(callback2);
          controller.offDesktopLyricEnabled(callback1);
          await session.enableDesktopLyric(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0200
     * @tc.desc   Testing offDesktopLyricEnabled unregisters specif callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0200';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: boolean) => {
            callback1Triggered = data;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          };
          let callback2 = (data: boolean) => {
            callback2Triggered = data;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          };
          controller.onDesktopLyricEnabled(callback1);
          controller.onDesktopLyricEnabled(callback2);
          controller.offDesktopLyricEnabled();
          await session.enableDesktopLyric(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0100
     * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          await controller.setDesktopLyricVisible(true);
          const getVisibleResult: boolean = await controller.isDesktopLyricVisible();
          expect(getVisibleResult).assertEqual(true);
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0200
     * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          await controller.setDesktopLyricVisible(false);
          const getVisibleResult: boolean = await controller.isDesktopLyricVisible();
          expect(getVisibleResult).assertEqual(false);
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.desc   Testing onDesktopLyricVisibilityChanged - callback equals true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData:boolean = false;
          let callbackTriggered: boolean = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: onDesktopLyricVisibilityChanged callback triggered, data = ${data})`);
          }
          await session.enableDesktopLyric(true);
          controller.onDesktopLyricVisibilityChanged(callback);
          await controller.setDesktopLyricVisible(true);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
          expect(callbackTriggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_2200
     * @tc.desc   Testing onDesktopLyricVisibilityChanged - callback equals false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_2200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData:boolean = true;
          let callbackTriggered: boolean = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: onDesktopLyricVisibilityChanged callback triggered, data = ${data})`);
          }
          await session.enableDesktopLyric(true);
          await controller.setDesktopLyricVisible(true);
          controller.onDesktopLyricVisibilityChanged(callback);
          await controller.setDesktopLyricVisible(false);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters all callbacks (verify no trigger after unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0100';
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
          controller.onDesktopLyricVisibilityChanged(callback1);
          controller.onDesktopLyricVisibilityChanged(callback2);
          controller.offDesktopLyricVisibilityChanged(callback1);
          await controller.setDesktopLyricVisible(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters specific callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0200';
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
          controller.onDesktopLyricVisibilityChanged(callback1);
          controller.onDesktopLyricVisibilityChanged(callback2);
          controller.offDesktopLyricVisibilityChanged();
          await controller.setDesktopLyricVisible(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0100
     * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: true) - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0100',
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
          await controller.setDesktopLyricState(state);
          let getState: avSession.DesktopLyricState = await controller.getDesktopLyricState();
          expect(getState.isLocked).assertEqual(true)
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0200
     * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: false) - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          let state: avSession.DesktopLyricState = { isLocked: false };
          await controller.setDesktopLyricState(state);
          let getState: avSession.DesktopLyricState = await controller.getDesktopLyricState();
          expect(getState.isLocked).assertEqual(false)
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0100
     * @tc.desc   Testing onDesktopLyricStateChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0100';
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
          controller.onDesktopLyricStateChanged(callback);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0100
     * @tc.desc   Testing offDesktopLyricStateChanged unregisters all callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0100';
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
          controller.onDesktopLyricStateChanged(callback1);
          controller.onDesktopLyricStateChanged(callback2);
          controller.offDesktopLyricStateChanged(callback1);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0200
     * @tc.desc   Testing offDesktopLyricStateChanged unregisters specified callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0200';
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
          controller.onDesktopLyricStateChanged(callback1);
          controller.onDesktopLyricStateChanged(callback2);
          controller.offDesktopLyricStateChanged();
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

