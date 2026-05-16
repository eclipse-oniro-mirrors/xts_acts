/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import deviceInfo from '@ohos.deviceInfo'
import media from '@ohos.multimedia.media'
import camera from '@ohos.multimedia.camera'
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import display from '@ohos.display';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import eventEmitter from '@ohos.events.emitter';
import Common from './Common.test';
import { globalThis } from './Util.test';
import { FdObject } from './Common.test';
import common from '@ohos.app.ability.common';
import audio from "@ohos.multimedia.audio";
import fs from '@ohos.file.fs';

const TAG = "avVideoRecorderTestOne: ";

let commonFun = new Common();

export function avVideoRecorderTestOne() {
  describe('avVideoRecorderTestOne', () => {
    let screen: boolean = false;
    let avRecorder: media.AVRecorder | undefined = undefined;
    let isInitCamera = false;
    const recorderTime = 3000;
    const RECORDER_LONG_TIME = 3600000;
    const LOOP_TIMES = 1000;
    const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
    const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
    const ONLYAUDIO_TYPE = 'only_audio';
    let trackArray: ESObject;
    let fdObject: FdObject;
    let fdPath: string;
    let maxAmplitudeStartTimes = 0;
    let maxAmplitudePauseTimes = 0;
    let TAG = "[avVideoRecorderTestOne] ";
    let avProfile: media.AVRecorderProfile = {
      audioBitrate: 48000,
      audioChannels: 2,
      audioCodec: media.CodecMimeType.AUDIO_AAC,
      audioSampleRate: 48000,
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 280000, // 视频比特率
      videoCodec: media.CodecMimeType.VIDEO_AVC,
      videoFrameWidth: 640, // 视频分辨率的宽
      videoFrameHeight: 480, // 视频分辨率的高
      videoFrameRate: 30 // 视频帧率
    }

    let lo: media.Location = {
      latitude: 35, 
      longitude: 135,
    }

    let metaData: media.AVMetadata = {
      genre: "{marketing-name:\"HHH XXX\"}",
      videoOrientation: "180",
      location: lo,
      customInfo: {
        "com.hh.version": "5",
      } as Record<string, string>
    }

    let lo1: media.Location = {
      latitude: 30, longitude: 130
    }

    let AutoCreateConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfile,
      url: '',
      fileGenerationMode: media.FileGenerationMode.APP_CREATE,
    }

    let avmetaConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfile,
      url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
      metadata: metaData,
    }

    let avConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfile,
      url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
    }

    let avProfileMpeg: media.AVRecorderProfile = {
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 280000,
      videoCodec: media.CodecMimeType.VIDEO_AVC,
      videoFrameWidth: 640,
      videoFrameHeight: 480,
      videoFrameRate: 30
    }
    let avConfigMpeg: media.AVRecorderConfig = {
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfileMpeg,
      url: 'fd://35',
    }
    let avProfileMpegAac: media.AVRecorderProfile = {
      audioBitrate: 48000,
      audioChannels: 2,
      audioCodec: media.CodecMimeType.AUDIO_AAC,
      audioSampleRate: 48000,
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 280000,
      videoCodec: media.CodecMimeType.VIDEO_AVC,
      videoFrameWidth: 640,
      videoFrameHeight: 480,
      videoFrameRate: 30
    }
    let avConfigMpegAac: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfileMpegAac,
      url: 'fd://35',
    }
    let avProfileH264: media.AVRecorderProfile = {
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 280000,
      videoCodec: media.CodecMimeType.VIDEO_AVC,
      videoFrameWidth: 640,
      videoFrameHeight: 480,
      videoFrameRate: 30
    }
    let avConfigH264: media.AVRecorderConfig = {
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfileH264,
      url: 'fd://35',
    }

    let avProfileH265: media.AVRecorderProfile = {
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 280000,
      videoCodec: media.CodecMimeType.VIDEO_HEVC,
      videoFrameWidth: 640,
      videoFrameHeight: 480,
      videoFrameRate: 30
    }
    let avConfigH265: media.AVRecorderConfig = {
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfileH265,
      url: 'fd://35',
    }

    let avProfileH264Aac: media.AVRecorderProfile = {
      audioBitrate: 48000,
      audioChannels: 2,
      audioCodec: media.CodecMimeType.AUDIO_AAC,
      audioSampleRate: 48000,
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 280000,
      videoCodec: media.CodecMimeType.VIDEO_AVC,
      videoFrameWidth: 640,
      videoFrameHeight: 480,
      videoFrameRate: 30
    }
    let avConfigH264Aac: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfileH264Aac,
      url: 'fd://35',
    }

    let avProfileH265Aac: media.AVRecorderProfile = {
      audioBitrate: 48000,
      audioChannels: 2,
      audioCodec: media.CodecMimeType.AUDIO_AAC,
      audioSampleRate: 48000,
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 280000,
      videoCodec: media.CodecMimeType.VIDEO_HEVC,
      videoFrameWidth: 640,
      videoFrameHeight: 480,
      videoFrameRate: 30,
      isHdr: false,
      enableTemporalScale: false
    }
    let avConfigH265Aac: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
      profile: avProfileH265Aac,
      url: 'fd://35',
    }

    let avConfigOnlyAac: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      profile: avProfileH264Aac,
      url: 'fd://35',
    }

    const CREATE_CALLBACK_EVENT = 'createCallback';
    const SETONCALLBACK_EVENT = 'setAvRecorderCallback';
    const SETOFFCALLBACK_EVENT = 'setOffAvRecorderCallback';
    const SETPHOTOASSETCALLBACK_EVENT = 'setPhotoAssetCallback';
    const SETOFFPHOTOASSETCALLBACK_EVENT = 'setOffPhotoAssetCallback';
    const PREPARE_CALLBACK_EVENT = 'prepareCallback';
    const GETINPUTSURFACE_CALLBACK_EVENT = 'getInputSurfaceCallback';
    const INITCAMERA_EVENT = 'initCamera';
    const STARTCAMERA_EVENT = 'startCameraOutput';
    const STOPCAMERA_EVENT = 'stopCameraOutput';
    const STARTRECORDER_CALLBACK_EVENT = 'startCallback';
    const PAUSERECORDER_CALLBACK_EVENT = 'pauseCallback';
    const RESUMERECORDER_CALLBACK_EVENT = 'resumeCallback';
    const STOPRECORDER_CALLBACK_EVENT = 'stopCallback';
    const RESETRECORDER_CALLBACK_EVENT = 'resetCallback';
    const RELEASECORDER_CALLBACK_EVENT = 'releaseCallback';
    const RELEASECAMERA_EVENT = 'releaseCamera';
    const CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT = 'audioCapturerInfoCallback';
    const ENCODER_INFO_CALLBACK_EVENT = 'availableEncoderCallback';
    const MAX_AMPLITUDE_CALLBACK_EVENT = 'maxAmplitudeCallback';
    const END_EVENT = 'end';

    const CREATE_PROMISE_EVENT = 'createPromise';
    const PREPARE_PROMISE_EVENT = 'preparePromise';
    const GETINPUTSURFACE_PROMISE_EVENT = 'getInputSurfacePromise';
    const GETAVRECORDERCONFIG_PROMISE_EVENT = 'getAVRecorderConfigPromise';
    const STARTRECORDER_PROMISE_EVENT = 'startPromise';
    const PAUSERECORDER_PROMISE_EVENT = 'pausePromise';
    const RESUMERECORDER_PROMISE_EVENT = 'resumePromise';
    const STOPRECORDER_PROMISE_EVENT = 'stopPromise';
    const RESETRECORDER_PROMISE_EVENT = 'resetPromise';
    const RELEASECORDER_PROMISE_EVENT = 'releasePromise';
    const CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT = 'audioCapturerInfoPromise';
    const ENCODER_INFO_PROMISE_EVENT = 'availableEncoderPromise';
    const MAX_AMPLITUDE_PROMISE_EVENT = 'maxAmplitudePromise';

    const UPDATE_ROTATION_EVENT = 'updateRotationEvent';

    let cameraManager: camera.CameraManager;
    let videoOutput: camera.VideoOutput;
    let captureSession: camera.VideoSession | null = null;
    let cameraInput: camera.CameraInput;
    let previewOutput: camera.PreviewOutput;
    let cameraOutputCap: camera.CameraOutputCapability;
    let videoSurfaceId: string | undefined = undefined;
    let myProfile: camera.VideoProfile;
    let isSupportCameraVideoProfiles = true;
    let isCorrectSize = (size: camera.Size, standardWidth: number, standardHeight: number) => {
      return (size.width <= standardWidth) && (size.height <= standardHeight);
    }
    let getVideoProfile =
      (sizeList: Array<camera.VideoProfile>, width: number, height: number, toList: Array<camera.VideoProfile>, index: number) => {
        console.log('display width: ' + width + ', height: ' + height);
        let aVvideoProfile: camera.VideoProfile;
        for (let i = 0; i < sizeList.length; i++) {
          const size = sizeList[i].size;
          if (isCorrectSize(size, width, height)) {
            if (!aVvideoProfile || size.width > aVvideoProfile.size.width) {
              aVvideoProfile = sizeList[i];
            }
          }
        }
        toList.splice(index.toInt(), 0, aVvideoProfile);
        console.log('choosen aVvideoProfile: ' + JSON.stringify(aVvideoProfile));
      }

    let checkDevice = (avConfig: media.AVRecorderConfig) => {
      if (deviceInfo.deviceType === 'default') {
        avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
      } else {
        avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
      }
      avConfig.profile.videoFrameWidth = myProfile.size.width as int;
      avConfig.profile.videoFrameHeight = myProfile.size.height as int;
    }
    beforeAll(async (): Promise<void> => {
      screen = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so')
      console.info(TAG + 'beforeAll in1');
      let context: common.UIAbilityContext;
      context = globalThis.getContext();
      console.info(TAG + 'initCamera 002');
      cameraManager = camera.getCameraManager(context)
      console.info(TAG + 'initCamera 003');
      if (!cameraManager) {
        console.error("camera.getCameraManager error")
        return new Promise<void>((resolve, reject) => {
          resolve(undefined)
        });
      }
      let cameras = cameraManager.getSupportedCameras();
      let cameraDevice = cameras[0];
      console.info(TAG + 'initCamera 006');
      try {
        let cameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG + 'initCamera cameraOutputCapability ' + JSON.stringify(cameraOutputCapability));
        if (cameraOutputCapability?.videoProfiles) {
          console.info(TAG + 'initCamera 007');
          try {
            let availableVideoProfileList: camera.VideoProfile[] = [];
            getVideoProfile(cameraOutputCapability.videoProfiles, 720, 1280,
              availableVideoProfileList, 0);
            myProfile = availableVideoProfileList[0];
            let configs =
              [avConfig, avConfigMpeg, avConfigMpegAac, avConfigH264, avConfigH264Aac, avConfigH265, avConfigH265Aac]
            for (let i = 0; i < configs.length; i++) {
              checkDevice(configs[i])
            }
            avConfigH264.profile.videoBitrate = 280000;
            avConfigH264Aac.profile.videoBitrate = 280000;
          } catch (exception) {
            console.error(TAG + 'Failed to obtain the default display object. Code: ' + JSON.stringify(exception));
          }
          console.info('beforeAll out');
        } else {
          isSupportCameraVideoProfiles = false;
          console.error(TAG + 'Failed to obtain the default videoProfiles object.Not support usb camera');
          console.error(TAG + 'beforeAll out');
        }
      } catch (exception) {
        console.error(TAG + 'getSupportedOutputCapability error: ' + JSON.stringify(exception));
      }
      console.info(TAG + 'beforeAll out');
    })

    beforeEach(async () => {
      console.info('beforeEach case');
      if (isSupportCameraVideoProfiles) {
        await commonFun.sleep(1000);
        fdObject = {
          fileAsset: null,
          fdNumber: null
        };
      }
    })

    afterEach(async () => {
      console.info('afterEach case');
      if (isSupportCameraVideoProfiles) {
        isInitCamera = false
        if (avRecorder != null) {
          avRecorder.release().then(() => {
            console.info(TAG + 'this testCase execution completed')
          }).catch(commonFun.catchCallback);
        }
        await commonFun.closeFd(fdObject?.fdNumber);
        await commonFun.sleep(1000);
      }
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    let eventEmitterFun =
      (avRecorder: media.AVRecorder | undefined, avConfig: media.AVRecorderConfig, recorderTime: number, mySteps: string[],
        done: () => void) => {
      let ed: Record<String, RecordData> = {
          'avConfig': avConfig,
          'recorderTime': recorderTime,
          'mySteps': mySteps,'done': done
        }
      if (avRecorder != undefined) {
          ed["avRecorder"] = avRecorder!
      }
      let eventData: eventEmitter.EventData = {
          data: ed
        }
      eventEmitter.emit(mySteps[0], eventData);
      }
    let toNextStep =
      (avRecorder: media.AVRecorder|undefined, avConfig: media.AVRecorderConfig, recorderTime: number, steps: string[],
        done: () => void) => {
      try {
        if (steps[0] == END_EVENT) {
          console.info('case success!!');
          done ? done() : null;
        } else {
          eventEmitterFun(avRecorder, avConfig, recorderTime, steps, done);
        }
      } catch (error) {
        console.log(TAG + 'toNextStep is error: ' + error);
      }
    };

    let initCamera = async (
      avRecorder: media.AVRecorder,
      avConfig: media.AVRecorderConfig,
      recorderTime: number,
      steps: string[],
      done: () => void
    ) => {
      // 获取相机列表
      let cameras = cameraManager.getSupportedCameras();
      let cameraDevice = cameras[0];
      // 查询相机设备在模式下支持的输出能力
      let cameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, camera.SceneMode.NORMAL_VIDEO);
      // 创建相机输入流
      try {
        cameraInput = cameraManager.createCameraInput(cameraDevice);
        console.info('createCameraInput success');
      } catch (error) {
        console.error('Failed to createCameraInput errorCode = ' + error);
      }
      // 监听cameraInput错误信息
      cameraInput.onError(cameraDevice, (error: BusinessError | null) => {
        console.log(`Camera input error code: ${error!!.code}`);
      });

      // 创建VideoOutput对象
      // let profile = cameraOutputCapability.videoProfiles[0];
      let profile: camera.VideoProfile = myProfile;
      console.log('choosen[0] profile: ' + JSON.stringify(profile));
      try {
        videoOutput = cameraManager.createVideoOutput(profile, videoSurfaceId!!);
        console.info('createVideoOutput success');
      } catch (error) {
        console.error('Failed to create the videoOutput instance. errorCode = ' + error);
      }
      // 监听视频输出错误信息
      videoOutput.onError((error: BusinessError | null) => {
        console.log(`Preview output error code: ${error!!.code}`);
      });

      // 创建previewOutput输出对象
      let surfaceId: string = globalThis.value;
      let previewProfile = cameraOutputCapability.previewProfiles[0];
      console.log('choosen[0] previewProfile: ' + JSON.stringify(previewProfile));
      try {
        previewOutput = cameraManager.createPreviewOutput(previewProfile, surfaceId);
        console.info('createPreviewOutput success');
      } catch (error) {
        console.error('Failed to create the PreviewOutput instance errorCode = ' + error);
      }

      // 打开相机
      await cameraInput.open();

      //创建会话
      try {
        captureSession = cameraManager.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
        console.info('createCaptureSession success');
      } catch (error) {
        console.error('Failed to create the CaptureSession instance. errorCode = ' + error);
      }

      // 监听session错误信息
      captureSession?.onError((error: BusinessError | null) => {
        console.log(`Capture session error code: ${error!!.code}`);
      });

      // 开始配置会话
      try {
        captureSession?.beginConfig();
        console.info('beginConfig success');
      } catch (error) {
        console.error('Failed to beginConfig. errorCode = ' + error);
      }

      // 向会话中添加相机输入流
      try {
        captureSession?.addInput(cameraInput);
        console.info('captureSession?.addInput cameraInput success');
      } catch (error) {
        console.error('Failed to addInput. errorCode = ' + error);
      }

      // 向会话中添加预览输入流
      try {
        captureSession?.addOutput(previewOutput);
        console.info('captureSession?.addOutput previewOutput success');
      } catch (error) {
        console.error('Failed to addOutput(previewOutput). errorCode = ' + error);
      }

      // 向会话中添加录像输出流
      try {
        captureSession?.addOutput(videoOutput);
        console.info('captureSession?.addOutput videoOutput success');
      } catch (error) {
        console.error('Failed to addOutput(videoOutput). errorCode = ' + error);
      }

      // 提交会话配置
      await captureSession!!.commitConfig();

      // 启动会话
      await captureSession!!.start().then(() => {
        isInitCamera = true;
        console.log('captureSession start success.');
        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
      });
    };

    let releaseCameraError = async (avRecorder: media.AVRecorder, done: () => void) => {
      try {
        await captureSession!!.stop()
        console.info('releaseCameraError 001');
        console.info('captureSession?.stop success');
        await cameraInput.close()
        console.info('releaseCameraError 002');
        console.info('cameraInput.close success');
        await previewOutput.release()
        console.info('releaseCameraError 003');
        console.info('previewOutput.release success');
        await videoOutput.release()
        console.info('releaseCameraError 004');
        console.info('videoOutput.release success');
        await captureSession!!.release()
        console.info('releaseCameraError 005');
        console.info('captureSession?.release success');
        captureSession = null
        console.info('releaseCameraError success');
        done();
      } catch (err) {
        console.info('releaseCameraError failed and catch error is ' + err);
        done();
      }
    }

    let releaseRecorderPromise = async (avRecorder: media.AVRecorder, done: () => void) => {
      await commonFun.releasePromise(avRecorder);
      if (isInitCamera == true) {
        releaseCameraError(avRecorder, done);
      } else {
        done();
      }
    };

    let setAvRecorderCallback = async (avRecorder: media.AVRecorder, done: () => void) => {
      await commonFun.sleep(1000);
      // 状态机变化回调函数
      avRecorder.onStateChange((state, reason) => {
        console.info(TAG + 'current state is: ' + state);
      });
      // 录制监听回调函数
      avRecorder.onAudioCapturerChange((AudioCapturerChangeInfo) => {
        console.info(TAG + 'audioCapturerChange');
      });
      // 错误上报回调函数
      avRecorder.onError((err: BusinessError | null) => {
        try {
          console.error(TAG + 'error ocConstantSourceNode, error message is ' + err!!);
          await releaseRecorderPromise(avRecorder, done);
        } catch (error) {
          // 处理错误
          console.error(TAG + 'when error on execute releaseRecorderPromise error message is ' + error);
        }
      });
    };

    let setPhotoAssetAvailableCallback = (avRecorder: media.AVRecorder, done: () => void) => {
      avRecorder.onPhotoAssetAvailable((asset: photoAccessHelper.PhotoAsset) => {
        console.info(TAG + 'photoAssetAvailable called');
        if (asset != undefined) {
          commonFun.saveVideo(asset);
        } else {
          console.error(TAG + 'asset is undefined');
        }
        console.info(TAG + 'photoAssetAvailable end');
        done();
      })
    }

    let setOffPhotoAssetAvailableCallback = (avRecorder: media.AVRecorder, done: () => void) => {
      console.info('set off photoAssetAvailable ');
      avRecorder.offPhotoAssetAvailable();
      console.info('AVRecorder off photoAssetAvailable success');
    };

    eventEmitter.onEventData(CREATE_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_CALLBACK_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000);
      media.createAVRecorder((error: BusinessError | null, recorder: undefined | media.AVRecorder) => {
        if (recorder != null) {
          let avRecorder = recorder;
          expect(avRecorder.state).assertEqual('idle');
          console.info('createAVRecorder idleCallback success');
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        } else {
          console.info(`createAVRecorder idleCallback fail, error:${error}`);
          toNextStep(recorder, avConfig, recorderTime, mySteps, done);
        }
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(CREATE_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_PROMISE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000);
      media.createAVRecorder().then((recorder: media.AVRecorder | undefined) => {
        if (recorder != null) {
          let avRecorder = recorder;
          console.info('CREATE_PROMISE_EVENT createAVRecorder success');
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        } else {
          console.info('CREATE_PROMISE_EVENT createAVRecorder fail');
        }
      }).catch((error: Error) => {
        console.info(`CREATE_PROMISE_EVENT createAVRecorder catchCallback, error:${error}`);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(SETONCALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('SETONCALLBACK_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      try {
        setAvRecorderCallback(avRecorder, done)
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      } catch (error) {
        console.info('SETONCALLBACK_EVENT setAvRecorderCallback failed and catch error is ' + error);
      }
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(SETPHOTOASSETCALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_PROMISE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      try {
        setPhotoAssetAvailableCallback(avRecorder, done)
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      } catch (error) {
        console.info('setAvRecorderCallback failed and catch error is ' + error);
      }
    } as Callback<eventEmitter.EventData>);
    let setOffAvRecorderCallback = async (avRecorder: media.AVRecorder, done: Function) => {
      await commonFun.sleep(1000)
      // 关闭状态机变化回调函数
      avRecorder.offStateChange();
      console.info('AVRecorder off stateChange success');
      // 关闭错误上报回调函数
      avRecorder.offError();
      console.info('AVRecorder off error success');
    }
    eventEmitter.onEventData(SETOFFCALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('SETOFFCALLBACK_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      try {
        setOffAvRecorderCallback(avRecorder, done)
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      } catch (error: Error) {
        console.info('SETOFFCALLBACK_EVENT setOffAvRecorderCallback failed and catch error is ' + error.message);
      }
    } as Callback<eventEmitter.EventData>);
    eventEmitter.onEventData(SETOFFPHOTOASSETCALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('SETOFFPHOTOASSETCALLBACK_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      try {
        setOffPhotoAssetAvailableCallback(avRecorder, done)
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      } catch (error: Error) {
        console.info('setOffAvRecorderCallback failed and catch error is ' + error.message);
      }
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(PREPARE_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_PROMISE_EVENT eventData = ', JSON.stringify(eventData))
      try {
        let data = eventData.data as Record<String, RecordData>;
        let mySteps: string[] = data?.get('mySteps') as string[];
        mySteps.shift();
        let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
        let done: () => void = data?.get("done") as (() => void)
        let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
        let recorderTime: number = data?.get("recorderTime") as number
        await commonFun.sleep(1000)
        avRecorder.prepare(avConfig, (err: BusinessError | null) => {
          console.info('case prepare called');
          if (err == null) {
            console.error(`case prepare success, state is ${avRecorder.state}`);
            expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.PREPARED);
            console.info('prepare success');
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          } else {
            console.error(`case prepare error, errMessage is ${err!!.message}`);
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          }
        })
      } catch (error) {
        console.info('CREATE_PROMISE_EVENT failed and catch error is ' + error);
      }
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(UPDATE_ROTATION_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_PROMISE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      let rotation = 90
      avRecorder.updateRotation(rotation).then(() => {
        console.info('updateRotation success');
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }).catch((error: Error) => {
        console.error('updateRotation failed and catch error is ' + error);
        expect(false).assertEqual(true)
        done();
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(PREPARE_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_PROMISE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.PREPARED);
        console.info('prepare success');
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }).catch((err: Error) => {
        console.info('prepare failed and catch error is ' + err);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(GETINPUTSURFACE_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_PROMISE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.getInputSurface((err: BusinessError | null, surfaceId: undefined | string) => {
        if (err == null) {
          console.info('getInputSurface success');
          videoSurfaceId = surfaceId;
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        } else {
          console.info('getInputSurface failed and error is ' + err!!.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        }
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(GETINPUTSURFACE_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_PROMISE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.getInputSurface().then((surfaceId: string | undefined) => {
        console.info('getInputSurface success');
        videoSurfaceId = surfaceId;
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }).catch((err: Error) => {
        console.info('getInputSurface failed and catch error is ' + err.message);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(GETAVRECORDERCONFIG_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.getAVRecorderConfig().then((config: media.AVRecorderConfig | undefined) => {
        console.info('getAVRecorderConfig success');
        expect(config!!.audioSourceType).assertEqual(avConfig.audioSourceType);
        expect(config!!.profile.audioBitrate).assertEqual(avConfig.profile.audioBitrate);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }).catch((err: Error) => {
        console.info('getAVRecorderConfig failed and catch error is ' + err);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(INITCAMERA_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      try {
        initCamera(avRecorder, avConfig, recorderTime, mySteps, done);
      } catch (error) {
        console.info('initCamera failed and catch error is ' + error);
      }
    } as Callback<eventEmitter.EventData>);

    let startCameraOutput =
      async (avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig, recorderTime: number, steps: string[],
        done: () => void) => {
        console.info('startCameraOutput start')
        videoOutput.start((err: BusinessError | null) => {
          if (err) {
            console.error(`Failed to start the video output ${err!!.message}`);
          } else {
            console.log('Callback invoked to indicate the video output start success.');
            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
          }
        });
      }
    eventEmitter.onEventData(STARTCAMERA_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      try {
        startCameraOutput(avRecorder, avConfig, recorderTime, mySteps, done);
      } catch (error) {
        console.info('startCameraOutput failed and catch error is ' + error);
      }
    } as Callback<eventEmitter.EventData>);

    let stopCameraOutput =
      async (avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig, recorderTime: number, steps: string[],
        done: () => void) => {
        videoOutput.stop((err: BusinessError | null) => {
          if (err) {
            console.error(`Failed to stop the video output ${err!!.message}`);
          } else {
            console.log('Callback invoked to indicate the video output stop success.');
            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
          }
        });

      }
    eventEmitter.onEventData(STOPCAMERA_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      try {
        stopCameraOutput(avRecorder, avConfig, recorderTime, mySteps, done);
      } catch (error) {
        console.info('stopCameraOutput failed and catch error is ' + error);
      }
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(STARTRECORDER_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.start((err: BusinessError | null) => {
        console.info('case start called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.STARTED);
          console.info('start AVRecorder success');
          setTimeout(() => {
            console.info('STARTRECORDER_CALLBACK_EVENT setTimeout success');
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          }, recorderTime.toInt());
        } else {
          console.info('start AVRecorder failed and error is ' + err!!.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(STARTRECORDER_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.start().then(() => {
        expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.STARTED);
        console.info('start success');
        setTimeout(() => {
          console.info('STARTRECORDER_PROMISE_EVENT setTimeout success');
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        }, recorderTime.toInt());
      }).catch((err: Error) => {
        console.info('start failed and catch error is ' + err);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(PAUSERECORDER_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.pause((err: BusinessError | null) => {
        console.info('case pause called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.PAUSED);
          console.info('pause AVRecorder success');
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        } else {
          console.info('pause AVRecorder failed and error is ' + err!!.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(PAUSERECORDER_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.pause().then(() => {
        expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.PAUSED);
        console.info('pause AVRecorder success');
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }).catch((err: Error) => {
        console.info('pause failed and catch error is ' + err.message);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RESUMERECORDER_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      let resumeValue = true;
      avRecorder.resume((err: BusinessError | null) => {
        console.info('case resume called');
        if (err == null) {
          console.info('resume AVRecorder success');
          expect(resumeValue).assertEqual(true);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        } else {
          resumeValue = false
          console.info('resume AVRecorder failed and error is ' + err!!.message);
          console.info('resumeValue is ' + resumeValue);
          expect(resumeValue).assertEqual(false);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RESUMERECORDER_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      let resumeValue = true;
      avRecorder.resume().then(() => {
        console.info('resume success');
        expect(resumeValue).assertEqual(true);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }).catch((err: Error) => {
        resumeValue = false
        console.info('resume AVRecorder failed and error is ' + err.message);
        console.info('resumeValue is ' + resumeValue);
        expect(resumeValue).assertEqual(false);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(STOPRECORDER_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      let stopValue = true;
      avRecorder.stop((err: BusinessError | null) => {
        console.info('case stop called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.STOPPED);
          console.info('stop AVRecorder success');
          expect(stopValue).assertEqual(true);
          setTimeout(() => {
            console.info('STOPRECORDER_CALLBACK_EVENT setTimeout success');
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          }, 500);
        } else {
          stopValue = false
          console.info('stop AVRecorder failed and error is ' + err!!.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(STOPRECORDER_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      let stopValue = true;
      avRecorder.stop((err: BusinessError | null) => {
        console.info('case stop called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.STOPPED);
          console.info('stop AVRecorder success');
          expect(stopValue).assertEqual(true);
          setTimeout(() => {
            console.info('STOPRECORDER_PROMISE_EVENT setTimeout success');
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          }, 500);
        } else {
          stopValue = false
          console.info('stop AVRecorder failed and error is ' + err!!.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RESETRECORDER_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.reset((err: BusinessError | null) => {
        console.info('case reset called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.IDLE);
          console.info('reset AVRecorder success');
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        } else {
          console.info('reset AVRecorder failed and error is ' + err!!.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RESETRECORDER_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.reset().then(() => {
        expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.IDLE);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }).catch((err: Error) => {
        console.info('reset AVRecorder failed and catch error is ' + err.message);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RELEASECORDER_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.offAudioCapturerChange()
      avRecorder.release((err: BusinessError | null) => {
        console.info('case release called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
          console.info('release AVRecorder success');
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        } else {
          console.info('release AVRecorder failed and error is ' + err!!.message);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RELEASECORDER_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      await commonFun.sleep(1000)
      avRecorder.release().then(() => {
        expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
        console.info('release AVRecorder success');
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }).catch((err: Error) => {
        console.info('release AVRecorder failed and catch error is ' + err);
      });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(ENCODER_INFO_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      try {
        let data = eventData.data as Record<String, RecordData>;
        let mySteps: string[] = data?.get('mySteps') as string[];
        mySteps.shift();
        let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
        let done: () => void = data?.get("done") as (() => void)
        let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
        let recorderTime: number = data?.get("recorderTime") as number
        await commonFun.sleep(1000)
        let state: string = avRecorder.state;
        avRecorder.getAvailableEncoder().then((encoderInfo: Array<media.EncoderInfo>) => {
          if (state == commonFun.AV_RECORDER_STATE.RELEASED) {
            console.info('getAvailableEncoder in released state');
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          } else {
            console.info('getAvailableEncoder encoderInfo length: ' + encoderInfo.length);
            expect(encoderInfo.length).assertLarger(0);
            for (let i = 0; i < encoderInfo.length; i++) {
              if (encoderInfo[i].type == 'video') {
                console.info('getAvailableEncoder video encoder frameRate min ' + encoderInfo[i].frameRate!!.min);
                console.info('getAvailableEncoder video encoder frameRate max ' + encoderInfo[i].frameRate!!.max);
                let min: number = encoderInfo[i].frameRate!!.min;
                let max: number = encoderInfo[i].frameRate!!.max;
                if (min == 0 && max == 0) {
                  continue;
                }
                expect(encoderInfo[i].frameRate!!.max).assertLarger(0);
              } else {
                console.info('getAvailableEncoder audio encoder bitrate min ' + encoderInfo[i].bitRate!!.min);
                console.info('getAvailableEncoder audio encoder bitrate max ' + encoderInfo[i].bitRate!!.max);
                let min: number = encoderInfo[i].frameRate!!.min;
                let max: number = encoderInfo[i].frameRate!!.max;
                if (min == 0 && max == 0) {
                  continue;
                }
                expect(encoderInfo[i].bitRate!!.max).assertLarger(0);
              }
            }
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          }
        }).catch((error: Error) => {
          console.info('avRecorder getAvailableEncoder failed and catch error is: ' + error.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        })
      } catch (error) {
        console.info('ENCODER_INFO_PROMISE_EVENT failed and catch error is ' + error);
      }
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(MAX_AMPLITUDE_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get('avRecorder') as media.AVRecorder;
      let done: () => void = data?.get('done') as () => void;
      let avConfig: media.AVRecorderConfig = data?.get('avConfig') as media.AVRecorderConfig;
      let recorderTime: number = data?.get('recorderTime') as number;
      await commonFun.sleep(1000);
      let state: string = avRecorder.state;
      avRecorder
        .getAudioCapturerMaxAmplitude()
        .then((maxAmplitude: int) => {
          switch (state) {
            case commonFun.AV_RECORDER_STATE.IDLE as string:
              maxAmplitudeStartTimes = 0;
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in idle state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.PREPARED as string:
              maxAmplitudeStartTimes = 0;
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in prepared state');
              expect(maxAmplitude).assertEqual(0);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.STARTED as string:
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in started state');
              if (maxAmplitudeStartTimes != 0) {
                expect(maxAmplitude).assertLarger(0);
              }
              maxAmplitudeStartTimes++;
              commonFun.msleep(300);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.PAUSED as string:
              maxAmplitudeStartTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in paused state');
              if (maxAmplitudePauseTimes != 0) {
                expect(maxAmplitude).assertEqual(0);
              }
              maxAmplitudePauseTimes++;
              commonFun.msleep(100);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.STOPPED as string:
              maxAmplitudeStartTimes = 0;
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in stopped state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.RELEASED as string:
              maxAmplitudeStartTimes = 0;
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in released state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            default:
              break;
          }
        })
        .catch((error: Error) => {
          console.info('avRecorder getAudioCapturerMaxAmplitude failed and catch error is ' + error.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        });
    } as Callback<eventEmitter.EventData>);

    let releaseCamera =
      async (avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig, recorderTime: number, steps: string[],
        done: () => void) => {
        try {
          await captureSession!!.stop()
          console.info('releaseCamera 001');
          console.info('captureSession?.stop success');
          await cameraInput.close()
          console.info('releaseCamera 002');
          console.info('cameraInput.close success');
          await previewOutput.release()
          console.info('releaseCamera 003');
          console.info('previewOutput.release success');
          await videoOutput.release()
          console.info('releaseCamera 004');
          console.info('videoOutput.release success');
          await captureSession!!.release()
          console.info('releaseCamera 005');
          console.info('captureSession?.release success');
          captureSession = null
          console.info('releaseCamera success');
          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        } catch (err) {
          console.info('releaseCamera failed and catch error is ' + err);
          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        }
      };

    eventEmitter.onEventData(RELEASECAMERA_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get('avRecorder') as media.AVRecorder;
      let done: () => void = data?.get('done') as () => void;
      let avConfig: media.AVRecorderConfig = data?.get('avConfig') as media.AVRecorderConfig;
      let recorderTime: number = data?.get('recorderTime') as number;
      await commonFun.sleep(1000);
      try {
        releaseCamera(avRecorder, avConfig, recorderTime, mySteps, done);
      } catch (error) {
        console.info('releaseCamera failed and catch error is ' + error);
      }
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(ENCODER_INFO_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get('avRecorder') as media.AVRecorder;
      let done: () => void = data?.get('done') as () => void;
      let avConfig: media.AVRecorderConfig = data?.get('avConfig') as media.AVRecorderConfig;
      let recorderTime: number = data?.get('recorderTime') as number;
      await commonFun.sleep(1000);
      try {
        let state: string = avRecorder.state;
        avRecorder.getAvailableEncoder((err: BusinessError | null, encoderInfo: Array<media.EncoderInfo> | undefined) => {
          if (state == commonFun.AV_RECORDER_STATE.RELEASED) {
            console.info('getAvailableEncoder in released state');
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          } else {
            console.info('getAvailableEncoder encoderInfo length: ' + encoderInfo!!.length);
            expect(encoderInfo!!.length).assertLarger(0);
            for (let i = 0; i < encoderInfo!!.length; i++) {
              if (encoderInfo!![i].type == 'video') {
                console.info('getAvailableEncoder video encoder frameRate min ' + encoderInfo!![i].frameRate!!.min);
                console.info('getAvailableEncoder video encoder frameRate max ' + encoderInfo!![i].frameRate!!.max);
                let min: number = encoderInfo!![i].frameRate!!.min;
                let max: number = encoderInfo!![i].frameRate!!.max;
                if (min == 0 && max == 0) {
                  continue;
                }
                expect(encoderInfo!![i].frameRate!!.max).assertLarger(0);
              } else {
                console.info('getAvailableEncoder audio encoder bitrate min ' + encoderInfo!![i].bitRate!!.min);
                console.info('getAvailableEncoder audio encoder bitrate max ' + encoderInfo!![i].bitRate!!.min);
                let min: number = encoderInfo!![i].frameRate!!.min;
                let max: number = encoderInfo!![i].frameRate!!.max;
                if (min == 0 && max == 0) {
                  continue;
                }
                expect(encoderInfo!![i].bitRate!!.max).assertLarger(0);
              }
            }
            toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
          }
        });
      } catch (error) {
        console.info('avRecorder getAvailableEncoder failed and catch error is ' + error);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(MAX_AMPLITUDE_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get('avRecorder') as media.AVRecorder;
      let done: () => void = data?.get('done') as () => void;
      let avConfig: media.AVRecorderConfig = data?.get('avConfig') as media.AVRecorderConfig;
      let recorderTime: number = data?.get('recorderTime') as number;
      await commonFun.sleep(1000);
      try {
        let state: string = avRecorder.state;
        avRecorder.getAudioCapturerMaxAmplitude((err: BusinessError | null, maxAmplitude: int | undefined) => {
          switch (state) {
            case commonFun.AV_RECORDER_STATE.IDLE as string:
              maxAmplitudeStartTimes = 0;
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in idle state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.PREPARED as string:
              maxAmplitudeStartTimes = 0;
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in prepared state');
              expect(maxAmplitude).assertEqual(0);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.STARTED as string:
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in started state');
              if (maxAmplitudeStartTimes != 0) {
                expect(maxAmplitude).assertLarger(0);
              }
              maxAmplitudeStartTimes++;
              commonFun.msleep(300);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.PAUSED as string:
              maxAmplitudeStartTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in paused state');
              if (maxAmplitudePauseTimes != 0) {
                expect(maxAmplitude).assertEqual(0);
              }
              maxAmplitudePauseTimes++;
              commonFun.msleep(100);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.STOPPED as string:
              maxAmplitudeStartTimes = 0;
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in stopped state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.RELEASED as string:
              maxAmplitudeStartTimes = 0;
              maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in released state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            default:
              break;
          }
        });
      } catch (error) {
        console.info('avRecorder getAudioCapturerMaxAmplitude failed and catch error is ' + error);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get('avRecorder') as media.AVRecorder;
      let done: () => void = data?.get('done') as () => void;
      let avConfig: media.AVRecorderConfig = data?.get('avConfig') as media.AVRecorderConfig;
      let recorderTime: number = data?.get('recorderTime') as number;
      await commonFun.sleep(1000);
      let state: string = avRecorder.state;
      avRecorder
        .getCurrentAudioCapturerInfo()
        .then((captureInfo: audio.AudioCapturerChangeInfo | undefined) => {
          switch (state) {
            case commonFun.AV_RECORDER_STATE.IDLE as string:
              console.info('getCurrentAudioCapturerInfo in idle state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.PREPARED as string:
              console.info('getCurrentAudioCapturerInfo in prepared state');
              expect(captureInfo!.capturerState).assertEqual(commonFun.AV_RECORDER_AUDIO_STATE.PREPARED);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.STARTED as string:
              console.info('getCurrentAudioCapturerInfo in started state');
              expect(captureInfo!.capturerState).assertEqual(commonFun.AV_RECORDER_AUDIO_STATE.STARTED);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.PAUSED as string:
              console.info('getCurrentAudioCapturerInfo in paused state');
              expect(captureInfo!.capturerState).assertEqual(commonFun.AV_RECORDER_AUDIO_STATE.PAUSED);
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.STOPPED as string:
              console.info('getCurrentAudioCapturerInfo in stopped state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            case commonFun.AV_RECORDER_STATE.RELEASED as string:
              console.info('getCurrentAudioCapturerInfo in released state');
              toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
              break;
            default:
              break;
          }
        })
        .catch((error: Error) => {
          console.info('getCurrentAudioCapturerInfo failed and catch error is ' + error.message);
          toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
        });
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT, (eventData: eventEmitter.EventData) => {
      let data = eventData.data as Record<String, RecordData>;
      let mySteps: string[] = data?.get('mySteps') as string[];
      mySteps.shift();
      let avRecorder: media.AVRecorder = data?.get('avRecorder') as media.AVRecorder;
      let done: () => void = data?.get('done') as () => void;
      let avConfig: media.AVRecorderConfig = data?.get('avConfig') as media.AVRecorderConfig;
      let recorderTime: number = data?.get('recorderTime') as number;
      await commonFun.sleep(1000);
      try {
        let state: string = avRecorder.state;
        avRecorder.getCurrentAudioCapturerInfo(
          (err: BusinessError | null, captureInfo: audio.AudioCapturerChangeInfo | undefined) => {
            switch (state) {
              case commonFun.AV_RECORDER_STATE.IDLE as string:
                console.info('getCurrentAudioCapturerInfo in idle state');
                toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
                break;
              case commonFun.AV_RECORDER_STATE.PREPARED as string:
                console.info('getCurrentAudioCapturerInfo in prepared state');
                expect(captureInfo!.capturerState).assertEqual(commonFun.AV_RECORDER_AUDIO_STATE.PREPARED);
                toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
                break;
              case commonFun.AV_RECORDER_STATE.STARTED as string:
                console.info('getCurrentAudioCapturerInfo in started state');
                expect(captureInfo!.capturerState).assertEqual(commonFun.AV_RECORDER_AUDIO_STATE.STARTED);
                toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
                break;
              case commonFun.AV_RECORDER_STATE.PAUSED as string:
                console.info('getCurrentAudioCapturerInfo in paused state');
                expect(captureInfo!.capturerState).assertEqual(commonFun.AV_RECORDER_AUDIO_STATE.PAUSED);
                toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
                break;
              case commonFun.AV_RECORDER_STATE.STOPPED as string:
                console.info('getCurrentAudioCapturerInfo in stopped state');
                toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
                break;
              case commonFun.AV_RECORDER_STATE.RELEASED as string:
                console.info('getCurrentAudioCapturerInfo in released state');
                toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
                break;
              default:
                break;
            }
          }
        );
      } catch (error) {
        console.info('avRecorder getCurrentAudioCapturerInfo failed and catch error is ' + error);
        toNextStep(avRecorder, avConfig, recorderTime, mySteps, done);
      }
    } as Callback<eventEmitter.EventData>);

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0100
     * @tc.desc   Recorder video start-pause-resume-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0400
     * @tc.desc   Recorder video start-pause-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0500
     * @tc.desc   Recorder video start-stop-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0600
     * @tc.desc   Recorder video start-reset-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0800
     * @tc.desc   Recorder create-prepare-getInputSurface-start-pause-resume-resume-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0400
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0500
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0600
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // RESET
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0800
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0500
     * @tc.desc   Recorder start-pause-resume-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0500
     * @tc.desc   Recorder video resume-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        //pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        //resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0500
     * @tc.desc   Recorder video start-resume-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0100
     * @tc.desc   Recorder video create-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      console.info('avRecorderResumeCallBack1 test start');
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0200
     * @tc.desc   Recorder video prepare-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0300
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0700
     * @tc.desc   Recorder create-prepare-getInputSurface-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700 end');
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0100
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0200
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0300
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0700
     * @tc.desc   Recorder video start-resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700 end');
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0300
     * @tc.desc   Recorder video start-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0400
     * @tc.desc   Recorder video start-pause-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400 end');
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0600
     * @tc.desc   Recorder start-reset-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0800
     * @tc.desc   Recorder start-stop-stop-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0100
     * @tc.desc   Recorder video create-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0200
     * @tc.desc   Recorder video prepare-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0300
     * @tc.desc   Recorder video start-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0300 end');
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0400
     * @tc.desc   Recorder video pause-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        //pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0400 end');
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0600
     * @tc.desc   Recorder video reset-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0700
     * @tc.desc   Recorder video getInputSurface-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT,
        // start recorder
        STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0800
     * @tc.desc   Recorder video start-stop-stop-stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0100
     * @tc.desc   Recorder video create-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      console.info('avRecorderResumeCallBack1 test start');
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0200
     * @tc.desc   Recorder video prepare-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0300
     * @tc.desc   Recorder video start-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0400
     * @tc.desc   Recorder video start-pause-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0500
     * @tc.desc   Recorder video start-resume-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0600
     * @tc.desc   Recorder video start-stop-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0700
     * @tc.desc   Recorder create-prepare-getInputSurface-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0800
     * @tc.desc   Recorder create-prepare-getInputSurface-start-reset-reset-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0100
     * @tc.desc   Recorder video create-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0200
     * @tc.desc   Recorder video prepare-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0300
     * @tc.desc   Recorder video start-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0400
     * @tc.desc   Recorder video start-pause-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0400 end');
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0600
     * @tc.desc   Recorder video start-stop-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0700
     * @tc.desc   Recorder create-prepare-getInputSurface-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0800
     * @tc.desc   Recorder create-prepare-getInputSurface-start-reset-reset-reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0800 end');
      done();
    })

    // promise prepare
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0100
     * @tc.desc   1.create 2.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2PreparePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0200
     * @tc.desc   1.create 2.prepare 3.start 4.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.start2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0300
     * @tc.desc   1.create 2.prepare 3.start 4.pause 5.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.pause2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0400
     * @tc.desc   1.create 2.prepare 3.start 4.pause 5.resume 6.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.resume2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0500
     * @tc.desc   1.create 2.prepare 3.start 4.stop 5.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.stopPromise
        STOPRECORDER_PROMISE_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.stop2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0600
     * @tc.desc   1.create 2.prepare 3.start 4.reset 5.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.resetPromise
        RESETRECORDER_PROMISE_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.reset2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0700
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // releaseRecorderCallBack
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.getInputSurface2PreparePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0800
     * @tc.desc   1.create 2.prepare 3.prepare 4.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      let loopTimes = 3;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT
      );
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          // preparePromise
          PREPARE_PROMISE_EVENT,
          // AVRecorderTestBase.resetPromise
          RESETRECORDER_PROMISE_EVENT,
        )
      }
      mySteps.push(
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      )
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.prepare3TimesPromise(avConfig, avRecorder, loopTimes, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0900
     * @tc.desc   1.create 2.prepare (audioBitrate -1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: -1,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: 48000,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);

      // commonFun.avConfigChangedPromise(avNewConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1000
     * @tc.desc   1.create 2.prepare (audioSampleRate -1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: 48000,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: -1,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);

      // commonFun.avConfigChangedPromise(avNewConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1100
     * @tc.desc   1.create 2.prepare (videoBitrateRange -1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: 48000,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: 48000,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: -1, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.avConfigChangedPromise(avNewConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1200
     * @tc.desc   1.create 2.prepare (videoFrameRate -1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: 48000,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: 48000,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: -1 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);

      // commonFun.avConfigChangedPromise(avNewConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200 end');
      done();
    })

    // Promise getInputSurface
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0100
     * @tc.desc   1.create 2.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2GetInputSurfacePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0200
     * @tc.desc   1.create 2.prepare 3.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2GetInputSurfacePromise2(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0300
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2GetInputSurfacePromise3(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0400
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2GetInputSurfacePromise4(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0500
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2GetInputSurfacePromise5(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0600
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.stopPromise
        STOPRECORDER_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2GetInputSurfacePromise6(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0700
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.resetPromise
        RESETRECORDER_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2GetInputSurfacePromise7(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0800
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.getInputSurface 5.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      let loopTimes = 3;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT
      );
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          // getInputSurfacePromise
          GETINPUTSURFACE_PROMISE_EVENT
        )
      }
      mySteps.push(
        // initCamera
        INITCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      )
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.getInputSurface3TimesPromise(avConfig, avRecorder, loopTimes, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800 end');
      done();
    })

    // Promise start
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0100
     * @tc.desc   1.create 2.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0200
     * @tc.desc   1.create 2.prepare 4.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.prepare2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0300
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.pause2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0400
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.resume2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0500
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.stopPromise
        STOPRECORDER_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.stop2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0600
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.resetPromise
        RESETRECORDER_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.reset2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0700
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.getInputSurface2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0800
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.start 6.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      let loopTimes = 3;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT
      );
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          // startRecordingProcessPromise
          STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
          // AVRecorderTestBase.resetPromise
          RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
          // AVRecorderTestBase.preparePromise
          PREPARE_PROMISE_EVENT,
        )
      }
      mySteps.push(
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      )
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800 end');
      done();
    })

    // Promise pause
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0100
     * @tc.desc   1.create 2.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.create2PausePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0200
     * @tc.desc   1.create 2.prepare 3.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.prepare2PausePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0300
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.start2PausePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0400
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        //? resumeRecordingProcessPromise
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.resume2PausePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0500
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.stopPromise
        STOPRECORDER_PROMISE_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.stop2PausePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0600
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.resetPromise
        RESETRECORDER_PROMISE_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.reset2PausePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0700
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.getInputSurface2PausePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0800
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.pause 7.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      let loopTimes = 3;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT
      );
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          // pauseRecordingProcessPromise
          PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
          //? resumeRecordingProcessPromise
          STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT
        )
      }
      mySteps.push(
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      )
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800 end');
      done();
    })

    // 状态切换
    // 01.promise回调方式
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0100
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2ReleaseWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0200
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2PauseWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0300
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2ResumeWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0400
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stopRecordingProcessPromise
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2StopWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0500
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // resetRecordingProcessPromise
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0600
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.stop 7.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        // stopRecordingProcessPromise
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2Pause2StopWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0700
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.reset 7.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        // resetRecordingProcessPromise
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2Pause2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0800
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.stop 8.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // stopRecordingProcessPromise
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2Resume2WithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0900
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.reset 8.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // resetRecordingProcessPromise
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2reset2WithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1000
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1000 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1100
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1100 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2PauseWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1200
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1200 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1300
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1300 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stopRecordingProcessPromise
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2StopWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1400
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1400 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // resetRecordingProcessPromise
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);

      // commonFun.recordStart2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1400 end');
      done();
    })

    // 02.callback回调
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0100
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0200
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0300
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0400
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0500
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0600
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.stop 7.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0700
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.reset 7.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0800
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.stop 8.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0900
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.reset 8.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1000
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1000 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1100
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1200
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1300
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1400
     * @tc.desc   1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1400 end');
      done();
    })

    // Callback  prepare
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0100
     * @tc.desc   1.create 2.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // release avRecorde
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0200
     * @tc.desc   1.create 2.prepare 3.start 4.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0300
     * @tc.desc   1.create 2.prepare 3.start 4.pause 5.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pasue avRecorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0400
     * @tc.desc   1.create 2.prepare 3.start 4.pause 5.resume 6.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pasue avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0500
     * @tc.desc   1.create 2.prepare 3.start 4.stop 5.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0600
     * @tc.desc   1.create 2.prepare 3.start 4.reset 5.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0700
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0800
     * @tc.desc   1.create 2.prepare 3.prepare 4.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0900
     * @tc.desc   1.create 2.prepare (audioBitrate -1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: -1,
        audioChannels: 2,
        audioSampleRate: 48000,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000,
        videoCodec: media.CodecMimeType.VIDEO_AVC,
        videoFrameWidth: 640,
        videoFrameHeight: 480,
        videoFrameRate: 30,
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1000
     * @tc.desc   1.create 2.prepare (audioSampleRate -1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: 48000,
        audioChannels: 2,
        audioSampleRate: -1,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000,
        videoCodec: media.CodecMimeType.VIDEO_AVC,
        videoFrameWidth: 640,
        videoFrameHeight: 480,
        videoFrameRate: 30,
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1100
     * @tc.desc   1.create 2.prepare (videoBitrateRange -1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: 48000,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: 48000,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: -1, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1200
     * @tc.desc   1.create 2.prepare (videoFrameRate -1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: 48000,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: 48000,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: -1 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avNewConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200 end');
      done();
    })

    // Callback getInputSurface
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0100
     * @tc.desc   1.create 2.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0200
     * @tc.desc   1.create 2.prepare 3.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0300
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0400
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0500
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0600
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0700
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0800
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.getInputSurface 5.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800 end');
      done();
    })

    // Callback start
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0100
     * @tc.desc   1.create 2.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
        // start avRecorder
        STARTRECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0200
     * @tc.desc   1.create 2.prepare 4.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // start avRecorder
        STARTRECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0300
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // start avRecorder
        STARTRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0400
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // start avRecorder
        STARTRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0500
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0600
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT,
        // start avRecorder
        STARTRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0700
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0800
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.start 6.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // start avRecorder
        STARTRECORDER_CALLBACK_EVENT,
        // start avRecorder
        STARTRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0800 end');
      done();
    })

    // Callback pause
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0100
     * @tc.desc   1.create 2.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0200
     * @tc.desc   1.create 2.prepare 3.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0300
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0400
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0500
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0600
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0700
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset avRecorder
        RESETRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0800
     * @tc.desc   1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.pause 7.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200 start')

      avProfileMpegAac.audioBitrate = 8000
      avProfileMpegAac.audioSampleRate = 8000
      avProfileMpegAac.videoBitrate = 280000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0300
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300 start')

      avProfileMpegAac.audioBitrate = 16000
      avProfileMpegAac.audioSampleRate = 32000
      avProfileMpegAac.videoBitrate = 560000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0400
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400 start')

      avProfileMpegAac.audioBitrate = 32000
      avProfileMpegAac.audioSampleRate = 44100
      avProfileMpegAac.videoBitrate = 1120000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0500
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500 start')

      avProfileMpegAac.audioBitrate = 112000
      avProfileMpegAac.audioSampleRate = 96000
      avProfileMpegAac.videoBitrate = 2240000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0600
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0700
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0800
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0900
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900 start')

      avProfileMpegAac.videoFrameRate = 5

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_1000
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000 start')

      avProfileMpegAac.videoFrameRate = 30

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_1200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpeg.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigMpeg, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0100
     * @tc.desc   Recorder video 1，record 3s； 2，pause 3，resume 4，stop 5，restart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0200 start')

      avProfileMpegAac.audioBitrate = 8000
      avProfileMpegAac.audioSampleRate = 8000
      avProfileMpegAac.videoBitrate = 280000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);
      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0300
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0300 start')

      avProfileMpegAac.audioBitrate = 16000
      avProfileMpegAac.audioSampleRate = 32000
      avProfileMpegAac.videoBitrate = 560000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0400
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
          console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
          expect(!isSupportCameraVideoProfiles).assertTrue();
          done();
        }
        console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0400 start');

        avProfileMpegAac.audioBitrate = 32000;
        avProfileMpegAac.audioSampleRate = 44100;
        avProfileMpegAac.videoBitrate = 1120000;

        let fileName: string = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        fdPath = 'fd://' + fdObject.fdNumber;
        avConfigMpegAac.url = fdPath;
        eventEmitter.off(CREATE_CALLBACK_EVENT);

        let mySteps = new Array<string>(
          // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
          // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
          // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
          // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
          // resume recorder
          STARTCAMERA_EVENT,
          RESUMERECORDER_CALLBACK_EVENT,
          // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
          // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
          // end
          END_EVENT
        );

        eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
        console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0400 end');
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0500
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0500 start')

      avProfileMpegAac.audioBitrate = 112000
      avProfileMpegAac.audioSampleRate = 96000
      avProfileMpegAac.videoBitrate = 2240000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0600
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0600 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0700
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0700 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0800
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0800 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0900
     * @tc.desc   Recorder video (test failed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0900 start')

      avProfileMpegAac.videoFrameRate = 5

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_1000
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1000 start')

      avProfileMpegAac.videoFrameRate = 30

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpegAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_1200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1200 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigMpeg.url = fdPath
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigMpeg, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0200 start')

      avProfileH264Aac.audioBitrate = 8000
      avProfileH264Aac.audioSampleRate = 8000
      avProfileH264Aac.videoBitrate = 280000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0300
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0300 start')

      avProfileH264Aac.audioBitrate = 16000
      avProfileH264Aac.audioSampleRate = 32000
      avProfileH264Aac.videoBitrate = 560000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0400
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0400 start')

      avProfileH264Aac.audioBitrate = 32000
      avProfileH264Aac.audioSampleRate = 44100
      avProfileH264Aac.videoBitrate = 1120000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0500
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0500 start')

      avProfileH264Aac.audioBitrate = 112000
      avProfileH264Aac.audioSampleRate = 96000
      avProfileH264Aac.videoBitrate = 2240000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0600
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0600 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0700
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0700 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0800
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0800 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0900
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0900 start')

      avProfileH264Aac.videoFrameRate = 5

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_1000
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1000 start')

      avProfileH264Aac.videoFrameRate = 30

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_1200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1200 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0100
     * @tc.desc   Recorder video (test failed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0200 start')

      avProfileH264Aac.audioBitrate = 8000
      avProfileH264Aac.audioSampleRate = 8000
      avProfileH264Aac.videoBitrate = 280000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0300
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0300 start')

      avProfileH264Aac.audioBitrate = 16000
      avProfileH264Aac.audioSampleRate = 32000
      avProfileH264Aac.videoBitrate = 560000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0400
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0400 start')

      avProfileH264Aac.audioBitrate = 32000
      avProfileH264Aac.audioSampleRate = 44100
      avProfileH264Aac.videoBitrate = 1120000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0500
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0500 start')

      avProfileH264Aac.audioBitrate = 112000
      avProfileH264Aac.audioSampleRate = 96000
      avProfileH264Aac.videoBitrate = 2240000

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0600
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0600 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0700
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0700 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0800
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0800 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0900
     * @tc.desc   Recorder video (test failed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0900 start')

      avProfileH264Aac.videoFrameRate = 5

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_1000
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1000 start')

      avProfileH264Aac.videoFrameRate = 30

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_1200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1200 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH264, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_static_0100
     * @tc.desc   1.create 2.prepare 3.getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH264Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // getAVRecorderConfigPromise
        GETAVRECORDERCONFIG_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH264Aac, recorderTime, mySteps, done);

      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH265Aac.url = fdPath;
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfigH265Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH265Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH265Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_static_0200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0200 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigH265Aac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigH265Aac, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0200 end');
      done();
    })
    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_static_0100
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigOnlyAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
        // start recorder
        STARTRECORDER_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_static_0100
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigOnlyAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT,
        // start recorder
        STARTRECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_0100 end');
      done();
    })

    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_static_0100
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigOnlyAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
        // start recorder
        STARTRECORDER_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_static_0100
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigOnlyAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT, MAX_AMPLITUDE_PROMISE_EVENT,
        // start recorder
        STARTRECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_PROMISE_EVENT, MAX_AMPLITUDE_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_PROMISE_EVENT, MAX_AMPLITUDE_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_PROMISE_EVENT, MAX_AMPLITUDE_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUM_MULTIMEDIA_MEDIA_ERRORCODE_ENUM_static_0100
     * @tc.number SUM_MULTIMEDIA_MEDIA_ERRORCODE_ENUM_static_0100
     * @tc.desc   Test Enumerate ErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_MEDIA_ERRORCODE_ENUM_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      let newErrorCode = media.AVErrorCode.AVERR_AUDIO_INTERRUPTED;
      console.info('AVERR_AUDIO_INTERRUPTED:' + newErrorCode);
      done();
    })

    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_UPDATE_ROTATION_static_0100
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_UPDATE_ROTATION_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_UPDATE_ROTATION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_UPDATE_ROTATION__0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigOnlyAac.url = fdPath
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
        //prepare avRecorder
        PREPARE_CALLBACK_EVENT,
        //update rotation
        UPDATE_ROTATION_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_UPDATE_ROTATION__0100 end');
      done();
    })

    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_CREATE_static_0100
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_CREATE_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_CREATE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_CREATE_0100 start')
      media.createAVRecorder((videoRecorder) => {

      })
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_CREATE_0100 end');
      done();
      done();
    })

    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_CREATE_static_0200
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_CREATE_static_0200
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_CREATE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_CREATE_0200 start')
      try {
        media.createAVRecorder();
      } catch (error) {

      }

      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_CREATE_0200 end');
      done();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_0100
     * @tc.desc   recorder (metadata)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avmetaConfig.url = fdPath;
      checkDevice(avmetaConfig);
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avmetaConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AVMETADATA_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_0200
     * @tc.desc   recorder (metadata)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200 start')
      let customInfo: Record<string, string> = {
        "test02": '1000',
      }
      if (avmetaConfig.metadata) {
        avmetaConfig.metadata!.customInfo = customInfo
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avmetaConfig.url = fdPath;
      checkDevice(avmetaConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avmetaConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_02001
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_02001
     * @tc.desc   recorder (metadata)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_static_02001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200 start')

      avmetaConfig.metadata ? avmetaConfig.metadata!.videoOrientation = "99" : null;

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avmetaConfig.url = fdPath;
      checkDevice(avmetaConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avmetaConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0100
     * @tc.desc   AudioSourceType set AUDIO_SOURCE_TYPE_VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0100 start')
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0200
     * @tc.desc   AudioSourceType set AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0200 start')
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0300
     * @tc.desc   AudioSourceType set AUDIO_SOURCE_TYPE_VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0300 start')
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0400
     * @tc.desc   AudioSourceType set AUDIO_SOURCE_TYPE_CAMCORDER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0400 start')
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avProfile,
        url: 'fd://35',
      }
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avNewConfig.url = fdPath;
      checkDevice(avNewConfig);
      eventEmitter.off(CREATE_PROMISE_EVENT);

      let mySteps = new Array<string>(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, avConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_static_0100
     * @tc.desc   recorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0100 start')
      //需要蓝黄区区分
      if (screen) {
        AutoCreateConfig.fileGenerationMode = media.FileGenerationMode.AUTO_CREATE_CAMERA_SCENE;
      }

      checkDevice(AutoCreateConfig);
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, SETPHOTOASSETCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, AutoCreateConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_static_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_static_0200
     * @tc.desc   recorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0200 start')
      //需要蓝黄区区分
      if (screen) {
        AutoCreateConfig.fileGenerationMode = media.FileGenerationMode.APP_CREATE;
      }
      checkDevice(AutoCreateConfig);
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, SETPHOTOASSETCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // release avRecorde
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, AutoCreateConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0200 end');
      done();
    })

    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_static_0100
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigOnlyAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT,
        // start recorder
        STARTRECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_0100 end');
      done();
    })
    /**
     * @tc.name   SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_static_0100
     * @tc.number SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_static_0100
     * @tc.desc   Recorder video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_0100 start')

      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfigOnlyAac.url = fdPath;
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT,
        // prepare avRecorder
        PREPARE_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT,
        // start recorder
        STARTRECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
      console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_0100 end');
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_OFF_static_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_OFF_static_0100
     * @tc.desc   AVRecorder	off_stateChange、off_error、off_audioCapturerChange、off_photoAssetAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_OFF_static_0100', Level.LEVEL0, async (done: () => void) => {
      if (!isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(!isSupportCameraVideoProfiles).assertTrue();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_OFF_0100 start')
      if (screen) {
        AutoCreateConfig.fileGenerationMode = media.FileGenerationMode.AUTO_CREATE_CAMERA_SCENE;
      }
      checkDevice(AutoCreateConfig);
      eventEmitter.off(CREATE_CALLBACK_EVENT);

      let mySteps = new Array<string>(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, SETPHOTOASSETCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // off event
        SETOFFCALLBACK_EVENT, SETOFFPHOTOASSETCALLBACK_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      eventEmitterFun(avRecorder, AutoCreateConfig, recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0100 end');
      done();
    })
  })
}
export function executeAVVideoRecorder(): boolean {
  let isSupportedCameras = true;
  let isExecute = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: Object) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info(TAG + 'Enter getCameraManagerInstance');
  try {
    let context: common.UIAbilityContext = globalThis.getContext();
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.error(TAG + "getCameraManager FAILED");
      isExecute = false;
      return isExecute;
    }
    console.info(TAG + 'Exit getCameraManagerInstance');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      isSupportedCameras = false;
    }
    // 获取支持的模式类型。
    let sceneModes: Array<camera.SceneMode> = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[0]);
    let isSupportVideoMode: boolean = sceneModes.indexOf(camera.SceneMode.NORMAL_VIDEO) >= 0;
      console.error(TAG + 'isSupportVideoMode: ' + isSupportVideoMode);
    if (!isSupportVideoMode) {
      console.error(TAG + 'video mode not support');
      isExecute = false;
      return isExecute;
    }
    let cameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_VIDEO);
    if (!cameraOutputCapability?.videoProfiles) {
      console.error(TAG + 'videoProfiles not support camera');
      isExecute = false;
      return isExecute;
    }
  } catch (err) {
    console.error(TAG + "getCameraManager FAILED. errorMessage:", err);
    isExecute = false;
    return isExecute;
  }
  if (isSupportedCameras) {
    isExecute = true;
  } else {
    isExecute = false;
  }
  console.info(TAG + 'Exit executeAVVideoRecorder' + isExecute);
  return isExecute;
}
