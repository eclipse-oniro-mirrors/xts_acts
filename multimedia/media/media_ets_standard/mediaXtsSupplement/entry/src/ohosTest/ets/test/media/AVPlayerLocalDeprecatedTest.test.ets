/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'

const TAG = 'xts.AVPlayerLocalDeprecated:';
let currentFd: number | null = null;
let audioPlayer: media.AudioPlayer;
let videoPlayer: media.VideoPlayer;

async function getFdRead(pathName: string): Promise<number> {
  let fdReturn: number = 0;
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const path = testContext.filesDir + "/" + pathName;
  console.log("pathName is " + path)
  await fileio.open(path).then((fdNumber) => {
    fdReturn = fdNumber;
    console.info('[fileio]case open fd success, fd is ' + fdReturn);
  })
  return fdReturn;
}

async function closeFdNumber(fdNumber: number) {
  await fileio.close(fdNumber);
}

async function testVideoTrackDescription(testName: string, videoFileName: string, done: Function,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    videoPlayer = await media.createVideoPlayer();
    if (!videoPlayer) {
      console.error(TAG, testName, 'Failed to create VideoPlayer');
      done();
      return;
    }
    console.info(TAG, testName, 'Succeeded in creating VideoPlayer', JSON.stringify(videoPlayer));
    let rawFileContent = await getFdRead(videoFileName);
    let avFileDescriptor: media.AVFileDescriptor = { fd: rawFileContent };
    videoPlayer.fdSrc = avFileDescriptor;
    await videoPlayer.prepare();
    await videoPlayer.play();
    videoPlayer.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
      if (arrList != null) {
        console.info(TAG, testName, 'Succeeded in doing getTrackDescription', JSON.stringify(arrList));
        callback(arrList);
      } else {
        console.error(TAG, testName, `Failed to do getTrackDescription, error:`,
          JSON.stringify(error), error.code, JSON.stringify(arrList));
        expect().assertFail();
      }
      videoPlayer.release();
      closeFdNumber(rawFileContent);
      done();
    });
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err));
    expect().assertFail();
    videoPlayer?.release();
    done();
  }
}

async function testVideoTrackDescriptionPromise(testName: string, videoFileName: string, done: Function,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    videoPlayer = await media.createVideoPlayer();
    if (!videoPlayer) {
      console.error(TAG, testName, 'Failed to create VideoPlayer');
      done();
      return;
    }
    console.info(TAG, testName, 'Succeeded in creating VideoPlayer', JSON.stringify(videoPlayer));
    let rawFileContent = await getFdRead(videoFileName);
    let avFileDescriptor: media.AVFileDescriptor = { fd: rawFileContent };
    videoPlayer.fdSrc = avFileDescriptor;
    await videoPlayer.prepare();
    await videoPlayer.play();
    videoPlayer.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
      console.info(TAG, testName, 'getTrackDescription success:', JSON.stringify(arrList));
      callback(arrList);
    }).catch((error: BusinessError) => {
      console.error(TAG, testName, `getTrackDescription failed:`, JSON.stringify(error), error.code);
      expect().assertFail();
    }).finally(() => {
      videoPlayer.release();
      closeFdNumber(rawFileContent);
      done();
    });
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err));
    expect().assertFail();
    videoPlayer?.release();
    done();
  }
}

async function testAudioTrackDescriptionOnDataLoad(testName: string, audioFileName: string, done: Function,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    audioPlayer = media.createAudioPlayer();
    if (!audioPlayer) {
      console.error(TAG, testName, 'Failed to create AudioPlayer');
      done();
      return;
    }
    console.info(TAG, testName, 'AudioPlayer created successfully');
    audioPlayer.on('dataLoad', async () => {
      console.info(TAG, testName, 'dataLoad event received');
      audioPlayer.play();
      console.info(TAG, testName, 'Playback started');
      audioPlayer.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
        if (arrList != null) {
          console.info(TAG, testName, 'getTrackDescription success:', JSON.stringify(arrList));
          callback(arrList);
        } else {
          console.error(TAG, testName, 'getTrackDescription failed:', JSON.stringify(error), error?.code);
          expect().assertFail();
        }
        audioPlayer.release();
        closeFdNumber(rawFileContent);
        done();
      });
    });
    const rawFileContent = await getFdRead(audioFileName);
    audioPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, 'Audio source set successfully');
  } catch (err) {
    console.error(TAG, testName, 'Test setup failed:', JSON.stringify(err));
    expect().assertFail();
    audioPlayer?.release();
    done();
  }
}

async function testAudioTrackDescriptionPromise(testName: string, audioFileName: string, done: Function,
  callback: (arrList: Array<media.MediaDescription>) => void) {
  try {
    audioPlayer = media.createAudioPlayer();
    if (!audioPlayer) {
      console.error(TAG, testName, 'Failed to create AudioPlayer');
      done();
      return;
    }
    console.info(TAG, testName, 'AudioPlayer created successfully');
    audioPlayer.on('dataLoad', async () => {
      console.info(TAG, testName, 'dataLoad event received');
      audioPlayer.play();
      console.info(TAG, testName, 'Playback started');
      audioPlayer.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
        console.info(TAG, testName, 'getTrackDescription success:', JSON.stringify(arrList));
        callback(arrList);
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `getTrackDescription failed:`, JSON.stringify(error), error.code);
        expect().assertFail();
      }).finally(() => {
        audioPlayer.release();
        closeFdNumber(rawFileContent);
        done();
      });
    })
    let rawFileContent = await getFdRead(audioFileName);
    audioPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, 'Audio source set successfully');
  } catch (err) {
    console.error(TAG, testName, 'Test setup failed:', JSON.stringify(err));
    expect().assertFail();
    audioPlayer?.release();
    done();
  }
}

export default
function AVPlayerLocalDeprecatedTest() {
  describe('AVPlayerLocalDeprecatedTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      if (currentFd !== null) {
        await closeFdNumber(currentFd);
        currentFd = null;
      }
      if (audioPlayer) {
        audioPlayer.release();
      }
      if (videoPlayer) {
        videoPlayer.release();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_0001';
      await testVideoTrackDescription(
        testName, '1vp9_320x240_30.mp4', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_0002';
      await testVideoTrackDescriptionPromise(
        testName, '1vp9_320x240_30.mp4', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_PLAYING_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_PLAYING_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_PLAYING_0001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_PLAYING_0001';
        await testAudioTrackDescriptionOnDataLoad(
          testName, 'aac_48ksr_16kbr_1ch.aac', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_PLAYING_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_PLAYING_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_PLAYING_0002', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_PLAYING_0002';
        await testAudioTrackDescriptionPromise(
          testName, 'aac_48ksr_16kbr_1ch.aac', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MOV_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MOV_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MOV_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MOV_0001';
      await testVideoTrackDescription(
        testName, 'h263_352x288_30.mov', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MOV_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MOV_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MOV_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MOV_0002';
      await testVideoTrackDescriptionPromise(
        testName, 'h263_352x288_30.mov', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_F4V_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_F4V_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_F4V_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_F4V_0001';
      await testVideoTrackDescription(
        testName, 'h264_720x480_60.f4v', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_F4V_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_F4V_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_F4V_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_F4V_0002';
      await testVideoTrackDescriptionPromise(
        testName, 'h264_720x480_60.f4v', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MKV_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MKV_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MKV_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MKV_0001';
      await testVideoTrackDescription(
        testName, 'libvpx-vp9_1280x720_30.mkv', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MKV_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MKV_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MKV_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_MKV_0002';
      await testVideoTrackDescriptionPromise(
        testName, 'libvpx-vp9_1280x720_30.mkv', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_MP3_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_MP3_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_MP3_0001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_MP3_0001';
        await testAudioTrackDescriptionOnDataLoad(
          testName, 'MP3_48000_32_1.mp3', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_MP3_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_MP3_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_MP3_0002', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_MP3_0002';
        await testAudioTrackDescriptionPromise(
          testName, 'MP3_48000_32_1.mp3', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_ARM_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_ARM_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_ARM_0001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_ARM_0001';
        await testAudioTrackDescriptionOnDataLoad(
          testName, 'amrnb_4.75k_8000.amr', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_ARM_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_ARM_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_ARM_0002', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_ARM_0002';
        await testAudioTrackDescriptionPromise(
          testName, 'amrnb_4.75k_8000.amr', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_WAV_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_WAV_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_WAV_0001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_WAV_0001';
        await testAudioTrackDescriptionOnDataLoad(
          testName, 'pcm_48ksr_16kbr_1ch.wav', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_WAV_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_WAV_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_WAV_0002', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_WAV_0002';
        await testAudioTrackDescriptionPromise(
          testName, 'pcm_48ksr_16kbr_1ch.wav', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0001';
        await testAudioTrackDescriptionOnDataLoad(
          testName, 'flac_48ksr_16kbr_1ch.flac', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0002', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_FLAC_0002';
        await testAudioTrackDescriptionPromise(
          testName, 'flac_48ksr_16kbr_1ch.flac', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_OGG_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_OGG_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_OGG_0001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_OGG_0001';
        await testAudioTrackDescriptionOnDataLoad(
          testName, 'OGG_48000_1.ogg', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_OGG_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_OGG_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_OGG_0002', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_GET_TRACK_DESCRIPTION_OGG_0002';
        await testAudioTrackDescriptionPromise(
          testName, 'OGG_48000_1.ogg', done, (arrList) => {
          expect(arrList.length > 0).assertTrue();
        });
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3GP_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3GP_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3GP_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3GP_0001';
      await testVideoTrackDescription(
        testName, '1h264_320x240_60.3gp', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3GP_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3GP_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3GP_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3GP_0002';
      await testVideoTrackDescriptionPromise(
        testName, '1h264_320x240_60.3gp', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });


    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3G2_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3G2_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3G2_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3G2_0001';
      await testVideoTrackDescription(
        testName, '1h264_720x480_30.3g2', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3G2_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3G2_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3G2_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_3G2_0002';
      await testVideoTrackDescriptionPromise(
        testName, '1h264_720x480_30.3g2', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_AVI_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_AVI_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_AVI_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_AVI_0001';
      await testVideoTrackDescription(
        testName, 'audio_2video.avi', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_AVI_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_AVI_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_AVI_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_AVI_0002';
      await testVideoTrackDescriptionPromise(
        testName, 'audio_2video.avi', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_TS_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_TS_0001
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_TS_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_TS_0001';
      await testVideoTrackDescription(
        testName, 'mpeg4_mp3_480p_25r.ts', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_TS_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_TS_0002
     * @tc.desc   AudioPlayer_getTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_TS_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GET_TRACK_DESCRIPTION_TS_0002';
      await testVideoTrackDescriptionPromise(
        testName, 'mpeg4_mp3_480p_25r.ts', done, (arrList) => {
        expect(arrList.length > 0).assertTrue();
      });
    });
  });
}
