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

import audio from '@ohos.multimedia.audio';
import { expect } from '@ohos/hypium'
import fs from '@ohos.file.fs';
import { UiDriver, BY } from '@ohos.UiTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import media from '@ohos.multimedia.media';


export default class MediaTestBase {
  TAG = "[AvScreenCaptureLocalTest] ";
  END_STATE = 0;
  PRE_STATE = 1;
  CREATE_EVENT = 10;
  START_STATE = 2;
  PAUSE_STATE = 3;
  RESUME_STATE = 4;
  STOP_STATE = 5;
  RESET_STATE = 6;
  RELEASE_STATE = 7;
  ERROR_STATE = 8;
  RECORDER_TIME = 1000;
  outputName = '';
  outputFdObject: media.AVScreenCaptureRecordConfig = {
    fd: -1
  };
  location1: media.Location =
    {
      latitude: 1
    , longitude: 1
    }
  audioConfig: media.AudioRecorderConfig = {
    // audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    audioEncoder: media.AudioEncoder.AAC_LC,
    audioEncodeBitRate: 22050,
    audioSampleRate: 22050,
    numberOfChannels: 2,
    format: media.AudioOutputFormat.AAC_ADTS,
    uri: 'fd://',
    location: this.location1
  }
  audioRecorder: media.AudioRecorder | undefined = undefined;

  setCallback(mySteps: Array<number>, done: Function) {
    this.audioRecorder?.on('prepare', () => {
      console.info('setCallback prepare() case callback is called');
      mySteps.shift();
      this.toNextStep(mySteps, done);
    });

    this.audioRecorder?.on('start', () => {
      console.info('setCallback start() case callback is called');
      this.sleep(this.RECORDER_TIME);
      mySteps.shift();
      this.toNextStep(mySteps, done);
    });

    this.audioRecorder?.on('pause', () => {
      console.info('setCallback pause() case callback is called');
      this.sleep(this.RECORDER_TIME);
      mySteps.shift();
      this.toNextStep(mySteps, done);
    });

    this.audioRecorder?.on('resume', () => {
      console.info('setCallback resume() case callback is called');
      this.sleep(this.RECORDER_TIME);
      mySteps.shift();
      this.toNextStep(mySteps, done);
    });

    this.audioRecorder?.on('stop', () => {
      console.info('setCallback stop() case callback is called');
      mySteps.shift();
      this.toNextStep(mySteps, done);
    });

    this.audioRecorder?.on('reset', () => {
      console.info('setCallback reset() case callback is called');
      mySteps.shift();
      this.toNextStep(mySteps, done);
    });

    this.audioRecorder?.on('release', () => {
      console.info('setCallback release() case callback is called');
      mySteps.shift();
      this.toNextStep(mySteps, done);
    });
    this.audioRecorder?.on('error', (err) => {
      console.info(`case error called,errName is ${err.name}`);
      console.info(`case error called,errCode is ${err.code}`);
      console.info(`case error called,errMessage is ${err.message}`);
      mySteps.shift();
      expect(mySteps[0]).assertEqual(this.ERROR_STATE);
      mySteps.shift();
      this.toNextStep(mySteps, done);
    });
  }

  async initAudioRecorder() {

    if (typeof (this.audioRecorder) != 'undefined') {
      this.audioRecorder?.release();
      this.audioRecorder = undefined;
    }
    this.audioRecorder = media.createAudioRecorder();
  }

  async toNextStep(steps: Array<number>, done: Function) {
    if (steps[0] == this.END_STATE) {
      console.info('case success!!');
      done();
    }

    let currentSteps: number = steps[0]
    console.info('case into currentSteps Event:!!' + currentSteps);
    // steps.shift();
    switch (currentSteps) {
      case this.PRE_STATE:
        console.info('case to prepare');
        this.audioRecorder?.prepare(this.audioConfig);
        break;
      case this.CREATE_EVENT:
        if (typeof (this.audioRecorder) != 'undefined') {
          this.audioRecorder?.release();
          this.audioRecorder = undefined;
        }
        this.audioRecorder = media.createAudioRecorder();
        break;
      case this.START_STATE:
        console.info('case to start');
        this.audioRecorder?.start();
        break;
      case this.PAUSE_STATE:
        console.info('case to start');
        this.audioRecorder?.pause();
        break;
      case this.RESUME_STATE:
        console.info('case to start');
        this.audioRecorder?.resume();
        break;
      case this.STOP_STATE:
        console.info('case to start');
        this.audioRecorder?.stop();
        break;
      case this.RESET_STATE:
        console.info('case to start');
        this.audioRecorder?.reset();
        break;
      case this.RELEASE_STATE:
        console.info('case to start');
        this.audioRecorder?.release();
        break;
      case this.ERROR_STATE:
        console.info('case to wait error callback');
        break;
      default:
        console.error('case to default ERR');
        break;
    }
  }


  async driveFn(num: number) {
    console.info(`case come in driveFn 111`)
    let driver = await UiDriver.create()
    console.info(`driver is ${JSON.stringify(driver)}`)
    console.info(`UiDriver start`)
    await this.sleep(500)
    let btn1 = await driver.findComponent(BY.text('稍后'))
    if (btn1 != null) {
      console.info(`wlan btn click`)
      await btn1.click()
    }
    for (let i = 0; i < num; i++) {
      let button = await driver.findComponent(BY.text('允许'))
      if (button == null) {
        continue;
      }
      console.info(`button is ${JSON.stringify(button)}`)
      await this.sleep(2000)
      if (await driver.findComponent(BY.text('允许')) != null) {
        await button.click()
      }
      await this.sleep(2000)
    }
    await this.sleep(500)
  }

  async getPermission(permissionNames: Array<Permissions>) {
    let context: ESObject = AppStorage.get('testContext');
    let atManager = abilityAccessCtrl.createAtManager();
    //requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    atManager.requestPermissionsFromUser(context, permissionNames).then((data) => {
      let grantStatus = data.authResults;
      let length = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          return;
        }
      }
      //授权成功
    }).catch((err: BusinessError) => {
      console.error(`Failed to request permissions from user. Code is ${err.code}, message is ${err.message}`);
    })
  }


  async sleep(time: number) {
    for (let t = Date.now(); Date.now() - t <= time; ) {
      ;
    }
  }

  resourceName() {
    let timestamp = Date.now();
    let filename = `avScreenCapture_${timestamp}.mp4`;
    return filename;
  }

  getFd(outputName: string) {
    let context: ESObject = AppStorage.get('testContext');
    outputName = context.filesDir + "/" + outputName;
    console.info("case outputName is" + outputName);
    try {
      let file = fs.openSync(outputName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      if (file) {
        this.outputFdObject.fd = file.fd;
      }
    } catch (err) {
      console.info('case getDSt err: ' + err);
    }
    console.info('case getDSt number is: ' + this.outputFdObject.fd);
    return this.outputFdObject;
  }

  closeFd(fdNumber: number | null) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }
}

