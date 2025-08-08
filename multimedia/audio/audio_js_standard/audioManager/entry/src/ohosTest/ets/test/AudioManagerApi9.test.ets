/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import call from '@ohos.telephony.call';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import { Permissions } from '@ohos.abilityAccessCtrl';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { BY, UiDriver } from '@ohos.UiTest';
import { deviceInfo } from "@kit.BasicServicesKit";

let deviceTypeInfo: string = deviceInfo.deviceType
let TagFrmwk = "audioManagerApi9Test";
console.info(`${TagFrmwk}: Create AudioManger Object JS Framework`);
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let audioManager: audio.AudioManager;
let streamManager: audio.AudioStreamManager;
let audioMedia = 3;
let minVol = 0;
let maxVol = 15;
let maxVolPc = 20;
let volGroupId = null;
let volConnectType = null;
let onMicStateChangeFlag1: boolean | null = null;
let onMicStateChangeFlag2: boolean | null = null;
let onMicStateChangeFlag3: boolean | null = null;
let onMicStateChangeFlag4: boolean | null = null;
let onMicStateChangeFlag5: boolean | null = null;
let strParams: ESObject = "123";
let numParams: ESObject = 123;

let voice = call.hasVoiceCapability()

function getAudioManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

function getStreamManager() {
  streamManager = audioManager.getStreamManager();
  if (streamManager != null) {
    console.info(`${TagFrmwk}: getStreamManager : PASS`);
  } else {
    console.info(`${TagFrmwk}: getStreamManager : FAIL`);
  }
}

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function audioManagerApi9() {
  describe('audioManagerApi9', () => {
    beforeAll(async () => {
      await getAudioManager();
      getStreamManager();
      console.info(`${TagFrmwk}: beforeAll: END`);
    })

    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      await sleep(100);
    })

    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await sleep(100);
    })

    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ERRORS_0100
     * @tc.name      : AUDIO_ERRORS
     * @tc.desc      : AUDIO_ERRORS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ERRORS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.AudioErrors.ERROR_INVALID_PARAM).assertEqual(6800101);
      expect(audio.AudioErrors.ERROR_NO_MEMORY).assertEqual(6800102);
      expect(audio.AudioErrors.ERROR_ILLEGAL_STATE).assertEqual(6800103);
      expect(audio.AudioErrors.ERROR_UNSUPPORTED).assertEqual(6800104);
      expect(audio.AudioErrors.ERROR_TIMEOUT).assertEqual(6800105);
      expect(audio.AudioErrors.ERROR_STREAM_LIMIT).assertEqual(6800201);
      expect(audio.AudioErrors.ERROR_SYSTEM).assertEqual(6800301);
      await sleep(50);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DEFAULT_VOLUME_GROUP_ID_0100
     * @tc.name      : DEFAULT_VOLUME_GROUP_ID
     * @tc.desc      : DEFAULT_VOLUME_GROUP_ID
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_DEFAULT_VOLUME_GROUP_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.DEFAULT_VOLUME_GROUP_ID).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DEFAULT_INTERRUPT_GROUP_ID_0100
     * @tc.name      : DEFAULT_INTERRUPT_GROUP_ID
     * @tc.desc      : DEFAULT_INTERRUPT_GROUP_ID
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_DEFAULT_INTERRUPT_GROUP_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.DEFAULT_INTERRUPT_GROUP_ID).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_COMUNICATIONDEVICETYPE_0100
     * @tc.name      : COMUNICATIONDEVICETYPE
     * @tc.desc      : COMUNICATIONDEVICETYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_COMUNICATIONDEVICETYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.CommunicationDeviceType.SPEAKER).assertEqual(2);
      await sleep(50);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0100
     * @tc.name      : getVolumeGroupManagerSync - Sync
     * @tc.desc      : getVolumeGroupManagerSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(audio.DEFAULT_VOLUME_GROUP_ID)
        if ((typeof groupManager) == 'object') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
          expect(true).assertTrue();
          done();
        } else {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  FAIL');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message}`);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0200
     * @tc.name      : getVolumeGroupManagerSync - Null_Parameter - 401
     * @tc.desc      : getVolumeGroupManagerSync - Null_Parameter - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(volGroupId);
        console.info(`audioManagerApi9Test: Promise: getGroupManager  :  FAIL`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0300
     * @tc.name      : getVolumeGroupManagerSync - String_Parameter - 401
     * @tc.desc      : getVolumeGroupManagerSync - String_Parameter - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(strParams);
        console.info(`audioManagerApi9Test: Promise: getGroupManager  :  FAIL`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0400
     * @tc.name      : getVolumeGroupManagerSync - String_Parameter - 6800101
     * @tc.desc      : getVolumeGroupManagerSync - String_Parameter - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(numParams);
        console.info(`audioManagerApi9Test: Promise: getGroupManager  :  FAIL`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_PERCENTAGE_0100
     * @tc.name      : getAPPVolumePercentage
     * @tc.desc      : getAPPVolumePercentage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_PERCENTAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getAppVolumePercentage();
        if ((typeof groupManager) == 'object') {
          console.info('audioManagerApi9Test: Promise: getAppVolumePercentage  :  PASS');
          expect(true).assertTrue();
          done();
        } else {
          console.info('audioManagerApi9Test: Promise: getAppVolumePercentage  :  FAIL');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getAppVolumePercentage: Callback:  ${error.message},code:${error.code}`);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0100
     * @tc.name      : setAppVolumePercentage - String_Parameter - 401
     * @tc.desc      : setAppVolumePercentage - String_Parameter - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        await audioVolumeManager.setAppVolumePercentage(strParams);
        console.info(`audioManagerApi9Test: Promise: setppVolumePercentage  :  Success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to setAppVolumePercentage: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0200
     * @tc.name      : setAppVolumePercentage - Null_Parameter - 6800301
     * @tc.desc      : setAppVolumePercentage - Null_Parameter - 6800301
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        await audioVolumeManager.setAppVolumePercentage(-1);
        console.info(`audioManagerApi9Test: Promise: setAppVolumePercentage  :  Success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to setAppVolumePercentage: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0300
     * @tc.name      : setAppVolumePercentage - Over_Parameter - 6800101
     * @tc.desc      : setAppVolumePercentage - Over_Parameter - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
//    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
//      let audioVolumeManager = audioManager.getVolumeManager();
//     try {
//        await audioVolumeManager.setAppVolumePercentage(101);
//        console.info(`audioManagerApi9Test: Promise: setAppVolumePercentage  :  Success`);
//        expect(false).assertTrue();
//        done();
//      } catch (error) {
//        console.error(`audioManagerApi9Test: failed to setAppVolumePercentage: Callback:  ${error.message},code:${error.code}`);
//        expect(Number(error.code)).assertEqual(6800101);
//        done();
//      }
//
//    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0100
     * @tc.name      : getVolumeGroupManager - callback - number_Parameter
     * @tc.desc      : getVolumeGroupManager - callback - number_Parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager: ESObject = await audioVolumeManager.getVolumeGroupManager(numParams);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: ESObject = await groupManager.getVolume(audio.AudioVolumeType.MEDIA);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0200
     * @tc.name      : getVolumeGroupManager - callback - number_Parameter
     * @tc.desc      : getVolumeGroupManager - callback - number_Parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager: ESObject = await audioVolumeManager.getVolumeGroupManager(numParams);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: ESObject = await groupManager.getVolume();
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0300
     * @tc.name      : getVolumeGroupManager - callback - undefined
     * @tc.desc      : getVolumeGroupManager - callback - undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager: ESObject = await audioVolumeManager.getVolumeGroupManager(undefined);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: ESObject = await groupManager.getVolume();
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0400
     * @tc.name      : getVolumeGroupManager - callback - Null_Parameter - 401
     * @tc.desc      : getVolumeGroupManager - callback - Null_Parameter - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager: ESObject = await audioVolumeManager.getVolumeGroupManager(volGroupId);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: ESObject = await groupManager.getVolume();
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0100
     * @tc.name      : getVolumeGroupManager - callback
     * @tc.desc      : getVolumeGroupManager
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID, (err, groupManager) => {
        if (err) {
          console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${err.message}`);
          expect(false).assertTrue();
        } else {
          if ((typeof groupManager) == 'object') {
            console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
            expect(true).assertTrue();
          } else {
            console.info('audioManagerApi9Test: Promise: getGroupManager  :  FAIL');
            expect(false).assertTrue();
          }
        }
        done();
      })
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0200
     * @tc.name      : getVolumeGroupManager - prmiose
     * @tc.desc      : getVolumeGroupManager
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        if ((typeof groupManager) == 'object') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
          expect(true).assertTrue();
        } else {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  FAIL');
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager: parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0100
     * @tc.name      : group manager getVolume - MEDIA - Callback
     * @tc.desc      : group manager getvolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getVolume(audio.AudioVolumeType.MEDIA, (err: BusinessError, value: number) => {
          if (err) {
            console.error(`audioManagerApi9Test: callback : Meida: failed to get volume ${err.message}`);
            expect(false).assertTrue();
          } else if (value >= minVol && value <= maxVolPc) {
            console.info('audioManagerApi9Test: callback : Meida getVolume: PASS :' + value);
            expect(true).assertTrue();
          } else {
            console.info('audioManagerApi9Test: callback : Meida getVolume: FAIL :' + value);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0200
     * @tc.name      : group manager getVolume - MEDIA - Promise
     * @tc.desc      : group manager getvolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let value = await groupManager.getVolume(audio.AudioVolumeType.MEDIA);
        if (value >= minVol && value <= maxVolPc) {
          console.info('audioManagerApi9Test: callback : Meida getVolume: PASS :' + value);
          expect(true).assertTrue();
        } else {
          console.info('audioManagerApi9Test: callback : Meida getVolume: FAIL :' + value);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0100
     * @tc.name      : getMaxVolume - RINGTONE - Callback
     * @tc.desc      : getMaxVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getMaxVolume(audio.AudioVolumeType.RINGTONE, (err, data) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getMaxVolume: Callback:  ${err.message}`);
            expect(false).assertTrue();
          } else {
            if (data == maxVol) {
              console.info('audioManagerApi9Test: callback : Ringtone getMaxVolume: PASS :' + data);
              expect(true).assertTrue();
            } else if (data == maxVolPc) {
              console.info('audioManagerApi9Test: callback : Ringtone getMaxVolume: PASS :' + data);
              expect(true).assertTrue();
            } else {
              console.info('audioManagerApi9Test: callback : Ringtone getMaxVolume: FAIL :' + data);
              expect(false).assertTrue();
            }
          }
          done();
        });
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0200
     * @tc.name      : getMaxVolume - RINGTONE - Promise
     * @tc.desc      : getMaxVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let maxVolume = await groupManager.getMaxVolume(audio.AudioVolumeType.RINGTONE);
        if (maxVolume == maxVol) {
          console.info('audioManagerApi9Test: promise : Ringtone getMaxVolume: PASS :' + maxVolume);
          expect(true).assertTrue();
        } else if (maxVolume == maxVolPc) {
          console.info('audioManagerApi9Test: promise : Ringtone getMaxVolume: PASS :' + maxVolume);
          expect(true).assertTrue();
        } else {
          console.info('audioManagerApi9Test: promise : Ringtone getMaxVolume: FAIL :' + maxVolume);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0100
     * @tc.name      : getMinVolume - RINGTONE - Callback
     * @tc.desc      : getMinVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getMinVolume(audio.AudioVolumeType.RINGTONE, (err, data) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getMinVolume : Callback:  ${err.message}`);
            expect(false).assertTrue();
          } else {
            if (data == minVol) {
              console.info('audioManagerApi9Test: callback : Ringtone getMinVolume: PASS :' + data);
              expect(true).assertTrue();
            } else {
              console.info('audioManagerApi9Test: callback : Ringtone getMinVolume: FAIL :' + data);
              expect(false).assertTrue();
            }
          }
          done();
        });
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0200
     * @tc.name      : getMaxVolume - RINGTONE - Promise
     * @tc.desc      : getMaxVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let minVolume = await groupManager.getMinVolume(audio.AudioVolumeType.RINGTONE);
        if (minVolume == minVol) {
          console.info('audioManagerApi9Test: promise : Ringtone getMinVolume: PASS :' + minVolume);
          expect(true).assertTrue();
        } else {
          console.info('audioManagerApi9Test: promise : Ringtone getMinVolume: FAIL :' + minVolume);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0100
     * @tc.name      : group manager ismute - RINGTONE - Callback
     * @tc.desc      : ismute - RINGTONE - Callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.isMute(audio.AudioVolumeType.RINGTONE, (err: BusinessError, data) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to isMute : Callback:  ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.log(`audioManagerApi9Test: Promise:
                    Is Stream GroupManager Mute RINGTONE: FALSE: PASS:` + data);
            expect(true).assertTrue();
          }
          done();
        })
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager mute : parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0200
     * @tc.name      : group manager ismute - RINGTONE - Promise
     * @tc.desc      : ismute - RINGTONE - Promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        await groupManager.isMute(audio.AudioVolumeType.RINGTONE).then((data) => {
          console.log(`audioManagerApi9Test: Promise:
                    Is Stream GroupManager Mute RINGTONE: FALSE: PASS:` + data);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info(`audioManagerApi9Test: Promise:
                    Is Stream GroupManager Mute RINGTONE: FALSE: ERROR:` + err.message);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager ismute : parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGERMODE_0100
     * @tc.name      : group manager getRingerMode - RINGTONE - Callback
     * @tc.desc      : getRingerMode - RINGTONE - Callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGERMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getRingerMode((err: BusinessError, data: number) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getRingerMode : Callback:  ${err.message}`);
            expect(false).assertTrue();
          } else {
            if (data == audio.AudioRingMode.RINGER_MODE_SILENT ||
              data == audio.AudioRingMode.RINGER_MODE_VIBRATE ||
              data == audio.AudioRingMode.RINGER_MODE_NORMAL) {
              console.log(`audioManagerApi9Test: Promise:
                    getRingerMode : PASS:` + data);
              expect(true).assertTrue();
            } else {
              console.log(`audioManagerApi9Test: Promise:
                    getRingerMode : FAIL: ` + data);
              expect(false).assertTrue();
            }
          }
          done();
        })
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager mute : parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETRINGERMODE_0200
     * @tc.name      : setRingerMode - Normal Mode - Promise - ENAME
     * @tc.desc      : setRingerMode - Set Ring more to Normal Mode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETRINGERMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let value = await groupManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_SILENT ||
          value == audio.AudioRingMode.RINGER_MODE_VIBRATE ||
          value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0100
     * @tc.name      : OnRingMode - RINGER_MODE_NORMAL
     * @tc.desc      : OnRingMode - RINGER_MODE_NORMAL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.on('ringerModeChange', (AudioRingMode) => {
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0200
     * @tc.name      : off_ringerModeChange - Invaild_Number_Parameter - 6800101
     * @tc.desc      : off_ringerModeChange - Invaild_Number_Parameter - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let para: ESObject = '123';
      let flag: boolean = false;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.off(para,()=>{});
      } catch (err) {
        console.log('err :' + err.message)
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0300
     * @tc.name      : off_ringerModeChange - String_Parameter - 401
     * @tc.desc      : off_ringerModeChange - String_Parameter - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let para: ESObject = 123;
      let flag: boolean = false;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.off(para);
      } catch (err) {
        console.log('err :' + err.message)
        expect(Number(err.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0100
     * @tc.name      : setMicrophoneMute - true - Callback
     * @tc.desc      : Enable mic mute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      groupManager.setMicrophoneMute(true, (err, data) => {
        if (err) {
          console.error(`audioManagerApi9Test: failed to setMicrophoneMute : Callback:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          groupManager.isMicrophoneMute((err, data) => {
            if (err) {
              console.error(`audioManagerApi9Test: failed to isMicrophoneMute : Callback:  ${err.message}`);
              expect(false).assertTrue();
            } else {
              if (data == true) {
                console.log(`${TagFrmwk}: Callback: isMicrophoneMute: TRUE: PASS:${data}`);
                expect(true).assertTrue();
              } else {
                console.log(`${TagFrmwk}: Callback: isMicrophoneMute: TRUE: FAIL: ${data}`);
                expect(false).assertTrue();
              }
            }
            done();
          })
        }
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0200
     * @tc.name      : setMicrophoneMute - true - Promise
     * @tc.desc      : Enable mic mute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        await groupManager.setMicrophoneMute(true);
        let data = await groupManager.isMicrophoneMute();
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.log('err :' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONMICSTATECHANGE_0100
     * @tc.name      : OnMicStateChange
     * @tc.desc      : OnMicStateChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONMICSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      try {
        await groupManager.setMicrophoneMute(false);
        console.info('setMicrophoneMute success')
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
      onMicStateChangeFlag1 = true
      groupManager.on('micStateChange', (MicStateChangeEvent) => {
        if (onMicStateChangeFlag1 == true) {
          console.log(`${TagFrmwk}: Mic State Change Event is called`);
          if (MicStateChangeEvent.mute == true) {
            console.info(`${TagFrmwk}: MEDIA CallBack : PASS : ${MicStateChangeEvent.mute}`);
            onMicStateChangeFlag1 = false
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Audio MicStateChangeEvent is : ${MicStateChangeEvent}`);
            expect(false).assertTrue();
          }
          done();
        }
      });
      try {
        await groupManager.setMicrophoneMute(true);
        console.info('setMicrophoneMute success')
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0100
     * @tc.name      : isActive - Media - Promise
     * @tc.desc      : isActive - Media - Promise - When stream is NOT playing
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.log(`${TagFrmwk}: Promise : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      const PROMISE = streamManager.isActive(audioMedia);
      PROMISE.then((data) => {
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.log('err :' + JSON.stringify(err));
        expect().assertFail();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0200
     * @tc.name      : isActive - Media - Callback
     * @tc.desc      : isActive - Media - Callback - When stream is NOT playing
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0200', 1, (done: Function) => {
      console.log(`${TagFrmwk}: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      streamManager.isActive(audioMedia, (err, data) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : Media : isActive: failed  ${err.message}`);
          expect().assertFail();
        } else if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0100
     * @tc.name      : isActive - Media - Sync
     * @tc.desc      : isActive - Media - Sync - When stream is NOT playing
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0100', 1, (done: Function) => {
      console.log(`${TagFrmwk}: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      try {
        let data = streamManager.isActiveSync(audioMedia)
        if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.error(`${TagFrmwk}: Callback : Media : isActive: failed  ${error.message}`);
        expect().assertFail();
      }
      done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0200
     * @tc.name      : isActiveSync - Null_Parameter - 401
     * @tc.desc      : isActiveSync - Null_Parameter - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0200', 1, (done: Function) => {
      try {
        let data = streamManager.isActiveSync(volConnectType);
        console.log(`${TagFrmwk}: isActiveSync data::${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${TagFrmwk}: isActiveSync: failed  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0300
     * @tc.name      : isActiveSync - Invaild_Number_Parameter - 6800101
     * @tc.desc      : isActiveSync - Invaild_Number_Parameter - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0300', 1, (done: Function) => {
      try {
        let data = streamManager.isActiveSync(123);
        console.log(`${TagFrmwk}: isActiveSync data::${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${TagFrmwk}: isActiveSync: failed  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0400
     * @tc.name      : isActiveSync - String_Parameter - 401
     * @tc.desc      : isActiveSync - String_Parameter - 401

     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0400', 1, (done: Function) => {
      try {
        let data = streamManager.isActiveSync(strParams);
        console.log(`${TagFrmwk}: isActiveSync data::${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${TagFrmwk}: isActiveSync: failed  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0100
     * @tc.name      : isCommunicationDeviceActiveSync - SPEAKER - deactivate
     * @tc.desc      : isCommunicationDeviceActiveSync speaker
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag: boolean | null = null;
        let AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = false;
        }
        await AudioRoutingManager.setCommunicationDevice(2, false).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                    Promise returned to indicate that the device is set to the active status.`);
        });
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(audio.CommunicationDeviceType.SPEAKER)
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
        if (flag == true && value == true) {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
          expect(true).assertTrue();
        } else if (flag == false && value == true) {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
          expect(true).assertTrue();
        } else {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
          expect(false).assertTrue();
        }

      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0200
     * @tc.name      : isCommunicationDeviceActiveSync - Null_Parameters - 401
     * @tc.desc      : isCommunicationDeviceActiveSync - Null_Parameters - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(null)
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0200
                        isCommunicationDeviceActive : Null_Parameters : PASS :${value}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(`isCommunicationDeviceActive : Null_Parameters Fail,error:${err},ErrorCode:${err.code},${typeof (err.code)}`);
        expect(Number(err.code)).assertEqual(401);
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0300
     * @tc.name      : isCommunicationDeviceActiveSync - Number_Invalid_Parameters - 6800101
     * @tc.desc      : isCommunicationDeviceActiveSync - Number_Invalid_Parameters - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(123)
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0300
                        isCommunicationDeviceActive : Number_Invalid_Parameters : PASS :${value}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(`isCommunicationDeviceActive : Number_Invalid_Parameters Fail,error:${err},ErrorCode:${err.code},${typeof (err.code)}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0400
     * @tc.name      : isCommunicationDeviceActiveSync - String_Parameters - 401
     * @tc.desc      : isCommunicationDeviceActiveSync - String_Parameters - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(strParams);
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0400
                        isCommunicationDeviceActive : String_Parameters : PASS :${value}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(`isCommunicationDeviceActive : String_Parameters Fail,error:${err},ErrorCode:${err.code},${typeof (err.code)}`);
        expect(Number(err.code)).assertEqual(401);
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
     * @tc.name      : setCommunicationDevice - SPEAKER - deactivate - Promise
     * @tc.desc      : setCommunicationDevice speaker - Promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag: boolean | null = null;
        let AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = false;
        }
        await AudioRoutingManager.setCommunicationDevice(2, false).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                    Promise returned to indicate that the device is set to the active status.`);
        });
        await AudioRoutingManager.isCommunicationDeviceActive(audio.CommunicationDeviceType.SPEAKER).then((value) => {
          if (flag == true && value == true) {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else if (flag == false && value == true) {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
            expect(false).assertTrue();
          }
        }).catch((err: BusinessError) => {
          console.log('err :' + JSON.stringify(err.message));
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200
     * @tc.name      : setCommunicationDevice - SPEAKER - deactivate - Callback
     * @tc.desc      : setCommunicationDevice speaker - Callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200
            outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
        flag = true;
      }
      if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
        outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
        flag = false;
      }
      AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, false, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Device Test: Callback : setCommunicationDevice : SPEAKER: Deactivate: Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Device Test: Callback : setCommunicationDevice : SPEAKER: Active`);
          AudioRoutingManager.isCommunicationDeviceActive(2, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
              expect(false).assertTrue();
            } else if (value == true && flag == true) {
              console.info(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
              expect(true).assertTrue();
            } else if (value == true && flag == false) {
              console.info(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
              expect(true).assertTrue();
            } else {
              console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200 ${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : FAIL :${value} flag is ${flag}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0100
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0100
     * @tc.desc      : micStateChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();
      let VolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      let count = 0;
      console.info('getVolumeGroupManager Callback START.');
      onMicStateChangeFlag2 = true;
      VolumeGroupManager.on('micStateChange', async (micStateChange) => {
        if (onMicStateChangeFlag2 == true) {
          console.info('micStateChange is ' + micStateChange.mute);
          onMicStateChangeFlag2 = false;
          count++;
        }
      })
      try {
        let data = await audioManager.isMicrophoneMute();
        console.info('Promise isMicrophoneMute PASS:' + data);
        await audioManager.setMicrophoneMute(data);
        console.info('Promise setMicrophoneMute PASS.');
        let data1 = await audioManager.isMicrophoneMute();
        console.info('Promise isMicrophoneMute PASS.' + data1);
      } catch (err) {
        console.log('ERROR:' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      await sleep(2000);
      expect(count).assertEqual(0);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0200
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0200
     * @tc.desc      : micStateChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let VolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      console.info('getVolumeGroupManager Callback START.');
      let count = 0;
      onMicStateChangeFlag3 = true;
      VolumeGroupManager.on('micStateChange', async (micStateChange) => {
        if (onMicStateChangeFlag3 == true) {
          console.info("Updated micState:" + JSON.stringify(micStateChange));
          onMicStateChangeFlag3 = false
          count++;
        }
      })
      try {
        let data = await audioManager.isMicrophoneMute();
        console.info('Promise isMicrophoneMute PASS:' + data);
        let micStatus = !data;
        await audioManager.setMicrophoneMute(micStatus);
        console.info('Promise setMicrophoneMute PASS:' + micStatus);
      } catch (err) {
        console.log('ERROR:' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      await sleep(2000);
      expect(count).assertEqual(1);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0300
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0300
     * @tc.desc      : micStateChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let VolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      console.info('getVolumeGroupManager Callback START.');
      let count = 0;
      onMicStateChangeFlag4 = true;
      VolumeGroupManager.on('micStateChange', async (micStateChange) => {
        if (onMicStateChangeFlag4 == true) {
          console.info("Updated micState:" + JSON.stringify(micStateChange));
          count++;
        }
      })
      try {
        let data = await audioManager.isMicrophoneMute();
        console.info('Promise isMicrophoneMute PASS:' + data);
        let micStatus = !data;
        await audioManager.setMicrophoneMute(micStatus);
        console.info('Promise setMicrophoneMute PASS:' + micStatus);
        await audioManager.setMicrophoneMute(!micStatus);
        console.info('Promise setMicrophoneMute PASS:' + (!micStatus));
      } catch (err) {
        console.log('ERROR:' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      await sleep(2000);
      expect(count).assertEqual(2);
      onMicStateChangeFlag4 = false
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400
     * @tc.desc      : micStateChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let VolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      let count = 0;
      try {
        console.info("enter SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400");
        onMicStateChangeFlag5 = true
        VolumeGroupManager.on('micStateChange', async (micStateChange1) => {
          if (onMicStateChangeFlag5 = true) {
            console.info("Updated micState--001:" + JSON.stringify(micStateChange1));
            VolumeGroupManager.on('micStateChange', async (micStateChange) => {
              console.info("Updated micState--002:" + JSON.stringify(micStateChange));
              onMicStateChangeFlag5 = false
              count++
            })
            let data = await audioManager.isMicrophoneMute();
            console.info('Second Promise isMicrophoneMute PASS:' + data);
            await audioManager.setMicrophoneMute(!data);
            console.info('Second:Promise setMicrophoneMute PASS:' + (!data));
          }
        })
        let data = await audioManager.isMicrophoneMute();
        console.info('First Promise isMicrophoneMute PASS:' + data);
        await audioManager.setMicrophoneMute(!data);
        console.info('First:Promise setMicrophoneMute PASS:' + (!data));
      } catch (err) {
        console.log('ERROR:' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      await sleep(2000);
      expect(count).assertEqual(1);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2900
     * @tc.name      : mute - ALARM - Promise - SetVolume
     * @tc.desc      : mute - ALARM - Promise - Enable mute -SetVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, 1);
        await audioManager.mute(audio.AudioVolumeType.ALARM, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ALARM);
          console.info("value is " + value)
          if (value == 1) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MinData = await audioManager.getMinVolume(audio.AudioVolumeType.ALARM);
              console.info('MinData is ' + MinData)
              expect(MinData).assertEqual(1);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2901
     * @tc.name      : mute - ALARM - Promise - SetVolume
     * @tc.desc      : mute - ALARM - Promise - Enable mute -SetVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let maxVolumeSetting = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, maxVolumeSetting);
        await audioManager.mute(audio.AudioVolumeType.ALARM, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ALARM);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2902
     * @tc.name      : mute - ALARM - Promise - SetVolume
     * @tc.desc      : mute - ALARM - Promise - Enable mute -SetVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let maxVolumeSetting = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, maxVolumeSetting+1);
        await audioManager.mute(audio.AudioVolumeType.ALARM, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ALARM);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        console.info('err code :' + JSON.stringify(err.code));
        expect(err.code).assertEqual(6800104);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2903
     * @tc.name      : mute - ALARM - Promise - SetVolume
     * @tc.desc      : mute - ALARM - Promise - Enable mute -SetVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, -1);
        await audioManager.mute(audio.AudioVolumeType.ALARM, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ALARM);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        console.info('err code :' + JSON.stringify(err.code));
        expect(err.code).assertEqual(6800104);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3000
     * @tc.name      : mute - ACCESSIBILITY - Promise - SetVolume
     * @tc.desc      : mute - ACCESSIBILITY - Promise - Enable mute -SetVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, 1);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info("value is " + value)
          if (value == 1) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MinData = await audioManager.getMinVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MinData is ' + MinData)
              expect(MinData).assertEqual(1);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3001
     * @tc.name      : mute - ACCESSIBILITY - Promise - SetVolume
     * @tc.desc      : mute - ACCESSIBILITY - Promise - Enable mute -SetVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let maxVolumeSetting = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, maxVolumeSetting);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3002
     * @tc.name      : mute - ACCESSIBILITY - Promise - SetVolume
     * @tc.desc      : mute - ACCESSIBILITY - Promise - Enable mute -SetVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let maxVolumeSetting = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, maxVolumeSetting+1);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        console.info('err code :' + JSON.stringify(err.code));
        expect(err.code).assertEqual(6800104);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3003
     * @tc.name      : mute - ACCESSIBILITY - Promise - SetVolume
     * @tc.desc      : mute - ACCESSIBILITY - Promise - Enable mute -SetVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, -1);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        console.info('err code :' + JSON.stringify(err.code));
        expect(err.code).assertEqual(6800104);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0100
     * @tc.name      : OnVolumeChange - setVolume - MEDIA
     * @tc.desc      : OnVolumeChange - setVolume - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let maxVolume = await audioManager.getMaxVolume(audio.AudioVolumeType.MEDIA)
      let minVolume = await audioManager.getMinVolume(audio.AudioVolumeType.MEDIA)
      await audioManager.setVolume(audio.AudioVolumeType.MEDIA, maxVolume)
      await sleep(50);
      audioVolumeManager.on('volumeChange', (VolumeEvent) => {
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0100 VolumeEvent.volumeType: ${VolumeEvent.volumeType}, VolumeEvent.volume:${VolumeEvent.volume},VolumeEvent.volumeMode:${VolumeEvent.volumeMode}, VolumeEvent.updateUi:${VolumeEvent.updateUi}`);
        expect(VolumeEvent.volumeType).assertEqual(audio.AudioVolumeType.MEDIA);
        expect(VolumeEvent.volume).assertEqual(minVolume);
        expect(VolumeEvent.updateUi).assertEqual(false);
        done();
      });
      await audioManager.setVolume(audio.AudioVolumeType.MEDIA, minVolume)
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0200
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let para1 : ESObject = 1;
        audioVolumeManager.on(para1, (volumeEvent: audio.VolumeEvent) => {
          console.info(`VolumeType of stream: ${volumeEvent.volumeType} `);
          console.info(`Volume level: ${volumeEvent.volume} `);
          console.info(`Whether to updateUI: ${volumeEvent.updateUi} `);
        });
        expect(false).assertTrue();
      }catch(error){
        console.log(`${TagFrmwk}: micStateChange : error ${error}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      };
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0300
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let para1 : ESObject = '1';
        audioVolumeManager.on(para1, (volumeEvent: audio.VolumeEvent) => {
          console.info(`VolumeType of stream: ${volumeEvent.volumeType} `);
          console.info(`Volume level: ${volumeEvent.volume} `);
          console.info(`Whether to updateUI: ${volumeEvent.updateUi} `);
        });
        expect(false).assertTrue();
      }catch(error){
        console.log(`${TagFrmwk}: micStateChange : error ${error}`);
        expect(Number(error.code) == 6800101).assertTrue();
        done();
      };
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0100
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let interAudioInterrupt: audio.AudioInterrupt = {
        streamUsage:2,
        contentType:0,
        pauseWhenDucked:true
      };
      // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
      let interruptCallback = (interruptAction: audio.InterruptAction) => {
        if (interruptAction.actionType === 0) {
          console.info('An event to gain the audio focus starts.');
          console.info(`Focus gain event: ${interruptAction} `);
        }
        if (interruptAction.actionType === 1) {
          console.info('An audio interruption event starts.');
          console.info(`Audio interruption event: ${interruptAction} `);
        }
      };
      try {
        let audioSpatializationManager: audio.AudioSpatializationManager = audioManager.getSpatializationManager();
        audioManager.on('interrupt', interAudioInterrupt, interruptCallback);
        audioManager.off('interrupt', interAudioInterrupt, interruptCallback);
        done();
      } catch (error) {
        console.info(`ON_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0200
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioSpatializationManager: audio.AudioSpatializationManager = audioManager.getSpatializationManager();
        done();
      } catch (error) {
        console.info(`ON_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_0100
     * @tc.name      : OnAudioSceneChange - audioManager
     * @tc.desc      : OnAudioSceneChange - audioManager
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        audioManager.on('audioSceneChange', (audioScene) => {
          console.info(`AudioSceneChange event: ${audioScene} `);
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_OFFAUDIOSCENECHANGE_0100
     * @tc.name      : OffAudioSceneChange - audioManager
     * @tc.desc      : OffAudioSceneChange - audioManager
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_OFFAUDIOSCENECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let cb = (audioScene: audio.AudioScene) => {
          console.info(`AudioSceneChange event: ${audioScene} `);
      }
      try {
        audioManager.on('audioSceneChange', cb);
        audioManager.off('audioSceneChange', cb);
        audioManager.on('audioSceneChange', cb);
        audioManager.off('audioSceneChange');
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_0100
     * @tc.name      : TestIsRecordingAvailable0100
     * @tc.desc      : Test that no recording stream is currently started
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestIsRecordingAvailable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };
      try {
        const isAvailable = streamManager.isRecordingAvailable(capturerInfo);
        expect(isAvailable).assertTrue();
      } catch (error) {
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_0200
     * @tc.name      : TestIsRecordingAvailable0200
     * @tc.desc      : Test that a recording stream is currently started
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestIsRecordingAvailable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let streamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };
      let capturerOptions: audio.AudioCapturerOptions = {
        streamInfo: streamInfo,
        capturerInfo: capturerInfo
      };
      let checkCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_WAKEUP,
        capturerFlags: 0
      };
      try {
        let audioCap = await audio.createAudioCapturer(capturerOptions);
        console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
        await audioCap.start();
        const isAvailable = streamManager.isRecordingAvailable(checkCapturerInfo);
        expect(isAvailable).assertFalse();
        await audioCap.stop();
        await audioCap.release();
      } catch (error) {
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_0300
     * @tc.name      : TestIsRecordingAvailable0300
     * @tc.desc      : Test input parameter sourceType invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestIsRecordingAvailable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      };
      try {
        streamManager.isRecordingAvailable(capturerInfo);
        expect(false).assertTrue();
      } catch (error) {
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(Number(error.code) == 6800101).assertTrue();
      }
      done();
    })
  })

}