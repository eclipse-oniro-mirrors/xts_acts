/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { ComponentContent } from '@kit.ArkUI';

@Builder function placeholderPage() {
  Column() {
    Text('分栏模式占位页')
      .fontSize(28)
      .fontWeight(700)
      .margin({ top: 200 })
  }.width('100%')
  .height('100%')
}

@Entry
@Component
struct NavigationDivider {
  @State minNavBarWidth: Dimension | undefined = undefined;
  @State maxNavBarWidth: Dimension | undefined = undefined;
  @State minContentWidth: Dimension|undefined = undefined;
  placeholder = new ComponentContent(this.getUIContext(), wrapBuilder(placeholderPage))

  build() {
    Column() {
      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width('50%')
          .height('10%')
          .backgroundColor('#FFFFFF')
          .margin({ top: 8 })
        Button('get').id('getDivider').onClick(() => {
          let strJson = getInspectorByKey('navigationId');
          console.info('[NavigationDivider_0010] styleDivider value :' + JSON.stringify(JSON.parse(strJson).$attrs.divider));
          let styleDivider: NavigationDividerStyle = JSON.parse(strJson).$attrs.divider;
          let colorValue: ResourceColor | undefined = styleDivider?.color;
          let endMarginValue: Length | undefined = styleDivider?.endMargin;
          let startMarginValue: Length | undefined = styleDivider?.startMargin;
          console.info('[NavigationDivider_0010] colorValue :' + colorValue);
          console.info('[NavigationDivider_0010] endMarginValue :' + endMarginValue);
          console.info('[NavigationDivider_0010] startMarginValue :' + startMarginValue);
          AppStorage.setOrCreate('colorValue', colorValue);
          AppStorage.setOrCreate('endMarginValue', endMarginValue);
          AppStorage.setOrCreate('startMarginValue', startMarginValue); 
        }).height('10%')
      }
      .title('NavigationTitle')
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Split)
      .navBarWidthRange(['10%', '80%'])
      .minContentWidth('40%')
      .hideTitleBar(false)
      .hideToolBar(false)
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode' + titleModel)
      })
      .id('navigationId')
      .splitPlaceholder(this.placeholder)
      .divider({ startMargin: 20, endMargin: 20, color: Color.Red}) 
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}