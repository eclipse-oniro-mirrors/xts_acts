'use static';
/**
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
import Configuration from '@system.configuration';
import emitter from '@ohos.events.emitter';
import {
  Entry, Component,
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row,
} from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct promptExample {
  build() {
    Column() {
      Button('click')
        .key('button_c')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e:ClickEvent) => {
          console.info('button is start');
          let localeInfo = Configuration.getLocale();   //在这里died
          console.info('localeInfo result is' + JSON.stringify(localeInfo));
          try {
            let backData: emitter.EventData = {
              data: {
                "COUNTRY": localeInfo.countryOrRegion,
                "DIR": localeInfo.dir
              }  as Record<String,RecordData>
            }
            console.log("backData is" + JSON.stringify(backData.data));
            let backEvent: emitter.InnerEvent = {
              eventId: 78,
              priority: emitter.EventPriority.LOW
            }
            console.info("confituration start to emit action state");
            emitter.emit(backEvent, backData);
          } catch (error){
            console.info("confituration emit action state err: ");
          }
        })
    }
  }
}