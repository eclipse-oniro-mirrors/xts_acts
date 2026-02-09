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
  describe('AVSessionExtendedDisplayCast', () => {
    let TAG: string = "[AVSessionExtendedDisplayCast]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'AVSessionExtendedDisplayCastXTS';
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_4400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_4400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_4400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_5600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_5600
     * @tc.desc   Testing call getAllCastDisplays(6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const isExtendedDisplayCast = canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast');
      if (isExtendedDisplayCast) {
        await session.destroy()
        await sleep(500)
        session.getAllCastDisplays().then((data: Array< avSession.CastDisplayInfo >) => {
          console.info(`getAllCastDisplays success with session destroyed: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
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



  })
}

