import { LengthMetrics } from '@kit.ArkUI'

class MyTextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  isDark: boolean = false

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.disableTextStyleAnimation(true)
      .defaultTextStyle({ minFontSize: 28, maxFontSize: 18, overflow: TextOverflow.Ellipsis })
  }
}

@Entry
@Component
struct TextPickerModifier {
  @State modifier: MyTextPickerModifier = new MyTextPickerModifier()
  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  private orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4']
  private pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4']
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits]
  private multipleColumnWidths: LengthMetrics[] = [
    LengthMetrics.vp(50),
    LengthMetrics.vp(100),
    LengthMetrics.vp(50)
  ]

  build() {
    Column() {
      TextPicker({ range: this.multi, columnWidths: this.multipleColumnWidths })
        .attributeModifier(this.modifier)
        .key('modifierDefaultTextStyle')
    }.alignItems(HorizontalAlign.Center).width('90%')
  }
}