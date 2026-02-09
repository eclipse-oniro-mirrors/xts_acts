/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import deviceInfo from "@ohos.deviceInfo";
let TagFrmwk = "audioManagerApi9Test";
console.info(`${TagFrmwk}: Create AudioManger Object JS Framework`);
let deviceTypeInfo: string = deviceInfo.deviceType
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let audioManager: audio.AudioManager | undefined;
let streamManager: audio.AudioStreamManager | undefined;
let audioMedia = audio.AudioVolumeType.MEDIA;
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
let numParams: int = 123;

function getStreamManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
    streamManager = audioManager!.getStreamManager();
    if (streamManager != null) {
      console.info(`${TagFrmwk}: getStreamManager : PASS`);
    } else {
      console.info(`${TagFrmwk}: getStreamManager : FAIL`);
    }
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

export default function audioManagerApi9() {
  describe('audioManagerApi9', () => {
    beforeAll(async () => {
      await Utils.msSleep(5000);
      getStreamManager();
      console.info(`${TagFrmwk}: beforeAll: END`);
    })

    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(100);
    })

    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(100);
    })

    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ERRORS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ERRORS_STATIC_0100
     * @tc.desc   AUDIO_ERRORS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ERRORS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ERRORS_0100 start`);
      expect(audio.AudioErrors.ERROR_INVALID_PARAM == 6800101).assertTrue();
      expect(audio.AudioErrors.ERROR_NO_MEMORY == 6800102).assertTrue();
      expect(audio.AudioErrors.ERROR_ILLEGAL_STATE == 6800103).assertTrue();
      expect(audio.AudioErrors.ERROR_UNSUPPORTED == 6800104).assertTrue();
      expect(audio.AudioErrors.ERROR_TIMEOUT == 6800105).assertTrue();
      expect(audio.AudioErrors.ERROR_STREAM_LIMIT == 6800201).assertTrue();
      expect(audio.AudioErrors.ERROR_SYSTEM == 6800301).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_DEFAULT_VOLUME_GROUP_ID_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_DEFAULT_VOLUME_GROUP_ID_STATIC_0100
     * @tc.desc   DEFAULT_VOLUME_GROUP_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_DEFAULT_VOLUME_GROUP_ID_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.DEFAULT_VOLUME_GROUP_ID).assertEqual(1);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_DEFAULT_INTERRUPT_GROUP_ID_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_DEFAULT_INTERRUPT_GROUP_ID_STATIC_0100
     * @tc.desc   DEFAULT_INTERRUPT_GROUP_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_DEFAULT_INTERRUPT_GROUP_ID_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.DEFAULT_INTERRUPT_GROUP_ID).assertEqual(1);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_COMUNICATIONDEVICETYPE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_COMUNICATIONDEVICETYPE_STATIC_0100
     * @tc.desc   COMUNICATIONDEVICETYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_COMUNICATIONDEVICETYPE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.CommunicationDeviceType.SPEAKER == 2).assertTrue();
      await Utils.msSleep(50);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_STATIC_0100
     * @tc.desc   getVolumeGroupManagerSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let audioVolumeManager = audioManager!.getVolumeManager();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_STATIC_0400
     * @tc.desc   getVolumeGroupManagerSync - String_Parameter - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let audioVolumeManager = audioManager!.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(numParams);
        console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getGroupManager  :  FAIL`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_PERCENTAGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_PERCENTAGE_STATIC_0100
     * @tc.desc   getAPPVolumePercentage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_PERCENTAGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let audioVolumeManager = audioManager!.getVolumeManager();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_STATIC_0100
     * @tc.desc   getVolumeGroupManager - callback - number_Parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        let groupManager: audio.AudioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(numParams);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: int = await groupManager.getVolume(audio.AudioVolumeType.MEDIA);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_STATIC_0100
     * @tc.desc   getVolumeGroupManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let audioVolumeManager = audioManager!.getVolumeManager();
      audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID,
        (err: BusinessError<void> | null, groupManager: audio.AudioVolumeGroupManager | undefined) => {
        if (err) {
          console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${err?.message}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_STATIC_0200
     * @tc.desc   getVolumeGroupManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_STATIC_0100
     * @tc.desc   group manager getvolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getVolume(audio.AudioVolumeType.MEDIA, (err: BusinessError<void> | null, value: int | undefined) => {
          if (err) {
            console.error(`audioManagerApi9Test: callback : Meida: failed to get volume ${err?.message}`);
            expect(false).assertTrue();
          } else if (value! >= minVol && value! <= maxVolPc) {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_STATIC_0200
     * @tc.desc   group manager getvolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0100
     * @tc.desc   getMaxVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getMaxVolume(audio.AudioVolumeType.RINGTONE, (err: BusinessError<void> | null, data) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getMaxVolume: Callback:  ${err?.message}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0200
     * @tc.desc   getMaxVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0100
     * @tc.desc   getMinVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getMinVolume(audio.AudioVolumeType.RINGTONE, (err: BusinessError<void> | null, data) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getMinVolume : Callback:  ${err?.message}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0200
     * @tc.desc   getMaxVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_STATIC_0100
     * @tc.desc   ismute - RINGTONE - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.isMute(audio.AudioVolumeType.RINGTONE, (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to isMute : Callback:  ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: audioManagerApi9Test: Promise:
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_STATIC_0200
     * @tc.desc   ismute - RINGTONE - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        try {
          let data = await groupManager.isMute(audio.AudioVolumeType.RINGTONE);
          console.info(`${TagFrmwk}: audioManagerApi9Test: Promise:
                    Is Stream GroupManager Mute RINGTONE: FALSE: PASS:` + data);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: audioManagerApi9Test: Promise:
                    Is Stream GroupManager Mute RINGTONE: FALSE: ERROR:` + err.message);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager ismute : parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGERMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGERMODE_STATIC_0100
     * @tc.desc   getRingerMode - RINGTONE - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGERMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getRingerMode((err: BusinessError<void> | null, data: audio.AudioRingMode | undefined) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getRingerMode : Callback:  ${err?.message}`);
            expect(false).assertTrue();
          } else {
            if (data == audio.AudioRingMode.RINGER_MODE_SILENT){
              console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + data);
              expect(data).assertEqual(audio.AudioRingMode.RINGER_MODE_SILENT);
            }
            else if (data == audio.AudioRingMode.RINGER_MODE_VIBRATE){
              console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + data);
              expect(data).assertEqual(audio.AudioRingMode.RINGER_MODE_VIBRATE);
            }
            else if (data == audio.AudioRingMode.RINGER_MODE_NORMAL) {
              console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + data);
              expect(data).assertEqual(audio.AudioRingMode.RINGER_MODE_NORMAL);
            } else {
              console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : FAIL: ` + data);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETRINGERMODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETRINGERMODE_STATIC_0200
     * @tc.desc   setRingerMode - Get Ring more to Normal Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETRINGERMODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let value = await groupManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_SILENT){
          console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + value);
          expect(value).assertEqual(audio.AudioRingMode.RINGER_MODE_SILENT);
        }
        else if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE){
          console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + value);
          expect(value).assertEqual(audio.AudioRingMode.RINGER_MODE_VIBRATE);
        }
        else if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + value);
          expect(value).assertEqual(audio.AudioRingMode.RINGER_MODE_NORMAL);
        } else {
          console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : FAIL: ` + value);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_STATIC_0100
     * @tc.desc   OnRingMode - RINGER_MODE_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let audioVolumeManager = audioManager!.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let ringerModeChangeCallback = (ringerMode: audio.AudioRingMode) => {
          console.info(`Updated ringermode: ${ringerMode}`);
          if (ringerMode == audio.AudioRingMode.RINGER_MODE_SILENT){
          console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + ringerMode);
          expect(ringerMode).assertEqual(audio.AudioRingMode.RINGER_MODE_SILENT);
          }
          else if (ringerMode == audio.AudioRingMode.RINGER_MODE_VIBRATE){
            console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + ringerMode);
            expect(ringerMode).assertEqual(audio.AudioRingMode.RINGER_MODE_VIBRATE);
          }
          else if (ringerMode == audio.AudioRingMode.RINGER_MODE_NORMAL) {
            console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : PASS:` + ringerMode);
            expect(ringerMode).assertEqual(audio.AudioRingMode.RINGER_MODE_NORMAL);
          } else {
            console.info(`${TagFrmwk}: audioManagerApi9Test: Promise: getRingerMode : FAIL: ` + ringerMode);
            expect(false).assertTrue();
          }
        };
        groupManager.onRingerModeChange(ringerModeChangeCallback);
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_STATIC_0100
     * @tc.desc   isActive - Media - Promise - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(`${TagFrmwk}: Promise : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      const PROMISE = streamManager!.isActive(audioMedia);
      try {
        let data = await PROMISE;
        if (data == false) {
          console.info(`${TagFrmwk}: Promise: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect().assertFail();
      }
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_STATIC_0200
     * @tc.desc   isActive - Media - Callback - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.info(`${TagFrmwk}: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      streamManager!.isActive(audioMedia, (err: BusinessError<void> | null, data: boolean | undefined) => {
        if (err) {
          console.error(`Callback : Media : isActive: failed  ${err?.message}`);
          expect().assertFail();
        } else if (data == false) {
          console.info(`${TagFrmwk}: Callback: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Callback: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_STATIC_0100
     * @tc.desc   isActive - Media - Sync - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.info(`${TagFrmwk}: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      try {
        let data = streamManager!.isActiveSync(audioMedia)
        if (data == false) {
          console.info(`${TagFrmwk}: Callback: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Callback: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.error(`Callback : Media : isActive: failed  ${error.message}`);
        expect().assertFail();
      }
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_STATIC_0100
     * @tc.desc   isCommunicationDeviceActiveSync speaker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let flag: boolean | null = null;
        let AudioRoutingManager = audioManager!.getRoutingManager();
        let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        // console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
        //         outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = false;
        }
        await AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, false).then(() => {
          console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                    Promise returned to indicate that the device is set to the active status.`);
        });
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(audio.CommunicationDeviceType.SPEAKER)
        console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
        if (flag == true && value == true) {
          console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
          expect(true).assertTrue();
        } else if (flag == false && value == true) {
          console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
          expect(false).assertTrue();
        }

      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_STATIC_0100
     * @tc.desc   setCommunicationDevice speaker - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let flag: boolean | null = null;
        let AudioRoutingManager = audioManager!.getRoutingManager();
        let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        // console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
        //         outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = false;
        }
        await AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, false).then(() => {
          console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                    Promise returned to indicate that the device is set to the active status.`);
        });
        try {
          let value = await AudioRoutingManager.isCommunicationDeviceActive(audio.CommunicationDeviceType.SPEAKER);
          if (flag == true && value == true) {
            console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else if (flag == false && value == true) {
            console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.info('err :' + JSON.stringify(err.message));
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_STATIC_0200
     * @tc.desc   setCommunicationDevice speaker - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager!.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      // console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200
      //       outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
        flag = true;
      }
      if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
        outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
        flag = false;
      }
      AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, false, (err: BusinessError<void> | null) => {
        if (err) {
          console.error(`Device Test: Callback : setCommunicationDevice : SPEAKER: Deactivate: Error: ${err?.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Device Test: Callback : setCommunicationDevice : SPEAKER: Active`);
          AudioRoutingManager.isCommunicationDeviceActive(audio.CommunicationDeviceType.SPEAKER, (err: BusinessError<void> | null, value) => {
            if (err) {
              console.error(`Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate: Error: ${err?.message}`);
              expect(false).assertTrue();
            } else if (value == true && flag == true) {
              console.info(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
              expect(true).assertTrue();
            } else if (value == true && flag == false) {
              console.info(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            } else {
              console.info(`${TagFrmwk}: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200 Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : FAIL :${value} flag is ${flag}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_STATIC_0100
     * @tc.desc   OnVolumeChange - setVolume - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let audioVolumeManager = audioManager!.getVolumeManager();
      let groupManager = audioVolumeManager.getVolumeGroupManagerSync(audio.DEFAULT_VOLUME_GROUP_ID)
      let maxVolume = await groupManager.getMaxVolume(audio.AudioVolumeType.MEDIA)
      let minVolume = await groupManager.getMinVolume(audio.AudioVolumeType.MEDIA)
      await audioVolumeManager.setAppVolumePercentage(maxVolume);
      await Utils.msSleep(5000);
      audioVolumeManager.onAppVolumeChange((VolumeEvent) => {
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_STATIC_0100 VolumeEvent.volumeType: ${VolumeEvent.volumeType}, VolumeEvent.volume:${VolumeEvent.volume},VolumeEvent.volumeMode:${VolumeEvent.volumeMode}, VolumeEvent.updateUi:${VolumeEvent.updateUi}`);
        expect(VolumeEvent.volumeType).assertEqual(audio.AudioVolumeType.MEDIA);
        expect(VolumeEvent.volume).assertEqual(minVolume);
        expect(VolumeEvent.updateUi).assertEqual(false);
        done();
      });
      await audioVolumeManager.setAppVolumePercentage(minVolume);
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_STATIC_0200
     * @tc.number SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_STATIC_0200
     * @tc.desc   OnVolumeChange - getVolumeManager - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let audioSpatializationManager: audio.AudioSpatializationManager = audioManager!.getSpatializationManager();
        done();
      } catch (error) {
        console.info(`ON_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_STATIC_0100
     * @tc.desc   OnAudioSceneChange - audioManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        audioManager!.onAudioSceneChange((audioScene) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_OFFAUDIOSCENECHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_OFFAUDIOSCENECHANGE_STATIC_0100
     * @tc.desc   OffAudioSceneChange - audioManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_OFFAUDIOSCENECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let cb = (audioScene: audio.AudioScene) => {
          console.info(`AudioSceneChange event: ${audioScene} `);
      }
      try {
        audioManager!.onAudioSceneChange(cb);
        audioManager!.offAudioSceneChange(cb);
        audioManager!.onAudioSceneChange(cb);
        audioManager!.offAudioSceneChange();
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0100
     * @tc.desc   Test that no recording stream is currently started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };
      try {
        const isAvailable = streamManager!.isRecordingAvailable(capturerInfo);
        expect(isAvailable).assertTrue();
      } catch (error) {
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0200
     * @tc.desc   Test that a recording stream is currently started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };
      try {
        let audioCap = await audio.createAudioCapturer(capturerOptions);
        console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
        await audioCap!.start();
        const isAvailable = streamManager!.isRecordingAvailable(checkCapturerInfo);
        expect(isAvailable).assertTrue();
        await audioCap!.stop();
        await audioCap!.release();
      } catch (error) {
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0300
     * @tc.desc   Test input parameter sourceType invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      };
      try {
        streamManager!.isRecordingAvailable(capturerInfo);
        expect(false).assertTrue();
      } catch (error) {
        error = error as BusinessError;
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(Number(error.code) == 6800101).assertTrue();
      }
      done();
    })
  })
}
