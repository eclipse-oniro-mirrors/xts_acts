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
struct PanGestureExample {
  @State X: number = 0;
  @State Y: number = 0;
  @State name: string = 'PanGesture';
  @State StepTips: string = '操作步骤：手指拖动图像'+'\n'+'预期结果：图片正常拖动，偏移坐标显示正常';
  @State Vue: boolean = false;
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.flower")).height('60%').width('70%')
      }
      .height('250vp').width('350vp').padding(20)
      .margin(80).translate({ x: this.X, y: this.Y, z: 5 })
      .gesture(
      PanGesture({})
        .onActionStart((event: GestureEvent) => {
          console.info('Pan start');
          this.Vue = true;
        })
        .onActionUpdate((event: GestureEvent) => {
          this.X = event.offsetX;
          this.Y = event.offsetY;
        })
        .onActionEnd(() => {
          console.info('Pan end');
        })
      )
      Text('偏移坐标x: ' + this.X + '\n' + '偏移坐标y: ' + this.Y)
    }.width('100%').height('80%').backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/ArkUI/ArkUI_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        X:$X, Y:$Y,
        name:$name,
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
