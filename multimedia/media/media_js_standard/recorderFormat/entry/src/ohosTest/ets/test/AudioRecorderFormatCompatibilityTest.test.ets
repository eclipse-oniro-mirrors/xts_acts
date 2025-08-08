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

import MediaTestBase from './MediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { Permissions } from '@ohos.abilityAccessCtrl';

let mediaTestBase = new MediaTestBase();

export default function AudioRecorderFormatCompatibilityTest() {
  describe('AudioRecorderFormatCompatibilityTest', () => {

    beforeAll(async () => {
      let permissionName1: Permissions = 'ohos.permission.MICROPHONE';
      let permissionName2: Permissions = 'ohos.permission.MEDIA_LOCATION';
      let permissionName3: Permissions = 'ohos.permission.READ_MEDIA';
      let permissionName4: Permissions = 'ohos.permission.WRITE_MEDIA';
      let permissionNames: Array<Permissions> = [permissionName1, permissionName2, permissionName3, permissionName4];
      await mediaTestBase.getPermission(permissionNames);
      await mediaTestBase.sleep(2000);
      await mediaTestBase.driveFn(3);
      console.info('beforeAll case');
    })

    beforeEach(async () => {
      console.info('beforeEach case');
    })

    afterEach(async () => {
      await mediaTestBase.closeFd(mediaTestBase.outputFdObject.fd);
      console.info('afterEach case');
    })

    afterAll(async () => {
      console.info('afterAll case');
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0100
        * @tc.name      : location: {latitude: -90, longitude: -180}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0100', Level.LEVEL0,async (done: Function) => {
      await mediaTestBase.getFd('COMPATIBILITY_0100.m4a');
      mediaTestBase.audioConfig.uri = "fd://"+mediaTestBase.outputFdObject.fd;
      mediaTestBase.location1.latitude = -90;
      mediaTestBase.location1.longitude = -180;
      await mediaTestBase.initAudioRecorder();
      let mySteps = new Array(mediaTestBase.PRE_STATE, mediaTestBase.START_STATE, mediaTestBase.STOP_STATE,
        mediaTestBase.RELEASE_STATE, mediaTestBase.END_STATE);
      await mediaTestBase.setCallback(mySteps, done);
      mediaTestBase.audioRecorder?.prepare(mediaTestBase.audioConfig);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0200
        * @tc.name      : location: {latitude: 90, longitude: 180}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0200', Level.LEVEL0,async (done: Function) => {
      await  mediaTestBase.getFd('COMPATIBILITY_0200.m4a');
      mediaTestBase.audioConfig.uri = "fd://"+mediaTestBase.outputFdObject.fd;
      mediaTestBase.location1.latitude = 90;
      mediaTestBase.location1.longitude = 180;
      mediaTestBase.initAudioRecorder();
      let mySteps = new Array(mediaTestBase.PRE_STATE, mediaTestBase.START_STATE, mediaTestBase.STOP_STATE,
        mediaTestBase.RELEASE_STATE, mediaTestBase.END_STATE);
      mediaTestBase.setCallback(mySteps, done);
      mediaTestBase.audioRecorder?.prepare(mediaTestBase.audioConfig);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0300
        * @tc.name      : location: {latitude: 0, longitude: 0}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0300', Level.LEVEL0,async (done: Function) => {
      await mediaTestBase.getFd('COMPATIBILITY_0300.m4a');
      mediaTestBase.audioConfig.uri = "fd://"+mediaTestBase.outputFdObject.fd;
      mediaTestBase.location1.latitude = 0;
      mediaTestBase.location1.longitude = 0;
      mediaTestBase.initAudioRecorder();
      let mySteps = new Array(mediaTestBase.PRE_STATE, mediaTestBase.START_STATE, mediaTestBase.STOP_STATE,
        mediaTestBase.RELEASE_STATE, mediaTestBase.END_STATE);
      mediaTestBase.setCallback(mySteps, done);
      mediaTestBase.audioRecorder?. prepare(mediaTestBase.audioConfig);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0400
        * @tc.name      : location: {latitude: 0, longitude: 180}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0400', Level.LEVEL0,async (done: Function) => {
      await mediaTestBase.getFd('COMPATIBILITY_0400.m4a');
      mediaTestBase.audioConfig.uri = "fd://"+mediaTestBase.outputFdObject.fd;
      mediaTestBase.location1.latitude = 0;
      mediaTestBase.location1.longitude = 180;
      mediaTestBase.initAudioRecorder();
      let mySteps = new Array(mediaTestBase.PRE_STATE, mediaTestBase.START_STATE, mediaTestBase.STOP_STATE,
        mediaTestBase.RELEASE_STATE, mediaTestBase.END_STATE);
      mediaTestBase.setCallback(mySteps, done);
      mediaTestBase.audioRecorder?.prepare(mediaTestBase.audioConfig);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0500
        * @tc.name      : location: {latitude: -30, longitude: 60}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0500', Level.LEVEL0,async (done: Function) => {
      await mediaTestBase.getFd('COMPATIBILITY_0500.m4a');
      mediaTestBase.audioConfig.uri = "fd://"+mediaTestBase.outputFdObject.fd;
      mediaTestBase.location1.latitude = -30;
      mediaTestBase.location1.longitude = 60;
      mediaTestBase.initAudioRecorder();
      let mySteps = new Array(mediaTestBase.PRE_STATE, mediaTestBase.START_STATE, mediaTestBase.STOP_STATE,
        mediaTestBase.RELEASE_STATE, mediaTestBase.END_STATE);
      mediaTestBase.setCallback(mySteps, done);
      mediaTestBase.audioRecorder?.prepare(mediaTestBase.audioConfig);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0600
        * @tc.name      : location: {latitude: 60, longitude: -90}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_0600', Level.LEVEL0,async (done: Function) => {
      await mediaTestBase.getFd('COMPATIBILITY_0600.m4a');
      mediaTestBase.audioConfig.uri = "fd://"+mediaTestBase.outputFdObject.fd;
      mediaTestBase.location1.latitude = 60;
      mediaTestBase.location1.longitude = -90;
      mediaTestBase.initAudioRecorder();
      let mySteps = new Array(mediaTestBase.PRE_STATE, mediaTestBase.START_STATE, mediaTestBase.STOP_STATE,
        mediaTestBase.RELEASE_STATE, mediaTestBase.END_STATE);
      mediaTestBase.setCallback(mySteps, done);
      mediaTestBase.audioRecorder?.prepare(mediaTestBase.audioConfig);
    })
  })
}
