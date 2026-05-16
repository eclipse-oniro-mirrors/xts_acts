/*

Copyright (c) 2024 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
//001 测试自定义组件冻结V1 TabContent
@Entry
@Component
struct TabContentTest1 {
  @State count: number = 0;
  private data: number[] = [0, 1]
  private controller: TabsController = new TabsController()
  @Provide freezeChangeCount: number = 0

  build() {
    Column() {
      Button('change count')
        .id('btnChangeCount')
        .height('5%')
        .onClick(() => {
          this.count++
        })
      Text(`count${this.freezeChangeCount}`)
        .height('5%')
        .id('tvFreezeChangeCount01')
      Tabs({ controller: this.controller }) {
        ForEach(this.data, (item: number) => {
          TabContent() {
            FreezeChild1({ count: this.count, item: item })
          }.tabBar(`tab${item}`)
        }, (item: number) => item.toString())
      }
      .height('45%')
    }
    .width('100%')
  }
}

@Component({ freezeWhenInactive: true })
struct FreezeChild1 {
  @Link @Watch('onMessageUpdated01') count: number
  @Consume freezeChangeCount: number
  private item: number = 0

  onMessageUpdated01() {
    // 用于计数触发了几次解冻回调
    this.freezeChangeCount++
    console.info(`item: ${this.item}`)
  }

  build() {
    Column() {
      Text(`count: ${this.count} item: ${this.item}`)
        .height('5%')
    }
  }
}