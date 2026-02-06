'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  BlurStyle,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  Component,
  CustomBuilder,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  ItemAlign,
  Length,
  Margin,
  SheetDismiss,
  SheetSize,
  SheetType,
  Text,
  TripleLengthDetents
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

interface TheTitle {
  title: string
  subtitle: string
}

@Entry
@Component
struct Index {
  @State isShow: boolean = false;
  @State isShow2: boolean = false;
  @State showDragBar: boolean = true;
  @State detents1: Array<SheetSize> = [SheetSize.LARGE, SheetSize.MEDIUM, SheetSize.MEDIUM] as Array<SheetSize>;
  @State blurStyle1: BlurStyle = BlurStyle.Thin;
  @State showClose1: boolean = false;
  @State title1: TheTitle = { title: "323", subtitle: "156" } as TheTitle;
  @State preferType1: SheetType = SheetType.POPUP;
  @State detents2: Array<SheetSize | number | undefined> =
    [SheetSize.MEDIUM, SheetSize.LARGE, 100] as Array<SheetSize | number | undefined>;
  @State blurStyle2: BlurStyle = BlurStyle.Thick;
  @State showClose2: boolean = true;
  @State title2: TheTitle = { title: "title", subtitle: "subtitle" } as TheTitle;
  @State preferType2: SheetType = SheetType.CENTER;
  @State detents3: Array<SheetSize | number | undefined> =
    [100, 100, SheetSize.LARGE] as Array<SheetSize | number | undefined>;
  @State blurStyle3: BlurStyle = BlurStyle.Regular;
  @State showClose3: boolean = false;
  @State title3: TheTitle = { title: "asdasd", subtitle: "1232561" } as TheTitle;
  @State preferType3: SheetType = SheetType.POPUP;
  @State detents4: Array<number> = [0, 0, 0] as Array<number>;
  @State blurStyle4: BlurStyle = BlurStyle.BACKGROUND_REGULAR;
  @State showClose4: boolean = true;
  @State title4: TheTitle = { title: " ", subtitle: " " } as TheTitle;
  @State preferType4: SheetType = SheetType.CENTER;
  @State detents5: Array<SheetSize | number | undefined> =
    [undefined, undefined, undefined] as Array<SheetSize | number | undefined>;
  @State blurStyle5: string = " ";
  @State showClose5: string = " ";
  @State title5: TheTitle = { title: " ", subtitle: " " } as TheTitle;
  @State preferType5: string = " ";
  @State detents6: Array<SheetSize | number | undefined> =
    [SheetSize.LARGE, 10000, SheetSize.MEDIUM] as Array<SheetSize | number | undefined>;
  @State blurStyle6: BlurStyle = BlurStyle.BACKGROUND_THIN;
  @State showClose6: boolean = false;
  @State title6: TheTitle = { title: "标题", subtitle: "文字" } as TheTitle;
  @State preferType6: SheetType = SheetType.POPUP;
  @State detents7: Array<SheetSize | number | undefined> = [0, 100, 12345] as Array<SheetSize | number | undefined>;
  @State blurStyle7: BlurStyle = BlurStyle.BACKGROUND_ULTRA_THICK;
  @State showClose7: boolean = false;
  @State title7: TheTitle = { title: "@@@", subtitle: "+++" } as TheTitle;
  @State preferType7: SheetType = SheetType.POPUP;
  @State detents8: Array<SheetSize | number | undefined> =
    [54321, 11111, 123456] as Array<SheetSize | number | undefined>;
  @State blurStyle8: BlurStyle = BlurStyle.NONE;
  @State showClose8: boolean = true;
  @State title8: TheTitle = { title: "。。。", subtitle: "，，，" } as TheTitle;
  @State preferType8: SheetType = SheetType.CENTER;
  @State shouldDismiss: boolean = true;
  @State enableOutsideInteractive: boolean = false;
  @State enableOutsideInteractive1: boolean = true;



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
        .margin({ top: 100 } as Margin)
        .onClick((e: ClickEvent) => {
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
              } as Record<String,RecordData>
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10150,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0150 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0150 emit action state err: " + JSON.stringify((err as Error)?.message));
          }
        })
      .bindSheet(true, this.myBuilder, {
        detents: [SheetSize.MEDIUM, SheetSize.LARGE, 100] as TripleLengthDetents,
        blurStyle: BlurStyle.Thick,
        showClose: true,
        title: { title: "title", subtitle: "subtitle" },
        preferType: SheetType.CENTER,
        enableOutsideInteractive: false,
        shouldDismiss: ((sheetDismiss: SheetDismiss) => {
          sheetDismiss.dismiss();
          console.log("bind sheet shouldDismiss");
        })
      })


      Button('ArkUX_Model_Visual_0160')
        .width(200)
        .key('ArkUX_Model_Visual_0160')
        .margin({ top: 100 } as Margin)
        .onClick((e: ClickEvent) => {
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
              } as Record<String,RecordData>
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10160,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0160 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0160 emit action state err: " + JSON.stringify((err as Error)?.message));
          }
        })
      .bindSheet(true, this.myBuilder, {
        detents: [SheetSize.LARGE, SheetSize.MEDIUM, SheetSize.MEDIUM] as TripleLengthDetents,
        blurStyle: BlurStyle.Thin,
        showClose: false,
        title: { title: "323", subtitle: "156" },
        preferType: SheetType.POPUP,
        enableOutsideInteractive: true,
        shouldDismiss: ((sheetDismiss:SheetDismiss) => {
          sheetDismiss.dismiss();
          console.log("bind sheet shouldDismiss")
        })
      })

      Button('ArkUX_Model_Visual_0170')
        .width(200)
        .key('ArkUX_Model_Visual_0170')
        .margin({ top: 100 } as Margin)
        .onClick((e: ClickEvent) => {
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
              } as Record<String,RecordData>
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10170,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0170 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0170 emit action state err: " + JSON.stringify((err as Error)?.message));
          }
        })
      .bindSheet(true, this.myBuilder, {
        detents: [100, 100, SheetSize.LARGE] as TripleLengthDetents,
        blurStyle: BlurStyle.Regular,
        showClose: false,
        maskColor: Color.Green,
        title: { title: "asdasd", subtitle: "1232561" },
        preferType: SheetType.POPUP,
        enableOutsideInteractive: undefined,
        shouldDismiss: ((sheetDismiss:SheetDismiss) => {
          sheetDismiss.dismiss();
          console.log("bind sheet shouldDismiss")
        })
      })

      Button('ArkUX_Model_Visual_0180')
        .width(200)
        .key('ArkUX_Model_Visual_0180')
        .margin({ top: 100 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents4,
                "blurStyle": this.blurStyle4,
                "showClose": this.showClose4,
                "title": this.title4,
                "preferType": this.preferType4,
                "shouldDismiss": this.shouldDismiss,
              } as Record<String,RecordData>
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10180,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0180 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0180 emit action state err: " + JSON.stringify((err as Error)?.message));
          }
        })
      .bindSheet(true, this.myBuilder, {
        detents: [0, 0, 0] as TripleLengthDetents,
        blurStyle: BlurStyle.BACKGROUND_REGULAR,
        showClose: true,
        maskColor: Color.Green,
        title: { title: " ", subtitle: " " },
        preferType: SheetType.CENTER,
        shouldDismiss: ((sheetDismiss:SheetDismiss) => {
          sheetDismiss.dismiss();
          console.log("bind sheet shouldDismiss")
        })
      })

      Button('ArkUX_Model_Visual_0190')
        .width(200)
        .key('ArkUX_Model_Visual_0190')
        .margin({ top: 100 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents5,
                "blurStyle": this.blurStyle5,
                "showClose": this.showClose5,
                "title": this.title5,
                "preferType": this.preferType5,
                "shouldDismiss": this.shouldDismiss,
              } as Record<String,RecordData>
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10190,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0190 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0190 emit action state err: " + JSON.stringify((err as Error)?.message));
          }
        })
      .bindSheet(true, this.myBuilder, {
        detents: [0, 0, 0] as TripleLengthDetents,   //null
        blurStyle: undefined,
        showClose: undefined,
        maskColor: Color.Green,
        title: { title: 'undefined', subtitle: 'undefined' },
        preferType: undefined,
        shouldDismiss: ((sheetDismiss:SheetDismiss) => {

        })
      })

      Button('ArkUX_Model_Visual_0200')
        .width(200)
        .key('ArkUX_Model_Visual_0200')
        .margin({ top: 100 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents6,
                "blurStyle": this.blurStyle6,
                "showClose": this.showClose6,
                "title": this.title6,
                "preferType": this.preferType6,
                "shouldDismiss": this.shouldDismiss,
              } as Record<String,RecordData>
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10200,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0200 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0200 emit action state err: " + JSON.stringify((err as Error)?.message));
          }
        })
      .bindSheet(true, this.myBuilder, {
        detents: [SheetSize.LARGE, 10000, SheetSize.MEDIUM] as TripleLengthDetents,
        blurStyle: BlurStyle.BACKGROUND_THIN,
        showClose: false,
        maskColor: Color.Green,
        title: { title: "标题", subtitle: "文字" },
        preferType: SheetType.POPUP,
        shouldDismiss: ((sheetDismiss:SheetDismiss) => {
          sheetDismiss.dismiss();
          console.log("bind sheet shouldDismiss");
        })
      })

      Button('ArkUX_Model_Visual_0210')
        .width(200)
        .key('ArkUX_Model_Visual_0210')
        .margin({ top: 100 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents7,
                "blurStyle": this.blurStyle7,
                "showClose": this.showClose7,
                "title": this.title7,
                "preferType": this.preferType7,
                "shouldDismiss": this.shouldDismiss,
              } as Record<String,RecordData>
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10210,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0210 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0210 emit action state err: " + JSON.stringify((err as Error)?.message));
          }
        })
      .bindSheet(true, this.myBuilder, {
        detents: [0, 100, 12345] as TripleLengthDetents,
        blurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
        showClose: false,
        maskColor: Color.Green,
        title: { title: "@@@", subtitle: "+++" },
        preferType: SheetType.POPUP,
        shouldDismiss: ((sheetDismiss:SheetDismiss) => {
          sheetDismiss.dismiss();
          console.log("bind sheet shouldDismiss");
        })
      });

      Button('ArkUX_Model_Visual_0220')
        .width(200)
        .key('ArkUX_Model_Visual_0220')
        .margin({ top: 100 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            let backData: emitter.EventData = {
              data: {
                "detents": this.detents8,
                "blurStyle": this.blurStyle8,
                "showClose": this.showClose8,
                "title": this.title8,
                "preferType": this.preferType8,
                "shouldDismiss": this.shouldDismiss,
              } as Record<String,RecordData>
            };
            let backEvent: emitter.InnerEvent = {
              eventId: 10220,
              priority: emitter.EventPriority.LOW
            };
            console.info("ArkUX_Model_Visual_0220 start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (err) {
            console.info("ArkUX_Model_Visual_0220 emit action state err: " + JSON.stringify((err as Error)?.message));
          }
        })
      .bindSheet(true, this.myBuilder, {
        detents: [54321, 11111, 123456] as TripleLengthDetents,
        blurStyle: BlurStyle.NONE,
        showClose: true,
        maskColor: Color.Green,
        title: { title: "。。。", subtitle: "，，，" },
        preferType: SheetType.CENTER,
        shouldDismiss: ((sheetDismiss:SheetDismiss) => {
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