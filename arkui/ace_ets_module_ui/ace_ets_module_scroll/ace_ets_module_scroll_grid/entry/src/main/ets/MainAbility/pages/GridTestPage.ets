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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';

@Entry
@Component
struct GridTestPage {
  @State num: String[] = ['1', '2', '3', '4']
  @State gridDirection: GridDirection = GridDirection.Row
  @State editMode: boolean = false
  @State multiSelectable: boolean = false
  @State itemSelectable: boolean = false

  aboutToAppear(){
  }

  build() {
    Column({ space: 5 }) {
      Grid() {
        ForEach(this.num, (value1: string) => {
          ForEach(this.num, (value2: string) => {
            GridItem({style: GridItemStyle.NONE}) {
              Text(value1+value2)
                .fontSize(25)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .border({width: 1})
            .borderStyle(BorderStyle.Dashed)
            .selectable(this.itemSelectable)
            .enabled((value1+value2)=='32' 
              || (value1+value2)=='33' ? false : true)
            .key('GridItemStyle_NONE_' + value1 + value2)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap('8vp')
      .rowsGap('8vp')
      .width('90%')
      .height(300)
      .layoutDirection(this.gridDirection)
      .editMode(this.editMode)
      .multiSelectable(this.multiSelectable)
      .padding('5vp')
      .key('Grid_GridItemStyle_NONE')

      Grid() {
        ForEach(this.num, (value1: string) => {
          ForEach(this.num, (value2: string) => {
            GridItem({style: GridItemStyle.PLAIN}) {
              Text(value1+value2)
                .fontSize(25)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .border({width: 1})
            .borderStyle(BorderStyle.Dashed)
            .selectable(this.itemSelectable)
            .enabled((value1+value2)=='32' 
              || (value1+value2)=='33' ? false : true)
            .key('GridItemStyle_PLAIN_' + value1 + value2)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap('8vp')
      .rowsGap('8vp')
      .width('90%')
      .height(300)
      .layoutDirection(this.gridDirection)
      .editMode(this.editMode)
      .multiSelectable(this.multiSelectable)
      .padding('5vp')
      .key('Grid_GridItemStyle_PLAIN')

      Grid() {
        GridItem({style: null}) {
          Text('11').fontSize(25).width('100%').height('100%')
        }
        .key('GridItemStyle_EXCEPTION_NULL')

        GridItem({style: undefined}) {
          Text('11').fontSize(25).width('100%').height('100%')
        }
        .key('GridItemStyle_EXCEPTION_UNDEFINED')

        GridItem({style: -1}) {
          Text('11').fontSize(25).width('100%').height('100%')
        }
        .key('GridItemStyle_EXCEPTION_MINUS_ONE')

        GridItem({style: 2}) {
          Text('11').fontSize(25).width('100%').height('100%')
        }
        .key('GridItemStyle_EXCEPTION_TWO')
      }
      .columnsGap('8vp')
      .rowsGap('8vp')
      .width('90%')
      .height(300)
      .layoutDirection(this.gridDirection)
      .editMode(this.editMode)
      .multiSelectable(this.multiSelectable)
      .padding('5vp')
      .key('Grid_GridItemStyle_EXCEPTION')
      
      Grid() {
        ForEach(this.num, (value1: string) => {
          ForEach(this.num, (value2: string) => {
            GridItem() {
              Text(value1+value2)
                .fontSize(25)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .border({width: 1})
            .borderStyle(BorderStyle.Dashed)
            .selectable(this.itemSelectable)
            .enabled((value1+value2)=='32' 
              || (value1+value2)=='33' ? false : true)
            .key('GridItem_VALUE_NOT_SET_' + value1 + value2)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap('8vp')
      .rowsGap('8vp')
      .width('90%')
      .height(300)
      .layoutDirection(this.gridDirection)
      .editMode(this.editMode)
      .multiSelectable(this.multiSelectable)
      .padding('5vp')
      .key('Grid_GridItem_VALUE_NOT_SET')

      Grid() {
        GridItem({}) {
          Text('11').fontSize(25).width('100%').height('100%')
        }
        .key('GridItem_value_empty')

        GridItem(null) {
          Text('11').fontSize(25).width('100%').height('100%')
        }
        .key('GridItem_value_null')

        GridItem(undefined) {
          Text('11').fontSize(25).width('100%').height('100%')
        }
        .key('GridItem_value_undefined')

      }
      .columnsGap('8vp')
      .rowsGap('8vp')
      .width('90%')
      .height(300)
      .layoutDirection(this.gridDirection)
      .editMode(this.editMode)
      .multiSelectable(this.multiSelectable)
      .padding('5vp')
      .key('Grid_GridItemStyle_VALUE')

    }.width('100%').margin({ top: 5 })
  }
}
