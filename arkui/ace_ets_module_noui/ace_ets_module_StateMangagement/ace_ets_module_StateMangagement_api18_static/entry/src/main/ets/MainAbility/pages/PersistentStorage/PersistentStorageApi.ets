'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Button, ClickEvent, Column, Component, Entry, PersistentStorage, Text, StorageLink, Row } from '@kit.ArkUI';
 
@Entry
@Component
struct PersistentStorageApi {
  @StorageLink('persistPropKey') persistPropKey: number = 0;
  @StorageLink('persistPropsKey1') persistPropsKey1: string = 'default1';
  @StorageLink('persistPropsKey2') persistPropsKey2: boolean = false;
  @StorageLink('deletePropKey') deletePropKey: number = 100;
  @StorageLink('keysProp1') keysProp1: number = 1;
  @StorageLink('keysProp2') keysProp2: number = 2;
  @StorageLink('keysResult') keysResult: string = '';
 
  static {
    PersistentStorage.persistProp<number>('persistPropKey', 47);
    PersistentStorage.persistProps([{ key: 'persistPropsKey1', defaultValue: 'value1' },{ key: 'persistPropsKey2', defaultValue: true }]);
    PersistentStorage.persistProp<number>('deletePropKey', 100);
    PersistentStorage.persistProp<number>('keysProp1', 1);
    PersistentStorage.persistProp<number>('keysProp2', 2);
  }
 
  build() {
    Column() {
      Text(`persistPropValue: ${this.persistPropKey}`)
        .id('text_persist_prop')
        .height('5%')
 
      Text(`persistPropsValue1: ${this.persistPropsKey1}`)
        .id('text_persist_props_1')
        .height('5%')
 
      Text(`persistPropsValue2: ${this.persistPropsKey2}`)
        .id('text_persist_props_2')
        .height('5%')
 
      Text(`deletePropValue: ${this.deletePropKey}`)
        .id('text_delete_prop')
        .height('5%')
 
      Text(`keysResult: ${this.keysResult}`)
        .id('text_keys_result')
        .height('5%')
 
      Row() {
        Button('Increase')
          .id('button_increase')
          .height('5%')
          .onClick((e: ClickEvent) => {
            this.persistPropKey += 1;
          })
 
        Button('Delete')
          .id('button_delete')
          .height('5%')
          .onClick((e: ClickEvent) => {
            PersistentStorage.deleteProp('deletePropKey');
          })
      }
 
      Button('GetKeys')
        .id('button_get_keys')
        .height('5%')
        .onClick((e: ClickEvent) => {
          let keys = PersistentStorage.keys();
          this.keysResult = keys.join(',');
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}