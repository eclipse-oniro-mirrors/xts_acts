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
struct LongPressGestureExample {
  @State X: number = 0;
  @State name: string = 'LongPressGesture';
  @State StepTips: string = '操作步骤：手指长按图像'+'\n'+'预期结果：长按动作触发计数增加，显示计数可大于10';
  @State Vue: boolean = false;
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Scroll() {
        Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.img")).height('60%').width('60%')
      }
      .height('350vp').width('350vp').padding(20)
      .gesture(
      LongPressGesture({ repeat: true })
        .onAction((event: GestureEvent) => {
          if (event.repeat) {
            this.X++;
            if(this.X >= 10){
              this.Vue = true;
            }
          }
        })
        .onActionEnd(() => {
          this.X = 0;
        })
      )
      Text('长按动作连续触发:' + this.X).fontColor(Color.Black)
        }
      }.scrollBarWidth('6vp').scrollBarColor('#cccccc')
    }.width('100%').height('80%').backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/ArkUI/ArkUI_index',
        content: this.specificNoParam,
        StepTips: this.StepTips,
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