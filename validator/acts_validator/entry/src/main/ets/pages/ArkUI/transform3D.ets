/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { matrix4 } from '@kit.ArkUI';

const TAG = '[transform3D]';

@Entry
@Component
struct transform3DDemo {
  @State name: string = 'transform3D';
  @State stepTips: string = '操作步骤:\n' + '1.肉眼将第一个黑色Column组件和第二个红色Column组件做对比\n' + 
  '2.肉眼将第一个黑色Column组件和其他所有的蓝色Column组件做对比\n' +
  '预期结果：\n' + '1.红色Column组件的3D效果设置为undefined，组件样式应和黑色组件保持完全一致\n' +
  '2.所有的蓝色Column组件添加了不同的3D样式(如缩放、平移、透视等效果)，组件样式都应和黑色Column组件样式不同\n'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
      Image($r('app.media.ic_public_pass'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'true ', title: this.name,
        }
      })
      promptAction.showToast({
        message: '通过', duration: 1000
      });
    })
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          });
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Scroll() {
          Column({ space: 70 }) {
            Text('\n\n原本组件不设置transform3D')
            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Black)
            
            Text('下面红色Column组件的transform3D属性为undefined，\n应和黑色Column组件样式保持一致')
            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Red)
              .transform3D(undefined)

            Text('下面所有蓝色Column组件都添加了不同的3D样式，\n应和黑色Column组件样式不同')
            Text('组件设置rotate')
            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().rotate({ x: 1, angle: 45 }))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().rotate({ y: 2, angle: -120 }))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().rotate({x: 1, y: 2, z: 3, angle: 90}))

            Text('组件设置scale')
            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().scale({ x: 2 }))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().scale({ y: 0.5 }))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().scale({ x: 2, y: 0.5, z: 2.5 }))

            Text('组件设置translate')
            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().translate({ x: 113.7 }))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().translate({ y: -93 }))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().translate({ x: -93, y: -10, z: 33 }))

            Text('组件设置skew')
            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().skew(0, 0.3))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().skew(1, 0))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().skew(1, 0.3))

            Column()
              .width('150px')
              .height('150px')
              .backgroundColor(Color.Blue)
              .transform3D(matrix4.identity().skew(-1, -0.3))
          }.width('100%')
        }
      }.height('80%')
      .width('100%')
      .backgroundColor(Color.White)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .margin({ bottom: '20vp' })
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.stepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })
        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}