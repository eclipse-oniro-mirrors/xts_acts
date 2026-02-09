/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import MediaTestBase from './MediaTestBase';
import media from '@ohos.multimedia.media'
import { setSource } from './AVPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

const VIDEO_SOURCE = 'H264_AAC_AAC_multiAudio.mp4';
const PLAY_TIME = 3000;
const LOOPCNT = 2;
const NOAUDIOTRACK = -1;
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';
let avFd: media.AVFileDescriptor;
let avPlayer: media.AVPlayer;
let audioTrackList: Array<Object> = [];
let selectedTrackList: Array<number> = [];
let selectedTrack: number | undefined;
let currentTrack: number = 0;
let mediaTestBase = new MediaTestBase()

async function getAudioTracks() {
  console.info('case to getTrackDescription');
  await avPlayer.getTrackDescription().then((arrayList) => {
    console.info('case getTrackDescription called!!');
    if (typeof (arrayList) == 'undefined') {
      console.info('case getTrackDescription is failed');
      expect().assertFail();
      return;
    }
    console.info('case arrayList.length is  ' + arrayList.length);
    for (let i = 0; i < arrayList.length; i++) {
      console.info('case track_name is  ' + arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_NAME]);
      console.info('case hdr_type is  ' + arrayList[i][media.MediaDescriptionKey.MD_KEY_HDR_TYPE]);
      if (arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE] == 0) {
        audioTrackList.push(arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX]);
      }
    }
  })
  console.info('case audioTrackList is: ' + audioTrackList);
}

async function getCurrentAudioTrack() {
  await avPlayer.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
    for (let i = 0; i < arrList.length; i++) {
      let propertyIndex: Object = arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX]
      let propertyType: Object = arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE]
      if (propertyType == 0 && currentTrack != propertyIndex as number) {
        currentTrack = propertyIndex as number;
        console.log("currentTrack is " + currentTrack);
        break;
      }
    }
  })
}

async function getCurrentSelectedTrack() {
  await avPlayer.getSelectedTracks().then((trackList) => {
    if (typeof (selectedTrackList) == 'undefined') {
      console.info('case getTrackDescription is failed');
      expect().assertFail();
      return;
    }
    console.info('case trackList.length is  ' + trackList.length);
    for (let i = 0; i < trackList.length; i++) {
      selectedTrackList.push(trackList[i]);
    }
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function changeAudioTrack() {
  for (let i = 0; i < audioTrackList.length; i++) {
    if (audioTrackList[i] != currentTrack) {
      selectedTrack = audioTrackList[i] as number;
      console.info('case new audio track is:' + selectedTrack);
      break;
    } else {
      continue;
    }
  }
}

async function resetAndCallbackOff() {
  console.info('case now stopped, to reset');
  await avPlayer.reset().then(() => {
    console.info('case reset AVPlayer success');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  avPlayer.off('stateChange');
  avPlayer.off('trackChange');
  avPlayer.off('error');
  avPlayer.off('endOfStream');
  console.info('case now stopped, to release');
  await avPlayer.release().then(() => {
    console.info('case release AVPlayer success');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function handleState(state: string, preparedOp: Function, playedOp: Function, stoppedOp: Function) {
  switch (state) {
    case INITIALIZED:
      expect(avPlayer.state).assertEqual(INITIALIZED);
      let surfaceID: string = globalThis.value;
      avPlayer.surfaceId = surfaceID;
      console.info(`case avPlayer.surfaceId is ${avPlayer.surfaceId}`);
      await avPlayer.prepare().then(() => {
        console.info('case prepare called');
        let playbackPosition: number = avPlayer.getPlaybackPosition()
        console.info(`AVPlayer getPlaybackPosition== ${playbackPosition}`)
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    case PREPARED:
      expect(avPlayer.state).assertEqual(PREPARED);
      expect(avPlayer.currentTime).assertEqual(0);
      await preparedOp();
      console.info('case to play AVPlayer');
      await avPlayer.play().then(() => {
        console.info('case play AVPlayer success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    case PLAYING:
      expect(avPlayer.state).assertEqual(PLAYING);
      await mediaTestBase.msleepAsync(PLAY_TIME);
      await playedOp();
      if (!avPlayer.loop) {
        await avPlayer.stop().then(() => {
          console.info('case stop AVPlayer success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      } else {
        console.log("avPlayer.loop is true")
      }
      break;
    case STOPPED:
      expect(avPlayer.state).assertEqual(STOPPED);
      await stoppedOp();
      break;
    case ERROR:
      expect(avPlayer.state).assertEqual(ERROR);
      expect().assertFail();
      avPlayer.release().then(() => {
        console.info('case release AVPlayer success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    default:
      break;
  }
}

async function testChangeTrack(fd: media.AVFileDescriptor, preparedOp: Function, playedOp: Function,
  stoppedOp: Function, extraOp: Function | undefined, done: Function) {
  console.info(`case media source: ${fd}`)
  await media.createAVPlayer().then((video) => {
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
    } else {
      console.error('case createAVPlayer failed');
      expect().assertFail();
      done();
    }
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

  avPlayer.on('stateChange', async (state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    await handleState(state, preparedOp, playedOp, stoppedOp);
  });
  avPlayer.on('trackChange', async (index, isSelection) => {
    console.info(`case trackChange called, index is ${index}, isSelection is ${isSelection}`);
  });
  avPlayer.on('error', async (err) => {
    console.error(`case error called, errMessage is ${err.message}`);
  });
  avPlayer.on('endOfStream', async () => {
    if (extraOp) {
      extraOp();
    }
  });
  setSource(avPlayer, fd);
}

async function changeTrackOn(avPlayer: media.AVPlayer, done: Function) {
  let loopTime = 0;
  avPlayer.on('trackInfoUpdate', (info: Array<media.MediaDescription>) => {
    if (info) {
      loopTime++;
      for (let i = 0; i < info.length; i++) {
        let propertyIndex: Object = info[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX];
        let propertyType: Object = info[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE];
        console.info('track info: index=' + propertyIndex + ' tracktype=' + propertyType)
        avPlayer.off('trackInfoUpdate');
        expect(loopTime).assertEqual(1);
        done();
      }
    } else {
      console.info('track info is null');
      expect(false).assertTrue();
      done();
    }
  });
}

async function testChangeTrackListening(fd: media.AVFileDescriptor, preparedOp: Function, playedOp: Function,
  stoppedOp: Function, extraOp: Function | undefined, changeTrackListening: Function, done: Function) {
  console.info(`case media source: ${fd}`)
  await media.createAVPlayer().then((video) => {
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
    } else {
      console.error('case createAVPlayer failed');
      expect().assertFail();
      done();
    }
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  changeTrackListening(avPlayer,done);
  avPlayer.on('stateChange', async (state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    await handleState(state, preparedOp, playedOp, stoppedOp);
  });
  avPlayer.on('trackChange', async (index, isSelection) => {
    console.info(`case trackChange called, index is ${index}, isSelection is ${isSelection}`);
  });
  avPlayer.on('error', async (err) => {
    console.error(`case error called, errMessage is ${err.message}`);
  });
  avPlayer.on('endOfStream', async () => {
    if (extraOp) {
      extraOp();
    }
  });
  setSource(avPlayer, fd);
}

function openFileFailed() {
  console.info('case file fail');
}

export default function AVPlayerSelectTrackTest() {
  describe('AVPlayerSelectTrackTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber) => {
        avFd = {
          fd: testNumber
        }
      });
    });
    beforeEach(async () => {
      console.info('beforeEach case');
      audioTrackList = new Array();
      selectedTrack = undefined;
    });
    afterEach(async () => {
      if (avPlayer != null) {
        await avPlayer.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await mediaTestBase.closeFdNumber(avFd.fd)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0100
     * @tc.desc   test change default audio track
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let preparedOperation = async () => {
        await getAudioTracks();
        await getCurrentSelectedTrack();
        await getCurrentAudioTrack();
        avPlayer.selectTrack(currentTrack);
        await mediaTestBase.msleepAsync(2000);
        avPlayer.deselectTrack(currentTrack);
        console.log("preparedOperation currentTrack is " + currentTrack + " ;selectedTrack is " + selectedTrack)
        expect(currentTrack != selectedTrack).assertTrue();
      }

      let playedOperation = async () => {
        await changeAudioTrack();
        avPlayer.selectTrack(selectedTrack, media.SwitchMode.SEGMENT);
        await mediaTestBase.msleepAsync(2000);
        await getCurrentAudioTrack();
        console.log("playedOperation currentTrack is " + currentTrack + " ;selectedTrack is " + selectedTrack)
        expect(currentTrack).assertEqual(selectedTrack);
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }

      await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, undefined, done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0200
     * @tc.desc   test change default audio track
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let preparedOperation = async () => {
        await getAudioTracks();
        await getCurrentSelectedTrack();
        await getCurrentAudioTrack();
        avPlayer.selectTrack(currentTrack, media.SwitchMode.SMOOTH);
        await mediaTestBase.msleepAsync(2000);
        avPlayer.deselectTrack(currentTrack);
        expect(currentTrack != selectedTrack).assertTrue();
      }

      let playedOperation = async () => {
        await changeAudioTrack();
        avPlayer.selectTrack(selectedTrack, media.SwitchMode.CLOSEST);
        await mediaTestBase.msleepAsync(2000);
        await getCurrentAudioTrack();
        expect(currentTrack).assertEqual(selectedTrack);
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }

      await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, undefined, done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_ON_0000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_ON_0000
     * @tc.desc   test change default audio track
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_ON_0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_ON_0000 called');
      let preparedOperation = async () => {
        await getAudioTracks();
        await getCurrentSelectedTrack();
        await getCurrentAudioTrack();
        avPlayer.selectTrack(currentTrack);
        await mediaTestBase.msleepAsync(2000);
        avPlayer.deselectTrack(currentTrack);
        console.log("preparedOperation currentTrack is " + currentTrack + " ;selectedTrack is " + selectedTrack)
        expect(currentTrack != selectedTrack).assertTrue();
      }

      let playedOperation = async () => {
        await changeAudioTrack();
        avPlayer.selectTrack(selectedTrack, media.SwitchMode.SEGMENT);
        await mediaTestBase.msleepAsync(2000);
        await getCurrentAudioTrack();
        console.log("playedOperation currentTrack is " + currentTrack + " ;selectedTrack is " + selectedTrack)
        expect(currentTrack).assertEqual(selectedTrack);
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }

      await testChangeTrackListening(avFd, preparedOperation, playedOperation, stoppedOperation, undefined,changeTrackOn, done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0300
     * @tc.desc   test change default audio track
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0300', Level.LEVEL0, async (done: Function) => {
      await media.createAVPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          console.info('case createAVPlayer success');
          avPlayer = video;
        } else {
          console.error('case createAVPlayer failed');
          expect().assertFail();
          done();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      try {
        avPlayer.on('error', async (err) => {
          console.error(`case avPlayer.deselectTrack error called, errMessage is ${err.message}`);
          console.info('avPlayer.deselectTrack 5400102 error code is' + err.code)
          expect(err.code).assertEqual(5400102)
          avPlayer.off('error')
        });
        avPlayer.deselectTrack(currentTrack);
      } catch (err) {
        console.error(`case SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0300 errMessage is ${err.message}`);
        console.info('case SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0300 error code is' + err.code)
      }
      done();
    });
  })
}