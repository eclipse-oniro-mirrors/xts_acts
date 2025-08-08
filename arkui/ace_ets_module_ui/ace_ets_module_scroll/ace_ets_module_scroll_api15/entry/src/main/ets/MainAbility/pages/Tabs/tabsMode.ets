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
import { MyBasicSource } from '../../../MainAbility/pages/data/MyBasicSource';
@Entry
@Component
struct TabsAnimationModeExample {
  @State currentIndex: number = 0
  @State currentAnimationMode: AnimationMode = AnimationMode.CONTENT_FIRST
  private controller: TabsController = new TabsController()
  private data: MyBasicSource = new MyBasicSource([])
  @State text1: string = 'CONTENT_FIRST'

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 0; i < 10; i++) {
      list.push(i);
    }
    this.data = new MyBasicSource(list)
  }
  @Builder
  tabBuilder(title: string,targetIndex: number) {
    Column(){
      Text(title).fontColor(this.currentIndex === targetIndex ? '#FF0000' : '#6B6B6B')
    }.width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Text('AnimationMode:' + this.text1)

      Button('CONTENT_FIRST_WITH_JUMP')
        .id('tabs_animode_content')
        .height('8%')
        .onClick(()=>{
          this.controller.changeIndex(3);
          console.log('change Index 3');

          this.text1 = 'CONTENT_FIRST_WITH_JUMP'
          this.currentAnimationMode = AnimationMode.CONTENT_FIRST_WITH_JUMP
        })
      Button('ACTION_FIRST_WITH_JUMP')
        .id('tabs_animode_first')
        .height('8%')
        .onClick(()=>{
          this.controller.changeIndex(6);
          console.log('change Index 3');

          this.text1 = 'ACTION_FIRST_WITH_JUMP'
          this.currentAnimationMode = AnimationMode.ACTION_FIRST_WITH_JUMP
        })

      Tabs({ barPosition: BarPosition.Start, controller: this.controller, index: this.currentIndex }) {
        LazyForEach(this.data, (item: string) => {
          TabContent() {
            Column(){
              Text('' + item)
            }.width('100%')
            .height('100%')
            .backgroundColor('#00CB87')
            .justifyContent(FlexAlign.Center)
          }.tabBar(this.tabBuilder('P' + item, parseInt(item)))
        }, (item: string) => item)
      }
      .id('tabs_aniMode')
      .vertical(false)
      .barMode(BarMode.Fixed)
      .animationMode(this.currentAnimationMode)
      .animationDuration(3000)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width('90%')
      .height('40%')
      .backgroundColor('#F1F3F5')
      .scrollable(true)
    }.width('100%')
  }
}