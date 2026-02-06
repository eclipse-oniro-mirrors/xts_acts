import { common, StartOptions, wantConstant } from '@kit.AbilityKit';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
let storage = LocalStorage.getShared()
@Entry(storage)
@Component
struct Index {
  context = this.getUIContext().getHostContext() as common.UIExtensionContext
  @State message: string = 'Hello World1';
  @LocalStorageLink('pageName') pageName:string = 'null'
  build() {
    Column() {

    }
    .height('100%')
  }
}


