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
// import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import {
  $rawfile,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomBuilder,
  DragItemInfo,
  Entry,
  FlexAlign,
  GestureEvent,
  LongPressGesture,
  Margin,
  PatternLockController,
  Row,
  Scroll,
  Scroller,
  SearchController,
  Select,
  TapGesture,
  Text,
  TouchEvent,
  TouchType,
  Web,
  XComponentController
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct noBarrierComponents {
  scroller: Scroller = new Scroller();
  @State Number1: Array<String> = new Array<String>('0', '1');
  public valueArr: Array<number> = new Array<number>(10, 10);
  @State isLunar: boolean = false;
  @State formId: number = 0;
  @State start: boolean = false;
  @State passwords: Array<number> = new Array<number>();
  @State message: string = 'please input password!';
  @State rating: number = 3.5;
  @State data: string = '<h1 style="text-align: center;">h1标题</h1>';
  @State changeValue: string = '';
  @State submitValue: string = '';
  controller: SearchController = new SearchController();
  @State outSetValueOne: number = 40;
  @State isMilitaryTime: boolean = false;
  // controller1: web_webview.WebviewController = new web_webview.WebviewController();
  xcomponentController: XComponentController = new XComponentController();
  private arr: Array<number> = new Array<number>(0, 1);
  private arrayA: Array<string> = new Array<string>('安')
  private arrayB: Array<string> = new Array<string>('卜', '白', '包', '毕', '丙')
  private arrayC: Array<string> = new Array<string>('曹', '成', '陈', '催')
  private arrayL: Array<string> = new Array<string>('刘', '李', '楼', '梁', '雷', '吕', '柳', '卢')
  private value: Array<string> =
    new Array<string>('#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
      'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z')
  private selectedDate: Date = new Date('2021-08-08');
  private fromStart: boolean = true;
  private step: number = 50;
  private loop: number = Infinity;
  private src: string = "Running Marquee starts rolling";
  private patternLockController: PatternLockController = new PatternLockController();
  private value1: string = 'hello world';
  private selectedTime: Date = new Date('2022-07-22T08:00:00');
  private surfaceId: string = '';

  aboutToAppear() {
    console.log('test start page')
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        Select([{ value: 'aaa', icon: "/common/public_icon.svg" },
          { value: 'bbb', icon: "/common/public_icon.svg" },
          { value: 'ccc', icon: "/common/public_icon.svg" },
          { value: 'ddd', icon: "/common/public_icon.svg" }])
          .selected(2)
          .value('TTTTT')
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .key("Select")
          .accessibilityText("我是无障碍组件")
          .onSelect((index: Int): void => {
            console.info('Select:' + index)
          })

      }
    }
  }
}