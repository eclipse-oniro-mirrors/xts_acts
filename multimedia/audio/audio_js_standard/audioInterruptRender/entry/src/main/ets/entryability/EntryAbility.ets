import audio from '@ohos.multimedia.audio';
import fileio from '@ohos.fileio';
import { AsyncCallback, BusinessError } from '@kit.BasicServicesKit';
import { common, Want, UIAbility, AbilityConstant } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

let fdRead: number;
let readPath: string;
let fdPath: string;
let filePath: string;
let TAG = 'InterruptHap:';
let TAG1 = 'Fa:SupportFunctionThree:MainAbility:';
let listPush1 = 'Fa_SupportFunctionThree_MainAbility_';
let lifeList = [];

function sleep(ms: number): Promise<AsyncCallback<number>> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

let audioStreamInfo:audio.AudioStreamInfo = {
  samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
  channels: audio.AudioChannel.CHANNEL_2,
  sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
  encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
}

let audioRendererInfo: audio.AudioRendererInfo = {
  content: audio.ContentType.CONTENT_TYPE_RINGTONE,
  usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
  rendererFlags: 0
}

let audioRendererOptions: audio.AudioRendererOptions = {
  streamInfo: audioStreamInfo,
  rendererInfo: audioRendererInfo
}

export default class EntryAbility extends UIAbility {
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

    console.log(TAG1 + '=============================================================================>               onCreate');

    readPath = 'StarWars10s-2C-48000-4SW.wav';
    console.info(TAG + 'case0 context is  ' + this.context);
    filePath = this.context.filesDir + '/' + readPath;
    fdPath = 'fd://';
    console.info('filePath is: ' + filePath)
    await fileio.open(filePath).then((fdNumber) => {
      fdPath = fdPath + '' + fdNumber;
      fdRead = fdNumber;
      console.info(TAG + '[fileIO]case open fd success,fdPath is ' + fdPath);
      console.info(TAG + '[fileIO]case open fd success,fdRead is ' + fdRead);

    }, (err: BusinessError) => {
      console.info(TAG + '[fileIO]case open fd failed');
    }).catch((err: BusinessError) => {
      console.info(TAG + '[fileIO]case catch open fd failed');
    });
    let audioRen: audio.AudioRenderer;
    await audio.createAudioRenderer(audioRendererOptions).then(async (data) => {
      audioRen = data;
      console.info(TAG + 'AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS' + audioRen);
    }).catch((err: BusinessError) => {
      console.info(TAG + 'AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
    });

    console.info(TAG + 'AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen!.state);

    await audioRen!.start().then(async () => {
      console.info(TAG + 'AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
    }).catch((err: BusinessError) => {
      console.info(TAG + 'AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
    });

    console.info(TAG + 'AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen!.state);
    let bufferSize :number;
    await audioRen!.getBufferSize().then(async (data) => {
      console.info(TAG + 'AudioFrameworkRenderLog: getBufferSize :SUCCESS ' + data);
      bufferSize = data;
    }).catch((err: BusinessError) => {
      console.info(TAG + 'AudioFrameworkRenderLog: getBufferSize :ERROR : ' + err.message);
    });

    let ss = fileio.fdopenStreamSync(fdRead, 'r');
    console.info(TAG + 'AudioFrameworkRenderLog:case 2:AudioFrameworkRenderLog: File Path: ' + ss);
    let discardHeader = new ArrayBuffer(44);
    console.info(TAG + 'AudioFrameworkRenderLog:case 2-1:AudioFrameworkRenderLog: File Path: ');
    ss.readSync(discardHeader);
    console.info(TAG + 'AudioFrameworkRenderLog:case 2-2:AudioFrameworkRenderLog: File Path: ');
    let totalSize = fileio.fstatSync(fdRead).size;
    console.info(TAG + 'AudioFrameworkRenderLog:case 3 : AudioFrameworkRenderLog: File totalSize size: ' + totalSize);
    totalSize = totalSize - 44;
    console.info(TAG + 'AudioFrameworkRenderLog: File size : Removing header: ' + totalSize);
    let rlen = 0;
    while (rlen < totalSize / 4) {
      let buf = new ArrayBuffer(bufferSize!);
      rlen += ss.readSync(buf);
      console.info(TAG + 'InterruptHap:BufferAudioFramework: bytes read from file: ' + rlen);
      await audioRen!.write(buf);
    }
    let activated:boolean | undefined = false;
    let interruptHint:number | undefined = 0;
    let audioManager = audio.getAudioManager();
    let interAudioInterrupt: audio.AudioInterrupt = {
      streamUsage: 1,
      contentType: 0,
      pauseWhenDucked: true
    };
    audioManager.on('interrupt', interAudioInterrupt, (interruptAction) => {
      console.info(TAG + 'come in FuZhuHap interrupt');
      if (interruptAction.actionType != undefined && interruptAction.actionType != null) {
        console.info(TAG + 'InterruptHap An event to gain the audio focus ========================= starts.');
        console.info(TAG + `Focus gain event: ${interruptAction} `);
        activated = interruptAction.activated;
        interruptHint = interruptAction.hint
        console.info(TAG + 'activated ============ is :' + activated);
        console.info(TAG + 'interruptHint ================ is :' + interruptHint);
        console.info(TAG + 'interruptAction.actionType ============ is :' + interruptAction.actionType);
      }
    });
    console.info(TAG + 'AudioFrameworkRenderLog: Renderer after read');
    await sleep(3000);
    await audioRen!.drain().then(async () => {
      console.info(TAG + 'AudioFrameworkRenderLog: Renderer drained : SUCCESS');

      let want: Want = {
        bundleName: 'com.example.audiorenderinterrupt',
        abilityName: 'EntryAbility'
      };
      let resultCode = 1111;
      // 返回给接口调用方AbilityResult信息
      let abilityResult: common.AbilityResult = {
        want,
        resultCode
      };

      try {
        this.context.terminateSelfWithResult(abilityResult, (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`terminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('terminateSelfWithResult succeed');
        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`terminateSelfWithResult failed, code is ${code}, message is ${message}`);
      }
    }).catch((err:BusinessError) => {
      console.error(TAG + 'AudioFrameworkRenderLog: Renderer drain: ERROR : ' + err.message);
    });
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
