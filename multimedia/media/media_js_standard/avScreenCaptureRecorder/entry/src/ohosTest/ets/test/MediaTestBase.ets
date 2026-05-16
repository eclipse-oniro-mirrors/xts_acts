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
import { abilityDelegatorRegistry } from '@kit.TestKit';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export default class MediaTestBase {
  TAG = "[AvScreenCaptureLocalTest] ";
  SETONCALLBACK_EVENT = 'setAvScreenCaptureCallback';
  SET_MIC_ENABLE_EVENT = 'setMicEnable';
  CREATE_EVENT = 'create';
  INIT_EVENT = 'init';
  SET_PICKER_MODE = 'setPickerMode';
  EXCLUDE_PICKER_WINDOWS = 'excludePickerWindows';
  INITWITHERROR_EVENT = 'init';
  STARTRECORDER_EVENT = 'start';
  SKIPPRIVACYMODE_EVENT = 'skipPrivacyMode';
  STOPRECORDER_EVENT = 'stop';
  RELEASECORDER_EVENT = 'release';
  PRESENTT_PICKER_EVENT = 'presentPicker';
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
  isSucceeded: boolean = true;
  isOnStateChange: boolean = false;

  testBegin() {
    this.isSucceeded = true;
  }

  isTestSucceeded(): boolean {
    return this.isSucceeded;
  }

  testFail() {
    this.isSucceeded = false;
  }

  setAVScreenCaptureCallback(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null, done: Function) {
    // 状态机变化回调函数

    try {
      avScreenCaptureRecorder?.on('stateChange', (state) => {
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
      this.isOnStateChange = true;
    } catch (err) {
      console.error('stateChange error:' + err.message);
      this.isOnStateChange = false;
      expect().assertFail()
    }

    avScreenCaptureRecorder?.on('error', (err) => {
      console.error('avScreenCaptureRecorder error:' + err.message);
      expect().assertFail()
    })

  }

  async toNextStep(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null,
    avConfig: media.AVScreenCaptureRecordConfig, recorderTime: number,
    steps: Array<string>, done: Function) {
    if (steps[0] == this.END_EVENT) {
      console.info('case success!!');
      avScreenCaptureRecorder?.off('stateChange');
      console.info('case success off stateChange');
      avScreenCaptureRecorder?.off('error');
      console.info('case success off error');
      done();
    }

    console.info('case EVENT:::EVENT::::!!' + steps[0]);
    switch (steps[0]) {
      case this.SETONCALLBACK_EVENT:
        steps.shift();
        if (this.isTestSucceeded()) {
          try {
            await this.setAVScreenCaptureCallback(avScreenCaptureRecorder, done)
          } catch (error) {
            console.error('setAVScreenCaptureCallback failed and catch error is ' + error.message);
            this.testFail();
          }
        }
        this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        break;
      case this.CREATE_EVENT:
        steps.shift();
        if (this.isTestSucceeded()) {
          await media.createAVScreenCaptureRecorder().then((captureRecorder) => {
            if (captureRecorder != null) {
              avScreenCaptureRecorder = captureRecorder;
              this.avScreenCaptureRecorder = avScreenCaptureRecorder;
              console.info('createAVScreenCaptureRecorder success');
            } else {
              console.error('createAVScreenCaptureRecorder fail');
              this.testFail();
            }
          }).catch((error: BusinessError) => {
            console.error(`createAVScreenCaptureRecorder catchCallback, error message:${error.message}`);
            this.testFail();
          });
        }
        this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        break;
      case this.INIT_EVENT:
        steps.shift();
        if (this.isTestSucceeded()) {
          await avScreenCaptureRecorder?.init(avConfig).then(() => {
            console.info('avScreenCaptureRecorder init success');
          }).catch((err: BusinessError) => {
            console.error('avScreenCaptureRecorder init failed, error: ' + err.message);
            console.info('avScreenCaptureRecorder initwitherror failed, error code is:' + err.code);
            expect(err.code).assertEqual(401);
            if (avConfig.fd == -1) {
              let mySteps = new Array(
                this.END_EVENT);
            } else {
              console.error('avScreenCaptureRecorder init failed, error: ' + err.message);
              this.testFail();
            }
          });
        }
        this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        break;
      case this.SET_PICKER_MODE:
        steps.shift();
        if (this.isTestSucceeded()) {
          try {
            await avScreenCaptureRecorder?.setPickerMode(media.PickerMode.WINDOW_ONLY);
            await avScreenCaptureRecorder?.setPickerMode(media.PickerMode.SCREEN_ONLY);
            await avScreenCaptureRecorder?.setPickerMode(media.PickerMode.SCREEN_AND_WINDOW);
            console.info('avScreenCaptureRecorder setPickerMode success');
          } catch (error) {
            console.error('avScreenCaptureRecorder setPickerMode failed, error: ' + error.message);
            this.testFail();
          }
        }

        await this.driveFnNoSleep(1)
        setTimeout(() => {
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }, recorderTime);

        break;
      case this.EXCLUDE_PICKER_WINDOWS:
        steps.shift();
        if (this.isTestSucceeded()) {
          const excludedWindowIds: number[] = [101, 102, 103];
          await avScreenCaptureRecorder?.excludePickerWindows(excludedWindowIds).then(() => {
            console.info('avScreenCaptureRecorder setPickerMode success');
          }).catch((err: BusinessError) => {
            console.error('avScreenCaptureRecorder setPickerMode failed, error: ' + err.message);
            this.testFail();
          });
        }

        await this.driveFnNoSleep(1)
        setTimeout(() => {
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }, recorderTime);

        break;
      case this.STARTRECORDER_EVENT:
        steps.shift();
        if (this.isTestSucceeded()) {
          await avScreenCaptureRecorder?.startRecording().then(() => {
            console.info('avScreenCaptureRecorder start success');
          }).catch((err: BusinessError) => {
            console.error('avScreenCaptureRecorder start failed, error: ' + err.message);
            this.testFail();
          });
        }

        await this.driveFnNoSleep(1)
        setTimeout(() => {
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }, recorderTime);

        break;
      case this.SKIPPRIVACYMODE_EVENT:
        steps.shift();
        if (this.isTestSucceeded()) {
          let windowAllIds = [];
          await avScreenCaptureRecorder?.skipPrivacyMode(windowAllIds).then(() => {
            console.info('avScreenCaptureRecorder skipPrivacyMode success');
          }).catch(async (err: BusinessError) => {
            console.error('avScreenCaptureRecorder skipPrivacyMode failed, error: ' + err.message);
            let cansys = await this.isSupportSceneboard();
            console.info('isSupportSceneboard result cansys', JSON.stringify(cansys));
            if (!(cansys != 0 && err.code == 5400103)) {
              //rk板或者其他没sceneboard的设备上，都会包5400103的错误码；
              console.error('avScreenCaptureRecorder init failed, error: ' + err.message);
              this.testFail();
            }
          });
        }
        this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        break;
      case this.STOPRECORDER_EVENT:
        steps.shift();
        if (this.isTestSucceeded()) {
          await avScreenCaptureRecorder?.stopRecording().then(() => {
            console.info('avScreenCaptureRecorder stop success');
          }).catch((err: BusinessError) => {
            console.error('avScreenCaptureRecorder stop failed, error: ' + err.message);
            this.testFail();
          });
        }
        this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        break;
      case this.RELEASECORDER_EVENT:
        steps.shift();
        if (this.isTestSucceeded()) {
          await avScreenCaptureRecorder?.release().then(() => {
            console.info('avScreenCaptureRecorder release success');
            this.avScreenCaptureRecorder = null;
          }).catch((err: BusinessError) => {
            console.error('avScreenCaptureRecorder release failed, error: ' + err.message);
            this.testFail();
          });
        }
        this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        this.closeFd(this.outputFdObject.fd);
        break;
      case this.PRESENTT_PICKER_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.presentPicker().then(() => {
          console.info('avScreenCaptureRecorder presentPicker success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('avScreenCaptureRecorder presentPicker failed, error: ' + err.code);
          if (err.code == 5400102) {
            this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
          } else {
            console.error('avScreenCaptureRecorder init failed, error: ' + err.message);
            expect().assertFail()
          }
        })

        break;
      case this.SET_MIC_ENABLE_EVENT:
        steps.shift();
        if (this.isTestSucceeded()) {
          await avScreenCaptureRecorder?.setMicEnabled(true).then(() => {
            console.info('avScreenCaptureRecorder setMicEnabled success');
          }).catch((err: BusinessError) => {
            console.error('avScreenCaptureRecorder setMicEnabled failed, error: ' + err.message);
            this.testFail();
          });
        }
        this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        break;
      case this.AV_CREATEAVPLAYER:
        steps.shift();
        this.AvPlayerMp4(this.outputName, avConfig, done)
        break;
      default:
        break;
    }
  }

  async toNextStep2(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null,
    avConfig2: media.AVScreenCaptureRecordConfig, recorderTime: number,
    steps: Array<string>, done: Function) {
    if (steps[0] == this.END_EVENT) {
      console.info('case success!!');
      done();
    }

    console.info('case EVENT:::EVENT::::!!' + steps[0]);
    switch (steps[0]) {
      case this.CREATE_EVENT:
        steps.shift();
        await media.createAVScreenCaptureRecorder().then((captureRecorder) => {
          if (captureRecorder != null) {
            avScreenCaptureRecorder = captureRecorder;
            this.avScreenCaptureRecorder = avScreenCaptureRecorder;
            console.info('createAVScreenCaptureRecorder success');
            this.toNextStep2(avScreenCaptureRecorder, avConfig2, recorderTime, steps, done);
          } else {
            console.error('createAVScreenCaptureRecorder fail');
            expect().assertFail()
          }
        }).catch((error: BusinessError) => {
          console.error(`createAVScreenCaptureRecorder catchCallback, error message:${error.message}`);
          expect().assertFail()
        });

        break;
      case this.INITWITHERROR_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.init(avConfig2).then(() => {
          console.info('avScreenCaptureRecorder init success');
          this.toNextStep2(avScreenCaptureRecorder, avConfig2, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('avScreenCaptureRecorder initwitherror failed, error: ' + err.message);
          console.info('avScreenCaptureRecorder initwitherror failed, error code is:' + err.code)
          expect(err.code).assertEqual(401)
          if (avConfig2.fd == -1) {
            let mySteps = new Array(
              this.END_EVENT);
            this.toNextStep2(avScreenCaptureRecorder, avConfig2, recorderTime, steps, done);
          } else {
            console.error('avScreenCaptureRecorder init failed, error: ' + err.message);
            expect().assertFail()
          }
        });
        done();
        break;
      case this.STARTRECORDER_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.startRecording().then(() => {
          console.info('avScreenCaptureRecorder start success');
        }).catch((err: BusinessError) => {
          console.error('avScreenCaptureRecorder start failed, error: ' + err.message);
          expect().assertFail()
        })

        await this.driveFnNoSleep(1)
        setTimeout(() => {
          this.toNextStep2(avScreenCaptureRecorder, avConfig2, recorderTime, steps, done);
        }, recorderTime);

        break;
      case this.SKIPPRIVACYMODE_EVENT:
        steps.shift();
        let windowAllIds = [];
        await avScreenCaptureRecorder?.skipPrivacyMode(windowAllIds).then(() => {
          console.info('avScreenCaptureRecorder skipPrivacyMode success');
          this.toNextStep2(avScreenCaptureRecorder, avConfig2, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('avScreenCaptureRecorder skipPrivacyMode failed, error: ' + err.message);
          expect().assertFail()
        })

        break;
      case this.STOPRECORDER_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.stopRecording().then(() => {
          console.info('avScreenCaptureRecorder stop success');
          this.toNextStep2(avScreenCaptureRecorder, avConfig2, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('avScreenCaptureRecorder stop failed, error: ' + err.message);
          expect().assertFail()
        })

        break;
      case this.RELEASECORDER_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.release().then(() => {
          console.info('avScreenCaptureRecorder release success');
          this.avScreenCaptureRecorder = null;
          this.toNextStep2(avScreenCaptureRecorder, avConfig2, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('avScreenCaptureRecorder release failed, error: ' + err.message);
          expect().assertFail();
        })

        this.closeFd(this.outputFdObject.fd);

        break;
      case this.SET_MIC_ENABLE_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.setMicEnabled(true).then(() => {
          console.info('avScreenCaptureRecorder setMicEnabled success');
          this.toNextStep2(avScreenCaptureRecorder, avConfig2, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('avScreenCaptureRecorder setMicEnabled failed, error: ' + err.message);
          expect().assertFail()
        })
        break;
      case this.AV_CREATEAVPLAYER:
        steps.shift();
        this.AvPlayerMp4(this.outputName, avConfig2, done)
        break;
      default:
        break;
    }
  }

  AvPlayerMp4(outputName: string, avConfig: media.AVScreenCaptureRecordConfig, done: Function) {
    media.createAVPlayer((err, video) => {
      console.info(`case media err: ${err}`)
      if (typeof (video) != 'undefined') {
        console.info('case createAVPlayer success');
        this.avPlayer = video;

        this.avFileDescriptor = this.getFd(outputName)
        if (typeof (this.avFileDescriptor) == 'string') {
          console.info('case src test');
          this.avPlayer.url = this.avFileDescriptor;
        } else {
          console.info('case fdsrc test');
          this.avPlayer.fdSrc = this.avFileDescriptor;
        }

        let surfaceID: string = globalThis.value;
        console.error(`case INITIALIZED , surfaceID is ${surfaceID}`);
        this.avPlayer?.on('stateChange', async (state, reason) => {
          switch (state) {
            case this.AV_INITIALIZED:
              if (!this.avPlayer) {
                console.info(`avPlayer is null`);
                break;
              }
              console.info(`case INITIALIZED`);
              console.error(`case INITIALIZED , surfaceID is ${surfaceID}`);
              this.avPlayer.surfaceId = surfaceID;
              expect(this.avPlayer.state).assertEqual(this.AV_INITIALIZED);

              setTimeout(() => {
                this.avPlayer?.prepare((err) => {
                  console.info('case prepare called' + err);
                  if (err != null) {
                    console.error(`case prepare error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                  } else if (this.avPlayer) {
                    console.info('case avPlayer.duration: ' + this.avPlayer.duration);
                  }
                });
              }, 1000);

              break;
            case this.AV_PREPARED:
              if (this.avPlayer != null) {
                this.getTrackDescriptionTest(this.avPlayer, avConfig, done)
              }
              this.avPlayer?.play().then(() => {
                console.info('Succeeded in playing');
              }, (err: BusinessError) => {
                console.error('Failed to play,error message is :' + err.message)
              })
              break;
            case this.AV_PLAYING:
              if (this.avPlayer != null) {
                this.getTrackDescriptionTest(this.avPlayer, avConfig, done)
              }

              this.avPlayer?.stop().then(() => {
                console.info('avPlayer stop success');
                this.avPlayer?.release().then(() => {
                  console.info('avPlayer release success');
                }).catch((err: BusinessError) => {
                  console.info('avPlayer release failed, error: ' + err.message);
                  expect().assertFail()
                })
              }).catch((err: BusinessError) => {
                console.info('avPlayer stop failed, error: ' + err.message);
                expect().assertFail()
              })
              break;
            case this.AV_RELEASED:
              this.avPlayer = null;
              this.closeFd(this.avFileDescriptor.fd)
              done();
              break;
            case this.AV_ERROR:
              expect().assertFail();
              this.avPlayer?.release().then(() => {
                console.info('avPlayer release success');
              }).catch((err: BusinessError) => {
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
      if (err != null) {
        console.error(`case createAVPlayer error, errMessage is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

  }

  getTrackDescriptionTest(avPlayer: media.AVPlayer, avConfig: media.AVScreenCaptureRecordConfig, done: Function) {

    avPlayer?.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
      if (arrList != null) {
        for (let i = 0; i < arrList.length; i++) {
          console.info(`case getTrackDescription is ${JSON.stringify(arrList[i])}`);
          if (arrList[i]['codec_mime'].toString() == "audio/mp4a-latm") {
            expect(Number(arrList[i]['bitrate']) / 3).assertLess(avConfig.audioBitrate);
            expect(Number(arrList[i]['sample_rate'])).assertEqual(avConfig.audioSampleRate);
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
    console.info(`case come in driveFn 111`)
    let driver = await UiDriver.create()
    console.info(`driver is ${JSON.stringify(driver)}`)
    console.info(`UiDriver start`)
    await this.msleepAsync(3000)
    for (let i = 0; i < num; i++) {
      let button = await driver.findComponent(BY.text('允许'))
      if (button == null) {
        continue;
      }
      console.info(`button is ${JSON.stringify(button)}`)
      if (await driver.findComponent(BY.text('允许')) != null) {
        await button.click()
      }
    }
    await this.msleepAsync(500)
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

  // wait asynchronously
  async msleepAsync(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  resourceName() {
    let timestamp = Date.now();
    let filename = `avScreenCapture_${timestamp}.mp4`;
    return filename;
  }

  getFd(outputName: string) {
    outputName = globalThis.abilityContext.filesDir + "/" + outputName;
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

  audioRen: audio.AudioRenderer | ESObject;

  async playPcmPromise() {
    console.info(`${this.TAG}: Promise : Audio playPcmPromise Function`);
    let audioStreamInfo: audio.AudioStreamInfo = {
      samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
      channels: audio.AudioChannel.CHANNEL_2,
      sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
      encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
    };

    let audioRendererInfo: audio.AudioRendererInfo = {
      content: audio.ContentType.CONTENT_TYPE_MUSIC,
      usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
      rendererFlags: 0
    };

    let audioRendererOptions: audio.AudioRendererOptions = {
      streamInfo: audioStreamInfo,
      rendererInfo: audioRendererInfo
    };
    if (this.audioRen) {
      return;
    }

    await audio.createAudioRenderer(audioRendererOptions).then((data) => {
      this.audioRen = data;
      console.info(`${this.TAG}: AudioRender Created : Success : Stream Type: SUCCESS`);
    }).catch((err: BusinessError) => {
      console.info(`${this.TAG}: AudioRender Created : ERROR : ${err.message}`);
    });
    let bufferSize: number = 0;

    class Options {
      offset?: number;
      length?: number;
    }

    let filePath = globalThis.abilityContext.filesDir + '/f32le_44100_2_dayuhaitang.pcm'
    let stat = await fs.stat(filePath)
    let file: fs.File = await fs.openSync(filePath, fs.OpenMode.READ_ONLY);

    await this.audioRen.on('writeData', (buffer: ArrayBuffer) => {
      console.info(`${this.TAG}: writeDataCallback : ${buffer.byteLength}`);

      let options: Options = {
        offset: bufferSize,
        length: buffer.byteLength
      }
      fs.readSync(file.fd, buffer, options);
      bufferSize += buffer.byteLength;
      if (bufferSize > stat.size) {
        bufferSize = 0
      }
    });

    console.info(`${this.TAG}: AudioRenderer : Path : ${filePath}`);

    console.info(`${this.TAG}: AudioRenderer : STATE : ${this.audioRen.state}`);

  }

  async playPcmPromiseStart() {

    await this.audioRen.start().then(() => {
      console.info(`${this.TAG}: renderInstant started :SUCCESS `);
    }).catch((err: BusinessError) => {
      console.info(`${this.TAG}: renderInstant start :ERROR : ${err.message}`);
    });
  }

  async playPcmPromiseStop() {

    await this.audioRen.stop().then(() => {
      console.info(`${this.TAG}: renderInstant stop :SUCCESS `);
    }).catch((err: BusinessError) => {
      console.info(`${this.TAG}: renderInstant stop :ERROR : ${err.message}`);
    });
  }

  async isSupportSceneboard() {
    let cmd = "aa dump -a|grep com.ohos.sceneboard"
    let result = await delegator.executeShellCommand(cmd);
    console.info('isSupportSceneboard result case', JSON.stringify(result));
    let exitCode: number = result['exitCode']
    console.info('isSupportSceneboard exitCode case', JSON.stringify(exitCode));
    return exitCode;
  }
}

