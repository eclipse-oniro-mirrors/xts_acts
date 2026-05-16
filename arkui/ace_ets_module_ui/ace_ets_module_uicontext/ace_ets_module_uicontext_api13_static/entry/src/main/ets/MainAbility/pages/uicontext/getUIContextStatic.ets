'use static'
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

import { Entry, Text, Column, Component, Button, ClickEvent, TextAlign, Margin, ForEach } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'
import { UIContext } from '@ohos.arkui.UIContext'
import { BusinessError } from '@ohos.base'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'

@Entry
@Component
struct Pages1 {
  @State page1Available: string = 'page1: unknown'
  @State page2Available: string = 'page2: unknown'
  @State currentPage1Available: string = 'current page1: unknown'
  @State savedPage1Available: string = 'saved page1: unknown'
  @State getUiContextIsAvailable: string = 'undefined'
  @State getAllUIContextsInfo: string[] = [] as string[];
  @State getAllUIContextsCount: number = 0;

  checkPage2UIContext() {
    if (AppStorage.has('uiContextPage2')) {
      let uiContextPage2 = AppStorage.get<UIContext>('uiContextPage2');
      if (uiContextPage2) {
        let uicontext = uiContextPage2 as UIContext;
        const isAvailable = uicontext.isAvailable();
        return `${isAvailable ? 'available' : 'unavailable'}`;
      } else {
        return 'page2: UIContext is null';
      }
    } else {
      return 'page2: not found in AppStorage';
    }
  }

  checkSavedPage1UIContext() {
    if (AppStorage.has('uiContextPage1')) {
      let uiContextPage1 = AppStorage.get<UIContext>('uiContextPage1');
      if (uiContextPage1) {
        let uicontext = uiContextPage1 as UIContext;
        const isAvailable = uicontext.isAvailable();
        return `${isAvailable ? 'available' : 'unavailable'}`;
      } else {
        return 'saved page1: UIContext is null';
      }
    } else {
      return 'saved page1: not found in AppStorage';
    }
  }

  checkCurrentPage1UIContext() {
    try {
      // 获取当前页面的UIContext
      const currentUIContext = this.getUIContext();
      if (currentUIContext) {
        const uicontext = currentUIContext as UIContext;
        const isAvailable = uicontext.isAvailable();
        return `${isAvailable ? 'available' : 'unavailable'}`;
      } else {
        return 'current page1: getUIContext() returned null';
      }
    } catch (error) {
      return `current page1: error - ${error.message}`;
    }
  }

  updateUIContextStatus() {
    this.page2Available = this.checkPage2UIContext();
    this.savedPage1Available = this.checkSavedPage1UIContext();
    this.currentPage1Available = this.checkCurrentPage1UIContext();
  }

  build() {
    Column(undefined) {
      Text('page1').id('page1_text001').opacity(0.5)

      // 显示page2 UIContext状态
      Text(this.page2Available)
        .fontSize(14)
        .fontColor('#FF0000')
        .textAlign(TextAlign.Start)
        .width('90%')

      // 显示保存的page1 UIContext状态（旧的）
      Text(this.savedPage1Available)
        .fontSize(14)
        .fontColor('#FFA500') // 橙色表示保存的实例
        .textAlign(TextAlign.Start)
        .width('90%')

      // 显示当前page1 UIContext状态（新的）
      Text(this.currentPage1Available).key('text1')
        .fontSize(14)
        .fontColor('#0000FF') // 蓝色表示当前实例
        .textAlign(TextAlign.Start)
        .width('90%')


      Button('检查保存的page1 uicontext')
        .onClick((e: ClickEvent) => {
          this.savedPage1Available = this.checkSavedPage1UIContext();
        })

      Button('检查当前的page1 uicontext').key('1')
        .onClick((e: ClickEvent) => {
          this.currentPage1Available = this.checkCurrentPage1UIContext();
        })
      Text(this.getUiContextIsAvailable).key('text2')

      Text(`UIContext总数: ${this.getAllUIContextsCount}`)
        .fontSize(14)
        .fontColor('#333333')
        .margin({ top: 10 } as Margin)
        .width('90%')

      // 使用ForEach展示每个UIContext的详细信息
      ForEach(this.getAllUIContextsInfo, (item: string, index: Int) => {
        Text(`${index + 1}. ${item}`)
          .fontSize(12)
          .fontColor(this.getAllUIContextsInfo[index].includes('available=true') ? '#008800' : '#888888')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ top: 2 } as Margin)
      }, (item: string) => item)

      Button('getCallingScopeUIContext').key('2')
        .onClick(() => {
          try {
            let uiContext = UIContext.getCallingScopeUIContext();
            if (uiContext) {
              let isAvailable = uiContext.isAvailable();
              this.getUiContextIsAvailable = `${isAvailable ? 'available' : 'unavailable'}`;
              console.info(`==bihy== getCallingScopeUIContext: id=${uiContext.getId()}, available=${isAvailable}`);
            } else {
              this.getUiContextIsAvailable = 'getCallingScopeUIContext returned null';
              console.info('==bihy== getCallingScopeUIContext returned null');
            }
          } catch (error) {
            console.error(`==bihy== Error in getCallingScopeUIContext: ${error.message}`);
            this.getUiContextIsAvailable = `getCallingScopeUIContext: error - ${error.message}`;
          }
        })

      Button('getLastFocusedUIContext').key('3')
        .onClick(() => {
          try {
            let uiContext = UIContext.getLastFocusedUIContext();
            if (uiContext) {
              let isAvailable = uiContext.isAvailable();
              this.getUiContextIsAvailable = `${isAvailable ? 'available' : 'unavailable'}`;
              console.info(`==bihy== getLastFocusedUIContext: id=${uiContext.getId()}, available=${isAvailable}`);
            } else {
              this.getUiContextIsAvailable = 'getLastFocusedUIContext returned null';
              console.info('==bihy== getLastFocusedUIContext returned null');
            }
          } catch (error) {
            console.error(`==bihy== Error in getLastFocusedUIContext: ${error.message}`);
            this.getUiContextIsAvailable = `getLastFocusedUIContext: error - ${error.message}`;
          }
        })

      Button('getLastForegroundUIContext').key('4')
        .onClick(() => {
          try {
            let uiContext = UIContext.getLastForegroundUIContext();
            if (uiContext) {
              let isAvailable = uiContext.isAvailable();
              this.getUiContextIsAvailable = `${isAvailable ? 'available' : 'unavailable'}`;
            } else {
              this.getUiContextIsAvailable = '==bihy== getLastForegroundUIContext returned null';
            }
          } catch (error) {
            console.error(`==bihy== Error in getLastForegroundUIContext: ${error.message}`);
            this.getUiContextIsAvailable = `getLastForegroundUIContext: error - ${error.message}`;
          }
        })

      Button('getAllUIContexts').key('5')
        .onClick(() => {
          try {
            let uiContexts = UIContext.getAllUIContexts();
            this.getAllUIContextsCount = uiContexts.length;
            console.info(`==bihy== There are ${uiContexts.length} UIContext(s)`);

            if (uiContexts.length > 0) {
              // 清空之前的信息
              this.getAllUIContextsInfo = [];

              for (let i = 0; i < uiContexts.length; i++) {
                let uiContext = uiContexts[i];
                let isAvailable = uiContext.isAvailable();
                let id = uiContext.getId();

                // 创建每个UIContext的信息字符串
                let contextInfo = `UIContext[${i}]: id=${id}, available=${isAvailable}`;

                // 记录到日志
                console.info(`==bihy== ${contextInfo}`);

                // 添加到数组用于显示
                this.getAllUIContextsInfo.push(contextInfo);
              }

              this.getUiContextIsAvailable = `Found UIContext`;
            } else {
              this.getAllUIContextsInfo = ['No UIContext found'];
              this.getUiContextIsAvailable = 'getAllUIContexts: No UIContext found';
            }
          } catch (error) {
            console.error(`==bihy== Error in getAllUIContexts: ${error.message}`);
            this.getUiContextIsAvailable = `getAllUIContexts: error - ${error.message}`;
            this.getAllUIContextsInfo = [`Error: ${error.message}`];
          }
        })

      Button('resolveUIContext').key('6')
        .onClick(() => {
          try {
            let resolvedUIContext = UIContext.resolveUIContext();
            if (resolvedUIContext) {
              let isAvailable = resolvedUIContext.isAvailable();
              this.getUiContextIsAvailable = `${isAvailable ? 'available' : 'unavailable'}`;
              console.info(`==bihy== resolveUIContext: id=${resolvedUIContext.getId()}, available=${isAvailable}`);
            } else {
              this.getUiContextIsAvailable = 'resolveUIContext returned null';
              console.info('==bihy== resolveUIContext returned null');
            }
          } catch (error) {
            console.error(`==bihy== Error in resolveUIContext: ${error.message}`);
            this.getUiContextIsAvailable = `resolveUIContext: error - ${error.message}`;
          }
        })

      Button('清理状态显示')
        .onClick(() => {
          this.getUiContextIsAvailable = '状态已清理';
        })
        .margin({ top: 10 } as Margin)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}