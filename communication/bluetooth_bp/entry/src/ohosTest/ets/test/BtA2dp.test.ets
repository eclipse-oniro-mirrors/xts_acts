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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
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
        console.info('[bluetooth_js] clickRequestPermission start');
        let driver = Driver.create();
        await driver.delayMs(3000);
        try {
            let button = await driver.findComponent(ON.text(text));
            await button.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] clickRequestPermission end');
        } catch (err) {
            console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
        }
        try {
            let button1 = await driver.findComponent(ON.text("允许"));
            await button1.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] click 允许 end');
        } catch (err) {
            console.info('[bluetooth_js] click 允许 failed. ' + err);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0100
     * @tc.desc   Test getPlayingState api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let state = A2dpSP.getPlayingState('11:22:33:44:55:66');
            expect(true).assertEqual(state == bluetooth.PlayingState.STATE_NOT_PLAYING || state == bluetooth.PlayingState.STATE_PLAYING);
        } catch (err) {
            console.info("bluetooth a2dp getPlayingState errCode:" + err.code + ",bluetooth a2dp getPlayingState errMessage:" + err.message);
            if (err.code == 801 || err.code == 2900004) {
                console.info('[bluetooth_js]getPlayingState is not support or profile not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0200
      * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0200
      * @tc.desc   Test PlayingState api10.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done : Function) => {
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0300
     * @tc.desc   Test createA2dpSrcProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done : Function) => {
        try {
            let a2dpProfile = bluetooth.createA2dpSrcProfile();
            console.info("[bluetooth_js]createA2dpSrcProfile: " + JSON.stringify(a2dpProfile));
            expect(true).assertEqual(a2dpProfile != null);
        } catch (error) {
            console.info("[bluetooth_js]createA2dpSrcProfile errCode:" + error.code + ",errMessage:" + error.message);
            if (error.code == 801) {
                console.info('[bluetooth_js]createA2dpSrcProfile is not support');
                expect(true).assertTrue();
            } else {
                expect().assertFail();
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0100
      * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0100
      * @tc.desc   Test CodecType api11.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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

            let CODEC_TYPE_L2HCST = bluetooth.CodecType.CODEC_TYPE_L2HCST;
            console.info("[bluetooth_js]CODEC_TYPE_L2HCST: " + CODEC_TYPE_L2HCST);
            expect(CODEC_TYPE_L2HCST).assertEqual(3);

            let CODEC_TYPE_LDAC = bluetooth.CodecType.CODEC_TYPE_LDAC;
            console.info("[bluetooth_js]CODEC_TYPE_LDAC: " + CODEC_TYPE_LDAC);
            expect(CODEC_TYPE_LDAC).assertEqual(4);
        } catch (err) {
            console.info("bluetooth a2dp CodecType errCode:" + err.code + ",bluetooth a2dp CodecType errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0200
      * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0200
      * @tc.desc   Test CodecChannelMode api11.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0300
      * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0300
      * @tc.desc   Test CodecBitsPerSample api11.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0400
      * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0400
      * @tc.desc   Test CodecSampleRate api11.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0500
      * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0500
      * @tc.desc   Test CodecBitRate api19.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
        try {
            let CODEC_BIT_RATE_96000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_96000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_96000: " + CODEC_BIT_RATE_96000);
            expect(CODEC_BIT_RATE_96000).assertEqual(0);

            let CODEC_BIT_RATE_128000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_128000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_128000: " + CODEC_BIT_RATE_128000);
            expect(CODEC_BIT_RATE_128000).assertEqual(1);
            

            let CODEC_BIT_RATE_192000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_192000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_192000: " + CODEC_BIT_RATE_192000);
            expect(CODEC_BIT_RATE_192000).assertEqual(2);

            let CODEC_BIT_RATE_256000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_256000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_256000: " + CODEC_BIT_RATE_256000);
            expect(CODEC_BIT_RATE_256000).assertEqual(3);

            let CODEC_BIT_RATE_320000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_320000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_320000: " + CODEC_BIT_RATE_320000);
            expect(CODEC_BIT_RATE_320000).assertEqual(4);

            let CODEC_BIT_RATE_480000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_480000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_480000: " + CODEC_BIT_RATE_480000);
            expect(CODEC_BIT_RATE_480000).assertEqual(5);

            let CODEC_BIT_RATE_640000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_640000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_640000: " + CODEC_BIT_RATE_640000);
            expect(CODEC_BIT_RATE_640000).assertEqual(6);

            let CODEC_BIT_RATE_960000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_960000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_960000: " + CODEC_BIT_RATE_960000);
            expect(CODEC_BIT_RATE_960000).assertEqual(7);

            let CODEC_BIT_RATE_ABR = bluetooth.CodecBitRate.CODEC_BIT_RATE_ABR;
            console.info("[bluetooth_js]CODEC_BIT_RATE_ABR: " + CODEC_BIT_RATE_ABR);
            expect(CODEC_BIT_RATE_ABR).assertEqual(8);

            let CODEC_BIT_RATE_1500000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_1500000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_1500000: " + CODEC_BIT_RATE_1500000);
            expect(CODEC_BIT_RATE_1500000).assertEqual(9);

            let CODEC_BIT_RATE_2300000 = bluetooth.CodecBitRate.CODEC_BIT_RATE_2300000;
            console.info("[bluetooth_js]CODEC_BIT_RATE_2300000: " + CODEC_BIT_RATE_2300000);
            expect(CODEC_BIT_RATE_2300000).assertEqual(10);
        } catch (err) {
            console.info("bluetooth a2dp CodecBitRate errCode:" + err.code + ",bluetooth a2dp CodecBitRate errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0600
      * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0600
      * @tc.desc   Test CodecFrameLength api19.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_CONSTANT_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
        try {
            let CODEC_FRAME_LENGTH_5MS = bluetooth.CodecFrameLength.CODEC_FRAME_LENGTH_5MS;
            console.info("[bluetooth_js]CODEC_FRAME_LENGTH_5MS: " + CODEC_FRAME_LENGTH_5MS);
            expect(CODEC_FRAME_LENGTH_5MS).assertEqual(0);

            let CODEC_FRAME_LENGTH_10MS = bluetooth.CodecFrameLength.CODEC_FRAME_LENGTH_10MS;
            console.info("[bluetooth_js]CODEC_FRAME_LENGTH_10MS: " + CODEC_FRAME_LENGTH_10MS);
            expect(CODEC_FRAME_LENGTH_10MS).assertEqual(1);
        } catch (err) {
            console.info("bluetooth a2dp CodecFrameLength errCode:" + err.code + ",bluetooth a2dp CodecFrameLength errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
})
}