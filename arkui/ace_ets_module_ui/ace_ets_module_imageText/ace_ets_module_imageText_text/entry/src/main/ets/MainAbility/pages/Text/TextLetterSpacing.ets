/**
 * Text LetterSpacing Test Page
 * 测试 Text 组件的 letterSpacing 属性
 */
@Entry
@Component
struct TextLetterSpacing {
  build() {
    Column({ space: 20 }) {
      Text('Text LetterSpacing Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 测试1: 默认值（未设置letterSpacing）
      Text('Default letterSpacing text content for testing default behavior when no letterSpacing is set.')
        .id('text_letterspacing_default')
        .height('5%')

      // 测试2: null 参数
      Text('LetterSpacing with null parameter text content for testing null behavior.')
        .id('text_letterspacing_null')
        .letterSpacing(null)
        .height('5%')

      // 测试3: undefined 参数
      Text('LetterSpacing with undefined parameter text content for testing undefined behavior.')
        .id('text_letterspacing_undefined')
        .letterSpacing(undefined)
        .height('5%')

      // 测试4: 空字符串参数
      Text('LetterSpacing with empty string parameter text content for testing empty string behavior.')
        .id('text_letterspacing_empty')
        .letterSpacing('')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}