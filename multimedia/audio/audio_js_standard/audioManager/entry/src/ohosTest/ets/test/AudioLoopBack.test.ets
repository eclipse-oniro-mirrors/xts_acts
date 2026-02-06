/**
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import { Driver } from '@ohos.UiTest';



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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_JS_0100
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0100
     * @tc.desc      : isAudioLoopbackSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0100", Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(-1);
        expect(ret).assertFalse();
      } catch (err) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0100 ERROR: ${err}`);
        expect(Number(err.code)).assertEqual(6800101)
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_JS_0200
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0200
     * @tc.desc      : isAudioLoopbackSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0200", Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(null);
        expect(ret).assertFalse();
      } catch (err) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0200 ERROR: ${err}`);
        expect(Number(err.code)).assertEqual(401)
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_JS_0300
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0300
     * @tc.desc      : isAudioLoopbackSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0300", Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(undefined);
        expect(ret).assertFalse();
      } catch (err) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ISAUDIOLOOPBACKSUPPORTED_0300 ERROR: ${err}`);
        expect(Number(err.code)).assertEqual(401)
      }
    })

	  /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_JS_0100
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_0100
     * @tc.desc      : createAudioLoopback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_0100", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          if (null == audioLoopBack) {
            expect().assertFail();
          }
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_0100 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201)
          } else {
            expect().assertFail();
          }
        }
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_JS_0200
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_0200
     * @tc.desc      : createAudioLoopback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_0200", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          await audio.createAudioLoopback(-1);
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_CREATEAUDIOLOOPBACK_0200 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(6800101);
        }
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETVOLUME_JS_0100
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SETVOLUME_0100
     * @tc.desc      : createAudioLoopback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_0100", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack.setVolume(0);
        } catch(err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_0100 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201)
          } else {
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETVOLUME_JS_0200
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SETVOLUME_0200
     * @tc.desc      : setVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_0200", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack.setVolume(0.5);
        } catch(err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_0200 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201)
          } else {
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETVOLUME_JS_0300
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SETVOLUME_0300
     * @tc.desc      : setVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_0300", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack.setVolume(1);
        } catch(err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_0300 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201)
          } else {
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETVOLUME_JS_0400
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SETVOLUME_0400
     * @tc.desc      : setVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_0400", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack.setVolume(-0.1);
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_0400 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201);
          } else {
            expect(Number(err.code)).assertEqual(6800101);
          }
        }
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETVOLUME_JS_0500
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SETVOLUME_0500
     * @tc.desc      : setVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_0500", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack.setVolume(1.1);
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_0500 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201);
          } else {
            expect(Number(err.code)).assertEqual(6800101);
          }
        }
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETVOLUME_JS_0600
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SETVOLUME_0600
     * @tc.desc      : setVolume
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETVOLUME_0600", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopBack.setVolume(null);
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SETVOLUME_0600 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201);
          } else {
            expect(Number(err.code)).assertEqual(6800101);
          }
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GETSTATUS_JS_0100
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_GETSTATUS_0100
     * @tc.desc      : getStatus
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETSTATUS_0100", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopBack: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          let res = await audioLoopBack.getStatus();
          await expect(res).assertEqual(-2);
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETSTATUS_0100 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ENABLE_JS_0100
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ENABLE_0100
     * @tc.desc      : enable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_ENABLE_0100", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
            let audioLoopback: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
            expect(null != audioLoopBack);
            audioLoopback.on('statusChange', (status: audio.AudioLoopbackStatus) => {
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
            audioLoopback.enable(undefined).then((isSuccess) => {
            if (isSuccess) {
              console.info('audio loopback enable success');
            } else {
              console.info('audio loopback enable fail');
            }
          }).catch((err: BusinessError) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0100 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(6800101);
          });
          audioLoopback.off('statusChange');
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0100 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ENABLE_JS_0200
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ENABLE_0200
     * @tc.desc      : enable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_ENABLE_0200", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopback.on('statusChange', (status: audio.AudioLoopbackStatus) => {
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
          audioLoopback.enable(null).then((isSuccess) => {
            if (isSuccess) {
              console.info('audio loopback enable success');
            } else {
              console.info('audio loopback enable fail');
            }
          }).catch((err: BusinessError) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0200 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(6800101);
          });
          audioLoopback.off('statusChange');
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0200 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ENABLE_JS_0300
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ENABLE_0300
     * @tc.desc      : enable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_ENABLE_0300", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopback.on('statusChange', undefined)
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0300 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201);
          } else {
            expect(Number(err.code)).assertEqual(401);
          }
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ENABLE_JS_0400
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ENABLE_0400
     * @tc.desc      : enable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_ENABLE_0400", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopback.off('statusChange', undefined);
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0400 ERROR: ${err}`);
          if (201 == err.code) {
            expect(Number(err.code)).assertEqual(201);
          } else {
            expect(Number(err.code)).assertEqual(401);
          }
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ENABLE_JS_0500
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_ENABLE_0500
     * @tc.desc      : enable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_ENABLE_0500", Level.LEVEL2, async () => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          let audioLoopback: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          expect(null != audioLoopBack);
          audioLoopback.on('statusChange', (status: audio.AudioLoopbackStatus) => {
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
          audioLoopback.enable(true).then((isSuccess) => {
            if (isSuccess) {
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 audio loopback enable success`);
            } else {
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 audio loopback enable fail`);
            }
          }).catch((err: BusinessError) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });

          audioLoopback.enable(false).then((isSuccess) => {
            if (isSuccess) {
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 audio loopback enable success`);
            } else {
              console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 audio loopback enable fail`);
            }
          }).catch((err: BusinessError) => {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 ERROR: ${err}`);
            expect(Number(err.code)).assertEqual(201);
          });
        } catch (err) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
    })
  })
}