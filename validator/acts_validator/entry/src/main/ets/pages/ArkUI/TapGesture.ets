/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { CustomContainer } from '../common/CustomContainer4';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct TapGestureExample {
  @State value: string = '';
  @State name: string = 'TapGesture';
  @State StepTips: string = '操作步骤：手指连续双击图像' + '\n' + '预期结果：双击图像后文本提示正常弹出';
  @State Vue: boolean = false;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Flex({
            direction: FlexDirection.Column,
            alignItems: ItemAlign.Center,
            justifyContent: FlexAlign.SpaceBetween
          }) {
            Image($r("app.media.img"))
              .height('60%')
              .width('60%')
          }
          .height('350vp')
          .width('350vp')
          .padding(20)
          .gesture(
            TapGesture({ count: 2 })
              .onAction(() => {
                this.value = 'TapGesture onAction';
                this.Vue = true;
              })
          )

          Text(this.value)
        }
      }
      .scrollBarWidth('6vp')
      .scrollBarColor('#cccccc')
    }
    .width('100%')
    .height('80%')
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        StepTips: this.StepTips,
        Url: 'pages/ArkUI/ArkUI_index',
        content: this.specificNoParam,
        value: $value,
        name: $name,
        Vue: $Vue,
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/ArkUI/ArkUI_index',
    })
  }
}