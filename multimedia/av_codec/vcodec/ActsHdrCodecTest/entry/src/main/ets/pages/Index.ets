import { hilog } from '@kit.PerformanceAnalysisKit';
import libHdrCodec from 'libhdrcodec.so';

const DOMAIN = 0x0000;

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message = 'Welcome';
            hilog.info(DOMAIN, 'testTag', 'HdrCodec test loaded: %{public}s', libHdrCodec.toString());
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
