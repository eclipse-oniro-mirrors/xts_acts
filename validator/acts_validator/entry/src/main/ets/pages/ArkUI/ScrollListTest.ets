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
import { CustomContainer } from '../common/CustomContainer';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct CustomContainerUser {
  private listArr: number[] = Array.from(new Array(50).keys());
  @State name: string = 'ScrollingList';
  @State StepTips: string = '操作步骤：滑动列表观察是否能上下滑动' + '\n'
    + '预期结果：列表从Item#1滑动至Item#50，并且从#Item50滑动至#Item1，滑动正常，无卡顿';
  @State Vue: boolean = false;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    this.Vue = true;
  }

  @Builder
  specificNoParam() {
    Column() {
      List() {
        ForEach(this.listArr, (index: number) => {
          ListItem() {
            Text('Item #' + (index + 1))
              .width('100%')
              .height(50)
              .fontSize(16)
              .fontColor(Color.White)
              .margin({ left: '10vp' })
          }
        })
      }
      .height('100%')
      .width('100%')
      .divider({ strokeWidth: 1, color: Color.Grey })
    }
    .height('83%')
    .width('100%')
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/ArkUI/ArkUI_index',
        StepTips: this.StepTips,
        content: this.specificNoParam.bind(this),
        name: $name,
        Vue: $Vue,
      }).margin({ bottom: '20vp' })
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
