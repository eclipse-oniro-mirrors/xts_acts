'use static';
import { Alignment,Stack,FontWeight,TextAlign,Canvas,DrawContext,UIContext,DrawModifier,Color,Entry, Text,
  Column, Component, Button, ClickEvent, Flex,FlexAlign, Padding, Margin, Row, Visibility, ColumnOptions,
  HorizontalAlign,AttributeModifier, ButtonAttribute} from '@ohos.arkui.component'
import { State, Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector'

@Entry
@Component
struct AppearExample {
  @State isShow4: boolean = true;
  @State changeAppear: string = '点我卸载挂载组件';
  private myText: string = 'Text for onAppear';
  @State text:String = '';

  @State isChange: boolean = true;

  build() {
    Column() {
      Button(this.changeAppear)
        .onClick(() => {
          this.isShow4 = !this.isShow4
        }).margin(15).id('changeAppear')

      if (this.isShow4) {
        Text('Text2').fontSize(26).fontWeight(FontWeight.Bold)
          .onAppear(this.isChange?() => {
            console.log('Test onAppear');
            this.text += '1'
          }:undefined)
      }

      Button(this.text)
        .backgroundColor('#00ff00')
        .id('appearText')

      Button('Change').onClick(() => {
        this.isChange = !this.isChange;
        console.log('Test isChange',this.isChange);
      }).id('changeButton')
    }.padding(30).width('100%')
  }
}