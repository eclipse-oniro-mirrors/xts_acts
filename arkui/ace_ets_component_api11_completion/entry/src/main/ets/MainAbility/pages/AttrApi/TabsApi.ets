/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct TabsApi {
  @State text: string = '';
  @State useCustomAnimation: boolean = true;
  @State tabContent0Scale: number = 1.0;
  @State tabContent1Scale: number = 1.0;
  @State tabContent0Opacity: number = 1.0;
  @State tabContent1Opacity: number = 1.0;
  @State tabContent2Opacity: number = 1.0;
  tabsController: TabsController = new TabsController();
  private firstTimeout: number = 3000;
  private secondTimeout: number = 5000;
  private first2secondDuration: number = 2000;
  private second2thirdDuration: number = 5000;
  private first2thirdDuration: number = 2000;
  private baseCustomAnimation: (from: number, to: number) => TabContentAnimatedTransition = (from: number, to: number) => {
    if ((from === 0 && to === 1) || (from === 1 && to === 0)) {
      // 缩放动画
      let firstCustomTransition = {
        timeout: this.firstTimeout,
        transition: (proxy: TabContentTransitionProxy) => {
          if (proxy.from === 0 && proxy.to === 1) {
            this.tabContent0Scale = 1.0
            this.tabContent1Scale = 0.5
          } else {
            this.tabContent0Scale = 0.5
            this.tabContent1Scale = 1.0
          }

          animateTo({
            duration: this.first2secondDuration,
            onFinish: () => {
              proxy.finishTransition()
            }
          }, () => {
            if (proxy.from === 0 && proxy.to === 1) {
              this.tabContent0Scale = 0.5
              this.tabContent1Scale = 1.0
            } else {
              this.tabContent0Scale = 1.0
              this.tabContent1Scale = 0.5
            }
          })
        }
      } as TabContentAnimatedTransition;
      return firstCustomTransition;
    } else {
      // 透明度动画
      let secondCustomTransition = {
        timeout: this.secondTimeout,
        transition: (proxy: TabContentTransitionProxy) => {
          if ((proxy.from === 1 && proxy.to === 2) || (proxy.from === 2 && proxy.to === 1)) {
            if (proxy.from === 1 && proxy.to === 2) {
              this.tabContent1Opacity = 1.0
              this.tabContent2Opacity = 0.5
            } else {
              this.tabContent1Opacity = 0.5
              this.tabContent2Opacity = 1.0
            }
            animateTo({
              duration: this.second2thirdDuration,
              onFinish: () => {
                proxy.finishTransition()
              }
            }, () => {
              if (proxy.from === 1 && proxy.to === 2) {
                this.tabContent1Opacity = 0.5
                this.tabContent2Opacity = 1.0
              } else {
                this.tabContent1Opacity = 1.0
                this.tabContent2Opacity = 0.5
              }
            })
          } else if ((proxy.from === 0 && proxy.to === 2) || (proxy.from === 2 && proxy.to === 0)) {
            if (proxy.from === 0 && proxy.to === 2) {
              this.tabContent0Opacity = 1.0
              this.tabContent2Opacity = 0.5
            } else {
              this.tabContent0Opacity = 0.5
              this.tabContent2Opacity = 1.0
            }
            animateTo({
              duration: this.first2thirdDuration,
              onFinish: () => {
                proxy.finishTransition()
              }
            }, () => {
              if (proxy.from === 0 && proxy.to === 2) {
                this.tabContent0Opacity = 0.5
                this.tabContent2Opacity = 1.0
              } else {
                this.tabContent0Opacity = 1.0
                this.tabContent2Opacity = 0.5
              }
            })
          }
        }
      } as TabContentAnimatedTransition;
      return secondCustomTransition;
    }
  }

  build() {
    Column() {
      Text(this.text).id('TabsApi_text1')
      Tabs({ controller: this.tabsController }) {
        TabContent() {
          Text("Red")
        }
        .tabBar("Red")
        .scale({ x: this.tabContent0Scale, y: this.tabContent0Scale })
        .backgroundColor(Color.Red)
        .opacity(this.tabContent0Opacity)
        .width(100)
        .height(100)

        TabContent() {
          Text("Yellow")
        }
        .tabBar("Yellow")
        .scale({ x: this.tabContent1Scale, y: this.tabContent1Scale })
        .backgroundColor(Color.Yellow)
        .opacity(this.tabContent1Opacity)
        .width(200)
        .height(200)

        TabContent() {
          Text("Blue")
        }
        .tabBar("Blue")
        .backgroundColor(Color.Blue)
        .opacity(this.tabContent2Opacity)
        .width(300)
        .height(300)

      }
      .backgroundColor(0xf1f3f5)
      .width('100%')
      .height(500)
      .margin({ top: 5 })
      .customContentTransition(this.useCustomAnimation ? this.baseCustomAnimation : undefined)
      .barMode(BarMode.Scrollable)
      .onChange((index: number) => {
        this.text = 'onChange'
      })
    }
  }
}