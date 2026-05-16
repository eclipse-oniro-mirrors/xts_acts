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
struct TestNewInterface {
  @State itemSimpleColor: Color | number | string = '';
  @State selectedItemSimpleColor: Color | number | string = '';
  private wearableSwiperController: ArcSwiperController = new ArcSwiperController();
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator();
  private data: MyDataSource = new MyDataSource([]);
  @State backgroundColors: Color[] =
    [Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.White, Color.Gray, Color.Orange, Color.Transparent];
  innerSelectedIndex: number = 0;

  aboutToAppear(): void {
    let list: Color[] = [];
    for (let i = 1; i <= 6; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(this.backgroundColors);
  }

  /**
   * 测试finishAnimation方法入参为null的情况
   */
  testFinishAnimationWithNull() {
    try {
      this.wearableSwiperController.finishAnimation(null);
      console.info('[testFinishAnimationWithNull] finishAnimation with null called');
      AppStorage.setOrCreate('flag',true)
    } catch (error) {
      console.info('[testFinishAnimationWithNull] ERROR: ' + JSON.stringify(error));
      AppStorage.setOrCreate('errCode', error?.code)
    }
  }

  /**
   * 测试finishAnimation方法入参为undefined的情况
   */
  testFinishAnimationWithUndefined() {
    try {
      this.wearableSwiperController.finishAnimation(undefined);
      console.info('[testFinishAnimationWithUndefined] finishAnimation with undefined called');
      AppStorage.setOrCreate('flag',true)
    } catch (error) {
      console.info('[testFinishAnimationWithUndefined] ERROR: ' + JSON.stringify(error));
    }
  }

  build() {
    Column() {
      Row() {
        Button('testUndefined').onClick(() => {
          this.testFinishAnimationWithUndefined();
        })
          .id('testUndefinedId')
        Button('testNull').onClick(() => {
          this.testFinishAnimationWithNull();
        })
          .id('testNullId')
      }
      Row() {
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
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .backgroundColor(Color.Transparent)
        .index(0)
        .duration(400)
        .vertical(false)
        .indicator(this.arcDotIndicator
          .arcDirection(ArcDirection.SIX_CLOCK_DIRECTION)
          .itemColor(this.itemSimpleColor)
          .selectedItemColor(this.selectedItemSimpleColor)
        )
        .disableSwipe(false)
        .digitalCrownSensitivity(CrownSensitivity.MEDIUM)
        .onChange((index: number) => {
        })
        .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
          this.innerSelectedIndex = targetIndex;
        })
        .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
          others: Array<GestureRecognizer>): GestureJudgeResult => { // 在识别器即将要成功时，根据当前组件状态，设置识别器使能状态
          if (current) {
            let target = current.getEventTargetInfo();
            if (target && current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE) {
              // 此处判断swiperTarget.isBegin()或innerSelectedIndex === 0，表明ArcSwiper滑动到开头
              let swiperTarget = target as ScrollableTargetInfo
              if (swiperTarget instanceof ScrollableTargetInfo &&
                (swiperTarget.isBegin() || this.innerSelectedIndex === 0)) {
                let panEvent = event as PanGestureEvent;
                if (panEvent && panEvent.offsetX > 0 && (swiperTarget.isBegin() || this.innerSelectedIndex === 0)) {
                  return GestureJudgeResult.REJECT;
                }
              }
            }
          }
          return GestureJudgeResult.CONTINUE;
        })
        .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
        })
        .disableTransitionAnimation(false)
      }
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}