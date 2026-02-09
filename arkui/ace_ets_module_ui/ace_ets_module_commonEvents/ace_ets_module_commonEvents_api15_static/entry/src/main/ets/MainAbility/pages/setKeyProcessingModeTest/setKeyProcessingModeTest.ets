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
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  KeyEvent,
  KeyProcessingMode,
  KeyType,
  Row,
  Text
} from '@ohos.arkui.component'

@Entry
@Component
struct setKeyProcessingModeTest {
  @State text: string = '';
  @State index: number = 0;

  build() {
    Row() {
      Column() {
        Column() {
          Column() {
            Button('设置 FOCUS_NAVIGATION')
              .onClick((e: ClickEvent) => {
                this.getUIContext().getFocusController().setKeyProcessingMode(KeyProcessingMode.FOCUS_NAVIGATION)
              }).id('FOCUS_NAVIGATION')
            Button('设置 ANCESTOR_EVENT')
              .onClick((e: ClickEvent) => {
                console.log('test btn click 1')
                this.getUIContext().getFocusController().setKeyProcessingMode(KeyProcessingMode.ANCESTOR_EVENT)
                console.log('test btn click 2')
              }).id('ANCESTOR_EVENT')
            Button('设置 undefined')
              .onClick((e: ClickEvent) => {
                this.getUIContext()
                  .getFocusController()
                  .setKeyProcessingMode(KeyProcessingMode.FOCUS_NAVIGATION) // undefined
              }).id('undefined')
          }

          Text('focus now')
          Text(this.text).id('focus')
          Row() {
            Row() {
              Button('Button1')
                .id('Button1')
                .onKeyEvent(((event: KeyEvent): boolean => {
                  return false;
                }) as ((data: KeyEvent) => Boolean))
                .onFocus(() => {
                  console.log('focus Button1')
                  this.text = 'Button1'
                })
              Button('Button2')
                .id('Button2')
                .onKeyEvent(((event: KeyEvent): boolean => {
                  return false;
                }) as ((data: KeyEvent) => Boolean))
                .onFocus(() => {
                  console.log('focus Button2')
                  this.text = 'Button2'
                })
              Button('Button3')
                .id('Button3')
                .onKeyEvent(((event: KeyEvent): boolean => {
                  return true;
                }) as ((data: KeyEvent) => Boolean))
                .onFocus(() => {
                  console.log('focus Button3')
                  this.text = 'Button3'
                })
            }.onKeyEvent(((event: KeyEvent): boolean => {
              return false;
            }) as ((data: KeyEvent) => Boolean))
          }
          .onKeyEvent(((event: KeyEvent): boolean => {
            return true;
          }) as ((data: KeyEvent) => Boolean))
          .id('ButtonRow2')
        }
        .id('Column1')

        .onKeyEventDispatch((event: KeyEvent): boolean => {
          let context = this.getUIContext();
          if (event.type == KeyType.Down) {
            context.getFocusController().requestFocus('ButtonRow2')
            let ret = context.dispatchKeyEvent('ButtonRow2', event);
            this.index++
            return ret;
          }
          return false;
        })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .width('100%')
  }
}