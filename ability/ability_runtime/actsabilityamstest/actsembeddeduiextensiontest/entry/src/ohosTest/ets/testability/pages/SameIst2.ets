import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

@Entry
@Component
struct SameIst {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility SameIst aboutToAppear');

  }

  @State message: string = 'ni'
  @State flag:boolean = false
  @State hostSpecified:string=''
  private want1: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EmbeddedUIExtAbilityInstance',
    parameters: {

    }
  }
  private want: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EmbeddedUIExtAbilityInstance2',
    parameters: {
      'ohos.extension.processMode.hostSpecified' : `${this.hostSpecified}`
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
            this.message = 'Error: code = ' + error.code
            console.log('EmbeddedAbility1', JSON.stringify(error))

          })
          Button()
            .onClick(()=>{
              this.flag=true
                let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
                let cmd = 'aa dump -r';
                abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
                abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
                  if (error) {
                    hilog.info(0x0000, this.message, '%{public}s', `executeShellCommand fail, error: ${JSON.stringify(error)}`);
                  } else {
                    hilog.info(0x0000, this.message, '%{public}s',
                      `executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
                 let result = JSON.stringify(data)
                    const regex = /com\.example\.act_embeddeduiextension:EmbeddedUIExtAbilityInstance:\d+/;
                    // 使用正则表达式进行匹配
                    const match = result.match(regex);
                    if (match) {
                      console.log('Matched string:'+match[0]);
                      this.hostSpecified=match[0]
                      console.log('sss',typeof match[0])
                    } else {
                      console.log('No match found');
                    }

                  }
                });
            })
            .id('EmbeddedUIExtension_4700')
        if (this.flag){
          EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
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
      }
      .width('100%')
    }
    .height('100%')
  }
}