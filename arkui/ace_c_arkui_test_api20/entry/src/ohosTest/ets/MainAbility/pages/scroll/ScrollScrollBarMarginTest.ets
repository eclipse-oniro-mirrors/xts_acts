import render from 'libnativerender.so'
import { CommonView } from '../../componet/CommonView';

@Entry
@Component
struct Index {
  PAGE_TAG: string = 'ScrollScrollBarMargin';
  build() {
    Column() {
      Column() {
        Text('ScrollScrollBarMargin')
        CommonView({
          pageTag: this.PAGE_TAG,
        }).onAppear(() => {
          console.log('[ScrollScrollBarMargin] index.ets');
          render.scrollScrollBarMarginTest(this.PAGE_TAG,'')
        }).width('100%')
          .height('100%')
      }.margin({
        top: 27,
        left: 12,
        right: 12
      })
      .height('40%')
      .width('90%')
    }
    .width('100%')
    .height('100%')
  }
}