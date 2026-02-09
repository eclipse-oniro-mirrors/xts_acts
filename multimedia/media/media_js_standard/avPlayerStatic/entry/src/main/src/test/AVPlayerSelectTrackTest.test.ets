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

import MediaTestBase from './MediaTestBase.test';
import media from '@ohos.multimedia.media'
import { setSource } from './AVPlayerTestBase.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import { globalThis } from './Util.test';

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
let avFd: media.AVFileDescriptor | undefined;
let avPlayer: media.AVPlayer | undefined;
let audioTrackList: Array<Object> = [];
let selectedTrackList: Array<number> = [];
let selectedTrack: int | undefined;
let currentTrack: int = 0;
let mediaTestBase = new MediaTestBase()

async function getAudioTracks() {
  console.info('case to getTrackDescription');
  await avPlayer!!.getTrackDescription().then((arrayList: Array<media.MediaDescription>) => {
    console.info('case getTrackDescription called!!');
    if (arrayList) {
      console.info('case getTrackDescription is success');
    } else {
      console.info('case getTrackDescription is failed');
      expect().assertFail();
      return undefined;
    }
    console.info('case arrayList.length is  ' + arrayList.length);
    for (let i = 0; i < arrayList.length; i++) {
      console.info('case track_name is  ' + arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_NAME]);
      console.info('case hdr_type is  ' + arrayList[i][media.MediaDescriptionKey.MD_KEY_HDR_TYPE]);
      if (arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE] == 0) {
        audioTrackList.push(arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX] as Object);
      }
    }
  })
  console.info('case audioTrackList is: ' + audioTrackList);
}

async function getCurrentAudioTrack() {
  await avPlayer!!.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
    console.info('getCurrentAudioTrack case getTrackDescription called!!' + JSON.stringify(arrList));
    for (let i = 0; i < arrList.length; i++) {
      console.info('getCurrentAudioTrack case track_name is  ' + arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX]);
      console.info('getCurrentAudioTrack case hdr_type is  ' + arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE]);
      let propertyIndex: number |undefined = new Double(arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX]!.toString())
      let propertyType: number|undefined = new Double(arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE]!.toString())
      if (propertyType == 0 && currentTrack != propertyIndex) {
        currentTrack = propertyIndex!.toInt();
        console.log("currentTrack is " + currentTrack);
        break;
      }
    }
  })
}

async function getCurrentSelectedTrack() {
    avPlayer!!.getSelectedTracks().then((trackList: Array<int>) => {
    if (selectedTrackList) {
      console.info('case getTrackDescription is success');
    } else {
      console.info('case getTrackDescription is failed');
      expect().assertFail();
      return undefined;
    }
    console.info('case trackList.length is  ' + trackList.length);
    for (let i = 0; i < trackList.length; i++) {
      selectedTrackList.push(trackList[i]);
    }
  }).catch(mediaTestBase.catchCallback);
}

async function changeAudioTrack() {
  for (let i = 0; i < audioTrackList.length; i++) {
    if (audioTrackList[i] != currentTrack) {
      selectedTrack = audioTrackList[i] as int;
      console.info('case new audio track is:' + selectedTrack);
      break;
    } else {
      continue;
    }
  }
}

async function resetAndCallbackOff() {
  console.info('case now stopped, to reset');
  await avPlayer!!.reset().then(() => {
    console.info('case reset AVPlayer success');
  }).catch(mediaTestBase.catchCallback);
  avPlayer!!.offStateChange();
  avPlayer!!.offTrackChange();
  avPlayer!!.offError();
  avPlayer!!.offEndOfStream();
  console.info('case now stopped, to release');
  await avPlayer!!.release().then(() => {
    console.info('case release AVPlayer success');
  }).catch(mediaTestBase.catchCallback);
}

async function handleState(state: string, preparedOp: () => Promise<void>, playedOp: () => Promise<void>, stoppedOp: () => Promise<void>) {
  switch (state) {
    case INITIALIZED:
      expect(avPlayer!!.state).assertEqual(INITIALIZED);
      let surfaceID: string = globalThis.value;
      avPlayer!!.surfaceId = surfaceID;
      console.info(`case avPlayer.surfaceId is ${avPlayer!!.surfaceId}`);
      await avPlayer!!.prepare().then(() => {
        console.info('case prepare called');
      }).catch(mediaTestBase.catchCallback);
      break;
    case PREPARED:
      expect(avPlayer!!.state).assertEqual(PREPARED);
      expect(avPlayer!!.currentTime).assertEqual(0);
      await preparedOp();
      console.info('case to play AVPlayer');
      await avPlayer!!.play().then(() => {
        console.info('case play AVPlayer success');
      }).catch(mediaTestBase.catchCallback);
      break;
    case PLAYING:
      expect(avPlayer!!.state).assertEqual(PLAYING);
      await playedOp();
      if (!avPlayer!!.loop) {
        await avPlayer!!.stop().then(() => {
          console.info('case stop AVPlayer success');
        }).catch(mediaTestBase.catchCallback);
      } else {
        console.log("avPlayer.loop is true")
      }
      break;
    case STOPPED:
      expect(avPlayer!!.state).assertEqual(STOPPED);
      await stoppedOp();
      break;
    case ERROR:
      expect(avPlayer!!.state).assertEqual(ERROR);
      expect().assertFail();
      avPlayer!!.release().then(() => {
        console.info('case release AVPlayer success');
      }).catch(mediaTestBase.catchCallback);
      break;
    default:
      break;
  }
}

async function testChangeTrack(fd: media.AVFileDescriptor, preparedOp: () => Promise<void>, playedOp: () => Promise<void>,
  stoppedOp: () => Promise<void>, extraOp?: () => Promise<void> | undefined, done?: () => void) {
  console.info(`case media source: ${fd}`)
  await media.createAVPlayer().then((video: media.AVPlayer | undefined) => {
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
    } else {
      console.error('case createAVPlayer failed');
      expect().assertFail();
      done?.();
    }
  }).catch(mediaTestBase.catchCallback);

  avPlayer!!.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    await handleState(state, preparedOp, playedOp, stoppedOp);
  });
  avPlayer!!.onTrackChange((index, isSelection) => {
    console.info(`case trackChange called, index is ${index}, isSelection is ${isSelection}`);
  });
  avPlayer!!.onError((err) => {
    console.error(`case error called, errMessage is ${err.message}`);
  });
  avPlayer!!.onEndOfStream(() => {
    if (extraOp) {
      extraOp();
    }
  });
  console.info('case fdsrc test');
  avPlayer!!.fdSrc = fd;
}

function openFileFailed() {
  console.info('case file fail');
}

export default function AVPlayerSelectTrackTest() {
  describe('AVPlayerSelectTrackTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber: number) => {
        avFd = {
          fd: testNumber.toInt()
        }
      });
    });
    beforeEach(async () => {
      console.info('beforeEach case');
      audioTrackList = new Array<Object>();
      selectedTrack = undefined;
    });
    afterEach(async () => {
      if (avPlayer != null) {
        await avPlayer!!.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
      }
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await mediaTestBase.closeFdNumber(avFd!.fd)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_static_0100
     * @tc.desc   test change default audio track
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let preparedOperation = async () => {
        await getAudioTracks();
        await getCurrentSelectedTrack();
        await getCurrentAudioTrack();
        avPlayer!!.selectTrack(currentTrack);
        avPlayer!!.deselectTrack(currentTrack);
        console.log("preparedOperation currentTrack is " + currentTrack + " ;selectedTrack is " + selectedTrack)
        expect(currentTrack != selectedTrack).assertTrue();
      }

      let playedOperation = async () => {
        await changeAudioTrack();
        avPlayer!!.selectTrack(selectedTrack as int, media.SwitchMode.SEGMENT);
        await getCurrentAudioTrack();
        console.log("playedOperation currentTrack is " + currentTrack + " ;selectedTrack is " + selectedTrack)
        expect(currentTrack).assertEqual(selectedTrack);
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }
      await testChangeTrack(avFd!, preparedOperation, playedOperation, stoppedOperation, undefined , done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_static_0200
     * @tc.desc   test change default audio track
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {

      let preparedOperation = async () => {
        await getAudioTracks();
        await getCurrentSelectedTrack();
        await getCurrentAudioTrack();
        avPlayer!!.selectTrack(currentTrack, media.SwitchMode.SMOOTH);
        avPlayer!!.deselectTrack(currentTrack);
        expect(currentTrack != selectedTrack).assertTrue();
      }

      let playedOperation = async () => {
        await changeAudioTrack();
        avPlayer!!.selectTrack(selectedTrack as int, media.SwitchMode.CLOSEST);
        await getCurrentAudioTrack();
        expect(currentTrack).assertEqual(selectedTrack);
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }

      await testChangeTrack(avFd!, preparedOperation, playedOperation, stoppedOperation, undefined, done);
    });
  })
}