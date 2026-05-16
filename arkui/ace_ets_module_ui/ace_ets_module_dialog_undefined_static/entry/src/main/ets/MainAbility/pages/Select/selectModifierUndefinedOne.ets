'use static'

import {
  Entry, Text, ColumnOptions, Column, Component, Button, ClickEvent, Color, Row, RichEditor, RichEditorController,
  CopyEvent, CutEvent, KeyboardAppearance, EnterKeyType, RichEditorOptions, TextRange, RichEditorTextSpanResult,
  CopyOptions, BarState, RichEditorDeleteValue, Checkbox, CheckBoxShape, Flex, FlexAlign, ItemAlign, AttributeModifier,
  CheckboxAttribute, ArrowPosition, Select, Dimension, ResourceColor, MenuOutlineOptions, Divider, $r,
  SelectAttribute, TextAlign, FontWeight, MenuAlignType, BlurStyle,
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class ModifierMenuOutline implements AttributeModifier<SelectAttribute> {
  @State public isUndefined: boolean = false;

  applyNormalAttribute(instance: SelectAttribute): void {
    instance
      .menuOutline(this.isUndefined ? undefined : { width: 10 as Dimension,
        color: Color.Red as ResourceColor } as MenuOutlineOptions)
      .menuAlign(this.isUndefined ? undefined : MenuAlignType.CENTER, { dx: 0, dy: 0 })
      .optionHeight(this.isUndefined ? '100px' as Dimension : undefined)
      .menuBackgroundBlurStyle(this.isUndefined ? undefined : BlurStyle.Thin)
      .menuBackgroundColor(this.isUndefined ? undefined : Color.Red)
      .optionBgColor(this.isUndefined ? undefined : Color.Red)
      .onSelect(this.isUndefined ? undefined : (index: Int, text?: string) => {
        console.error('qwe 正常值 onSelect 被执行');
      })
  }
}

@Entry
@Component
struct SelectExample {
  @State text: string = 'TTTTT';
  @State index: number = 2;
  @State space: number = 8;
  @State arrowPosition: ArrowPosition = ArrowPosition.END;
  @State public isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State modifier : ModifierMenuOutline = new ModifierMenuOutline()


  build() {
    Column() {
      Text('Select Modifier')

      Select([
        { value: 'aaa', icon: $r('app.media.background') },
        { value: 'bbb', icon: $r('app.media.foreground') },
        { value: 'ccc', icon: $r('app.media.background') },
        { value: 'ddd', icon: $r('app.media.foreground') }
      ])
        .id('selectModifier')
        .attributeModifier(this.modifier)

      Divider()
      Button('isUndefined=' + this.buttonText)
        .id('selectModifierChange')
        .onClick(() => {
          this.isUndefined = !this.isUndefined;
          this.modifier.isUndefined = !this.modifier.isUndefined;
          this.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false';
        })

    }.width('100%')
  }
}