'use static'

import { Entry, Column, Component, Row, Toggle, Text, Button, ClickEvent, ButtonRole, Checkbox, ColumnOptions, Shape,
  Path, Builder, CheckBoxConfiguration, Margin, Visibility, LineJoinStyle, ToggleType, ContentModifier, Color,
  WrappedBuilder, CustomBuilderT, wrapBuilder, Flex, FlexAlign, ItemAlign, CheckboxAttribute, AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement';

@Observed
export class CheckboxModifier01 implements AttributeModifier<CheckboxAttribute> {
  @State public isUndefined: boolean = false;
  @State public flag: boolean = true;

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance
      .onChange(this.isUndefined ? undefined : (value: boolean) => {
        this.flag = value;
      })
  }
}

@Observed
export class CheckboxModifier02 implements AttributeModifier<CheckboxAttribute> {
  @State public isUndefined: boolean = true;

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance
      .select(this.isUndefined ? undefined : true)
  }
}

@Entry
@Component
struct CheckboxTest {
  @State onChangeFlag: boolean = false;
  @State onChangeFlag02: boolean = false;
  @State onChangeFlag03: boolean = true;
  @State public flag: boolean = true;

  @State modifier01 : CheckboxModifier01 = new CheckboxModifier01()
  @State modifier02 : CheckboxModifier02 = new CheckboxModifier02()

  build() {
    Row() {
      Column() {
        Text('checkbox modifier')
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox01', group: 'testGroup' })
            .id('checkboxModifier01')
            .width(30)
            .height(30)
            .attributeModifier(this.modifier01)

        }
        .margin(10)

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox02', group: 'testGroup' })
            .id('checkboxModifier02')
            .width(30)
            .height(30)
            .attributeModifier(this.modifier02)
        }
        .margin(10)

        Text('Checkbox modifier flag:' + this.modifier01.flag)
          .fontSize(24)
          .margin(20)
          .id('txtModifier')

        Button('change modifier onChangeFlag:' + this.modifier01.isUndefined)
          .id('bntChangeFlagMod01')
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .margin(20)
          .onClick(() => {
            this.modifier01.isUndefined = !this.modifier01.isUndefined;
          })

        Button('change onChangeFlag02:' + this.modifier02.isUndefined)
          .id('bntChangeFlagMod02')
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .margin(20)
          .onClick(() => {
            this.modifier02.isUndefined = !this.modifier02.isUndefined;
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}