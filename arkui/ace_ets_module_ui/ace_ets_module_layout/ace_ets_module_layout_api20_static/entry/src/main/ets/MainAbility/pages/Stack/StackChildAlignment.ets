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
import {
  Entry,
  Column,
  Component,
  Alignment,
  Direction,
  Row,
  Stack,
  Button,
  Text,
  Color
} from '@ohos.arkui.component';
import { State } from "@ohos.arkui.stateManagement"
import { ClickEvent } from '@ohos.arkui.component';

@Entry
@Component
struct StackChildAlignment {
  private stackAlignArr: Alignment[] = [
    Alignment.TopStart, Alignment.Top, Alignment.TopEnd,
    Alignment.Start, Alignment.Center, Alignment.End,
    Alignment.BottomStart, Alignment.Bottom, Alignment.BottomEnd];
  @State stackAlignIndex: number = 0;
  private directionArr: Direction[] = [Direction.Ltr, Direction.Rtl, Direction.Auto];
  @State directionIndex: number = 0;

  build() {
    Row() {
      Column() {
        Stack({
          alignContent: this.stackAlignArr[this.stackAlignIndex.toInt()]
        }) {
          Text('TOP_START')
            .width(60)
            .height(60)
            .fontSize(10)
            .backgroundColor(Color.Yellow)
            .id('AlignmentText1')
          
          Text('TOP')
            .width(60)
            .height(60)
            .fontSize(10)
            .backgroundColor(Color.Yellow)
            .id('AlignmentText2')
          
          Text('TOP_END')
            .width(60)
            .height(60)
            .fontSize(10)
            .backgroundColor(Color.Yellow)
            .id('AlignmentText3')
          

          Text('START')
            .width(60)
            .height(60)
            .backgroundColor(Color.Yellow)
            .fontSize(10)
            .id('AlignmentText4')
          
          Text('CENTER')
            .width(60)
            .height(60)
            .backgroundColor(Color.Yellow)
            .fontSize(10)
            .id('AlignmentText5')
          
          Text('END')
            .width(60)
            .height(60)
            .backgroundColor(Color.Yellow)
            .fontSize(10)
            .id('AlignmentText6')
          

          Text('BOTTOM_START').width(60).height(60).backgroundColor(Color.Yellow).id('AlignmentText7')
          
          Text('BOTTOM').width(60).height(60).backgroundColor(Color.Yellow).id('AlignmentText8')
          
          Text('BOTTOM_END').width(60).height(60).backgroundColor(Color.Yellow).id('AlignmentText9')
          
        }.width(190).height(190).backgroundColor(Color.Grey)
        
        .direction(this.directionArr[this.directionIndex.toInt()])

        Row() {
          Button('stackAlign: ' + this.stackAlignArr[this.stackAlignIndex.toInt()])
            .width(95)
            .height(25)
            .fontSize(10)
            .onClick((e: ClickEvent) => {
              this.stackAlignIndex = ++this.stackAlignIndex % this.stackAlignArr.length;
            })
          Button('Direction: ' + this.directionArr[this.directionIndex.toInt()])
            .width(95)
            .height(25)
            .fontSize(10)
            .onClick((e: ClickEvent) => {
              this.directionIndex = ++this.directionIndex % this.directionArr.length;
            })

        }

      }
      .width('100%')
    }
    .width('100%')
  }
}
