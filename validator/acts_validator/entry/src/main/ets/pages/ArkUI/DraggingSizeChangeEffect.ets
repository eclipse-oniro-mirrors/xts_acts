/**

 Copyright (c) 2025 Huawei Device Co., Ltd.
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';

const TAG = '[DraggingSizeChangeEffect]';

@Entry
@Component
struct DraggingSizeChangeEffectExample {
  @State text: string = ''
  @State axisValue: string = ''
  @State name: string = 'DraggingSizeChangeEffect';
  @State Vue: boolean = false;
  @State intervalNum: number = 0;
  @State hoverMoveText: string = '';
  @State StepTips: string = '操作步骤：分别拖拽以下4组图片' + '\n' + '预期结果：动画效果与描述一致，指示灯亮起，结果为True'
  @State uri: string = ""
  @State AblockArr: string[] = []
  @State BblockArr: string[] = []
  @State AVisible: Visibility = Visibility.Visible
  @State dragSuccess: Boolean = false
  @State drag1: Boolean = false
  @State drag2: Boolean = false
  @State drag3: Boolean = false
  @State drag4: Boolean = false
  private iconStr: ResourceStr = $r("app.media.icon")

  aboutToAppear(): void {

    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  aboutToDisappear(): void {

    clearInterval(this.intervalNum)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  onPageShow() {

    this.intervalNum = setInterval(() => {
      if (this.dragSuccess) {
        this.Vue = true
      }
    }, 500)
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {

      })
    } else {
      Button({ stateEffect: this.Vue }) {
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
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  @Builder
  MyPreview() {
    Image($r('app.media.image'))
      .width(200)
      .height(200)
  }

  @Builder
  MyMenuPreviewSame() {
    Column() {
      Image($r('app.media.image'))
        .width(300)
        .height(300)
    }
  }

  @Builder
  MyMenuPreview() {
    Column() {
      Image($r('app.media.image'))
        .width(100)
        .height(100)
    }
    .backgroundColor(Color.Green)
    .width(300)
    .height(300)
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
    }
  }

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
    }
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
          })
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

    Scroll() {
          Column({space: "2%"}) {
            Text("sizeChangeEffect: DEFAULT，长按弹出菜单，拖拽移动后菜单预览图直接到最终跟手图")
              .width('100%')
            Image($r('app.media.image'))
              .width('25%')
              .height('15%')
              .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
                preview: this.MyMenuPreviewSame
              })
              .dragPreview(this.MyPreview)
              .dragPreviewOptions({
                sizeChangeEffect: DraggingSizeChangeEffect.DEFAULT
              })
              .draggable(true)
              .onDragStart(() => {
              })
              .onDragEnd(() => {
                this.drag1 = true
              })

            Text("sizeChangeEffect: SIZE_TRANSITION，长按弹出菜单，拖拽移动后菜单预览图过渡到跟手图，有缩放无叠加效果")
              .width('100%')
            Image($r('app.media.image'))
              .width('25%')
              .height('15%')
              .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
                preview: this.MyMenuPreviewSame
              })
              .dragPreview(this.MyPreview)
              .dragPreviewOptions({
                sizeChangeEffect: DraggingSizeChangeEffect.SIZE_TRANSITION
              })
              .draggable(true)
              .onDragStart(() => {
              })
              .onDragEnd(() => {
                this.drag2 = true
              })

            Text("sizeChangeEffect: SIZE_CONTENT_TRANSITION，长按弹出菜单，拖拽移动后菜单预览图和拖拽跟手图两层叠加过渡")
              .width('100%')
            Image($r('app.media.image'))
              .width('25%')
              .height('15%')
              .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
                preview: this.MyMenuPreview
              })
              .dragPreview(this.MyPreview)
              .dragPreviewOptions({
                sizeChangeEffect: DraggingSizeChangeEffect.SIZE_CONTENT_TRANSITION
              })
              .onDragStart(() => {
              })
              .draggable(true)
              .onDragEnd(() => {
                this.drag3 = true
              })

            Text("ENABLE_TOUCH_POINT_CALCULATION_BASED_ON_FINAL_PREVIEW,长按弹出菜单，拖拽移动以拖拽预览图初始尺寸计算跟手点位置")
              .width('100%')
            Image($r('app.media.image'))
              .width('25%')
              .height('15%')
              .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
                preview: this.MyMenuPreview
              })
              .dragPreview(this.MyPreview)
              .draggable(true)
              .dragPreviewOptions({
                mode: [DragPreviewMode.ENABLE_TOUCH_POINT_CALCULATION_BASED_ON_FINAL_PREVIEW]
              })
              .onDragStart(() => {
              })
              .onDragEnd(() => {
                this.drag4 = true
                if (this.drag1 == true && this.drag2 == true && this.drag3 == true && this.drag4 == true) {
                  this.dragSuccess = true
                }
              })
          }.height('100%')
          .width('100%')
          .backgroundColor(Color.White)
      }.height('80%')
       .width('100%')
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
              message: this.StepTips,
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

    }.height('100%').width('100%')
    .backgroundColor('#F1F3F5')
  }
}