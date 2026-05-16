'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  ColumnOptions,
  HorizontalAlign,
  Color,
  FlexAlign
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'


@Observed
export class TabIndexModifier implements AttributeModifier<CommonAttribute> {
  @State public isTabIndex: Int | undefined = 3

  applyNormalAttribute(instance: CommonAttribute): void {
    instance.tabIndex(this.isTabIndex);
  }
}

@Entry
@Component
struct FocusableExample {
  @State tabIndexModifier1: TabIndexModifier = new TabIndexModifier()
  @State tabIndexModifier2: TabIndexModifier = new TabIndexModifier()
  @State tabIndexModifier4: TabIndexModifier = new TabIndexModifier()

  aboutToAppear() {
    this.tabIndexModifier1.isTabIndex = 4
    this.tabIndexModifier2.isTabIndex = undefined
    this.tabIndexModifier4.isTabIndex = 3
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Group1')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .attributeModifier(this.tabIndexModifier1)

      Button('Group2')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .attributeModifier(this.tabIndexModifier2)

      Button('Group3')
        .width(165)
        .height(40)
        .fontColor(Color.White)

      Button('Group4')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .tabIndex(2)

      Button('Group5')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .tabIndex(1)

      Button('undefined: ' + this.tabIndexModifier4.isTabIndex)
        .attributeModifier(this.tabIndexModifier4)
        .id('common_tabIndexModifier')

      Button('Click to change tabIndex')
        .onClick(() => {
          this.tabIndexModifier4.isTabIndex = this.tabIndexModifier4.isTabIndex === undefined ? 3 : undefined
        })
        .id('button_tabIndexModifier')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
