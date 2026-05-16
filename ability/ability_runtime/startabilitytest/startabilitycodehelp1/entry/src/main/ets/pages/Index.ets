// Index.ets
import { common, StartOptions, wantConstant } from '@kit.AbilityKit';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';

let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Index {
  context = this.getUIContext().getHostContext() as common.UIExtensionContext
  @State message: string = 'Hello World1';
  @LocalStorageLink('pageName') pageName: string = 'null'

  build() {
    Column() {
      EmbeddedComponent({
        bundleName: 'com.example.startabilityerrorcode2',
        abilityName: 'UIExtAbility',
        parameters: {
          pageName: this.pageName
        }
      }, EmbeddedType.EMBEDDED_UI_EXTENSION)
        .width('100%')
        .height('100%')
        .onTerminated((info) => {
          this.message = 'Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          this.context.terminateSelf()
        })
        .onError((error) => {
          this.message = 'Error: code = ' + error.code;
        })
    }
    .height('100%')
  }
}


