// xxx.ets
import {
  CircleShape,
  ArcSwiper,
  ArcSwiperAttribute,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController
} from '@kit.ArkUI';
// 从API version 22开始，无需手动导入ArcSwiperAttribute。具体请参考ArcSwiper的导入模块说明

class MyDataSource implements IDataSource {
  private list: Color[] = [];

  constructor(list: Color[]) {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): Color {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct ArcDotIndicatorNullUndefined {
  private wearableSwiperController: ArcSwiperController = new ArcSwiperController();
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator();
  private data: MyDataSource = new MyDataSource([]);
  @State backgroundColors: Color[] =
    [Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.White, Color.Gray, Color.Orange, Color.Transparent];

  aboutToAppear(): void {
    this.data = new MyDataSource(this.backgroundColors);
  }

  build() {
    Column() {
      Row() {
        // ========== arcDirection with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_arcDirection_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.arcDirection(null))
        .disableSwipe(false)

        // ========== arcDirection with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_arcDirection_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.arcDirection(undefined))
        .disableSwipe(false)

        // ========== itemColor with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_itemColor_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.itemColor(null))
        .disableSwipe(false)

        // ========== itemColor with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_itemColor_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.itemColor(undefined))
        .disableSwipe(false)

        // ========== selectedItemColor with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_selectedItemColor_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.selectedItemColor(null))
        .disableSwipe(false)

        // ========== selectedItemColor with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_selectedItemColor_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.selectedItemColor(undefined))
        .disableSwipe(false)

        // ========== backgroundColor with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_backgroundColor_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.backgroundColor(null))
        .disableSwipe(false)

        // ========== backgroundColor with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_backgroundColor_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.backgroundColor(undefined))
        .disableSwipe(false)

        // ========== maskColor with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_maskColor_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.maskColor(null))
        .disableSwipe(false)

        // ========== maskColor with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_maskColor_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.maskColor(undefined))
        .disableSwipe(false)
      }.height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
