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
  })
}