/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct TransitionEdgeTest {
  @State flag: boolean = true;
  @State show: string = 'show';

  build() {
    Column() {
      Button(this.show).width(80).height('10%').margin(30)
        .id('clickId')
        .onClick(() => {
          // 点击Button控制Image的显示和消失
          if (this.flag) {
            this.show = 'hide';
          } else {
            this.show = 'show';
          }
          animateTo({ duration: 2000 }, () => {
            this.flag = !this.flag;
          });
        })
      if (this.flag) {
        Image($r('app.media.icon')).width('50%').height('50%').margin({ top: 10 }).id('imageId')
          .transition(
            TransitionEffect.asymmetric(
              TransitionEffect.move(TransitionEdge.END),
              TransitionEffect.SLIDE
            )
          )
      }
    }.width('100%')
  }
}