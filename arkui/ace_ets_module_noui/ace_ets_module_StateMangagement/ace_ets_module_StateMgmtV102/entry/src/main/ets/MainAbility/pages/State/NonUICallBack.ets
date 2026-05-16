/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct NonUICallBack {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    interface List {
      id: string
    }

    class ListItem implements List {
      public id: string

      constructor(id: string) {
        this.id = id;
      }
    }

    this.message = new ListItem('aboutToAppear').id
  }

  build() {
    Column() {
      Text(this.message)
        .id('tvNonUICallBack')
        .height('5%')
      Button('Click0')
        .id('btnNonUICallBackClick0')
        .height('5%')
        .onClick(() => {
          class Polygon {
            public static str: string = 'Polygon'
          }
          this.message = Polygon.str
        })
      Button('Click1')
        .id('btnNonUICallBackClick1')
        .height('5%')
        .onClick(() => {
          enum Text {
            FONTSIZE = 'fontSize',
            FONTCOLOR = 'fontColor'
          }
          this.message = Text.FONTCOLOR
        })
      Button('Click2')
        .id('btnNonUICallBackClick2')
        .height('5%')
        .onClick(() => {
          let Column: string = 'Column'
          this.message = Column
        })
    }
  }
}