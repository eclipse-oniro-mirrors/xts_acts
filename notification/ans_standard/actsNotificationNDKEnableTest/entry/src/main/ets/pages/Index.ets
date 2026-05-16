import testNapi, { IsNotificationEnabled } from 'libenable.so';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            let enable = IsNotificationEnabled();
            console.info(`IsNotificationEnabled value is ${enable}`);
            this.message = (`IsNotificationEnabled value is ${enable}`)
          })
      }
      .width('100%')
    }


    .height('100%')
  }
}
