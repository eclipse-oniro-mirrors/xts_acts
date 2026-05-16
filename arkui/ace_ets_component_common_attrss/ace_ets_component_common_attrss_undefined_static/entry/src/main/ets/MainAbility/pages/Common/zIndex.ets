'use static';
import { Scroll,Alignment,Stack,FontWeight,TextAlign,Canvas,DrawContext,UIContext,DrawModifier,Color,Entry, Text,
  Column, Component, Button, ClickEvent, Flex, FlexAlign, Padding, Margin, Row, Visibility, ColumnOptions,
  HorizontalAlign, AttributeModifier, ButtonAttribute} from '@ohos.arkui.component'
import { State, Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector'

// xxx.ets
@Entry
@Component
struct ZIndexExample {
  @State isChange:Boolean = false;
  @State zIndex_:Int | undefined = 3

  build() {
    Scroll(){
      Column() {
        Stack() {
          Text('1, zIndex(2)')
            .size({ width: '40%', height: '30%' }).backgroundColor(Color.Blue)
            .zIndex(this.zIndex_)
            .id('TestText')
          Text('2, default zIndex(1)')
            .size({ width: '70%', height: '50%' }).backgroundColor(Color.Red).align(Alignment.TopStart)
            .zIndex(2)
          Text('3, zIndex(0)')
            .size({ width: '90%', height: '80%' }).backgroundColor(Color.Green).align(Alignment.TopStart)
            .zIndex(1)

          Button('Change').onClick(() => {
              this.zIndex_ = undefined;
          }).zIndex(3).id('changeButton')
        }.width('100%')
      }.width('100%')
    }
  }
}
