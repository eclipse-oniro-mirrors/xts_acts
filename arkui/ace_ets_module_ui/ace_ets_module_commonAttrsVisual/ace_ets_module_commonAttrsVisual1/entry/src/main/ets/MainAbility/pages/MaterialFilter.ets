import uiEffect from '@ohos.graphics.uiEffect';

@Entry
@Component
struct MaterialFilter {

  build() {
    Column() {
      Stack() {
        Image($r('app.media.icon'))
          .width('50%')
          .height('20%')
        Column()
          .width('50%')
          .height('20%')
          .materialFilter(uiEffect.createFilter().blur(10))
          .id('materialId')
      }
      Stack() {
        Image($r('app.media.icon'))
          .width('50%')
          .height('20%')
        Column()
          .width('50%')
          .height('20%')
          .materialFilter(undefined)
          .id('undefinedId')
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}