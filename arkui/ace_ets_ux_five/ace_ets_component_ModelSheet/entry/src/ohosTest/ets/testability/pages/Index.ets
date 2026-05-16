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
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';

interface Title1 { 
  title: string,
  subtitle: string
}

@Entry
@Component
struct Index {
  @State isShow: boolean = false;
  @State isShow2: boolean = false;
  @State showDragBar: boolean = true;
  @State detents1: Object = [SheetSize.LARGE, SheetSize.MEDIUM, SheetSize.MEDIUM];
  @State blurStyle1: Object = BlurStyle.Thin;
  @State showClose1: Object = false;
  @State title1: Title1 = { title: "323", subtitle: "156" };
  @State preferType1: Object = SheetType.POPUP;
  @State detents2: Object = [SheetSize.MEDIUM, SheetSize.LARGE, 100];
  @State blurStyle2: Object = BlurStyle.Thick;
  @State showClose2: Object = true;
  @State title2: Title1 = { title: "title", subtitle: "subtitle" };
  @State preferType2: Object = SheetType.CENTER;
  @State detents3: Object = [100, 100, SheetSize.LARGE];
  @State blurStyle3: Object = BlurStyle.Regular;
  @State showClose3: Object = false;
  @State title3: Title1 = { title: "asdasd", subtitle: "1232561" };
  @State preferType3: Object = SheetType.POPUP;
  @State detents4: Object = [0, 0, 0];
  @State blurStyle4: Object = BlurStyle.BACKGROUND_REGULAR;
  @State showClose4: Object = true;
  @State title4: Title1 = { title: " ", subtitle: " " };
  @State preferType4: Object = SheetType.CENTER;
  @State detents5: Object = [, ,];
  @State blurStyle5: Object = " ";
  @State showClose5: Object = " ";
  @State title5: Title1 = { title: " ", subtitle: " " };
  @State preferType5: Object = " ";
  @State detents6: Object = [SheetSize.LARGE, 10000, SheetSize.MEDIUM];
  @State blurStyle6: Object = BlurStyle.BACKGROUND_THIN;
  @State showClose6: Object = false;
  @State title6: Title1 = { title: "标题", subtitle: "文字" };
  @State preferType6: Object = SheetType.POPUP;
  @State detents7: Object = [0, 100, 12345];
  @State blurStyle7: Object = BlurStyle.BACKGROUND_ULTRA_THICK;
  @State showClose7: Object = false;
  @State title7: Title1 = { title: "@@@", subtitle: "+++" };
  @State preferType7: Object = SheetType.POPUP;
  @State detents8: Object = [54321, 11111, 123456];
  @State blurStyle8: Object = BlurStyle.NONE;
  @State showClose8: Object = true;
  @State title8: Title1 = { title: "。。。", subtitle: "，，，" };
  @State preferType8: Object = SheetType.CENTER;
  @State shouldDismiss: Object = true;
  @State enableOutsideInteractive: boolean = false;
  @State enableOutsideInteractive1: boolean = true;

  aboutToAppear() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  @Builder
  myBuilder() {
    Column() {
      Button("content11111111111111111")
        .margin(10)
        .fontSize(20)

      Button("content222222222222222222")
        .margin(10)
        .fontSize(20)
    }
    .width('100%')
  }

  @Builder
  titleBuilder() {
    Column() {
      Button("title11111111111111111")
        .fontSize(20)
        .margin(10)
        .backgroundColor(Color.Pink)
    }
  }

  build() {
    Column() {
      Button('ArkUX_Model_Visual_0150')
        .width(200)
        .key('ArkUX_Model_Visual_0150')
        .margin({ top: 100 })
        .onClick(() => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents1,
                "blurStyle": this.blurStyle1,
                "showClose": this.showClose1,
                "title": this.title1,
                "preferType": this.preferType1,
                "shouldDismiss": this.shouldDismiss,
                "enableOutsideInteractive": this.enableOutsideInteractive,
              }
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10150,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0150 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0150 emit action state err: " + JSON.stringify(err.message));
          }
        })
        .bindSheet(true, this.myBuilder(), {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 100],
          blurStyle: BlurStyle.Thick,
          showClose: true,
          title: { title: "title", subtitle: "subtitle" },
          preferType: SheetType.CENTER,
          enableOutsideInteractive: false,
          shouldDismiss: ((sheetDismiss) => {
            sheetDismiss.dismiss();
            console.log("bind sheet shouldDismiss");
          })
        })


      Button('ArkUX_Model_Visual_0160')
        .width(200)
        .key('ArkUX_Model_Visual_0160')
        .margin({ top: 100 })
        .onClick(() => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents2,
                "blurStyle": this.blurStyle2,
                "showClose": this.showClose2,
                "title": this.title2,
                "preferType": this.preferType2,
                "shouldDismiss": this.shouldDismiss,
                "enableOutsideInteractive": this.enableOutsideInteractive1,
              }
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10160,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0160 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0160 emit action state err: " + JSON.stringify(err.message));
          }
        })
        .bindSheet(true, this.myBuilder(), {
          detents: [SheetSize.LARGE, SheetSize.MEDIUM, SheetSize.MEDIUM],
          blurStyle: BlurStyle.Thin,
          showClose: false,
          title: { title: "323", subtitle: "156" },
          preferType: SheetType.POPUP,
          enableOutsideInteractive: true,
          shouldDismiss: ((sheetDismiss) => {
            sheetDismiss.dismiss();
            console.log("bind sheet shouldDismiss")
          })
        })

      Button('ArkUX_Model_Visual_0170')
        .width(200)
        .key('ArkUX_Model_Visual_0170')
        .margin({ top: 100 })
        .onClick(() => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents3,
                "blurStyle": this.blurStyle3,
                "showClose": this.showClose3,
                "title": this.title3,
                "preferType": this.preferType3,
                "shouldDismiss": this.shouldDismiss,
                "enableOutsideInteractive": this.enableOutsideInteractive,
              }
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10170,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0170 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0170 emit action state err: " + JSON.stringify(err.message));
          }
        })
        .bindSheet(true, this.myBuilder(), {
          detents: [100, 100, SheetSize.LARGE],
          blurStyle: BlurStyle.Regular,
          showClose: false,
          maskColor: Color.Green,
          title: { title: "asdasd", subtitle: "1232561" },
          preferType: SheetType.POPUP,
          enableOutsideInteractive: null,
          shouldDismiss: ((sheetDismiss) => {
            sheetDismiss.dismiss();
            console.log("bind sheet shouldDismiss")
          })
        })

      Button('ArkUX_Model_Visual_0180')
        .width(200)
        .key('ArkUX_Model_Visual_0180')
        .margin({ top: 100 })
        .onClick(() => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents4,
                "blurStyle": this.blurStyle4,
                "showClose": this.showClose4,
                "title": this.title4,
                "preferType": this.preferType4,
                "shouldDismiss": this.shouldDismiss,
              }
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10180,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0180 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0180 emit action state err: " + JSON.stringify(err.message));
          }
        })
        .bindSheet(true, this.myBuilder(), {
          detents: [0, 0, 0],
          blurStyle: BlurStyle.BACKGROUND_REGULAR,
          showClose: true,
          maskColor: Color.Green,
          title: { title: " ", subtitle: " " },
          preferType: SheetType.CENTER,
          shouldDismiss: ((sheetDismiss) => {
            sheetDismiss.dismiss();
            console.log("bind sheet shouldDismiss")
          })
        })

      Button('ArkUX_Model_Visual_0190')
        .width(200)
        .key('ArkUX_Model_Visual_0190')
        .margin({ top: 100 })
        .onClick(() => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents5,
                "blurStyle": this.blurStyle5,
                "showClose": this.showClose5,
                "title": this.title5,
                "preferType": this.preferType5,
                "shouldDismiss": this.shouldDismiss,
              }
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10190,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0190 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0190 emit action state err: " + JSON.stringify(err.message));
          }
        })
        .bindSheet(true, this.myBuilder(), {
          detents: [null, null, null],
          blurStyle: null,
          showClose: null,
          maskColor: Color.Green,
          title: { title: null, subtitle: null },
          preferType: null,
          shouldDismiss: (null)
        })

      Button('ArkUX_Model_Visual_0200')
        .width(200)
        .key('ArkUX_Model_Visual_0200')
        .margin({ top: 100 })
        .onClick(() => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents6,
                "blurStyle": this.blurStyle6,
                "showClose": this.showClose6,
                "title": this.title6,
                "preferType": this.preferType6,
                "shouldDismiss": this.shouldDismiss,
              }
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10200,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0200 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0200 emit action state err: " + JSON.stringify(err.message));
          }
        })
        .bindSheet(true, this.myBuilder(), {
          detents: [SheetSize.LARGE, 10000, SheetSize.MEDIUM],
          blurStyle: BlurStyle.BACKGROUND_THIN,
          showClose: false,
          maskColor: Color.Green,
          title: { title: "标题", subtitle: "文字" },
          preferType: SheetType.POPUP,
          shouldDismiss: ((sheetDismiss) => {
            sheetDismiss.dismiss();
            console.log("bind sheet shouldDismiss");
          })
        })

      Button('ArkUX_Model_Visual_0210')
        .width(200)
        .key('ArkUX_Model_Visual_0210')
        .margin({ top: 100 })
        .onClick(() => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents7,
                "blurStyle": this.blurStyle7,
                "showClose": this.showClose7,
                "title": this.title7,
                "preferType": this.preferType7,
                "shouldDismiss": this.shouldDismiss,
              }
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10210,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0210 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0210 emit action state err: " + JSON.stringify(err.message));
          }
        })
        .bindSheet(true, this.myBuilder(), {
          detents: [0, 100, 12345],
          blurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
          showClose: false,
          maskColor: Color.Green,
          title: { title: "@@@", subtitle: "+++" },
          preferType: SheetType.POPUP,
          shouldDismiss: ((sheetDismiss) => {
            sheetDismiss.dismiss();
            console.log("bind sheet shouldDismiss");
          })
        });

      Button('ArkUX_Model_Visual_0220')
        .width(200)
        .key('ArkUX_Model_Visual_0220')
        .margin({ top: 100 })
        .onClick(() => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents8,
                "blurStyle": this.blurStyle8,
                "showClose": this.showClose8,
                "title": this.title8,
                "preferType": this.preferType8,
                "shouldDismiss": this.shouldDismiss,
              }
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10220,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0220 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0220 emit action state err: " + JSON.stringify(err.message));
          }
        })
        .bindSheet(true, this.myBuilder(), {
          detents: [54321, 11111, 123456],
          blurStyle: BlurStyle.NONE,
          showClose: true,
          maskColor: Color.Green,
          title: { title: "。。。", subtitle: "，，，" },
          preferType: SheetType.CENTER,
          shouldDismiss: ((sheetDismiss) => {
            sheetDismiss.dismiss();
            console.log("bind sheet shouldDismiss");
          })
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}