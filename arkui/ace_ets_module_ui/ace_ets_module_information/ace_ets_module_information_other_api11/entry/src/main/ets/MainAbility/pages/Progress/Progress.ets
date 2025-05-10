/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct progressTest {
  @State progress: ProgressMask = new ProgressMask(10.0, 100.0, 0x01006CDE);
  @State progress_default: ProgressMask = new ProgressMask(10.0, 100.0, $r('sys.color.ohos_id_color_mask_regular'));


  build() {
    Row() {
      Column() {
        List({ space: 0, initialIndex: 0 }) {
          ListItem() {
            Image($r('app.media.icon'))
              .key("ArkUX_Stage_Progress_updateColor")
              .mask(this.progress)
              .backgroundColor(Color.Pink)
              .width('90%')
              .height('6%')
          }

          ListItem() {
            Image($r('app.media.icon'))
              .key("ArkUX_Stage_Progress_updateColor_default")
              .mask(this.progress_default)
              .backgroundColor(Color.Pink)
              .width('90%')
              .height('6%')
          }

          ListItem() {
            Button("updateColor_restore")
              .key("ArkUX_Stage_Progress_updateColor_restore")
              .onClick((event: ClickEvent) => {
                console.info('ArkUX_Stage_Progress_updateColor_restore onClick');
                this.progress.updateColor(Color.Gray);
              })
              .fontSize(6).height('6%').padding(2)
          }

          ListItem() {
            Row() {
              Button("updateColor_0100")
                .key("ArkUX_Stage_Progress_updateColor_Button_0100")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0100 onClick');
                  this.progress.updateColor(0x00ff00);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_0200")
                .key("ArkUX_Stage_Progress_updateColor_Button_0200")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0200 onClick');
                  this.progress.updateColor("#FFFD0000");
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_0300")
                .key("ArkUX_Stage_Progress_updateColor_Button_0300")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0300 onClick');
                  this.progress.updateColor("#FF8A2BE2");
                })
                .fontSize(6).height('6%').padding(2)
            }
          }

          ListItem() {
            Row() {
              Button("updateColor_0400")
                .key("ArkUX_Stage_Progress_updateColor_Button_0400")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0400 onClick');
                  this.progress.updateColor(Color.Pink);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_0500")
                .key("ArkUX_Stage_Progress_updateColor_Button_0500")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0500 onClick');
                  this.progress.updateColor($r("app.color.Progress_updateColor"));
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_0600")
                .key("ArkUX_Stage_Progress_updateColor_Button_0600")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0600 onClick');
                  this.progress.updateColor(0xff006cde);
                })
                .fontSize(6).height('6%').padding(2)
            }
          }

          ListItem() {
            Row() {
              Button("updateColor_0700")
                .key("ArkUX_Stage_Progress_updateColor_Button_0700")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0700 onClick');
                  this.progress.updateColor("#33006cde");
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_0800")
                .key("ArkUX_Stage_Progress_updateColor_Button_0800")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0800 onClick');
                  this.progress.updateColor("rgba(0,108,222,0.8)");
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_0900")
                .key("ArkUX_Stage_Progress_updateColor_Button_0900")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_0900 onClick');
                  this.progress.updateColor($r("app.color.Progress_updateColor_transparency"));
                })
                .fontSize(6).height('6%').padding(2)
            }
          }

          ListItem() {
            Row() {
              Button("updateColor_1000")
                .key("ArkUX_Stage_Progress_updateColor_Button_1000")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_1000 onClick');
                  this.progress.updateColor("");
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_1100")
                .key("ArkUX_Stage_Progress_updateColor_Button_1100")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_1100 onClick');
                  this.progress.updateColor(null);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_1200")
                .key("ArkUX_Stage_Progress_updateColor_Button_1200")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_1200 onClick');
                  this.progress.updateColor(undefined);
                })
                .fontSize(6).height('6%').padding(2)
            }
          }

          ListItem() {
            Row() {
              Button("updateColor_1300")
                .key("ArkUX_Stage_Progress_updateColor_Button_1300")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_1300 onClick');
                  this.progress.updateColor('bgr(138,43,226)');
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_1400")
                .key("ArkUX_Stage_Progress_updateColor_Button_1400")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_1400 onClick');
                  this.progress.updateColor("rgba(0,108,222,70)");
                  this.progress.updateColor(Color.Pink);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateColor_1500")
                .key("ArkUX_Stage_Progress_updateColor_Button_1500")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_1500 onClick');
                  this.progress.updateColor("rgba(0,108,222,70)");
                  this.progress.updateColor(undefined);
                })
                .fontSize(6).height('6%').padding(2)
            }
          }

          ListItem() {
            Row() {
              Button("updateColor_1600")
                .key("ArkUX_Stage_Progress_updateColor_Button_1600")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateColor_Button_1600 onClick');
                  this.progress.updateColor(0x00ff00);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateProgress_0100")
                .key("ArkUX_Stage_Progress_updateProgress_Button_0100")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateProgress_Button_0100 onClick');
                  this.progress.updateProgress(0);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateProgress_0200")
                .key("ArkUX_Stage_Progress_updateProgress_Button_0200")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateProgress_Button_0200 onClick');
                  this.progress.updateProgress(5);
                })
                .fontSize(6).height('6%').padding(2)
            }
          }

          ListItem() {
            Row() {
              Button("updateProgress_0500")
                .key("ArkUX_Stage_Progress_updateProgress_Button_0500")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateProgress_Button_0500 onClick');
                  this.progress.updateProgress(null);
                })
                .fontSize(6).height('6%').padding(2)
            }
          }

          ListItem() {
            Row() {
              Button("updateProgress_0600")
                .key("ArkUX_Stage_Progress_updateProgress_Button_0600")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateProgress_Button_0600 onClick');
                  this.progress.updateProgress(undefined);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateProgress_0700")
                .key("ArkUX_Stage_Progress_updateProgress_Button_0700")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateProgress_Button_0700 onClick');
                  this.progress.updateProgress(-2);
                })
                .fontSize(6).height('6%').padding(2)
            }
          }

          ListItem() {
            Row() {
              Button("updateProgress_0900")
                .key("ArkUX_Stage_Progress_updateProgress_Button_0900")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateProgress_Button_0900 onClick');
                  this.progress.updateProgress(9);
                  this.progress.updateProgress(1);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateProgress_1000")
                .key("ArkUX_Stage_Progress_updateProgress_Button_1000")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateProgress_Button_1000 onClick');
                  this.progress.updateProgress(4);
                  this.progress.updateProgress(null);
                })
                .fontSize(6).height('6%').padding(2)
              Button("updateProgress_1100")
                .key("ArkUX_Stage_Progress_updateProgress_Button_1100")
                .onClick((event: ClickEvent) => {
                  console.info('ArkUX_Stage_Progress_updateProgress_Button_1100 onClick');
                  this.progress.updateProgress(-2);
                  this.progress.updateProgress(5);
                })
                .fontSize(6).height('6%').padding(2)
            }
          }
        }.width('80%')
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}
