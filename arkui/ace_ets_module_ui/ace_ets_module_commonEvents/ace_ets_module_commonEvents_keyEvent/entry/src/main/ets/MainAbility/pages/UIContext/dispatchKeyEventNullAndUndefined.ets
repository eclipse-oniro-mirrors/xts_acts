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

import { JSON } from '@kit.ArkTS'

@Entry
@Component
struct UIContextDispatchKeyEvent {
  @State dispatchNodeId: string = ''
  @State dispatchKeyEventText: string = ''
  @State dispatchNullText: string = ''
  @State dispatchUndefinedText: string = ''

  keyEventHandler: Callback<KeyEvent, boolean> = (event: KeyEvent): boolean => {
    console.info('the keyEvent is ' + JSON.stringify(event))
    this.dispatchKeyEventText = 'keyTrigger'
    return true
  }

  dispatchHandler: Callback<KeyEvent, boolean> = (event: KeyEvent): boolean => {
    console.info('the dispatchHandler is ' + JSON.stringify(event))
    this.dispatchNodeId = 'keyResponse'
    let isConsumed = this.getUIContext().dispatchKeyEvent('keyResponse', event);
    AppStorage.setOrCreate('dispatchNodeResult', isConsumed)
    return false;
  }

  nullHandler: Callback<KeyEvent, boolean> = (event: KeyEvent): boolean => {
    console.info('the nullHandler is ' + JSON.stringify(event))
    try {
      let isConsumed = this.getUIContext().dispatchKeyEvent(null, event);
      AppStorage.setOrCreate('dispatchNullResult', isConsumed)
    } catch (error) {
      AppStorage.setOrCreate('dispatchNullResult', false)
      AppStorage.setOrCreate('dispatchNullError', error.message)
    }
    return false;
  }

  undefinedHandler: Callback<KeyEvent, boolean> = (event: KeyEvent): boolean => {
    console.info('the undefinedHandler is ' + JSON.stringify(event))
    try {
      let isConsumed = this.getUIContext().dispatchKeyEvent(undefined, event);
      AppStorage.setOrCreate('dispatchUndefinedResult', isConsumed)
    } catch (error) {
      AppStorage.setOrCreate('dispatchUndefinedResult', false)
      AppStorage.setOrCreate('dispatchUndefinedError', error.message)
    }
    return false;
  }

  build() {
    Column() {
      Text('UIContext dispatchKeyEvent Test')
        .fontWeight(FontWeight.Bold)

      // 测试正常number参数
      Row() {
        Text('Node Result:').width('30%')
        Text(this.dispatchNodeId).width('20%')
      }
      .width('90%')
      .height('8%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('nodeResult')

      // 测试null参数
      Row() {
        Text('Null Result:').width('30%')
        Text(this.dispatchNullText).width('20%')
      }
      .width('90%')
      .height('8%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('nullResult')

      // 测试undefined参数
      Row() {
        Text('Undefined Result:').width('30%')
        Text(this.dispatchUndefinedText).width('20%')
      }
      .width('90%')
      .height('8%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('undefinedResult')

      // 测试按钮 - 分为两列
      Column({ space: 3 }) {
        Row({ space: 3 }) {
          Button('Test Number Node')
            .width('43%')
            .height('7%')
            .key('testNumber')
            .onClick(() => {
              this.resetStates();
            })
            .onKeyEvent(this.dispatchHandler)
            .key('testNode')

          Button('Test String Node')
            .width('43%')
            .height('7%')
            .key('testString')
            .onClick(() => {
              this.resetStates();
            })
            .onKeyEvent(this.dispatchHandler)
            .key('testString')
        }

        Row({ space: 3 }) {
          Button('Test Null Node')
            .width('43%')
            .height('7%')
            .key('testNull')
            .onClick(() => {
              this.resetStates();
            })
            .onKeyEvent(this.nullHandler)

          Button('Test Undefined Node')
            .width('43%')
            .height('7%')
            .key('testUndefined')
            .onClick(() => {
              this.resetStates();
            })
            .onKeyEvent(this.undefinedHandler)
        }

        Row({ space: 3 }) {
          Button('Test Null KeyEvent')
            .width('43%')
            .height('7%')
            .key('testNullKeyEvent')
            .onClick(() => {
              this.resetStates();
            })
            .onKeyEvent((event: KeyEvent) => {
              try {
                let isConsumed = this.getUIContext().dispatchKeyEvent('testNullKeyEvent', null);
                AppStorage.setOrCreate('dispatchNullKeyEventResult', isConsumed)
              } catch (error) {
                AppStorage.setOrCreate('dispatchNullKeyEventResult', false)
                AppStorage.setOrCreate('dispatchNullKeyEventError', error.message)
              }
            })

          Button('Test Undefined KeyEvent')
            .width('43%')
            .height('7%')
            .key('testUndefinedKeyEvent')
            .onClick(() => {
              this.resetStates();
            })
            .onKeyEvent((event: KeyEvent) => {
              try {
                let isConsumed = this.getUIContext().dispatchKeyEvent('testUndefinedKeyEvent', undefined);
                AppStorage.setOrCreate('dispatchUndefinedKeyEventResult', isConsumed)
              } catch (error) {
                AppStorage.setOrCreate('dispatchUndefinedKeyEventResult', false)
                AppStorage.setOrCreate('dispatchUndefinedKeyEventError', error.message)
              }
            })
        }

        Button('Reset States')
          .width('90%')
          .height('7%')
          .key('resetStates')
          .onClick(() => {
            this.resetStates();
          })
      }
    }
    .width('100%')
    .height('100%')
  }

  private resetStates(): void {
    this.dispatchNodeId = ''
    this.dispatchKeyEventText = ''
    this.dispatchNullText = ''
    this.dispatchUndefinedText = ''
    AppStorage.clear();
  }
}