import { ComponentUtils, UIContext } from '@kit.ArkUI';

@Entry
@Component
struct GetSizeLimitationExample {
  @State code:number = 0
  @State code2:number = 0
  build() {
    Column() {
      Text(this.code.toString()).key('valueMaxWidth')
      Text(this.code2.toString()).key('valueMaxHeight')
      Button('getSizeLimitation')
        .id('getSizeLimitation1')
        .onClick(() => {
          try {
            let componentSnapshot = this.getUIContext().getComponentSnapshot();
            let limitation = componentSnapshot.getSizeLimitation();
            this.code = limitation.maxWidth;
            this.code2 = limitation.maxHeight;
          } catch (error) {
            this.code = 0;
            this.code2 = 0;
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}