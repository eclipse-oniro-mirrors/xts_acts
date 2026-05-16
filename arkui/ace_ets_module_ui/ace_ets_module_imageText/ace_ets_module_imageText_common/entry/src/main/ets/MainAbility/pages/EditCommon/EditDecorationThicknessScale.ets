/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct TextDecorationThicknessScale {
  build() {
    Scroll() {
      Column() {
        // TextArea测试
        Text('TextArea Tests')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        TextArea({placeholder:'TextArea default'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_default')
          .decoration({ type: TextDecorationType.Underline })

        TextArea({placeholder:'TextArea thicknessScale 1.0'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_thicknessScale_1_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 1.0 })

        TextArea({placeholder:'TextArea thicknessScale 2.0'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_thicknessScale_2_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 2.0 })

        TextArea({placeholder:'TextArea thicknessScale 0.5'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_thicknessScale_0_5')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 0.5 })

        TextArea({placeholder:'TextArea thicknessScale 3.0'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_thicknessScale_3_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 3.0 })

        TextArea({placeholder:'TextArea thicknessScale 0'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_thicknessScale_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 0 })

        TextArea({placeholder:'TextArea thicknessScale negative -1'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_thicknessScale_negative')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: -1 })

        TextArea({placeholder:'TextArea thicknessScale null'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_thicknessScale_null')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: null })

        TextArea({placeholder:'TextArea thicknessScale undefined'})
          .width('100%')
          .height('5%')
          .id('textarea_decoration_thicknessScale_undefined')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: undefined })

        // TextInput测试
        Text('TextInput Tests')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })

        TextInput({ placeholder: 'TextInput default' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_default')
          .decoration({ type: TextDecorationType.Underline })

        TextInput({ placeholder: 'TextInput thicknessScale 1.0' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_thicknessScale_1_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 1.0 })

        TextInput({ placeholder: 'TextInput thicknessScale 2.0' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_thicknessScale_2_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 2.0 })

        TextInput({ placeholder: 'TextInput thicknessScale 0.5' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_thicknessScale_0_5')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 0.5 })

        TextInput({ placeholder: 'TextInput thicknessScale 3.0' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_thicknessScale_3_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 3.0 })

        TextInput({ placeholder: 'TextInput thicknessScale 0' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_thicknessScale_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 0 })

        TextInput({ placeholder: 'TextInput thicknessScale negative' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_thicknessScale_negative')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: -1 })

        TextInput({ placeholder: 'TextInput thicknessScale null' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_thicknessScale_null')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: null })

        TextInput({ placeholder: 'TextInput thicknessScale undefined' })
          .width('100%')
          .height('5%')
          .id('textinput_decoration_thicknessScale_undefined')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: undefined })

        // Search测试
        Text('Search Tests')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })

        Search({ placeholder: 'Search default' })
          .width('100%')
          .height('5%')
          .id('search_decoration_default')
          .decoration({ type: TextDecorationType.Underline })

        Search({ placeholder: 'Search thicknessScale 1.0' })
          .width('100%')
          .height('5%')
          .id('search_decoration_thicknessScale_1_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 1.0 })

        Search({ placeholder: 'Search thicknessScale 2.0' })
          .width('100%')
          .height('5%')
          .id('search_decoration_thicknessScale_2_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 2.0 })

        Search({ placeholder: 'Search thicknessScale 0.5' })
          .width('100%')
          .height('5%')
          .id('search_decoration_thicknessScale_0_5')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 0.5 })

        Search({ placeholder: 'Search thicknessScale 3.0' })
          .width('100%')
          .height('5%')
          .id('search_decoration_thicknessScale_3_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 3.0 })

        Search({ placeholder: 'Search thicknessScale 0' })
          .width('100%')
          .height('5%')
          .id('search_decoration_thicknessScale_0')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: 0 })

        Search({ placeholder: 'Search thicknessScale negative' })
          .width('100%')
          .height('5%')
          .id('search_decoration_thicknessScale_negative')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: -1 })

        Search({ placeholder: 'Search thicknessScale null' })
          .width('100%')
          .height('5%')
          .id('search_decoration_thicknessScale_null')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: null })

        Search({ placeholder: 'Search thicknessScale undefined' })
          .width('100%')
          .height('5%')
          .id('search_decoration_thicknessScale_undefined')
          .decoration({ type: TextDecorationType.Underline, thicknessScale: undefined })
      }
      .width('100%')
    }
    .height('100%')
  }
}