/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import a2dp from '@ohos.bluetooth.a2dp';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtA2dpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let deviceId: string = "00:11:22:33:44:55";
let g_context: common.UIAbilityContext;
let a2dpSrc: a2dp.A2dpSourceProfile | undefined;

export default function bluetoothA2dpTest() {

  describe("bluetoothA2dpTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      try {
          await Utils.msSleep(2000);
          hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
          g_context = Hypium.get('Context') as common.UIAbilityContext;
          let atManager = abilityAccessCtrl.createAtManager();
          let arr: Array<Permissions> = new Array<Permissions>();
          arr.push('ohos.permission.ACCESS_BLUETOOTH')
          atManager.requestPermissionsFromUser(g_context, arr,
              (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                  hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
                  hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
                  hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
              });
      } catch (err) {
          err = err as BusinessError;
          hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await Utils.msSleep(2000);
      await Utils.clickRequestPermission('允许');
      a2dpSrc = a2dp.createA2dpSrcProfile();
      hilog.info(domain, tag, "a2dpSrc success" + JSON.stringify(a2dpSrc));
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    beforeEach(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      try {
        await Utils.openBluetooth();
        hilog.info(domain, tag, '%{public}s', 'beforeEach end');
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
      }
    })

    /**
     * @tc.number  getPlayingStateTest
     * @tc.name    getPlayingStateTest
     * @tc.desc    Test getPlayingStateTest API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getPlayingStateTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let state: a2dp.PlayingState = a2dpSrc!.getPlayingState(deviceId);
        hilog.info(domain, tag, "getPlayingState:" + state);
        expect(true).assertEqual(state === a2dp.PlayingState.STATE_NOT_PLAYING || state === a2dp.PlayingState.STATE_PLAYING);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getPlayingState get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801 || err.code === 2900004) {
          hilog.info(domain, tag, 'api is not support or profile not support');
          expect(err.code === 801 || err.code === 2900004).assertTrue();
        } else {
          expect(Number(err.code)).assertEqual(2900099);
        }
      }
      done();
    })

    /**
     * @tc.number  PlayingStateTest
     * @tc.name    PlayingStateTest
     * @tc.desc    Test PlayingStateTest API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("PlayingStateTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let STATE_PLAYING: a2dp.PlayingState = a2dp.PlayingState.STATE_PLAYING;
        hilog.info(domain, tag, "STATE_PLAYING:" + STATE_PLAYING);
        expect(true).assertEqual(STATE_PLAYING === 1);
        let STATE_NOT_PLAYING: a2dp.PlayingState = a2dp.PlayingState.STATE_NOT_PLAYING;
        hilog.info(domain, tag, "STATE_NOT_PLAYING:" + STATE_NOT_PLAYING);
        expect(true).assertEqual(STATE_NOT_PLAYING === 0);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "PlayingState get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number  CodecTypeTest
     * @tc.name    CodecTypeTest
     * @tc.desc    Test CodecTypeTest API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("CodecTypeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let STATE_CODEC_TYPE_INVALID: a2dp.CodecType = a2dp.CodecType.CODEC_TYPE_INVALID;
        hilog.info(domain, tag, "STATE_CODEC_TYPE_INVALID:" + STATE_CODEC_TYPE_INVALID);
        expect(true).assertEqual(STATE_CODEC_TYPE_INVALID === -1);

        let STATE_CODEC_TYPE_SBC: a2dp.CodecType = a2dp.CodecType.CODEC_TYPE_SBC;
        hilog.info(domain, tag, "STATE_CODEC_TYPE_SBC:" + STATE_CODEC_TYPE_SBC);
        expect(true).assertEqual(STATE_CODEC_TYPE_SBC === 0);

        let STATE_CODEC_TYPE_AAC: a2dp.CodecType = a2dp.CodecType.CODEC_TYPE_AAC;
        hilog.info(domain, tag, "STATE_CODEC_TYPE_AAC:" + STATE_CODEC_TYPE_AAC);
        expect(true).assertEqual(STATE_CODEC_TYPE_AAC === 1);

        let STATE_CODEC_TYPE_L2HC: a2dp.CodecType = a2dp.CodecType.CODEC_TYPE_L2HC;
        hilog.info(domain, tag, "STATE_CODEC_TYPE_L2HC:" + STATE_CODEC_TYPE_L2HC);
        expect(true).assertEqual(STATE_CODEC_TYPE_L2HC === 2);

        let STATE_CODEC_TYPE_L2HCST: a2dp.CodecType = a2dp.CodecType.CODEC_TYPE_L2HCST;
        hilog.info(domain, tag, "STATE_CODEC_TYPE_L2HCST:" + STATE_CODEC_TYPE_L2HCST);
        expect(true).assertEqual(STATE_CODEC_TYPE_L2HCST === 3);

        let STATE_CODEC_TYPE_LDAC: a2dp.CodecType = a2dp.CodecType.CODEC_TYPE_LDAC;
        hilog.info(domain, tag, "STATE_CODEC_TYPE_LDAC:" + STATE_CODEC_TYPE_LDAC);
        expect(true).assertEqual(STATE_CODEC_TYPE_LDAC === 4);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "CodecType get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number  CodecChannelModeTest
     * @tc.name    CodecChannelModeTest
     * @tc.desc    Test CodecChannelModeTest API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("CodecChannelModeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let STATE_CODEC_CHANNEL_MODE_NONE: a2dp.CodecChannelMode = a2dp.CodecChannelMode.CODEC_CHANNEL_MODE_NONE;
        hilog.info(domain, tag, "STATE_CODEC_CHANNEL_MODE_NONE:" + STATE_CODEC_CHANNEL_MODE_NONE);
        expect(true).assertEqual(STATE_CODEC_CHANNEL_MODE_NONE === 0);

        let STATE_CODEC_CHANNEL_MODE_MONO: a2dp.CodecChannelMode = a2dp.CodecChannelMode.CODEC_CHANNEL_MODE_MONO;
        hilog.info(domain, tag, "STATE_CODEC_CHANNEL_MODE_MONO:" + STATE_CODEC_CHANNEL_MODE_MONO);
        expect(true).assertEqual(STATE_CODEC_CHANNEL_MODE_MONO === 1);

        let STATE_CODEC_CHANNEL_MODE_STEREO: a2dp.CodecChannelMode = a2dp.CodecChannelMode.CODEC_CHANNEL_MODE_STEREO;
        hilog.info(domain, tag, "STATE_CODEC_CHANNEL_MODE_STEREO:" + STATE_CODEC_CHANNEL_MODE_STEREO);
        expect(true).assertEqual(STATE_CODEC_CHANNEL_MODE_STEREO === 2);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "CodecChannelMode get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number  CodecBitsPerSampleTest
     * @tc.name    CodecBitsPerSampleTest
     * @tc.desc    Test CodecBitsPerSampleTest API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("CodecBitsPerSampleTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let STATE_CODEC_BITS_PER_SAMPLE_NONE: a2dp.CodecBitsPerSample = a2dp.CodecBitsPerSample.CODEC_BITS_PER_SAMPLE_NONE;
        hilog.info(domain, tag, "STATE_CODEC_BITS_PER_SAMPLE_NONE:" + STATE_CODEC_BITS_PER_SAMPLE_NONE);
        expect(true).assertEqual(STATE_CODEC_BITS_PER_SAMPLE_NONE === 0);

        let STATE_CODEC_BITS_PER_SAMPLE_16: a2dp.CodecBitsPerSample = a2dp.CodecBitsPerSample.CODEC_BITS_PER_SAMPLE_16;
        hilog.info(domain, tag, "STATE_CODEC_BITS_PER_SAMPLE_16:" + STATE_CODEC_BITS_PER_SAMPLE_16);
        expect(true).assertEqual(STATE_CODEC_BITS_PER_SAMPLE_16 === 1);

        let STATE_CODEC_BITS_PER_SAMPLE_24: a2dp.CodecBitsPerSample = a2dp.CodecBitsPerSample.CODEC_BITS_PER_SAMPLE_24;
        hilog.info(domain, tag, "STATE_CODEC_BITS_PER_SAMPLE_24:" + STATE_CODEC_BITS_PER_SAMPLE_24);
        expect(true).assertEqual(STATE_CODEC_BITS_PER_SAMPLE_24 === 2);

        let STATE_CODEC_BITS_PER_SAMPLE_32: a2dp.CodecBitsPerSample = a2dp.CodecBitsPerSample.CODEC_BITS_PER_SAMPLE_32;
        hilog.info(domain, tag, "STATE_CODEC_BITS_PER_SAMPLE_32:" + STATE_CODEC_BITS_PER_SAMPLE_32);
        expect(true).assertEqual(STATE_CODEC_BITS_PER_SAMPLE_32 === 3);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "CodecBitsPerSample get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number  CodecSampleRateTest
     * @tc.name    CodecSampleRateTest
     * @tc.desc    Test CodecSampleRateTest API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("CodecSampleRateTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let STATE_CODEC_SAMPLE_RATE_NONE: a2dp.CodecSampleRate = a2dp.CodecSampleRate.CODEC_SAMPLE_RATE_NONE;
        hilog.info(domain, tag, "STATE_CODEC_SAMPLE_RATE_NONE:" + STATE_CODEC_SAMPLE_RATE_NONE);
        expect(true).assertEqual(STATE_CODEC_SAMPLE_RATE_NONE === 0);

        let STATE_CODEC_SAMPLE_RATE_44100: a2dp.CodecSampleRate = a2dp.CodecSampleRate.CODEC_SAMPLE_RATE_44100;
        hilog.info(domain, tag, "STATE_CODEC_SAMPLE_RATE_44100:" + STATE_CODEC_SAMPLE_RATE_44100);
        expect(true).assertEqual(STATE_CODEC_SAMPLE_RATE_44100 === 1);

        let STATE_CODEC_SAMPLE_RATE_48000: a2dp.CodecSampleRate = a2dp.CodecSampleRate.CODEC_SAMPLE_RATE_48000;
        hilog.info(domain, tag, "STATE_CODEC_SAMPLE_RATE_48000:" + STATE_CODEC_SAMPLE_RATE_48000);
        expect(true).assertEqual(STATE_CODEC_SAMPLE_RATE_48000 === 2);

        let STATE_CODEC_SAMPLE_RATE_88200: a2dp.CodecSampleRate = a2dp.CodecSampleRate.CODEC_SAMPLE_RATE_88200;
        hilog.info(domain, tag, "STATE_CODEC_SAMPLE_RATE_88200:" + STATE_CODEC_SAMPLE_RATE_88200);
        expect(true).assertEqual(STATE_CODEC_SAMPLE_RATE_88200 === 3);

        let STATE_CODEC_SAMPLE_RATE_96000: a2dp.CodecSampleRate = a2dp.CodecSampleRate.CODEC_SAMPLE_RATE_96000;
        hilog.info(domain, tag, "STATE_CODEC_SAMPLE_RATE_96000:" + STATE_CODEC_SAMPLE_RATE_96000);
        expect(true).assertEqual(STATE_CODEC_SAMPLE_RATE_96000 === 4);

        let STATE_CODEC_SAMPLE_RATE_176400: a2dp.CodecSampleRate = a2dp.CodecSampleRate.CODEC_SAMPLE_RATE_176400;
        hilog.info(domain, tag, "STATE_CODEC_SAMPLE_RATE_176400:" + STATE_CODEC_SAMPLE_RATE_176400);
        expect(true).assertEqual(STATE_CODEC_SAMPLE_RATE_176400 === 5);

        let STATE_CODEC_SAMPLE_RATE_192000: a2dp.CodecSampleRate = a2dp.CodecSampleRate.CODEC_SAMPLE_RATE_192000;
        hilog.info(domain, tag, "STATE_CODEC_SAMPLE_RATE_192000:" + STATE_CODEC_SAMPLE_RATE_192000);
        expect(true).assertEqual(STATE_CODEC_SAMPLE_RATE_192000 === 6);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "CodecSampleRate get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

  })
}