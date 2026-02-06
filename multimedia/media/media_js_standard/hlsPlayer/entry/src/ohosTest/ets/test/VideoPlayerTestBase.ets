/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import MediaTestBase from './MediaTestBase';
import { expect } from '@ohos/hypium'

async function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export async function playVideoSource(url: string, width: number | null, height: number | null, duration: number,
  playTime: number, done: Function) {
  console.info(`case media source url: ${url}`)
  let videoPlayer: media.AVPlayer = await media.createAVPlayer();
  let surfaceID: string = globalThis.value;
  console.info(`case setAVPlayerFunCb in, surfaceID is ${surfaceID}`);

  videoPlayer!.on('videoSizeChange', (w, h) => {
    console.info('case videoSizeChanged  width: ' + w + ' height: ' + h);
  });

  videoPlayer!.on('error', (err) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    videoPlayer!.release();
    done();
  });
  videoPlayer!.url = url;
  console.info("videoPlayer!.url = url")
  await sleep(200)
  videoPlayer.surfaceId = surfaceID
  await sleep(200);
  await videoPlayer!.getTrackDescription().then((arrayList) => {
    console.info('case getTrackDescription called');
    if (typeof (arrayList) != 'undefined') {
      for (let i = 0; i < arrayList.length; i++) {
        MediaTestBase.printDescription(arrayList[i]);
      }
    } else {
      console.error('case getTrackDescription failed');
      expect().assertFail();
    }
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  let startTime = videoPlayer!.currentTime;
  await videoPlayer!.play().then(async () => {
    console.info('case play called');
    expect(videoPlayer!.state).assertEqual('playing');
    await MediaTestBase.msleepAsync(playTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  let endTime = videoPlayer!.currentTime;
  expect(Math.abs(endTime - startTime - playTime)).assertLess(1000);
  await sleep(200);

  videoPlayer!.seek(videoPlayer!.duration / 3)
  expect(videoPlayer!.state).assertEqual('playing');
  await MediaTestBase.msleepAsync(playTime);
  await sleep(200);

  await videoPlayer!.pause().then(() => {
    console.info('case pause called');
    expect(videoPlayer!.state).assertEqual('paused');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);


  videoPlayer.loop = true;
  videoPlayer!.seek(0, media.SeekMode.SEEK_NEXT_SYNC)
  expect(videoPlayer!.state).assertEqual('paused');
  await sleep(200);

  await videoPlayer!.play().then(async () => {
    console.info('case play called');
    expect(videoPlayer!.state).assertEqual('playing');
    await MediaTestBase.msleepAsync(playTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  videoPlayer!.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X)
  await MediaTestBase.msleepAsync(playTime);
  await sleep(200);

  videoPlayer!.setVolume(0.5)
  console.info('case setVolume called');
  await sleep(200);

  videoPlayer!.seek(videoPlayer.duration, media.SeekMode.SEEK_PREV_SYNC)
  await sleep(2000);
  console.info('case seek called, ' + videoPlayer.state);
  videoPlayer!.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
  console.info('case setSpeed called');
  expect(videoPlayer!.state).assertEqual('playing');
  await sleep(200);

  videoPlayer!.loop = false;
  videoPlayer!.seek(videoPlayer!.duration, media.SeekMode.SEEK_NEXT_SYNC)
  if (videoPlayer!.currentTime != 0) {
    await sleep(2000);
    await MediaTestBase.msleepAsync((videoPlayer!.duration - videoPlayer!.currentTime) + playTime);
    expect(videoPlayer!.state).assertEqual('completed');
  }
  await sleep(200);

  await videoPlayer!.play().then(() => {
    console.info('case play called');
    expect(videoPlayer!.state).assertEqual('playing');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  await videoPlayer!.stop().then(() => {
    console.info('case stop called');
    expect(videoPlayer!.state).assertEqual('stopped');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  await videoPlayer!.reset().then(() => {
    console.info('case reset called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  videoPlayer!.url = url;

  await videoPlayer!.prepare().then(() => {
    console.info('case prepare called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  await videoPlayer!.play().then(() => {
    console.info('case play called');
    expect(videoPlayer!.state).assertEqual('playing');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  await videoPlayer!.pause().then(() => {
    console.info('case pause called');
    expect(videoPlayer!.state).assertEqual('paused');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  await videoPlayer!.stop().then(() => {
    console.info('case stop called');
    expect(videoPlayer!.state).assertEqual('stopped');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await sleep(200);

  await videoPlayer!.release().then(() => {
    console.info('case release called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
}

export async function testVideoSeek(url: string, duration: number, playTime: number, done: Function) {
  console.info(`case media source url: ${url}`)
  let videoPlayer: media.VideoPlayer;
  let surfaceID: string = globalThis.value;
  await media.createVideoPlayer().then((video) => {
    if (typeof (video) != 'undefined') {
      console.info('case createVideoPlayer success');
      videoPlayer = video;
    } else {
      console.error('case createVideoPlayer failed');
      expect().assertFail();
      done();
    }
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  videoPlayer!.on('videoSizeChanged', (w, h) => {
    console.info('case videoSizeChanged  width: ' + w + ' height: ' + h);
  });

  videoPlayer!.on('error', (err) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    videoPlayer!.release();
    done();
  });
  videoPlayer!.url = url;
  await videoPlayer!.setDisplaySurface(surfaceID).then(() => {
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.prepare().then(() => {
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.play().then(() => {
    console.info('case play called');
    expect(videoPlayer!.state).assertEqual('playing');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // pause when seeking
  videoPlayer!.seek(videoPlayer!.duration / 3).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  expect(Math.abs(videoPlayer!.duration - duration)).assertLess(500);
  await videoPlayer!.pause().then(() => {
    console.info('case pause called');
    expect(videoPlayer!.state).assertEqual('paused');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // play when seeking
  videoPlayer!.seek(0).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.play().then(async () => {
    console.info('case play called');
    expect(videoPlayer!.state).assertEqual('playing');
    await MediaTestBase.msleepAsync(playTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // setVolume when setSpeeding
  videoPlayer!.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
    console.info('case setSpeed called and speedMode is ' + speedMode);
    expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  expect(Math.abs(videoPlayer!.duration - duration)).assertLess(500);
  await videoPlayer!.setVolume(0.5).then(() => {
    console.info('case setVolume called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // setSpeed when seeking
  videoPlayer!.seek(0, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X).then((speedMode) => {
    console.info('case setSpeed called and speedMode is ' + speedMode);
    expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // seek when pausing
  videoPlayer!.pause().then(() => {
    console.info('case pause called');
    expect(videoPlayer!.state).assertEqual('paused');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.seek(0, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // seek when playing
  videoPlayer!.play().then(() => {
    console.info('case pause called');
    expect(videoPlayer!.state).assertEqual('playing');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.seek(videoPlayer!.duration / 3, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // seek when seeking
  videoPlayer!.seek(videoPlayer!.duration / 3, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.seek(0, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // stop when seeking
  videoPlayer!.seek(videoPlayer!.duration, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.stop().then(() => {
    console.info('case stop called');
    expect(videoPlayer!.state).assertEqual('stopped');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.reset().then(() => {
    console.info('case reset called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  videoPlayer!.url = url;
  await videoPlayer!.prepare().then(() => {
    console.info('case prepare called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.play().then(() => {
    console.info('case play called');
    expect(videoPlayer!.state).assertEqual('playing');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // reset when seeking
  videoPlayer!.seek(videoPlayer!.duration, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
    console.info('case seek called and seekDoneTime is ' + seekDoneTime);
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.reset().then(() => {
    console.info('case reset called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  videoPlayer!.url = url;
  await videoPlayer!.prepare().then(() => {
    console.info('case prepare called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
  await videoPlayer!.play().then(() => {
    console.info('case play called');
    expect(videoPlayer!.state).assertEqual('playing');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

  // release when seeking
  videoPlayer!.seek(videoPlayer!.duration, media.SeekMode.SEEK_PREV_SYNC);
  await videoPlayer!.release().then(() => {
    console.info('case release called');
  }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
}