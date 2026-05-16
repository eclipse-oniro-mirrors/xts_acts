'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  SideBarContainer,
  ButtonStyle,
  DividerStyle,
  ButtonIconOptions,
  $r,
  AttributeModifier,
  SideBarPosition,
  SideBarContainerAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier1 implements AttributeModifier<SideBarContainerAttribute> {
  public isUndefined1: boolean = true;
  public isUndefined3: boolean = true;
  public isUndefined4: boolean = true;
  public isUndefined5: boolean = true;
  public isUndefined6: boolean = true;
  public isUndefined7: boolean = true;

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance
      .autoHide(this.isUndefined1 ? undefined : false)
      .maxSideBarWidth(this.isUndefined3 ? undefined : 30.0)
      .minContentWidth(this.isUndefined4 ? undefined : 200.0)
      .minSideBarWidth(this.isUndefined5 ? undefined : 10.0)
      .showControlButton(this.isUndefined6 ? undefined : false)
      .divider(this.isUndefined7 ? undefined : { strokeWidth: 4 } as DividerStyle)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<SideBarContainerAttribute> {
  public isUndefined2: boolean = true;

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance
      .controlButton(this.isUndefined2 ? undefined : {
        icons: {
          shown: $r('app.media.startIcon'),
          hidden: $r('app.media.startIcon'),
          switching: $r('app.media.startIcon')
        } as ButtonIconOptions
      } as ButtonStyle)
  }
}

@Observed
export class MyModifier3 implements AttributeModifier<SideBarContainerAttribute> {
  public isUndefined8: boolean = true;

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance
      .divider(this.isUndefined8 ? undefined : null)
  }
}

@Observed
export class MyModifier4 implements AttributeModifier<SideBarContainerAttribute> {
  public isUndefined9: boolean = true;
  public isUndefined10: boolean = true;
  public isUndefined11: boolean = true;

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance
      .sideBarWidth(this.isUndefined9 ? undefined : 150 as number)
      .showSideBar(this.isUndefined10 ? undefined : false)
      .sideBarPosition(this.isUndefined11 ? undefined : SideBarPosition.End)
  }
}

@Entry
@Component
struct Index {
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();
  @State myModifier3: MyModifier3 = new MyModifier3();
  @State myModifier4: MyModifier4 = new MyModifier4();
  build() {
    Column({ space: 5 } as ColumnOptions) {
      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBarM_1')
      .width('100%')
      .height('10%')
      .borderWidth(1)
      .attributeModifier(this.myModifier1)

      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBarM_2')
      .autoHide(false)
      .attributeModifier(this.myModifier2)
      .width('100%')
      .height('10%')
      .borderWidth(1)

      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBarM_3')
      .autoHide(false)
      .attributeModifier(this.myModifier3)
      .width('100%')
      .height('10%')
      .borderWidth(1)

      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBarM_4')
      .attributeModifier(this.myModifier4)
      .width('100%')
      .height('10%')
      .borderWidth(1)

      Row() {
        Button('btn1 : ' + this.myModifier1.isUndefined1)
          .id('SideBarM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined1 = !this.myModifier1.isUndefined1
          })
        Button('btn2 : ' + this.myModifier2.isUndefined2)
          .id('SideBarM_btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier2.isUndefined2 = !this.myModifier2.isUndefined2
          })
        Button('btn3 : ' + this.myModifier1.isUndefined3)
          .id('SideBarM_btn3')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined3 = !this.myModifier1.isUndefined3
          })
      }

      Row() {
        Button('btn4 : ' + this.myModifier1.isUndefined4)
          .id('SideBarM_btn4')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined4 = !this.myModifier1.isUndefined4
          })
        Button('btn5 : ' + this.myModifier1.isUndefined5)
          .id('SideBarM_btn5')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined5 = !this.myModifier1.isUndefined5
          })
        Button('btn6 : ' + this.myModifier1.isUndefined6)
          .id('SideBarM_btn6')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined6 = !this.myModifier1.isUndefined6
          })
      }

      Row() {
        Button('btn7 : ' + this.myModifier1.isUndefined7)
          .id('SideBarM_btn7')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined7 = !this.myModifier1.isUndefined7
          })
        Button('btn8 : ' + this.myModifier3.isUndefined8)
          .id('SideBarM_btn8')
          .onClick((e: ClickEvent) => {
            this.myModifier3.isUndefined8 = !this.myModifier3.isUndefined8
          })
      }

      Row() {
        Button('btn9 : ' + this.myModifier4.isUndefined9)
          .id('SideBarM_btn9')
          .onClick((e: ClickEvent) => {
            this.myModifier4.isUndefined9 = !this.myModifier4.isUndefined9
          })
        Button('btn10 : ' + this.myModifier4.isUndefined10)
          .id('SideBarM_btn10')
          .onClick((e: ClickEvent) => {
            this.myModifier4.isUndefined10 = !this.myModifier4.isUndefined10
          })
        Button('btn11 : ' + this.myModifier4.isUndefined11)
          .id('SideBarM_btn11')
          .onClick((e: ClickEvent) => {
            this.myModifier4.isUndefined11 = !this.myModifier4.isUndefined11
          })
      }
    }.width('100%').height('100%')

  }
}