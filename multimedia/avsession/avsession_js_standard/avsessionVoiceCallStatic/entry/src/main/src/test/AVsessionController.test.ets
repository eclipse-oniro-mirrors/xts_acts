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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import avSession from '@ohos.multimedia.avsession';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';

let context: common.UIAbilityContext;
export default function abilityTest() {
  describe('AVSessionControllerTest', () => {
    let TAG: string = "[AVSessionControllerTest]";
    let session: avSession.AVSession | null = null;
    let controller: avSession.AVSessionController;
    let tag: string = 'VoiceCallXTS';
    let event1: string = 'aaa'
    let customdata: Record<string,string> = {'customData': 'appdata'}
    let eventName = 'dynamic_lyric'

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context, tag, 'voice_call').then((data) => {
        session = data;
        console.info(`${TAG}: avSession create success`);
      }).catch((err) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
      });
      await session!.activate().then(() => {
        console.info(`${TAG}: Session activate`);
      }).catch((err) => {
        console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
      });
      try {
        controller = await session!.getController();
      } catch (err) {
        console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
      }
      await Utils.msSleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
      if (session != null) {
        await session!.destroy().then(() => {
          console.info(`${TAG}: Session destroy success`);
        }).catch((err) => {
          console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Session is already destroy`);
      }
      if (controller != null) {
        await controller.destroy().then(() => {
          console.info(`${TAG}: Controller destroy success`);
        }).catch((err) => {
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0100
     * @tc.desc   Testing isDesktopLyricEnabled (normal scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0100';
      try {
        let isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        await session!.enableDesktopLyric(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0200
     * @tc.desc   Testing isDesktopLyricEnabled when the session does not exist.(throw 6600102）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0200';
        try {
          await session!.destroy();
          try {
            await controller.isDesktopLyricEnabled();
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0300
     * @tc.desc   Test isDesktopLyricEnabled when the controller does not exit. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0300';
      try {
        await controller.destroy();
        try {
          await controller.isDesktopLyricEnabled();
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0400
     * @tc.desc   Test isDesktopLyricEnabled when the desktop lyrics feature is not supported. (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_STATIC_0400';
      try {
        let isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (isSupported) {
          done();
          return;
        }
        await controller.isDesktopLyricEnabled();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_STATIC_0100
     * @tc.desc   Testing onDesktopLyricEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_STATIC_0100';
      try {
        let isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        let callbackTriggered = false;
        let callback = (data: boolean) => {
          callbackTriggered = data;
          console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
        }
        controller.onDesktopLyricEnabled(callback);
        await session!.enableDesktopLyric(true);
        await Utils.msSleep(200);
        expect(callbackTriggered).assertTrue();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_STATIC_0200
     * @tc.desc   Testing onDesktopLyricEnabled when session controller does not exist. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_STATIC_0200';
      try {
        await controller.destroy();
        try {
          controller.onDesktopLyricEnabled((data: boolean) => {
          });
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
        }
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0100
     * @tc.desc   Testing offDesktopLyricEnabled unregisters all callbacks (verify no trigger after unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0100';
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
        await session!.enableDesktopLyric(true);
        await Utils.msSleep(200);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0200
     * @tc.desc   Testing offDesktopLyricEnabled unregisters specif callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0200';
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
        await session!.enableDesktopLyric(true);
        await Utils.msSleep(200);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertFalse();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0300
     * @tc.desc   Testing offDesktopLyricEnabled when session controller not exist(throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_STATIC_0300';
      try {
        await controller.destroy();
        try {
          controller.offDesktopLyricEnabled();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
        }
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0100
     * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session!.enableDesktopLyric(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0200
     * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0200';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        await session!.enableDesktopLyric(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0100
     * @tc.desc   Testing setDesktopLyricVisible when desktop lyrics feature is not supported (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0100';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (isSupported) {
          done();
          return;
        }
        await controller.setDesktopLyricVisible(true);
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0200
     * @tc.desc   Testing setDesktopLyricVisible when desktop lyrics feature of this application is not enabled (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0200';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        await session!.enableDesktopLyric(false);
        await controller.setDesktopLyricVisible(true);
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0300
     * @tc.desc   Testing setDesktopLyricVisible when session does not exist (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0300';
      try {
        await session!.destroy();
        try {
          await controller.setDesktopLyricVisible(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0400
     * @tc.desc   Testing setDesktopLyricVisible when session controller does not exist (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_STATIC_0400';
      try {
        await controller.destroy();
        try {
          await controller.setDesktopLyricVisible(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0100
     * @tc.desc   Testing isDesktopLyricVisible when desktop lyrics feature is not supported (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0100';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (isSupported) {
          done();
          return;
        }
        await controller.isDesktopLyricVisible();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0200
     * @tc.desc   Testing isDesktopLyricVisible when desktop lyrics feature of this application is not enabled (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0200';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        await session!.enableDesktopLyric(false);
        await controller.isDesktopLyricVisible();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0300
     * @tc.desc   Testing isDesktopLyricVisible when session does not exist (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0300';
      try {
        await session!.destroy();
        try {
          await controller.isDesktopLyricVisible();
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0400
     * @tc.desc   Testing isDesktopLyricVisible when session controller does not exist. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICVISIBLE_STATIC_0400';
      try {
        await controller.destroy();
        try {
          await controller.isDesktopLyricVisible();
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100
     * @tc.desc   Testing onDesktopLyricVisibilityChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        let callbackTriggered: boolean = false;
        let callback = (data: boolean) => {
          callbackTriggered = data;
          console.info(`${TAG}: boolean: callback triggered (visible=${data})`);
        }
        await session!.enableDesktopLyric(true);
        controller.onDesktopLyricVisibilityChanged(callback);
        await controller.setDesktopLyricVisible(true);
        await Utils.msSleep(200);
        expect(callbackTriggered).assertTrue();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200
     * @tc.desc   Testing onDesktopLyricVisibilityChanged when session controller does not exist. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200';
      try {
        await controller.destroy();
        try {
          controller.onDesktopLyricVisibilityChanged((data: boolean) => {
          });
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100
     * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters all callbacks (verify no trigger after unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100';
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
        await session!.enableDesktopLyric(true);
        controller.onDesktopLyricVisibilityChanged(callback1);
        controller.onDesktopLyricVisibilityChanged(callback2);
        controller.offDesktopLyricVisibilityChanged(callback1);
        await controller.setDesktopLyricVisible(true);
        await Utils.msSleep(200);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200
     * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters specific callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200';
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
        await session!.enableDesktopLyric(true);
        controller.onDesktopLyricVisibilityChanged(callback1);
        controller.onDesktopLyricVisibilityChanged(callback2);
        controller.offDesktopLyricVisibilityChanged();
        await controller.setDesktopLyricVisible(true);
        await Utils.msSleep(200);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertFalse();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0300
     * @tc.desc   Testing offDesktopLyricVisibilityChanged when session controller does not exist.(throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0300';
      try {
        await controller.destroy();
        try {
          controller.offDesktopLyricVisibilityChanged();
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0100
     * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: true) - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0100';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        await session!.enableDesktopLyric(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0200
     * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: false) - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0200';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        await session!.enableDesktopLyric(true);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0100
     * @tc.desc   Testing setDesktopLyricState when desktop lyrics feature is not supported. (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0100';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (isSupported) {
          done();
          return;
        }
        let state: avSession.DesktopLyricState = { isLocked: false };
        await controller.setDesktopLyricState(state);
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0200
     * @tc.desc   Testing setDesktopLyricState when desktop lyrics feature of this application is not enabled. (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0200';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        await session!.enableDesktopLyric(false);
        let state: avSession.DesktopLyricState = { isLocked: false };
        await controller.setDesktopLyricState(state);
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0300
     * @tc.desc   Testing setDesktopLyricState when session does not exist. (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0300';
      try {
        await session!.destroy();
        try {
          let state: avSession.DesktopLyricState = { isLocked: false };
          await controller.setDesktopLyricState(state);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0400
     * @tc.desc   Testing setDesktopLyricState when session controller does not exist.(throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_STATIC_0400';
      try {
        await controller.destroy();
        try {
          let state: avSession.DesktopLyricState = { isLocked: false };
          await controller.setDesktopLyricState(state);
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0100
     * @tc.desc   Testing getDesktopLyricState when desktop lyrics feature is not supported. (throw 6600111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0100';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (isSupported) {
          done();
          return;
        }
        await controller.getDesktopLyricState();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0200
     * @tc.desc   Testing getDesktopLyricState when desktop lyrics feature of this application is not enabled. (throw 6600110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0200';
      try {
        const isSupported: boolean = await avSession.isDesktopLyricSupported();
        if (!isSupported) {
          done();
          return;
        }
        await session!.enableDesktopLyric(false);
        await controller.getDesktopLyricState();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0300
     * @tc.desc   Testing getDesktopLyricState when session does not exist. (throw 6600102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0300';
      try {
        await session!.destroy();
        try {
          await controller.getDesktopLyricState();
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0400
     * @tc.desc   Testing getDesktopLyricState when session controller does not exist. (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_GETDESKTOPLYRICSTATE_STATIC_0400';
      try {
        await controller.destroy();
        try {
          await controller.getDesktopLyricState();
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_STATIC_0100
     * @tc.desc   Testing onDesktopLyricStateChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_STATIC_0100';
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
        await session!.enableDesktopLyric(true);
        controller.onDesktopLyricStateChanged(callback);
        let state: avSession.DesktopLyricState = { isLocked: true };
        await session!.setDesktopLyricState(state);
        await Utils.msSleep(200);
        expect(callbackTriggered).assertTrue();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_STATIC_0200
     * @tc.desc   Testing onDesktopLyricStateChanged when session not exit (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_STATIC_0200';
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0100
     * @tc.desc   Testing offDesktopLyricStateChanged unregisters all callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0100';
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
        await session!.enableDesktopLyric(true);
        controller.onDesktopLyricStateChanged(callback1);
        controller.onDesktopLyricStateChanged(callback2);
        controller.offDesktopLyricStateChanged(callback1);
        let state: avSession.DesktopLyricState = { isLocked: true };
        await session!.setDesktopLyricState(state);
        await Utils.msSleep(200);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0200
     * @tc.desc   Testing offDesktopLyricStateChanged unregisters specified callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0200';
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
        await session!.enableDesktopLyric(true);
        controller.onDesktopLyricStateChanged(callback1);
        controller.onDesktopLyricStateChanged(callback2);
        controller.offDesktopLyricStateChanged();
        let state: avSession.DesktopLyricState = { isLocked: true };
        await session!.setDesktopLyricState(state);
        await Utils.msSleep(200);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertFalse();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0300
     * @tc.desc   Testing offDesktopLyricStateChanged when session not exit (throw 6600103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_STATIC_0300';
      try {
        await controller.destroy();
        try {
          controller.offDesktopLyricStateChanged();
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
  })
}
