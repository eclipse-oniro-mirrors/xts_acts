/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import audio from '@ohos.multimedia.audio';
import featureAbility from '@ohos.ability.featureAbility';
import ArrayList from '@ohos.util.ArrayList';
import * as env from './Const.ets';
import { BusinessError } from '@ohos.base';

let TagFrmwk: string = "audioManagerEnhanceTest";
let audioVolumeGroupManager: audio.AudioVolumeGroupManager;

function getAudioManager() {
  let audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
    let audioVolumeManager = audioManager.getVolumeManager();
    console.info(`${TagFrmwk}: getVolumeManager : PASS`);
    let groupid = audio.DEFAULT_VOLUME_GROUP_ID;
    audioVolumeManager.getVolumeGroupManager(groupid, (err, value) => {
      if (err) {
        console.info("getVolumeGroupManager failed. err:" + JSON.stringify(err));
        console.info("groupid:" + groupid);
        return;
      }
      console.info("getVolumeGroupManager success");
      audioVolumeGroupManager = value;
    });
  }
  else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

async function getPermission() {
  console.info("getPermission IN\n")
  let permissions = ['ohos.permission.MICROPHONE', 'ohos.permission.MODIFY_AUDIO_SETTINGS', 'ohos.permission.ACCESS_NOTIFICATION_POLICY'];
  featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
    console.info("request success" + JSON.stringify(data));
  })
}

export default function audioManagerTest() {
  describe('getSystemVolumeInDb', () => {


    beforeAll(async () => {
      console.info('TestLog: Start Testing audioManagerTest Interfaces');
    })
    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      getAudioManager();
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0100
     * @tc.name      : getSystemVolumeInDbSync - Media
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0100', 0, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER)
        console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0200
         * @tc.name      : getSystemVolumeInDbSync - Null_Parameter - 401
         * @tc.desc      : getSystemVolumeInDbSync - Null_Parameter - 401
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
       let data = audioVolumeGroupManager.getSystemVolumeInDbSync(123,null,audio.DeviceType.SPEAKER);
        console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0300
         * @tc.name      : getSystemVolumeInDbSync - Invaild_Number_Parameter - 6800101
         * @tc.desc      : getSystemVolumeInDbSync - Invaild_Number_Parameter - 6800101
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0300', 0, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getSystemVolumeInDbSync(123, 3, audio.DeviceType.SPEAKER);
        console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })
    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0300
    * @tc.name      : getSystemVolumeInDbSync - Invaild_Number_Parameter - 401
    * @tc.desc      : getSystemVolumeInDbSync - Invaild_Number_Parameter - 401
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0500', 0, async (done: Function) => {
      try {
        let para1 : ESObject = '1';
        let data = audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, para1, audio.DeviceType.SPEAKER)
        console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_MICSTATECHANGE_0100
     * @tc.name      : ON_micStateChange - Media - VolumeGroupManager
     * @tc.desc      : Listen for changes in the system microphone status.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_MICSTATECHANGE_0100', 0, async (done: Function) => {
      try {
        let para1 : ESObject = 111;
        let micStateChangeCallback = (micStateChange: audio.MicStateChangeEvent) => {
          console.info(`Current microphone status is: ${micStateChange.mute} `);
        };
        audioVolumeGroupManager.on(para1, micStateChangeCallback);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`ON_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      }
    })
     /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_MICSTATECHANGE_0200
     * @tc.name      : ON_micStateChange - Media - VolumeGroupManager
     * @tc.desc      : Listen for changes in the system microphone status.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_MICSTATECHANGE_0200', 0, async (done: Function) => {
      try {
        let para1 : ESObject = 'aaa';
        let micStateChangeCallback = (micStateChange: audio.MicStateChangeEvent) => {
          console.info(`Current microphone status is: ${micStateChange.mute} `);
        };
        audioVolumeGroupManager.on(para1, micStateChangeCallback);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`ON_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(Number(error.code) == 6800101).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_OFF_MICSTATECHANGE_0100
     * @tc.name      : ON_micStateChange - Media - VolumeGroupManager
     * @tc.desc      : Listen for changes in the system microphone status.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_OFF_MICSTATECHANGE_0100', 0, async (done: Function) => {
      try {
        let para1 : ESObject = 111;
        let micStateChangeCallback = (micStateChange: audio.MicStateChangeEvent) => {
          console.info(`Current microphone status is: ${micStateChange.mute} `);
        };
        audioVolumeGroupManager.on('micStateChange', micStateChangeCallback);
        audioVolumeGroupManager.off(para1, micStateChangeCallback);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`OFF_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      }
    })
     /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_OFF_MICSTATECHANGE_0200
     * @tc.name      : ON_micStateChange - Media - VolumeGroupManager
     * @tc.desc      : Listen for changes in the system microphone status.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_OFF_MICSTATECHANGE_0200', 0, async (done: Function) => {
      try {
        let para1 : ESObject = 'aaa';
        let micStateChangeCallback = (micStateChange: audio.MicStateChangeEvent) => {
          console.info(`Current microphone status is: ${micStateChange.mute} `);
        };
        audioVolumeGroupManager.on('micStateChange', micStateChangeCallback);
        audioVolumeGroupManager.off(para1, micStateChangeCallback);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`OFF_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(Number(error.code) == 6800101).assertTrue();
        done();
      }
    })
    /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0400
         * @tc.name      : getSystemVolumeInDbSync - String_Parameter - 401 - Promise
         * @tc.desc      : getSystemVolumeInDbSync - String_Parameter - 401 - Promise
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    //it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0400', 0, async (done: Function) => {
    //  try {
    //    let data = audioVolumeGroupManager.getSystemVolumeInDbSync('123');
    //    console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
    //    expect(false).assertTrue();
    //    done();
    //  } catch (error) {
    //    console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
    //    expect(Number(error.code)).assertEqual(401);
    //    done();
    //  }
    //})

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0100
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0100', 0, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER)
          .then((data) => {
            console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log(`${TagFrmwk}: getSystemVolumeInDb : error ${error}`);
            expect(false).assertTrue();
            done();
          });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0200
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0200', 0, async (done: Function) => {
      try {
        // var db1 = new ArrayList < Number > ();
        // var db2 = [0.06932847946882248, 0.08370080590248108, 0.08370080590248108, 0.06932847946882248, 0.06932847946882248, 0.06932847946882248];
        for (let index = 0; index < env.AudioVolumeType.length; index++) {
          await audioVolumeGroupManager.getSystemVolumeInDb(env.AudioVolumeType[index], 3, audio.DeviceType.SPEAKER)
            .then((data) => {
              console.info(`${env.AudioVolumeType[index]} getSystemVolumeInDb :SUCCESS ${data}`);
              // db1.add(data);
              expect(true).assertTrue();
              done();
            })
            .catch((error: BusinessError) => {
              console.log(`${TagFrmwk}: ${env.AudioVolumeType[index]} getSystemVolumeInDb : error ${error}`);
              expect(false).assertTrue();
              done();
            });
        }
        // for (let i = 0; i < db1.length; i++) {
        //   console.log(`${db1[i]}: ${db2[i]}`);
        //   expect(Number(db1[i])).assertEqual(Number(db2[i]));
        // }
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300', 0, async (done: Function) => {
      try {
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        let volLevel = 0;
        for (volLevel = minVol; volLevel <= maxVol; volLevel++) {
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, volLevel, audio.DeviceType.SPEAKER)
            .then((data) => {
              console.info(` ${volLevel} getSystemVolumeInDb :SUCCESS ${data}`);
            })
            .catch((error: BusinessError) => {
              console.log(`${TagFrmwk}: ${volLevel} getSystemVolumeInDb : error ${error}`);
              expect(false).assertTrue();
              done();
            });
        }
        done();
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0400
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0400', 0, async (done: Function) => {
      try {
        for (let index of Object.keys(audio.DeviceType)) {
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 1, audio.DeviceType[index])
            .then((data) => {
              console.info(`${index} getSystemVolumeInDb :SUCCESS ${data}`);
            })
            .catch((error: BusinessError) => {
              if (index == 'DEFAULT' || index == 'MAX' || index == 'INVALID' || index == 'NONE' || index == 'WAKEUP' ||
                index == 'DISPLAY_PORT' || index == 'REMOTE_CAST' || index == 'HDMI' || index == 'REMOTE_DAUDIO' || 
                index == 'LINE_DIGITAL' || index == 'ACCESSORY') {
                console.log(`${index} getSystemVolumeInDb :${error.code} ${error.message}`);
              } else {
                console.log(`${TagFrmwk}:${index} getSystemVolumeInDb : error ${error.message} ${error.code}`);
                expect(false).assertTrue();
                done();
              }
            });
        }
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0500
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0500', 0, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(-1, 3, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`getSystemVolumeInDb :SUCCESS ${data}, testcase FAIL!`);
          expect(false).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          if (error) {
            console.log(`${TagFrmwk}:getSystemVolumeInDb error ${error.message} ${error.code}`);
            expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0600
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0600', 0, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, -1, audio.DeviceType.SPEAKER)
          .then((data) => {
            console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            if (error) {
              console.log(`${TagFrmwk}: getSystemVolumeInDb : error ${error.message} ${error.code}`);
              expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0700
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0700', 0, async (done: Function) => {
      try {
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let nowVolume = maxVol + 1
        console.log(`nowVolume type: ${typeof (nowVolume)},${nowVolume}`);
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, nowVolume, audio.DeviceType.SPEAKER)
          .then((data) => {
            console.info(`getSystemVolumeInDb :SUCCESS ${data}, testcase FAIL!`);
            expect(false).assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            if (error) {
              console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${error.message} ${error.code}`);
              expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0800
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0800', 0, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, -1).then((data) => {
          console.info(`getSystemVolumeInDb :SUCCESS ${data}, test fail!`);
          expect(false).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.log(`getSystemVolumeInDb : error ${error.code}, check the error code`);
          expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
          done();
        });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0900
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0900', 0, async (done: Function) => {
    //  try {
    //    await audioVolumeGroupManager.getSystemVolumeInDb('123', 3, audio.DeviceType.SPEAKER).then((data) => {
    //      console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
    //      expect(false).assertTrue();
    //      done();
    //    }).catch((error: BusinessError) => {
    //      if (error) {
    //        console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${error.message} ${error.code}`);
    //        expect(false).assertTrue();
    //        done();
    //      } else {
    //        expect(false).assertTrue();
    //        done();
    //      }
    //    });
    //  } catch (error) {
    //    console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
    //    expect(Number(error.code)).assertEqual(401);
    //    done();
    //  }
    //})

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1000
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1000', 0, async (done: Function) => {
    //  try {
    //    await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, '123', audio.DeviceType.SPEAKER)
    //      .then((data) => {
    //        console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
    //        expect(false).assertTrue();
    //        done();
    //      })
    //      .catch((error: BusinessError) => {
    //        if (error) {
    //          console.log(`${TagFrmwk}:getSystemVolumeInDb error: ${error.message} ${error.code}`);
    //          expect(false).assertTrue();
    //          done();
    //        } else {
    //          expect(false).assertTrue();
    //          done();
    //        }
    //      });
    //  } catch (error) {
    //    console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
    //    expect(Number(error.code)).assertEqual(401);
    //    done();
    //  }
    //})

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1100
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1100', 0, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.MIC)
          .then((data) => {
            console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
            done();
          });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1200
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1200', 0, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`getSystemVolumeInDb :SUCCESS ${data}, test fail!`);
          expect(false).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.log(`getSystemVolumeInDb : error ${error.code}, check the error code`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1200
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1200', 0, async (done: Function) => {
    //  try {
    //    await audioVolumeGroupManager.getSystemVolumeInDb(3, audio.DeviceType.SPEAKER, (err: BusinessError, data: number) => {
    //      if (err) {
    //        console.log(`${TagFrmwk}getSystemVolumeInDb : error ${err.message} ${err.code}`);
    //        expect(false).assertTrue();
    //        done();
    //      } else {
    //        console.log(`${TagFrmwk}: getSystemVolumeInDb testcase FAIL! `);
    //        expect(false).assertTrue();
    //        done();
    //      }
    //    });
    //  } catch (error) {
    //    console.log(`${TagFrmwk}:getSystemVolumeInDb error, check error code: ${error.code}`);
    //    expect(Number(error.code)).assertEqual(401);
    //    done();
    //  }
    //})

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1300
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1300', 0, async (done: Function) => {
    //  try {
    //    await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, audio.DeviceType.SPEAKER, (err: BusinessError, data: number) => {
    //      if (err) {
    //        console.log(`${TagFrmwk} getSystemVolumeInDb : error ${err.message} ${err.code}`);
    //        expect(false).assertTrue();
    //        done();
    //      } else {
    //        console.log(`${TagFrmwk}: getSystemVolumeInDb testcase FAIL! `);
    //        expect(false).assertTrue();
    //        done();
    //      }
    //    });
    //  } catch (error) {
    //    console.log(`${TagFrmwk}:getSystemVolumeInDb error, check error code: ${error.code}`);
    //    expect(Number(error.code)).assertEqual(401);
    //    done();
    //  }
    //})

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1400
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1400', 0, async (done: Function) => {
    //  try {
    //    await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, (err: BusinessError, data: number) => {
    //      if (err) {
    //        console.log(`${TagFrmwk}:getSystemVolumeInDb error ${err.message} ${err.code}`);
    //        expect(false).assertTrue();
    //        done();
    //      } else {
    //        console.log(`${TagFrmwk}: getSystemVolumeInDb testcase FAIL! `);
    //        expect(false).assertTrue();
    //        done();
    //      }
    //    });
    //  } catch (error) {
    //    console.log(`${TagFrmwk}:getSystemVolumeInDb error, check error code: ${error.code}`);
    //    expect(Number(error.code)).assertEqual(401);
    //    done();
    //  }
    //})

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1500
     * @tc.name      : getSystemVolumeInDb - Media - Callback
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1500', 0, async (done: Function) => {
      try {
        let db1 = new ArrayList <Number>();
        let db2 = new ArrayList <Number>();
        let device = [audio.DeviceType.SPEAKER, audio.DeviceType.EARPIECE, audio.DeviceType.WIRED_HEADSET];
        for (let deviceIndex = 0; deviceIndex < device.length; deviceIndex++) {
          for (let typeIndex = 0; typeIndex < env.AudioVolumeType.length; typeIndex++) {
            let maxVol = await audioVolumeGroupManager.getMaxVolume(env.AudioVolumeType[typeIndex]);
            let minVol = await audioVolumeGroupManager.getMinVolume(env.AudioVolumeType[typeIndex]);
            for (let volIndex = minVol; volIndex <= maxVol; volIndex++) {
              audioVolumeGroupManager.getSystemVolumeInDb(env.AudioVolumeType[typeIndex], volIndex, device[deviceIndex], (err: BusinessError, data: number) => {
                if (err) {
                  console.info(`getSystemVolumeInDb : error ${err.message} ${err.code}`);
                  expect(false).assertTrue();
                  done();
                } else {
                  db1.add(data);
                }
              });
              audioVolumeGroupManager.getSystemVolumeInDb(env.AudioVolumeType[typeIndex], volIndex, device[deviceIndex], (err: BusinessError, data: number) => {
                if (err) {
                  console.info(`getSystemVolumeInDb : error ${err.message} ${err.code}`);
                  expect(false).assertTrue();
                  done();
                } else {
                  db2.add(data);
                }
              });
              await sleep(20);
            }
          }
        }
        console.log(`${TagFrmwk}:getSystemVolumeInDb : SUCCESS`);
        for (let i = 0; i < db1.length; i++) {
          expect(db1[i]).assertEqual(db2[i]);
        }
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1600
     * @tc.name      : getSystemVolumeInDb - Media - Callback
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1600', 0, async (done: Function) => {
      audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 0, audio.DeviceType.SPEAKER, (err: BusinessError, data: number) => {
        if (err) {
          console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${err.message} ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.log(`${TagFrmwk}:getSystemVolumeInDb SUCCESS dB:${data}`);
          expect(data).assertEqual(0);
          done();
        }
      })
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0500
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let para: ESObject = '123';
      let flag: boolean = false;
      try {
        audioVolumeGroupManager.on('ringerModeChange',para);
      } catch (err) {
        console.log('err :' + err.message)
        expect(Number(err.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
  })
}
