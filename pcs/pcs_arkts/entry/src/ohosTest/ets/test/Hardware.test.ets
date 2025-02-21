/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import wifiManager from '@ohos.wifiManager';
import camera from '@ohos.multimedia.camera';
import List from '@ohos.util.List';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import audio from '@ohos.multimedia.audio';
import usbManager from '@ohos.usbManager';
import { Driver, ON } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import PermissionUtils from './PermissionUtils';
import { Permissions } from '@ohos.abilityAccessCtrl';
import AbilityUtils from './AbilityUtils';

export default function hardwareTest() {
  describe('HardwareTest', () => {
    let abilityContext: common.UIAbilityContext
    let applicationContext: common.ApplicationContext
    let isWlanSupported = false
    let isBluetoothSupported = false
    let isCameraSupported = false
    let isMicrophoneSupported = false
    let isAoutSupported = false
    let isUsbSupported = false
    let isEthernetSupported = false
    let isCellularSupported = false
    let infrastructureFeature: number = 0x0001
    let bandwidth5GFeature: number = 0x0002
    let staAndApFeature: number = 0x8000
    let p2pFeature: number = 0x0008
    beforeAll(async (done: Function) => {
      abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      applicationContext = abilityContext.getApplicationContext()
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()

      let permissions: Array<Permissions> = ['ohos.permission.CAMERA',
        'ohos.permission.MICROPHONE'];
      await PermissionUtils.getPermission(abilityContext, permissions)
      await PermissionUtils.grantPermission()
      let driver = Driver.create();
      await driver.delayMs(3000)

      isWlanSupported = canIUse("SystemCapability.Communication.WiFi.Core")
      isBluetoothSupported = canIUse("SystemCapability.Communication.Bluetooth.Core")
      isCameraSupported = canIUse("SystemCapability.Communication.Bluetooth.Core")
      isMicrophoneSupported = canIUse("SystemCapability.Multimedia.Audio.Capturer")
      isAoutSupported = canIUse("SystemCapability.Multimedia.Audio.Renderer")
      isUsbSupported = canIUse("SystemCapability.USB.USBManager")
      isEthernetSupported = canIUse("SystemCapability.Communication.NetManager.Ethernet")
      isCellularSupported = canIUse("SystemCapability.Telephony.CellularData")
      done()
    })


    /*
     * @tc.number: STD-HARDWARE-0100
     * @tc.name: testNetworkSupportAtLeastOneType0100
     * @tc.desc: 【STD-HARDWARE-0100】设备必须提供至少一种数据网络形式的支持，比如 WiFi/蜂窝/以太网/蓝牙
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNetworkSupportAtLeastOneType0100', 0, async (done: Function) => {
      expect(isWlanSupported || isCellularSupported || isEthernetSupported || isBluetoothSupported).assertTrue()
      done()
    })

    /*
     * @tc.number: STD-HARDWARE-0101
     * @tc.name: testNetworkCompleteImplementation0100
     * @tc.desc: 【STD-HARDWARE-0101】如果设备支持多种数据网络，必须提供网络管理能力的完整实现
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNetworkCompleteImplementation0100', 0, async (done: Function) => {
      let networkSupportedCount = 0
      if (isWlanSupported) {
        networkSupportedCount++
      }
      if (isCellularSupported) {
        networkSupportedCount++
      }
      if (isEthernetSupported) {
        networkSupportedCount++
      }
      if (isBluetoothSupported) {
        networkSupportedCount++
      }
      if (networkSupportedCount >= 2) {
        let netStackSupported = canIUse("SystemCapability.Communication.NetStack")
        expect(netStackSupported).assertTrue()
        let netManagerCore = canIUse("SystemCapability.Communication.NetManager.Core")
        expect(netManagerCore).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: G-HARDWARE-0202
     * @tc.name: testWlanSupport2.4G0100
     * @tc.desc: 【G-HARDWARE-0202】必须支持 IEEE 802.11b/g/n
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testWlanSupport2.4G0100', 0, async (done: Function) => {
      if (isWlanSupported) {
        expect(wifiManager.isFeatureSupported(infrastructureFeature)).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: STD-HARDWARE-0203
     * @tc.name: testWlanSupport5G0100
     * @tc.desc: 【STD-HARDWARE-0203】必须支持 IEEE 802.11ac
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testWlanSupport5G0100', 0, async (done: Function) => {
      if (isWlanSupported) {
        expect(wifiManager.isFeatureSupported(bandwidth5GFeature)).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: G-HARDWARE-0203
     * @tc.name: testWlanSupportSTAAndAP0100
     * @tc.desc: 【G-HARDWARE-0203】必须支持 STA 和 AP 模式
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testWlanSupportSTAAndAP0100', 0, async (done: Function) => {
      if (isWlanSupported) {
        let isSTASupported = canIUse("SystemCapability.Communication.WiFi.STA")
        let isAPSupported = canIUse("SystemCapability.Communication.WiFi.AP.Core")
        expect(isSTASupported && isAPSupported).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: STD-HARDWARE-0203
     * @tc.name: testWlanSupportP2P0100
     * @tc.desc: 【STD-HARDWARE-0203】必须支持 P2P 模式
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testWlanSupportP2P0100', 0, async (done: Function) => {
      if (isWlanSupported) {
        let isP2PSupported = canIUse("SystemCapability.Communication.WiFi.P2P")
        expect(isP2PSupported).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: C-ALL-HARDWARE-0904
     * @tc.name: testCameraSupportAutoExposure0100
     * @tc.desc: 【C-ALL-HARDWARE-0904】必须支持 3A（Auto Exposure/Auto Focus/Auto White Balance）调节
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCameraSupportAutoExposure0100', 0, async (done: Function) => {
      if (isCameraSupported) {
        let getResult: [boolean, camera.PhotoSession] = await getPhotoSession(abilityContext, applicationContext)
        if(!getResult[0]) {
          expect(true).assertTrue()
          done()
          return
        }
        let photoSession = getResult[1]
        try {
          let supportedExposureModes = new Array<camera.ExposureMode>()
          if (photoSession.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_LOCKED)) {
            supportedExposureModes.push(camera.ExposureMode.EXPOSURE_MODE_LOCKED)
          }
          if (photoSession.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO)) {
            supportedExposureModes.push(camera.ExposureMode.EXPOSURE_MODE_AUTO)
          }
          if (photoSession.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)) {
            supportedExposureModes.push(camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)
          }
          for (let supportedExposureMode of supportedExposureModes) {
            photoSession.setExposureMode(supportedExposureMode)
            expect(photoSession.getExposureMode()).assertEqual(supportedExposureMode)
          }
        } catch (error) {
          let err = error as BusinessError
          console.error(`Failed to config exposure mode. error: ${JSON.stringify(err)}`)
          expect(false).assertTrue()
        }
        await stopPhotoSession(photoSession)
      }
      done()
    })

    /*
     * @tc.number: C-ALL-HARDWARE-0904
     * @tc.name: testCameraSupportAutoFocus0100
     * @tc.desc: 【C-ALL-HARDWARE-0904】必须支持 3A（Auto Exposure/Auto Focus/Auto White Balance）调节
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCameraSupportAutoFocus0100', 0, async (done: Function) => {
      if (isCameraSupported) {
        let getResult: [boolean, camera.PhotoSession] = await getPhotoSession(abilityContext, applicationContext)
        if(!getResult[0]) {
          expect(true).assertTrue()
          done()
          return
        }
        let photoSession = getResult[1]
        try {
          let supportedFocusModes = new Array<camera.FocusMode>()
          if (photoSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_MANUAL)) {
            supportedFocusModes.push(camera.FocusMode.FOCUS_MODE_MANUAL)
          }
          if (photoSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO)) {
            supportedFocusModes.push(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO)
          }
          if (photoSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_AUTO)) {
            supportedFocusModes.push(camera.FocusMode.FOCUS_MODE_AUTO)
          }
          if (photoSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_LOCKED)) {
            supportedFocusModes.push(camera.FocusMode.FOCUS_MODE_LOCKED)
          }
          for (let supportedFocusMode of supportedFocusModes) {
            photoSession.setFocusMode(supportedFocusMode)
            expect(photoSession.getFocusMode()).assertEqual(supportedFocusMode)
          }
        } catch (error) {
          let err = error as BusinessError
          console.error(`Failed to config focus mode. error: ${JSON.stringify(err)}`)
          expect(false).assertTrue()
        }
        await stopPhotoSession(photoSession)
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0900
     * @tc.name: testCameraInformationQuery0100
     * @tc.desc: 【C-S|STD-SOFTWARE-0900】必须提供摄像头设备能力查询功能，包含摄像头个数，方向，类型，宽高比和分辨率信息
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCameraInformationQuery0100', 0, async (done: Function) => {
      if (isCameraSupported) {
        let cameraManager = camera.getCameraManager(applicationContext)
        // query camera number
        let supportedCameras = cameraManager.getSupportedCameras()
        if(supportedCameras.length == 0) {
          console.log(`No Supported usb camera`)
          expect(true).assertTrue()
          done()
          return
        }
        // query position
        let cameraDevice = supportedCameras[0]
        let supportedPositions = [camera.CameraPosition.CAMERA_POSITION_BACK,
          camera.CameraPosition.CAMERA_POSITION_FRONT,
          camera.CameraPosition.CAMERA_POSITION_FOLD_INNER]
        let position = cameraDevice.cameraPosition
        expect(supportedPositions).assertContain(position)
        // query type
        let supportedTypes = [camera.CameraType.CAMERA_TYPE_DEFAULT,
          camera.CameraType.CAMERA_TYPE_WIDE_ANGLE,
          camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
          camera.CameraType.CAMERA_TYPE_TELEPHOTO,
          camera.CameraType.CAMERA_TYPE_TRUE_DEPTH]
        let type = cameraDevice.cameraType
        expect(supportedTypes).assertContain(type)
        // query aspect ratio
        let supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, camera.SceneMode.NORMAL_PHOTO)
        let profiles = supportedOutputCapability.photoProfiles
        expect(profiles.length).assertLarger(0)
        let size = profiles[0].size
        expect(size.width).assertLarger(0)
        expect(size.height).assertLarger(0)
        expect(size.width / size.height).assertLarger(0)
        // query resolving power
        expect(size.width * size.height).assertLarger(0)
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0901
     * @tc.name: testCameraDataStreamCollect0100
     * @tc.desc: 【C-S|STD-SOFTWARE-0901】必须提供摄像头数据流采集功能，包含预览流、录像流和拍照流。
     *             预览流、录像流必须支持YUV420SP格式，拍照流必须支持 JPEG 编码格式
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCameraDataStreamCollect0100', 0, async (done: Function) => {
      if (isCameraSupported) {
        let cameraManager = camera.getCameraManager(applicationContext)
        let supportedCameras = cameraManager.getSupportedCameras()
        if(supportedCameras.length == 0) {
          console.log(`No Supported usb camera`)
          expect(true).assertTrue()
          done()
          return
        }

        let previewFormats = new Array<camera.CameraFormat>()
        let videoFormats = new Array<camera.CameraFormat>()
        let photoFormats = new Array<camera.CameraFormat>()
        for(let cameraDevice of supportedCameras) {
          let supportedOutputCapability: camera.CameraOutputCapability
          supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, camera.SceneMode.NORMAL_VIDEO)
          let previewProfiles = supportedOutputCapability.previewProfiles
          for (let previewProfileInfo of previewProfiles) {
            previewFormats.push(previewProfileInfo.format)
          }
          supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, camera.SceneMode.NORMAL_VIDEO)
          let videoProfiles = supportedOutputCapability.videoProfiles
          for (let videoProfileInfo of videoProfiles) {
            videoFormats.push(videoProfileInfo.format)
          }
          supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, camera.SceneMode.NORMAL_PHOTO)
          let photoProfiles = supportedOutputCapability.photoProfiles
          for (let photoProfileInfo of photoProfiles) {
            photoFormats.push(photoProfileInfo.format)
          }
        }
        expect(previewFormats).assertContain(camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP)
        expect(videoFormats).assertContain(camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP)
        expect(photoFormats).assertContain(camera.CameraFormat.CAMERA_FORMAT_JPEG)
      }
      done()
    })

    /*
     * @tc.number:C-ALL-HARDWARE-0801
     * @tc.name: testAudioSupportCapturer0100
     * @tc.desc: 【C-ALL-HARDWARE-0801】必须支持单或双 MIC 输入或 Line-In 输入的一种或多种方式
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioSupportCapturer0100', 0, async (done: Function) => {
      if (isMicrophoneSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioCapturerInfo: audio.AudioCapturerInfo = {
          source: audio.SourceType.SOURCE_TYPE_MIC,
          capturerFlags: 0
        }
        let audioCapturerOptions: audio.AudioCapturerOptions = {
          streamInfo: audioStreamInfo,
          capturerInfo: audioCapturerInfo
        }
        let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions)
        expect(audioCapturer != undefined).assertTrue()
        let currentInputDevices = audioCapturer.getCurrentInputDevices()
        expect(currentInputDevices.length).assertLarger(0)
        let supportedDeviceList = new List<audio.DeviceType>()
        supportedDeviceList.add(audio.DeviceType.WIRED_HEADSET)
        supportedDeviceList.add(audio.DeviceType.MIC)
        supportedDeviceList.add(audio.DeviceType.USB_HEADSET)
        let hasMicDevice = false
        for (let currentInputDevice of currentInputDevices) {
          if (supportedDeviceList.has(currentInputDevice.deviceType)) {
            hasMicDevice = true
          }
        }
        expect(hasMicDevice).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: C-ALL-HARDWARE-0802
     * @tc.name: testAudioCapturerSupport16bit0100
     * @tc.desc: 【C-ALL-HARDWARE-0802】必须支持 16bit 音频输入
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioCapturerSupport16bit0100', 0, async (done: Function) => {
      if (isMicrophoneSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioCapturerInfo: audio.AudioCapturerInfo = {
          source: audio.SourceType.SOURCE_TYPE_MIC,
          capturerFlags: 0
        }
        let audioCapturerOptions: audio.AudioCapturerOptions = {
          streamInfo: audioStreamInfo,
          capturerInfo: audioCapturerInfo
        }
        let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions)
        expect(audioCapturer != undefined).assertTrue()
        expect(audioCapturer != null).assertTrue()
        try {
          await audioCapturer.start()
          expect(audioCapturer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioCapturer.stop()
          await audioCapturer.release()
          console.info('Capturer run Success.')
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Capturer run Fail, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0800
     * @tc.name: testAudioRendererSupportSamplingRates0100
     * @tc.desc: 【C-S|STD-SOFTWARE-0800】音频播放必须支持 16K，44.1K，48K 采样率音频
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioRendererSupportSamplingRates0100', 0, async (done: Function) => {
      if (isAoutSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: audioStreamInfo,
          rendererInfo: audioRendererInfo
        }
        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions)

        expect(audioRenderer != undefined).assertTrue()
        expect(audioRenderer != null).assertTrue()
        try {
          await audioRenderer.start()
          expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioRenderer.stop()
          await audioRenderer.release()
          console.info('Renderer run Success.')
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Renderer run Fail, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0800
     * @tc.name: testAudioRendererSupportSamplingRates0200
     * @tc.desc: 【C-S|STD-SOFTWARE-0800】音频播放必须支持 16K，44.1K，48K 采样率音频
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioRendererSupportSamplingRates0200', 0, async (done: Function) => {
      if (isAoutSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: audioStreamInfo,
          rendererInfo: audioRendererInfo
        }
        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions)

        expect(audioRenderer != undefined).assertTrue()
        expect(audioRenderer != null).assertTrue()
        try {
          await audioRenderer.start()
          expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioRenderer.stop()
          await audioRenderer.release()
          console.info('Renderer run Success.')
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Renderer run Fail, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0800
     * @tc.name: testAudioRendererSupportSamplingRates0300
     * @tc.desc: 【C-S|STD-SOFTWARE-0800】音频播放必须支持 16K，44.1K，48K 采样率音频
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioRendererSupportSamplingRates0300', 0, async (done: Function) => {
      if (isAoutSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: audioStreamInfo,
          rendererInfo: audioRendererInfo
        }
        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions)

        expect(audioRenderer != undefined).assertTrue()
        expect(audioRenderer != null).assertTrue()
        try {
          await audioRenderer.start()
          expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioRenderer.stop()
          await audioRenderer.release()
          console.info('Renderer run Success.')
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Renderer run Fail, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0801
     * @tc.name: testAudioRendererSupportChannels0100
     * @tc.desc: 【C-S|STD-SOFTWARE-0801】音频播放必须支持单声道和双声道音频
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioRendererSupportChannels0100', 0, async (done: Function) => {
      if (isAoutSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: audioStreamInfo,
          rendererInfo: audioRendererInfo
        }
        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions)

        expect(audioRenderer != undefined).assertTrue()
        expect(audioRenderer != null).assertTrue()
        try {
          await audioRenderer.start()
          expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioRenderer.stop()
          await audioRenderer.release()
          console.info('Renderer run Success.');
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Renderer run Fail, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
 * @tc.number: C-S|STD-SOFTWARE-0801
 * @tc.name: testAudioRendererSupportChannels0200
 * @tc.desc: 【C-S|STD-SOFTWARE-0801】音频播放必须支持单声道和双声道音频
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
    it('testAudioRendererSupportChannels0200', 0, async (done: Function) => {
      if (isAoutSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: audioStreamInfo,
          rendererInfo: audioRendererInfo
        }
        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions)

        expect(audioRenderer != undefined).assertTrue()
        expect(audioRenderer != null).assertTrue()
        try {
          await audioRenderer.start()
          expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioRenderer.stop()
          await audioRenderer.release()
          console.info('Renderer run Success.');
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Renderer run Fail, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0802
     * @tc.name: testAudioRendererSupportEncodings0100
     * @tc.desc: 【C-S|STD-SOFTWARE-0802】音频播放必须支持 16 位 PCM 编码格式音频
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioRendererSupportEncodings0100', 0, async (done: Function) => {
      if (isAoutSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: audioStreamInfo,
          rendererInfo: audioRendererInfo
        }
        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions)
        expect(audioRenderer != undefined).assertTrue()
        expect(audioRenderer != null).assertTrue()
        try {
          await audioRenderer.start()
          expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioRenderer.stop()
          await audioRenderer.release()
          console.info('Renderer run Success.');
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Renderer Release Fail, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0803
     * @tc.name: testAudioCapturerSupportRule0100
     * @tc.desc: 【C-S|STD-SOFTWARE-0803】音频采集必须支持单声道、编码格式为 16 位 PCM、采样率为 16K，48K 的音频
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioCapturerSupportRule0100', 0, async (done: Function) => {
      if (isMicrophoneSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioCapturerInfo: audio.AudioCapturerInfo = {
          source: audio.SourceType.SOURCE_TYPE_MIC,
          capturerFlags: 0
        }
        let audioCapturerOptions: audio.AudioCapturerOptions = {
          streamInfo: audioStreamInfo,
          capturerInfo: audioCapturerInfo
        }
        let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions)
        expect(audioCapturer != undefined).assertTrue()
        try {
          await audioCapturer.start()
          expect(audioCapturer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioCapturer.stop()
          await audioCapturer.release()
          console.info('Capturer run Success.')
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Capturer run Fail, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SOFTWARE-0803
     * @tc.name: testAudioCapturerSupportRule0200
     * @tc.desc: 【C-S|STD-SOFTWARE-0803】音频采集必须支持单声道、编码格式为 16 位 PCM、采样率为 16K，48K 的音频
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAudioCapturerSupportRule0200', 0, async (done: Function) => {
      if (isMicrophoneSupported) {
        let audioStreamInfo: audio.AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_1,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioCapturerInfo: audio.AudioCapturerInfo = {
          source: audio.SourceType.SOURCE_TYPE_MIC,
          capturerFlags: 0
        }
        let audioCapturerOptions: audio.AudioCapturerOptions = {
          streamInfo: audioStreamInfo,
          capturerInfo: audioCapturerInfo
        }
        let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions)
        expect(audioCapturer != undefined).assertTrue()
        try {
          await audioCapturer.start()
          expect(audioCapturer.state).assertEqual(audio.AudioState.STATE_RUNNING)
          await audioCapturer.stop()
          await audioCapturer.release()
          console.info('Capturer run Success.')
        } catch (error) {
          let err: BusinessError = error as BusinessError
          console.error(`Capturer run Fail, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
        }
      }
      done()
    })

    /*
     * @tc.number: C-ALL-HARDWARE-0500
     * @tc.name: testUsbSupportConnect0100
     * @tc.desc: 【C-ALL-HARDWARE-0500】端口必须可连接到具有标准 A 型或 C 型的主机模式的USB 端口
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testUsbSupportConnect0100', 0, async (done: Function) => {
      if (isUsbSupported) {
        let usbDevices = usbManager.getDevices()
        console.log(`devicesList = ${usbDevices}`)
        expect(usbDevices.length).assertLargerOrEqual(0)
      }
      done()
    })

    /*
     * @tc.number: C-ALL-HARDWARE-0502
     * @tc.name: testUsbSupportHost0100
     * @tc.desc: 【C-ALL-HARDWARE-0502】必须支持连接标准 USB 外围设备
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testUsbSupportHost0100', 0, async (done: Function) => {
      if (isUsbSupported) {
        let usbDevices = usbManager.getDevices()
        console.log(`devicesList = ${usbDevices}`)
        expect(usbDevices.length).assertLargerOrEqual(0)
      }
      done()
    })

  })
}

async function getPhotoSession(abilityContext: common.UIAbilityContext, applicationContext: common.ApplicationContext) {
  expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'EntryAbility', abilityContext)).assertTrue()
  if(camera.getCameraManager(applicationContext).getSupportedCameras().length == 0) {
    console.log(`No Supported usb camera`)
    return [false, camera.getCameraManager(applicationContext).createSession(camera.SceneMode.NORMAL_PHOTO)] as [boolean, camera.PhotoSession]
  }
  let driver = Driver.create()
  await driver.delayMs(1000)
  let component = await driver.findComponent(ON.id('surfaceId').inWindow('com.acts.pcs.arktstest'))
  let surfaceId: string = await component.getText()
  let cameraManager = camera.getCameraManager(applicationContext)
  let supportedCameras = cameraManager.getSupportedCameras()
  expect(supportedCameras.length).assertLarger(0)
  let cameraDevice = supportedCameras[0]
  let outputCapability: camera.CameraOutputCapability
  let cameraInput: camera.CameraInput | undefined = undefined
  let photoOutput: camera.PhotoOutput | undefined = undefined
  let previewOutput: camera.PreviewOutput | undefined = undefined
  try {
    cameraInput = cameraManager.createCameraInput(cameraDevice)
    expect(cameraInput != undefined).assertTrue()
    await cameraInput.open()
    outputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, camera.SceneMode.NORMAL_PHOTO)
    expect(outputCapability != undefined).assertTrue()
    previewOutput = cameraManager.createPreviewOutput(outputCapability.previewProfiles[0], surfaceId)
    expect(previewOutput != undefined).assertTrue()
    photoOutput = cameraManager.createPhotoOutput(outputCapability.photoProfiles[0])
    expect(photoOutput != undefined).assertTrue()
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to create input and output. error: ${JSON.stringify(err)}`)
    expect(false).assertTrue()
  }

  let photoSession: camera.PhotoSession
  photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
  expect(photoSession != undefined).assertTrue()
  try {
    photoSession.beginConfig();
    photoSession.addInput(cameraInput);
    photoSession.addOutput(previewOutput);
    photoSession.addOutput(photoOutput);
    await photoSession.commitConfig()
    await photoSession.start();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to create and start photo session. error: ${JSON.stringify(err)}`);
    expect(false).assertTrue()
  }
  return [true, photoSession] as [boolean, camera.PhotoSession]
}

async function stopPhotoSession(photoSession: camera.PhotoSession) {
  try {
    await photoSession.stop()
    await photoSession.release()
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to stop photo session. error: ${JSON.stringify(err)}`);
    expect(false).assertTrue()
  }
}