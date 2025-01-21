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
import {CustomContainer} from '../common/CustomContainer3';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SwipeGestureTest {
  @State X : number = 0;
  @State Y : number = 0;
  @State name: string = 'SwipeGesture';
  @State StepTips: string = '操作步骤：手指上下滑动图像'+'\n'+'预期结果：图片正常滑动，手势滑动角度及速度显示正常';
  @State Vue: boolean = false;
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.img")).height('60%').width('60%')
      }
      .height('350vp').width('350vp').padding(20)
      .rotate({x: 0, y: 0, z: 1, angle: this.X})
      .gesture(
      SwipeGesture({fingers: 1, direction: SwipeDirection.Vertical})
        .onAction((event: GestureEvent) => {
          this.Y = event.speed;
          this.X = event.angle;
          this.Vue = true;
        })
      )
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Text("滑动手势速度 ： " + this.Y)
        Text("滑动手势角度 ： " + this.X)
      }.height('15%').width('100%').padding(20)
    }
    .width('100%').height('80%').backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/ArkUI/ArkUI_index',
        StepTips: this.StepTips,
        content: this.specificNoParam,
        X: $X, Y: $Y,
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

