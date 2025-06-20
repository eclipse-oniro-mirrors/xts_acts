import { common } from '@kit.AbilityKit';
import { power } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World cycle2';
  context = getContext(this) as common.UIAbilityContext;

  build() {
    Column({space:10}) {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Button('Close App')
        .onClick(() => {
          this.context.terminateSelf()
        }).height(45)

      Button('power suspend')
        .onClick(() => {
          try {
            power.suspend();
          } catch (err) {
            console.error('suspend failed, err: ' + err);
          }
        }).height(45)
    }
    .height('100%')
    .width('100%')
  }
}