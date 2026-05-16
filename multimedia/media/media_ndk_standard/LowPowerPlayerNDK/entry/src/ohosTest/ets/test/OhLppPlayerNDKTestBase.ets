import player from 'libplayer.so';
import { expect } from '@ohos/hypium'
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import lpPlayer from 'libplayer.so'
import media from '@ohos.multimedia.media'
import resourceManager from '@ohos.resourceManager';

import fs from '@ohos.file.fs';
import File from '@system.file';


const TAG: string = "LppTag"
const SUCC: number = 0;
const FAIL: number = -1;

export interface FdObject {
  fileAsset: File | null;
  fdNumber: number | null;
}
export default class OhLppPlayerNDKTestBase {
  TAG = "[OhLppPlayerNdkTestBase] ";
  INIT_FD_EVENT = 'InitFdNative';
  CREATELPP_SET_EVENT = 'createLppSetNative';
  SYNCAUDIO_EVENT = 'syncAudioNative';
  CREATE_PREPARE_NATIVE_EVENT = 'createPrepareNative';
  VIDEO_CREATE_BYMIME_EVENT = 'VideoSink_CreateByMime';
  VIDEO_CREATE_NULL_EVENT = 'VideoSink_CreateByNULL';
  AUDIO_CREATE_BYMIME_EVENT = 'AudioSink_CreateByMime';
  AUDIO_CREATE_NULL_EVENT = 'AudioSink_CreateByNULL';
  VIDEO_CB_CREATE_CALLBACK_EVENT = 'VideoSinkCallback_Create';
  VIDEO_CB_CREATE_CALLBACK_NULL_EVENT = 'VideoSinkCallback_Create_Null';
  VIDEO_CB_SET_DATA_LISTENER_EVENT = 'Video_OnDataNeeded';
  VIDEO_CB_SET_ERROR_LISTENER_EVENT = 'Video_OnError';
  VIDEO_CB_SET_RENDERSTART_LISTENER_EVENT = 'Video_OnRenderStart';
  VIDEO_CB_SET_STREAMCHANGE_LISTENER_EVENT = 'Video_OnStreamChanged';
  VIDEO_CB_SET_FIRSTFRAME_LISTENER_EVENT = 'Video_OnFirstFrameDecoded';
  VIDEO_CB_RETURN_FRAMES_EVENT = 'Video_returnFrames';
  VIDEO_CB_SET_TARGET_STARTFRAME_EVENT = 'Video_SetTargetStartFrame';
  VIDEO_CB_SET_EOS_LISTENER_EVENT = 'Video_OnEos';
  AUDIO_CB_SET_CALLBACK_EVENT = 'AudioSink_SetCallback';
  AUDIO_CB_CREATE_CALLBACK_EVENT = 'AudioSinkCallback_Create';
  AUDIO_CB_CREATE_CALLBACK_NULL_EVENT = 'AudioSinkCallback_Create_Null';
  AUDIO_CB_SET_POSITION_UPDATE_LISTENER_EVENT = 'Audio_OnPositionUpdate';
  AUDIO_CB_SET_DATA_LISTENER_EVENT = 'Audio_OnAudioDataNeeded';
  AUDIO_CB_SET_ERROR_LISTENER_EVENT = 'Audio_OnAudioError';
  AUDIO_CB_SET_INTERRUPT_LISTENER_EVENT = 'Audio_OnInterrupt';
  AUDIO_CB_SET_DEVICE_CHANGE_LISTENER_EVENT = 'Audio_OnDeviceChange';
  AUDIO_CB_SET_RETURN_FRAMES_EVENT = 'Audio_returnFrames';
  AUDIO_CB_SET_EOS_LISTENER_EVENT = 'Audio_OnAudioEos';
  VIDEO_CONFIGURE_EVENT = 'Video_Configure';
  VIDEO_REGISTER_CALLBACK_EVENT = 'Video_Register';
  VIDEO_REGISTER_CALLBACK_ERROR_EVENT = 'Video_Register_Error';
  VIDEO_SET_PARAMETER_EVENT = 'Video_SetParameter';
  VIDEO_SET_PARAMETER_ERROR_EVENT = 'Video_SetParameter_Error';
  VIDEO_GET_PARAMETER_EVENT = 'Video_GetParameter';
  VIDEO_GET_PARAMETER_ERROR_EVENT = 'Video_GetParameter_Error';
  VIDEO_SURFACE_EVENT = 'Video_Surface';
  VIDEO_SURFACE_ERROR_EVENT = 'Video_Surface_Error';
  VIDEO_PREPARE_EVENT = 'Video_Prepare';
  VIDEO_PREPARE_ERROR_EVENT = 'Video_Prepare_Error';
  VIDEO_SET_SYNC_AUDIO_EVENT = 'Video_SetSync_Audio';
  VIDEO_SET_SYNC_AUDIO_ERROR_EVENT = 'Video_SetSync_Audio_Error';
  VIDEO_START_DECODER_EVENT = 'Video_Start_Decoder_Audio';
  VIDEO_START_DECODER_ERROR_EVENT = 'Video_Start_Decoder_Error';
  VIDEO_RENDER_FIRSTFRAME_EVENT = 'Video_RenderFirstFrame';
  VIDEO_RENDER_FIRSTFRAME_ERROR_EVENT = 'Video_RenderFirstFrame_Error';
  VIDEO_AUDIO_START_RENDER_EVENT = 'Video_audio_StartRenderer';
  VIDEO_START_RENDER_EVENT = 'Video_StartRenderer';
  VIDEO_START_RENDER_ERROR_EVENT = 'Video_StartRenderer_Error';
  SET_SPEED_EVENT = 'SetSpeed';
  SET_SPEED_ERROR_EVENT = 'SetSpeed_Error';
  VIDEO_SET_SPEED_EVENT = 'Video_SetSpeed';
  VIDEO_SET_SPEED_ERROR_EVENT = 'Video_SetSpeed_Error';
  PAUSE_EVENT = 'Pause';
  VIDEO_PAUSE_EVENT = 'Video_Pause';
  VIDEO_PAUSE_ERROR_EVENT = 'Video_Pause_Error';
  RESUME_EVENT = 'Resume';
  RESUME_ERROR_EVENT = 'Resume_Error';
  VIDEO_RESUME_EVENT = 'Video_Resume';
  VIDEO_RESUME_ERROR_EVENT = 'Video_Resume_Error';
  STOP_EVENT = 'Stop';
  VIDEO_STOP_EVENT = 'Video_Stop';
  VIDEO_STOP_ERROR_EVENT = 'Video_Stop_Error';
  FLUSH_EVENT = 'Flush';
  VIDEO_FLUSH_EVENT = 'Video_Flush';
  VIDEO_FLUSH_ERROR_EVENT = 'Video_Flush_Error';
  RESET_EVENT = 'Reset';
  VIDEO_RESET_EVENT = 'Video_Reset';
  VIDEO_RESET_ERROR_EVENT = 'Video_Reset_Error';
  DESTROY_EVENT = 'Destroy';
  VIDEO_CALLBACKDESTROY_EVENT = 'Video_CallbackDestroy';
  VIDEO_DESTROY_EVENT = 'Video_Destroy';
  AUDIO_CONFIGURE_EVENT = 'Audio_Configure';
  AUDIO_REGISTER_CALLBACK_EVENT = 'Audio_Register';
  AUDIO_REGISTER_CALLBACK_ERROR_EVENT = 'Audio_Register_Error';
  AUDIO_SET_PARAMETER_EVENT = 'Audio_SetParameter';
  AUDIO_SET_PARAMETER_ERROR_EVENT = 'Audio_SetParameter_Error';
  AUDIO_GET_PARAMETER_EVENT = 'Audio_GetParameter';
  AUDIO_GET_PARAMETER_ERROR_EVENT = 'Audio_GetParameter_Error';
  AUDIO_SET_VOLUME_UP_EVENT = 'Audio_SetVolume_up';
  AUDIO_SET_VOLUME_DOWN_EVENT = 'Audio_SetVolume_down';
  AUDIO_SET_VOLUME_DOWN_ERROR_EVENT = 'Audio_SetVolume_down_Error';
  AUDIO_PREPARE_EVENT = 'Audio_Prepare';
  AUDIO_PREPARE_ERROR_EVENT = 'Audio_Prepare_Error';
  AUDIO_START_EVENT = 'Audio_Start';
  AUDIO_START_ERROR_EVENT = 'Audio_Start_Error';
  AUDIO_SET_SPEED_EVENT = 'Audio_SetSpeed';
  AUDIO_SET_SPEED_ERROR_EVENT = 'Audio_SetSpeed_Error';
  AUDIO_PAUSE_EVENT = 'Audio_Pause';
  AUDIO_PAUSE_ERROR_EVENT = 'Audio_Pause_Error';
  AUDIO_RESUME_EVENT = 'Audio_Resume';
  AUDIO_RESUME_ERROR_EVENT = 'Audio_Resume_Error';
  AUDIO_STOP_EVENT = 'Audio_Stop';
  AUDIO_STOP_ERROR_EVENT = 'Audio_Stop_Error';
  AUDIO_FLUSH_EVENT = 'Audio_Flush';
  AUDIO_FLUSH_ERROR_EVENT = 'Audio_Flush_Error';
  AUDIO_RESET_EVENT = 'Audio_Reset';
  AUDIO_RESET_ERROR_EVENT = 'Audio_Reset_Error';
  AUDIO_CALLBACKDESTROY_EVENT = 'Audio_CallbackDestroy';
  AUDIO_DESTROY_EVENT = 'Audio_Destroy';
  WAIT_LPP_PLAYER_EVENT = 'wait_time';
  END_EVENT = 'end';
  result: number = 0;
  volume: number = 100;
  fileDescriptor: resourceManager.RawFileDescriptor | undefined = undefined;
  outputFdObject: media.AVFileDescriptor = {
    fd: -1
  };
  private avPlayer: media.AVPlayer | null = null;

  async toNextStep(config: ESObject, fdPath: string,
    steps: Array<string>, errorCode: number, done: Function) {
    try {
      if (steps[0] == this.END_EVENT) {
        this.closeFd(this.outputFdObject.fd)
        console.info('case done() success!!');
        done();
      }
      let currentSteps = steps[0]
      console.info('case into currentSteps Event:!!' + currentSteps);
      steps.shift();
      await this.msleepAsync(1000)
      switch (currentSteps) {

        case this.INIT_FD_EVENT:
          this.fileDescriptor = await globalThis.abilityContext.resourceManager.getRawFd(config["fdPath"]);
          console.info(TAG, 'player fileDescriptor fd://' + this.fileDescriptor?.fd);
          player.InitFdNative(this.fileDescriptor?.fd, this.fileDescriptor?.offset, this.fileDescriptor?.length, () => {
            console.info(TAG, 'player JSCallback');
          })
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.CREATELPP_SET_EVENT:
          this.result = lpPlayer.createLppSetNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.SYNCAUDIO_EVENT:
          this.result = lpPlayer.syncAudioNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CREATE_BYMIME_EVENT:
          this.result = lpPlayer.createLppVideoNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CREATE_NULL_EVENT:
          this.result = lpPlayer.createLppVideoNativeNull();
          expect(this.result).assertEqual(-1);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CREATE_BYMIME_EVENT:
          this.result = lpPlayer.createLppAudioNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CREATE_NULL_EVENT:
          this.result = lpPlayer.createLppAudioNativeNull();
          expect(this.result).assertEqual(-1);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CB_CREATE_CALLBACK_EVENT:
          this.result = lpPlayer.VideoStreamerSetCallback();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_CB_CREATE_CALLBACK_NULL_EVENT:
          this.result = lpPlayer.VideoStreamerSetCallbackCreateNull();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CB_SET_TARGET_STARTFRAME_EVENT:
          this.result = lpPlayer.VideoStreamerSetTargetStartFrame();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CB_SET_ERROR_LISTENER_EVENT:
          this.result = lpPlayer.VideoStreamerSetErrorCallback();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CB_SET_DATA_LISTENER_EVENT:
          this.result = lpPlayer.VideoStreamerSetDataNeededListener();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_CB_SET_STREAMCHANGE_LISTENER_EVENT:
          this.result = lpPlayer.VideoStreamerSetStreamChangedListener();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_CB_SET_RENDERSTART_LISTENER_EVENT:
          this.result = lpPlayer.VideoStreamerSetRenderStartCallback();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CB_RETURN_FRAMES_EVENT:
          this.result = lpPlayer.VideoStreamerreturnFrames();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CB_SET_FIRSTFRAME_LISTENER_EVENT:
          this.result = lpPlayer.VideoStreamerSetFirstFrameDecodedCallback();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CB_SET_EOS_LISTENER_EVENT:
          this.result = lpPlayer.VideoStreamerSetEosCallback();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CB_SET_CALLBACK_EVENT:
          this.result = lpPlayer.AudioStreamerSetCallback();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.AUDIO_CB_CREATE_CALLBACK_EVENT:
          this.result = lpPlayer.AudioStreamerSetCallbackCreate();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.AUDIO_CB_CREATE_CALLBACK_NULL_EVENT:
          this.result = lpPlayer.AudioStreamerSetCallbackCreateNull();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CB_SET_POSITION_UPDATE_LISTENER_EVENT:
          this.result = lpPlayer.AudioStreamerSetPositionUpdateListener();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CB_SET_DATA_LISTENER_EVENT:
          this.result = lpPlayer.AudioStreamerSetDataNeededListener();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CB_SET_ERROR_LISTENER_EVENT:
          this.result = lpPlayer.AudioSetErrorCallback();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CB_SET_INTERRUPT_LISTENER_EVENT:
          this.result = lpPlayer.AudioSetInterruptListener();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CB_SET_DEVICE_CHANGE_LISTENER_EVENT:
          this.result = lpPlayer.AudioSetOnDeviceChanged();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.AUDIO_CB_SET_RETURN_FRAMES_EVENT:
          this.result = lpPlayer.AudioreturnFrames();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CB_SET_EOS_LISTENER_EVENT:
          this.result = lpPlayer.AudioSetEosCallback();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CONFIGURE_EVENT:
          this.result = lpPlayer.videoConfigureNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_SURFACE_EVENT:
          this.result = lpPlayer.videoSetSurfaceNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_SURFACE_ERROR_EVENT:
          this.result = lpPlayer.videoSetSurfaceNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CONFIGURE_EVENT:
          this.result = lpPlayer.audioStreamerConfigure();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_REGISTER_CALLBACK_EVENT:
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_REGISTER_CALLBACK_EVENT:
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_SET_PARAMETER_EVENT:
          this.result = lpPlayer.videoStreamerSetParameter();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_SET_PARAMETER_ERROR_EVENT:
          this.result = lpPlayer.videoStreamerSetParameter();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_GET_PARAMETER_EVENT:
          this.result = lpPlayer.videoStreamerGetParameter();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_GET_PARAMETER_ERROR_EVENT:
          this.result = lpPlayer.videoStreamerGetParameter();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_SET_PARAMETER_EVENT:
          this.result = lpPlayer.audioSetParameterNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.AUDIO_SET_PARAMETER_ERROR_EVENT:
          this.result = lpPlayer.audioSetParameterNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_GET_PARAMETER_EVENT:
          this.result = lpPlayer.audioGetParameterNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.AUDIO_GET_PARAMETER_ERROR_EVENT:
          this.result = lpPlayer.audioGetParameterNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.CREATE_PREPARE_NATIVE_EVENT:
          this.result = lpPlayer.createPrepareNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_PREPARE_EVENT:
          this.result = lpPlayer.videoPrepareNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_PREPARE_ERROR_EVENT:
          this.result = lpPlayer.videoPrepareNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_PREPARE_EVENT:
          this.result = lpPlayer.audioPrepareNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_PREPARE_ERROR_EVENT:
          this.result = lpPlayer.audioPrepareNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_SET_VOLUME_UP_EVENT:
          this.volume = this.volume + 10;
          if (this.volume <= 0) {
            this.volume = 0;
          }
          this.result = lpPlayer.setVolumeNative(this.volume / 100);
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_SET_VOLUME_DOWN_EVENT:
          this.volume = this.volume - 10;
          if (this.volume <= 0) {
            this.volume = 0;
          }
          this.result = lpPlayer.setVolumeNative(this.volume / 100);
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_SET_SYNC_AUDIO_EVENT:
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_SET_SYNC_AUDIO_ERROR_EVENT:
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_START_DECODER_EVENT:
          this.result = lpPlayer.startDecoderNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_START_DECODER_ERROR_EVENT:
          this.result = lpPlayer.startDecoderNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_RENDER_FIRSTFRAME_EVENT:
          this.result = lpPlayer.renderFirstFrameNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_RENDER_FIRSTFRAME_ERROR_EVENT:
          this.result = lpPlayer.renderFirstFrameNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_AUDIO_START_RENDER_EVENT:
          this.result = lpPlayer.startRenderNative();
          expect(this.result).assertEqual(SUCC);
          this.result = lpPlayer.startAudioNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_START_RENDER_EVENT:
          this.result = lpPlayer.startRenderNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_START_RENDER_ERROR_EVENT:
          this.result = lpPlayer.startRenderNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_START_EVENT:
          this.result = lpPlayer.startAudioNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_START_ERROR_EVENT:
          this.result = lpPlayer.startAudioNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.SET_SPEED_EVENT:
          this.result = lpPlayer.speedNative(config["speed"]);
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.SET_SPEED_ERROR_EVENT:
          this.result = lpPlayer.speedNative(config["speed"]);
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_SET_SPEED_EVENT:
          this.result = lpPlayer.setVideoSpeedNative(config["speed"]);
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_SET_SPEED_ERROR_EVENT:
          this.result = lpPlayer.setVideoSpeedNative(config["speed"]);
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_SET_SPEED_ERROR_EVENT:
          this.result = lpPlayer.setAudioSpeedNative(config["speed"]);
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_SET_SPEED_EVENT:
          this.result = lpPlayer.setAudioSpeedNative(config["speed"]);
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_PAUSE_EVENT:
          this.result = lpPlayer.videoPauseNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_PAUSE_ERROR_EVENT:
          this.result = lpPlayer.videoPauseNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_PAUSE_EVENT:
          this.result = lpPlayer.audioPauseNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_PAUSE_ERROR_EVENT:
          this.result = lpPlayer.audioPauseNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.PAUSE_EVENT:
          this.result = lpPlayer.pauseNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.RESUME_EVENT:
          this.result = lpPlayer.resumeNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.RESUME_ERROR_EVENT:
          this.result = lpPlayer.resumeNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_RESUME_EVENT:
          this.result = lpPlayer.videoResumeNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_RESUME_ERROR_EVENT:
          this.result = lpPlayer.videoResumeNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_RESUME_EVENT:
          this.result = lpPlayer.audioResumeNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_RESUME_ERROR_EVENT:
          this.result = lpPlayer.audioResumeNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.FLUSH_EVENT:
          this.result = lpPlayer.flushNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_FLUSH_EVENT:
          this.result = lpPlayer.videoFlushNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_FLUSH_ERROR_EVENT:
          this.result = lpPlayer.videoFlushNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_FLUSH_EVENT:
          this.result = lpPlayer.audioFlushNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.AUDIO_FLUSH_ERROR_EVENT:
          this.result = lpPlayer.audioFlushNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.STOP_EVENT:
          this.result = lpPlayer.stopNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_STOP_EVENT:
          this.result = lpPlayer.videoStopNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_STOP_ERROR_EVENT:
          this.result = lpPlayer.videoStopNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_STOP_EVENT:
          this.result = lpPlayer.audioStopNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_STOP_ERROR_EVENT:
          this.result = lpPlayer.audioStopNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.RESET_EVENT:
          this.result = lpPlayer.resetNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_RESET_EVENT:
          this.result = lpPlayer.videoResetNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_RESET_ERROR_EVENT:
          this.result = lpPlayer.videoResetNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_RESET_EVENT:
          this.result = lpPlayer.audioResetNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.AUDIO_RESET_ERROR_EVENT:
          this.result = lpPlayer.audioResetNative();
          expect(this.result).assertEqual(config["errorCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.DESTROY_EVENT:
          this.result = lpPlayer.releaseNative();
          expect(this.result).assertEqual(SUCC);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.VIDEO_CALLBACKDESTROY_EVENT:
          this.result = lpPlayer.VideoStreamerCallbackDestroy();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.VIDEO_DESTROY_EVENT:
          this.result = lpPlayer.VideoStreamerDestroy();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.AUDIO_CALLBACKDESTROY_EVENT:
          this.result = lpPlayer.AudioCallbackDestroy();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;
        case this.AUDIO_DESTROY_EVENT:
          this.result = lpPlayer.AudioDestroy();
          expect(this.result).assertEqual(config["sucCode"]);
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        case this.WAIT_LPP_PLAYER_EVENT:
          await this.msleepAsync(2000)
          this.toNextStep(config, fdPath, steps, errorCode, done);
          break;

        default:
          break;
      }
    } catch (error) {
      console.log('toNextStep error', error);
      expect().assertFail();
    }

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

  async getAVFd(outputName: string) {
    outputName = globalThis.abilityContext.filesDir + "/" + outputName;
    console.info("case outputName is" + outputName);
    try {
      let file = fs.openSync(outputName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      if (file) {
        this.outputFdObject = file;
      }
    } catch (err) {
      console.info('case getDSt err: ' + err);
    }
    console.info('case getDSt number is: ' + this.outputFdObject.fd);
    return this.outputFdObject;
  }

  async closeFd(fdNumber: number | null) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }

}