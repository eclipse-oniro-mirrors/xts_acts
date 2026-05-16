import { BusinessError } from '@kit.BasicServicesKit';
import { AtomicServiceOptions, common } from '@kit.AbilityKit';
import { EmbeddedUIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World1';
  context = getContext(this) as common.UIAbilityContext;

  build() {
    Column({space:10}) {
      EmbeddedComponent({
        bundleName: 'com.example.myapplication1',
        abilityName: 'UIExtensionProvider'
      }, EmbeddedType.EMBEDDED_UI_EXTENSION)
        .width('100%')
        .height('90%')
        .onTerminated((info)=>{
          this.message = 'Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          this.context.terminateSelf()
        })
        .onError((error)=>{
          this.message = 'Error: code = ' + error.code;
        })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}