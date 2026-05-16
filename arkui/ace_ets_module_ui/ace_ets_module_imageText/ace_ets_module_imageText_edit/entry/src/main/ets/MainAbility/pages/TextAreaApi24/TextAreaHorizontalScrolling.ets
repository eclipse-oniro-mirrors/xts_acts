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
struct TextAreaHorizontalScrolling {
  @State message: string = 'TextArea horizontalScrolling test'

  build() {
    Column({ space: 10 }) {
      // horizontalScrolling true test
      TextArea({ placeholder: 'horizontalScrolling true test' })
        .id('textArea_horizontalScrolling_true')
        .horizontalScrolling(true)
        .height('5%')

      // horizontalScrolling false test
      TextArea({ placeholder: 'horizontalScrolling false test' })
        .id('textArea_horizontalScrolling_false')
        .horizontalScrolling(false)
        .height('5%')

      // horizontalScrolling null test
      TextArea({ placeholder: 'horizontalScrolling null test' })
        .id('textArea_horizontalScrolling_null')
        .horizontalScrolling(null)
        .height('5%')

      // horizontalScrolling undefined test
      TextArea({ placeholder: 'horizontalScrolling undefined test' })
        .id('textArea_horizontalScrolling_undefined')
        .horizontalScrolling(undefined)
        .height('5%')

      // Default horizontalScrolling test (no setting)
      TextArea({ placeholder: 'horizontalScrolling default test' })
        .id('textArea_horizontalScrolling_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
