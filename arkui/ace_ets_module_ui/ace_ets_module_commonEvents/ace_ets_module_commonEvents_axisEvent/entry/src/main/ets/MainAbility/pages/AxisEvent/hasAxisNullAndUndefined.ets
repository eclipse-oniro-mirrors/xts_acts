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
struct HasAxisTest {
  @State hasAxisNull: boolean = false
  @State hasAxisUndefined: boolean = false
  @State axisEventReceived: boolean = false

  build() {
    Column({ space: '1%' }) {
      Text('AxisEvent HasAxis Test')
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .height('10%')
      // 测试null参数
      Row() {
        Text('Null Axis:').width('30%')
        Text(this.hasAxisNull ? 'true' : 'false').width('20%')
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('nullAxis')

      // 测试undefined参数
      Row() {
        Text('Undefined Axis:').width('30%')
        Text(this.hasAxisUndefined ? 'true' : 'false').width('20%')
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('undefinedAxis')

      // 事件接收状态
      Row() {
        Text('Event Received:').width('30%')
        Text(this.axisEventReceived ? 'true' : 'false').width('20%')
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('eventReceived')


      Button('Test Null Axis')
        .width('90%')
        .height('8%')
        .key('testNull')
        .onClick(() => {
          // 重置状态
          this.resetStates();
        })
        .onAxisEvent((event: AxisEvent) => {
          if (event) {
            this.axisEventReceived = true;
            try {
              // 测试null参数
              this.hasAxisNull = event.hasAxis(null);
              console.log('aaa' + this.hasAxisNull)
              AppStorage.setOrCreate('nullAxisResult', this.hasAxisNull);
            } catch (error) {
              this.hasAxisNull = false;
              AppStorage.setOrCreate('nullAxisResult', false);
              AppStorage.setOrCreate('nullAxisError', error.message);
            }
          }
        })

      Button('Test Undefined Axis')
        .width('90%')
        .height('8%')
        .key('testUndefined')
        .onClick(() => {
          // 重置状态
          this.resetStates();
        })
        .onAxisEvent((event: AxisEvent) => {
          if (event) {
            this.axisEventReceived = true;
            try {
              // 测试undefined参数

              this.hasAxisUndefined = event.hasAxis(undefined);
              console.log('aaa' + this.hasAxisUndefined)
              AppStorage.setOrCreate('undefinedAxisResult', this.hasAxisUndefined);
            } catch (error) {
              this.hasAxisUndefined = false;
              AppStorage.setOrCreate('undefinedAxisResult', false);
              AppStorage.setOrCreate('undefinedAxisError', error.message);
            }
          }
        })

      Button('Reset States')
        .width('90%')
        .height('8%')
        .key('resetStates')
        .onClick(() => {
          this.resetStates();
        })
    }
    .width('100%')
    .height('90%')
  }

  private resetStates(): void {
    this.hasAxisNull = false;
    this.hasAxisUndefined = false;
    this.axisEventReceived = false;
    AppStorage.clear();
  }
}