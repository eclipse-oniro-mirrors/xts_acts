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
struct RefreshExample {
  @State isRefreshing: boolean = true;
  @State promptText: string = 'Refreshing...';
  @State arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  @State changeIndex: number = 0;
  @State isCancelRefresh:(boolean | undefined | null)[] = [
    true,false,undefined,null
  ]

  build() {
    Column() {
      Button('true')
        .onClick(() => {
          this.changeIndex = 0;
        })
        .id('valueTrue')
      Button('false')
        .onClick(() => {
          this.changeIndex = 1;
        })
        .id('valueFalse')
      Button('unde')
        .onClick(() => {
          this.changeIndex = 2;
        })
        .id('valueUnde')
      Button('null')
        .onClick(() => {
          this.changeIndex = 3;
        })
        .id('valueNull')
      Refresh({ refreshing: $$this.isRefreshing, promptText: this.promptText }) {
        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item)
                .width('70%')
                .height(80)
                .fontSize(16)
                .margin(10)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
        .onScrollIndex((first: number) => {
          console.info(first.toString());
        })
        .width('100%')
        .height('100%')

        .alignListItem(ListItemAlign.Center)
        .scrollBar(BarState.Off)
      }
      .id('noRefresh')
      .pullDownRatio(0.9)
      .backgroundColor(0x89CFF0)
      .pullToRefresh(true)
      .pullUpToCancelRefresh(this.isCancelRefresh[this.changeIndex])
      .onRefreshing(() => {
        setTimeout(() => {
          this.isRefreshing = false;
        }, 6000)
        console.info('onRefreshing test');
      })
    }
  }
}