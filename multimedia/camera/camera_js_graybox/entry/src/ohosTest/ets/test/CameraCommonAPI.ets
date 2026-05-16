import { abilityAccessCtrl, Permissions } from "@kit.AbilityKit";
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry, Driver, MatchPattern, ON } from "@kit.TestKit";
import { camera } from "@kit.CameraKit";
import { photoAccessHelper } from "@kit.MediaLibraryKit";
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { expect } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import { dataSharePredicates } from "@kit.ArkData";
import { image } from "@kit.ImageKit";
import { colorSpaceManager } from "@kit.ArkGraphics2D";
import { buffer, Decimal } from "@kit.ArkTS";
import { sensor } from '@kit.SensorServiceKit';

// 权限列表
let permission: Permissions[] = [
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.MEDIA_LOCATION',
  "ohos.permission.READ_IMAGEVIDEO",
  "ohos.permission.WRITE_IMAGEVIDEO"
];

// 接收图片资产的回调函数
let photoAccessArray: Array<photoAccessHelper.PhotoAsset> = []
let photoHelper: photoAccessHelper.PhotoAccessHelper
let realCapturePhotoNum = 0;
let receviceImagenum = 0;
let beforeCount = 0;

// 时间
let beginTime: number = Date.now();
let endTime: number = 0;
let conSumeTime: number = 0;

// 拍照相关
let isFrameStart: boolean = false  // 预览是否开始
globalThis.isCaptureReady = true; //是否可拍下一张回调函数
globalThis.isSupportMovingPhoto = false

/**
 * @desc 等待
 * @param { number } ms 等待的时长，单位毫秒ms
 */
export function sleep(ms: number = 66): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

/**
 * @desc 获取测试用例需要用到的权限
 */
export async function getPermission() {
  // 弹框请求授权
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager()
  try {
    atManager.requestPermissionsFromUser(AppStorage.get('testContext'), permission).then((data: ESObject) => {
      console.log(`atManager then data ${JSON.stringify(data)}`)
    }).catch((err: BusinessError) => {
      console.log(`atManager then err ${JSON.stringify(err)}`)
    })
  } catch (err) {
    console.log(`atManager err ${JSON.stringify(err)}`)
  }
  // 点击允许授权
  await driveAllow()
}

/**
 * @desc 点击界面中的"允许"按钮
 */
let driveAllow = async () => {
  console.info(`come in driveFn`);
  let dr = Driver.create();
  await sleep(2000);
  let power1: ESObject;
  let power2: ESObject;
  for (let i = 0; i < permission.length; i++) {
    power1 = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
    power2 = await dr?.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
    await power1?.click();
    await power2?.click();
    power1 = null;
    power2 = null;
    await sleep(500);
  }
}

/**
 * @desc  获取相机管理器
 * @returns { camera.CameraManager } 相机管理器实例
 */
export async function getCameraManager(): Promise<camera.CameraManager> {
  let context = await getContext();
  let cameraManager: camera.CameraManager = camera.getCameraManager(context);
  return cameraManager
}

/**
 * @desc 获取相机列表
 * @param { camera.CameraManager } cameraManager 相机管理器，可以从getCameraManager()方法获取
 * @returns { Array<camera.CameraDevice> } 相机列表, 列表中的元素是相机对象
 */
export function getSupportedCameras(cameraManager: camera.CameraManager): Array<camera.CameraDevice> {
  let cameras: Array<camera.CameraDevice> = cameraManager.getSupportedCameras();
  return cameras
}

/**
 * @desc 查询某个镜头是否支持某个模式
 * @param { camera.CameraManager } cameraManager 相机管理器，可以从getCameraManager()方法获取
 * @param { camera.CameraDevice } cameraDevice 相机对象，可以从getSupportedCameras()方法获取
 * @param { camera.SceneMode } sceneMode 相机模式
 * @returns { boolean } ture表示支持, false表示不支持
 */
export function isSupportedSceneMode(cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice,
  sceneMode: camera.SceneMode): boolean {
  let sceneModeArray = cameraManager.getSupportedSceneModes(cameraDevice);
  for (let i = 0; i < sceneModeArray.length; i++) {
    if (sceneMode == sceneModeArray[i]) {
      return true;
    }
  }
  return false;
}

/**
 * @desc 创建音视频录制实例
 * @returns { media.AVRecorder } 音视频录制实例
 */
export async function createAvRecorder(): Promise<media.AVRecorder> {
  let avRecorder: media.AVRecorder | undefined = undefined;
  try {
    avRecorder = await media.createAVRecorder();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`error is createAVRecorder call failed. error code: ${err.code}`);
    console.error(`创建AVRecorder失败`);
    expect().assertFail()
  }
  if (avRecorder === undefined) {
    return undefined!;
  }
  return avRecorder;
}

/**
 * @desc 设置音视频录制的参数
 * @param { media.AVRecorder } avRecorder 音视频录制实例
 * @param { fs.File } file 文件对象，可以通过createVideoFile()创建
 * @param { camera.VideoProfile } videoProfile 录像输出流配置文件
 * @param { number } videoFrameRate 视频帧率
 */
export async function setAvRecorderConfig(avRecorder: media.AVRecorder, file: fs.File, videoProfile: camera.VideoProfile, videoFrameRate: number = 30) {
  let isHdr = false
  if (videoProfile) {
    isHdr = videoProfile.format === camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 || videoProfile.format === camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010;
  }
  // 配置参数以实际硬件设备支持的范围为准。
  let aVRecorderProfile: media.AVRecorderProfile = {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 2000000,
    videoCodec: isHdr ? media.CodecMimeType.VIDEO_HEVC : media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth: videoProfile.size.width,
    videoFrameHeight: videoProfile.size.height,
    videoFrameRate: videoFrameRate,
    isHdr: isHdr
  };

  let aVRecorderConfig: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
    profile: aVRecorderProfile,
    url: `fd://${file.fd.toString()}`, // 文件需先由调用者创建，赋予读写权限，将文件fd传给此参数，eg.fd://45--file:///data/media/01.mp4
    rotation: 0, // 合理值0、90、180、270，非合理值prepare接口将报错。
    location: { latitude: 30, longitude: 130 }
  };

  try {
    await avRecorder.prepare(aVRecorderConfig);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`prepare call failed. error code: ${err.code}`);
    console.error(`AVRecorder 调用prepare失败`);
    expect().assertFail()
  }
}

/**
 * @desc 获取视录像输出流
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { camera.VideoProfile } videoProfile 录像输出流配置文件
 * @param { media.AVRecorder } avRecorder 音视频录制实例
 * @returns { camera.VideoOutput } 录像输出流
 */
export async function getVideoOutput(
  cameraManager: camera.CameraManager,
  avRecorder: media.AVRecorder,
  videoProfile?: camera.VideoProfile
): Promise<camera.VideoOutput> {
  let videoSurfaceId: string | undefined = undefined; // 该surfaceID用于传递给相机接口创造videoOutput。
  try {
    videoSurfaceId = await avRecorder.getInputSurface();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`error is getInputSurface call failed. error code: ${err.code}`);
    expect().assertFail()
  }
  if (videoSurfaceId === undefined) {
    return undefined!;
  }
  // 创建VideoOutput对象。
  let videoOutput: camera.VideoOutput | undefined = undefined;
  if (!videoProfile) {
    videoOutput = cameraManager.createVideoOutput(videoSurfaceId);
  } else {
    try {
      console.info('videoProfile is ' + JSON.stringify(videoProfile));
      videoOutput = cameraManager.createVideoOutput(videoProfile, videoSurfaceId);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`error is Failed to create the videoOutput instance. error: ${JSON.stringify(err)}`);
      console.error(`创建VideoOutput失败`);
      expect().assertFail()
    }
  }
  if (videoOutput === undefined) {
    return undefined!;
  }
  return videoOutput
}

/**
 * @desc 不传入配置文件, 获取录像输出流
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { media.AVRecorder } avRecorder 音视频录制实例
 * @returns { camera.VideoOutput } 录像输出流
 */
export async function getVideoOutputWithoutProfile(
  cameraManager: camera.CameraManager,
  avRecorder: media.AVRecorder
): Promise<camera.VideoOutput> {
  let videoSurfaceId: string | undefined = undefined; // 该surfaceID用于传递给相机接口创造videoOutput。
  try {
    videoSurfaceId = await avRecorder.getInputSurface();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`getInputSurface call failed. error code: ${err.code}`);
  }
  if (videoSurfaceId === undefined) {
    return undefined!;
  }
  // 创建VideoOutput对象。
  let videoOutput: camera.VideoOutput | undefined = undefined;
  try {
    videoOutput = cameraManager.createVideoOutput(videoSurfaceId);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to create the videoOutput instance. error: ${err}`);
  }
  if (videoOutput === undefined) {
    return undefined!;
  }
  return videoOutput
}

/**
 * @desc 获取录像旋转角度
 * @param { camera.VideoOutput } videoOutput 录像输出流
 * @returns { camera.VideoOutput } 录像旋转角度
 */
export async function getVideoRotation(videoOutput: camera.VideoOutput): Promise<number> {
  let deviceDegree = await getDeviceDegree();
  console.info(`deviceDegree: ${deviceDegree}`)
  let videoRotation: camera.ImageRotation = camera.ImageRotation.ROTATION_0;
  try {
    videoRotation = videoOutput.getVideoRotation(deviceDegree);
  } catch (error) {
    let err = error as BusinessError;
    console.error('Failed to get video rotation: ' + JSON.stringify(err));
  }
  return videoRotation;
}

/**
 * @desc 获取设备旋转角度
 * @returns { camera.VideoOutput } 设备旋转角度
 */
function getDeviceDegree(): Promise<number> {
  return new Promise<number>((resolve) => {
    try {
      sensor.once(sensor.SensorId.GRAVITY, (data: sensor.GravityResponse) => {
        console.info('Succeeded in invoking once. X-coordinate component: ' + data.x);
        console.info('Succeeded in invoking once. Y-coordinate component: ' + data.y);
        console.info('Succeeded in invoking once. Z-coordinate component: ' + data.z);
        let x = data.x;
        let y = data.y;
        let z = data.z;
        let deviceDegree: number;
        if ((x * x + y * y) * 3 < z * z) {
          deviceDegree = -1;
        } else {
          let sd: Decimal = Decimal.atan2(y, -x);
          let sc: Decimal = Decimal.round(Number(sd) / 3.141592653589 * 180)
          deviceDegree = 90 - Number(sc);
          deviceDegree = deviceDegree >= 0 ? deviceDegree% 360 : deviceDegree% 360 + 360;
        }
        resolve(deviceDegree);
      });
    } catch (error) {
      let err = error as BusinessError;
      console.error('Failed to register gravity sensor: ' + JSON.stringify(err));
      resolve(-1); // 异常时返回默认值
    }
  });
}

/**
 * @desc 创建会话
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { camera.SceneMode } cameraMode 相机模式
 * @returns { camera.Session } 会话对象
 */
export function createSession(cameraManager: camera.CameraManager, cameraMode: camera.SceneMode): ESObject {
  let session: ESObject
  try {
    session = cameraManager.createSession(cameraMode)
  } catch (error) {
    let err = error as BusinessError;
    console.error('error is Failed to create the session instance. errorCode = ' + err.code);
    expect().assertFail()
  }
  if (session === undefined) {
    return;
  }
  return session;
}

/**
 * @desc 创建并配置会话
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { camera.SceneMode } cameraMode 相机模式
 * @returns { camera.Session } 会话对象
 */
export function createAndConfigSession(cameraManager: camera.CameraManager, cameraMode: camera.SceneMode): ESObject {
  //创建会话
  let session: ESObject = createSession(cameraManager, cameraMode)
  // 开始配置会话。
  try {
    session.beginConfig();
  } catch (error) {
    let err = error as BusinessError;
    console.error('error is Failed to beginConfig. errorCode = ' + err.code);
    expect().assertFail()
  }
  return session;
}

/**
 * @desc 获取媒体库对象
 * @returns 媒体库对象
 */
export async function getHelper() {
  let abilityContext = await getContext()
  let helper: photoAccessHelper.PhotoAccessHelper = await photoAccessHelper.getPhotoAccessHelper(abilityContext);
  return helper;
}

/**
 * @desc 通过uri保存资产到媒体库
 * @param { string } videoUri 文件的URI
 * @param { photoAccessHelper.PhotoAccessHelper } PhotoAccessHelper 媒体库助手
 * @param { Context } context 应用上下文
 * @returns 媒体库资产对象
 */
export async function saveAsset(helperInstance:photoAccessHelper.PhotoAccessHelper, videoUri: string, context: Context ) {
  let asset: photoAccessHelper.PhotoAsset | undefined = undefined
  console.info('begin to save asset');
  try {
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(context, videoUri);
    await helperInstance.applyChanges(assetChangeRequest);
    asset = assetChangeRequest.getAsset();
    console.info('apply createVideoAssetRequest successfully');
  } catch (err) {
    console.error(`createVideoAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
  }
  return asset
}

/**
 * @desc 获取相机设备支持的某种模式下的输出流能力
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { camera.CameraDevice } cameraDevice 相机实例
 * @param { camera.SceneMode } sceneMode 相机模式
 * @returns 输出能力
 */
export function getCameraOutputCapability(cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice,
  sceneMode: camera.SceneMode) {
  let cameraOutputCap: camera.CameraOutputCapability =
    cameraManager.getSupportedOutputCapability(cameraDevice, sceneMode);
  if (!cameraOutputCap) {
    console.error("cameraManager.getSupportedOutputCapability error");
    return;
  }
  return cameraOutputCap
}

/**
 * @desc 获取拍照输入流
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { camera.CameraDevice } cameraDevice 相机对象
 * @returns 拍照输入流
 */
export function createCameraInput(cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice) {
  let cameraInput: camera.CameraInput;
  try {
    cameraInput = cameraManager.createCameraInput(cameraDevice);
  } catch (error) {
    let err = error as BusinessError;
    console.error('error is Failed to createCameraInput errorCode = ' + err.code);
    expect().assertFail()
  }
  return cameraInput!;
}

/**
 * @desc 释放拍照输入流
 * @param { camera.CameraInput } inPut 拍照输入流
 */
export function releaseInPutStream(inPut: ESObject) {
  if (inPut != undefined) {
    inPut.close();
  }
}

/**
 * @desc 打开相机
 * @param { camera.CameraManager } cameraInput 相机输入流
 */
export async function openCamera(cameraInput: ESObject) {
  await cameraInput.open();
}

/**
 * @desc 创建拍照预览输出流
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { camera.Profile } previewProfile 输出配置
 * @returns 预览输出流
 */
export function createPreviewOutputFromProfile(cameraManager: camera.CameraManager, previewProfile: camera.Profile) {
  // 创建预览输出流,其中参数 surfaceId 参考上文 XComponent 组件，预览流为XComponent组件提供的surface。
  let previewOutput: camera.PreviewOutput | undefined = undefined;
  try {
    previewOutput = cameraManager.createPreviewOutput(previewProfile, globalThis.surfaceId);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to create the PreviewOutput instance. error code: ${err.code}`);
    expect().assertFail()
  }
  if (previewOutput === undefined) {
    return;
  }
  return previewOutput
}

/**
 * @desc 根据预览流配置信息创建预览流
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { camera.Profile } previewProfile 输出配置
 * @returns 预览输出流
 */
export function createVideoPreviewOutputFromProFile(cameraManager: camera.CameraManager, previewProfile: camera.Profile) {
  // 创建预览输出流,其中参数 surfaceId 参考上文 XComponent 组件，预览流为XComponent组件提供的surface。
  let previewOutput: camera.PreviewOutput | undefined = undefined;
  try {
    console.info('Profile is previewProfile is ' + JSON.stringify(previewProfile));
    previewOutput = cameraManager.createPreviewOutput(previewProfile, globalThis.surfaceId);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`error is Failed to create the PreviewOutput instance. error code: ${err.code}`);
    expect().assertFail()
  }
  if (previewOutput === undefined) {
    return;
  }
  return previewOutput
}

/**
 * @desc 获取拍照输出流
 * @param { camera.CameraManager } cameraManager 相机管理对象
 * @param { camera.Profile } photoProfile 输出配置
 * @returns 拍照输出流
 */
export function getPhotoOutputFromProfile(cameraManager: camera.CameraManager, photoProfile: camera.Profile | undefined
): camera.PhotoOutput {

  let photoOutput: camera.PhotoOutput | undefined = undefined;
  try {
    // 创建 PhotoOutput 时指定格式
    photoOutput = cameraManager.createPhotoOutput(photoProfile);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to createPhotoOutput. error: ${JSON.stringify(err)}`);
    expect().assertFail()
  }
  return photoOutput!;
}

/**
 * @desc 释放输出流
 * @param { ESObject } outPut 相机输入流对象
 */
export function releaseOutPutStream(outPut: ESObject) {
  if (outPut != undefined) {
    outPut.release();
  }
}

/**
 * @desc 向会话中添加相机输入流
 * @param { camera.Session } session 相机会话对象
 * @param { camera.CameraInput } output 相机输入流对象
 */
export async function addInputIntoSession(session: ESObject, input: ESObject) {
  try {
    session.addInput(input);
    await sleep(30);
  } catch (error) {
    let err = error as BusinessError;
    console.error('error is Failed to addInput. errorCode = ' + err.code);
    expect().assertFail()
  }
}

/**
 * @desc 向会话中添加输出流
 * @param { camera.Session } session 相机会话对象
 * @param { ESObject } output 相机输出流对象
 */
export async function addOutputIntoSession(session: ESObject, output: ESObject) {
  try {
    session.addOutput(output);
    await sleep(30);
  } catch (error) {
    let err = error as BusinessError;
    console.error('Failed to addInput. errorCode = ' + err.code);
    expect().assertFail()
  }
}

/**
 * @desc 提交会话配置
 * @param { camera.Session } session 相机会话对象
 */
export async function commitSessionConfig(session: ESObject) {
  await session.commitConfig();
}

/**
 * @desc 启动会话
 * @param { camera.Session } session 相机会话对象
 */
export async function startSession(session: ESObject) {
  await session.start()
}

/**
 * @desc 停止当前会话
 * @param { camera.Session } session 相机会话对象
 */
export function stopSession(session: ESObject) {
  if (session != undefined) {
    session.stop();
  }
}

/**
 * @desc 释放当前会话
 * @param { camera.Session } session 相机会话对象
 */
export function releaseSession(session: ESObject) {
  if (session != undefined) {
    session.stop();
  }
}

/**
 * @desc 启动录像输出流
 * @param { camera.VideoOutput } videoOutput 录像输出流
 */
export function startVideoOutput(videoOutput: camera.VideoOutput) {
  // 启动录像输出流。
  videoOutput.start((err: BusinessError) => {
    if (err) {
      console.error(`error is Failed to start the video output. error: ${JSON.stringify(err)}`);
      expect().assertFail()
      return;
    }
    console.info('Callback invoked to indicate the video output start success.');
  });
}

/**
 * @desc 停止录像输出流
 * @param { camera.VideoOutput } videoOutput 录像输出流
 */
export function stopVideoOutput(videoOutput: camera.VideoOutput) {
  // 停止录像输出流。
  videoOutput.stop((err: BusinessError) => {
    if (err) {
      console.error(`error is Failed to stop the video output. error: ${JSON.stringify(err)}`);
      expect().assertFail()
      return;
    }
    console.info('Callback invoked to indicate the video output stop success.');
  });
}

/**
 * @desc 开始录像
 * @param { media.AVRecorder } avRecorder 录像输出流
 */
export async function startAvRecoder(avRecorder: media.AVRecorder) {
  try {
    //等待预览帧开始
    while (!isFrameStart) {
      await sleep(20);
    }
    await avRecorder.start();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`error is avRecorder start error: ${JSON.stringify(err)}`);
    expect().assertFail()
  }
}

/**
 * @desc 停止录像
 * @param { media.AVRecorder } avRecorder 录像输出流
 */
export async function stopAvRecoder(avRecorder: media.AVRecorder, videoFile?: fs.File) {
  // 停止录像。
  try {
    await avRecorder.stop();
    await sleep(1000);
    fs.closeSync(videoFile?.fd);
    await sleep(1000);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`error is avRecorder stop error: ${JSON.stringify(err)}`);
    expect().assertFail()
  }
}

/**
 * @desc 释放音视频录制实例
 * @param { media.AVRecorder } avRecorder 录像输出流
 */
export async function releaseAvRecoder(avRecorder: media.AVRecorder) {
  try {
    if (avRecorder != undefined) {
      await avRecorder.release();
      await sleep(1000);
    }
  } catch (error) {
    let err = error as BusinessError;
    console.error(`error is avRecorder release error: ${JSON.stringify(err)}`);
    expect().assertFail()
  }
}

/**
 * @desc 根据文件名获取带资产某些关键字信息的资产
 * @param { photoAccessHelper.PhotoAccessHelper } helper 媒体库助手
 * @param { Array<string> } fileNames 文件名列表
 * @param { string> } type 文件类型
 * @returns 资产列表
 */
export async function getPhotoAssetsWithKeyFromFileNames(helper: photoAccessHelper.PhotoAccessHelper,
  fileNames: Array<string>, type: string = 'dynamic_range_type'): Promise<Array<photoAccessHelper.PhotoAsset>> {
  try {
    let predicates = new dataSharePredicates.DataSharePredicates();
    predicates.in(photoAccessHelper.PhotoKeys.DISPLAY_NAME, fileNames);
    let FetchOptions: photoAccessHelper.FetchOptions = {
      predicates: predicates,
      fetchColumns: [type]
    }
    let fetchResult = await helper.getAssets(FetchOptions);
    let assets = await fetchResult.getAllObjects();
    fetchResult.close();
    return assets;
  } catch (error) {
    console.info(`Failed to check user album count, error: ${error}`);
    expect(false).assertTrue();
    return [];
  }
}

/**
 * @desc 查询是否支持视频防抖，HDR录像需要支持视频防抖
 * @param { camera.Session } session 相机会话对象
 * @param { camera.SceneMode } cameraMode 相机模式
 * @returns 布尔值, false：不支持， true: 支持
 */
export function isVideoStabilizationModeSupported(session: camera.VideoSession, mode: camera.VideoStabilizationMode): boolean {
  let isSupported: boolean = false;
  try {
    isSupported = session.isVideoStabilizationModeSupported(mode);
  } catch (error) {
    // 失败返回错误码error.code并处理
    let err = error as BusinessError;
    console.error(`The isVideoStabilizationModeSupported call failed. error code: ${err.code}`);
    expect().assertFail()
  }
  return isSupported;
}

/**
 * @desc 获取防抖模式
 * @param { camera.Session } session 相机会话对象
 * @returns 防抖模式列表
 */
export function getSupportedVideoStabilizationMode(session: camera.VideoSession,): Array<camera.VideoStabilizationMode> {
  let stabilizationModeresult: Array<camera.VideoStabilizationMode> = []

  const enumValues = Object.values(camera.VideoStabilizationMode);
  enumValues.forEach(value => {
    if (isVideoStabilizationModeSupported(session, Number(value))) {
      stabilizationModeresult.push(Number(value))
    }
  });
  return stabilizationModeresult
}

/**
 * @desc 设置视频防抖
 * @param { camera.Session } session 相机会话对象
 * @param { camera.SceneMode } cameraMode 相机模式
 */
export function setVideoStabilizationMode(session: camera.VideoSession, mode: camera.VideoStabilizationMode = camera.VideoStabilizationMode.AUTO) {
  // 查询是否支持视频防抖
  console.info(`setVideoStabilizationMode: ${mode}`);
  // 设置视频防抖
  session.setVideoStabilizationMode(mode);
  let activeVideoStabilizationMode = session.getActiveVideoStabilizationMode();
  console.info(`activeVideoStabilizationMode: ${activeVideoStabilizationMode}`);
}

/**
 * @desc 获取当前激活的防抖模式
 * @param { camera.Session } session 相机会话对象
 * @returns 防抖模式
 */
export function getActiveVideoStabilizationMode(videoSession: camera.VideoSession): camera.VideoStabilizationMode | undefined {
  let vsMode: camera.VideoStabilizationMode | undefined = undefined;
  try {
    vsMode = videoSession.getActiveVideoStabilizationMode();
  } catch (error) {
    // 失败返回错误码error.code并处理。
    let err = error as BusinessError;
    console.error(`The getActiveVideoStabilizationMode call failed. error code: ${err.code}`);
  }
  return vsMode;
}

/**
 * @desc 设置视频色彩空间
 * @param { camera.Session } session 相机会话对象
 * @param { boolean } isHdr 是否hdr
 */
export function setVideoColorSpace(session: camera.VideoSession, isHdr: boolean): void {
  try {
    let colorSpace: colorSpaceManager.ColorSpace = isHdr? colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT : colorSpaceManager.ColorSpace.BT709_LIMIT;
    let colorSpaces: Array<colorSpaceManager.ColorSpace> = getSupportedColorSpaces(session);
    let isSupportedColorSpaces = colorSpaces.indexOf(colorSpace) >= 0;
    if (isSupportedColorSpaces) {
      console.info(`setColorSpace: ${colorSpace}`);
      session.setColorSpace(colorSpace);
      let activeColorSpace:colorSpaceManager.ColorSpace = session.getActiveColorSpace();
      console.info(`activeColorSpace: ${activeColorSpace}`);
    } else {
      console.info(`colorSpace: ${colorSpace} is not support`);
    }
  } catch (error) {
    console.error(`setColorSpace failed with error: ${error.code}, ${error.message}`);
    expect().assertFail();
  }
}

/**
 * @desc 获取支持的色彩空间列表
 * @param { camera.PhotoSession } session 相机会话对象
 * @returns { Array<colorSpaceManager.ColorSpace> } 色彩空间列表
 */
export function getSupportedColorSpaces(session: ESObject):Array<colorSpaceManager.ColorSpace>  {
  let colorSpaces: Array<colorSpaceManager.ColorSpace> = [];
  try {
    colorSpaces = session.getSupportedColorSpaces();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`The getSupportedColorSpaces call failed. error code: ${err.code}`);
    expect().assertFail()
  }
  return colorSpaces;
}

/**
 * @desc 设置图片色彩空间
 * @param { camera.PhotoSession } session 相机图片会话对象
 * @param { boolean } isHdr 是否hdr图片
 */
export function setImageColorSpace(session: camera.PhotoSession, isHdr: boolean): void {
  try {
    let colorSpace: colorSpaceManager.ColorSpace = isHdr? colorSpaceManager.ColorSpace.DISPLAY_P3 : colorSpaceManager.ColorSpace.SRGB;
    let colorSpaces: Array<colorSpaceManager.ColorSpace> = getSupportedColorSpaces(session);
    let isSupportedColorSpaces = colorSpaces.indexOf(colorSpace) >= 0;
    if (isSupportedColorSpaces) {
      console.info(`setColorSpace: ${colorSpace}`);
      session.setColorSpace(colorSpace);
      let activeColorSpace:colorSpaceManager.ColorSpace = session.getActiveColorSpace();
      console.info(`activeColorSpace: ${activeColorSpace}`);
    } else {
      console.info(`colorSpace: ${colorSpace} is not support`);
    }
  } catch (error) {
    console.error(`setColorSpace failed with error: ${error.code}, ${error.message}`);
    expect().assertFail();
  }
}

/**
 * @desc 获取相机支持的可变焦距比范围
 * @param { camera.Session } photoSession 相机会话对象
 * @returns 相机支持的可变焦距比范围
 */
export function getSuppotredZoomRatioRange(photoSession: ESObject) {
  let zoomRatioRange: Array<number> = [];
  try {
    zoomRatioRange = photoSession.getZoomRatioRange();
    if (zoomRatioRange == undefined) {
      return undefined;
    }
    if (zoomRatioRange!.length > 1) {
      if (zoomRatioRange![1] > 1) {
        zoomRatioRange!.push(1)
      } else {
        zoomRatioRange!.push(zoomRatioRange![0] + (zoomRatioRange![1] - zoomRatioRange![0]) / 2)
      }
    }
  } catch (error) {
    let err = error as BusinessError;
    console.error('Failed to get the zoom ratio range. errorCode = ' + err.code);
    expect().assertFail()
  }
  if (zoomRatioRange.length <= 0) {
    return [];
  }
  return zoomRatioRange
}

/**
 * @desc 获取相机支持的帧率范围
 * @param { camera.Session } photoSession 相机会话对象
 * @returns 帧率范围
 */
export function getSuppotredFrameRateRange(videoProfile: camera.VideoProfile) {
  let frameRateRange: Array<number> = [];
  try {
    frameRateRange.push(videoProfile.frameRateRange.min)
    if (videoProfile.frameRateRange.min != videoProfile.frameRateRange.max) {
      frameRateRange.push(videoProfile.frameRateRange.max)
      frameRateRange.push((videoProfile.frameRateRange.min + videoProfile.frameRateRange.max) / 2)
    }
  } catch (error) {
    let err = error as BusinessError;
    console.error('Failed to get the zoom ratio range. errorCode = ' + err.code);
    expect().assertFail()
  }
  if (frameRateRange.length <= 0) {
    return [];
  }
  return frameRateRange
}

/**
 * @desc 判断设备是否支持某个焦距
 * @param { Array<number> } zoomRatioRange 焦距比范围
 * @param { number } zoomRatio 需要判断的焦距比
 * @returns { boolean } 布尔值, ture表示支持, false表示不支持
 */
export function isSupportedZoomRatio(zoomRatioRange: Array<number>, zoomRatio: number): boolean {
  if (zoomRatioRange.length >= 2 && zoomRatioRange[0] <= zoomRatio && zoomRatioRange[1] >= zoomRatio) {
    return true;
  }
  return false;
}

/**
 * @desc 设置可变焦距比
 * @param { camera.Session } photoSession 相机会话对象
 * @param { Array<number> } zoomRatioRange 焦距比范围
 * @param { number } zoomRatio 需要设置的焦距比，默认为1
 */
export function setZoomRatioRange(photoSession: ESObject, zoomRatioRange: Array<number>, zoomRatio: number = 1) {
  console.info('zoomRatio is ' + zoomRatio);
  if (!isSupportedZoomRatio(zoomRatioRange, zoomRatio)) {
    console.error('device is not support zoomRatio ' + zoomRatio);
  } else {
    try {
      photoSession.setZoomRatio(zoomRatioRange[0]);
    } catch (error) {
      let err = error as BusinessError;
      console.error('Failed to set the zoom ratio value. errorCode = ' + err.code);
      expect().assertFail()
    }
  }
}

/**
 * @desc 判断设备是否支持自动对焦
 * @param { camera.Session } photoSession 相机会话对象
 */
function isFocusModeSupported(photoSession: camera.PhotoSession): boolean {
  let status: boolean = false;
  try {
    // 以检查是否支持连续自动对焦模式为例
    status = photoSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
  } catch (error) {
    // 失败返回错误码error.code并处理
    let err = error as BusinessError;
    console.error(`The isFocusModeSupported call failed. error code: ${err.code}`);
    expect().assertFail()
  }
  return status;
}

/**
 * @desc 设置对焦模式
 * @param { camera.Session } photoSession 相机会话对象
 * @param { camera.FocusMode } focusMode 对焦模式，默认为自动
 */
export function setFocusMode(photoSession: ESObject,
  focusMode: camera.FocusMode = camera.FocusMode.FOCUS_MODE_AUTO): void {
  const focusPoint: camera.Point = { x: 1, y: 1 };
  try {
    if (isFocusModeSupported(photoSession)) {
      // 设置自动对焦模式
      photoSession.setFocusMode(focusMode);
      // 设置对焦点
      photoSession.setFocusPoint(focusPoint);
    }
  } catch (error) {
    // 失败返回错误码error.code并处理
    let err = error as BusinessError;
    console.error(`The setFocusMode and setFocusPoint call failed. error code: ${err.code}`);
    expect().assertFail()
  }
}

/**
 * @desc 监听预览帧的回调函数
 * @param { BusinessError } err 错误码
 */
function previewOutputFrameStartcallback(err: BusinessError): void {
  isFrameStart = true
}

/**
 * @desc 监听预览帧, 60s监听不到就抛异常
 * @param { camera.PreviewOutput } previewOutput 相机预览流
 */
export async function onPreviewOutputFrameStart(previewOutput: camera.PreviewOutput): Promise<void> {
  previewOutput.on('frameStart', previewOutputFrameStartcallback);
  //等待预览帧开始
  let previewOutputFrameStartTime = Date.now();
  while (!isFrameStart) {
    await sleep(20);
    let previewOutputFrameEndTime = Date.now();
    if (previewOutputFrameEndTime - previewOutputFrameStartTime > 60000) {
      console.info('预览画面帧输出超时');
      expect().assertFail();
    }
  }
  endTime = Date.now();
}

/**
 * @desc 取消监听预览帧
 * @param { camera.PreviewOutput } previewOutput 相机预览流
 */
export function offPreviewOutputFrameStart(previewOutput: camera.PreviewOutput): void {
  previewOutput.off('frameStart', previewOutputFrameStartcallback);
  isFrameStart = false
}

/**
 * @desc 设置拍照出图回调
 * @param { camera.PhotoOutput } photoOutput 相机拍照输出流
 */
export function onPhotoOutputPhotoAssetAvailable(photoOutput: camera.PhotoOutput,
  helperInstance: photoAccessHelper.PhotoAccessHelper): void {
  photoHelper = helperInstance;
  photoOutput.on('photoAssetAvailable', photoAssetAvailableCallback);
}

/**
 * @desc 设置是否可拍下一张的回调函数
 */
function captureReadyCallback() {
  globalThis.isCaptureReady = true;
  console.info('globalThis.isCaptureReady is true')
}

/**
 * @desc 监听是否可拍下一张
 * @param { camera.PhotoOutput } photoOutput 相机拍照输出流
 */
export function onCaptureReady(photoOutput: camera.PhotoOutput) {
  photoOutput.on('captureReady', captureReadyCallback)
}

/**
 * @desc 取消监听是否可拍下一张
 * @param { camera.PhotoOutput } photoOutput 相机拍照输出流
 */
export function offCaptureReady(photoOutput: camera.PhotoOutput) {
  photoOutput.off('captureReady', captureReadyCallback)
}

/**
 * @desc 相机拍照
 * @param { camera.PhotoOutput } photoOutput 相机拍照输出流
 * @param { number } captureNumber 拍照数量
 */
export async function
cameraCaptureRelyOnNum(photoOutput: ESObject, captureNumber: number) {
  let captureLocation: camera.Location = {
    latitude: 0,
    longitude: 0,
    altitude: 0
  }
  let photoCaptureSetting: camera.PhotoCaptureSetting = {
    quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
    rotation: camera.ImageRotation.ROTATION_0,
    location: captureLocation,
    mirror: false
  }

  //等待预览帧开始
  while (!isFrameStart) {
    await sleep(20);
  }

  console.info('captureNumber is ' + captureNumber);
  //使用当前拍照设置进行拍照。
  let iCapture = 0;
  console.info('before capture, globalThis.isCaptureReady ' + globalThis.isCaptureReady);
  while (iCapture < captureNumber) {
    if (globalThis.isCaptureReady) {
      iCapture++;
      globalThis.isCaptureReady = false;
      console.info('iCapture is ' + iCapture);
      await photoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
        if (err) {
          console.error(`Failed to capture the photo ${err.message}`);
          expect().assertFail()
          return;
        }
      });
    }
    await sleep(10)
  }
  console.info('after capture, globalThis.isCaptureReady: ' + globalThis.isCaptureReady);
}

/**
 * @desc 获取媒体库资产总数
 * @returns 当前媒体库资产的总数量
 */
export async function getAllPhotoAssetsCount(): Promise<number> {
  const helper = await getHelper();
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOption);
  let photoAssetsCount = await fetchResult.getCount();
  helper.release();
  return photoAssetsCount
}

/**
 * @desc 获取资源的快速缩略图和普通缩略图
 * @param { photoAccessHelper.PhotoAsset } asset 媒体库资产对象
 * @returns 资产的缩略图对象
 */
export async function getThumbnailFor256(asset: photoAccessHelper.PhotoAsset): Promise<image.PixelMap> {
  let resPixelMap: image.PixelMap | undefined = undefined
  let thmSize: image.Size = {
    width: 256,
    height: 256
  }
  asset.getThumbnail(thmSize, async (err, pixel: image.PixelMap) => {
    if (err === undefined) {
      console.info("requestSource in, size: " + JSON.stringify((await pixel.getImageInfo()).size))
      let imageInfo = await pixel.getImageInfo();
      if (imageInfo.size.height == 256) {
        resPixelMap = pixel;
      }
    } else {
      console.error(`requestSource failed with error: ${err.code}, ${err.message}`);
      expect().assertFail();
    }
  })
  while (resPixelMap == undefined) {
    await sleep(20);
  }
  return resPixelMap!;
}

/**
 * @desc 判断pixelMap图的某个像素点是否符合预期
 * @param { number } x 图片的宽度
 * @param { number } y 图片的宽度
 * @param { number } rowOffset 行距偏移值
 * @param { Uint8Array } bufferArr 图片信息
 * @returns 布尔值, false表示不符合预期, true表示符合预期
 */
export function checkPixelValues(x: number, y: number, rowOffset: number, bufferArr: Uint8Array,
  Red: number | undefined, Green: number | undefined, Blue: number | undefined, Alpha: number | undefined): boolean {
  let index = (y * rowOffset + x) * 4;
  if (bufferArr[index] == Red && bufferArr[index + 1] == Green && bufferArr[index + 2] == Blue &&
    bufferArr[index + 3] == Alpha) {
    console.info(' Failed to check pixel values');
    return true;
  }
  return false;
}

/**
 * @desc 检测相机拍出来的照片是否存在白图
 * @param { photoAccessHelper.PhotoAsset } photoAsset 媒体库资产对象
 * @returns 布尔值, false表示不是白图, true表示是白图
 */
async function checkCameraPhotoIsWhitePicture(photoAsset: photoAccessHelper.PhotoAsset) {
  let imageThum = await getThumbnailFor256(photoAsset);
  try {
    if (imageThum != undefined) {
      let pixelBytesNumber: number = imageThum.getPixelBytesNumber();
      let imageBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
      imageThum.readPixelsToBufferSync(imageBuffer);
      let bufferArr: Uint8Array = new Uint8Array(imageBuffer);
      let isWhitePicture = checkPixelValues(128, 128, 256, bufferArr, 255, 255, 255, 255);
      let isWhitePictureSec = checkPixelValues(128 + 100, 128 + 100, 256, bufferArr, 255, 255, 255, 255);
      return isWhitePicture && isWhitePictureSec;
    } else {
      console.info('getThumbnail is undefined')
      return false;
    }
  } catch (err) {
    console.error('checkCameraPhotoIsWhitePicture occur error, error is ' + err)
    expect().assertFail();
    return false;
  }
}

/**
 * @desc 监听图片资产的回调函数
 * @param { BusinessError } err 错误码
 * @param { photoAccessHelper.PhotoAsset } photoAsset 媒体库资产对象
 */
export async function photoAssetAvailableCallback(err: BusinessError, photoAsset: photoAccessHelper.PhotoAsset) {
  if (err) {
    console.info(`photoAssetAvailable error: ${JSON.stringify(err)}.`);
    expect().assertFail()
    return;
  }
  console.info('photoAssetAvailableCallback photoAssetAvailable photoAsset.uri is ' + photoAsset.uri);
  let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
    new photoAccessHelper.MediaAssetChangeRequest(photoAsset);

  assetChangeRequest.saveCameraPhoto();
  await photoHelper.applyChanges(assetChangeRequest)
  let asset: photoAccessHelper.PhotoAsset = assetChangeRequest.getAsset()
  console.info('photoAssetAvailableCallback asset.uri is ' + asset.uri);
  console.info('photoAssetAvailableCallback asset.displayName is ' + asset.displayName);
  realCapturePhotoNum++;
  console.info('photoAssetAvailableCallback realCapturePhotoNum is ' + realCapturePhotoNum);
  let tmpTime = Date.now();
  if (tmpTime > endTime) {
    endTime = tmpTime;
  }
  photoAccessArray.push(photoAsset);
}

/**
 * @desc 关闭拍照出图回调
 * @param { camera.PhotoOutput } photoOutput 图片输出流对象
 * @param { number } capturePhotoNum 拍照数量
 * @param { Array<string> } fileNames 资产名称列表
 * @param { boolean } capturePhotoNum 是否拍照, 默认为false
 * @returns 拍照生成的资产列表
 */
export async function offPhotoOutputPhotoAssetAvailable(photoOutput: camera.PhotoOutput, capturePhotoNum: number,
  fileNames: Array<string>, isCapture: boolean = false): Promise<Array<photoAccessHelper.PhotoAsset>> {
  beginTime = Date.now();
  while (realCapturePhotoNum < capturePhotoNum) {
    await sleep(200);
    let tmpTime = Date.now();
    if (tmpTime - beginTime > 150000) {
      beginTime = 0;
      console.info('delay fail realCapturePhotoNum is' + realCapturePhotoNum)
      console.info('delay fail capturePhotoNum is' + capturePhotoNum)
      expect().assertFail();
      break;
    }
  }
  while (photoAccessArray.length < capturePhotoNum) {
    await sleep(200);
  }
  if (isCapture) {
    expect(realCapturePhotoNum == capturePhotoNum && photoAccessArray.length == capturePhotoNum).assertTrue();
  } else {
    expect(realCapturePhotoNum >= capturePhotoNum).assertTrue();
  }
  realCapturePhotoNum = 0;
  photoOutput.off('photoAssetAvailable', photoAssetAvailableCallback);
  for (let i = 0; i < photoAccessArray.length; i++) {
    fileNames.push(photoAccessArray[i].displayName);
    let isWhitePicture = await checkCameraPhotoIsWhitePicture(photoAccessArray[i])
    if (isWhitePicture) {
      console.error('CameraPhoto is whilePicture');
      realCapturePhotoNum = 0;
      expect().assertFail();
    }
  }
  let temp = photoAccessArray
  photoAccessArray = []
  return temp;
}

/**
 * @desc 校验当前图库中的资产数量是否增加
 * @param { number } beforeCount 之前的资产数量
 * @param { number } increaseAssets 增加的资产数量
 */
export async function expectEqualPhotoCount(beforeCount: number, increaseAssets: number) {
  let afterCount = await getAllPhotoAssetsCount();
  try {
    let startTime = Date.now();
    while (afterCount < beforeCount + increaseAssets) {
      await sleep(200);
      afterCount = await getAllPhotoAssetsCount();
      if (Date.now() - startTime > 60000) {
        console.info('拍照出图超时');
        expect().assertFail();
      }
    }
    expect(beforeCount + increaseAssets == afterCount).assertTrue();
    console.info(`afterCount is equal ${beforeCount + increaseAssets}`);
  } catch (error) {
    console.error(`afterCount:${afterCount} is not equal ${beforeCount + increaseAssets}, error is ${error}`);
    expect().assertFail()
  }
}

// 视频类型
export enum VideoType {
  SDR,
  HDR
}

/**
 * @desc 判定视频文件是否是HDR视频
 * @param { photoAccessHelper.PhotoAsset } fileAsset 之前的资产数量
 * @returns false:不是HDR视频, true: 是HDR视频
 */
export function isHdrVideo(fileAsset: photoAccessHelper.PhotoAsset): boolean {
  try {
    let dynamicRangeType: photoAccessHelper.MemberType = fileAsset.get(photoAccessHelper.PhotoKeys.DYNAMIC_RANGE_TYPE);
    console.info('dynamicRangeType is ' + dynamicRangeType);
    if (typeof dynamicRangeType === 'number') {
      console.info('dynamicRangeType is ' + dynamicRangeType);
      if (dynamicRangeType == VideoType.HDR) {
        return true;
      }
      expect().assertFail();
      return false;
    } else {
      expect().assertFail();
      return false;
    }
  } catch (error) {
    console.info('Failed to get keys ' + error.code + ' message is ' + error.message)
    expect().assertFail()
    return false;
  }
}

/**
 * @desc 往文件中写入内容, 文件需要放在应用沙箱中
 * @param { string } text 写入的信息
 * @param { string } fileName 应用沙箱中的文件名称, 默认为configInfo.json
 */
export async function writeFile(configInfo: string, fileName: string = "configInfo.json") {
  let fileUri: string = `file://${AppStorage.get('pathDir')}/${fileName}`;
  let file: fs.File = fs.openSync(fileUri, fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC | fs.OpenMode.CREATE);
  fs.writeSync(file.fd, configInfo);
  fs.closeSync(file.fd);
}

/**
 * @desc 在应用沙箱中创建一个文件
 * @param { string } fileName 应用沙箱中的文件名称, 默认为caseInfo.json
 * @returns 文件id
 */
export function createFile(fileName: string = "caseInfo.json") {
  let fileUri: string = `file://${AppStorage.get('pathDir')}/${fileName}`;
  let file: fs.File = fs.openSync(fileUri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  // 关闭文件
  let fileId = file.fd
  fs.closeSync(file.fd);
  return fileId
}

/**
 * @desc 创建单个视频空资产
 * @param { string } videoUri 文件的URI, 不传就以当前时间戳命名，在本地沙箱路径下新建,格式为mp4
 * @returns { fs.File } 文件对象
 */
export async function createVideoFile(videoUri?: string): Promise<fs.File> {
  if (!videoUri) {
    videoUri = `file://${AppStorage.get('pathDir')}/${Date.now()}.mp4`; // 本地沙箱路径。
  }
  let file: fs.File = fs.openSync(videoUri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  return file;
}

/**
 * @desc 读取文件内容, 文件需要放在应用沙箱中
 * @param { string } fileName 应用沙箱中的文件名称, 默认为caseInfo.json
 * @returns 文件内容
 */
export async function readFile(fileName: string = "caseInfo.json"): Promise<string> {
  let fileUri: string = `file://${AppStorage.get('pathDir')}/${fileName}`;
  let file: fs.File = fs.openSync(fileUri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let arrayBuffer = new ArrayBuffer(88888);
  // 设置读取的偏移量和长度
  let readOptions: ReadOptions = {
    offset: 0,
    length: arrayBuffer.byteLength
  };
  // 读取文件内容到ArrayBuffer对象中，并返回实际读取的字节数
  let readLen = fs.readSync(file.fd, arrayBuffer, readOptions);
  // 将ArrayBuffer对象转换为Buffer对象，并转换为字符串输出
  let buf = buffer.from(arrayBuffer, 0, readLen);
  let str = buf.toString()
  console.info(`the content of file: ${str}`);
  // 关闭文件
  fs.closeSync(file.fd);
  return str
}

/**
 * @desc 等待状态更新
 * @param { string } status 等待状态更新为指定的状态值
 *                   0：配置已上传
 *                   1：测试数据已下发
 */
export async function waitForStatus(status: string) {
  let startTime = Date.now();
  let str = await readFile("status.txt")
  let value = str.replace(/[\n]+/g, '');
  console.info("case status: " + status)
  while (value != status) {
    await sleep(2000)
    if (Date.now() - startTime > 60000) {
      console.error("等待状态更新超时")
      expect().assertFail()
    }
    str = await readFile("status.txt")
    value = str.replace(/[\n]+/g, '');
    console.info("case status: " + value)
  }
}

/**
 * @desc 获取拍照输出流
 * @param { camera.CameraManager } cameraManager
 * @returns { camera.PhotoOutput }
 *
 */
export function getPhotoOutput(cameraManager: camera.CameraManager
): camera.PhotoOutput {

  let photoOutput: camera.PhotoOutput | undefined = undefined;
  try {
    // 创建 PhotoOutput 时指定格式
    photoOutput = cameraManager.createPhotoOutput();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`error is Failed to createPhotoOutput. error: ${JSON.stringify(err)}`);
    expect().assertFail()
  }
  return photoOutput!;
}

/**
 * @desc 创建拍照预览输出流
 * @param { camera.CameraManager } cameraManager
 * @returns { camera.PreviewOutput }
 *
 */
export function getPreviewOutput(cameraManager: camera.CameraManager) {
  // 创建预览输出流,其中参数 surfaceId 参考上文 XComponent 组件，预览流为XComponent组件提供的surface。
  let previewOutput: camera.PreviewOutput | undefined = undefined;
  try {
    previewOutput = cameraManager.createPreviewOutput(globalThis.surfaceId);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to create the PreviewOutput instance. error code: ${err.code}`);
    expect().assertFail()
  }
  if (previewOutput === undefined) {
    return;
  }
  return previewOutput
}

/**
 * @desc 开始配置会话
 * @param { session } session
 *
 */
export function beginConfigSession(session: ESObject) {

  // 开始配置会话。
  try {
    session.beginConfig();
  } catch (error) {
    let err = error as BusinessError;
    console.error('error is Failed to beginConfig. errorCode = ' + err.code);
    expect().assertFail()
  }
}

/**
 * @desc 获取拍照输出流
 * @param { camera.CameraManager } cameraManager
 * @param { camera.CameraOutputCapability } cameraOutputCapability
 * @param { format: camera.CameraFormat } format
 * @returns { camera.PhotoOutput }
 */
export function getPhotoOutputWithRatio(cameraManager: camera.CameraManager, cameraOutputCapability: camera.CameraOutputCapability,
  format: camera.CameraFormat
): camera.PhotoOutput {
  let photoProfile: camera.Profile | undefined;
  // 将 photoProfiles 按分辨率从大到小排序
  const sortedProfiles = [...cameraOutputCapability.photoProfiles].sort((a, b) => {
    // 按面积（width * height）降序排序
    return (b.size.width * b.size.height) - (a.size.width * a.size.height);
  });
  // 遍历排序后的 photoProfiles，找到指定宽高比的 photoProfile
  for (const profile of sortedProfiles) {
    if (profile.size.width * 3 === profile.size.height * 4 && profile.format == format) {
      photoProfile = profile;
      break;
    }
  }
  if (!photoProfile) {
    console.error('No photoProfile found with the specified aspect ratio');
    expect(true).assertFail();
  }
  console.info("photoProfile is "+JSON.stringify(photoProfile));
  let photoOutput: camera.PhotoOutput | undefined = undefined;
  try {
    // 创建 PhotoOutput 时指定格式
    photoOutput = cameraManager.createPhotoOutput({
      format: photoProfile?.format,
      size: { width: photoProfile!.size.width, height: photoProfile!.size.height }
    });
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to createPhotoOutput. error: ${JSON.stringify(err)}`);
    expect().assertFail()
  }
  return photoOutput!;
}

/**
 * @desc 创建拍照预览输出流
 * @param { camera.CameraManager } cameraManager
 * @param { camera.CameraOutputCapability } cameraOutputCapability
 * @returns { camera.PreviewOutput }
 */
export function createPreviewOutput(cameraManager: camera.CameraManager,
  cameraOutputCapability: camera.CameraOutputCapability) {
  let previewProfilesArray: Array<camera.Profile> = cameraOutputCapability.previewProfiles;
  if (!previewProfilesArray) {
    console.error("createOutput photoProfilesArray == null || undefined");
  }
  // 创建预览输出流,其中参数 surfaceId 参考上文 XComponent 组件，预览流为XComponent组件提供的surface。
  let previewOutput: camera.PreviewOutput | undefined = undefined;
  try {
    console.log("previewProfilesArray[previewProfilesArray.length-1]  " + JSON.stringify(previewProfilesArray[previewProfilesArray.length-1]));
    previewOutput = cameraManager.createPreviewOutput(previewProfilesArray[previewProfilesArray.length-1], globalThis.surfaceId);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to create the PreviewOutput instance. error code: ${err.code}`);
    expect().assertFail()
  }
  if (previewOutput === undefined) {
    return;
  }
  return previewOutput
}

/**
 * @desc 使能动态照片
 * @param { photoOutput: camera.PhotoOutput } photoOutput
 *
 */
export function enableMovingPhoto(photoOutput: camera.PhotoOutput): void {
  try {
    if (isMovingPhotoSupported(photoOutput)) {
      photoOutput.enableMovingPhoto(true);
    }
  } catch (error) {
    // 失败返回错误码error.code并处理。
    let err = error as BusinessError;
    console.error(`The enableMovingPhoto call failed. error code: ${err.code}`);
    expect().assertFail()
  }
}

/**
 * @desc 判断设备是否支持动态照片
 * @param { photoOutput: camera.PhotoOutput } photoOutput
 * @returns { Boolean }
 */
function isMovingPhotoSupported(photoOutput: camera.PhotoOutput): boolean {
  let isSupported: boolean = false;
  try {
    isSupported = photoOutput.isMovingPhotoSupported();
    globalThis.isSupportMovingPhoto = isSupported;
    console.log("error is isSupport MovingPhoto: " + isSupported)
  } catch (error) {
    // 失败返回错误码error.code并处理。
    let err = error as BusinessError;
    console.error(`The isMovingPhotoSupported call failed. error code: ${err.code}`);
    expect().assertFail()
  }
  return isSupported;
}

/**
 * @desc 查找所有动态照片视频的数量
 * @param { photoOutput: camera.PhotoOutput } photoOutput
 * @returns { Boolean }
 */
export async function getMovingPhotoVideoNum(): Promise<number> {
  const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const cmd1 = 'echo ' + '/storage/cloud/100/files/Photo/*/*.mp4';
  console.log(`data is is cmd ${cmd1}`);
  const resultStr = await abilityDelegator.executeShellCommand(cmd1, 10);
  let dataStr = resultStr.stdResult.toString();
  // console.info('movingPhotoVideoCount is ' + JSON.stringify(dataStr));
  if (dataStr.includes('*/*.mp4')) {
    console.info('movingPhotoVideoCount is ' + 0);
    return 0;
  }
  let movingPhotoVideoCount = dataStr.split('.mp4').length - 1;
  console.info('movingPhotoVideoCount is ' + (movingPhotoVideoCount));
  return movingPhotoVideoCount;
}

/**
 * @desc 查找是否存在动态照片视频
 * @param { photoOutput: camera.PhotoOutput } photoOutput
 * @returns { Boolean }
 */
export async function IsexistMovingPhotoVideo(assets: ESObject) {
  let photopath: string = assets[0].uri;
  let photoformat = photopath.split('.')[1]
  let parts = photopath.split('/')
  let photoname = parts[parts.length-2];

  const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const cmd1 = 'echo ' + '/storage/cloud/100/files/Photo/*/' + photoname + '*';
  console.log(`data is is cmd ${cmd1}`);
  let isExist = false;
  let movingPhotoCreateTime = Date.now();
  while (!isExist) {
    let tmpTime = Date.now();
    if (tmpTime - movingPhotoCreateTime > 60000) {
      isExist = true
      console.error("在等待动态照片视频时超时，未找到动态照片视频");
      expect().assertFail()
    }
    const resultStr = await abilityDelegator.executeShellCommand(cmd1, 10);
    let dataStr = resultStr.stdResult.toString();
    // console.info('movingPhotoVideoCount is ' + JSON.stringify(dataStr));
    if (dataStr.includes('mp4')) {
      let isexistmovingPhotoVideo = dataStr.includes(photoname + '.mp4');
      if (!isexistmovingPhotoVideo) {
        console.error("error is isexistmovingPhotoVideo is " + isexistmovingPhotoVideo);
        expect().assertFail()
      }
      let isexistmovingPhoto = dataStr.includes(photoname + '.' + photoformat);
      if (!isexistmovingPhoto) {
        console.error("error is isexistmovingPhoto is " + isexistmovingPhoto);
        expect().assertFail()
      }
      isExist = true
    }
  }
}

/**
 * @desc 断言拍照前后动态照片数量是否正确
 * @param { number } originalVideoNum
 * @param { number } increaseAssets
 *
 */
export async function expectEqualMovingPhotoVideoNum(originalVideoNum: number, increaseAssets: number) {
  let newVideoNum = await getMovingPhotoVideoNum();
  try {
    let movingPhotoCreateTime = Date.now();
    while (newVideoNum != originalVideoNum + increaseAssets) {
      let tmpTime = Date.now();
      if (tmpTime - movingPhotoCreateTime > 60000) {
        console.info('tmpTime is' + tmpTime.toString())
        console.info('movingPhotoCreateTime is' + movingPhotoCreateTime.toString())
        console.info('delay fail ' + `newVideoNum:${newVideoNum} is not equal ${originalVideoNum + increaseAssets}`)
        console.info(`动态照片视频数量不一致, 预期动态照片视频数量为${originalVideoNum + increaseAssets}, 实际视频数量为${newVideoNum}`)
        expect().assertFail();
        break;
      }
      await sleep(2000);
      newVideoNum = await getMovingPhotoVideoNum();
    }
    expect(newVideoNum - originalVideoNum).assertEqual(increaseAssets);
    console.info(`newVideoNum is equal ${originalVideoNum + increaseAssets}`);
  } catch (error) {
    console.error(`newVideoNum:${newVideoNum} is not equal ${originalVideoNum + increaseAssets}, error is ${error}`);
    console.info(`动态照片视频数量不一致, 预期动态照片视频数量为${originalVideoNum + increaseAssets}, 实际视频数量为${newVideoNum}`)
    expect().assertFail()
  }
}

/**
 * @desc 根据用例信息, 生成录像或图片文件的名称
 * @param { camera.SceneMode } mode 相机模式
 * @param { camera.CameraDevice } cameraId 相机信息
 * @param { camera.Profile } videoOrPhotoProfile 录像或者拍照配置
 * @param { camera.Profile } previewProfile 预览配置
 */
export async function generateNameForAsset(
  mode: camera.SceneMode,
  cameraId: camera.CameraDevice,
  videoOrPhotoProfile: camera.Profile,
  previewProfile: camera.Profile,
  zoomRatio?: number,
  frameRate?: number
) {
  // hdr信息
  let hdrInfo = "Photo"
  if (mode == camera.SceneMode.NORMAL_VIDEO) {
    hdrInfo = "Video"
  }
  if (videoOrPhotoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
    videoOrPhotoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010) {
    hdrInfo = "Hdr" + hdrInfo
  }
  // 镜头信息
  let cameraInfo = cameraId.cameraId.replace("/", "")
  // 时间
  let timeInfo = getDateStringWithTimeStamp(Date.now())
  // 录像/拍照分辨率
  let videoOrPhotoInfo = `f${videoOrPhotoProfile.format}_${videoOrPhotoProfile.size.width}x${videoOrPhotoProfile.size.height}`
  // 预览分辨率
  let previewInfo = `f${previewProfile.format}_${previewProfile.size.width}x${previewProfile.size.height}`
  // 帧率
  let frameRateInfo = ""
  if (frameRate) {
    frameRateInfo = `${frameRate.toString().split(".")[0]}fps_`
  }
  let AssetName = `${hdrInfo}_${cameraInfo}_${timeInfo}_${frameRateInfo}${videoOrPhotoInfo}_${previewInfo}_${zoomRatio}x`
  AssetName = AssetName.replace(/\./g, '');
  
  return AssetName;
}

/**
 * @desc 获取当前时间, 时间格式固定为：年月日_时分秒
 */
function getDateStringWithTimeStamp(timestamp: number): string {
  let date = new Date(timestamp);
  const year = date.getFullYear();
  const month = ('0' + (date.getMonth() + 1)).slice(-2);
  const day = ('0' + date.getDate()).slice(-2);
  const hour = date.getHours();
  const min = date.getMinutes();
  const sec = date.getSeconds();
  return `${year}${month}${day}_${hour}${min}${sec}`;
}

/**
 * @desc 重命名资产
 * @param { photoAccessHelper.PhotoAsset } asset 媒体库资产对象
 * @param { string } 新名称
 */
export function renameAsset(asset: photoAccessHelper.PhotoAsset, newTitle: string) {
  let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset!);
  assetChangeRequest.setTitle(newTitle)
  photoHelper.applyChanges(assetChangeRequest).then(() => {
    console.info('apply setTitle successfully');
  }).catch((err: BusinessError) => {
    console.error(`apply setTitle failed with error: ${err.code}, ${err.message}`);
  });;
}