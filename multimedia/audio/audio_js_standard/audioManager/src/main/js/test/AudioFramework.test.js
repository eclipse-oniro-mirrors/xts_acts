/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import audio from '@ohos.multimedia.audio';
import featureAbility from '@ohos.ability.featureAbility';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { UiDriver, BY } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';


export default function audioFramework() {

    describe('audioFramework', function () {
        let TagFrmwk = "AudioFrameworkTest";
        console.info(`${TagFrmwk}: Create AudioManger Object JS Framework`);
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        let audioManager = null;
        let audioVolumeManager = null;
        let audioVolumeGroupManager = null;
        let dRValue = null;
        let dTValue = null;
        let devId = null;
        let devName = null;
        let devAddr = null;
        let sRate = null;
        let cCount = null;
        let cMask = null;
        let audioMedia = 3;
        let audioRingtone = 2;
        let minVol = 0;
        let maxVol = 15;
        let lowVol = 5;
        let highVol = 14;
        let outOfRangeVol = 28;
        let longValue = '28374837458743875804735081439085918459801437584738967509184509813904850914375904790589104801843';
        async function getAudioManager() {
            audioManager = audio.getAudioManager();
            if (audioManager != null) {
                console.info(`${TagFrmwk}: getAudioManger : PASS`);
            }
            else {
                console.info(`${TagFrmwk}: getAudioManger : FAIL`);
            }
        }

        async function getVolumeGroupManager() {
            audioVolumeManager = await audioManager.getVolumeManager();
            audioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID)
            if (audioVolumeGroupManager != null) {
                console.info(`${TagFrmwk}: getVolumeGroupManager : PASS`);
            } else {
                console.info(`${TagFrmwk}: getVolumeGroupManager : FAIL`);
            }


        }

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        function displayDeviceProp(value, index, array) {
            let devRoleName;
            let devTypeName;
            if (value.deviceRole == 1) {
                devRoleName = 'INPUT_DEVICE';
            }
            else if (value.deviceRole == 2) {
                devRoleName = 'OUTPUT_DEVICE ';
            }
            else {
                devRoleName = 'ERROR : UNKNOWN : ' + value.deviceRole;
            }

            if (value.deviceType == 1) {
                devTypeName = 'EARPIECE';
            }
            else if (value.deviceType == 2) {
                devTypeName = 'SPEAKER';
            }
            else if (value.deviceType == 3) {
                devTypeName = 'WIRED_HEADSET';
            }
            else if (value.deviceType == 8) {
                devTypeName = 'BLUETOOTH_A2DP';
            }
            else if (value.deviceType == 15) {
                devTypeName = 'MIC';
            }
            else {
                devTypeName = 'ERROR : UNKNOWN :' + value.deviceType;
            }

            console.info(`${TagFrmwk}: device role: ${devRoleName}`);
            dRValue = value.deviceRole;
            console.info(`${TagFrmwk}: device type: ${devTypeName}`);
            dTValue = value.deviceType;
            devId = value.id;
            devName = value.name;
            devAddr = value.address;
            sRate = value.sampleRates[0];
            cCount = value.channelCounts[0];
            cMask = value.channelMasks;
            console.info(`${TagFrmwk}: device info: ${value}`);
        }
        async function getPermission() {
            let permissions = ['ohos.permission.MICROPHONE'];
            featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
                console.info("request success" + JSON.stringify(data));
            })
        }
        async function driveFn() {
            console.info(`come in driveFn`);
            let driver = await UiDriver.create();
            console.info(`driver is ${JSON.stringify(driver)}`);
            await sleep(100);
            console.info(`UiDriver start`);
            let button = await driver.findComponent(BY.text('允许'));
            if (button == null) {
                let cmd = "hidumper -s WindowManagerService -a'-a'"
                await delegator.executeShellCommand(cmd);
            }
            console.info(`button is ${JSON.stringify(button)}`);
            await sleep(100);
            await button.click();
        }

        beforeAll(async function () {
            await getPermission();
            await driveFn();
            await getAudioManager();
            await getVolumeGroupManager();
            console.info('TestLog: Start Testing AudioFrameworkTest Interfaces');
        })

        beforeEach(async function () {
            console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
            await sleep(100);
        })

        afterEach(async function () {
            console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
            await sleep(100);
        })

        afterAll(function () {
            console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
        })

        /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0100
        *@tc.name      : getVolumeSync - Media - Sync
        *@tc.desc      : getVolumeSync - Media - Sync
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 1
        */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0100', 1, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, lowVol);
                console.info(`${TagFrmwk}: Media setVolume promise: successful`);
                let data = audioVolumeGroupManager.getVolumeSync(audioMedia);
                if (data == lowVol) {
                    console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
                    expect(false).assertTrue();
                    done();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message));
                expect(false).assertTrue();
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0200
         *@tc.name      : getVolumeSync - Null_Parameter - 401
         *@tc.desc      : getVolumeSync - Null_Parameter - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0200', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getVolumeSync();
                console.info(`${TagFrmwk}: Media getVolumeSync : success :${data}`);
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log(`err : ${err.message},Code:${err.code}`);
                expect(Number(err.code)).assertEqual(401);
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0300
         *@tc.name      : getVolumeSync - Invaild_Number_Parameter - 6800101
         *@tc.desc      : getVolumeSync - Invaild_Number_Parameter - 6800101
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0300', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getVolumeSync(123);
                console.info(`${TagFrmwk}: Media getVolumeSync : success :${data}`);
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log(`err : ${err.message},Code:${err.code}`);
                expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0400
         *@tc.name      : getVolumeSync - String_Parameter - 401
         *@tc.desc      : getVolumeSync - String_Parameter - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0400', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getVolumeSync('123');
                console.info(`${TagFrmwk}: Media getVolumeSync : success :${data}`);
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log(`err : ${err.message},Code:${err.code}`);
                expect(Number(err.code)).assertEqual(401);
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0100
         *@tc.name      : getMinVolumeSync - Media - Sync
         *@tc.desc      : getMinVolumeSync - Media - Sync
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0100', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getMinVolumeSync(audio.AudioVolumeType.MEDIA);
                if (data == 0) {
                    console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
                    expect(false).assertTrue();
                    done();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message));
                expect(false).assertTrue();
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0200
         *@tc.name      : getMinVolumeSync - Media - Null_Parameter - 401
         *@tc.desc      : getMinVolumeSync - Media - Null_Parameter - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0200', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getMinVolumeSync();
                console.log('getMinVolumeSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(401);
                done();
            }

        })
        /**
                 *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0300
                 *@tc.name      : getMinVolumeSync - Media - Invaild_Number_Parameter - 6800101
                 *@tc.desc      : getMinVolumeSync - Media - Invaild_Number_Parameter - 6800101
                 *@tc.size      : MEDIUM
                 *@tc.type      : Function
                 *@tc.level     : Level 1
                 */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0300', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getMinVolumeSync(123);
                console.log('getMinVolumeSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0400
         *@tc.name      : getMinVolumeSync - Media - String_Parameter - 401
         *@tc.desc      : getMinVolumeSync - Media - String_Parameter - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0400', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getMinVolumeSync('123');
                console.log('getMinVolumeSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(401);
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0100
         *@tc.name      : getMaxVolumeSync - Media - Sync
         *@tc.desc      : getMaxVolumeSync - Media - Sync
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0100', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.MEDIA);
                if (data == 15) {
                    console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
                    expect(false).assertTrue();
                    done();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message));
                expect(false).assertTrue();
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0200
         *@tc.name      : getMaxVolumeSync - Media - Null_Parameter - 401
         *@tc.desc      : getMaxVolumeSync - Media - Null_Parameter - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0200', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getMaxVolumeSync();
                console.log('getMaxVolumeSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(401);
                done();
            }

        })
        /**
                 *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0300
                 *@tc.name      : getMaxVolumeSync - Media - Invaild_Number_Parameter - 6800101
                 *@tc.desc      : getMaxVolumeSync - Media - Invaild_Number_Parameter - 6800101
                 *@tc.size      : MEDIUM
                 *@tc.type      : Function
                 *@tc.level     : Level 1
                 */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0300', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getMaxVolumeSync(123);
                console.log('getMaxVolumeSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0400
         *@tc.name      : getMaxVolumeSync - Media - String_Parameter - 401
         *@tc.desc      : getMaxVolumeSync - Media - String_Parameter - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0400', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getMaxVolumeSync('123');
                console.log('getMaxVolumeSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(401);
                done();
            }

        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0100
         *@tc.name      : isMuteSync - Media - Sync
         *@tc.desc      : isMuteSync - Media - Sync
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0100', 1, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.MEDIA, 0);
                let data = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.MEDIA);
                if (data == true) {
                    console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
                    expect(false).assertTrue();
                    done();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message));
                expect(false).assertTrue();
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0200
         *@tc.name      : isMuteSync - Media - Null_Parameter - 401
         *@tc.desc      : isMuteSync - Media - Null_Parameter - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0200', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.isMuteSync();
                console.log('isMuteSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(401);
                done();
            }

        })
        /**
                 *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0300
                 *@tc.name      : isMuteSync - Media - Invaild_Number_Parameter - 6800101
                 *@tc.desc      : isMuteSync - Media - Invaild_Number_Parameter - 6800101
                 *@tc.size      : MEDIUM
                 *@tc.type      : Function
                 *@tc.level     : Level 1
                 */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0300', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.isMuteSync(123);
                console.log('isMuteSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
                done();
            }

        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0400
         *@tc.name      : isMuteSync - Media - String_Parameter - 401
         *@tc.desc      : isMuteSync - Media - String_Parameter - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0400', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.isMuteSync('123');
                console.log('isMuteSync success');
                expect(false).assertTrue();
                done();
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
                expect(Number(err.code)).assertEqual(401);
                done();
            }

        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_0500
         *@tc.name      : isMuteSync - Media - Sync
         *@tc.desc      : isMuteSync - Media - Sync
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_0500', 1, async function (done) {
            try {
                let data = audioVolumeGroupManager.getRingerModeSync(audio.AudioVolumeType.MEDIA);
                if (data != null) {
                    console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
                    expect(false).assertTrue();
                    done();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message));
                expect(false).assertTrue();
                done();
            }

        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMICROPHONEMUTESYNC_0600
         *@tc.name      : isMuteSync - Media - Sync
         *@tc.desc      : isMuteSync - Media - Sync
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMICROPHONEMUTESYNC_0600', 1, async function (done) {
            try {
                await audioVolumeGroupManager.setMicrophoneMute(true).then(() => {
                    console.info('Promise returned to indicate that the microphone is muted.');
                });
                let data = audioVolumeGroupManager.isMicrophoneMuteSync();
                if (data == true) {
                    console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
                    expect(false).assertTrue();
                    done();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err.message));
                expect(false).assertTrue();
                done();
            }

        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOMANAGER_0200
         *@tc.name      : getAudioManger - Multiple instance
         *@tc.desc      : multiple times with different instance
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOMANAGER_0200', 1, async function (done) {
            try {
                const AUDIOMANAGER1 = audio.getAudioManager();
                const AUDIOMANAGER2 = audio.getAudioManager();
                const AUDIOMANAGER3 = audio.getAudioManager();
                const AUDIOMANAGER4 = audio.getAudioManager();
                const AUDIOMANAGER5 = audio.getAudioManager();
                const AUDIOMANAGER6 = audio.getAudioManager();
                const AUDIOMANAGER7 = audio.getAudioManager();
                const AUDIOMANAGER8 = audio.getAudioManager();
                const AUDIOMANAGER9 = audio.getAudioManager();
                const AUDIOMANAGER10 = audio.getAudioManager();
                await audioManager.setVolume(audioMedia, lowVol);
                console.info(`${TagFrmwk}: Media setVolume promise: successful`);
                await AUDIOMANAGER1.setVolume(audioMedia, highVol);
                console.info(`${TagFrmwk}:audioManager1 : Media setVolume promise: successful`);
                await AUDIOMANAGER2.setVolume(audioMedia, highVol);
                console.info(`${TagFrmwk}:audioManager2 : Media setVolume promise: successful`);
                await AUDIOMANAGER3.setVolume(audioMedia, highVol);
                console.info(`${TagFrmwk}:audioManager3 : Media setVolume promise: successful`);
                await AUDIOMANAGER4.setVolume(audioMedia, lowVol);
                console.info(`${TagFrmwk}:audioManager4 : Media setVolume promise: successful`);
                await AUDIOMANAGER5.setVolume(audioMedia, highVol);
                console.info(`${TagFrmwk}:audioManager5 : Media setVolume promise: successful`);
                await AUDIOMANAGER6.setVolume(audioMedia, lowVol);
                console.info(`${TagFrmwk}:audioManager6 : Media setVolume promise: successful`);
                await AUDIOMANAGER7.setVolume(audioMedia, highVol);
                console.info(`${TagFrmwk}:audioManager7 : Media setVolume promise: successful`);
                await AUDIOMANAGER8.setVolume(audioMedia, lowVol);
                console.info(`${TagFrmwk}:audioManager8 : Media setVolume promise: successful`);
                await AUDIOMANAGER9.setVolume(audioMedia, highVol);
                console.info(`${TagFrmwk}:audioManager9 : Media setVolume promise: successful`);
                await AUDIOMANAGER10.setVolume(audioMedia, lowVol);
                console.info(`${TagFrmwk}:audioManager10 : Media setVolume promise: successful`);
                let data = await audioManager.getVolume(audioMedia);
                if (data == lowVol) {
                    console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getVolume Promise: FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info(`${TagFrmwk}: Media getVolume Promise: Error :${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0100
         *@tc.name      : setVolume - Media - Promise
         *@tc.desc      : Setvol to 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0100', 1, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, lowVol);
                console.info(`${TagFrmwk}: Media setVolume promise: successful`);
                let data = await audioManager.getVolume(audioMedia);
                if (data == lowVol) {
                    console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getVolume Promise: FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0200
         *@tc.name      : setVolume - Media - Promise - MAX Volume
         *@tc.desc      : Setvol to 15
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0200', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, maxVol);
                let data = await audioManager.getVolume(audioMedia);
                if (data == maxVol) {
                    console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getVolume Promise: FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0300
         *@tc.name      : setVolume - Media - Promise - Mute Volume
         *@tc.desc      : Setvol to 0
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0300', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, minVol);
                let data = await audioManager.getVolume(audioMedia);
                if (data == minVol) {
                    console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getVolume Promise: FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0400
         *@tc.name      : setVolume - Media - Promise - Out of range Volume
         *@tc.desc      : Setvol to 28 (More than 15)
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0400', 2, async function (done) {
            await audioManager.setVolume(audioMedia, outOfRangeVol).then(() => {
                console.info(`${TagFrmwk}: Media setVolume Promise:Out of range: FAIL`);
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`${TagFrmwk}: Media setVolume Promise:Out of range: PASS :${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0500
         *@tc.name      : setVolume - Media - Callback
         *@tc.desc      : Setvol to 14
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0500', 2, function (done) {
            audioManager.setVolume(audioMedia, highVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback :  Media setVolume successful `);
                    audioManager.getVolume(audioMedia, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: callback : Media: failed to get volume ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == highVol) {
                            console.info(`${TagFrmwk}: callback : Media getVolume: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: callback : Media getVolume: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0600
         *@tc.name      : setVolume - Media - Callback - MAX Volume
         *@tc.desc      : Setvol to 15
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0600', 2, function (done) {
            audioManager.setVolume(audioMedia, maxVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback :  Media setVolume successful `);
                    audioManager.getVolume(audioMedia, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: callback : Media: failed to get volume ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == maxVol) {
                            console.info(`${TagFrmwk}: callback : Media getVolume: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: callback : Media getVolume: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0700
         *@tc.name      : setVolume - Media - Callback - Mute Volume
         *@tc.desc      : Setvol to 0
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0700', 2, function (done) {
            audioManager.setVolume(audioMedia, minVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback :  Media setVolume successful `);
                    audioManager.getVolume(audioMedia, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: callback : Media: failed to get volume ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == minVol) {
                            console.info(`${TagFrmwk}: callback : Media getVolume: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: callback : Media getVolume: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0800
         *@tc.name      : setVolume - Media - Callback - Out of range Volume
         *@tc.desc      : Setvol to 20
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0800', 2, function (done) {
            audioManager.setVolume(audioMedia, outOfRangeVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: setVolume: Out of range: Callback: PASS:  ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: setVolume: callback : Media Out of range: FAIL`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0900
         *@tc.name      : setVolume - Ringtone - Promise
         *@tc.desc      : Setvol to 5
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0900', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, lowVol);
                let data = await audioManager.getVolume(audioRingtone);
                if (data == lowVol) {
                    console.info(`${TagFrmwk}: Ringtone getVolume Promise: PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getVolume Promise: FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1000
         *@tc.name      : setVolume - Ringtone - Promise - MAX Volume
         *@tc.desc      : Setvol to 15
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1000', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, maxVol);
                let data = await audioManager.getVolume(audioRingtone);
                if (data == maxVol) {
                    console.info(`${TagFrmwk}: Ringtone getVolume Promise: PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getVolume Promise: FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info('err :' + err);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1100
         *@tc.name      : setVolume - Ringtone - Promise - Mute Volume
         *@tc.desc      : Setvol to 0
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1100', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, minVol);
                let data = await audioManager.getVolume(audioRingtone);
                if (data == minVol) {
                    console.info(`${TagFrmwk}: Ringtone getVolume Promise: PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getVolume Promise: FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info('err :' + err);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1200
         *@tc.name      : setVolume - Ringtone - Promise - Out of range Volume
         *@tc.desc      : Setvol to 30
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1200', 2, async function (done) {
            console.info(`${TagFrmwk}: Ringtone setVolume Promise: Out of range: Setvol 30`);
            await audioManager.setVolume(audioRingtone, outOfRangeVol).then(() => {
                console.info(`${TagFrmwk}: Ringtone setVolume Promise:Out of range: FAIL`);
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`${TagFrmwk}: Ringtone setVolume Promise:Out of range: PASS : ${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1300
         *@tc.name      : setVolume - Ringtone - Callback
         *@tc.desc      : Setvol to 7
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1300', 2, async function (done) {
            audioManager.setVolume(audioRingtone, highVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
                else {
                    console.info(`${TagFrmwk}: callback :  Ringtone setVolume successful `);
                    audioManager.getVolume(audioRingtone, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: callback : Ringtone: failed to get volume ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == highVol) {
                            console.info(`${TagFrmwk}: callback : Ringtone getVolume: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: callback : Ringtone getVolume: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1400
         *@tc.name      : setVolume - Ringtone - Callback - MAX Volume
         *@tc.desc      : Setvol to 15
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1400', 2, function (done) {
            audioManager.setVolume(audioRingtone, maxVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback :  Ringtone setVolume successful `);
                    audioManager.getVolume(audioRingtone, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: callback : Ringtone: failed to get volume ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == maxVol) {
                            console.info(`${TagFrmwk}: callback : Ringtone getVolume: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: callback : Ringtone getVolume: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1500
         *@tc.name      : setVolume - Ringtone - Callback - Mute Volume
         *@tc.desc      : Setvol to 0
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1500', 2, function (done) {
            audioManager.setVolume(audioRingtone, minVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback :  Ringtone setVolume successful `);
                    audioManager.getVolume(audioRingtone, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: callback : Ringtone: failed to get volume ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == minVol) {
                            console.info(`${TagFrmwk}: callback : Ringtone getVolume: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: callback : Ringtone getVolume: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1600
         *@tc.name      : setVolume - Ringtone - Callback - Out of range Volume
         *@tc.desc      : Setvol to 28 (more than max volume 15)
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1600', 2, function (done) {
            audioManager.setVolume(audioRingtone, outOfRangeVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Out of range Volume: Callback:  ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Out of range Volume: callback : Ringtone set volume: FAIL`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1700
         *@tc.name      : setVolume - Media - Promise - Negative Value
         *@tc.desc      : Setvol to -1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1700', 2, async function (done) {
            console.info(`${TagFrmwk}: Media setVolume promise: Negative Value -1`);
            await audioManager.setVolume(audioMedia, -1).then(() => {
                // Setting negative audio volume for error Scenario
                console.info(`${TagFrmwk}: Media setVolume Promise:Negative: FAIL`);
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`${TagFrmwk}: Media setVolume Promise:Negative: PASS :  ${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1800
         *@tc.name      : setVolume - Media - Callback - Negative Value
         *@tc.desc      : Setvol to -1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1800', 2, function (done) {
            audioManager.setVolume(audioMedia, -1, (err) => {
                // Setting negative audio volume for error Scenario
                if (err) {
                    console.error(`${TagFrmwk}: setVolume Callback: Negative: PASS: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: setVolume callback : Media Negative: FAIL`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1900
         *@tc.name      : setVolume - Ringtone - Promise - Negative Value
         *@tc.desc      : Setvol to -1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1900', 2, async function (done) {
            console.info(`${TagFrmwk}: Ringtone setVolume promise: Negative`);
            await audioManager.setVolume(audioRingtone, -1).then(() => {
                // Setting negative audio volume for error Scenario
                console.info(`${TagFrmwk}: Ringtone setVolume Promise:Negative: FAIL`);
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`${TagFrmwk}: Ringtone setVolume Promise:Negative: PASS : ${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2000
         *@tc.name      : setVolume - Ringtone - Callback - Negative Value
         *@tc.desc      : Setvol to -1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2000', 2, function (done) {
            audioManager.setVolume(audioRingtone, -1, (err) => {
                // Setting negative audio volume for error Scenario
                if (err) {
                    console.error(`${TagFrmwk}:Ringtone setVolume Callback:Negative: PASS : ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: setVolume: Negative: callback : Ringtone set volume: FAIL`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2100
         *@tc.name      : setVolume - Media - Promise - ENAME
         *@tc.desc      : Setvol to 5
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2100', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
                let data = await audioManager.getVolume(audio.AudioVolumeType.MEDIA);
                if (data == lowVol) {
                    console.info(`${TagFrmwk}: Media getVolume Promise: ENAME : PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getVolume Promise: ENAME : FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info('err :' + err);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2200
         *@tc.name      : setVolume - Media - Callback - ENAME
         *@tc.desc      : Setvol to 14
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2200', 2, function (done) {
            audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME :  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback : ENAME :  Media setVolume successful `);
                    audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: callback : Media: ENAME : Error ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == highVol) {
                            console.info(`${TagFrmwk}: callback : Media getVolume: ENAME : PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: callback : Media getVolume: ENAME : FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2300
         *@tc.name      : setVolume - Ringtone - Promise - ENAME
         *@tc.desc      : Setvol to 14
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2300', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
                let data = await audioManager.getVolume(audio.AudioVolumeType.RINGTONE);
                if (data == highVol) {
                    console.info(`${TagFrmwk}: RINGTONE getVolume Promise: ENAME : PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: RINGTONE getVolume Promise: ENAME : FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info('err :' + err);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2400
         *@tc.name      : setVolume - Ringtone - Callback - ENAME
         *@tc.desc      : Setvol to 5
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2400', 2, function (done) {
            audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME:  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback : ENAME:  Ringtone setVolume successful `);
                    audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: callback : Ringtone: ENAME: failed to get volume ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == lowVol) {
                            console.info(`${TagFrmwk}: callback : Ringtone getVolume: ENAME: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: callback : Ringtone getVolume: ENAME: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2500
         *@tc.name      : setVolume - Media - Promise - Change Ringtone vol
         *@tc.desc      : Setvol to 5
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2500', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
                await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, maxVol)
                let data = await audioManager.getVolume(audio.AudioVolumeType.MEDIA);
                if (data == lowVol) {
                    console.info(`${TagFrmwk}: Media getVolume Promise: ENAME : PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getVolume Promise: ENAME : FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2600
         *@tc.name      : setVolume - Media - Callback - Change Ringtone vol
         *@tc.desc      : Setvol to 14
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2600', 2, function (done) {
            audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume MEDIA: Callback: ENAME :  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback : ENAME :  Media setVolume successful `);
                    audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol, (err) => {
                        if (err) {
                            console.error(`${TagFrmwk}: failed to set volume RINGTONE: Callback: ENAME :  ${err.message}`);
                            expect(false).assertTrue();
                            done();
                        } else {
                            audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
                                if (err) {
                                    console.error(`${TagFrmwk}: callback : Media: ENAME : Error: ${err.message}`);
                                    expect(false).assertTrue();
                                } else if (value == highVol) {
                                    console.info(`${TagFrmwk}: callback : Media getVolume: ENAME : PASS :${value}`);
                                    expect(true).assertTrue();
                                } else {
                                    console.info(`${TagFrmwk}: callback : Media getVolume: ENAME : FAIL :${value}`);
                                    expect(false).assertTrue();
                                }
                                done();
                            });
                        }
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2700
         *@tc.name      : setVolume - Ringtone - Promise - Change Media vol
         *@tc.desc      : Setvol to 14
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2700', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
                console.info(`${TagFrmwk}: Ringtone setVolume promise: ENAME: successful`);
                await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
                let data = await audioManager.getVolume(audio.AudioVolumeType.RINGTONE);
                if (data == highVol) {
                    console.info(`${TagFrmwk}: Ringtone getVolume Promise: ENAME: PASS :${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getVolume Promise: ENAME: FAIL :${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info('err=' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2800
         *@tc.name      : setVolume - Ringtone - Callback - Change Media vol
         *@tc.desc      : Setvol to 5
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2800', 2, function (done) {
            audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME:  ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback : ENAME:  Ringtone setVolume successful `);
                    audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol, (err) => {
                        if (err) {
                            console.error(`${TagFrmwk}: failed to setVolume: Callback: ENAME:  ${err.message}`);
                            expect(false).assertTrue();
                            done();
                        } else {
                            audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
                                if (err) {
                                    console.error(`${TagFrmwk}: callback : Ringtone: ENAME: failed to get volume ${err.message}`);
                                    expect(false).assertTrue();
                                } else if (value == lowVol) {
                                    console.info(`${TagFrmwk}: callback : Ringtone getVolume: ENAME: PASS :${value}`);
                                    expect(true).assertTrue();
                                } else {
                                    console.info(`${TagFrmwk}: callback : Ringtone getVolume: ENAME: FAIL :${value}`);
                                    expect(false).assertTrue();
                                }
                                done();
                            });
                        }
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0100
         *@tc.name      : getMaxVolume - Media - Promise
         *@tc.desc      : getMaxVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0100', 1, async function (done) {
            const PROMISE = audioManager.getMaxVolume(audioMedia);
            PROMISE.then(function (data) {
                if (data == maxVol) {
                    console.info(`${TagFrmwk}: Media getMaxVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getMaxVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0200
         *@tc.name      : getMaxVolume - Media - Callback
         *@tc.desc      : getMaxVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0200', 1, function (done) {
            audioManager.getMaxVolume(audioMedia, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Media : failed to getMaxVolume ${err.message}`);
                    expect(false).assertTrue();
                } else if (value == maxVol) {
                    console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0300
         *@tc.name      : getMaxVolume - Ringtone - Promise
         *@tc.desc      : getMaxVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0300', 2, async function (done) {
            const PROMISE = audioManager.getMaxVolume(audioRingtone);
            PROMISE.then(function (data) {
                if (data == maxVol) {
                    console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0400
         *@tc.name      : getMaxVolume - Ringtone - Callback
         *@tc.desc      : getMaxVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0400', 2, async function (done) {
            await audioManager.getMaxVolume(audioRingtone, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Ringtone : failed to getMaxVolume ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else if (value == maxVol) {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : PASS:${value}`);
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                    done();
                }

            });
        })


        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0500
         *@tc.name      : getMaxVolume - Media - Promise - Change Ringtone Volume and check
         *@tc.desc      : getMaxVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0500', 2, async function (done) {
            audioManager.setVolume(audioRingtone, lowVol);
            const PROMISE = audioManager.getMaxVolume(audioMedia);
            PROMISE.then(function (data) {
                if (data == maxVol) {
                    console.info(`${TagFrmwk}: Media getMaxVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getMaxVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });;
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0600
         *@tc.name      : getMaxVolume - Ringtone - Promise - Change Media Volume and check
         *@tc.desc      : getMaxVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0600', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, lowVol);
                let data = await audioManager.getMaxVolume(audioRingtone);
                if (data == maxVol) {
                    console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0700
         *@tc.name      : getMaxVolume - Media - Callback- Change Ringtone Volume and check
         *@tc.desc      : getMaxVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0700', 2, async function (done) {
            await audioManager.setVolume(audioRingtone, lowVol);
            audioManager.getMaxVolume(audioMedia, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Media : failed to getMaxVolume ${err.message}`);
                    expect(false).assertTrue();
                } else if (value == maxVol) {
                    console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0800
         *@tc.name      : getMaxVolume - Ringtone - Callback - Callback- Change media Volume and check
         *@tc.desc      : getMaxVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0800', 2, async function (done) {
            await audioManager.setVolume(audioMedia, lowVol);
            audioManager.getMaxVolume(audioRingtone, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Ringtone : failed to getMaxVolume ${err.message}`);
                    expect(false).assertTrue();
                } else if (value == maxVol) {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0900
         *@tc.name      : getMaxVolume - Media - Promise - Change media Volume and check
         *@tc.desc      : getMaxVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0900', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, lowVol);
                let data = await audioManager.getMaxVolume(audioMedia);
                if (data == maxVol) {
                    console.info(`${TagFrmwk}: Media getMaxVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getMaxVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1000
         *@tc.name      : getMaxVolume - Ringtone - Promise - Change Ringtone Volume and check
         *@tc.desc      : getMaxVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1000', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, lowVol);
                let data = await audioManager.getMaxVolume(audioRingtone);
                if (data == maxVol) {
                    console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1100
         *@tc.name      : getMaxVolume - Media - Callback- Change media Volume and check
         *@tc.desc      : getMaxVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1100', 2, async function (done) {
            await audioManager.setVolume(audioMedia, highVol);
            audioManager.getMaxVolume(audioMedia, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Media : failed to getMaxVolume ${err.message}`);
                    expect(false).assertTrue();
                } else if (value == maxVol) {
                    console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1200
         *@tc.name      : getMaxVolume - Ringtone - Callback - Callback- Change ringtone Volume and check
         *@tc.desc      : getMaxVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1200', 2, async function (done) {
            await audioManager.setVolume(audioRingtone, highVol);
            audioManager.getMaxVolume(audioRingtone, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Ringtone : failed to getMaxVolume ${err.message}`);
                    expect(false).assertTrue();
                } else if (value == maxVol) {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0100
         *@tc.name      : getMinVolume - Media - Promise
         *@tc.desc      : getMinVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0100', 1, async function (done) {
            const PROMISE = audioManager.getMinVolume(audioMedia);
            PROMISE.then(function (data) {
                if (data == minVol) {
                    console.info(`${TagFrmwk}: Media getMinVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getMinVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0200
         *@tc.name      : getMinVolume - Media - Callback
         *@tc.desc      : getMinVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0200', 1, function (done) {
            audioManager.getMinVolume(audioMedia, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Media : failed to getMinVolume ${err.message}`);
                    expect().assertFail();
                } else if (value == minVol) {
                    console.info(`${TagFrmwk}: callback : Media:  getMinVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Media:  getMinVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0300
         *@tc.name      : getMinVolume - Ringtone - Promise
         *@tc.desc      : getMinVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0300', 2, async function (done) {
            const PROMISE = audioManager.getMinVolume(audioRingtone);
            PROMISE.then(function (data) {
                if (data == minVol) {
                    console.info(`${TagFrmwk}: Ringtone getMinVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getMinVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0400
         *@tc.name      : getMinVolume - Ringtone - Callback
         *@tc.desc      : getMinVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0400', 2, function (done) {
            audioManager.getMinVolume(audioRingtone, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Ringtone : failed to getMinVolume ${err.message}`);
                    expect().assertFail();
                } else if (value == minVol) {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0500
         *@tc.name      : getMinVolume - Media - Promise - Change Ringtone Volume and check
         *@tc.desc      : getMinVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0500', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, lowVol);
            } catch (err) {
                console.log('err :' + JSON.stringify(err))
                expect(false).assertTrue();
                return done();
            }
            const PROMISE = audioManager.getMinVolume(audioMedia);
            PROMISE.then(function (data) {
                if (data == minVol) {
                    console.info(`${TagFrmwk}: Media getMinVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getMinVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0600
         *@tc.name      : getMinVolume - Media - Callback - Change Ringtone Volume and check
         *@tc.desc      : getMinVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0600', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, lowVol);
            } catch (err) {
                console.log('err :' + JSON.stringify(err))
                expect(false).assertTrue();
                return done();
            }
            audioManager.getMinVolume(audioMedia, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Media : failed to getMinVolume ${err.message}`);
                    expect().assertFail();
                } else if (value == minVol) {
                    console.info(`${TagFrmwk}: callback : Media:  getMinVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Media:  getMinVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0700
         *@tc.name      : getMinVolume - Ringtone - Promise - Change Media Volume and check
         *@tc.desc      : getMinVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0700', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, highVol);
            } catch (err) {
                console.log('err :' + JSON.stringify(err))
                expect(false).assertTrue();
                return done();
            }
            const PROMISE = audioManager.getMinVolume(audioRingtone);
            PROMISE.then(function (data) {
                if (data == minVol) {
                    console.info(`${TagFrmwk}: Ringtone getMinVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Ringtone getMinVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0800
         *@tc.name      : getMinVolume - Ringtone - Callback - Change Media Volume and check
         *@tc.desc      : getMinVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0800', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, lowVol);
            } catch (err) {
                console.log('err :' + JSON.stringify(err))
                expect(false).assertTrue();
                return done();
            }
            audioManager.getMinVolume(audioRingtone, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Ringtone : failed to getMinVolume ${err.message}`);
                    expect().assertFail();
                } else if (value == minVol) {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0900
         *@tc.name      : getMinVolume - Media - Promise - Change Media Volume and check
         *@tc.desc      : getMinVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0900', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, lowVol);
            } catch (err) {
                console.log('err :' + JSON.stringify(err))
                expect(false).assertTrue();
                return done();
            }
            const PROMISE = audioManager.getMinVolume(audioMedia);
            PROMISE.then(function (data) {
                if (data == minVol) {
                    console.info(`${TagFrmwk}: Media getMinVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Media getMinVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1000
         *@tc.name      : getMinVolume - Media - Callback - Change Media Volume and check
         *@tc.desc      : getMinVolume for Media
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1000', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, highVol);
            } catch (err) {
                console.log('err :' + JSON.stringify(err))
                expect(false).assertTrue();
                return done();
            }
            audioManager.getMinVolume(audioMedia, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Media : failed to getMinVolume ${err.message}`);
                    expect().assertFail();
                } else if (value == minVol) {
                    console.info(`${TagFrmwk}: callback : Media:  getMinVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Media:  getMinVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1100
         *@tc.name      : getMinVolume - Ringtone - Promise - Change Ringtone Volume and check
         *@tc.desc      : getMinVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1100', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, lowVol);
            } catch (err) {
                console.log('err :' + JSON.stringify(err))
                expect(false).assertTrue();
                return done();
            }
            const PROMISE = audioManager.getMinVolume(audioRingtone)
            PROMISE.then(function (data) {
                if (data == minVol) {
                    console.info(`${TagFrmwk}: Ringtone getMinVolume promise : PASS:${data}`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Ringtone getMinVolume promise : FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1200
         *@tc.name      : getMinVolume - Ringtone - Callback - Change Ringtone Volume and check
         *@tc.desc      : getMinVolume for Ringtone
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1200', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, lowVol);
            } catch (err) {
                console.log('err :' + JSON.stringify(err))
                expect(false).assertTrue();
                return done();
            }
            audioManager.getMinVolume(audioRingtone, (err, value) => {
                if (err) {
                    console.error(`${TagFrmwk}: callback : Ringtone : failed to getMinVolume ${err.message}`);
                    expect().assertFail();
                }
                else if (value == minVol) {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : PASS:${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : FAIL: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0100
         *@tc.name      : getDevices - Output device - Promise
         *@tc.desc      : getDevices - Output device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0100', 1, async function (done) {
            const PROMISE = audioManager.getDevices(1);
            // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
            PROMISE.then(function (value) {
                console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0200
         *@tc.name      : getDevices - Input device - Promise
         *@tc.desc      : getDevices - Input device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0200', 1, async function (done) {
            const PROMISE = audioManager.getDevices(2);
            // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG
            PROMISE.then(function (value) {
                console.info(`${TagFrmwk}: Promise: getDevices INPUT_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0300
         *@tc.name      : getDevices - ALL device - Promise
         *@tc.desc      : getDevices - ALL device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0300', 2, async function (done) {
            const PROMISE = audioManager.getDevices(3);
            // Getting all devies connected 3 = ALL_DEVICES_FLAG
            PROMISE.then(function (value) {
                console.info(`${TagFrmwk}: Promise: getDevices ALL_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  PASS`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0400
         *@tc.name      : getDevices - Output device - Callback
         *@tc.desc      : getDevices - Output device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0400', 2, function (done) {
            audioManager.getDevices(1, (err, value) => {
                // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
                console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                } else {
                    console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);

                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0500
         *@tc.name      : getDevices - Input device - Callback
         *@tc.desc      : getDevices - Input device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0500', 2, function (done) {
            audioManager.getDevices(2, (err, value) => {
                // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG
                console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback: INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);
                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0600
         *@tc.name      : getDevices - ALL device - Callback
         *@tc.desc      : getDevices - ALL device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0600', 2, function (done) {
            audioManager.getDevices(3, (err, value) => {
                // Getting all devies connected 3 = ALL_DEVICES_FLAG
                console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);

                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0700
         *@tc.name      : getDevices - Output device - Promise - ENAME
         *@tc.desc      : getDevices - Output device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0700', 2, async function (done) {
            const PROMISE = audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG)
            PROMISE.then(function (value) {
                console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0800
         *@tc.name      : getDevices - Input device - Promise - ENAME
         *@tc.desc      : getDevices - Input device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0800', 2, async function (done) {
            const PROMISE = audioManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG);
            PROMISE.then(function (value) {
                console.info(`${TagFrmwk}: Promise: getDevices INPUT_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0900
         *@tc.name      : getDevices - ALL device - Promise - ENAME
         *@tc.desc      : getDevices - ALL device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0900', 2, async function (done) {
            const PROMISE = audioManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG);
            PROMISE.then(function (value) {
                console.info(`${TagFrmwk}: Promise: getDevices ALL_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  PASS`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1000
         *@tc.name      : getDevices - Output device - Callback - ENAME
         *@tc.desc      : getDevices - Output device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1000', 2, function (done) {
            audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG, (err, value) => {
                console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                } else {
                    console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);
                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1100
         *@tc.name      : getDevices - Input device - Callback - ENAME
         *@tc.desc      : getDevices - Input device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1100', 2, function (done) {
            audioManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG, (err, value) => {
                console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback: INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                } else {
                    console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);
                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1200
         *@tc.name      : getDevices - ALL device - Callback - ENAME
         *@tc.desc      : getDevices - ALL device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1200', 2, function (done) {
            audioManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG, (err, value) => {
                console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                } else {
                    console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);
                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0100
         *@tc.name      : setRingerMode - Normal Mode - Promise
         *@tc.desc      : setRingerMode - Set Ring more to Normal Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0100', 1, async function (done) {
            try {
                await audioManager.setRingerMode(2);
                let value = await audioManager.getRingerMode();
                if (value == 2) {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0200
         *@tc.name      : setRingerMode - Silent Mode - Promise
         *@tc.desc      : setRingerMode - Set Ring more to Silent Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0200', 1, async function (done) {
            try {
                await audioManager.setRingerMode(0);
                let value = await audioManager.getRingerMode();
                if (value == 0) {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_SILENT: PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0300
         *@tc.name      : setRingerMode - Vibration Mode - Promise
         *@tc.desc      : setRingerMode - Set Ring more to Vibration Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0300', 2, async function (done) {
            try {
                await audioManager.setRingerMode(1);
                let value = await audioManager.getRingerMode();
                if (value == 1) {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0400
         *@tc.name      : setRingerMode - Normal Mode - Callback
         *@tc.desc      : setRingerMode - Set Ring more to Normal Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0400', 2, function (done) {
            audioManager.setRingerMode(2, (err) => {
                // Setting Ringtone Mode to Normal ENUM 2 = RINGER_MODE_NORMAL
                console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL: Error: ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    audioManager.getRingerMode((err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : RINGER_MODE_NORMAL: Error: ${err.message}`);
                            expect().assertFail();
                        } else if (value == 2) {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0500
         *@tc.name      : setRingerMode - Silent Mode - Callback
         *@tc.desc      : setRingerMode - Set Ring more to Silent Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0500', 2, function (done) {
            audioManager.setRingerMode(0, (err) => {
                // Setting Ringtone Mode to Silent ENUM 0 = RINGER_MODE_SILENT
                console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT: Error: ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    audioManager.getRingerMode((err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : RINGER_MODE_SILENT: Error: ${err.message}`);
                            expect().assertFail();
                        }
                        if (value == 0) {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_SILENT: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0600
         *@tc.name      : setRingerMode - Vibration Mode - Callback
         *@tc.desc      : setRingerMode - Set Ring more to Vibration Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0600', 2, function (done) {
            audioManager.setRingerMode(1, (err) => {
                // Setting Ringtone Mode to Vibration ENUM 1 = RINGER_MODE_VIBRATE
                console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE: Error: ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    audioManager.getRingerMode((err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback :  RINGER_MODE_VIBRATE: Error: ${err.message}`);
                            expect().assertFail();
                        }
                        if (value == 1) {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0700
         *@tc.name      : setRingerMode - Normal Mode - Promise - ENAME
         *@tc.desc      : setRingerMode - Set Ring more to Normal Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0700', 2, async function (done) {
            try {
                await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL);
                let value = await audioManager.getRingerMode();
                if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0800
         *@tc.name      : setRingerMode - Silent Mode - Promise - ENAME
         *@tc.desc      : setRingerMode - Set Ring more to Silent Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0800', 2, async function (done) {
            try {
                await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT);
                let value = await audioManager.getRingerMode();
                if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_SILENT: PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0900
         *@tc.name      : setRingerMode - Vibration Mode - Promise - NAME
         *@tc.desc      : setRingerMode - Set Ring more to Vibration Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0900', 2, async function (done) {
            try {
                await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE);
                let value = await audioManager.getRingerMode();
                if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1000
         *@tc.name      : setRingerMode - Normal Mode - Callback - ENAME
         *@tc.desc      : setRingerMode - Set Ring more to Normal Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1000', 2, function (done) {
            audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL, (err) => {
                console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL: Error: ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    audioManager.getRingerMode((err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : RINGER_MODE_NORMAL: Error: ${err.message}`);
                            expect().assertFail();
                        } else if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1100
         *@tc.name      : setRingerMode - Silent Mode - Callback - ENAME
         *@tc.desc      : setRingerMode - Set Ring more to Silent Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1100', 2, function (done) {
            audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT, (err) => {
                console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT: Error: ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    audioManager.getRingerMode((err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : RINGER_MODE_SILENT: Error: ${err.message}`);
                            expect().assertFail();
                        }
                        if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_SILENT: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1200
         *@tc.name      : setRingerMode - Vibration Mode - Callback
         *@tc.desc      : setRingerMode - Set Ring more to Vibration Mode
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1200', 2, function (done) {
            audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE, (err, value) => {
                console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE: Error: ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    audioManager.getRingerMode((err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : RINGER_MODE_VIBRATE: Error: ${err.message}`);
                            expect().assertFail();
                        }
                        if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
          *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0100
          *@tc.name      : mute - Media - callback
          *@tc.desc      : mute - Media - callback - Disable mute
          *@tc.size      : MEDIUM
          *@tc.type      : Function
          *@tc.level     : Level 1
          */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0100', 1, async function (done) {
            await audioManager.setVolume(audioMedia, highVol);
            audioManager.mute(audioMedia, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
                audioManager.mute(audioMedia, false, (err) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        audioManager.getVolume(audioMedia, (err, value) => {
                            if (err) {
                                console.error(`Failed to obtain the volume. ${err.message}`);
                                expect(false).assertTrue();
                                done();
                            } else if (value == highVol) {
                                audioManager.isMute(audioMedia, (err, data) => {
                                    if (err) {
                                        console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                                        expect().assertFail();
                                    } else if (data == false) {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${data}`);
                                        expect(true).assertTrue();
                                    } else {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${data}`);
                                        expect(false).assertTrue();
                                    }
                                    done();
                                });
                            } else {
                                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                                expect(false).assertTrue();
                                done();
                            }
                        });
                    }
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0200
         *@tc.name      : mute - Media - Promise
         *@tc.desc      : mute - Media - Promise - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0200', 1, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, lowVol);
                await audioManager.mute(audioMedia, true)
                console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
                await audioManager.mute(audioMedia, false)
                console.log(`${TagFrmwk}: Set Stream Mute: Media: Promise: FALSE`);
                let value = await audioManager.getVolume(audioMedia)
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                let data = await audioManager.isMute(audioMedia)
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: FALSE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: FALSE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0300
         *@tc.name      : mute - Ringtone - callback
         *@tc.desc      : mute - Ringtone - callback - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0300', 2, async function (done) {
            await audioManager.setVolume(audioRingtone, highVol);
            audioManager.mute(audioRingtone, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
                audioManager.mute(audioRingtone, false, (err) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        audioManager.getVolume(audioRingtone, (err, value) => {
                            if (err) {
                                console.error(`Failed to obtain the volume. ${err.message}`);
                                expect(false).assertTrue();
                                done();
                            } else if (value == highVol) {
                                audioManager.isMute(audioRingtone, (err, data) => {
                                    if (err) {
                                        console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                                        expect().assertFail();
                                    } else if (data == false) {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${data}`);
                                        expect(true).assertTrue();
                                    } else {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${data}`);
                                        expect(false).assertTrue();
                                    }
                                    done();
                                });
                            } else {
                                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                                expect(false).assertTrue();
                                done();
                            }
                        });
                    }
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0400
         *@tc.name      : mute - Ringtone - Promise
         *@tc.desc      : mute - Ringtone - Promise - disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0400', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, lowVol);
                await audioManager.mute(audioRingtone, true);
                console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
                await audioManager.mute(audioRingtone, false);
                let value = await audioManager.getVolume(audioRingtone);
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                let data = await audioManager.isMute(audioRingtone);
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info('err:' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0500
         *@tc.name      : mute - Media - callback - ENAME
         *@tc.desc      : mute - Media - callback - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0500', 2, async function (done) {
            await audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
            audioManager.mute(audio.AudioVolumeType.MEDIA, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
                audioManager.mute(audio.AudioVolumeType.MEDIA, false, (err) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
                            if (err) {
                                console.error(`Failed to obtain the volume. ${err.message}`);
                                expect(false).assertTrue();
                                done();
                            } else if (value == highVol) {
                                audioManager.isMute(audio.AudioVolumeType.MEDIA, (err, data) => {
                                    if (err) {
                                        console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                                        expect().assertFail();
                                    } else if (data == false) {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${data}`);
                                        expect(true).assertTrue();
                                    } else {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${data}`);
                                        expect(false).assertTrue();
                                    }
                                    done();
                                });
                            }
                            else {
                                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                                expect(false).assertTrue();
                                done();
                            }
                        });
                    }
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0600
         *@tc.name      : mute - Media - Promise -  ENAME
         *@tc.desc      : mute - Media - Promise - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0600', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
                await audioManager.mute(audio.AudioVolumeType.MEDIA, true);
                console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
                await audioManager.mute(audio.AudioVolumeType.MEDIA, false);
                let value = await audioManager.getVolume(audio.AudioVolumeType.MEDIA);
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                let data = await audioManager.isMute(audio.AudioVolumeType.MEDIA);
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: FALSE: PASS:${data}`);
                    expect(true).assertTrue();
                }
            } catch (err) {
                console.info('err:' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0700
         *@tc.name      : mute - Ringtone - callback -  ENAME
         *@tc.desc      : mute - Ringtone - callback - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0700', 2, async function (done) {
            await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
            audioManager.mute(audio.AudioVolumeType.RINGTONE, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
                audioManager.mute(audio.AudioVolumeType.RINGTONE, false, (err) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
                            if (err) {
                                console.error(`Failed to obtain the volume. ${err.message}`);
                                expect(false).assertTrue();
                                done();
                            } else if (value == highVol) {
                                audioManager.isMute(audio.AudioVolumeType.RINGTONE, (err, data) => {
                                    if (err) {
                                        console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                                        expect().assertFail();
                                    } else if (data == false) {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${data}`);
                                        expect(true).assertTrue();
                                    } else {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${data}`);
                                        expect(false).assertTrue();
                                    }
                                    done();
                                });
                            } else {
                                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                                expect(false).assertTrue();
                                done();
                            }
                        });
                    }
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0800
         *@tc.name      : mute - RINGTONE - Promise - ENAME:
         *@tc.desc      : mute - RINGTONE - Promise - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0800', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol);
                await audioManager.mute(audio.AudioVolumeType.RINGTONE, true);
                console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
                await audioManager.mute(audio.AudioVolumeType.RINGTONE, false);
                let value = await audioManager.getVolume(audio.AudioVolumeType.RINGTONE);
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                let data = await audioManager.isMute(audio.AudioVolumeType.RINGTONE)
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: FALSE: PASS:${data}`);
                    expect(true).assertTrue();
                }
            } catch (err) {
                console.info('err:' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0900
         *@tc.name      : mute - VOICE_CALL - callback - ENAME
         *@tc.desc      : mute - VOICE_CALL - callback - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0900', 2, async function (done) {
            await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
            audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
                audioManager.mute(audio.AudioVolumeType.VOICE_CALL, false, (err) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Set Stream Mute: VOICE_CALL: Callback: Error :  ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
                            if (err) {
                                console.error(`Failed to obtain the volume. ${err.message}`);
                                expect(false).assertTrue();
                                done();
                            } else if (value == highVol) {
                                audioManager.isMute(audio.AudioVolumeType.VOICE_CALL, (err, data) => {
                                    if (err) {
                                        console.error(`${TagFrmwk}: Callback : FALSE: VOICE_CALL : failed to get Mute Status ${err.message}`);
                                        expect().assertFail();
                                    } else if (data == false) {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_CALL: FALSE: PASS: ${data}`);
                                        expect(true).assertTrue();
                                    } else {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_CALL: FALSE: FAIL: ${data}`);
                                        expect(false).assertTrue();
                                    }
                                    done();
                                });
                            } else {
                                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                                expect(false).assertTrue();
                                done();
                            }
                        });
                    }
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1000
         *@tc.name      : mute - VOICE_CALL - Promise -  ENAME
         *@tc.desc      : mute - VOICE_CALL - Promise - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1000', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
                await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true);
                console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
                await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, false);
                let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL);
                console.info("AudioFrameworkTest: value is " + value);
                if (value > 0) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_CALL);
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_CALL: FALSE: PASS:${data}`);
                    expect(true).assertTrue();
                }
            } catch (err) {
                console.info('err:' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1100
         *@tc.name      : mute - VOICE_ASSISTANT - callback - ENAME
         *@tc.desc      : mute - VOICE_ASSISTANT - callback - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1100', 2, async function (done) {
            await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
            audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
                audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, false, (err) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Set Stream Mute: VOICE_ASSISTANT: Callback: Error :  ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                    else {
                        audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
                            if (err) {
                                console.error(`Failed to obtain the volume. ${err.message}`);
                                expect(false).assertTrue();
                                done();
                            }
                            else if (value == highVol) {
                                audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT, (err, data) => {
                                    if (err) {
                                        console.error(`${TagFrmwk}: Callback : FALSE: VOICE_ASSISTANT : failed to get Mute Status ${err.message}`);
                                        expect().assertFail();
                                    } else if (data == false) {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_ASSISTANT: FALSE: PASS: ${data}`);
                                        expect(true).assertTrue();
                                    } else {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_ASSISTANT: FALSE: FAIL: ${data}`);
                                        expect(false).assertTrue();
                                    }
                                    done();
                                });
                            } else {
                                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                                expect(false).assertTrue();
                                done();
                            }
                        });
                    }
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1200
         *@tc.name      : mute - VOICE_ASSISTANT - Promise -  ENAME
         *@tc.desc      : mute - VOICE_ASSISTANT - Promise - Disable mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1200', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
                await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true);
                console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
                await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, false);
                let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT);
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_ASSISTANT: FALSE: PASS:${data}`);
                    expect(true).assertTrue();
                }
            } catch (err) {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1300
         *@tc.name      : mute - Media - Promise - SetVolume
         *@tc.desc      : mute - Media - Promise - Enable mute -SetVolume
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1300', 2, async function (done) {
            try {
                await audioManager.setVolume(audioMedia, highVol);
                await audioManager.mute(audioMedia, true);
                let value = await audioManager.getVolume(audioMedia);
                console.info("AudioFrameworkTest: value is " + value);
                if (value == 0) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                await audioManager.setVolume(audioMedia, lowVol);
                let data = await audioManager.isMute(audioMedia);
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: SetVolume: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: SetVolume: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1400
         *@tc.name      : mute - Media - callback - SetVolume
         *@tc.desc      : mute - Media - callback - Enable mute - SetVolume
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1400', 2, async function (done) {
            await audioManager.setVolume(audioMedia, lowVol);
            audioManager.mute(audioMedia, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Callback : SetVolume: Media : failed to set Mute Status ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${TagFrmwk}: Set Stream Mute: Media: Callback : TRUE`);
                    audioManager.getVolume(audioMedia, (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                            done();
                        } else if (value == 0) {
                            audioManager.setVolume(audioMedia, highVol, (err) => {
                                if (err) {
                                    console.error(`Failed to obtain the volume. ${err.message}`);
                                    expect(false).assertTrue();
                                    done();
                                    return;
                                }
                                audioManager.isMute(audioMedia, (err, data) => {
                                    if (err) {
                                        console.error(`${TagFrmwk}: Callback : SetVolume: Media : failed to get Mute Status ${err.message}`);
                                        expect().assertFail();
                                    }
                                    else if (data == false) {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: SetVolume: PASS: ${data}`);
                                        expect(true).assertTrue();
                                    }
                                    else {
                                        console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: SetVolume: FAIL: ${data}`);
                                        expect(false).assertTrue();
                                    }
                                    done();
                                });
                            });
                        } else {
                            console.info(`${TagFrmwk}: mute fail: value ${value}`);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1500
         *@tc.name      : mute - Ringtone - Promise - SetVolume
         *@tc.desc      : mute - Ringtone - Promise - Enable mute - SetVolume
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1500', 2, async function (done) {
            try {
                await audioManager.setVolume(audioRingtone, lowVol);
                await audioManager.mute(audioRingtone, true);
                console.log(`${TagFrmwk}: Set Stream Mute: Ringtone: Promise: SetVolume`);
                let value = await audioManager.getVolume(audioRingtone);
                console.info("AudioFrameworkTest: value is " + value);
                if (value == 0) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
                await audioManager.setVolume(audioRingtone, highVol);
                let data = await audioManager.isMute(audioRingtone);
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: SetVolume: PASS:${data}`);
                    expect(true).assertTrue();
                }
            } catch (err) {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1600
         *@tc.name      : mute - Ringtone - callback - SetVolume
         *@tc.desc      : mute - Ringtone - callback - Enable mute - SetVolume
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1600', 2, async function (done) {
            await audioManager.setVolume(audioRingtone, highVol);
            audioManager.mute(audioRingtone, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Callback : SetVolume: Ringtone : failed to set Mute Status ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${TagFrmwk}: Set Stream Mute: Ringtone: Callback : SetVolume`);
                    audioManager.getVolume(audioRingtone, async (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                            done();
                        } else if (value == 0) {
                            await audioManager.setVolume(audioRingtone, lowVol);
                            audioManager.isMute(audioRingtone, (err, data) => {
                                if (err) {
                                    console.error(`${TagFrmwk}: Callback : SetVolume: Ringtone : failed to get Mute Status ${err.message}`);
                                    expect().assertFail();
                                } else if (data == false) {
                                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Ringtone: SetVolume: PASS: ${data}`);
                                    expect(true).assertTrue();
                                } else {
                                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Ringtone: SetVolume: FAIL: ${data}`);
                                    expect(false).assertTrue();
                                }
                                done();
                            });
                        } else {
                            console.info(`${TagFrmwk}: mute fail: value ${value}`);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1700
         *@tc.name      : mute - VOICE_CALL - Promise - SetVolume
         *@tc.desc      : mute - VOICE_CALL - Promise - Enable mute -SetVolume
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1700', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
                await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true);
                let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL)
                console.info("AudioFrameworkTest: value is " + value);
                if (value == highVol) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
                let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_CALL);
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_CALL: SetVolume: PASS:${data}`);
                    expect(true).assertTrue();
                }
            } catch (err) {
                console.info('err:' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1800
         *@tc.name      : mute - VOICE_CALL - callback - SetVolume
         *@tc.desc      : mute - VOICE_CALL - callback - Enable mute - SetVolume
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1800', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
            } catch (err) {
                console.error(`setVolume : failed to set Mute Status ${err.message}`);
                expect().assertFail();
                done();
                return;
            }
            audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Callback : SetVolume: VOICE_CALL : failed to set Mute Status ${err.message}`);
                    expect().assertFail();
                    done();
                }
                else {
                    console.log(`${TagFrmwk}: Set Stream Mute: VOICE_CALL: Callback : SetVolume`);
                    audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL, async (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                            done();
                        } else if (value == highVol) {
                            try {
                                await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
                            } catch (err) {
                                console.error(`setVolume : failed to set Mute Status ${err.message}`);
                                expect().assertFail();
                                done();
                                return;
                            }
                            audioManager.isMute(audio.AudioVolumeType.VOICE_CALL, (err, data) => {
                                if (err) {
                                    console.error(`${TagFrmwk}: Callback : SetVolume: VOICE_CALL : failed to get Mute Status ${err.message}`);
                                    expect().assertFail();
                                } else if (data == false) {
                                    console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_CALL: SetVolume: PASS: ${data}`);
                                    expect(true).assertTrue();
                                } else {
                                    console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_CALL: SetVolume: FAIL: ${data}`);
                                    expect(false).assertTrue();
                                }
                                done();
                            });
                        } else {
                            console.info(`${TagFrmwk}: mute fail: value ${value}`);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }

            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1900
         *@tc.name      : mute - VOICE_ASSISTANT - Promise - SetVolume
         *@tc.desc      : mute - VOICE_ASSISTANT - Promise - Enable mute -SetVolume
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1900', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
                await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true);
                console.log(`${TagFrmwk}: Set Stream Mute: VOICE_ASSISTANT: Promise: TRUE`);
                let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
                console.info("AudioFrameworkTest: value is " + value);
                if (value == highVol) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
                let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT);
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_ASSISTANT: SetVolume: PASS:${data}`);
                    expect(true).assertTrue();
                }
            } catch (err) {
                console.info('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2000
         *@tc.name      : mute - VOICE_ASSISTANT - callback - SetVolume
         *@tc.desc      : mute - VOICE_ASSISTANT - callback - Enable mute - SetVolume
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2000', 2, async function (done) {
            try {
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
            } catch (err) {
                console.log('setVolume err :' + JSON.stringify(err));
                expect().assertFail();
                done();
                return;
            }
            audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true, async (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Callback : SetVolume: VOICE_ASSISTANT : failed to set Mute Status ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${TagFrmwk}: Set Stream Mute: VOICE_ASSISTANT: Callback : SetVolume`);
                    try {
                        let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
                        if (value == highVol) {
                            console.info("AudioFrameworkTest: value is " + value);
                            expect(true).assertTrue();
                        } else {
                            expect(false).assertTrue();
                        }
                        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
                    } catch (err) {
                        console.log('err :' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                        return;
                    }
                    audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT, (err, data) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : SetVolume: VOICE_ASSISTANT : failed to get Mute Status ${err.message}`);
                            expect().assertFail();
                        } else if (data == false) {
                            console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_ASSISTANT: SetVolume: PASS: ${data}`);
                            expect(true).assertTrue();
                        } else {
                            console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_ASSISTANT: SetVolume: FAIL: ${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0100
         *@tc.name      : isActive - Media - Promise
         *@tc.desc      : isActive - Media - Promise - When stream is NOT playing
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0100', 1, async function (done) {
            console.log(`${TagFrmwk}: Promise : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
            const PROMISE = audioManager.isActive(audioMedia);
            PROMISE.then(function (data) {
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.log('err :' + JSON.stringify(err));
                expect().assertFail();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0200
         *@tc.name      : isActive - Media - Callback
         *@tc.desc      : isActive - Media - Callback - When stream is NOT playing
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0200', 1, function (done) {
            console.log(`${TagFrmwk}: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
            audioManager.isActive(audioMedia, (err, data) => {
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
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0300
         *@tc.name      : isActive - Ringtone - Promise
         *@tc.desc      : isActive - Ringtone - Promise - When stream is NOT playing
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0300', 2, async function (done) {
            console.log(`${TagFrmwk}: Promise : isActive Ringtone: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
            const PROMISE = audioManager.isActive(audioRingtone);
            PROMISE.then(function (data) {
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: isActive: Ringtone: TRUE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Promise: isActive: Ringtone: TRUE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.log('err :' + JSON.stringify(err));
                expect().assertFail();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0400
         *@tc.name      : isActive - Ringtone - Callback
         *@tc.desc      : isActive - Ringtone - Callback - When stream is NOT playing
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0400', 2, function (done) {
            console.log(`${TagFrmwk}: Callback : isActive Ringtone: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
            audioManager.isActive(audioRingtone, (err, data) => {
                if (err) {
                    console.error(`${TagFrmwk}: Callback : Ringtone : isActive: failed  ${err.message}`);
                    expect().assertFail();
                } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback: isActive: Ringtone: TRUE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Callback: isActive: Ringtone: TRUE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0500
         *@tc.name      : isActive - Media - Promise - ENAME:
         *@tc.desc      : isActive - Media - Promise - When stream is NOT playing
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0500', 2, async function (done) {
            console.log(`${TagFrmwk}: Promise : isActive Media: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
            const PROMISE = audioManager.isActive(audio.AudioVolumeType.MEDIA);
            PROMISE.then(function (data) {
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: isActive: Media: ENAME: TRUE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Promise: isActive: Media: ENAME: TRUE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.log('err :' + JSON.stringify(err));
                expect().assertFail();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0600
         *@tc.name      : isActive - Media - Callback -  ENAME
         *@tc.desc      : isActive - Media - Callback - When stream is NOT playing
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0600', 2, function (done) {
            audioManager.isActive(audio.AudioVolumeType.MEDIA, (err, data) => {
                if (err) {
                    console.error(`${TagFrmwk}: Callback : Media : ENAME: isActive: failed  ${err.message}`);
                    expect().assertFail();
                } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback: isActive: Media: ENAME: TRUE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Callback: isActive: Media: ENAME: TRUE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0700
         *@tc.name      : isActive - Ringtone - Promise - ENAME
         *@tc.desc      : isActive - Ringtone - Promise - When stream is NOT playing
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0700', 2, async function (done) {
            console.log(`${TagFrmwk}: Promise : isActive Ringtone: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
            const PROMISE = audioManager.isActive(audio.AudioVolumeType.RINGTONE);
            PROMISE.then(function (data) {
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: isActive: Ringtone: ENAME: TRUE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Promise: isActive: Ringtone: ENAME: TRUE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            }).catch(err => {
                console.log('err :' + JSON.stringify(err));
                expect().assertFail();
            });
            await PROMISE;
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0800
         *@tc.name      : isActive - Ringtone - Callback - ENAME
         *@tc.desc      : isActive - Ringtone - Callback - When stream is NOT playing
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0800', 2, function (done) {
            console.log(`${TagFrmwk}: Callback : isActive Ringtone: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
            audioManager.isActive(audio.AudioVolumeType.RINGTONE, (err, data) => {
                if (err) {
                    console.error(`${TagFrmwk}: Callback : Ringtone : ENAME: isActive: failed  ${err.message}`);
                    expect().assertFail();
                } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0100
         *@tc.name      : setMicrophoneMute - true - Promise
         *@tc.desc      : Enable mic mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0100', 1, async function (done) {
            try {
                await audioManager.setMicrophoneMute(true);
                let data = await audioManager.isMicrophoneMute();
                if (data == true) {
                    console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0200
         *@tc.name      : setMicrophoneMute - false - Promise
         *@tc.desc      : Disable mic mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0200', 1, async function (done) {
            try {
                await audioManager.setMicrophoneMute(false);
                let data = await audioManager.isMicrophoneMute();
                if (data == false) {
                    console.log(`${TagFrmwk}: Promise: isMicrophoneMute: FALSE: PASS:${data}`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwk}: Promise: isMicrophoneMute: FALSE: FAIL: ${data}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.info(`Error :${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0300
         *@tc.name      : setMicrophoneMute - true - Callback
         *@tc.desc      : Enable mic mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0300', 1, function (done) {
            audioManager.setMicrophoneMute(true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: setMicrophoneMute: Callback : TRUE: Error : ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
                else {
                    console.log(`${TagFrmwk}: setMicrophoneMute: Callback : TRUE`);
                    audioManager.isMicrophoneMute((err, data) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : TRUE: isMicrophoneMute : Error ${err.message}`);
                            expect(false).assertTrue();
                        } else if (data == true) {
                            console.log(`${TagFrmwk}: Callback : isMicrophoneMute: TRUE: PASS: ${data}`);
                            expect(true).assertTrue();
                        } else {
                            console.log(`${TagFrmwk}: Callback : isMicrophoneMute: TRUE: FAIL: ${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0400
         *@tc.name      : setMicrophoneMute - false - Callback
         *@tc.desc      : Disable mic mute
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0400', 1, function (done) {
            audioManager.setMicrophoneMute(false, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: setMicrophoneMute: Callback : FALSE: Error : ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
                else {
                    console.log(`${TagFrmwk}: setMicrophoneMute: Callback : FALSE`);
                    audioManager.isMicrophoneMute((err, data) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : FALSE: isMicrophoneMute : Error ${err.message}`);
                            expect(false).assertTrue();
                        } else if (data == false) {
                            console.log(`${TagFrmwk}: Callback : isMicrophoneMute: FALSE: PASS: ${data}`);
                            expect(true).assertTrue();
                        } else {
                            console.log(`${TagFrmwk}: Callback : isMicrophoneMute: FALSE: FAIL: ${data}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100
         *@tc.name      : setDeviceActive - SPEAKER - deactivate - Promise
         *@tc.desc      : Deactivate speaker - Promise
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100', 1, async function (done) {
            try {
                let flag = null;
                let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
                console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
                if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
                    flag = true;
                }
                if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE && outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
                    flag = false;
                }
                await audioManager.setDeviceActive(2, false).then(() => {
                    console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 Promise returned to indicate that the device is set to the active status.`);
                });
                await audioManager.isDeviceActive(audio.ActiveDeviceType.SPEAKER).then(function (value) {
                    console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : value is ${flag}`);
                    if (flag == true && value == true) {
                        console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
                        expect(true).assertTrue();
                    }
                    else if (flag == false && value == true) {
                        console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
                        expect(false).assertTrue();
                    }
                }).catch((err) => {
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
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0200
         *@tc.name      : setDeviceActive - SPEAKER - Activate - Promise
         *@tc.desc      : Activate speaker - Promise
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0200', 1, async function (done) {
            try {
                await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true);
                let value = await audioManager.isDeviceActive(2);
                if (value == true) {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })


        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300
         *@tc.name      : setDeviceActive - SPEAKER - deactivate - Callback
         *@tc.desc      : Deactivate speaker - Callback
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300', 2, async function (done) {
            let flag = null;
            let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG)
            console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
            if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
                flag = true;
            }
            if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE && outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
                flag = false;
            }

            await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, false, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
                    audioManager.isDeviceActive(2, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == true && flag == true) {
                            console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
                            expect(true).assertTrue();
                        } else if (value == true && flag == false) {
                            console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
                            expect(true).assertTrue();
                        }
                        else {
                            console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300 ${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : FAIL :${value} flag is ${flag}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0400
         *@tc.name      : setDeviceActive - SPEAKER - deactivate - Callback
         *@tc.desc      : Activate speaker - Callback
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0400', 2, function (done) {
            audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true, (err) => {
                if (err) {
                    console.error(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active: Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
                else {
                    console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
                    audioManager.isDeviceActive(2, (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active: Error: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == true) {
                            console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active : PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active : FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })


        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0100
         *@tc.name      : setAudioParameter - Promise - Character & Number
         *@tc.desc      : setAudioParameter - Promise - Character & Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0100', 1, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '8 bit');
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == '8 bit') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: Bits per sample : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : Bits per sample : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0200
         *@tc.name      : setAudioParameter - Promise - Number
         *@tc.desc      : setAudioParameter - Promise - Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0200', 1, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '4800');
                console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == '4800') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0300
         *@tc.name      : setAudioParameter - Promise - Long Number
         *@tc.desc      : setAudioParameter - Promise - Long Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0300', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue);
                console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == longValue) {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0400
         *@tc.name      : setAudioParameter - Promise - Decimal
         *@tc.desc      : setAudioParameter - Promise - Decimal
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0400', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10.000000234324324324');
                console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == '10.000000234324324324') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0500
         *@tc.name      : setAudioParameter - Promise - Parameter name Number
         *@tc.desc      : setAudioParameter - Promise - Parameter name Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0500', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'PPNumber');
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == 'PPNumber') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0600
         *@tc.name      : setAudioParameter - Promise - Special Characters
         *@tc.desc      : setAudioParameter - Promise - Special Characters
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0600', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '[]\:"<>?,./~!@#$%^*()_+-={}|');
                console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == '[]\:"<>?,./~!@#$%^*()_+-={}|') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0700
         *@tc.name      : setAudioParameter - Callback - Character & Number
         *@tc.desc      : setAudioParameter - Callback - Character & Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0700', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', '16 bit', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                            expect(false).assertTrue();
                        }
                        else if (value == '16 bit') {
                            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                            expect(true).assertTrue();
                        }
                        else {
                            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0800
         *@tc.name      : setAudioParameter - Callback - Special Character
         *@tc.desc      : setAudioParameter - Callback - Special Character
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0800', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', '~!@#$%^*()_+-={}|[]\:"<>?,./', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : getAudioParam: VOICE_PHONE_STATUS: Error: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == '~!@#$%^*()_+-={}|[]\:"<>?,./') {
                            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0900
         *@tc.name      : setAudioParameter - Callback - Decimal
         *@tc.desc      : setAudioParameter - Callback - Decimal
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0900', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10000.21321432432432', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback :getAudioParm: VOICE_PHONE_STATUS:Error: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == '10000.21321432432432') {
                            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1000
         *@tc.name      : setAudioParameter - Callback - Number
         *@tc.desc      : setAudioParameter - Callback - Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1000', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', '5454', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                        if (err) {
                            console.error(`${TagFrmwk}: Callback : getAudioParam: VOICE_PHONE_STATUS: Error: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value == '5454') {
                            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1100
         *@tc.name      : setAudioParameter - Callback - Long Number
         *@tc.desc      : setAudioParameter - Callback - Long Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1100', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue, (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value == longValue) {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1200
         *@tc.name      : setAudioParameter - Callback - Parameter name Number
         *@tc.desc      : setAudioParameter - Callback - Parameter name Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1200', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'xyza', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value == 'xyza') {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0100
         *@tc.name      : getAudioParameter - Promise - Character & Number
         *@tc.desc      : getAudioParameter - Promise - Character & Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0100', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '8 bit');
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == '8 bit') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0200
         *@tc.name      : getAudioParameter - Promise - Number
         *@tc.desc      : getAudioParameter - Promise - Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0200', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '4800');
                console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == '4800') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0300
         *@tc.name      : getAudioParameter - Promise - Long Number
         *@tc.desc      : getAudioParameter - Promise - Long Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0300', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue);
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == longValue) {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0400
         *@tc.name      : getAudioParameter - Promise - Decimal
         *@tc.desc      : getAudioParameter - Promise - Decimal
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0400', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10.0000000000234');
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == '10.0000000000234') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0500
         *@tc.name      : getAudioParameter - Promise - Parameter name Number
         *@tc.desc      : getAudioParameter - Promise - Parameter name Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0500', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'PPNumber');
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == 'PPNumber') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0600
         *@tc.name      : getAudioParameter - Promise - Special Characters
         *@tc.desc      : getAudioParameter - Promise - Special Characters 
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0600', 2, async function (done) {
            try {
                await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '[]\:"<>?,./~!@#$%^*()_+-={}|');
                console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
                let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
                if (value == '[]\:"<>?,./~!@#$%^*()_+-={}|') {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log('err :' + JSON.stringify(err));
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0700
         *@tc.name      : getAudioParameter - Callback - Character & Number 
         *@tc.desc      : getAudioParameter - Callback - Character & Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0700', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', '16 bit', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value == '16 bit') {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0800
         *@tc.name      : getAudioParameter - Callback - Special Character ~!@#$%^*()_+-={}|[]\:";<>?,./
         *@tc.desc      : getAudioParameter - Callback - Special Character
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0800', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', '~!@#$%^*()_+-={}|[]\:"<>?,./', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value == '~!@#$%^*()_+-={}|[]\:"<>?,./') {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0900
         *@tc.name      : getAudioParameter - Callback - Decimal
         *@tc.desc      : getAudioParameter - Callback - Decimal 10000.21321432432432
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0900', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10000.21321432432432', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value == '10000.21321432432432') {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1000
         *@tc.name      : getAudioParameter - Callback - Number 5454
         *@tc.desc      : getAudioParameter - Callback - Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1000', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', '5454', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value == '5454') {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1100
         *@tc.name      : getAudioParameter - Callback - Long Number longValue
         *@tc.desc      : getAudioParameter - Callback - Long Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1100', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue, (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value == longValue) {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            });
        })


        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1200
         *@tc.name      : getAudioParameter - Callback - Parameter name Number
         *@tc.desc      : getAudioParameter - Callback - Parameter name Number
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */

        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1200', 2, function (done) {
            audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'xyza', (err) => {
                console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value == 'xyza') {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0100
         *@tc.name      : InterruptType - INTERRUPT_TYPE_BEGIN
         *@tc.desc      : InterruptType - INTERRUPT_TYPE_BEGIN
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0100', 2, async function (done) {
            expect(audio.InterruptType.INTERRUPT_TYPE_BEGIN).assertEqual(1);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0200
         *@tc.name      : InterruptType - INTERRUPT_TYPE_END
         *@tc.desc      : InterruptType - INTERRUPT_TYPE_END
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0200', 2, async function (done) {
            expect(audio.InterruptType.INTERRUPT_TYPE_END).assertEqual(2);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0300
         *@tc.name      : InterruptHint - INTERRUPT_HINT_NONE
         *@tc.desc      : InterruptHint - INTERRUPT_HINT_NONE
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0300', 2, async function (done) {
            expect(audio.InterruptHint.INTERRUPT_HINT_NONE).assertEqual(0);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0400
         *@tc.name      : InterruptHint - INTERRUPT_HINT_RESUME
         *@tc.desc      : InterruptHint - INTERRUPT_HINT_RESUME
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0400', 2, async function (done) {
            expect(audio.InterruptHint.INTERRUPT_HINT_RESUME).assertEqual(1);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0500
         *@tc.name      : InterruptHint - INTERRUPT_HINT_PAUSE
         *@tc.desc      : InterruptHint - INTERRUPT_HINT_PAUSE
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0500', 2, async function (done) {
            expect(audio.InterruptHint.INTERRUPT_HINT_PAUSE).assertEqual(2);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0600
         *@tc.name      : InterruptHint - INTERRUPT_HINT_STOP
         *@tc.desc      : InterruptHint - INTERRUPT_HINT_STOP
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0600', 2, async function (done) {
            expect(audio.InterruptHint.INTERRUPT_HINT_STOP).assertEqual(3);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0700
         *@tc.name      : InterruptHint - INTERRUPT_HINT_DUCK
         *@tc.desc      : InterruptHint - INTERRUPT_HINT_DUCK
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0700', 2, async function (done) {
            expect(audio.InterruptHint.INTERRUPT_HINT_DUCK).assertEqual(4);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0800
         *@tc.name      : InterruptHint - INTERRUPT_HINT_UNDUCK
         *@tc.desc      : InterruptHint - INTERRUPT_HINT_UNDUCK
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0800', 2, async function (done) {
            expect(audio.InterruptHint.INTERRUPT_HINT_UNDUCK).assertEqual(5);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0900
         *@tc.name      : InterruptForceType - INTERRUPT_FORCE
         *@tc.desc      : InterruptForceType - INTERRUPT_FORCE
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0900', 2, async function (done) {
            expect(audio.InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1000
         *@tc.name      : InterruptForceType - INTERRUPT_SHARE
         *@tc.desc      : InterruptForceType - INTERRUPT_SHARE
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1000', 2, async function (done) {
            expect(audio.InterruptForceType.INTERRUPT_SHARE).assertEqual(1);
            await sleep(50);
            done();
        })

        /**
          *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1100
          *@tc.name      : ActiveDeviceType - BLUETOOTH_SCO
          *@tc.desc      : ActiveDeviceType - BLUETOOTH_SCO
          *@tc.size      : MEDIUM
          *@tc.type      : Function
          *@tc.level     : Level 2
          */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1100', 2, async function (done) {
            expect(audio.ActiveDeviceType.BLUETOOTH_SCO).assertEqual(7);
            await sleep(50);
            done();
        })

        /**
           *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1200
           *@tc.name      : ActiveDeviceType - SPEAKER
           *@tc.desc      : ActiveDeviceType - SPEAKER
           *@tc.size      : MEDIUM
           *@tc.type      : Function
           *@tc.level     : Level 2
           */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1200', 2, async function (done) {
            expect(audio.ActiveDeviceType.SPEAKER).assertEqual(2);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0100
         *@tc.name      : InterruptActionType - TYPE_ACTIVATED 
         *@tc.desc      : InterruptActionType - TYPE_ACTIVATED 
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0100', 2, async function (done) {
            expect(audio.InterruptActionType.TYPE_ACTIVATED).assertEqual(0);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0200
         *@tc.name      : InterruptActionType - TYPE_INTERRUPT
         *@tc.desc      : InterruptActionType - TYPE_INTERRUPT
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0200', 2, async function (done) {
            expect(audio.InterruptActionType.TYPE_INTERRUPT).assertEqual(1);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICETYPE_0100
         *@tc.name      : DeviceType - ALL Device Type
         *@tc.desc      : DeviceType - ALL Device Type
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICETYPE_0100', 2, async function (done) {
            expect(audio.DeviceType.INVALID).assertEqual(0);
            console.info("audio.DeviceType.INVALID:" + audio.DeviceType.INVALID);
            expect(audio.DeviceType.EARPIECE).assertEqual(1);
            console.info("audio.DeviceType.EARPIECE:" + audio.DeviceType.EARPIECE);
            expect(audio.DeviceType.SPEAKER).assertEqual(2);
            console.info("audio.DeviceType.SPEAKER:" + audio.DeviceType.SPEAKER);
            expect(audio.DeviceType.WIRED_HEADSET).assertEqual(3);
            console.info("audio.DeviceType.WIRED_HEADSET:" + audio.DeviceType.WIRED_HEADSET);
            expect(audio.DeviceType.WIRED_HEADPHONES).assertEqual(4);
            console.info("audio.DeviceType.WIRED_HEADPHONES:" + audio.DeviceType.WIRED_HEADPHONES);
            expect(audio.DeviceType.BLUETOOTH_SCO).assertEqual(7);
            console.info("audio.DeviceType.BLUETOOTH_SCO:" + audio.DeviceType.BLUETOOTH_SCO);
            expect(audio.DeviceType.BLUETOOTH_A2DP).assertEqual(8);
            console.info("audio.DeviceType.BLUETOOTH_A2DP:" + audio.DeviceType.BLUETOOTH_A2DP);
            expect(audio.DeviceType.MIC).assertEqual(15);
            console.info("audio.DeviceType.MIC:" + audio.DeviceType.MIC);
            expect(audio.DeviceType.USB_HEADSET).assertEqual(22);
            console.info("audio.DeviceType.USB_HEADSET:" + audio.DeviceType.USB_HEADSET);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICEROLE_0100
         *@tc.name      : DeviceRole - ALL Device Role
         *@tc.desc      : DeviceRole - ALL Device Role
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICEROLE_0100', 2, async function (done) {
            expect(audio.DeviceRole.INPUT_DEVICE).assertEqual(1);
            console.info("audio.DeviceRole.INPUT_DEVICE :" + audio.DeviceRole.INPUT_DEVICE);
            expect(audio.DeviceRole.OUTPUT_DEVICE).assertEqual(2);
            console.info("audio.DeviceRole.OUTPUT_DEVICE :" + audio.DeviceRole.OUTPUT_DEVICE);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0100
         *@tc.name      : getDevices - Output device - Callback
         *@tc.desc      : getDevices - Output device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0100', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            AudioRoutingManager.getDevices(1, (err, value) => {
                // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
                console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}:Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);

                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                        cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0200
         *@tc.name      : getDevices - Input device - Callback
         *@tc.desc      : getDevices - Input device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0200', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            AudioRoutingManager.getDevices(2, (err, value) => {
                // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG
                console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}:Callback:INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);
                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null
                        && cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0300
         *@tc.name      : getDevices - ALL device - Callback
         *@tc.desc      : getDevices - ALL device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0300', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            AudioRoutingManager.getDevices(3, (err, value) => {
                // Getting all devies connected 3 = ALL_DEVICES_FLAG
                console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}:Callback:ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                } else {
                    console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);

                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                        cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0400
         *@tc.name      : getDevices - Output device - Callback - ENAME
         *@tc.desc      : getDevices - Output device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0400', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG, (err, value) => {
                console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}:Callback:OUTPUT_DEVICES_FLAG:failed to get devices ${err.message}`);
                    expect().assertFail();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);
                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                        cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0500
         *@tc.name      : getDevices - Input device - Callback - ENAME
         *@tc.desc      : getDevices - Input device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0500', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            AudioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG, (err, value) => {
                console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}:Callback:INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                } else {
                    console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);
                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                        cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0600
         *@tc.name      : getDevices - ALL device - Callback - ENAME
         *@tc.desc      : getDevices - ALL device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0600', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            AudioRoutingManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG, (err, value) => {
                console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                if (err) {
                    console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                    expect().assertFail();
                } else {
                    console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                    value.forEach(displayDeviceProp);
                    if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                        cMask != null) {
                        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
                        expect(false).assertTrue();
                    }
                }
                done();
            });
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0700
         *@tc.name      : getDevices - OUTPUT device - Promise - ENAME
         *@tc.desc      : getDevices - OUTPUT device
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0700', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            let value = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
            console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
            value.forEach(displayDeviceProp);
            if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                cMask != null) {
                console.info(`${TagFrmwk}: Promise: getDevices:OUTPUT_DEVICES_FLAG : PASS`);
                expect(true).assertTrue();
            } else {
                console.info(`${TagFrmwk}: Promise: getDevices:OUTPUT_DEVICES_FLAG : FAIL`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_DEVICEFALG_0100
         *@tc.name      : NONE_DEVICES_FLAG
         *@tc.desc      : NONE_DEVICES_FLAG
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_DEVICEFALG_0100', 2, async function (done) {
            expect(audio.DeviceFlag.OUTPUT_DEVICES_FLAG).assertEqual(1);
            expect(audio.DeviceFlag.INPUT_DEVICES_FLAG).assertEqual(2);
            expect(audio.DeviceFlag.ALL_DEVICES_FLAG).assertEqual(3);
            await sleep(50);
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_SAMPLE_FORMAT_F32LE_0100
         *@tc.name      : SAMPLE_FORMAT_F32LE
         *@tc.desc      : SAMPLE_FORMAT_F32LE
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_SAMPLE_FORMAT_F32LE_0100', 2, async function (done) {
            expect(audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE).assertEqual(4);
            await sleep(50);
            done();
        })

        /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0100
        *@tc.name      : getDevices - OUTPUT device - getDevicesSync - ENAME
        *@tc.desc      : getDevices - OUTPUT device - getDevicesSync
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0100', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            let value = AudioRoutingManager.getDevicesSync(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
            console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
            value.forEach(displayDeviceProp);
            if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                cMask != null) {
                console.info(`${TagFrmwk}: Promise: getDevices:OUTPUT_DEVICES_FLAG : PASS`);
                expect(true).assertTrue();
            } else {
                console.info(`${TagFrmwk}: Promise: getDevices:OUTPUT_DEVICES_FLAG : FAIL`);
                expect(false).assertTrue();
            }
            done();
        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0200
         *@tc.name      : getDevicesSync - ErrorCode - Null-Parameters - 401
         *@tc.desc      : getDevicesSync - ErrorCode - Null-Parameters - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0200', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            try {
                let value = AudioRoutingManager.getDevicesSync();
                console.info(`${TagFrmwk}: getDevicesSync Success,value: ${value}`);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${TagFrmwk}: getDevicesSync Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
                expect(Number(error.code)).assertEqual(401);
                done();
            }
        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0300
         *@tc.name      : getDevicesSync - ErrorCode - Number-Parameters - 6800101
         *@tc.desc      : getDevicesSync - ErrorCode - Number-Parameters - 6800101
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0200', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            try {
                let value = AudioRoutingManager.getDevicesSync(123);
                console.info(`${TagFrmwk}: getDevicesSync Success,value: ${value}`);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${TagFrmwk}: getDevicesSync Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
                expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
                done();
            }
        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0400
         *@tc.name      : getDevicesSync - ErrorCode - String-Parameters - 401
         *@tc.desc      : getDevicesSync - ErrorCode - String-Parameters - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0200', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            try {
                let value = AudioRoutingManager.getDevicesSync('123');
                console.info(`${TagFrmwk}: getDevicesSync Success,value: ${value}`);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${TagFrmwk}: getDevicesSync Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
                expect(Number(error.code)).assertEqual(401);
                done();
            }
        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0100
         *@tc.name      : on_DeviceChange - ErrorCode - Null-Parameters - 401
         *@tc.desc      : on_DeviceChange - ErrorCode - Null-Parameters - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0100', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            try {
                AudioRoutingManager.on('deviceChange', null, (deviceChanged) => {
                    console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
                    console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
                    console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
                    console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
                expect(Number(error.code)).assertEqual(401);
                done();
            }
        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0200
         *@tc.name      : on_DeviceChange - ErrorCode - Number-Parameters - 401
         *@tc.desc      : on_DeviceChange - ErrorCode - Number-Parameters - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0200', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            try {
                AudioRoutingManager.on('deviceChange', 123, (deviceChanged) => {
                    console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
                    console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
                    console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
                    console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
                expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
                done();
            }
        })
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0300
         *@tc.name      : on_DeviceChange - ErrorCode - String-Parameters - 401
         *@tc.desc      : getDevicesSync - ErrorCode - String-Parameters - 401
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0300', 2, async function (done) {
            let AudioRoutingManager = audioManager.getRoutingManager();
            try {
                AudioRoutingManager.on('deviceChange', '123', (deviceChanged) => {
                    console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
                    console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
                    console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
                    console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
                expect(Number(error.code)).assertEqual(401);
                done();
            }
        })
    })
}
