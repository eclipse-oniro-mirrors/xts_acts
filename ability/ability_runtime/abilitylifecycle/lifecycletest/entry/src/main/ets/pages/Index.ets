import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World cycle1';
  context = this.getUIContext().getHostContext() as common.UIAbilityContext

  build() {
    Column({space:10}) {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button('Close App')
        .onClick(() => {
          this.context.terminateSelf()
        }).height(45)

      Button('Start EntryAbility1')
        .onClick(() => {
          this.context.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility1',
            parameters: {
              parameter: '0400'
            }
          })
        }).height(45)
    }
    .height('100%')
    .width('100%')
  }
}