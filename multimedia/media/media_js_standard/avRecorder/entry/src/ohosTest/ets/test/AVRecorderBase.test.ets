import deviceInfo from '@ohos.deviceInfo'
import media from '@ohos.multimedia.media'
import { audio } from '@kit.AudioKit';
import camera from '@ohos.multimedia.camera'
import Common, { FdObject } from './Common';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

let mediaTestBase = new Common();

const CREATE_CALLBACK_EVENT = 'createCallback';
const SETONCALLBACK_EVENT = 'setAvRecorderCallback';
const SETPHOTOASSETCALLBACK_EVENT = 'setPhotoAssetCallback';
const PREPARE_CALLBACK_EVENT = 'prepareCallback';
const PREPARE_CALLBACK_ERR_EVENT = 'prepareCallbackErr';
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
const PREPARE_PROMISE_ERR_EVENT = 'preparePromiseERR';
const GETINPUTSURFACE_PROMISE_EVENT = 'getInputSurfacePromise';
const GETINPUTSURFACE_PROMISE_ERR_EVENT = 'getInputSurfacePromiseERR';
const GETAVRECORDERCONFIG_PROMISE_EVENT = 'getAVRecorderConfigPromise';
const STARTRECORDER_PROMISE_EVENT = 'startPromise';
const STARTRECORDER_PROMISE_ERR_EVENT = 'startPromiseErr';
const PAUSERECORDER_PROMISE_EVENT = 'pausePromise';
const PAUSERECORDER_PROMISE_ERR_EVENT = 'pausePromiseErr';
const RESUMERECORDER_PROMISE_EVENT = 'resumePromise';
const STOPRECORDER_PROMISE_EVENT = 'stopPromise';
const RESETRECORDER_PROMISE_EVENT = 'resetPromise';
const RELEASECORDER_PROMISE_EVENT = 'releasePromise';
const RELEASECORDER_TIMETEST_EVENT = 'release_time_test';
const START_TIMETEST_EVENT = 'start_time_test';
const END_TIMETEST_EVENT = 'end_time_test';
const CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT = 'audioCapturerInfoPromise';
const ENCODER_INFO_PROMISE_EVENT = 'availableEncoderPromise';
const MAX_AMPLITUDE_PROMISE_EVENT = 'maxAmplitudePromise';

const UPDATE_ROTATION_EVENT = 'updateRotationEvent';


let TAG = "[avVideoRecorderTestOne] ";

export default class AVRecorderBase {
  avRecorder: media.AVRecorder | undefined = undefined;
  cameraManager: camera.CameraManager | undefined = undefined;
  videoOutput: camera.VideoOutput | undefined = undefined;
  captureSession: camera.CaptureSession | undefined = undefined;
  cameraInput: camera.CameraInput | undefined = undefined;
  previewOutput: camera.PreviewOutput | undefined = undefined;
  cameraOutputCap: camera.CameraOutputCapability | undefined = undefined;
  videoSurfaceId: string | null = null;
  myProfile: ESObject;
  videoProfile: camera.VideoProfile | undefined = undefined;
  myPreviewProfile: camera.Profile | undefined = undefined;
  isInitCamera = false;
  recorderTime = 3000;
  RECORDER_LONG_TIME = 3600000;
  LOOP_TIMES = 1000;
  FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
  ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
  ONLYAUDIO_TYPE = 'only_audio';
  execTimes: Array<number> | null = null;
  fdPath: string = "";
  fdObject: FdObject = {
    fileAsset: null,
    fdNumber: null
  }
  maxAmplitudeStartTimes = 0;
  maxAmplitudePauseTimes = 0;
  avProfile: media.AVRecorderProfile = {
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
  metaData: media.AVMetadata = {
    genre: "{marketing-name:\"HHH XXX\"}",
    videoOrientation: "180",
    location: {
      latitude: 35, longitude: 135
    },
    customInfo: {
      "com.hh.version": "5",
    }
  }
  AutoCreateConfig: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfile,
    url: '',
    rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
    location: {
      latitude: 30, longitude: 130
    },
    fileGenerationMode: media.FileGenerationMode.APP_CREATE,
  }
  avmetaConfig: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfile,
    url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
    rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
    location: {
      latitude: 30, longitude: 130
    },
    metadata: this.metaData,
  }
  avConfig: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfile,
    url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
    rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
    location: {
      latitude: 30, longitude: 130
    },
  }
  avProfileMpeg: media.AVRecorderProfile = {
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 280000,
    videoCodec: media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
  }
  avConfigMpeg: media.AVRecorderConfig = {
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfileMpeg,
    url: 'fd://35',
    rotation: 0,
    location: {
      latitude: 30, longitude: 130
    }
  }
  avProfileMpegAac: media.AVRecorderProfile = {
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
  avConfigMpegAac: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfileMpegAac,
    url: 'fd://35',
    rotation: 0,
    location: {
      latitude: 30, longitude: 130
    }
  }
  avProfileH264: media.AVRecorderProfile = {
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 280000,
    videoCodec: media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
  }
  avConfigH264: media.AVRecorderConfig = {
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfileH264,
    url: 'fd://35',
    rotation: 0,
    location: {
      latitude: 30, longitude: 130
    }
  }
  avProfileH265: media.AVRecorderProfile = {
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 280000,
    videoCodec: media.CodecMimeType.VIDEO_HEVC,
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
  }
  avConfigH265: media.AVRecorderConfig = {
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfileH265,
    url: 'fd://35',
    rotation: 0,
    location: {
      latitude: 30, longitude: 130
    }
  }
  avProfileH264Aac: media.AVRecorderProfile = {
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
  avConfigH264Aac: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfileH264Aac,
    url: 'fd://35',
    rotation: 0,
    location: {
      latitude: 30, longitude: 130
    }
  }
  avProfileH265Aac: media.AVRecorderProfile = {
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
    enableTemporalScale: false,
    enableBFrame: true
  }
  avConfigH265Aac: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: this.avProfileH265Aac,
    url: 'fd://35',
    rotation: 0,
    location: {
      latitude: 30, longitude: 130
    }
  }
  avConfigOnlyAac: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    profile: this.avProfileH264Aac,
    url: 'fd://35',
    rotation: 0,
    location: {
      latitude: 30, longitude: 130
    }
  }
  isSupportCameraVideoProfiles = true;

  setProfileSize(videoProfiles: Array<camera.VideoProfile>, previewProfiles: Array<camera.Profile>) {
    console.log('已选择的视频配置文件: ' + JSON.stringify(videoProfiles));
    console.log('已选择的预览配置文件: ' + JSON.stringify(previewProfiles));

    let chosenVideoProfile: Array<camera.VideoProfile> = [];
    let chosenPreviewProfile: Array<camera.Profile> = [];
    outerLoop: for (let i = 0; i < videoProfiles.length; i++) {
      for (let j = 0; j < previewProfiles.length; j++) {
        if (this.checkIfRatiosAreEqual(videoProfiles[i], previewProfiles[j])) {
          chosenVideoProfile[0] = videoProfiles[i];
          chosenPreviewProfile[0] = previewProfiles[j];
          console.log('Selected chosenVideoProfile: ' + JSON.stringify(chosenVideoProfile));
          console.log('Selected chosenPreviewProfile: ' + JSON.stringify(chosenPreviewProfile));
          break outerLoop;
        }
      }
    }
    this.videoProfile = chosenVideoProfile[0];
    this.myPreviewProfile = chosenPreviewProfile[0];
    console.log('已选择的视频配置: ' + JSON.stringify(this.videoProfile));
    console.log('已选择的预览配置: ' + JSON.stringify(this.myPreviewProfile));
  }

  checkIfRatiosAreEqual(videoProfileSize: camera.VideoProfile, previewProfileSize: camera.Profile) {
    return (videoProfileSize.size.width / videoProfileSize.size.height) ===
      (previewProfileSize.size.width / previewProfileSize.size.height);
  }

  isSupportCamera() {
    console.info('initCamera 002');
    this.cameraManager = camera.getCameraManager(globalThis.abilityContext)
    console.info('initCamera 003');
    if (!this.cameraManager) {
      console.error("camera.getCameraManager error")
      return;
    }
    let cameras = this.cameraManager.getSupportedCameras();
    let cameraDevice = cameras[0];
    console.info('initCamera 006');
    let cameraOutputCapability = this.cameraManager.getSupportedOutputCapability(cameraDevice);
    if (cameraOutputCapability?.videoProfiles) {
      console.info('initCamera 007');
      this.setProfileSize(cameraOutputCapability.videoProfiles, cameraOutputCapability.previewProfiles);
      let configs =
        [this.avConfig, this.avConfigMpeg, this.avConfigMpegAac, this.avConfigH264, this.avConfigH264Aac,
          this.avConfigH265, this.avConfigH265Aac]
      for (let i = 0; i < configs.length; i++) {
        this.checkDevice(configs[i])
      }

      console.info('beforeAll out');

    } else {
      this.isSupportCameraVideoProfiles = false;
      console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
    }

  }

  checkDevice(avConfig: media.AVRecorderConfig) {
    if (deviceInfo.deviceType === 'default') {
      avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
    } else {
      avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
    }
    avConfig.profile.videoFrameWidth = this.videoProfile?.size.width;
    avConfig.profile.videoFrameHeight = this.videoProfile?.size.height;
  }

  async initCamera(avConfig: media.AVRecorderConfig, recorderTime: number,
    steps: Array<string>, done: Function) {

    if (!this.cameraManager) {
      console.error("camera.getCameraManager error")
      return;
    }
    // 获取相机列表
    let cameras = this.cameraManager?.getSupportedCameras();
    let cameraDevice = cameras[0];
    // 创建相机输入流
    try {
      this.cameraInput = this.cameraManager?.createCameraInput(cameraDevice);
      console.info('createCameraInput success');
    } catch (error) {
      console.error('Failed to createCameraInput errorCode = ' + error.code);
    }
    // 监听cameraInput错误信息
    this.cameraInput?.on('error', cameraDevice, (error: BusinessError) => {
      console.log(`Camera input error code: ${error.code}`);
    })

    // 创建VideoOutput对象
    // let profile = cameraOutputCapability.videoProfiles[0];
    let profile = this.videoProfile;
    console.log('Selected[0] createVideoOutput profile: ' + JSON.stringify(profile));
    try {
      this.videoOutput = this.cameraManager?.createVideoOutput(profile, this.videoSurfaceId)
      console.info('createVideoOutput success');
    } catch (error) {
      console.error('Failed to create the videoOutput instance. errorCode = ' + error.code);
    }
    // 监听视频输出错误信息
    this.videoOutput?.on('error', (error: BusinessError) => {
      console.log(`Preview output error code: ${error.code}`);
    })

    // 创建previewOutput输出对象
    let surfaceId: string = globalThis.value;
    let previewProfile = this.myPreviewProfile;
    console.log('Selected[0] createPreviewOutput previewProfile: ' + JSON.stringify(previewProfile));
    try {
      this.previewOutput = this.cameraManager?.createPreviewOutput(previewProfile, surfaceId)
      console.info('createPreviewOutput success');
    } catch (error) {
      console.error('Failed to create the PreviewOutput instance errorCode = ' + error.code);
    }

    // 打开相机
    await this.cameraInput?.open();

    //创建会话
    try {
      this.captureSession = this.cameraManager?.createCaptureSession()
      console.info('createCaptureSession success');
    } catch (error) {
      console.error('Failed to create the CaptureSession instance. errorCode = ' + error.code);
    }

    // 监听session错误信息
    this.captureSession?.on('error', (error: BusinessError) => {
      console.log(`Capture session error code: ${error.code}`);
    })

    // 开始配置会话
    try {
      this.captureSession?.beginConfig()
      console.info('beginConfig success');
    } catch (error) {
      console.error('Failed to beginConfig. errorCode = ' + error.code);
    }

    // 向会话中添加相机输入流
    try {
      this.captureSession?.addInput(this.cameraInput)
      console.info('captureSession?.addInput cameraInput success');
    } catch (error) {
      console.error('Failed to addInput. errorCode = ' + error.code);
    }

    // 向会话中添加预览输入流
    try {
      this.captureSession?.addOutput(this.previewOutput)
      console.info('captureSession?.addOutput previewOutput success');
    } catch (error) {
      console.error('Failed to addOutput(previewOutput). errorCode = ' + error.code);
    }

    // 向会话中添加录像输出流
    try {
      this.captureSession?.addOutput(this.videoOutput)
      console.info('captureSession?.addOutput videoOutput success');
    } catch (error) {
      console.error('Failed to addOutput(videoOutput). errorCode = ' + error.code);
    }

    // 提交会话配置
    await this.captureSession?.commitConfig()

    // 启动会话
    await this.captureSession?.start().then(() => {
      this.isInitCamera = true
      console.log('captureSession start success.');
      this.toNextStep(avConfig, recorderTime, steps, done);
    })
  }

  setAvRecorderCallback(done: Function) {
    // 状态机变化回调函数
    this.avRecorder?.on('stateChange', (state, reason) => {
      console.info(TAG + 'current state is: ' + state);
    })
    // 录制监听回调函数
    this.avRecorder?.on('audioCapturerChange', (AudioCapturerChangeInfo) => {
      console.info(TAG + 'audioCapturerChange');
    });
    // 错误上报回调函数
    this.avRecorder?.on('error', async (err) => {
      try {
        console.error(TAG + 'error ocConstantSourceNode, error message is ' + err);
        await this.releaseRecorderPromise(done);
      } catch (error) {
        // 处理错误
        console.error(TAG + 'when error on execute releaseRecorderPromise error message is ' + error);
      }
    });
  }

  setPhotoAssetAvailableCallback(done: Function) {
    this.avRecorder?.on('photoAssetAvailable', (asset) => {
      console.info(TAG + 'photoAssetAvailable called');
      if (asset != undefined) {
        mediaTestBase.saveVideo(asset);
      } else {
        console.error(TAG + 'asset is undefined');
      }
      console.info(TAG + 'photoAssetAvailable end');
    })
  }

  async releaseRecorderPromise(done: Function) {
    await this.releasePromise()
    if (this.isInitCamera == true) {
      this.releaseCameraError(done)
    } else {
      done();
    }
  }

  async releasePromise() {
    this.avRecorder?.release().then(() => {
      expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.RELEASED);
    }).catch((err: BusinessError) => {
      console.info('release AVRecorder failed and catch error is ' + err.message);
    });
  }

  async startCameraOutput(avConfig: media.AVRecorderConfig, recorderTime: number,
    steps: Array<string>, done: Function) {
    console.info('startCameraOutput start')
    await this.videoOutput?.start(async (err: BusinessError) => {
      if (err) {
        console.error(`Failed to start the video output ${err.message}`);
        return;
      }
      console.log('Callback invoked to indicate the video output start success.');
      this.toNextStep(avConfig, recorderTime, steps, done);
    });
  }

  async stopCameraOutput(avConfig: media.AVRecorderConfig, recorderTime: number,
    steps: Array<string>, done: Function) {
    await this.videoOutput?.stop((err: BusinessError) => {
      if (err) {
        console.error(`Failed to stop the video output ${err.message}`);
        return;
      }
      console.log('Callback invoked to indicate the video output stop success.');
      this.toNextStep(avConfig, recorderTime, steps, done);
    });

  }

  async toNextStep(avConfig: media.AVRecorderConfig, recorderTime: number,
    steps: Array<string>, done: Function) {
    if (steps[0] == END_EVENT) {
      console.info('case done() success!!');
      done();
    }

    let currentSteps = steps[0]
    console.info('case into currentSteps Event:!!' + currentSteps);
    steps.shift();
    // await mediaTestBase.msleepAsync(500)
    switch (currentSteps) {
      case CREATE_CALLBACK_EVENT:

        media.createAVRecorder((error, recorder) => {
          if (recorder != null) {
            this.avRecorder = recorder;
            expect(this.avRecorder?.state).assertEqual('idle');
            console.info('createAVRecorder idleCallback success');
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.info(`createAVRecorder idleCallback fail, error:${error}`);
            expect().assertFail()
            // this.toNextStep(avConfig, recorderTime, steps, done);
          }
        });
        break;
      case CREATE_PROMISE_EVENT:

        media.createAVRecorder().then((recorder) => {
          if (recorder != null) {
            this.avRecorder = recorder;
            console.info('createAVRecorder success');
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.info('createAVRecorder fail');
          }
        }).catch((error: BusinessError) => {
          console.info(`createAVRecorder catchCallback, error:${error}`);
          expect().assertFail()
          // this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case SETONCALLBACK_EVENT:

        try {
          this.setAvRecorderCallback(done)
          this.toNextStep(avConfig, recorderTime, steps, done);
        } catch (error) {
          console.error('setAvRecorderCallback failed and catch error is ' + error.message);
          //expect().assertFail()
        }
        break;
      case SETPHOTOASSETCALLBACK_EVENT:

        try {
          this.setPhotoAssetAvailableCallback(done)
          this.toNextStep(avConfig, recorderTime, steps, done);
        } catch (error) {
          console.error('setAvRecorderCallback failed and catch error is ' + error.message);
          expect().assertFail()
        }
        break;
      case PREPARE_CALLBACK_EVENT:

        this.avRecorder?.prepare(avConfig, async (err) => {
          console.info('case prepare called');
          if (err == null) {
            console.info(`case prepare success, state is ${this.avRecorder?.state}`);
            expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.PREPARED);
            console.info('prepare success');
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail()
            // this.toNextStep(avConfig, recorderTime, steps, done);
          }
        })
        break;
      case PREPARE_CALLBACK_ERR_EVENT:
        try {
          this.avRecorder?.prepare(avConfig, (err) => {
            console.info('case prepare called');
            if (err == null) {
              expect().assertFail()
            } else {
              console.error(`case prepare error, errMessage is ${err.message}`);
              this.toNextStep(avConfig, recorderTime, steps, done);
            }
          })
        } catch (error) {
          console.info('PREPARE_CALLBACK_ERR_EVENT error is: ' + error)
        }

        break;
      case UPDATE_ROTATION_EVENT:

        let rotation = 90
        this.avRecorder?.updateRotation(rotation).then(() => {
          console.info('updateRotation success');
          this.toNextStep(avConfig, recorderTime, steps, done);
        }).catch((error: BusinessError) => {
          console.error('updateRotation failed and catch error is ' + error.message);
          expect().assertFail()
        });
        break;
      case PREPARE_PROMISE_EVENT:

        this.avRecorder?.prepare(avConfig).then(() => {
          expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.PREPARED);
          console.info('prepare success');
          this.toNextStep(avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('prepare failed and catch error is ' + err.message);
          expect().assertFail()
        });
        break;
      case PREPARE_PROMISE_ERR_EVENT:

        this.avRecorder?.prepare(avConfig).then(() => {
          console.error('getInputSurface failed and EVENT is ' + PREPARE_PROMISE_ERR_EVENT);
          expect().assertFail()
        }).catch((err: BusinessError) => {
          console.info('prepare failed and catch error is ' + err.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case GETINPUTSURFACE_CALLBACK_EVENT:

        this.avRecorder?.getInputSurface((err, surfaceId) => {
          if (err == null) {
            console.info('getInputSurface success');
            this.videoSurfaceId = surfaceId;
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.info('getInputSurface failed and error is ' + err.message);
            this.toNextStep(avConfig, recorderTime, steps, done);
          }
        });
        break;
      case GETINPUTSURFACE_PROMISE_EVENT:

        this.avRecorder?.getInputSurface().then((surfaceId) => {
          console.info('getInputSurface success');
          this.videoSurfaceId = surfaceId;
          this.toNextStep(avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('getInputSurface failed and catch error is ' + err.message);
          expect().assertFail()
        });
        break;
      case GETINPUTSURFACE_PROMISE_ERR_EVENT:

        this.avRecorder?.getInputSurface().then((surfaceId) => {
          console.error('getInputSurface failed and EVENT is ' + GETINPUTSURFACE_PROMISE_ERR_EVENT);
          expect().assertFail()
        }).catch((err: BusinessError) => {
          console.info('getInputSurface failed and catch error is ' + err.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case GETAVRECORDERCONFIG_PROMISE_EVENT:

        this.avRecorder?.getAVRecorderConfig().then((config: media.AVRecorderConfig) => {
          console.log('Selected getAVRecorderConfig config: ' + JSON.stringify(config));
          console.info('getAVRecorderConfig success');
          expect(config.audioSourceType).assertEqual(avConfig.audioSourceType);
          console.log('Selected getAVRecorderConfig avConfig.profile.audioBitrate: ' +
          JSON.stringify(avConfig.profile.audioBitrate));
          expect(config.profile.audioBitrate).assertEqual(avConfig.profile.audioBitrate);

          this.toNextStep(avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('getAVRecorderConfig failed and catch error is ' + err.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case INITCAMERA_EVENT:

        try {
          this.initCamera(avConfig, recorderTime, steps, done)
        } catch (error) {
          console.error('initCamera failed and catch error is ' + error.message);
        }
        break;
      case STARTCAMERA_EVENT:

        try {
          this.startCameraOutput(avConfig, recorderTime, steps, done)
        } catch (error) {
          console.error('startCameraOutput failed and catch error is ' + error.message);
        }
        break;
      case STOPCAMERA_EVENT:

        try {
          this.stopCameraOutput(avConfig, recorderTime, steps, done)
        } catch (error) {
          console.error('stopCameraOutput failed and catch error is ' + error.message);
        }
        break;
      case STARTRECORDER_CALLBACK_EVENT:

        this.avRecorder?.start((err) => {
          console.info('case start called');
          if (err == null) {
            expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.STARTED);
            console.info('start AVRecorder success');
            setTimeout(() => {
              console.info('STARTRECORDER_CALLBACK_EVENT setTimeout success');
              this.toNextStep(avConfig, recorderTime, steps, done);
            }, recorderTime);
          } else {
            console.info('start AVRecorder failed and error is ' + err.message);
            this.toNextStep(avConfig, recorderTime, steps, done);
          }
        })
        break;
      case STARTRECORDER_PROMISE_EVENT:

        this.avRecorder?.start().then(() => {
          expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.STARTED);
          console.info('start success');
          setTimeout(() => {
            console.info('STARTRECORDER_PROMISE_EVENT setTimeout success');
            this.toNextStep(avConfig, recorderTime, steps, done);
          }, recorderTime);
        }).catch((err: BusinessError) => {
          console.error('start failed and catch error is ' + err.message);
          expect(false).assertEqual(true)
        });
        break;
      case STARTRECORDER_PROMISE_ERR_EVENT:

        this.avRecorder?.start().then(() => {
          console.error('getInputSurface failed and EVENT is ' + STARTRECORDER_PROMISE_ERR_EVENT);

        }).catch((err: BusinessError) => {
          console.info('start failed and catch error is ' + err.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case PAUSERECORDER_CALLBACK_EVENT:

        this.avRecorder?.pause((err: BusinessError) => {
          console.info('case pause called');
          if (err == null) {
            expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.PAUSED);
            console.info('pause AVRecorder success');
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.info('pause AVRecorder failed and error is ' + err.message);
            this.toNextStep(avConfig, recorderTime, steps, done);
          }
        })
        break;
      case PAUSERECORDER_PROMISE_EVENT:

        this.avRecorder?.pause().then(() => {
          expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.PAUSED);
          console.info('pause AVRecorder success');
          this.toNextStep(avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('pause failed and catch error is ' + err.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case PAUSERECORDER_PROMISE_ERR_EVENT:
        this.avRecorder?.pause().then(() => {
          console.error('getInputSurface failed and EVENT is ' + PAUSERECORDER_PROMISE_ERR_EVENT);

        }).catch((err: BusinessError) => {
          console.info('pause failed and catch error is ' + err.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case RESUMERECORDER_CALLBACK_EVENT:

        let resumeValue = true;
        this.avRecorder?.resume((err: BusinessError) => {
          console.info('case resume called');
          if (err == null) {
            console.info('resume AVRecorder success');
            expect(resumeValue).assertEqual(true);
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            resumeValue = false
            console.info('resume AVRecorder failed and error is ' + err.message);
            console.info('resumeValue is ' + resumeValue);
            expect(resumeValue).assertEqual(false);
            this.toNextStep(avConfig, recorderTime, steps, done);
          }
        })
        break;
      case RESUMERECORDER_PROMISE_EVENT:

        let resumeValue1 = true;
        this.avRecorder?.resume().then(() => {
          console.info('resume success');
          expect(resumeValue1).assertEqual(true);
          this.toNextStep(avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          resumeValue1 = false
          console.info('resume AVRecorder failed and error is ' + err.message);
          console.info('resumeValue1 is ' + resumeValue1);
          expect(resumeValue1).assertEqual(false);
          this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case STOPRECORDER_CALLBACK_EVENT:

        let stopValue = true;
        this.avRecorder?.stop((err: BusinessError) => {
          console.info('case stop called');
          if (err == null) {
            expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.STOPPED);
            console.info('stop AVRecorder success');
            expect(stopValue).assertEqual(true);
            setTimeout(() => {
              console.info('STOPRECORDER_CALLBACK_EVENT setTimeout success');
              this.toNextStep(avConfig, recorderTime, steps, done);
            }, 500);
          } else {
            stopValue = false
            console.info('stop AVRecorder failed and error is ' + err.message);
            this.toNextStep(avConfig, recorderTime, steps, done);
          }
        })
        break;
      case STOPRECORDER_PROMISE_EVENT:

        let stopValue1 = true;
        this.avRecorder?.stop((err: BusinessError) => {
          console.info('case stop called');
          if (err == null) {
            expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.STOPPED);
            console.info('stop AVRecorder success');
            expect(stopValue1).assertEqual(true);
            setTimeout(() => {
              console.info('STOPRECORDER_PROMISE_EVENT setTimeout success');
              this.toNextStep(avConfig, recorderTime, steps, done);
            }, 500);
          } else {
            stopValue1 = false
            console.info('stop AVRecorder failed and error is ' + err.message);
            this.toNextStep(avConfig, recorderTime, steps, done);
          }
        })
        break;
      case RESETRECORDER_CALLBACK_EVENT:

        this.avRecorder?.reset((err: BusinessError) => {
          console.info('case reset called');
          if (err == null) {
            expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.IDLE);
            console.info('reset AVRecorder success');
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.info('reset AVRecorder failed and error is ' + err.message);
            this.toNextStep(avConfig, recorderTime, steps, done);
          }
        })
        break;
      case RESETRECORDER_PROMISE_EVENT:

        this.avRecorder?.reset().then(() => {
          expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.IDLE);
          this.toNextStep(avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('reset AVRecorder failed and catch error is ' + err.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        });
        break;
      case RELEASECORDER_CALLBACK_EVENT:

        this.avRecorder?.release((err: BusinessError) => {
          console.info('case release called');
          if (err == null) {
            expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.RELEASED);
            console.info('release AVRecorder success');
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.info('release AVRecorder failed and error is ' + err.message);
          }
        })
        break;
      case RELEASECORDER_PROMISE_EVENT:

        await this.avRecorder?.release().then(() => {
          expect(this.avRecorder?.state).assertEqual(mediaTestBase.AV_RECORDER_STATE.RELEASED);
          console.info('release AVRecorder success');
          this.toNextStep(avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.error('release AVRecorder failed and catch error is ' + err.message);
        });
        break;
      case RELEASECORDER_TIMETEST_EVENT:

        let end: number;
        let start: number = Date.now();
        console.info(`releaseTimeTestCallback start time is : ${start}`)
        this.avRecorder?.release((err: BusinessError) => {
          if (err == null) {
            console.info(`releaseTimeTestCallback current state is : ${this.avRecorder?.state}`)
            console.info('release releaseTimeTestCallback success');
            end = Date.now()
            console.info(`releaseTimeTestCallback end time is : ${end}`)
            let execution = end - start
            console.info("releaseTimeTestCallback execution time  is :" + execution)

            this.execTimes?.push(execution)

            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.info('resume releaseTimeTestCallback failed and error is ' + err.message);
          }
        });
        break;
      case START_TIMETEST_EVENT:
        this.execTimes = new Array();
        this.toNextStep(avConfig, recorderTime, steps, done);
        break;
      case END_TIMETEST_EVENT:
        let length = this.execTimes?.length;

        let sum = this.execTimes?.reduce((prev, curr) => {
          return prev + curr;
        }, 0);
        let avg: number
        if (sum && length) {
          avg = sum / length;
          console.info("releaseTimeTestCallback avg time  is :" + avg)
        }
        this.toNextStep(avConfig, recorderTime, steps, done);
        break;
      case CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT:

        this.avRecorder?.getCurrentAudioCapturerInfo().then((captureInfo: audio.AudioCapturerChangeInfo) => {
          console.log('Selected getCurrentAudioCapturerInfo captureInfo: ' + JSON.stringify(captureInfo));
          console.log('Selected getCurrentAudioCapturerInfo captureInfo[capturerState]: ' +
          captureInfo['capturerState']);
          switch (this.avRecorder?.state) {
            case mediaTestBase.AV_RECORDER_STATE.IDLE:
              console.info('getCurrentAudioCapturerInfo in idle state');
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.PREPARED:
              console.info('getCurrentAudioCapturerInfo in prepared state');
              expect(captureInfo['capturerState']).assertEqual(mediaTestBase.AV_RECORDER_AUDIO_STATE.PREPARED);
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.STARTED:
              console.info('getCurrentAudioCapturerInfo in started state');
              expect(captureInfo['capturerState']).assertEqual(mediaTestBase.AV_RECORDER_AUDIO_STATE.STARTED);
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.PAUSED:
              console.info('getCurrentAudioCapturerInfo in paused state');
              expect(captureInfo['capturerState']).assertEqual(mediaTestBase.AV_RECORDER_AUDIO_STATE.PAUSED);
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.STOPPED:
              console.info('getCurrentAudioCapturerInfo in stopped state');
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.RELEASED:
              console.info('getCurrentAudioCapturerInfo in released state');
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            default:
              break;
          }
        }).catch((error: BusinessError) => {
          console.error('getCurrentAudioCapturerInfo failed and catch error is ' + error.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        })
        break;
      case ENCODER_INFO_PROMISE_EVENT:

        let state1 = this.avRecorder?.state;
        this.avRecorder?.getAvailableEncoder().then((encoderInfo: Array<media.EncoderInfo>) => {
          if (state1 == mediaTestBase.AV_RECORDER_STATE.RELEASED) {
            console.info('getAvailableEncoder in released state1');
            this.toNextStep(avConfig, recorderTime, steps, done);
          } else {
            console.info('getAvailableEncoder encoderInfo length: ' + encoderInfo.length);
            expect(encoderInfo.length).assertLarger(0);
            for (let i = 0; i < encoderInfo.length; i++) {
              if (encoderInfo[i].type == 'video') {
                console.info('getAvailableEncoder video encoder frameRate min ' + encoderInfo[i].frameRate?.min);
                console.info('getAvailableEncoder video encoder frameRate max ' + encoderInfo[i].frameRate?.max);
                if (encoderInfo[i].frameRate?.min == 0 && encoderInfo[i].frameRate?.max == 0) {
                  continue;
                }
                expect(encoderInfo[i].frameRate?.max).assertLarger(0);
              } else {
                console.info('getAvailableEncoder audio encoder bitrate min ' + encoderInfo[i].bitRate?.min);
                console.info('getAvailableEncoder audio encoder bitrate max ' + encoderInfo[i].bitRate?.max);
                if (encoderInfo[i].bitRate?.min == 0 && encoderInfo[i].bitRate?.max == 0) {
                  continue;
                }
                expect(encoderInfo[i].bitRate?.max).assertLarger(0);
              }
            }
            this.toNextStep(avConfig, recorderTime, steps, done);
          }
        }).catch((error: BusinessError) => {
          console.error('avRecorder getAvailableEncoder failed and catch error is: ' + error.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        })
        break;
      case MAX_AMPLITUDE_PROMISE_EVENT:

        let state = this.avRecorder?.state;
        this.avRecorder?.getAudioCapturerMaxAmplitude().then((maxAmplitude) => {
          switch (state) {
            case mediaTestBase.AV_RECORDER_STATE.IDLE:
              this.maxAmplitudeStartTimes = 0;
              this.maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in idle state');
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.PREPARED:
              this.maxAmplitudeStartTimes = 0;
              this.maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in prepared state');
              expect(maxAmplitude).assertEqual(0);
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.STARTED:
              this.maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in started state');
              if (this.maxAmplitudeStartTimes != 0) {
                expect(maxAmplitude).assertLarger(0);
              }
              this.maxAmplitudeStartTimes++;
              mediaTestBase.msleep(300);
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.PAUSED:
              this.maxAmplitudeStartTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in paused state');
              if (this.maxAmplitudePauseTimes != 0) {
                expect(maxAmplitude).assertEqual(0);
              }
              this.maxAmplitudePauseTimes++;
              mediaTestBase.msleep(100);
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.STOPPED:
              this.maxAmplitudeStartTimes = 0;
              this.maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in stopped state');
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            case mediaTestBase.AV_RECORDER_STATE.RELEASED:
              this.maxAmplitudeStartTimes = 0;
              this.maxAmplitudePauseTimes = 0;
              console.info('getAudioCapturerMaxAmplitude in released state');
              this.toNextStep(avConfig, recorderTime, steps, done);
              break;
            default:
              break;
          }
        }).catch((error: BusinessError) => {
          console.error('avRecorder getAudioCapturerMaxAmplitude failed and catch error is ' + error.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        })
        break;
      case RELEASECAMERA_EVENT:

        try {
          this.releaseCamera(avConfig, recorderTime, steps, done)

        } catch (error) {
          console.error('releaseCamera failed and catch error is ' + error.message);
        }
        break;
      case CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT:

        try {
          let state = this.avRecorder?.state;
          this.avRecorder?.getCurrentAudioCapturerInfo((err, captureInfo: audio.AudioCapturerChangeInfo) => {

            console.log('Selected getCurrentAudioCapturerInfo captureInfo: ' + JSON.stringify(captureInfo));
            switch (state) {
              case mediaTestBase.AV_RECORDER_STATE.IDLE:
                console.info('getCurrentAudioCapturerInfo in idle state');
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.PREPARED:
                console.info('getCurrentAudioCapturerInfo in prepared state');
                expect(captureInfo['capturerState'])
                  .assertEqual(mediaTestBase.AV_RECORDER_AUDIO_STATE.PREPARED);
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.STARTED:
                console.info('getCurrentAudioCapturerInfo in started state');
                expect(captureInfo['capturerState']).assertEqual(mediaTestBase.AV_RECORDER_AUDIO_STATE.STARTED);
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.PAUSED:
                console.info('getCurrentAudioCapturerInfo in paused state');
                expect(captureInfo['capturerState']).assertEqual(mediaTestBase.AV_RECORDER_AUDIO_STATE.PAUSED);
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.STOPPED:
                console.info('getCurrentAudioCapturerInfo in stopped state');
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.RELEASED:
                console.info('getCurrentAudioCapturerInfo in released state');
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              default:
                break;
            }
          })
        } catch (error) {
          console.error('avRecorder getCurrentAudioCapturerInfo failed and catch error is ' + error.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        }
        break;
      case ENCODER_INFO_CALLBACK_EVENT:

        try {
          let state = this.avRecorder?.state;
          this.avRecorder?.getAvailableEncoder((err, encoderInfo: Array<media.EncoderInfo>) => {
            if (state == mediaTestBase.AV_RECORDER_STATE.RELEASED) {
              console.info('getAvailableEncoder in released state');
              this.toNextStep(avConfig, recorderTime, steps, done);
            } else {
              console.info('getAvailableEncoder encoderInfo length: ' + encoderInfo.length);
              expect(encoderInfo.length).assertLarger(0);
              for (let i = 0; i < encoderInfo.length; i++) {
                if (encoderInfo[i].type == 'video') {
                  console.info('getAvailableEncoder video encoder frameRate min ' + encoderInfo[i].frameRate?.min);
                  console.info('getAvailableEncoder video encoder frameRate max ' + encoderInfo[i].frameRate?.max);
                  if (encoderInfo[i].frameRate?.min == 0 && encoderInfo[i].frameRate?.max == 0) {
                    continue;
                  }
                  expect(encoderInfo[i].frameRate?.max).assertLarger(0);
                } else {
                  console.info('getAvailableEncoder audio encoder bitrate min ' + encoderInfo[i].bitRate?.min);
                  console.info('getAvailableEncoder audio encoder bitrate max ' + encoderInfo[i].bitRate?.min);
                  if (encoderInfo[i].bitRate?.min == 0 && encoderInfo[i].bitRate?.max == 0) {
                    continue;
                  }
                  expect(encoderInfo[i].bitRate?.max).assertLarger(0);
                }
              }
              this.toNextStep(avConfig, recorderTime, steps, done);
            }
          });
        } catch (error) {
          console.error('avRecorder getAvailableEncoder failed and catch error is ' + error.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        }
        break;
      case MAX_AMPLITUDE_CALLBACK_EVENT:

        try {
          let state = this.avRecorder?.state;
          this.avRecorder?.getAudioCapturerMaxAmplitude((err, maxAmplitude) => {
            switch (state) {
              case mediaTestBase.AV_RECORDER_STATE.IDLE:
                this.maxAmplitudeStartTimes = 0;
                this.maxAmplitudePauseTimes = 0;
                console.info('getAudioCapturerMaxAmplitude in idle state');
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.PREPARED:
                this.maxAmplitudeStartTimes = 0;
                this.maxAmplitudePauseTimes = 0;
                console.info('getAudioCapturerMaxAmplitude in prepared state');
                expect(maxAmplitude).assertEqual(0);
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.STARTED:
                this.maxAmplitudePauseTimes = 0;
                console.info('getAudioCapturerMaxAmplitude in started state');
                if (this.maxAmplitudeStartTimes != 0) {
                  expect(maxAmplitude).assertLarger(0);
                }
                this.maxAmplitudeStartTimes++;
                mediaTestBase.msleep(300);
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.PAUSED:
                this.maxAmplitudeStartTimes = 0;
                console.info('getAudioCapturerMaxAmplitude in paused state');
                if (this.maxAmplitudePauseTimes != 0) {
                  expect(maxAmplitude).assertEqual(0);
                }
                this.maxAmplitudePauseTimes++;
                mediaTestBase.msleep(100);
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.STOPPED:
                this.maxAmplitudeStartTimes = 0;
                this.maxAmplitudePauseTimes = 0;
                console.info('getAudioCapturerMaxAmplitude in stopped state');
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              case mediaTestBase.AV_RECORDER_STATE.RELEASED:
                this.maxAmplitudeStartTimes = 0;
                this.maxAmplitudePauseTimes = 0;
                console.info('getAudioCapturerMaxAmplitude in released state');
                this.toNextStep(avConfig, recorderTime, steps, done);
                break;
              default:
                break;
            }
          })
        } catch (error) {
          console.error('avRecorder getAudioCapturerMaxAmplitude failed and catch error is ' + error.message);
          this.toNextStep(avConfig, recorderTime, steps, done);
        }
        break;
      default:
        break;
    }
  }


  async releaseCameraError(done: Function) {
    try {
      await this.captureSession?.stop()
      console.info('releaseCameraError 001');
      console.info('captureSession?.stop success');
      await this.cameraInput?.close()
      console.info('releaseCameraError 002');
      console.info('cameraInput.close success');
      await this.previewOutput?.release()
      console.info('releaseCameraError 003');
      console.info('previewOutput.release success');
      await this.videoOutput?.release()
      console.info('releaseCameraError 004');
      console.info('videoOutput.release success');
      await this.captureSession?.release()
      console.info('releaseCameraError 005');
      console.info('captureSession?.release success');
      if (this.captureSession) {
        this.captureSession = undefined
      }
      console.info('releaseCameraError success');
      done();
    } catch (err) {
      console.error('releaseCameraError failed and catch error is ' + err.message);
      done();
    }
  }

  async releaseCamera(avConfig: media.AVRecorderConfig, recorderTime: number,
    steps: Array<string>, done: Function) {
    try {
      await this.captureSession?.stop()
      console.info('releaseCamera 001');
      console.info('captureSession?.stop success');
      await this.cameraInput?.close()
      console.info('releaseCamera 002');
      console.info('cameraInput.close success');
      await this.previewOutput?.release()
      console.info('releaseCamera 003');
      console.info('previewOutput.release success');
      await this.videoOutput?.release()
      console.info('releaseCamera 004');
      console.info('videoOutput.release success');
      await this.captureSession?.release()
      console.info('releaseCamera 005');
      console.info('captureSession?.release success');
      this.captureSession = undefined
      console.info('releaseCamera success');
      this.toNextStep(avConfig, recorderTime, steps, done);
    } catch (err) {
      console.error('releaseCamera failed and catch error is ' + err.message);
      this.toNextStep(avConfig, recorderTime, steps, done);
    }
  }
}