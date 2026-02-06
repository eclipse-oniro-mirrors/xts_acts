import {
  ArcSwiperAttribute,
  ArcSwiper,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController
} from '@ohos.arkui.ArcSwiper'

class MyDataSource implements IDataSource {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): number {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct ArcSwiper2 {
  private arcSwiperController: ArcSwiperController = new ArcSwiperController()
  private data: MyDataSource = new MyDataSource([])
  scroller: Scroller = new Scroller();

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 5; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 }) {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            ArcSwiper(this.arcSwiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item.toString())
                  .width('90%')
                  .height('90%')
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: string) => item)
            }
            .key('arcSwiperTest002')
            .index(0)
            .duration(400)
            .vertical(true)
            .disableSwipe(true)
            .effectMode(EdgeEffect.Fade)
            .disableTransitionAnimation(true)
            .customContentTransition({
              timeout: 1000,
              transition: (proxy: SwiperContentTransitionProxy) => {}
            })
            .digitalCrownSensitivity(CrownSensitivity.MEDIUM)
            .indicator(new ArcDotIndicator()
              .arcDirection(ArcDirection.SIX_CLOCK_DIRECTION)
              .itemColor(0xffffff)
              .selectedItemColor(0xffffff)
              .backgroundColor(0xffffff)
            )
          }
        }
      }
    }
  }
}
