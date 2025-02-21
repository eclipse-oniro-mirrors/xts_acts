/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class ListItemGroupModifier1 implements AttributeModifier<ListItemGroupAttribute> {
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.divider({ strokeWidth: 12, color: '#FF123456', startMargin: 2, endMargin: 2 })
  }
}

@Entry
@Component
struct ListItemGroupExample {
  @State listItemGroupModifier: ListItemGroupModifier1 = new ListItemGroupModifier1()

  build() {
    Column() {
      List({ space: 20 }) {
        ListItemGroup() {
          ListItem() {
            Text('Text')
              .width("100%")
              .height(100)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xFFFFFF)
          }
        }
        .key('ListItemGroupKey1')
        .attributeModifier(this.listItemGroupModifier)
        .borderRadius(20)
      }
      .width('90%')
      .sticky(StickyStyle.Header | StickyStyle.Footer)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }
}