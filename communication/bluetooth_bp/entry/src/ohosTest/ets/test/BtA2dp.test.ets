/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import bluetooth from '@ohos.bluetooth.a2dp';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

    function sleep(delay : number) : Promise<void> {
        return new Promise(resovle => setTimeout(resovle, delay))
    }
    async function openPhone() {
        try{
            let drivers = Driver.create();
            console.info('[bluetooth_js] bt driver create:'+ drivers);            
            await drivers.delayMs(1000);
            await drivers.wakeUpDisplay();
            await drivers.delayMs(5000);
            await drivers.swipe(1500, 1000, 1500, 100);
            await drivers.delayMs(10000);
        } catch (error) {
            console.info('[bluetooth_js] driver error info:'+ error);
        }
    }

    async function tryToEnableBt() {
        let sta = btAccess.getState();
        switch (sta) {
            case 0:
                btAccess.enableBluetooth();
                await clickRequestPermission(OPEN_BT_TEXT);
                await sleep(10000);
                let sta1 = btAccess.getState();
                console.info('[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:' + JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:' + JSON.stringify(sta));
                break;
            case 3:
                btAccess.enableBluetooth();
                await clickRequestPermission(OPEN_BT_TEXT);
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }

    let PERMISSION_TEXT:string = "允许";
    let OPEN_BT_TEXT:string = "开启";

    async function clickRequestPermission(text:string) {
        try {
            console.info('[bluetooth_js] clickRequestPermission start');
            let driver = Driver.create();
            await driver.delayMs(3000);
            let button = await driver.findComponent(ON.text(text));
            await button.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] clickRequestPermission end');
        } catch (err) {
            console.info('[bluetooth_js] clickRequestPermission failed');
        }
    }
    
export default function btA2dpTest() {
    let A2dpSP: bluetooth.A2dpSourceProfile;
    

    
describe('btA2dpTest', () => {
    beforeAll(async (done : Function) => {
        console.info('beforeAll called')
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        await tryToEnableBt();
        A2dpSP = bluetooth.createA2dpSrcProfile();
        done();
    })
    beforeEach(async (done : Function) => {
        console.info('beforeEach called')
        await tryToEnableBt()
        done();
    })
    afterEach(() => {
        console.info('afterEach called')
    })
    afterAll(() => {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0100
     * @tc.name test getPlayingState
     * @tc.desc Test getPlayingState api10.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0100', 0, async (done : Function) => {
        try {
            let state = A2dpSP.getPlayingState('11:22:33:44:55:66');
            expect(true).assertEqual(state == bluetooth.PlayingState.STATE_NOT_PLAYING || state == bluetooth.PlayingState.STATE_PLAYING);
        } catch (err) {
            console.info("bluetooth a2dp getPlayingState errCode:" + err.code + ",bluetooth a2dp getPlayingState errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0200
     * @tc.name test PlayingState
     * @tc.desc Test PlayingState api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0200', 0, async (done : Function) => {
        try {
            let statePlaying = bluetooth.PlayingState.STATE_PLAYING;
            console.info("[bluetooth_js]PlayingState: " + JSON.stringify(statePlaying));
            expect(statePlaying).assertEqual(1);
            let stateNotPlaying = bluetooth.PlayingState.STATE_NOT_PLAYING;
            console.info("[bluetooth_js]PlayingState: " + JSON.stringify(stateNotPlaying));
            expect(stateNotPlaying).assertEqual(0);
        } catch (err) {
            console.info("bluetooth a2dp PlayingState errCode:" + err.code + ",bluetooth a2dp PlayingState errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0100
     * @tc.name test CodecType
     * @tc.desc Test CodecType api11.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0100', 0, async (done : Function) => {
        try {
            let CODEC_TYPE_INVALID = bluetooth.CodecType.CODEC_TYPE_INVALID;
            console.info("[bluetooth_js]CODEC_TYPE_INVALID: " + CODEC_TYPE_INVALID);
            expect(CODEC_TYPE_INVALID).assertEqual(-1);

            let CODEC_TYPE_SBC = bluetooth.CodecType.CODEC_TYPE_SBC;
            console.info("[bluetooth_js]CODEC_TYPE_SBC: " + CODEC_TYPE_SBC);
            expect(CODEC_TYPE_SBC).assertEqual(0);

            let CODEC_TYPE_AAC = bluetooth.CodecType.CODEC_TYPE_AAC;
            console.info("[bluetooth_js]CODEC_TYPE_AAC: " + CODEC_TYPE_AAC);
            expect(CODEC_TYPE_AAC).assertEqual(1);

            let CODEC_TYPE_L2HC = bluetooth.CodecType.CODEC_TYPE_L2HC;
            console.info("[bluetooth_js]CODEC_TYPE_L2HC: " + CODEC_TYPE_L2HC);
            expect(CODEC_TYPE_L2HC).assertEqual(2);
        } catch (err) {
            console.info("bluetooth a2dp CodecType errCode:" + err.code + ",bluetooth a2dp CodecType errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0200
     * @tc.name test CodecChannelMode
     * @tc.desc Test CodecChannelMode api11.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0200', 0, async (done : Function) => {
        try {
            let CODEC_CHANNEL_MODE_NONE = bluetooth.CodecChannelMode.CODEC_CHANNEL_MODE_NONE;
            console.info("[bluetooth_js]CODEC_CHANNEL_MODE_NONE: " + CODEC_CHANNEL_MODE_NONE);
            expect(CODEC_CHANNEL_MODE_NONE).assertEqual(0);

            let CODEC_CHANNEL_MODE_MONO = bluetooth.CodecChannelMode.CODEC_CHANNEL_MODE_MONO;
            console.info("[bluetooth_js]CODEC_CHANNEL_MODE_MONO: " + CODEC_CHANNEL_MODE_MONO);
            expect(CODEC_CHANNEL_MODE_MONO).assertEqual(1);

            let CODEC_CHANNEL_MODE_STEREO = bluetooth.CodecChannelMode.CODEC_CHANNEL_MODE_STEREO;
            console.info("[bluetooth_js]CODEC_CHANNEL_MODE_STEREO: " + CODEC_CHANNEL_MODE_STEREO);
            expect(CODEC_CHANNEL_MODE_STEREO).assertEqual(2);
        } catch (err) {
            console.info("bluetooth a2dp CodecChannelMode errCode:" + err.code + ",bluetooth a2dp CodecChannelMode errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0300
     * @tc.name test CodecBitsPerSample
     * @tc.desc Test CodecBitsPerSample api11.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0300', 0, async (done : Function) => {
        try {
            let CODEC_BITS_PER_SAMPLE_NONE = bluetooth.CodecBitsPerSample.CODEC_BITS_PER_SAMPLE_NONE;
            console.info("[bluetooth_js]CODEC_BITS_PER_SAMPLE_NONE: " + CODEC_BITS_PER_SAMPLE_NONE);
            expect(CODEC_BITS_PER_SAMPLE_NONE).assertEqual(0);

            let CODEC_BITS_PER_SAMPLE_16 = bluetooth.CodecBitsPerSample.CODEC_BITS_PER_SAMPLE_16;
            console.info("[bluetooth_js]CODEC_BITS_PER_SAMPLE_16: " + CODEC_BITS_PER_SAMPLE_16);
            expect(CODEC_BITS_PER_SAMPLE_16).assertEqual(1);

            let CODEC_BITS_PER_SAMPLE_24 = bluetooth.CodecBitsPerSample.CODEC_BITS_PER_SAMPLE_24;
            console.info("[bluetooth_js]CODEC_BITS_PER_SAMPLE_24: " + CODEC_BITS_PER_SAMPLE_24);
            expect(CODEC_BITS_PER_SAMPLE_24).assertEqual(2);

            let CODEC_BITS_PER_SAMPLE_32 = bluetooth.CodecBitsPerSample.CODEC_BITS_PER_SAMPLE_32;
            console.info("[bluetooth_js]CODEC_BITS_PER_SAMPLE_32: " + CODEC_BITS_PER_SAMPLE_32);
            expect(CODEC_BITS_PER_SAMPLE_32).assertEqual(3);
        } catch (err) {
            console.info("bluetooth a2dp CodecBitsPerSample errCode:" + err.code + ",bluetooth a2dp CodecBitsPerSample errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0400
     * @tc.name test CodecSampleRate
     * @tc.desc Test CodecSampleRate api11.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0400', 0, async (done : Function) => {
        try {
            let CODEC_SAMPLE_RATE_NONE = bluetooth.CodecSampleRate.CODEC_SAMPLE_RATE_NONE;
            console.info("[bluetooth_js]CODEC_SAMPLE_RATE_NONE: " + CODEC_SAMPLE_RATE_NONE);
            expect(CODEC_SAMPLE_RATE_NONE).assertEqual(0);

            let CODEC_SAMPLE_RATE_44100 = bluetooth.CodecSampleRate.CODEC_SAMPLE_RATE_44100;
            console.info("[bluetooth_js]CODEC_SAMPLE_RATE_44100: " + CODEC_SAMPLE_RATE_44100);
            expect(CODEC_SAMPLE_RATE_44100).assertEqual(1);

            let CODEC_SAMPLE_RATE_48000 = bluetooth.CodecSampleRate.CODEC_SAMPLE_RATE_48000;
            console.info("[bluetooth_js]CODEC_SAMPLE_RATE_48000: " + CODEC_SAMPLE_RATE_48000);
            expect(CODEC_SAMPLE_RATE_48000).assertEqual(2);

            let CODEC_SAMPLE_RATE_88200 = bluetooth.CodecSampleRate.CODEC_SAMPLE_RATE_88200;
            console.info("[bluetooth_js]CODEC_SAMPLE_RATE_88200: " + CODEC_SAMPLE_RATE_88200);
            expect(CODEC_SAMPLE_RATE_88200).assertEqual(3);

            let CODEC_SAMPLE_RATE_96000 = bluetooth.CodecSampleRate.CODEC_SAMPLE_RATE_96000;
            console.info("[bluetooth_js]CODEC_SAMPLE_RATE_96000: " + CODEC_SAMPLE_RATE_96000);
            expect(CODEC_SAMPLE_RATE_96000).assertEqual(4);

            let CODEC_SAMPLE_RATE_176400 = bluetooth.CodecSampleRate.CODEC_SAMPLE_RATE_176400;
            console.info("[bluetooth_js]CODEC_SAMPLE_RATE_176400: " + CODEC_SAMPLE_RATE_176400);
            expect(CODEC_SAMPLE_RATE_176400).assertEqual(5);

            let CODEC_SAMPLE_RATE_192000 = bluetooth.CodecSampleRate.CODEC_SAMPLE_RATE_192000;
            console.info("[bluetooth_js]CODEC_SAMPLE_RATE_192000: " + CODEC_SAMPLE_RATE_192000);
            expect(CODEC_SAMPLE_RATE_192000).assertEqual(6);
        } catch (err) {
            console.info("bluetooth a2dp CodecSampleRate errCode:" + err.code + ",bluetooth a2dp CodecSampleRate errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
})
}