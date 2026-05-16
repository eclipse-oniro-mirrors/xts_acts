'use static'

import {
  Entry, Text, ColumnOptions, Column, Component, Button, ClickEvent, Color, Row, RichEditor, RichEditorController,
  CopyEvent, CutEvent, KeyboardAppearance, EnterKeyType, RichEditorOptions, TextRange, RichEditorTextSpanResult,
  CopyOptions, BarState, RichEditorDeleteValue, Checkbox, CheckBoxShape, Flex, FlexAlign, ItemAlign, AttributeModifier,
  CheckboxAttribute, ArrowPosition, Select, Dimension, ResourceColor, MenuOutlineOptions, Divider, $r,
  SelectAttribute, TextAlign, FontWeight, MenuAlignType, BlurStyle, Font, FontStyle, DividerOptions, ControlSize,
  AvoidanceMode, DividerStyleOptions, DividerMode
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class ModifierMenuOutline implements AttributeModifier<SelectAttribute> {
  @State public isUndefined: boolean = false;

  private myFont: Font =  {
    size: 20,
    weight: 500,
    style: FontStyle.Italic,
    family: 'Arial'
  } as Font;

  private myDividerOptions: DividerOptions = {
    strokeWidth: '2px',
    color: '#33182431'
  } as DividerOptions;

  applyNormalAttribute(instance: SelectAttribute): void {
    instance
      .font(this.isUndefined ? undefined : this.myFont)
      .fontColor(this.isUndefined ? undefined : Color.Red)
      .value(this.isUndefined ? undefined : 'hello')
      .divider(this.isUndefined ? undefined : this.myDividerOptions)
      .optionBgColor(this.isUndefined ? undefined : Color.Yellow)
      .arrowPosition(this.isUndefined ? undefined : ArrowPosition.START)
      .selectedOptionBgColor(this.isUndefined ? undefined : Color.Green)
      .selectedOptionFont(this.isUndefined ? undefined : this.myFont)
      .selectedOptionFontColor(this.isUndefined ? undefined : Color.Blue)
      .controlSize(this.isUndefined ? undefined : ControlSize.SMALL)
  }
}

@Observed
export class ModifierSpace implements AttributeModifier<SelectAttribute> {
  @State public isUndefined: boolean = false;

  private myDividerStyleOptions: DividerStyleOptions = {
    mode: DividerMode.FLOATING_ABOVE_MENU,
    color: Color.Yellow
  } as DividerStyleOptions;

  applyNormalAttribute(instance: SelectAttribute): void {
    instance
      .space(this.isUndefined ? undefined : '100vp')
      .dividerStyle(this.isUndefined ? undefined : this.myDividerStyleOptions)
  }
}

@Entry
@Component
struct SelectExample {
  @State public isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State modifier : ModifierMenuOutline = new ModifierMenuOutline()
  @State modifierSpace : ModifierSpace = new ModifierSpace()

  build() {
    Column() {
      Text('Select02 Modifier')

      Select([
        { value: 'origin', icon: $r('app.media.background') },
      ])
        .id('Select_ModifierOrigin')
        .fontColor(undefined)
        .optionBgColor(undefined)
        .selectedOptionBgColor(undefined)
        .selectedOptionFontColor(undefined)

      Select([
        { value: 'aaa', icon: $r('app.media.background') },
        { value: 'bbb', icon: $r('app.media.foreground') },
      ])
        .id('selectModifier02')
        .attributeModifier(this.modifier)

      Select([
        { value: 'ccc', icon: $r('app.media.background') },
        { value: 'ddd', icon: $r('app.media.foreground') }
      ])
        .id('selectModifier002')
        .attributeModifier(this.modifierSpace)

      Divider()
      Button('isUndefined=' + this.buttonText)
        .id('selectModifierChange02')
        .onClick(() => {
          this.isUndefined = !this.isUndefined;
          this.modifier.isUndefined = !this.modifier.isUndefined;
          this.modifierSpace.isUndefined = !this.modifierSpace.isUndefined;
          this.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false';
        })

    }.width('100%')
  }
}