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
import emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Environment, Link, PersistentStorage, State, StorageLink } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import Log from '../../common/Log';
import { RecordData } from '@ohos.base';


Environment.envProp("accessibilityEnabled", "default")
PersistentStorage.persistProp("highScore", 0)
const TAG = 'ets_apiLack_add';

@Entry
@Component
struct Common_ts_ets_apiStaticClear {
  @StorageLink('varA') varA: number = 2
  @StorageLink('highScore') highScore: number = 0
  private label: string = 'count'

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear Common_ts_ets_apiStaticClear start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear Common_ts_ets_apiStaticClear end`)
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    } as FlexOptions) {

      Text(`${this.label}: ${this.varA}`)
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
      .
      lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("labelA")
        .onClick((e: ClickEvent) => {
          let varA = AppStorage.get<number>('varA')
          if (varA) {
            AppStorage.setOrCreate<number>('varA', varA + 1)
          }
        })

      Text("common_ts_ets_api-StaticClear")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
      .
      lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("staticClearText")
        .onClick((e: ClickEvent) => {
          AppStorage.clear()
        })

      Text("common_ts_ets_api-EnvProp")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
      .
      lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("EnvPropText")
        .onClick((e: ClickEvent) => {
          let enable: boolean | null | undefined = AppStorage.get("accessibilityEnabled");
          try {
            let backData: emitter.EventData = {
              data: {
                "Result": (enable != null)
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 60231,
              priority: emitter.EventPriority.LOW
            }
            console.info("PersistProp start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("PersistProp emit action state err: " + JSON.stringify((err as Error)?.message))
          }

        })

      Text(`common_ts_ets_api-PersistProp : ${this.highScore}`)
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
      .
      lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("PersistPropText")
        .onClick((e: ClickEvent) => {
          this.highScore = this.highScore + 1
          try {
            let backData: emitter.EventData = {
              data: {
                "Score": "Score"
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 60230,
              priority: emitter.EventPriority.LOW
            }
            console.info("PersistProp start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("PersistProp emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
      Text("common_ts_ets_api-clear")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
      .
      lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("staticClearText")
        .onClick((e: ClickEvent) => {
          AppStorage.clear()
        })
    }.width("100%").height("100%")
  }
}

