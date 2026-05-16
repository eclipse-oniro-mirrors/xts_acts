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
        } catch (err: BusinessError) {
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
        } catch (err: BusinessError) {
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
        } catch (err: BusinessError) {
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
        } catch (err: BusinessError) {
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
        } catch (err: BusinessError) {
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
        } catch (err: BusinessError) {
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
        } catch (err: BusinessError) {
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
        } catch (err: BusinessError) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ENABLE_0500 ERROR: ${err}`);
          expect(Number(err.code)).assertEqual(201);
        }
      }
      done();
    })
  })
}