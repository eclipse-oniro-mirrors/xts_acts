import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import common from '@ohos.app.ability.common';

export default function audioManagerOnInterrupt() {

  describe('audioManagerOnInterrupt', () => {
    const Tag: string = 'AudioManagerOnInterrupt';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ON_INTERRUPT_EVENTTYPE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ON_INTERRUPT_EVENTTYPE_001
     * @tc.desc   AudioManager on interrupt eventType property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ON_INTERRUPT_EVENTTYPE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let interruptReceived: boolean = false;
      let interAudioInterrupt: audio.AudioInterrupt = {
        streamUsage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        contentType: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        pauseWhenDucked: true
      };
      try {
        audioManager.on('interrupt', interAudioInterrupt, (interruptAction: audio.InterruptAction) => {
          console.info(`${Tag} interrupt event received: ${JSON.stringify(interruptAction)}`);
          expect(interruptAction.actionType).assertLargerOrEqual(0);
          expect(interruptAction.type).assertLargerOrEqual(0);
          expect(interruptAction.hint).assertLargerOrEqual(0);
          expect(interruptAction.activated).assertLargerOrEqual(0);
          interruptReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on interrupt err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioRoutingManagerOnDeviceChange', () => {
    const Tag: string = 'AudioRoutingManagerOnDeviceChange';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICE_CHANGE_TYPE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICE_CHANGE_TYPE_001
     * @tc.desc   AudioRoutingManager on deviceChange type property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICE_CHANGE_TYPE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioRoutingManager = audioManager.getRoutingManager();
      let deviceChangeReceived: boolean = false;

      try {
        audioRoutingManager.on('deviceChange', audio.DeviceFlag.ALL_DEVICES_FLAG, (deviceChangeAction) => {
          console.info(`${Tag} deviceChange event received: ${JSON.stringify(deviceChangeAction)}`);
          expect(deviceChangeAction.type).assertLargerOrEqual(audio.DeviceChangeType.CONNECT);
          expect(deviceChangeAction.type).assertLessOrEqual(audio.DeviceChangeType.DISCONNECT);
          deviceChangeReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on deviceChange err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioRoutingManagerOnAvailableDeviceChange', () => {
    const Tag: string = 'AudioRoutingManagerOnAvailableDeviceChange';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_TYPE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_TYPE_001
     * @tc.desc   AudioRoutingManager on availableDeviceChange type property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_TYPE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioRoutingManager = audioManager.getRoutingManager();
      let availableDeviceChangeReceived: boolean = false;

      try {
        audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.ALL_MEDIA_DEVICES, (deviceChangeAction) => {
          console.info(`${Tag} availableDeviceChange event received: ${JSON.stringify(deviceChangeAction)}`);
          expect(deviceChangeAction.type).assertLargerOrEqual(audio.DeviceChangeType.CONNECT);
          expect(deviceChangeAction.type).assertLessOrEqual(audio.DeviceChangeType.DISCONNECT);
          availableDeviceChangeReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on availableDeviceChange err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioRoutingManagerOnMicBlockStatusChanged', () => {
    const Tag: string = 'AudioRoutingManagerOnMicBlockStatusChanged';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_MIC_BLOCK_STATUS_CHANGED_BLOCKSTATUS_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_MIC_BLOCK_STATUS_CHANGED_BLOCKSTATUS_001
     * @tc.desc   AudioRoutingManager on micBlockStatusChanged blockStatus property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_MIC_BLOCK_STATUS_CHANGED_BLOCKSTATUS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioRoutingManager = audioManager.getRoutingManager();
      let micBlockStatusChangedReceived: boolean = false;

      try {
        audioRoutingManager.on('micBlockStatusChanged', (deviceBlockStatusInfo) => {
          console.info(`${Tag} micBlockStatusChanged event received: ${JSON.stringify(deviceBlockStatusInfo)}`);
          expect(deviceBlockStatusInfo.blockStatus).assertLargerOrEqual(audio.DeviceBlockStatus.UNBLOCKED);
          expect(deviceBlockStatusInfo.blockStatus).assertLessOrEqual(audio.DeviceBlockStatus.BLOCKED);
          micBlockStatusChangedReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on micBlockStatusChanged err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioSessionManagerOnAudioSessionDeactivated', () => {
    const Tag: string = 'AudioSessionManagerOnAudioSessionDeactivated';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AUDIO_SESSION_DEACTIVATED_PID_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AUDIO_SESSION_DEACTIVATED_PID_001
     * @tc.desc   AudioSessionManager on audioSessionDeactivated pid property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AUDIO_SESSION_DEACTIVATED_PID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager = audioManager.getSessionManager();
      let audioSessionDeactivatedReceived: boolean = false;

      try {
        audioSessionManager.on('audioSessionDeactivated', (audioSessionDeactivatedEvent) => {
          console.info(`${Tag} audioSessionDeactivated event received: ${JSON.stringify(audioSessionDeactivatedEvent)}`);
          expect(audioSessionDeactivatedEvent.reason).assertLargerOrEqual(0);
          audioSessionDeactivatedReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on audioSessionDeactivated err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioSessionManagerOnAudioSessionStateChanged', () => {
    const Tag: string = 'AudioSessionManagerOnAudioSessionStateChanged';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AUDIO_SESSION_STATE_CHANGED_STATE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AUDIO_SESSION_STATE_CHANGED_STATE_001
     * @tc.desc   AudioSessionManager on audioSessionStateChanged state property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AUDIO_SESSION_STATE_CHANGED_STATE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager = audioManager.getSessionManager();
      let audioSessionStateChangedReceived: boolean = false;

      try {
        audioSessionManager.on('audioSessionStateChanged', (audioSessionStateChangedEvent) => {
          console.info(`${Tag} audioSessionStateChanged event received: ${JSON.stringify(audioSessionStateChangedEvent)}`);
          expect(audioSessionStateChangedEvent.stateChangeHint).assertLargerOrEqual(0);
          audioSessionStateChangedReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on audioSessionStateChanged err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioSessionManagerOnCurrentOutputDeviceChanged', () => {
    const Tag: string = 'AudioSessionManagerOnCurrentOutputDeviceChanged';


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_CURRENT_OUTPUT_DEVICE_CHANGED_DEVICETYPE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_CURRENT_OUTPUT_DEVICE_CHANGED_DEVICETYPE_001
     * @tc.desc   AudioSessionManager on currentOutputDeviceChanged deviceType property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_CURRENT_OUTPUT_DEVICE_CHANGED_DEVICETYPE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager = audioManager.getSessionManager();
      let currentOutputDeviceChangedReceived: boolean = false;

      try {
        audioSessionManager.on('currentOutputDeviceChanged', (currentOutputDeviceChangedEvent) => {
          console.info(`${Tag} currentOutputDeviceChanged event received: ${JSON.stringify(currentOutputDeviceChangedEvent)}`);
          expect(currentOutputDeviceChangedEvent.devices).assertLargerOrEqual(0);
          expect(currentOutputDeviceChangedEvent.changeReason).assertLessOrEqual(0);
          expect(currentOutputDeviceChangedEvent.recommendedAction).assertLessOrEqual(0);
          currentOutputDeviceChangedReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on currentOutputDeviceChanged err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioSessionManagerOnAvailableDeviceChange', () => {
    const Tag: string = 'AudioSessionManagerOnAvailableDeviceChange';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_TYPE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_TYPE_001
     * @tc.desc   AudioSessionManager on availableDeviceChange type property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_TYPE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager = audioManager.getSessionManager();
      let availableDeviceChangeReceived: boolean = false;

      try {
        audioSessionManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_INPUT_DEVICES, (deviceChanged: audio.DeviceChangeAction) => {
          console.info(`${Tag} availableDeviceChange event received: ${JSON.stringify(deviceChanged)}`);
          expect(deviceChanged.type).assertLargerOrEqual(0);
          expect(deviceChanged.deviceDescriptors).assertLessOrEqual(0);
          availableDeviceChangeReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on availableDeviceChange err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioSessionManagerOnCurrentInputDeviceChanged', () => {
    const Tag: string = 'AudioSessionManagerOnCurrentInputDeviceChanged';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_CURRENT_INPUT_DEVICE_CHANGED_DEVICETYPE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_CURRENT_INPUT_DEVICE_CHANGED_DEVICETYPE_001
     * @tc.desc   AudioSessionManager on currentInputDeviceChanged deviceType property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_ON_CURRENT_INPUT_DEVICE_CHANGED_DEVICETYPE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager = audioManager.getSessionManager();
      let currentInputDeviceChangedReceived: boolean = false;

      try {
        audioSessionManager.on('currentInputDeviceChanged', (currentInputDeviceChangedEvent) => {
          console.info(`${Tag} currentInputDeviceChanged event received: ${JSON.stringify(currentInputDeviceChangedEvent)}`);
          expect(currentInputDeviceChangedEvent.devices).assertLargerOrEqual(0);
          expect(currentInputDeviceChangedEvent.changeReason).assertLessOrEqual(0);
          currentInputDeviceChangedReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on currentInputDeviceChanged err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });

  describe('audioVolumeManagerOnStreamVolumeChange', () => {
    const Tag: string = 'AudioVolumeManagerOnStreamVolumeChange';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAMUSAGE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAMUSAGE_001
     * @tc.desc   AudioVolumeManager on streamVolumeChange streamUsage property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAMUSAGE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioVolumeManager = audioManager.getVolumeManager();
      let streamVolumeChangeReceived: boolean = false;

      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_MUSIC, (volumeEvent) => {
          console.info(`${Tag} streamVolumeChange event received: ${JSON.stringify(volumeEvent)}`);
          expect(volumeEvent.streamUsage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
          streamVolumeChangeReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on streamVolumeChange err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });
}
