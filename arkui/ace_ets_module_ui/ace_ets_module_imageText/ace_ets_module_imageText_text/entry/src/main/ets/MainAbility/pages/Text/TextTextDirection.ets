/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct TextTextDirectionTest {
  build() {
    Column() {
      Text('Text_textDirection_LTR')
        .id('Text_textDirection_LTR')
        .textDirection(TextDirection.LTR)
        .height('5%')

      Text('Text_textDirection_RTL')
        .id('Text_textDirection_RTL')
        .textDirection(TextDirection.RTL)
        .height('5%')

      Text('Text_textDirection_DEFAULT')
        .id('Text_textDirection_DEFAULT')
        .textDirection(TextDirection.DEFAULT)
        .height('5%')

      Text('Text_textDirection_AUTO')
        .id('Text_textDirection_AUTO')
        .textDirection(TextDirection.AUTO)
        .height('5%')

      Text('Text_textDirection_undefined')
        .id('Text_textDirection_undefined')
        .textDirection(undefined)
        .height('5%')

      Text('Text_textDirection_default')
        .id('Text_textDirection_default')
        .height('5%')

      Button('get textDirection').onClick(()=>{
        console.info('textDirection LTR: ' +
        JSON.stringify(JSON.parse(getInspectorByKey('Text_textDirection_LTR')).$attrs.textDirection));
        console.info('textDirection RTL: ' +
        JSON.stringify(JSON.parse(getInspectorByKey('Text_textDirection_RTL')).$attrs.textDirection));
        console.info('textDirection DEFAULT: ' +
        JSON.stringify(JSON.parse(getInspectorByKey('Text_textDirection_DEFAULT')).$attrs.textDirection));
        console.info('textDirection AUTO: ' +
        JSON.stringify(JSON.parse(getInspectorByKey('Text_textDirection_AUTO')).$attrs.textDirection));
        console.info('textDirection undefined: ' +
        JSON.stringify(JSON.parse(getInspectorByKey('Text_textDirection_undefined')).$attrs.textDirection));
        console.info('textDirection default: ' +
        JSON.stringify(JSON.parse(getInspectorByKey('Text_textDirection_default')).$attrs.textDirection));
      })
    }
    .width('100%')
    .height('100%')
  }
}