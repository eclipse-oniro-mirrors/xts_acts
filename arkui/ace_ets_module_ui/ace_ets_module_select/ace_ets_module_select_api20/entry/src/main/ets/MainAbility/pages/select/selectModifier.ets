import { SymbolGlyphModifier, TextModifier } from '@kit.ArkUI';

@Entry
@Component
struct SelectModifierExample {
  @State textModifier: TextModifier =
    new TextModifier()
      .fontSize('50vp')
      .fontColor('#FFFF1235')
      .maxLines(2);
  @State selectedOptionTextModifier: TextModifier =
    new TextModifier()
      .fontSize('51vp')
      .fontColor('#FFFF1236')
      .maxLines(3);
  @State optionTextModifier: TextModifier =
    new TextModifier()
      .fontSize('52vp')
      .fontColor('#FFFF1237')
      .maxLines(4);
  @State arrowModifier: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
      .fontSize('53vp')
      .fontColor(['#FFFF1238', '#FFFF1238', '#FFFF1238']);

  build() {
    Column() {
      Select([{ value: 'bbb' }, { value: 'ccc' }])
        .id('Select')
        .selected(1)
        .value('TTTTT')
        .textModifier(this.textModifier)
        .selectedOptionTextModifier(this.selectedOptionTextModifier)
        .optionTextModifier(this.optionTextModifier)
        .arrowModifier(this.arrowModifier)

      Select([{ value: 'bbb' }, { value: 'ccc' }])
        .id('Select2')
        .selected(1)
        .value('TTTTT')
        .font({ size: '40vp' })
        .selectedOptionFont({ size: '41vp' })
        .optionFont({ size: '42vp' })
        .textModifier(undefined)
        .selectedOptionTextModifier(undefined)
        .optionTextModifier(undefined)
        .arrowModifier(undefined)
    }
  }
}
