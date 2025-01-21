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

export function playAudioSource(src, duration, playTime, checkSeekTime, done) {
    console.info(`case media source url: ${src}`)
    let volumeChanged = false;
    let playCount = 0;
    let pauseCount = 0;
    let stopCount = 0;
    let seekCount = 0;
    let seekEOS = false;
    let audioPlayer = media.createAudioPlayer();
    if (audioPlayer == null) {
        console.error('case createAudioPlayer failed');
        expect().assertFail();
        done();
    }
    if (typeof (src) == 'string') {
        console.error('case src test');
        audioPlayer.src = src;
    } else {
        console.error('case fdsrc test');
        audioPlayer.fdSrc = src;
    }
    audioPlayer.on('dataLoad', () => {
        console.info('case set source success');
        expect(audioPlayer.state).assertEqual('idle');
        expect(audioPlayer.currentTime).assertEqual(0);
        expect(Math.abs(audioPlayer.duration - duration)).assertLess(500);
        // step 0: dataLoad -> play
        audioPlayer.play();
    });
    audioPlayer.on('play', () => {
        console.info('case start to play');
        expect(audioPlayer.state).assertEqual('playing');
        playCount++;
        if (playCount == 1) {
            // step 1: play -> seek duration/3
            mediaTestBase.msleep(playTime);
            audioPlayer.seek(audioPlayer.duration / 3);
            // step 2: seek duration/3 -> pause
            mediaTestBase.msleep(playTime);
            audioPlayer.pause();
        } else if (playCount == 2) {
            // step 5: play -> seek duration when loop is true
            audioPlayer.loop = true;
            audioPlayer.seek(audioPlayer.duration);
            // step 6: seek duration -> setVolume + seek duration when loop is false
            mediaTestBase.msleep(playTime);
            console.info('case state 2 is :' + audioPlayer.state);
            expect(audioPlayer.state).assertEqual('playing');
            audioPlayer.loop = false;
            audioPlayer.setVolume(0.5);
            audioPlayer.seek(audioPlayer.duration);
            seekEOS = true;
            // step 7: wait for finish
            mediaTestBase.msleep(playTime);
        } else if (playCount == 3) {
            // step 9: play -> stop
            audioPlayer.stop();
        } else {
            // step 12: play -> pause
            audioPlayer.pause();
        }
    });
     audioPlayer.on('pause', () => {
        console.info('case now is paused');
        expect(audioPlayer.state).assertEqual('paused');
        pauseCount++;
        if (pauseCount == 1) {
            // step 3: pause -> seek 0
            audioPlayer.seek(0);
            // step 4: seek 0 -> play
            audioPlayer.play();
        } else {
            // step 13: pause -> stop
            audioPlayer.stop();
        }
    });
    audioPlayer.on('stop', () => {
        console.info('case stop success');
        expect(audioPlayer.state).assertEqual('stopped');
        stopCount++;
        if (stopCount == 1) {
            // step 10: stop -> reset
            audioPlayer.reset();
        } else {
            // step 14: stop -> release
            expect(volumeChanged).assertEqual(true);
            audioPlayer.release();
            done();
        }
    });
    audioPlayer.on('reset', () => {
        console.info('case reset success');
        expect(audioPlayer.state).assertEqual('idle');
        // step 11: reset -> dataLoad
        if (typeof (src) == 'string') {
            console.error('case src test');
            audioPlayer.src = src;
        } else {
            console.error('case fdsrc test');
            audioPlayer.fdSrc = src;
        }
    });
    audioPlayer.on('timeUpdate', (seekDoneTime) => {
        seekCount++;
        if (seekDoneTime == null) {
            console.info(`case seek filed`);
            audioPlayer.release();
            expect().assertFail();
            done();
            return;
        }
        console.info('case timeUpdate success, and timeUpdate is ' + seekDoneTime);
    });
    audioPlayer.on('volumeChange', () => {
        console.info('case set volume success ');
        volumeChanged = true;
    });
    audioPlayer.on('finish', () => {
        console.info('case play end');
        expect(audioPlayer.state).assertEqual('stopped');
        expect(seekEOS).assertTrue();
        // step 8: play when stream is end
        audioPlayer.play();
    });
    audioPlayer.on('error', (err) => {
        console.error(`case error called,errMessage is ${err.message}`);
        audioPlayer.release();
        expect().assertFail();
        done();
    });
}