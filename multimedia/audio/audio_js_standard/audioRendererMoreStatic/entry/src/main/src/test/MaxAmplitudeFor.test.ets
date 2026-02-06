/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index'
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base'

const defaultVolumeGroupId = audio.DEFAULT_VOLUME_GROUP_ID;
let audioManager = audio.getAudioManager();
let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();
let audioVolumeGroupManager: audio.AudioVolumeGroupManager | undefined;
let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
let REMOTE_CAST = audio.DeviceType.REMOTE_CAST;
let rate_88200 = audio.AudioSamplingRate.SAMPLE_RATE_88200;
let rate_176400 = audio.AudioSamplingRate.SAMPLE_RATE_176400;
let rate_19200 = audio.AudioSamplingRate.SAMPLE_RATE_192000;


let capturerInfo: audio.AudioCapturerInfo = {
    source: audio.SourceType.SOURCE_TYPE_MIC,
    capturerFlags: 0
}

let rendererInfo: audio.AudioRendererInfo = {
    usage : audio.StreamUsage.STREAM_USAGE_MUSIC,
    rendererFlags : 0
}

const prame =async (): Promise<void>=>{
    audioVolumeManager.getVolumeGroupManager(defaultVolumeGroupId, (err: BusinessError<void> | null, value: audio.AudioVolumeGroupManager | undefined) => {
        if (err) {
            console.error(`Failed to obtain the volume group infos list. ${err}`);
            return;
        }
        if (value !== undefined) {
            audioVolumeGroupManager = value;
        }
        console.info('Callback invoked to indicate that the volume group infos list is obtained.');
    });
}

export default function maxAmplitudeFor() {
    describe('maxAmplitudeFor', ()=>{
        const prame =async (): Promise<void>=>{
            audioVolumeManager.getVolumeGroupManager(defaultVolumeGroupId, (err: BusinessError<void> | null, value: audio.AudioVolumeGroupManager | undefined) => {
                if (err) {
                    console.error(`Failed to obtain the volume group infos list. ${err}`);
                    return;
                }
                if (value !== undefined) {
                    audioVolumeGroupManager = value;
                }
                console.info('Callback invoked to indicate that the volume group infos list is obtained.');
            });
        }

        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(()=> {
            prame();
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(()=> {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
        })
        afterEach(()=> {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        })
        afterAll(()=> {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_STATIC_0200
         * @tc.desc   AudioRenderer - STATE_RUNNING
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_STATIC_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ()=> {
            let flag: boolean = false;
            audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo).then((data: audio.AudioDeviceDescriptors) => {
                audioVolumeGroupManager!.getMaxAmplitudeForInputDevice(data[0]).then((value: double) => {
                    console.info(`mic volatileume amplitude is: ${value}`);
                    if (value >= 0 && value <= 1) {
                        flag = true;
                    }
                    expect(flag).assertTrue();
                }).catch((err: Error) => {
                    expect(false).assertTrue();
                    console.error("getMaxAmplitudeForInputDevice error" + JSON.stringify(err));
                })
            }).catch((err: Error) => {
                expect(false).assertTrue();
                console.error("get outputDeviceId error" + JSON.stringify(err));
            })
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_STATIC_0200
         * @tc.desc   AudioRenderer - STATE_RUNNING
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_STATIC_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ()=> {
            let flag: boolean = false;
            audioRoutingManager.getPreferOutputDeviceForRendererInfo(rendererInfo).then((data: audio.AudioDeviceDescriptors) => {
                audioVolumeGroupManager!.getMaxAmplitudeForOutputDevice(data[0]).then((value: double) => {
                    console.info(`mic volatileume amplitude is: ${value}`);
                    if (value >= 0 && value <= 1) {
                        flag = true;
                    }
                    expect(flag).assertTrue();
                }).catch((err: Error) => {
                    console.error("getMaxAmplitudeForOutputDevice error" + JSON.stringify(err));
                    expect(false).assertTrue();
                })
            }).catch((err: Error) => {
                console.error("getPreferOutputDeviceForRendererInfo error" + JSON.stringify(err));
                expect(false).assertTrue();
            })
        })

    })
}