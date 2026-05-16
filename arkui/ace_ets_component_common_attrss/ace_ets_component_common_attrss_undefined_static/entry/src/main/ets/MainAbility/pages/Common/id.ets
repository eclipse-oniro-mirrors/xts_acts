'use static';
import { Blank,Alignment,Stack,FontWeight,TextAlign,Canvas,DrawContext,UIContext,DrawModifier,Color,Entry,
  Text, Column, Component, Button, ClickEvent, Flex, FlexAlign, Padding, Margin, Row, Visibility, ColumnOptions,
  HorizontalAlign, AttributeModifier, ButtonAttribute} from '@ohos.arkui.component'
import { State, Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector'

@Entry
@Component
struct ComponentPage {
  @State isChange:Boolean = true
  build() {
    Column() {
      Text('Hello World')
        .fontSize(20)
        .id( this.isChange?'TEXT2':undefined)

      Button('Change').onClick(() => {
        this.isChange = !this.isChange;
        console.log('Test isChange',this.isChange);
      }).id('changeButton')

    }
    .width('100%')
    .height('100%')
  }
}