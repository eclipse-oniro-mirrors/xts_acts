/*
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

import audio from '@ohos.multimedia.audio';
import { expect } from '../../../hypium/index';
import fs from '@ohos.file.fs';
import { ReadOptions } from '@ohos.file.fs';
// import { UiDriver, BY } from '@ohos.UiTest';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
// import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'; // Permissions
import { Permissions } from 'permissions';
import media from '@ohos.multimedia.media';
// import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import PermissionRequestResult from 'security.PermissionRequestResult';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export default class MediaTestBase {
  TAG = "[AvScreenCaptureLocalTest] ";
  SETONCALLBACK_EVENT = 'setAvScreenCaptureCallback';
  SET_MIC_ENABLE_EVENT = 'setMicEnable';
  CREATE_EVENT = 'create';
  INIT_EVENT = 'init';
  STARTRECORDER_EVENT = 'start';
  SKIPPRIVACYMODE_EVENT = 'skipPrivacyMode';
  STOPRECORDER_EVENT = 'stop';
  RELEASECORDER_EVENT = 'release';
  END_EVENT = 'end';
  FAIL_EVENT = 'fail';
  AV_CREATEAVPLAYER = 'createAVPlayer';
  AV_IDLE = 'idle';
  AV_INITIALIZED = 'initialized';
  AV_PREPARED = 'prepared';
  AV_PLAYING = 'playing';
  AV_PAUSED = 'paused';
  AV_COMPLETED = 'completed';
  AV_STOPPED = 'stopped';
  AV_RELEASED = 'released';
  AV_ERROR = 'error';
  outputName = '';
  outputFdObject: media.AVScreenCaptureRecordConfig = {
    fd: -1
  };
  avFileDescriptor: media.AVScreenCaptureRecordConfig = {
    fd: -1
  };
  avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null = null;
  avPlayer: media.AVPlayer | null = null;

  setAVScreenCaptueCallback(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null, done: () => void) {
    // 状态机变化回调函数
    avScreenCaptureRecorder?.onStateChange((state) => {
      console.info('avScreenCapture stateChange to ' + state);
      switch (state) {
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STARTED:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_CANCELED:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER_SWITCHES:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_INTERRUPTED_BY_OTHER:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_CALL:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNAVAILABLE:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_MUTED_BY_USER:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNMUTED_BY_USER:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_ENTER_PRIVATE_SCENE:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_EXIT_PRIVATE_SCENE:
          break;
        default:
          console.error('invalid AVScreenCaptureStateCode: ' + state);
          break;
      }
    })

    avScreenCaptureRecorder?.onError((err) => {
      console.error('avScreenCaptureRecorder error:' + err.message);
      expect().assertFail()
    })

  }

  async toNextStep(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null,
    avConfig: media.AVScreenCaptureRecordConfig, recorderTime: int,
    steps: Array<string>, done: () => void) {
    console.info('____toNextStep_____1');
    if (steps[0] == this.END_EVENT) {
      console.info('case success!!');
      done();
    }

    console.info('case EVENT:::EVENT::::!!' + steps[0]);
    switch (steps[0]) {
      case 'setAvScreenCaptureCallback':
        steps.shift();
        try {
          console.info('____toNextStep_____2');
          this.setAVScreenCaptueCallback(avScreenCaptureRecorder, done)
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        } catch (error) {
          console.error('setAVScreenCaptueCallback failed and catch error is ' + error);
        }
        break;
      case 'create':
        steps.shift();
        await media.createAVScreenCaptureRecorder().then((captureRecorder: media.AVScreenCaptureRecorder | undefined) => {
          if (captureRecorder != null) {
            avScreenCaptureRecorder = captureRecorder;
            this.avScreenCaptureRecorder = avScreenCaptureRecorder;
            console.info('createAVScreenCaptureRecorder success');
            this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
          } else {
            console.error('createAVScreenCaptureRecorder fail');
            expect().assertFail()
          }
        }).catch((error: Error) => {
          console.error(`createAVScreenCaptureRecorder catchCallback, error message:${error.message}`);
          expect().assertFail()
        });

        break;
      case 'init':
        steps.shift();
        await avScreenCaptureRecorder!!.init(avConfig).then(() => {
          console.info('avScreenCaptureRecorder init success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: Error) => {
          console.error('avScreenCaptureRecorder init failed, error: ' + err.message);
          if (avConfig.fd == -1) {
            let mySteps = new Array<string>(
              this.END_EVENT );
            this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, mySteps, done);
          } else {
            console.error('avScreenCaptureRecorder init failed, error: ' + err.message);
            expect().assertFail()
          }
        });

        break;
      case 'start':
        steps.shift();
        await avScreenCaptureRecorder!!.startRecording().then(() => {
          console.info('avScreenCaptureRecorder start success');
        }).catch((err: Error) => {
          console.error('avScreenCaptureRecorder start failed, error: ' + err.message);
          expect().assertFail()
        })

        await this.driveFnNoSleep(1);
        setTimeout(() => {
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }, recorderTime);

        break;
      case 'skipPrivacyMode':
        steps.shift();
        let windowAllIds :Array<int>= [];
        await avScreenCaptureRecorder!!.skipPrivacyMode(windowAllIds).then(() => {
          console.info('avScreenCaptureRecorder skipPrivacyMode success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch(async (err: Error) => {
          console.error('avScreenCaptureRecorder skipPrivacyMode failed, error: ' + err.message);
          let cansys = this.isSupportSceneboard();
          console.info('isSupportSceneboard result cansys', JSON.stringify(cansys));
          if (cansys != 0 && (err as BusinessError).code == 5400103) {
            //rk板或者其他没sceneboard的设备上，都会包5400103的错误码；
            this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
          } else {
            console.error('avScreenCaptureRecorder init failed, error: ' + err.message);
            expect().assertFail()
          }
        })

        break;
      case 'stop':
        steps.shift();
        await avScreenCaptureRecorder!!.stopRecording().then(() => {
          console.info('avScreenCaptureRecorder stop success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: Error) => {
          console.error('avScreenCaptureRecorder stop failed, error: ' + err.message);
          expect().assertFail()
        })

        break;
      case 'release':
        steps.shift();
        await avScreenCaptureRecorder!!.release().then(() => {
          console.info('avScreenCaptureRecorder release success');
          this.avScreenCaptureRecorder = null;
        }).catch((err: Error) => {
          console.error('avScreenCaptureRecorder release failed, error: ' + err.message);
          expect().assertFail();
        })
        setTimeout(() => {
          this.closeFd(this.outputFdObject.fd);
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }, 2000);
        break;
      case 'setMicEnable':
        steps.shift();
        await avScreenCaptureRecorder!!.setMicEnabled(true).then(() => {
          console.info('avScreenCaptureRecorder setMicEnabled success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: Error) => {
          console.error('avScreenCaptureRecorder setMicEnabled failed, error: ' + err.message);
          expect().assertFail()
        })
        break;
      case 'createAVPlayer':
        steps.shift();
        this.AvPlayerMp4(this.outputName, avConfig, done)
        break;
      default:
        break;
    }
  }

  AvPlayerMp4(outputName: string, avConfig: media.AVScreenCaptureRecordConfig, done: () => void) {
    media.createAVPlayer((err: BusinessError<void> | null, video: media.AVPlayer | undefined) => {
      console.info(`case media err: ${err}`)
      if (typeof (video) != 'undefined') {
        console.info('case createAVPlayer success');
        this.avPlayer = video!;

        this.avFileDescriptor = this.getFd(outputName)
        // this.avPlayer!!.fdSrc!!.fd = this.avFileDescriptor.fd

        // if (typeof (this.avFileDescriptor) != 'string') {
        //   console.info('case fdsrc test');
        //   this.avPlayer!!.fdSrc!!.fd = this.avFileDescriptor.fd
        // }

        let surfaceID: string = AppStorage.get<string>('surfaceId') as string;
        console.error(`case INITIALIZED , surfaceID is ${surfaceID}`);
        this.avPlayer?.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
          switch (state) {
            case 'initialized':
              if (!this.avPlayer) {
                console.info(`avPlayer is null`);
                break;
              }
              console.info(`case INITIALIZED`);
              console.error(`case INITIALIZED , surfaceID is ${surfaceID}`);
              this.avPlayer!!.surfaceId = surfaceID;
              expect(this.avPlayer!!.state).assertEqual(this.AV_INITIALIZED);

              setTimeout(() => {
                console.info('case prepare called');
                this.avPlayer?.prepare((err: BusinessError<void> | null) => {
                  console.info('case prepare called' + err);
                  if (err != null) {
                    console.error(`case prepare error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                  } else if (this.avPlayer) {
                    console.info('case avPlayer.duration: ' + this.avPlayer!!.duration);
                  }
                });
              }, 1000);

              break;
            case 'prepared':
              if (this.avPlayer != null) {
                this.getTrackDescriptionTest(this.avPlayer!!, avConfig, done)
              }
              this.avPlayer?.play().then(() => {
                console.info('Succeeded in playing');
              }, (err: Error) => {
                console.error('Failed to play,error message is :' + err.message)
              })
              break;
            case 'playing':
              if (this.avPlayer != null) {
                this.getTrackDescriptionTest(this.avPlayer!!, avConfig, done)
              }

              this.avPlayer?.stop().then(() => {
                console.info('avPlayer stop success');
                this.avPlayer?.release().then(() => {
                  console.info('avPlayer release success');
                }).catch((err: Error) => {
                  console.info('avPlayer release failed, error: ' + err.message);
                  expect().assertFail()
                })
              }).catch((err: Error) => {
                console.info('avPlayer stop failed, error: ' + err.message);
                expect().assertFail()
              })
              break;
            case 'released':
              this.avPlayer = null;
              this.closeFd(this.avFileDescriptor.fd)
              done();
              break;
            case 'error':
              this.avPlayer?.release().then(() => {
                console.info('avPlayer release success');
              }).catch((err: Error) => {
                console.info('avPlayer release failed, error: ' + err.message);
                expect().assertFail()
              })
              this.avPlayer = null;
              break;
            default:
              break;
          }
        })
      }
      let avFd: media.AVFileDescriptor = {
        fd: this.avFileDescriptor.fd
      }
      this.avPlayer!!.fdSrc = avFd
      if (err != null) {
        console.error(`case createAVPlayer error, errMessage is ${err?.message}`);
        expect().assertFail();
        done();
      }
    });

  }

  getTrackDescriptionTest(avPlayer: media.AVPlayer, avConfig: media.AVScreenCaptureRecordConfig, done: () => void) {

    avPlayer?.getTrackDescription((error: BusinessError | null, arrList: Array<media.MediaDescription> | undefined) => {
      if (arrList != null) {
        for (let i = 0; i < arrList.length; i++) {
          console.info(`case getTrackDescription is ${JSON.stringify(arrList[i])}`);
          if (arrList[i]!!['codec_mime']?.toString() == "audio/mp4a-latm") {
            expect(new Double(arrList[i]['bitrate']!.toString()) / 3).assertLess(avConfig.audioBitrate!);
            expect(new Double(arrList[i]['sample_rate']!.toString())).assertEqual(avConfig.audioSampleRate);
          }
        }
        done();
      } else {
        console.error(`Failed to get TrackDescription, error:${error}`);
        expect().assertFail();
      }
    });
  }

  async driveFnNoSleep(num: number) {
    await this.msleepAsync(500);
    console.info(`case come in driveFn 111`)
    let driver = Driver.create()
    console.info(`driver is ${JSON.stringify(driver)}`)
    console.info(`UiDriver start`)
    await this.msleepAsync(500)
    for (let i = 0; i < num; i++) {
      let button = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 5000);
      console.info(`button is ${JSON.stringify(button)}`)
      if (button != null) {
        await button.click()
      }
    }
    await this.msleepAsync(500)
  }

  async getPermission(permissionNames: Array<Permissions>) {
    let atManager = abilityAccessCtrl.createAtManager();
    // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    let g_context: common.UIAbilityContext;
    g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
    atManager.requestPermissionsFromUser(g_context, permissionNames).then((data: PermissionRequestResult) => {
      let grantStatus: Array<int> = data.authResults;
      let length: int = grantStatus.length as int;
      for (let i: int = 0; i < length; i++) {
        let authResultGrant: int = 0;
        let ret: int = grantStatus.$_get(i) as int
        if (ret == authResultGrant) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          // return;
        }
      }
      // 授权成功
    }).catch((err: Error) => {
      console.error(`Failed to request permissions from user. Code is ${JSON.stringify(err)}`);
    })
  }

  // wait asynchronously
  async msleepAsync(time: int) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  resourceName() {
    console.info('_____resourceName____1');
    let timestamp = Date.now();
    console.info('_____resourceName____2');
    let filename = `avScreenCapture_${timestamp}.mp4`;
    console.info('____resourceName_____3' + filename);
    return filename;
  }

  getFd(outputName: string) {
    console.info('_____getFd____1');
    let g_context: common.UIAbilityContext;
    console.info('_____getFd____2');
    g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
    console.info('_____getFd____3');
    outputName = g_context!!.filesDir + "/" + outputName;
    console.info('_____getFd____4');
    console.info("case outputName is" + outputName);
    try {
      let file = fs.openSync(outputName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      if (file) {
        console.info('_____getFd____5');
        this.outputFdObject.fd = file.fd as int;
      }
    } catch (err) {
      console.info('case getDSt err: ' + err);
    }
    console.info('case getDSt number is: ' + this.outputFdObject.fd);
    return this.outputFdObject;
  }

  closeFd(fdNumber: int | null) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber!);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }

  audioRen: audio.AudioRenderer | undefined | null;

  async playPcmPromise() {
    console.info(`${this.TAG}: Promise : Audio playPcmPromise Function`);
    let audioStreamInfo: audio.AudioStreamInfo = {
      samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
      channels: audio.AudioChannel.CHANNEL_2,
      sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
      encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
    };

    let audioRendererInfo: audio.AudioRendererInfo = {
      // content:audio.ContentType.CONTENT_TYPE_MUSIC,
      usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
      rendererFlags: 0
    };

    let audioRendererOptions: audio.AudioRendererOptions = {
      streamInfo: audioStreamInfo,
      rendererInfo: audioRendererInfo
    };
    if (this.audioRen) {
      return undefined;
    }

    await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
      this.audioRen = data;
      console.info(`${this.TAG}: AudioRender Created : Success : Stream Type: SUCCESS`);
    }).catch((err: Error) => {
      console.info(`${this.TAG}: AudioRender Created : ERROR : ${err.message}`);
    });
    let bufferSize: number = 0;

    let g_context: common.UIAbilityContext;
    g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
    let filePath = g_context?.filesDir + '/f32le_44100_2_dayuhaitang.pcm'
    let stat = await fs.stat(filePath)
    let file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_ONLY);

    this.audioRen!!.onWriteData((buffer: ArrayBuffer) => {
      // console.info(`${this.TAG}: writeDataCallback : ${buffer.byteLength}`);
      if (buffer.byteLength <= 0) {
        return audio.AudioDataCallbackResult.INVALID;
      }
      let options: ReadOptions = {
        offset: bufferSize.toLong(),
        length: buffer.byteLength
      }
      fs.readSync(file.fd, buffer, options);
      bufferSize += buffer.byteLength;
      if (bufferSize > stat.size) {
        bufferSize = 0
      }
      return audio.AudioDataCallbackResult.VALID
    });

    console.info(`${this.TAG}: AudioRenderer : Path : ${filePath}`);

    console.info(`${this.TAG}: AudioRenderer : STATE : ${this.audioRen!!.state}`);

  }

  async playPcmPromiseStart() {

    await this.audioRen!!.start().then(() => {
      console.info(`${this.TAG}: renderInstant started :SUCCESS `);
    }).catch((err: Error) => {
      console.info(`${this.TAG}: renderInstant start :ERROR : ${err.message}`);
    });
  }

  async playPcmPromiseStop() {

    await this.audioRen!!.stop().then(() => {
      console.info(`${this.TAG}: renderInstant stop :SUCCESS `);
    }).catch((err: Error) => {
      console.info(`${this.TAG}: renderInstant stop :ERROR : ${err.message}`);
    });
  }

  async isSupportSceneboard() {
    let cmd = "aa dump -a|grep com.ohos.sceneboard"
    let result = await delegator.executeShellCommand(cmd);
    console.info('isSupportSceneboard result case', JSON.stringify(result));
    let exitCode: number = result.exitCode
    console.info('isSupportSceneboard exitCode case', JSON.stringify(exitCode));
    return exitCode;
  }
}

