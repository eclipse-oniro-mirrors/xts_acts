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

import { DrawableDescriptor } from '@kit.ArkUI';

@Entry
@Component
struct DrawableTabBarIndicatorPage {
  @State isVertical: boolean = false;
  @State text: string = '文本';
  @State barMode: BarMode = BarMode.Fixed;
  @State pixmapDesc: DrawableDescriptor | null = null;

  async aboutToAppear() {
    const resManager = this.getUIContext().getHostContext()?.resourceManager;
    if (!resManager) {
      return;
    }
    // $r('app.media.indicator')需要替换为开发者所需的图像资源文件。
    let pixmapDescResult = resManager.getDrawableDescriptor($r('app.media.icon').id);
    if (pixmapDescResult) {
      this.pixmapDesc = pixmapDescResult as DrawableDescriptor;
    }
  }

  build() {
    Column() {
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(SubTabBarStyle.of('TabBar1')
          .indicator({
            drawable: this.pixmapDesc,
            height: 10,
            width: '70',
            borderRadius: $r('app.string.indicatorValue'),
            marginTop: 5
          }))
        .id('tabId1')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar(SubTabBarStyle.of('TabBar2')
          .indicator({
            drawable: this.pixmapDesc,
            height: 20,
            width: 70,
            borderRadius: 5,
            marginTop: 5
          }))
          .id('tabId2')
      }
      .height('60%')
      .backgroundColor(0xf1f3f5)
      .barMode(BarMode.Fixed)
      .barHeight(120)
      .vertical(false)
    }
    .width('100%')
    .height(500)
    .padding('24vp')
  }
}
