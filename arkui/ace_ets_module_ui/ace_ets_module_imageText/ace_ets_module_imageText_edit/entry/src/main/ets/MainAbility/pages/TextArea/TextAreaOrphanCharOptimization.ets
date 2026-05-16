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
struct TextAreaOrphanCharOptimization {
  build() {
    Row() {
      Column() {
        TextArea({ placeholder: 'TextArea orphanCharOptimization default' })
          .width('100%')
          .height('5%')
          .id('textArea_orphanCharOptimization_default')

        TextArea({ placeholder: 'TextArea orphanCharOptimization true' })
          .width('100%')
          .height('5%')
          .id('textArea_orphanCharOptimization_true')
          .orphanCharOptimization(true)

        TextArea({ placeholder: 'TextArea orphanCharOptimization false' })
          .width('100%')
          .height('5%')
          .id('textArea_orphanCharOptimization_false')
          .orphanCharOptimization(false)

        TextArea({ placeholder: 'TextArea orphanCharOptimization null' })
          .width('100%')
          .height('5%')
          .id('textArea_orphanCharOptimization_null')
          .orphanCharOptimization(null)

        TextArea({ placeholder: 'TextArea orphanCharOptimization undefined' })
          .width('100%')
          .height('5%')
          .id('textArea_orphanCharOptimization_undefined')
          .orphanCharOptimization(undefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}