/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

export default function audioLoopBack() {

  const TAG = "[AudioLoopBackJsTest]";

  describe("AudioLoopBackJsTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll called");
    })

    afterAll(() => {
      console.info(TAG + 'afterAll called')
    })

    beforeEach(() => {
      console.info(TAG + 'beforeEach called')
    })

    afterEach(() => {
      console.info(TAG + 'afterEach called')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_STATIC_0100
     * @tc.desc   createAudioLoopback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          if (null == audioLoopBack) {
            expect().assertFail();
          }
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_0100 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201)
          } else {
            expect().assertFail();
          }
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0100
     * @tc.desc   setVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack?.setVolume(0);
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0100 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201)
          } else {
            expect().assertFail();
          }
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0200
     * @tc.desc   setVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack?.setVolume(0.5);
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0200 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201)
          } else {
            expect().assertFail();
          }
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0300
     * @tc.desc   setVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack?.setVolume(1);
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0300 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201)
          } else {
            expect().assertFail();
          }
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0400
     * @tc.desc   setVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack?.setVolume(-0.1);
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0400 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201);
          } else {
            expect(Number(err.code)).assertEqual(6800101);
            done();
          }
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0500
     * @tc.desc   setVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack?.setVolume(1.1);
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_STATIC_0500 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201);
          } else {
            expect(Number(err.code)).assertEqual(6800101);
            done();
          }
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETSTATUS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETSTATUS_STATIC_0100
     * @tc.desc   getStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETSTATUS_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          if (audioLoopBack != null) {
            let res = await audioLoopBack.getStatus();
            expect(res).assertEqual(-2);
          } else {
            expect(false).assertTrue();
          }
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETSTATUS_0100 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ENABLE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ENABLE_STATIC_0500
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ENABLE_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.info('audio loopback status is: UNAVAILABLE_DEVICE');
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.info('audio loopback status is: UNAVAILABLE_SCENE');
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.info('audio loopback status is: AVAILABLE_IDLE');
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.info('audio loopback status is: AVAILABLE_RUNNING');
            }
          });
          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 audio loopback enable success`);
            } else {
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 audio loopback enable fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 audio loopback enable success`);
            } else {
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 audio loopback enable fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100
     * @tc.desc   getReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100 audio loopback enable success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100 audio loopback enable fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100 equalizer: ${reverb}`);
          expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.THEATER);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100 audio loopback enable success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100 audio loopback enable fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREVERBPRESET_STATIC_0100 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100
     * @tc.desc   getEqualizerPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let equalizer: audio.AudioLoopbackEqualizerPreset = audioLoopback!.getEqualizerPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100 equalizer: ${equalizer}`);
          expect(equalizer).assertEqual(audio.AudioLoopbackEqualizerPreset.FULL);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETEQUALIZERPRESET_STATIC_0100 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.ORIGINAL);
          expect(res).assertTrue();
          let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100 reverb: ${reverb}`);
          expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.ORIGINAL);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0100 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.KTV);
          expect(res).assertTrue();
          let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200 reverb: ${reverb}`);
          expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.KTV);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0200 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.THEATER);
          expect(res).assertTrue();
          let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300 reverb: ${reverb}`);
          expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.THEATER);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0300 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.CONCERT);
          expect(res).assertTrue();
          let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400 reverb: ${reverb}`);
          expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.CONCERT);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0400 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          for (let i = 0; i < 2000; ++i) {
            let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.ORIGINAL);
            expect(res).assertTrue();
            let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010 reverb: ${reverb}`);
            expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.ORIGINAL);
          }

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0010 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          for (let i = 0; i < 2000; ++i) {
            let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.KTV);
            expect(res).assertTrue();
            let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011 reverb: ${reverb}`);
            expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.KTV);
          }

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0011 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          for (let i = 0; i < 2000; ++i) {
            let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.THEATER);
            expect(res).assertTrue();
            let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012 reverb: ${reverb}`);
            expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.THEATER);
          }

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0012 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          for (let i = 0; i < 2000; ++i) {
            let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.CONCERT);
            expect(res).assertTrue();
            let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013 reverb: ${reverb}`);
            expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.CONCERT);
          }

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0013 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014
     * @tc.desc   setReverbPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          for (let i = 0; i < 2000; ++i) {
            let res: boolean = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.ORIGINAL);
            expect(res).assertTrue();
            let reverb: audio.AudioLoopbackReverbPreset = audioLoopback!.getReverbPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 reverb: ${reverb}`);
            expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.ORIGINAL);

            res = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.KTV);
            expect(res).assertTrue();
            reverb = audioLoopback!.getReverbPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 reverb: ${reverb}`);
            expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.KTV);

            res = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.THEATER);
            expect(res).assertTrue();
            reverb = audioLoopback!.getReverbPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 reverb: ${reverb}`);
            expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.THEATER);

            res = audioLoopback!.setReverbPreset(audio.AudioLoopbackReverbPreset.CONCERT);
            expect(res).assertTrue();
            reverb = audioLoopback!.getReverbPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 reverb: ${reverb}`);
            expect(reverb).assertEqual(audio.AudioLoopbackReverbPreset.CONCERT);
          }

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETREVERBPRESET_STATIC_0014 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100
     * @tc.desc   setEqualizerPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let res: boolean = audioLoopback!.setEqualizerPreset(audio.AudioLoopbackEqualizerPreset.FLAT);
          expect(res).assertTrue();
          let eaualizer: audio.AudioLoopbackEqualizerPreset = audioLoopback!.getEqualizerPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100 eaualizer: ${eaualizer}`);
          expect(eaualizer).assertEqual(audio.AudioLoopbackEqualizerPreset.FLAT);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0100 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200
     * @tc.desc   setEqualizerPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let res: boolean = audioLoopback!.setEqualizerPreset(audio.AudioLoopbackEqualizerPreset.FULL);
          expect(res).assertTrue();
          let eaualizer: audio.AudioLoopbackEqualizerPreset = audioLoopback!.getEqualizerPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200 eaualizer: ${eaualizer}`);
          expect(eaualizer).assertEqual(audio.AudioLoopbackEqualizerPreset.FULL);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0200 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300
     * @tc.desc   setEqualizerPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          let res: boolean = audioLoopback!.setEqualizerPreset(audio.AudioLoopbackEqualizerPreset.BRIGHT);
          expect(res).assertTrue();
          let eaualizer: audio.AudioLoopbackEqualizerPreset = audioLoopback!.getEqualizerPreset();
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300 eaualizer: ${eaualizer}`);
          expect(eaualizer).assertEqual(audio.AudioLoopbackEqualizerPreset.BRIGHT);

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0300 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010
     * @tc.desc   setEqualizerPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          for (let i = 0; i < 2000; ++i) {
            let res: boolean = audioLoopback!.setEqualizerPreset(audio.AudioLoopbackEqualizerPreset.FLAT);
            expect(res).assertTrue();
            let eaualizer: audio.AudioLoopbackEqualizerPreset = audioLoopback!.getEqualizerPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010 eaualizer: ${eaualizer}`);
            expect(eaualizer).assertEqual(audio.AudioLoopbackEqualizerPreset.FLAT);
          }

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0010 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011
     * @tc.desc   setEqualizerPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          for (let i = 0; i < 2000; ++i) {
            let res: boolean = audioLoopback!.setEqualizerPreset(audio.AudioLoopbackEqualizerPreset.BRIGHT);
            expect(res).assertTrue();
            let eaualizer: audio.AudioLoopbackEqualizerPreset = audioLoopback!.getEqualizerPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011 eaualizer: ${eaualizer}`);
            expect(eaualizer).assertEqual(audio.AudioLoopbackEqualizerPreset.BRIGHT);
          }

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0011 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012
     * @tc.desc   setEqualizerPreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);

          audioLoopback?.onStatusChange((status: audio.AudioLoopbackStatus) => {
            if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_DEVICE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE);
            } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
              console.error(`${TAG} audio loopback status is: UNAVAILABLE_SCENE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.UNAVAILABLE_SCENE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_IDLE`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_IDLE);
            } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
              console.error(`${TAG} audio loopback status is: AVAILABLE_RUNNING`);
              expect(status).assertEqual(audio.AudioLoopbackStatus.AVAILABLE_RUNNING);
            }
          });

          audioLoopback?.enable(true).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 audio loopback enable true success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 audio loopback enable true fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          for (let i = 0; i < 2000; ++i) {
            let res: boolean = audioLoopback!.setEqualizerPreset(audio.AudioLoopbackEqualizerPreset.FLAT);
            expect(res).assertTrue();
            let eaualizer: audio.AudioLoopbackEqualizerPreset = audioLoopback!.getEqualizerPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 eaualizer: ${eaualizer}`);
            expect(eaualizer).assertEqual(audio.AudioLoopbackEqualizerPreset.FLAT);

            res = audioLoopback!.setEqualizerPreset(audio.AudioLoopbackEqualizerPreset.FULL);
            expect(res).assertTrue();
            eaualizer = audioLoopback!.getEqualizerPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 eaualizer: ${eaualizer}`);
            expect(eaualizer).assertEqual(audio.AudioLoopbackEqualizerPreset.FULL);

            res = audioLoopback!.setEqualizerPreset(audio.AudioLoopbackEqualizerPreset.BRIGHT);
            expect(res).assertTrue();
            eaualizer = audioLoopback!.getEqualizerPreset();
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 eaualizer: ${eaualizer}`);
            expect(eaualizer).assertEqual(audio.AudioLoopbackEqualizerPreset.BRIGHT);
          }

          audioLoopback?.enable(false).then((isSuccess) => {
            if (isSuccess) {
              expect(isSuccess).assertEqual(true);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 audio loopback enable false success`);
            } else {
              expect(isSuccess).assertEqual(false);
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 audio loopback enable false fail`);
            }
          }).catch((err: Error) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETEQUALIZERPRESET_STATIC_0012 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_INPUTDEVICE_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_INPUTDEVICE_STATIC_0100
     * @tc.desc    AudioDevicePair inputDevice property normal value test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_INPUTDEVICE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_INPUTDEVICE_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = await audioLoopback!.getSupportedDevicePairs();
            if (devicePairs.length > 0) {
              let firstPair: audio.AudioDevicePair = devicePairs[0];
              expect(Array.isArray(firstPair.inputDevice)).assertTrue();
              expect(firstPair.inputDevice.deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              console.info(`${TAG}: inputDevice.deviceType: ${firstPair.inputDevice.deviceType}`);
            } else {
              console.info(`${TAG}: No device pairs available, test passed`);
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_INPUTDEVICE_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_INPUTDEVICE_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_OUTPUTDEVICE_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_OUTPUTDEVICE_STATIC_0100
     * @tc.desc    AudioDevicePair outputDevice property normal value test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_OUTPUTDEVICE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_OUTPUTDEVICE_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            if (devicePairs.length > 0) {
              let firstPair: audio.AudioDevicePair = devicePairs[0];
              expect(Array.isArray(firstPair.outputDevice)).assertTrue();
              expect(firstPair.outputDevice.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
              console.info(`${TAG}: outputDevice.deviceType: ${firstPair.outputDevice.deviceType}`);
            } else {
              console.info(`${TAG}: No device pairs available, test passed`);
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_OUTPUTDEVICE_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_OUTPUTDEVICE_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_BOTHDEVICES_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_BOTHDEVICES_STATIC_0100
     * @tc.desc    AudioDevicePair both inputDevice and outputDevice properties test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_BOTHDEVICES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_BOTHDEVICES_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            if (devicePairs.length > 0) {
              for (let i = 0; i < devicePairs.length; i++) {
                let pair: audio.AudioDevicePair = devicePairs[i];
                expect(Array.isArray(pair.inputDevice)).assertTrue();
                expect(Array.isArray(pair.outputDevice)).assertTrue();
                expect(pair.inputDevice.deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
                expect(pair.outputDevice.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
                console.info(`${TAG}: Pair ${i}: inputDevice=${pair.inputDevice.deviceType}, outputDevice=${pair.outputDevice.deviceType}`);
              }
            } else {
              console.info(`${TAG}: No device pairs available, test passed`);
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_BOTHDEVICES_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_DEVICEPAIR_BOTHDEVICES_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0100
     * @tc.desc    AudioLoopback getVolume method normal value test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            await audioLoopback!.enable(true);
            let volume: number = await audioLoopback!.getVolume();
            expect(typeof volume).assertEqual('number');
            expect(volume).assertLargerOrEqual(0.0);
            expect(volume).assertLessOrEqual(1.0);
            console.info(`${TAG}: getVolume success, volume: ${volume}`);
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0200
     * @tc.desc    AudioLoopback getVolume method return value type test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0200 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            await audioLoopback!.enable(true);
            let volume: number = await audioLoopback!.getVolume();
            console.info(`${TAG}: getVolume return type is number: ${typeof volume}`);
            expect(typeof volume).assertEqual('number');
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0200 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_STATIC_0200 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BOUNDARY_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BOUNDARY_STATIC_0100
     * @tc.desc    AudioLoopback setVolume outside test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BOUNDARY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BOUNDARY_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            await audioLoopback!.enable(true);
            await audioLoopback!.setVolume(1.5);
            let volume: number = await audioLoopback!.getVolume();
            expect(volume).assertEqual(1.5);
            console.info(`${TAG}: setVolume(1.5) then getVolume: ${volume}`);
    
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BOUNDARY_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BOUNDARY_STATIC_0100 error: ${error.code}, ${error.message}`);
            if (6800101 == Number(err.code)) {
              expect(Number(err.code)).assertEqual(6800101);
              done();
            } else {
              expect(Number(err.code)).assertEqual(6800104);
              done();
            }
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BEFORE_ENABLE_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BEFORE_ENABLE_STATIC_0100
     * @tc.desc    AudioLoopback getVolume method before enable state test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BEFORE_ENABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BEFORE_ENABLE_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let volume: number = await audioLoopback!.getVolume();
            expect(typeof volume).assertEqual('number');
            expect(volume).assertLargerOrEqual(0.0);
            expect(volume).assertLessOrEqual(1.0);
            console.info(`${TAG}: getVolume before enable: ${volume}`);
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BEFORE_ENABLE_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETVOLUME_BEFORE_ENABLE_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0100
     * @tc.desc    AudioLoopback getSupportedDevicePairs method normal value test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            expect(Array.isArray(devicePairs)).assertTrue();
            console.info(`${TAG}: getSupportedDevicePairs success, count: ${devicePairs.length}`);
    
            if (devicePairs.length > 0) {
              for (let i = 0; i < devicePairs.length; i++) {
                console.info(`${TAG}: DevicePair ${i}:`);
                console.info(`${TAG}:   inputDevice: ${devicePairs[i].inputDevice.deviceType}`);
                console.info(`${TAG}:   outputDevice: ${devicePairs[i].outputDevice.deviceType}`);
              }
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0200
     * @tc.desc    AudioLoopback getSupportedDevicePairs method return type test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0200 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            expect(Array.isArray(devicePairs)).assertTrue();
            expect(devicePairs.length).assertLargerOrEqual(0);
    
            if (devicePairs.length > 0) {
              for (let pair of devicePairs) {
                expect(pair).assertInstanceOf('object');
                expect(pair.inputDevice).assertInstanceOf('object');
                expect(pair.outputDevice).assertInstanceOf('object');
              }
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0200 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_STATIC_0200 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_EMPTY_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_EMPTY_STATIC_0100
     * @tc.desc    AudioLoopback getSupportedDevicePairs method empty array test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_EMPTY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_EMPTY_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = await audioLoopback!.getSupportedDevicePairs();
            if (devicePairs.length === 0) {
              expect(Array.isArray(devicePairs)).assertTrue();
              expect(devicePairs.length).assertEqual(0);
              console.info(`${TAG}: No supported device pairs, empty array returned`);
            } else {
              console.info(`${TAG}: Device pairs available, count: ${devicePairs.length}`);
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_EMPTY_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_EMPTY_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_MULTIPLE_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_MULTIPLE_STATIC_0100
     * @tc.desc    AudioLoopback getSupportedDevicePairs method multiple pairs test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_MULTIPLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_MULTIPLE_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            if (devicePairs.length > 1) {
              for (let i = 0; i < devicePairs.length; i++) {
                let pair: audio.AudioDevicePair = devicePairs[i];
                expect(pair.inputDevice).assertInstanceOf('array');
                expect(pair.outputDevice).assertInstanceOf('array');
                console.info(`${TAG}: Pair ${i}: input=${pair.inputDevice.deviceType}, output=${pair.outputDevice.deviceType}`);
              }
              console.info(`${TAG}: Multiple device pairs available`);
            } else {
              console.info(`${TAG}: Single or no device pair available`);
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_MULTIPLE_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETSUPPORTEDDEVICEPAIRS_MULTIPLE_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0100
     * @tc.desc    AudioLoopback getPreferredDevicePair method normal value test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let preferredPair: audio.AudioDevicePair | null = audioLoopback!.getPreferredDevicePair();
            if (preferredPair !== null) {
              expect(preferredPair.inputDevice).assertInstanceOf('array');
              expect(preferredPair.outputDevice).assertInstanceOf('array');
              console.info(`${TAG}: Preferred input device: ${preferredPair.inputDevice.deviceType}`);
              console.info(`${TAG}: Preferred output device: ${preferredPair.outputDevice.deviceType}`);
            } else {
              console.info(`${TAG}: No preferred device pair available, returned null`);
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0200
     * @tc.desc    AudioLoopback getPreferredDevicePair method return type test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0200 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
            let preferredPair: audio.AudioDevicePair | null = audioLoopback!.getPreferredDevicePair();
            if (preferredPair !== null) {
              expect(preferredPair).assertInstanceOf('object');
              expect(preferredPair.inputDevice).assertInstanceOf('object');
              expect(preferredPair.outputDevice).assertInstanceOf('object');
              expect(preferredPair.inputDevice.deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(preferredPair.outputDevice.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
            } else {
              expect(preferredPair).assertNull();
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0200 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_STATIC_0200 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_NULL_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_NULL_STATIC_0100
     * @tc.desc    AudioLoopback getPreferredDevicePair method null return test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_NULL_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_NULL_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            let preferredPair: audio.AudioDevicePair | null = audioLoopback!.getPreferredDevicePair();
    
            if (devicePairs.length === 0) {
              expect(preferredPair).assertNull();
              console.info(`${TAG}: No supported device pairs, preferredPair is null`);
            } else {
              if (preferredPair !== null) {
                expect(preferredPair).assertInstanceOf('array');
                console.info(`${TAG}: Preferred pair exists`);
              } else {
                expect(preferredPair).assertNull();
                console.info(`${TAG}: Preferred pair is null despite supported pairs exist`);
              }
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_NULL_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_NULL_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_CONSISTENCY_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_CONSISTENCY_STATIC_0100
     * @tc.desc    AudioLoopback getPreferredDevicePair consistency with getSupportedDevicePairs test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_CONSISTENCY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_CONSISTENCY_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let devicePairs: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            let preferredPair: audio.AudioDevicePair | null = audioLoopback!.getPreferredDevicePair();
    
            if (preferredPair !== null && devicePairs.length > 0) {
              let foundInSupported: boolean = false;
              for (let pair of devicePairs) {
                if (pair.inputDevice.deviceType === preferredPair!.inputDevice.deviceType &&
                  pair.outputDevice.deviceType === preferredPair!.outputDevice.deviceType) {
                  foundInSupported = true;
                  break;
                }
              }
              expect(foundInSupported).assertTrue();
              console.info(`${TAG}: Preferred pair found in supported pairs`);
            } else {
              console.info(`${TAG}: No preferred pair or no supported pairs`);
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_CONSISTENCY_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_CONSISTENCY_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_AFTER_ENABLE_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_AFTER_ENABLE_STATIC_0100
     * @tc.desc    AudioLoopback getPreferredDevicePair after enable state test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_AFTER_ENABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_AFTER_ENABLE_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            let preferredPairBefore: audio.AudioDevicePair | null = audioLoopback!.getPreferredDevicePair();
    
            await audioLoopback!.enable(true);
    
            let preferredPairAfter: audio.AudioDevicePair | null = audioLoopback!.getPreferredDevicePair();
    
            if (preferredPairBefore !== null && preferredPairAfter !== null) {
              console.info(`${TAG}: Before enable: input=${preferredPairBefore.inputDevice.deviceType}`);
              console.info(`${TAG}: After enable: input=${preferredPairAfter.inputDevice.deviceType}`);
            } else {
              console.info(`${TAG}: Preferred pair null before or after enable`);
            }
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_AFTER_ENABLE_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_GETPREFERREDDEVICEPAIR_AFTER_ENABLE_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_LOOPBACK_MULTIPLE_CALLS_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_LOOPBACK_MULTIPLE_CALLS_STATIC_0100
     * @tc.desc    AudioLoopback multiple calls to getVolume, getSupportedDevicePairs, getPreferredDevicePair test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_LOOPBACK_MULTIPLE_CALLS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_MULTIPLE_CALLS_STATIC_0100 start`);
          try {
            let audioLoopback: audio.AudioLoopback | null = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
    
            await audioLoopback!.enable(true);
    
            let volume1: number = await audioLoopback!.getVolume();
            let volume2: number = await audioLoopback!.getVolume();
            expect(volume1).assertEqual(volume2);
            console.info(`${TAG}: Multiple getVolume calls return same value: ${volume1}`);
    
            let pairs1: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            let pairs2: audio.AudioDevicePair[] = audioLoopback!.getSupportedDevicePairs();
            expect(pairs1.length).assertEqual(pairs2.length);
            console.info(`${TAG}: Multiple getSupportedDevicePairs calls return same count: ${pairs1.length}`);
    
            let preferred1: audio.AudioDevicePair | null = audioLoopback!.getPreferredDevicePair();
            let preferred2: audio.AudioDevicePair | null = audioLoopback!.getPreferredDevicePair();
            if (preferred1 !== null && preferred2 !== null) {
              expect(preferred1.inputDevice.deviceType).assertEqual(preferred2.inputDevice.deviceType);
              expect(preferred1.outputDevice.deviceType).assertEqual(preferred2.outputDevice.deviceType);
            } else {
              expect(preferred1 === null && preferred2 === null).assertTrue();
            }
            console.info(`${TAG}: Multiple getPreferredDevicePair calls return consistent results`);
    
            console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_MULTIPLE_CALLS_STATIC_0100 end`);
            done();
          } catch (err) {
            let error = err as BusinessError;
            console.error(`${TAG}: SUB_MULTIMEDIA_AUDIO_LOOPBACK_MULTIPLE_CALLS_STATIC_0100 error: ${error.code}, ${error.message}`);
            expect(error.code).assertEqual(6800104);
            done();
          }
        }
        done();
      });      
  })
}