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
import * as mediaTestBase from './MediaTestBase.js';

export async function playVideoSource(url, width, height, duration, playTime, done) {
    console.info(`case media source url: ${url}`)
    let videoPlayer = null;
    let surfaceID = globalThis.value;
    await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
            console.info('case createVideoPlayer success');
            videoPlayer = video;
        } else {
            console.error('case createVideoPlayer failed');
            expect().assertFail();
            done();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    videoPlayer.on('videoSizeChanged', (w, h) => {
        console.info('case videoSizeChanged  width: ' + w + ' height: ' + h);
    });

    videoPlayer.on('error', (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        videoPlayer.release();
        done();
    });
    videoPlayer.url = url;
    await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        console.info('case setDisplaySurface success, surfaceID: ' + surfaceID);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    

    await videoPlayer.prepare().then(() => {
        console.info('case prepare called');
        expect(Math.abs(videoPlayer.duration - duration)).assertLess(500);
        if (width != null & height != null) {
            expect(videoPlayer.width).assertEqual(width);
            expect(videoPlayer.height).assertEqual(height);
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.getTrackDescription().then((arrayList) => {
        console.info('case getTrackDescription called');
        if (typeof (arrayList) != 'undefined') {
            for (let i = 0; i < arrayList.length; i++) {
                mediaTestBase.printDescription(arrayList[i]);
            }
        } else {
            console.error('case getTrackDescription failed');
            expect().assertFail();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    let startTime = videoPlayer.currentTime;
    await videoPlayer.play().then(() => {
        console.info('case play called');
        expect(videoPlayer.state).assertEqual('playing');
        mediaTestBase.msleep(playTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let endTime = videoPlayer.currentTime;
    expect(Math.abs(endTime - startTime - playTime)).assertLess(1000);

    await videoPlayer.seek(videoPlayer.duration / 3).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
        expect(videoPlayer.state).assertEqual('playing');
        mediaTestBase.msleep(playTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    
    await videoPlayer.pause().then(() => {
        console.info('case pause called');
        expect(videoPlayer.state).assertEqual('paused');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    videoPlayer.loop = true;
    await videoPlayer.seek(0, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('paused');
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.play().then(() => {
        console.info('case play called');
        expect(videoPlayer.state).assertEqual('playing');
        mediaTestBase.msleep(playTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
        console.info('case setSpeed called and speedMode is ' + speedMode);
        mediaTestBase.msleep(playTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.setVolume(0.5).then(() => {
        console.info('case setVolume called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.seek(videoPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
        mediaTestBase.msleep(videoPlayer.duration - seekDoneTime);
        videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
        expect(videoPlayer.state).assertEqual('playing');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    videoPlayer.loop = false;
    await videoPlayer.seek(videoPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
        if (seekDoneTime != 0){
            mediaTestBase.msleep((videoPlayer.duration - seekDoneTime) + playTime);
            expect(videoPlayer.state).assertEqual('stopped');
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.play().then(() => {
        console.info('case play called');
        expect(videoPlayer.state).assertEqual('playing');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.stop().then(() => {
        console.info('case stop called');
        expect(videoPlayer.state).assertEqual('stopped');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.reset().then(() => {
        console.info('case reset called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    videoPlayer.url = url;

    await videoPlayer.prepare().then(() => {
        console.info('case prepare called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.play().then(() => {
        console.info('case play called');
        expect(videoPlayer.state).assertEqual('playing');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.pause().then(() => {
        console.info('case pause called');
        expect(videoPlayer.state).assertEqual('paused');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.stop().then(() => {
        console.info('case stop called');
        expect(videoPlayer.state).assertEqual('stopped');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.release().then(() => {
        console.info('case release called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

export async function testVideoSeek(url, duration, playTime, done) {
    console.info(`case media source url: ${url}`)
    let videoPlayer = null;
    let surfaceID = globalThis.value;
    await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
            console.info('case createVideoPlayer success');
            videoPlayer = video;
        } else {
            console.error('case createVideoPlayer failed');
            expect().assertFail();
            done();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    videoPlayer.on('videoSizeChanged', (w, h) => {
        console.info('case videoSizeChanged  width: ' + w + ' height: ' + h);
    });

    videoPlayer.on('error', (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        videoPlayer.release();
        done();
    });
    videoPlayer.url = url;
    await videoPlayer.setDisplaySurface(surfaceID).then(() => {
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.prepare().then(() => {}, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.play().then(() => {
        console.info('case play called');
        expect(videoPlayer.state).assertEqual('playing');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    // pause when seeking
    videoPlayer.seek(videoPlayer.duration / 3).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    expect(Math.abs(videoPlayer.duration - duration)).assertLess(500);
    await videoPlayer.pause().then(() => {
        console.info('case pause called');
        expect(videoPlayer.state).assertEqual('paused');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    // play when seeking
    videoPlayer.seek(0).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.play().then(() => {
        console.info('case play called');
        expect(videoPlayer.state).assertEqual('playing');
        mediaTestBase.msleep(playTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    // setVolume when setSpeeding
    videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
        console.info('case setSpeed called and speedMode is ' + speedMode);
        expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    expect(Math.abs(videoPlayer.duration - duration)).assertLess(500);
    await videoPlayer.setVolume(0.5).then(() => {
        console.info('case setVolume called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    // setSpeed when seeking
    videoPlayer.seek(0, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X).then((speedMode) => {
        console.info('case setSpeed called and speedMode is ' + speedMode);
        expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    // seek when pausing
    videoPlayer.pause().then(() => {
        console.info('case pause called');
        expect(videoPlayer.state).assertEqual('paused');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.seek(0, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    // seek when playing
    videoPlayer.play().then(() => {
        console.info('case pause called');
        expect(videoPlayer.state).assertEqual('playing');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.seek(videoPlayer.duration / 3, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    // seek when seeking
    videoPlayer.seek(videoPlayer.duration / 3, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.seek(0, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    // stop when seeking
    videoPlayer.seek(videoPlayer.duration, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.stop().then(() => {
        console.info('case stop called');
        expect(videoPlayer.state).assertEqual('stopped');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.reset().then(() => {
        console.info('case reset called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    videoPlayer.url = url;
    await videoPlayer.prepare().then(() => {
        console.info('case prepare called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.play().then(() => {
        console.info('case play called');
        expect(videoPlayer.state).assertEqual('playing');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    
    // reset when seeking
    videoPlayer.seek(videoPlayer.duration, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        console.info('case seek called and seekDoneTime is ' + seekDoneTime);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.reset().then(() => {
        console.info('case reset called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
   
    videoPlayer.url = url;
    await videoPlayer.prepare().then(() => {
        console.info('case prepare called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await videoPlayer.play().then(() => {
        console.info('case play called');
        expect(videoPlayer.state).assertEqual('playing');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    
    // release when seeking
    videoPlayer.seek(videoPlayer.duration, media.SeekMode.SEEK_PREV_SYNC);
    await videoPlayer.release().then(() => {
        console.info('case release called');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}