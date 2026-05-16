'use static'
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */



import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  Scroll,
  $r,
  ColumnOptions
} from '@kit.ArkUI';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import {
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonItemOptionsArray,
  SegmentButtonTextItem,
  SegmentButtonIconItem,
  SegmentButtonIconTextItem
} from '@ohos.arkui.advanced.SegmentButton';

@Entry
@Component
struct SegmentButtonIndex {
  @State tabOpts: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '按钮1' } as SegmentButtonTextItem,
      { text: '按钮2' } as SegmentButtonTextItem,
      { text: '按钮3' } as SegmentButtonTextItem
    ]
  })
  @State selectedIndexes: int[] = [0]

  // 每个操作对应一个 @State label，Button 既是触发器也是结果显示
  @State mCreateText: string = 'create_text_init'
  @State mCreateIcon: string = 'create_icon_init'
  @State mCreateIconText: string = 'create_icontext_init'
  @State mPush2: string = 'push2_init'
  @State mPush3: string = 'push3_init'
  @State mPop: string = 'pop_init'
  @State mShift: string = 'shift_init'
  @State mUnshift1: string = 'unshift1_init'
  @State mUnshift2: string = 'unshift2_init'
  @State mUnshift3: string = 'unshift3_init'
  @State mSpliceDel: string = 'splice_del_init'
  @State mSpliceIns: string = 'splice_ins_init'

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('SegmentButtonIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 25 } as ColumnOptions) {
          Button(this.mCreateText)
            .id('btnCreateText')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              this.mCreateText = 'create_text:' + arr.length;
            })

          Button(this.mCreateIcon)
            .id('btnCreateIcon')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') } as SegmentButtonIconItem,
                { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') } as SegmentButtonIconItem
              ] as Array<SegmentButtonIconItem>);
              this.mCreateIcon = 'create_icon:' + arr.length;
            })

          Button(this.mCreateIconText)
            .id('btnCreateIconText')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock'), text: 'A' } as SegmentButtonIconTextItem,
                { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock'), text: 'B' } as SegmentButtonIconTextItem
              ] as Array<SegmentButtonIconTextItem>);
              this.mCreateIconText = 'create_icontext:' + arr.length;
            })

          // --- push 系列：操作 SegmentButtonOptions.buttons ---
          Button(this.mPush2)
            .id('btnPush2')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              let newLen: int = arr.push(
                { text: 'C' } as SegmentButtonTextItem,
                { text: 'D' } as SegmentButtonTextItem
              );
              this.mPush2 = 'push2:' + newLen;
            })

          Button(this.mPush3)
            .id('btnPush3')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              let newLen: int = arr.push(
                { text: 'C' } as SegmentButtonTextItem,
                { text: 'D' } as SegmentButtonTextItem,
                { text: 'E' } as SegmentButtonTextItem
              );
              this.mPush3 = 'push3:' + newLen;
            })

          // --- pop/shift ---
          Button(this.mPop)
            .id('btnPop')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem,
                { text: 'C' } as SegmentButtonTextItem,
                { text: 'D' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              arr.pop();
              this.mPop = 'pop:' + arr.length;
            })

          Button(this.mShift)
            .id('btnShift')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem,
                { text: 'C' } as SegmentButtonTextItem,
                { text: 'D' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              arr.shift();
              this.mShift = 'shift:' + arr.length;
            })

          // --- unshift 系列 ---
          Button(this.mUnshift1)
            .id('btnUnshift1')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              let newLen: int = arr.unshift({ text: 'Z' } as SegmentButtonTextItem);
              this.mUnshift1 = 'unshift1:' + newLen;
            })

          Button(this.mUnshift2)
            .id('btnUnshift2')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              let newLen: int = arr.unshift(
                { text: 'Y' } as SegmentButtonTextItem,
                { text: 'Z' } as SegmentButtonTextItem
              );
              this.mUnshift2 = 'unshift2:' + newLen;
            })

          Button(this.mUnshift3)
            .id('btnUnshift3')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              let newLen: int = arr.unshift(
                { text: 'X' } as SegmentButtonTextItem,
                { text: 'Y' } as SegmentButtonTextItem,
                { text: 'Z' } as SegmentButtonTextItem
              );
              this.mUnshift3 = 'unshift3:' + newLen;
            })

          // --- splice 系列 ---
          Button(this.mSpliceDel)
            .id('btnSpliceDel')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem,
                { text: 'C' } as SegmentButtonTextItem,
                { text: 'D' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              this.mSpliceDel = 'splice_del:' + arr.splice(1, 2).length + ':' + arr.length;
            })

          Button(this.mSpliceIns)
            .id('btnSpliceIns')
            .height('3%')
            .onClick(() => {
              let arr = SegmentButtonItemOptionsArray.create([
                { text: 'A' } as SegmentButtonTextItem,
                { text: 'B' } as SegmentButtonTextItem,
                { text: 'C' } as SegmentButtonTextItem,
                { text: 'D' } as SegmentButtonTextItem
              ] as Array<SegmentButtonTextItem>);
              arr.push({ text: 'X' } as SegmentButtonTextItem);
              this.mSpliceIns = 'splice_ins:' + arr.splice(1, 1).length + ':' + arr.length;
            })

          // 真实 SegmentButton 组件
          SegmentButton({
            options: this.tabOpts,
            selectedIndexes: this.selectedIndexes
          })
        }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
