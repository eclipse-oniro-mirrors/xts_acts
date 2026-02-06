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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avplayer from 'libavplayerndk.so'

export default function AVPlayerNdkTest() {
  describe('AVPlayerTest', () => {

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_AVPlayer_SetURLSource_0100
     * @tc.number SUB_MULTIMEIDA_OH_AVPlayer_SetURLSource_0100
     * @tc.desc   test OH_AVPlayer_SetURLSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_AVPlayer_SetURLSource_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVPlayer_SetURLSource_0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetURLSource0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVPlayer_SetURLSource_0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_Reset0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_Reset0100
     * @tc.desc   test OH_AVPlayer_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_Reset0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_Reset0100 start====");
          let result: number = avplayer.OH_AVPlayer_Reset0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_Reset0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_Release0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_Release0100
     * @tc.desc   test OH_AVPlayer_Release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_Release0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_Release0100 start====");
          let result: number = avplayer.OH_AVPlayer_Release0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_Release0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_ReleaseSync0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_ReleaseSync0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_ReleaseSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_ReleaseSync0100 start====");
          let result: number = avplayer.OH_AVPlayer_ReleaseSync0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_ReleaseSync0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolume0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolume0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolume0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolume0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetVolume0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolume0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_Seek0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_Seek0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_Seek0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_Seek0100 start====");
          let result: number = avplayer.OH_AVPlayer_Seek0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_Seek0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTime0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTime0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTime0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTime0100 start====");
          let result: number = avplayer.OH_AVPlayer_GetCurrentTime0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTime0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoWidth0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoWidth0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoWidth0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoWidth0100 start====");
          let result: number = avplayer.OH_AVPlayer_GetVideoWidth0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoWidth0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoHeight0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoHeight0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoHeight0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoHeight0100 start====");
          let result: number = avplayer.OH_AVPlayer_GetVideoHeight0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetVideoHeight0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackSpeed0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackSpeed0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackSpeed0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackSpeed0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetPlaybackSpeed0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackSpeed0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackRate0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackRate0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackRate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackRate0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetPlaybackRate0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlaybackRate0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_GetPlaybackSpeed0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_GetPlaybackSpeed0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_GetPlaybackSpeed0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetPlaybackSpeed0100 start====");
          let result: number = avplayer.OH_AVPlayer_GetPlaybackSpeed0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetPlaybackSpeed0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioRendererInfo0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioRendererInfo0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioRendererInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioRendererInfo0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetAudioRendererInfo0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioRendererInfo0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioInterruptMode0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioInterruptMode0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioInterruptMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioInterruptMode0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetAudioInterruptMode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioInterruptMode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioEffectMode0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioEffectMode0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioEffectMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioEffectMode0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetAudioEffectMode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetAudioEffectMode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVideoSurface0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVideoSurface0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVideoSurface0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVideoSurface0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetVideoSurface0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVideoSurface0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_GetDuration0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_GetDuration0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_GetDuration0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetDuration0100 start====");
          let result: number = avplayer.OH_AVPlayer_GetDuration0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetDuration0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_GetState0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_GetState0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_GetState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetState0100 start====");
          let result: number = avplayer.OH_AVPlayer_GetState0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetState0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetLooping0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetLooping0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetLooping0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetLooping0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetLooping0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetLooping0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlayerCallback0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlayerCallback0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlayerCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlayerCallback0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetPlayerCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetPlayerCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTrack0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTrack0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTrack0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTrack0100 start====");
          let result: number = avplayer.OH_AVPlayer_GetCurrentTrack0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetCurrentTrack0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetMediaKeySystemInfoCallback0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetMediaKeySystemInfoCallback0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetMediaKeySystemInfoCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetMediaKeySystemInfoCallback0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetMediaKeySystemInfoCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetMediaKeySystemInfoCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_GetMediaKeySystemInfo0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_GetMediaKeySystemInfo0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_GetMediaKeySystemInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetMediaKeySystemInfo0100 start====");
          let result: number = avplayer.OH_AVPlayer_GetMediaKeySystemInfo0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_GetMediaKeySystemInfo0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetDecryptionConfig0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetDecryptionConfig0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetDecryptionConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetDecryptionConfig0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetDecryptionConfig0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetDecryptionConfig0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnInfoCallback0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnInfoCallback0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnInfoCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnInfoCallback0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetOnInfoCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnInfoCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnErrorCallback0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnErrorCallback0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnErrorCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnErrorCallback0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetOnErrorCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetOnErrorCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolumeMode0100
     * @tc.number SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolumeMode0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolumeMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolumeMode0100 start====");
          let result: number = avplayer.OH_AVPlayer_SetVolumeMode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_OH_AVPlayer_SetVolumeMode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_AVPlaybackSpeed0100
     * @tc.number SUB_MULTIMEIDA_AVPlaybackSpeed0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_AVPlaybackSpeed0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_AVPlaybackSpeed0100 start====");
          let result: number = avplayer.AVPlaybackSpeed0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_AVPlaybackSpeed0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_AVPlaybackSpeed0101
     * @tc.number SUB_MULTIMEIDA_AVPlaybackSpeed0101
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_AVPlaybackSpeed0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_AVPlaybackSpeed0101 start====");
          let result: number = avplayer.AVPlaybackSpeed0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_AVPlaybackSpeed0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_AVPlaybackSpeed0102
     * @tc.number SUB_MULTIMEIDA_AVPlaybackSpeed0102
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_AVPlaybackSpeed0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_AVPlaybackSpeed0102 start====");
          let result: number = avplayer.AVPlaybackSpeed0102();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_AVPlaybackSpeed0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_AVPlaybackSpeed0103
     * @tc.number SUB_MULTIMEIDA_AVPlaybackSpeed0103
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_AVPlaybackSpeed0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_AVPlaybackSpeed0103 start====");
          let result: number = avplayer.AVPlaybackSpeed0103();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_AVPlaybackSpeed0103 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_AVPlayerBufferingType0100
     * @tc.number SUB_MULTIMEIDA_AVPlayerBufferingType0100
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_AVPlayerBufferingType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_AVPlayerBufferingType0100 start====");
          let result: number = avplayer.AVPlayerBufferingType0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_AVPlayerBufferingType0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_AVPlayerBufferingType0101
     * @tc.number SUB_MULTIMEIDA_AVPlayerBufferingType0101
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_AVPlayerBufferingType0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_AVPlayerBufferingType0101 start====");
          let result: number = avplayer.AVPlayerBufferingType0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_AVPlayerBufferingType0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_AVPlayerBufferingType0102
     * @tc.number SUB_MULTIMEIDA_AVPlayerBufferingType0102
     * @tc.desc   test OH_AVPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_AVPlayerBufferingType0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_AVPlayerBufferingType0102 start====");
          let result: number = avplayer.AVPlayerBufferingType0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_AVPlayerBufferingType0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })


  })
}
