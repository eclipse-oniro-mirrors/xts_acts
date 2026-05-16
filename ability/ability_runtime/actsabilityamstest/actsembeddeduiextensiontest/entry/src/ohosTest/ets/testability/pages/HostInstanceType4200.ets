import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

@Entry
@Component
struct HostInstanceType {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility HostInstanceType aboutToAppear');

  }

  @State message: string = 'ni'
  private want1: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EmbeddedUIExtAbilityType',
    moduleName: 'entry_test',
    parameters: {
      'ohos.extension.processMode.hostInstance': 'true'
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30)
        EmbeddedComponent(this.want1, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('100%')
          .height('90%')
          .onTerminated((info: TerminationInfo) => {
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error: BusinessError) => {
            this.message = 'Error: code = ' + error.code;
            console.log('EmbeddedAbility4', JSON.stringify(error))
          })
        EmbeddedComponent(this.want1, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('100%')
          .height('90%')
          .onTerminated((info: TerminationInfo) => {
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error: BusinessError) => {
            this.message = 'Error: code = ' + error.code;
            console.log('EmbeddedAbility4', JSON.stringify(error))
          })
        EmbeddedComponent(this.want1, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('100%')
          .height('90%')
          .onTerminated((info: TerminationInfo) => {
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error: BusinessError) => {
            this.message = 'Error: code = ' + error.code;
            console.log('EmbeddedAbility4', JSON.stringify(error))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}