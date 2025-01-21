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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import featureAbility from '@ohos.ability.featureAbility';
import ArrayList from '@ohos.util.ArrayList';
import * as env from './Const.ets';

export default function audioManagerTest() {
  describe('getSystemVolumeInDb', function () {
    let audioManager = null;
    let audioVolumeManager = null;
    let audioVolumeGroupManager = null;
    let TagFrmwk = "audioManagerEnhanceTest";
    beforeAll(async function () {
      // await getPermission();
      // await sleep(3000);
      console.info('TestLog: Start Testing audioManagerTest Interfaces');
    })
    beforeEach(async function () {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      getAudioManager();
      await sleep(100);
    })
    afterEach(async function () {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await sleep(100);
    })
    afterAll(function () {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })

    function getAudioManager() {
      audioManager = audio.getAudioManager();
      if (audioManager != null) {
        console.info(`${TagFrmwk}: getAudioManger : PASS`);
        audioVolumeManager = audioManager.getVolumeManager();
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

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    async function getPermission() {
      console.info("getPermission IN\n")
      let permissions = ['ohos.permission.MICROPHONE', 'ohos.permission.MODIFY_AUDIO_SETTINGS', 'ohos.permission.ACCESS_NOTIFICATION_POLICY'];
      featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
        console.info("request success" + JSON.stringify(data));
      })
    }

    /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0100
         * @tc.name      : getSystemVolumeInDbSync - Media 
         * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0100', 0, async function (done) {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0200', 0, async function (done) {
      try {
        let data = audioVolumeGroupManager.getSystemVolumeInDbSync();
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0300', 0, async function (done) {
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
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0400
         * @tc.name      : getSystemVolumeInDbSync - String_Parameter - 401 - Promise
         * @tc.desc      : getSystemVolumeInDbSync - String_Parameter - 401 - Promise
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_0400', 0, async function (done) {
      try {
        let data = audioVolumeGroupManager.getSystemVolumeInDbSync('123');
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0100
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0100', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER)
          .then((data) => {
            console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          })
          .catch((error) => {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0200', 0, async function (done) {
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
            .catch((error) => {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300', 0, async function (done) {
      try {
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        let volLevel = 0;
        for (volLevel = minVol; volLevel <= maxVol; volLevel++) {
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, volLevel, audio.DeviceType.SPEAKER)
            .then((data) => {
              console.info(` ${volLevel} getSystemVolumeInDb :SUCCESS ${data}`);
            })
            .catch((error) => {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0400', 0, async function (done) {
      try {
        for (let index in audio.DeviceType) {
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 1, audio.DeviceType[index])
            .then((data) => {
              console.info(`${index} getSystemVolumeInDb :SUCCESS ${data}`);
            })
            .catch((error) => {
              if (index == 'DEFAULT' || index == 'MAX' || index == 'INVALID' || index == 'NONE' || index == 'WAKEUP') {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0500', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(-1, 3, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`getSystemVolumeInDb :SUCCESS ${data}, testcase FAIL!`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0600', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, -1, audio.DeviceType.SPEAKER)
          .then((data) => {
            console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          })
          .catch((error) => {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0700', 0, async function (done) {
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
          .catch((error) => {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0800', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, -1).then((data) => {
          console.info(`getSystemVolumeInDb :SUCCESS ${data}, test fail!`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0900', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb('123', 3, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if (error) {
            console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1000
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1000', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, '123', audio.DeviceType.SPEAKER)
          .then((data) => {
            console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          })
          .catch((error) => {
            if (error) {
              console.log(`${TagFrmwk}:getSystemVolumeInDb error: ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1100
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1100', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.MIC)
          .then((data) => {
            console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          })
          .catch((error) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1200
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1200', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(3, audio.DeviceType.SPEAKER, (err, data) => {
          if (err) {
            console.log(`${TagFrmwk}getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwk}: getSystemVolumeInDb testcase FAIL! `);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(`${TagFrmwk}:getSystemVolumeInDb error, check error code: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1300
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1300', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, audio.DeviceType.SPEAKER, (err, data) => {
          if (err) {
            console.log(`${TagFrmwk} getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwk}: getSystemVolumeInDb testcase FAIL! `);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(`${TagFrmwk}:getSystemVolumeInDb error, check error code: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1400
     * @tc.name      : getSystemVolumeInDb - Media - Promise
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1400', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, (err, data) => {
          if (err) {
            console.log(`${TagFrmwk}:getSystemVolumeInDb error ${err.message} ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwk}: getSystemVolumeInDb testcase FAIL! `);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(`${TagFrmwk}:getSystemVolumeInDb error, check error code: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1500
     * @tc.name      : getSystemVolumeInDb - Media - Callback
     * @tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1500', 0, async function (done) {
      try {
        var db1 = new ArrayList < Number > ();
        var db2 = new ArrayList < Number > ();
        var device = [audio.DeviceType.SPEAKER, audio.DeviceType.EARPIECE, audio.DeviceType.WIRED_HEADSET];
        for (var deviceIndex = 0; deviceIndex < device.length; deviceIndex++) {
          for (let typeIndex = 0; typeIndex < env.AudioVolumeType.length; typeIndex++) {
            let maxVol = await audioVolumeGroupManager.getMaxVolume(env.AudioVolumeType[typeIndex]);
            let minVol = await audioVolumeGroupManager.getMinVolume(env.AudioVolumeType[typeIndex]);
            for (let volIndex = minVol; volIndex <= maxVol; volIndex++) {
              await audioVolumeGroupManager.getSystemVolumeInDb(env.AudioVolumeType[typeIndex], volIndex, device[deviceIndex], (err, data) => {
                if (err) {
                  console.info(`getSystemVolumeInDb : error ${err.message} ${err.code}`);
                  expect(false).assertTrue();
                  done();
                } else {
                  db1.add(data);
                }
              });
              await audioVolumeGroupManager.getSystemVolumeInDb(env.AudioVolumeType[typeIndex], volIndex, device[deviceIndex], (err, data) => {
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
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1600', 0, async function (done) {
      await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 0, audio.DeviceType.SPEAKER, (err, data) => {
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
  })
}
