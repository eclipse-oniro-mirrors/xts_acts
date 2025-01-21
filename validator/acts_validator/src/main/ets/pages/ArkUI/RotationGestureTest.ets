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
import {CustomContainer} from '../common/CustomContainer2';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct RotationGuestureTest {
  @State X: number = 0;
  @State name: string = 'RotationGesture';
  @State StepTips: string = '操作步骤：两根手指旋转图像'+'\n'+'预期结果：图片能够正常旋转且文本旋转角度显示正常';
  @State Vue: boolean = false;
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column(){
      Scroll() {
        Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.img")).height('60%').width('60%')
      }
      .height('350vp').width('350vp').padding(20)
      .rotate({ x:1, y:1, z:1, angle: this.X })
      .margin(80)
      .gesture(
      RotationGesture()
        .onActionUpdate((event: GestureEvent) => {
          this.X = event.angle;
          this.Vue = true;
        })
      )
      Text('旋转角度:' + this.X)
        }
      }.scrollBarWidth('6vp').scrollBarColor('#cccccc')
    }.height('80%').width('100%').backgroundColor(Color.White)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/ArkUI/ArkUI_index',
        StepTips: this.StepTips,
        content: this.specificNoParam,
        X: $X,
        name: $name,
        Vue: $Vue,
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/ArkUI/ArkUI_index',
    })
  }
}