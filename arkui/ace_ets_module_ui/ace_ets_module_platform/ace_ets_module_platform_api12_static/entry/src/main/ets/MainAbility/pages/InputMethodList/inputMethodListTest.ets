'use static';
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
import { Entry,Column,Component,Button,EmbeddedType,CustomDialogController,DialogAlignment,EmbeddedComponent,VideoController,ColumnOptions,Row,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
//import { InputMethodListDialog, Pattern,PatternOptions } from '@ohos.inputMethodList';

@Entry
@Component
export struct inputMethodListTest {
  @State defaultPattern: number = 1;
  // private oneHandAction: PatternOptions = {
  //   defaultSelected: this.defaultPattern,
  //   patterns: [
  //     {
  //       icon: $r('app.media.icon'),
  //       selectedIcon: $r('app.media.icon')
  //     },
  //     {
  //       icon: $r('app.media.icon'),
  //       selectedIcon: $r('app.media.icon')
  //     },
  //     {
  //       icon: $r('app.media.icon'),
  //       selectedIcon: $r('app.media.icon')
  //     }],
  //   action:(index: number)=>{
  //     console.info(`pattern is changed, current is ${index}`);
  //     this.defaultPattern = index;
  //   }
  // };

  // private listController: CustomDialogController = new CustomDialogController({
  //   builder: InputMethodListDialog({ patternOptions: this.oneHandAction }),
  //   customStyle: true,
  //   alignment:DialogAlignment.Center,
  //   maskColor: '#00000000'
  // });

  build() {
    Column({space:10} as ColumnOptions){
      Text('' + this.defaultPattern).fontSize(16).id('inputMethodListTest_text')
      Column({space:10} as ColumnOptions) {
        Text("输入法切换列表").fontSize(20)
      }
      .width('100vp')
      .height('50vp')
      .borderWidth(1)
      .id('inputMethodListTest_col')
      .onClick((event: ClickEvent) => {
        // this.listController.open();
      })
    }.width('100%')
  }
}