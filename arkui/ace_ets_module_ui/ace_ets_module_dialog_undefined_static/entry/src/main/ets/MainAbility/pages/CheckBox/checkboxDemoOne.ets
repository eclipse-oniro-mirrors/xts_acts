'use static'

import { Entry, Column, Component, Row, Toggle, Text, Button, ClickEvent, ButtonRole, Checkbox, ColumnOptions, Shape,
  Path, Builder, CheckBoxConfiguration, Margin, Visibility, LineJoinStyle, ToggleType, ContentModifier, Color,
  WrappedBuilder, CustomBuilderT, wrapBuilder, Flex, FlexAlign, ItemAlign,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MyCheckboxStyleContent implements ContentModifier<CheckBoxConfiguration> {
  public selectedColor: Color = Color.White
  constructor(selectedColor: Color) {
    this.selectedColor = selectedColor;
  }
  applyContent():  WrappedBuilder<CustomBuilderT<CheckBoxConfiguration>>{
    return wrapBuilder<CustomBuilderT<CheckBoxConfiguration>>(buildCheckboxContent)
  }
}

@Builder function buildCheckboxContent(config: CheckBoxConfiguration) {
  Column({space:10} as ColumnOptions) {
    Text(config.name  + (config.selected ? '（ 选中 ）' : '（ 非选中 ）')).margin({right : 70, top : 50} as Margin)
    Text(config.enabled ? 'enabled true' : 'enabled false').margin({right : 110} as Margin)
    Shape() {
      Path().width(100).height(100).commands('M100 0 L0 100 L50 200 L150 200 L200 100 Z').fillOpacity(0).strokeWidth(3).onClick((e:ClickEvent)=>{
        if (config.selected) {
          config.triggerChange(false)
          console.log('config.triggerChange: ' + config.triggerChange)
        } else {
          config.triggerChange(true)
          console.log('config.triggerChange: ' + config.triggerChange)
        }
      }).opacity(config.enabled ? 1 : 0.1)
      Path().width(10).height(10).commands('M50 0 L100 100 L0 100 Z')
        .id('ContentModifierMessage')
        .visibility(config.selected ? Visibility.Hidden : Visibility.Hidden)
        .fill(config.selected ? (config.contentModifier as MyCheckboxStyleContent).selectedColor : Color.Black)
        .stroke((config.contentModifier as MyCheckboxStyleContent).selectedColor)
        .margin({left:11,top:10} as Margin)
        .opacity(config.enabled ? 1 : 0.1)
    }
    .width(300)
    .height(200)
    .viewPort({ x: 0, y: 0, width: 310, height: 310 })
    .strokeLineJoin(LineJoinStyle.Miter)
    .strokeMiterLimit(5)
    .margin({left:50} as Margin)
  }
}

@Entry
@Component
struct CheckboxTest {
  @State onChangeFlag: boolean = false;
  @State onChangeFlag02: boolean = false;
  @State onChangeFlag03: boolean = true;
  @State public flag: boolean = true;

  build() {
    Row() {
      Column() {

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox01', group: 'testGroup' })
            .id('checkbox01')
            .width(30)
            .height(30)
            .onChange(this.onChangeFlag ? (value: boolean) => {
              this.flag = value;
            } : undefined)
        }
        .margin(10)

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox02', group: 'testGroup' })
            .id('checkbox02')
            .select(this.onChangeFlag02 ? true : undefined)
            .width(30)
            .height(30)
            .onChange((value: boolean) => {
              this.flag = value;
            })
        }
        .margin(10)

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox03', group: 'testGroup' })
            .id('checkbox03')
            .width(30)
            .height(30)
            .contentModifier(this.onChangeFlag03 ? undefined : new MyCheckboxStyleContent(Color.Red))
        }
        .margin(10)

        Text('Checkbox flag:' + this.flag)
          .fontSize(24)
          .margin(20)
          .id('txtCheckboxFlag')

        Button('change onChangeFlag:' + this.onChangeFlag)
          .id('bntChangeFlag')
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .margin(20)
          .onClick(() => {
            this.onChangeFlag = !this.onChangeFlag;
          })

        Button('change onChangeFlag02:' + this.onChangeFlag02)
          .id('bntChangeFlag02')
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .margin(20)
          .onClick(() => {
            this.onChangeFlag02 = !this.onChangeFlag02;
          })

        Button('change onChangeFlag03:' + this.onChangeFlag03)
          .id('bntChangeFlag03')
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .margin(20)
          .onClick(() => {
            this.onChangeFlag03 = !this.onChangeFlag03;
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}
