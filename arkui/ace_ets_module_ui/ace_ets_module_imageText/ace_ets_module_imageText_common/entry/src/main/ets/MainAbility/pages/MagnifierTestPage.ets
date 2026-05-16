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
import { Magnifier } from '@kit.ArkUI';

@Entry
@Component
struct MagnifierTestPage {
  private magnifier: Magnifier = this.getUIContext().getMagnifier();
  @State bindResult: string = '未绑定';
  @State showResult: string = '未显示';

  build() {
    Column({ space: 20 }) {
      Text('Magnifier Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .height('5%')

      Text('测试组件')
        .fontSize(16)
        .height('5%')
        .backgroundColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .id('testComponent')

      Row(){
        Text(`绑定状态: ${this.bindResult}`)
          .fontSize(14)

        Text(`显示状态: ${this.showResult}`)
          .fontSize(14)
      } .height('5%')

      Row({ space: 1 }) {
        Button('bind null')
          .id('button_bind_null')
          .onClick(() => {
            try {
              this.magnifier.bind(null);
              AppStorage.setOrCreate('magnifier_bind_null', 'magnifier bind null succ');
              this.bindResult = 'bind null 调用成功';
            } catch (error) {
              this.bindResult = `bind null 抛出异常: ${error}`;
            }
          })

        Button('bind undefined')
          .id('button_bind_undefined')
          .onClick(() => {
            try {
              this.magnifier.bind(undefined);
              AppStorage.setOrCreate('magnifier_bind_undefined', 'magnifier bind undefined succ');
              this.bindResult = 'bind undefined 调用成功';
            } catch (error) {
              this.bindResult = `bind undefined 抛出异常: ${error}`;
            }
          })

        Button('bind empty string')
          .id('button_bind_empty')
          .onClick(() => {
            try {
              this.magnifier.bind('');
              AppStorage.setOrCreate('magnifier_bind_empty', 'magnifier bind empty succ');
              this.bindResult = 'bind empty string 调用成功';
            } catch (error) {
              this.bindResult = `bind empty string 抛出异常: ${error}`;
            }
          })
      }.height('5%')

      Row({ space: 1 }) {
        Button('show null, null')
          .id('button_show_null_null')
          .onClick(() => {
            try {
              this.magnifier.show(null, null);
              AppStorage.setOrCreate('magnifier_show_null_null', 'magnifier show null null succ');
              this.showResult = 'show null, null 调用成功';
            } catch (error) {
              this.showResult = `show null, null 抛出异常: ${error}`;
            }
          })

        Button('show undefined, undefined')
          .id('button_show_undefined_undefined')
          .onClick(() => {
            try {
              this.magnifier.show(undefined, undefined);
              AppStorage.setOrCreate('magnifier_show_undefined_undefined', 'show undefined undefined succ');
              this.showResult = 'show undefined, undefined 调用成功';
            } catch (error) {
              this.showResult = `show undefined, undefined 抛出异常: ${error}`;
            }
          })
      }.height('5%')

      Button('正常绑定和显示')
        .onClick(() => {
          try {
            this.magnifier.bind('testComponent');
            this.bindResult = '正常绑定成功';
            this.magnifier.show(100, 50);
            this.showResult = '正常显示成功';
          } catch (error) {
            this.bindResult = `正常操作失败: ${error}`;
          }
        })

      Button('解绑')
        .onClick(() => {
          try {
            this.magnifier.unbind();
            this.bindResult = '已解绑';
            this.showResult = '已隐藏';
          } catch (error) {
            this.bindResult = `解绑失败: ${error}`;
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
