'use static'

import {
  Entry, Text, ColumnOptions, Column, Component, Button, ClickEvent, Color, Row, RichEditor, RichEditorController,
  CopyEvent, CutEvent, KeyboardAppearance, EnterKeyType, RichEditorOptions, TextRange, RichEditorTextSpanResult,
  CopyOptions, BarState, RichEditorDeleteValue, Checkbox, CheckBoxShape, Flex, FlexAlign, ItemAlign, AttributeModifier,
  CheckboxAttribute, ArrowPosition, Select, Dimension, ResourceColor, MenuOutlineOptions, Divider, $r,
  SelectAttribute, TextAlign, FontWeight, MenuAlignType, BlurStyle, Font, FontStyle, DividerOptions, ControlSize,
  AvoidanceMode, DividerStyleOptions, DividerMode, LengthMetrics,
} from '@ohos.arkui.component'
import { TextModifier, SymbolGlyphModifier } from '@ohos.arkui.modifier'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct SelectExample02 {
  @State arrowPosition: ArrowPosition = ArrowPosition.END;
  @State public isUndefined: boolean = false;
  @State modifierIsUndefined: boolean = true;
  @State buttonText: string = 'false'

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

  private myDividerStyleOptions: DividerStyleOptions = {
    mode: DividerMode.FLOATING_ABOVE_MENU,
    color: '#d5d5d5',
    strokeWidth: LengthMetrics.vp(5)
  } as DividerStyleOptions;

  private arrowModifier: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
      .fontSize('53vp')
      .fontColor(['#FFFF1238', '#FFFF1238', '#FFFF1238']);

  private textModifier: TextModifier =
    new TextModifier()
      .fontSize('150vp')
      .fontColor(Color.Blue)
      .maxLines(2);

  private selectedOptionTextModifier: TextModifier =
    new TextModifier()
      .fontSize('50vp')
      .fontColor(Color.Yellow)
      .maxLines(3);

  private optionTextModifier: TextModifier =
    new TextModifier()
      .fontSize('100vp')
      .fontColor(Color.Green)
      .maxLines(4);

  build() {
    Column() {
      Text('Select02')

      Select([
        { value: 'origin', icon: $r('app.media.background') },
      ])
        .id('Select_Origin')
        .fontColor(undefined)
        .optionBgColor(undefined)
        .selectedOptionBgColor(undefined)
        .selectedOptionFontColor(undefined)

      Select([
        { value: 'aaa', icon: $r('app.media.background') },
      ])
        .id('Select_Test02')
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
        .space(this.isUndefined ? undefined : '100vp')

      Divider()

      Select([
        { value: 'aaa', icon: $r('app.media.background') },
        { value: 'bbb', icon: $r('app.media.background') },
      ])
        .id('Select_Test03')
        .dividerStyle(this.isUndefined ? undefined : this.myDividerStyleOptions)

      Divider()

      Button('isUndefined=' + this.buttonText)
        .id('Select_Change02')
        .onClick(() => {
          this.isUndefined = !this.isUndefined;
          this.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false';
        })

    }.width('100%')
  }
}