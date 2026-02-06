'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { LengthMetrics } from '@ohos.arkui.node';
import mediaquery from '@ohos.mediaquery'
import display from '@ohos.display'
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Row,
  Margin,
  TextAlign,
  Button,
  ClickEvent,
  MenuItemConfiguration,
  WrappedBuilder,
  ContentModifier,
  GestureEvent,
  SymbolGlyphModifier,
  SelectOption,
  NavDestination,
  AvoidanceMode,
  ArrowPosition,
  FlexAlign,
  VerticalAlign,
  Image,
  SymbolGlyph,
  Padding,
  Builder,
  wrapBuilder,
  Select,
  RowOptions,
  Position,
  PanGesture,
  MenuAlignType,
  Curve,
  SelectAttribute,
  AttributeModifier
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export class MyMenuAvoidanceModifier implements AttributeModifier<SelectAttribute> {
  public avoidanceModeArr: (AvoidanceMode | undefined)[] =
    [undefined,  AvoidanceMode.COVER_TARGET, AvoidanceMode.AVOID_AROUND_TARGET] as (AvoidanceMode | undefined)[];
  public modeIndex: int = 0;

  constructor() {
  }

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.avoidance(this.avoidanceModeArr[this.modeIndex]);
  }
}

@Entry
@Component
export struct ModifierPage {
  @State private text: string = 'TTTTT';
  @State private index: int = 2;
  @State private space: number = 8;
  @State private arrowPosition: ArrowPosition = ArrowPosition.END;
  @State private positionX: number = 0;
  @State private positionY: number = 72;
  @State private myModifier: MyMenuAvoidanceModifier = new MyMenuAvoidanceModifier();
  @State private selectOptions: SelectOption[] = [
    {
      value: 'aaa',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
    } as SelectOption,
    {
      value: 'bbb',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
    } as SelectOption,
    {
      value: 'ccc',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
    } as SelectOption,
    {
      value: 'bbb',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    } as SelectOption,
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ddd',
    } as SelectOption
  ];
  private displayWidth: number = 0;
  private displayHeight: number = 0;
  private listener: mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync('(orientation: landscape)') // 监听横屏事件

  aboutToAppear(): void {
    try {
      this.updateDisplay();
      this.listener.onChange((mediaQueryResult: mediaquery.MediaQueryResult) => {
        this.updateDisplay();
      })
    } catch (e) {
      console.error('')
    }
  }

  private updateDisplay(): void {
    let mainWindow = AppStorage.get<window.Window>('mainWindow');
    let windowProp = mainWindow?.getWindowProperties();
    const uiContext = new UIContext()
    this.displayWidth = uiContext.px2vp(windowProp?.windowRect?.width ?? 0) ?? 0.0;
    this.displayHeight = uiContext.px2vp(windowProp?.windowRect?.height ?? 0) ?? 0.0;
  }

  private getVoidModeText(mode?: AvoidanceMode): string {
    let result: string = '';
    if (mode === undefined) {
      result = 'undefined';
    } else if (mode === AvoidanceMode.COVER_TARGET) {
      result = 'COVER_TARGET';
    } else if (mode === AvoidanceMode.AVOID_AROUND_TARGET) {
      result = 'AVOID_AROUND_TARGET';
    }
    return result;
  }

  build() {
    NavDestination() {
      Column() {
        // 横屏竖屏切换按钮
        Row({ space: 16 } as RowOptions) {
          Button('横屏')
            .layoutWeight(1)
            .onClick((e: ClickEvent) => {
              let ctx =  this.getUIContext().getHostContext() as common.UIAbilityContext;
              window.getLastWindow(ctx).then((data) => {
                data.setPreferredOrientation(window.Orientation.LANDSCAPE);
              });
            })
          Button('竖屏')
            .layoutWeight(1)
            .onClick((e: ClickEvent) => {
              let ctx = this.getUIContext().getHostContext() as common.UIAbilityContext;
              window.getLastWindow(ctx).then((data) => {
                data.setPreferredOrientation(window.Orientation.PORTRAIT);
              });
            })
            .onClick((e: ClickEvent) => {
              let tmp: int = ++this.myModifier.modeIndex;
              this.myModifier.modeIndex = tmp % this.myModifier.avoidanceModeArr.length;
            })
        }
        .height(56)

        // Select 组件
        Select(this.selectOptions)
          .key('ModifierSelect01')
          .selected(this.index)
          .position({
            x: this.positionX,
            y: this.positionY
          } as Position)
          .backgroundColor(Color.Red)
          .width(200)
          .height(100)
          .value(this.text)
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
          .onSelect((index: int, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .gesture(PanGesture().onActionStart((event: GestureEvent) => {

          })
            .onActionEnd((event: GestureEvent) => {
              let curX: number = this.positionX;
              let curY: number = this.positionY;
              curX += event.offsetX;
              curY += event.offsetY;
              if (curX < 0) {
                curX = 0;
              }

              if (curX > (this.displayWidth - 200)) {
                curX = this.displayWidth - 200;
              }

              if (curY < 0) {
                curY = 0;
              }

              if (curY > (this.displayHeight - 222)) {
                curY = this.displayHeight - 222;
              }
              this.getUIContext()?.animateTo({
                duration: 200,
                curve: Curve.EaseInOut
              }, () => {
                this.positionX = curX;
                this.positionY = curY;
              })
            }))
          .attributeModifier(this.myModifier)
      }
      .width('100%')
      .height('100%')
    }
    .title('ModifierPage')

  }
}
