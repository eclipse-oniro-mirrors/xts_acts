import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libsubscribe.so';

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
            hilog.info(0x0000, 'testTag', 'libsubscribe =%{public}s',testNapi.destroy_subscribe_info());
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
