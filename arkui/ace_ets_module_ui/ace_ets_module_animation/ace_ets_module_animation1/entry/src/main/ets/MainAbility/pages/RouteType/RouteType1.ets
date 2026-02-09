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
struct RouteType1 {
  @State scale1: number = 1;
  @State opacity1: number = 1;

  build() {
    Column() {
      Navigator({ target: 'pages/RouteType2', type: NavigationType.Push }) {
        Image($r('app.media.icon'))
          .width('100%')
          .height('100%') // 图片存放在media文件夹下
      }
    }
    .scale({ x: this.scale1 })
    .opacity(this.opacity1)
  }

  // 自定义方式1：完全自定义转场过程的效果
  pageTransition() {
    PageTransitionEnter({ type: RouteType.Pop, duration: 1200, curve: Curve.Linear })
      .onEnter((type: RouteType, progress: number) => {
        this.scale1 = 1
        this.opacity1 = progress
      }) // 进场过程中会逐帧触发onEnter回调，入参为动效的归一化进度(0% -- 100%)
    PageTransitionExit({ duration: 1200, curve: Curve.Ease })
      .onExit((type: RouteType, progress: number) => {
        this.scale1 = 1 - progress
        this.opacity1 = 1
      }) // 退场过程中会逐帧触发onExit回调，入参为动效的归一化进度(0% -- 100%)
  }
}