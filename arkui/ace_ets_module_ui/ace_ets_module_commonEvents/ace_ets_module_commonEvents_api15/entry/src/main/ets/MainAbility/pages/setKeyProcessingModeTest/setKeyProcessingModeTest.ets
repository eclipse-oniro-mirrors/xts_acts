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
              .onClick(() => {
                this.getUIContext().getFocusController().setKeyProcessingMode(KeyProcessingMode.FOCUS_NAVIGATION)
              }).id('FOCUS_NAVIGATION')
            Button('设置 ANCESTOR_EVENT')
              .onClick(() => {
                this.getUIContext().getFocusController().setKeyProcessingMode(KeyProcessingMode.ANCESTOR_EVENT)
              }).id('ANCESTOR_EVENT')
            Button('设置 undefined')
              .onClick(() => {
                this.getUIContext().getFocusController().setKeyProcessingMode(undefined)
              }).id('undefined')
          }
          Text('focus now')
          Text(this.text).id('focus')
          Row() {
            Row() {
              Button('Button1')
                .id('Button1')
                .onKeyEvent((event) => {
                  return false;
                })
                .onFocus(()=>{
                  console.log('focus Button1')
                  this.text = 'Button1'
                })
              Button('Button2')
                .id('Button2')
                .onKeyEvent((event) => {
                  return false;
                })
                .onFocus(()=>{
                  console.log('focus Button2')
                  this.text = 'Button2'
                })
              Button('Button3')
                .id('Button3')
                .onKeyEvent((event) => {
                  return true;
                })
                .onFocus(()=>{
                  console.log('focus Button3')
                  this.text = 'Button3'
                })
            }.onKeyEvent((event) => {
              return false;
            })
          }
          .onKeyEvent((event) => {
            return true;
          })
          .id('ButtonRow2')
        }
        .id('Column1')
        .onKeyEventDispatch((event: KeyEvent) => {
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