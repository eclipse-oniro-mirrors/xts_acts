import { LengthUnit } from '@kit.ArkUI';

// xxx.ets
@Entry
@Component
struct PickerExample {
  private fontSize: number | string | Resource = '5vp';
  private monthArray: string[] = [];

  aboutToAppear(): void {
    // 构造选项数据
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Row() {
      UIPickerComponent() {
        ForEach(this.monthArray, (item: string) => {
          Text(item)
            .fontSize(this.fontSize)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
        })
      }
      .width(20)
      .height(40)

      // 配置选项列表循环
      .canLoop(true)
      // 配置触控音振反馈为关闭
      .enableHapticFeedback(false)
      // 配置选中项的指示器标识为分割线
      .selectionIndicator({
          type : PickerIndicatorType.BACKGROUND,
          backgroundColor : Color.Blue,
          borderRadius : { value : 10, unit : LengthUnit.VP }
      })
      // 订阅选中项改变事件
      .onChange((idx: number) => {
        console.info('Picker item changed:' + this.monthArray[idx])
      })
      // 订阅滑动停止事件
      .onScrollStop((idx: number) => {
        console.info('Picker scroll stopped: ' + this.monthArray[idx])
      })
    }.width('70%')
  }
}
