import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

@Entry
@Component
struct HostInstance {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility SameIst aboutToAppear');

  }

  @State message: string = 'ni'
  @State flag: boolean = false
  @State hostSpecified: string = ''
  private want1: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EmbeddedUIExtAbilityInstance',
    parameters: {}
  }
  private want: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EntryEmbeddedUIExtAbility4',
    parameters: {
      'ohos.extension.processMode.hostSpecified': `${this.hostSpecified}`
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30)
        EmbeddedComponent(this.want1, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .onTerminated((info: TerminationInfo) => {
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error: BusinessError) => {
          })
        Button()
          .onClick(() => {
            this.flag = true
            let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
            let cmd = 'aa dump -r';
            abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
              if (error) {
                hilog.info(0x0000, this.message, '%{public}s',
                  `executeShellCommand fail, error: ${JSON.stringify(error)}`);
              } else {
                hilog.info(0x0000, this.message, '%{public}s',
                  `executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
                let result = JSON.stringify(data)
                const regex = /com\.example\.act_embeddeduiextension:EmbeddedUIExtAbilityInstance:\d+/;
                const match = result.match(regex);
                if (match) {
                  console.log('Matched string:', match[0]);
                  this.hostSpecified = match[0]
                  console.log('sss', typeof match[0])
                } else {
                  console.log('No match found');
                }
              }
            });
          })
          .id('EmbeddedUIExtension_4600')
        if (this.flag) {
          EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
            .onTerminated((info: TerminationInfo) => {
              this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
            })
            .onError((error: BusinessError) => {
              let commonEventPublishData: commonEventManager.CommonEventPublishData = {
                parameters: {
                  data: error.code
                }
              }
              commonEventManager.publish('Start_Fail', commonEventPublishData, async (error) => {
                hilog.info(0x0000, 'testTag1', '%{public}s', `HostInstancesdas publish: ${JSON.stringify(error)}`);
              })
              this.message = 'Error: code = ' + error.code;
            })
        }
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .height('100%')
  }
}