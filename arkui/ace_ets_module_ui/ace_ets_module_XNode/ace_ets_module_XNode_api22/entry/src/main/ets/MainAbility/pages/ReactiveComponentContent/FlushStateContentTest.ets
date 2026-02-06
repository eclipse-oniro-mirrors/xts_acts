/*
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

import {
  ReactiveComponentContent, NodeContent, Binding, UIUtils, typeNode
} from '@kit.ArkUI';

@Builder
function buildText(age1: Binding<number>, age2: Binding<number>) {
  Column() {
    Text(`age1: ${age1.value}`);
    Text(`age2: ${age2.value}`);
  }
}

@ObservedV2
class GeneratedObjectLiteralInterface1 {
  constructor(age1: number, age2: number
  ) {
    this.age1 = age1;
    this.age2 = age2;
  }

  @Trace age1: number = 0;
  @Trace age2: number = 0;
}

class GeneratedObjectLiteralInterface2 {
  constructor(age1: number, age2: number
  ) {
    this.age1 = age1;
    this.age2 = age2;
  }

  public age1: number = 0;
  public age2: number = 0;
}

@Entry
@ComponentV2
struct Index {
  @Local age : number = 0
  private content: NodeContent = new NodeContent();
  params: GeneratedObjectLiteralInterface1 = new GeneratedObjectLiteralInterface1(25, 30);
  params2: GeneratedObjectLiteralInterface2 = new GeneratedObjectLiteralInterface2(25, 30);

  @Builder
  extendBlank() {
    Row() {
      Blank();
    }
    .height(20)
  }

  private componentContent: ReactiveComponentContent<[Binding<number>, Binding<number>]> | null = null

  build() {
    Row() {
      Scroll() {
        Column() {
          Button('V2装饰器').id('V2')
            .onClick(() => {
              let column = typeNode.createNode(this.getUIContext(), 'Column');
              column.initialize();
              column.addComponentContent(new ReactiveComponentContent<[Binding<number>,
              Binding<number>]>(this.getUIContext(),
                wrapBuilder<[Binding<number>, Binding<number>]>(buildText),
                {},
                UIUtils.makeBinding<number>(() => {
                  return this.params.age1;
                }),
                UIUtils.makeBinding<number>(() => {
                  return this.params.age2;
                })));

              this.content.addFrameNode(column);
            })
          Button('V1装饰器').id('V1')
            .onClick(() => {
              let column = typeNode.createNode(this.getUIContext(), 'Column');
              column.initialize();
              this.componentContent =
                new ReactiveComponentContent<[Binding<number>, Binding<number>]>(this.getUIContext(),
                  wrapBuilder<[Binding<number>, Binding<number>]>(buildText),
                  {},
                  UIUtils.makeBinding<number>(() => {
                    return this.params2.age1;
                  }),
                  UIUtils.makeBinding<number>(() => {
                    return this.params2.age2;
                  })
                );
              column.addComponentContent(this.componentContent);
              this.content.addFrameNode(column);
            })
          this.extendBlank()
          Button('V2 change age 自动更新').id('V2 change')
            .onClick(() => {
              this.params.age1 += 1;
              console.info('flushState V2 :' + this.params.age1)
            })
          Text(`${this.params.age1}`)
            .id('thisParamsAge1')
          Button('V1 change age 手动更新').id('V1 change')
            .onClick(() => {
              this.params2.age2 += 1;
              this.componentContent?.flushState();
              this.age = this.params2.age2
              console.info('flushState V1 :' + this.params2.age2)
            })
          Text(`${this.age}`).id('getContentFlushState')
          ContentSlot(this.content)
        }
        .id('column')
        .width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
    }
    .height('100%')
  }
}