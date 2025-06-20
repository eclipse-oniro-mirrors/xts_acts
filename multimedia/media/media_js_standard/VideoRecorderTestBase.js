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

import {expect} from 'deccjsunit/index'
import camera from '@ohos.multimedia.camera'
import media from '@ohos.multimedia.media'
import * as mediaTestBase from './MediaTestBase.js';

const VIDEO_TRACK = 'video_track';
const AUDIO_TRACK = 'audio_track';
const AUDIO_VIDEO_TYPE = 'audio_video';
const ONLYVIDEO_TYPE = 'only_video';
const DELTA_TIME = 1500;
const BITRATE_DELTA_TIME = 20000;
const PLAY_TIME = 1000;


export async function initCaptureSession(videoOutPut, cameraManager, cameraDevice, previewOutput) {
    let cameraInput = await cameraManager.createCameraInput(cameraDevice);
    if (cameraInput != null) {
        console.info('[camera] case createCameraInput success');
    } else {
        console.info('[camera] case createCameraInput failed');
        return;
    }
    await cameraInput.open((err) => {
        if(err){
            console.info('[camera] cameraInput open Failed');
            return
        }
        console.info('[camera] cameraInput open success');
    })
    let captureSession = await cameraManager.createCaptureSession();
    await captureSession.beginConfig();
    await captureSession.addInput(cameraInput);
    await captureSession.addOutput(previewOutput);
    await captureSession.addOutput(videoOutPut);
    await captureSession.commitConfig();
    await captureSession.start();
    return captureSession;
}

export async function stopCaptureSession(captureSession) {
    await captureSession.stop().then(() => {
        console.info('[camera] case captureSession stop success');
    });
    await captureSession.release().then(() => {
        console.info('[camera] case captureSession release success');
    });
}

export function getTrackArray(videoType, recorderConfigFile, sourceType) {
    if (videoType == AUDIO_VIDEO_TYPE) {
        let audioTrack = new Array(recorderConfigFile.audioBitrate, recorderConfigFile.audioChannels,
                                   'audio/mp4a-latm', recorderConfigFile.audioSampleRate);
        let videoTrack = null;
        if (sourceType == media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES) {
            videoTrack = new Array('video/avc', recorderConfigFile.videoFrameHeight,
            recorderConfigFile.videoFrameWidth);
        } else {
            if (recorderConfigFile.videoCodec == 'video/avc') {
                videoTrack = new Array('video/avc', recorderConfigFile.videoFrameHeight,
                recorderConfigFile.videoFrameWidth);
            } else {
                videoTrack = new Array('video/mp4v-es', recorderConfigFile.videoFrameHeight,
                recorderConfigFile.videoFrameWidth);
            }
        }
        let trackArray = new Array(videoTrack, audioTrack);
        return trackArray;
    } else if (videoType == ONLYVIDEO_TYPE) {
        let videoTrack = null;
        if (sourceType == media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES) {
            videoTrack = new Array('video/avc', recorderConfigFile.videoFrameHeight,
            recorderConfigFile.videoFrameWidth);
        } else {
            if (recorderConfigFile.videoCodec == 'video/avc') {
                videoTrack = new Array('video/avc', recorderConfigFile.videoFrameHeight,
                recorderConfigFile.videoFrameWidth);
            } else {
                videoTrack = new Array('video/mp4v-es', recorderConfigFile.videoFrameHeight,
                recorderConfigFile.videoFrameWidth);
            }
        }
        let trackArray = new Array(videoTrack);
        return trackArray;
    } else {
        let audioTrack = new Array(recorderConfigFile.audioEncodeBitRate, recorderConfigFile.numberOfChannels,
            'audio/mp4a-latm', recorderConfigFile.audioSampleRate);
        let trackArray = new Array(audioTrack);
        return trackArray;
    }
}

export function checkDescription(obj, trackTpye, descriptionValue) {
    let index = 0;
    if (trackTpye == VIDEO_TRACK) {
        console.info('case video codec_mime is  '+ obj['codec_mime']);
        expect(obj['codec_mime']).assertEqual(descriptionValue[index++]);
        console.info('case video height is  '+ obj['height']);
        expect(obj['height']).assertEqual(descriptionValue[index++]);
        console.info('case video width is  '+ obj['width']);
        expect(obj['width']).assertEqual(descriptionValue[index++]);
    } else {
        console.info('case audio bitrate is  '+ obj['bitrate']);
        expect(obj['bitrate']/3).assertLess(descriptionValue[index++]);
        console.info('case audio channel_count is  '+ obj['channel_count']);
        expect(obj['channel_count']).assertEqual(descriptionValue[index++]);
        console.info('case audio codec_mime is  '+ obj['codec_mime']);
        expect(obj['codec_mime']).assertEqual(descriptionValue[index++]);
        console.info('case audio sample_rate is  '+ obj['sample_rate']);
        if (descriptionValue[index] > 48000 && obj['sample_rate'] == 48000) {
            index++;
        } else {
            expect(obj['sample_rate']).assertEqual(descriptionValue[index++]);
        }
    }
}

export async function checkVideos(playFdPath, duration, trackArray, playerSurfaceId) {
    let videoPlayer = null;
    let arrayDescription = null;
    await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
            videoPlayer = video;
            expect(videoPlayer.state).assertEqual('idle');
        } else {
            console.info('case createVideoPlayer is failed'); 
            expect().assertFail();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    console.info('[checkVideos] case checkVideos fdPath is :' + playFdPath);

    videoPlayer.on('error', (error) => {
        console.info(`case error called,errMessage is ${error.message}`);
        expect().assertFail();
        return;
    });

    videoPlayer.url = playFdPath;
    let tarckType = undefined;
    if (playerSurfaceId != null) {
        tarckType = new Array(VIDEO_TRACK, AUDIO_TRACK);
        await videoPlayer.setDisplaySurface(playerSurfaceId).then(() => {
            console.info('case setDisplaySurface success');
            expect(videoPlayer.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    } else {
        tarckType = new Array(AUDIO_TRACK);
    }
    await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(Math.abs(videoPlayer.duration - duration)).assertLess(DELTA_TIME);
        console.info('case prepare called!!');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.getTrackDescription().then((arrayList) => {
        console.info('case getTrackDescription called!!');
        if (typeof (arrayList) != 'undefined') {
            arrayDescription = arrayList;
        } else {
            console.info('case getTrackDescription is failed');
            expect().assertFail();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.release().then(() => {
        console.info('case release called!!');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    expect(arrayDescription.length).assertEqual(trackArray.length);
    for (let i = 0; i < arrayDescription.length; i++) {
        checkDescription(arrayDescription[i], tarckType[i], trackArray[i]);
    }
}