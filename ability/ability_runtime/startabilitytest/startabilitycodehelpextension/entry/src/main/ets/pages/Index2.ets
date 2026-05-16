import { BusinessError } from '@kit.BasicServicesKit';
import { AtomicServiceOptions, common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World1';
  context = getContext(this) as common.UIAbilityContext;

  build() {
    Column({space:10}) {
      Text('处于前台的应用')
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}