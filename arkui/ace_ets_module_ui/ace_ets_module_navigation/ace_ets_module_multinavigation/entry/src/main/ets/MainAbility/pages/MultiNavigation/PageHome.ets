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
 
import { MultiNavPathStack, SplitPolicy } from '@ohos.arkui.advanced.MultiNavigation';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Component
export struct PageHome {
  @State message: string = 'PageHome';
  @Consume('pageStack') pageStack: MultiNavPathStack;
  @State mode: NavDestinationMode = NavDestinationMode.STANDARD;

  build() {
    if (this.log()) {
      NavDestination() {
        Column() {
          Scroll(){
            Column() {
              Text(this.message)
                .id('homeText')
                .fontSize(10)
                .height('8%')
              Button('change').onClick(() => {
                this.mode = NavDestinationMode.DIALOG
              })
                .height('8%')
              Button('replacePathFalse')
                .onClick(() => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.replacePath({name:'PageDetail'}, true);
                  }
                })
                .height('8%')
                .id('replacePathFalseId')
              Button('replacePathLaunchMode')
                .onClick(() => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.replacePath({name:'PageDetail'}, { launchMode: LaunchMode.STANDARD, animated: false });
                  }
                })
                .height('8%')
                .id('replacePathLaunchModeId')
              Button('replacePathByName')
                .onClick(() => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.replacePathByName('PageDetail', 'testParam', true);
                  }
                })
                .height('8%')
                .id('replacePathByNameId')
              Button('pushPathByName')
                .onClick(() => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.pushPathByName('PageDetail', 'testParam', true);
                  }
                })
                .height('8%')
                .id('pushPathByNameId')
            }.backgroundColor(0xFFFFFF).width('100%').padding(10).borderRadius(15)
          }
          .width('100%')
        }
        .width('100%')
        .height('92%')
      }.hideTitleBar(true).mode(this.mode)
    }
  }

  log(): boolean {
    hilog.info(0x0000, 'demotest', 'PageHome build called');
    return true;
  }
}