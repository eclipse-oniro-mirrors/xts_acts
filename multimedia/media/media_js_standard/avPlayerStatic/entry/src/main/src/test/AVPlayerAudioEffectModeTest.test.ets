/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import MediaTestBase from './MediaTestBase.test';
import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio';
import { testAVPlayerFun, setSource } from './AVPlayerTestBase.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import resourceManager from '@ohos.resourceManager';
import { globalThis } from './Util.test';

const VIDEO_SOURCE = 'H264_AAC.mp4';
const AUDIO_SOURCE = '01.mp3';
const VIDEO_NOAUDIO = 'H264_NONE.mp4'
const PLAY_TIME = 3000;
const WAIT_TIME = 500;
const APIBASELINE = 500;
const EFFECT_NONE = audio.AudioEffectMode.EFFECT_NONE;
const EFFECT_DEFAULT = audio.AudioEffectMode.EFFECT_DEFAULT;
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';
let fileDescriptor: media.AVFileDescriptor;
let fileDescriptor2: media.AVFileDescriptor;
let fileDescriptor3: media.AVFileDescriptor;
let avPlayer: media.AVPlayer | null | undefined;
let mediaTestBase = new MediaTestBase()

function openFileFailed() {
  console.info('case file fail');
}

export default function AVPlayerAudioEffectModeTest() {
  describe('AVPlayerAudioEffectModeTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res: media.AVFileDescriptor) => {
        fileDescriptor = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res: media.AVFileDescriptor) => {
        fileDescriptor2 = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_NOAUDIO, openFileFailed).then((res: media.AVFileDescriptor) => {
        fileDescriptor3 = res;
      });
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      if (avPlayer != null) {
        avPlayer!!.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
      }
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor2.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor3.fd);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_static_0100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void ) => {
      let audioEffectMode = [EFFECT_DEFAULT, EFFECT_NONE];
      let i = 1;
      let playCount = 1;
      let resetConfig = 1;
      console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_111")
      await media.createAVPlayer().then((video: media.AVPlayer | undefined | null) => {
        console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_222")
        if (typeof (video) != 'undefined') {
          console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_333")
          avPlayer = video;
        } else {
          console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_444")
          expect().assertFail();
          done();
        }
      }).catch(mediaTestBase.catchCallback);
      console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_555")
      avPlayer?.onStateChange((state, reason) => {
        switch (state) {
          case IDLE:
            console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_11")
            if (avPlayer) {
              console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_666")
              console.info(`case avPlayer.audioEffectMode is: ` + avPlayer!!.audioEffectMode);
            }
            console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_777")
            console.info('case fdsrc test');
            if (resetConfig == 2) {
              avPlayer!!.fdSrc = fileDescriptor2 as media.AVFileDescriptor;
            } else if (resetConfig == 3) {
              avPlayer!!.fdSrc = fileDescriptor3 as media.AVFileDescriptor;
            } else {
              avPlayer!!.fdSrc = fileDescriptor as media.AVFileDescriptor;
            }
            break;
          case INITIALIZED:
            console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_22")
            if (avPlayer) {
              console.info(`case avPlayer.audioEffectMode is: ` + avPlayer!!.audioEffectMode);
              avPlayer!!.surfaceId = globalThis.value;
            }
            if (avPlayer && resetConfig == 3) {
              console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_01")
              let audioRendererInfo: audio.AudioRendererInfo = {
                usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
                rendererFlags: 0,
              };
              console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_02")
              avPlayer!!.audioRendererInfo = audioRendererInfo;
            }
            avPlayer?.prepare();
            break;
          case PREPARED:
            console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_33")
            if (!avPlayer) {
              console.info(`avPlayer is: null`);
              break;
            }
            console.info(`case avPlayer.audioEffectMode is: ` + avPlayer!!.audioEffectMode);
            console.log("___audio___1")
            if (resetConfig == 2) {
              console.log("___audio___2")
              expect(avPlayer?.audioEffectMode).assertEqual(audioEffectMode[i % 2]);
              console.log("___audio___3")
            } else if (resetConfig == 3) {
              console.log("___audio___4")
              expect(avPlayer?.audioEffectMode).assertEqual(audioEffectMode[0]);
              console.log("___audio___5")
              avPlayer!!.audioEffectMode = audioEffectMode[i % 2]as audio.AudioEffectMode | undefined;
              console.log("___audio___6")
            } else {
              console.log("___audio___7")
              expect(avPlayer?.audioEffectMode).assertEqual(audioEffectMode[0]);
              console.log("___audio___8")
              avPlayer!!.audioEffectMode = audioEffectMode[(i++) % 2]as audio.AudioEffectMode | undefined;
              console.log("___audio___9")
            }
            console.log("___audio___10")
            avPlayer?.play();
            console.log("___audio___11")
            break;
          case PLAYING:
            console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_44")
            if (!avPlayer) {
              console.info(`avPlayer is: null`);
              break;
            }
            console.info(`case avPlayer.audioEffectMode is: ` + avPlayer!!.audioEffectMode);
            if (playCount == 1) {
              avPlayer!!.audioEffectMode = audioEffectMode[i % 2]as audio.AudioEffectMode | undefined;
              avPlayer!!.pause();
            } else if (playCount == 2) {
              expect(avPlayer?.audioEffectMode).assertEqual(audioEffectMode[(i++) % 2]);
              avPlayer!!.audioEffectMode = audioEffectMode[i % 2]as audio.AudioEffectMode | undefined;
              avPlayer!!.seek(avPlayer!!.duration);
            } else {
              expect(avPlayer?.audioEffectMode).assertEqual(audioEffectMode[i % 2]);
              if (resetConfig == 2) {
                resetConfig++;
                avPlayer!!.reset();
              } else {
                avPlayer!!.release();
              }
            }
            playCount += 1;
            break;
          case PAUSED:
            console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_55")
            if (!avPlayer) {
              console.info(`avPlayer is: null`);
              break;
            }
            console.info(`case avPlayer.audioEffectMode is: ` + avPlayer!!.audioEffectMode);
            expect(avPlayer?.audioEffectMode).assertEqual(audioEffectMode[(i++) % 2]);
            avPlayer!!.audioEffectMode = audioEffectMode[i % 2]as audio.AudioEffectMode | undefined;
            avPlayer!!.play();
            break;
          case COMPLETED:
            console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_66")
            if (!avPlayer) {
              console.info(`avPlayer is: null`);
              break;
            }
            console.info(`case avPlayer.audioEffectMode is: ` + avPlayer!!.audioEffectMode);
            expect(avPlayer?.audioEffectMode).assertEqual(audioEffectMode[(i++) % 2]);
            avPlayer!!.audioEffectMode = audioEffectMode[i % 2] as audio.AudioEffectMode | undefined;
            resetConfig++;
            avPlayer!!.reset();
            break;
          case RELEASED:
            console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_77")
            avPlayer = null;
            done();
            break;
          default:
            break;
        }
      });
      avPlayer?.onError((err) => {
        console.error(`error occurred, message is ${err.message}`);
        expect().assertFail();
        avPlayer?.release();
      });
      console.log("SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100_666")
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = fileDescriptor as media.AVFileDescriptor;
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_GET_MAX_AMPLITUDE_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_GET_MAX_AMPLITUDE_static_0100
     * @tc.desc   test get max amplitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_GET_MAX_AMPLITUDE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let audioEffectMode = [EFFECT_DEFAULT, EFFECT_NONE];
      await media.createAVPlayer().then((video: media.AVPlayer | undefined) => {
        if (typeof (video) != 'undefined') {
          avPlayer = video;
        } else {
          expect().assertFail();
          done();
        }
      }).catch(mediaTestBase.catchCallback);
      avPlayer?.onStateChange((state, reason) => {
        switch (state) {
          case INITIALIZED:
              if (!avPlayer) {
                  console.info(`avPlayer is: null`);
                  break;
              }
            avPlayer!!.surfaceId = globalThis.value;
            avPlayer!!.prepare();
            break;
          case PREPARED:
              if (!avPlayer) {
                  console.info(`avPlayer is: null`);
                  break;
              }
            avPlayer!!.play();
            break;
          case PLAYING:
            avPlayer?.release();
            break;
          case RELEASED:
            avPlayer?.offAmplitudeUpdate()
            avPlayer = null;
            done();
            break;
          default:
            break;
        }
      });
      avPlayer?.onAmplitudeUpdate((value) => {
        console.info(`get max amplitude ${value}`);
        expect(value.length).assertEqual(5);
      });
      avPlayer?.onError((err) => {
        console.error(`error occurred, message is ${err.message}`);
        expect().assertFail();
        avPlayer?.release();
      });
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = fileDescriptor as media.AVFileDescriptor;
    });
  })
}
