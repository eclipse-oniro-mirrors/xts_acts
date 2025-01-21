/*
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

import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect
} from '@ohos/hypium';

export default function getAudioSceneApi12() {
    describe('getAudioSceneApi12', function () {
        let TagFrmwk = "getAudioSceneApi12";
        let AUDIO_SCENE_RINGING = 1; //响铃模式。
        let AUDIO_SCENE_PHONE_CALL = 2; //电话模式。
        let audioManager = null;
        async function getAudioManager() {
            audioManager = await audio.getAudioManager();
            if (audioManager != null) {
                console.info(`${TagFrmwk}: getAudioManger : PASS`);
            } else {
                console.info(`${TagFrmwk}: getAudioManger : FAIL`);
            }
        }

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(async function () {
            console.info(`${TagFrmwk}: beforeAll: Prerequisites at the test suite level`);
            await sleep(100);
            await getAudioManager();
            console.info(`${TagFrmwk}: beforeAll: END`);
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
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0100
         * @tc.name      : mute - AudioScene - AsyncCallback - AUDIO_SCENE_RINGING - 1 响铃模式, AUDIO_SCENE_PHONE_CALL - 2 电话模式。
         * @tc.desc      : mute - AudioScene - AsyncCallback - AudioScene
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0100', 1, function (done) {
            try {
                audioManager.getAudioScene(async (err, getValue) => {
                    if (err) {
                        console.error(`Failed to obtain the audio scene mode. ${err}`);
                        return;
                    }
                    if (getValue === AUDIO_SCENE_RINGING) {
                        console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
                    } else if (getValue === AUDIO_SCENE_RINGING) {
                        console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
                    }
                    done();
                });
            } catch (e) {
                console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0100 ERROR: ${e.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200
         * @tc.name      : mute - AudioScene - Promise - AUDIO_SCENE_RINGING - 1 响铃模式, AUDIO_SCENE_PHONE_CALL - 2 电话模式。
         * @tc.desc      : mute - AudioScene - Promise - AudioScene
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200', 2, async function (done) {
            try {
                let value = await audioManager.getAudioScene();
                if (value === AUDIO_SCENE_RINGING) {
                    console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
                } else if (value === AUDIO_SCENE_RINGING) {
                    console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
                }
                done();
            } catch (e) {
                console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200 ERROR: ${e.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200
         * @tc.name      : mute - AudioScene - AUDIO_SCENE_RINGING - 1 响铃模式, AUDIO_SCENE_PHONE_CALL - 2 电话模式。
         * @tc.desc      : mute - AudioScene - getAudioSceneSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200', 2, function (done) {
            try {
                let value = audioManager.getAudioSceneSync();
                if (value === AUDIO_SCENE_RINGING) {
                    console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
                } else if (value === AUDIO_SCENE_RINGING) {
                    console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
                }
                done();
            } catch (e) {
                console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200 ERROR: ${e.message}`);
                expect(false).assertTrue();
                done();
            }
        })

    })
}