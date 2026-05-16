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
import { Button, ClickEvent, Column, Component, Entry, PersistenceV2, Text, Local, ObservedV2, Trace, ComponentV2, Row } from '@kit.ArkUI';
 
@ObservedV2
export class Person {
  @Trace public userName: string = 'John';
  @Trace public userId: number = 1;
}
 
@ObservedV2
export class Person2 {
  @Trace public userName: string = 'Jane';
  @Trace public userId: number = 2;
}
 
@Entry
@ComponentV2
struct PersistenceV2Api {
  @Local person: Person = PersistenceV2.connect<Person>(Class.from<Person>(), 'Person', () => new Person())!;
  @Local person2: Person2 = PersistenceV2.globalConnect<Person2>({
    type: Class.from<Person2>(),
    key: 'Person2',
    defaultCreator: () => new Person2(),
    enableAutoSave: true
  })!;
  @Local keysResult: string = '';
  @Local errorMessage: string = '';
 
  static {
    PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
      console.error(`error key: ${key}, reason: ${reason}, message: ${msg}`);
    });
  }
 
  build() {
    Column() {
      Text(`Connect Value: ${this.person.userName}`)
        .id('text_connect')
        .height('5%')
 
      Text(`GlobalConnect Value: ${this.person2.userName}`)
        .id('text_global_connect')
        .height('5%')
 
      Text(`Keys Result: ${this.keysResult}`)
        .id('text_keys_result')
        .height('5%')
 
      Text(`Error Message: ${this.errorMessage}`)
        .id('text_error_message')
        .height('5%')
 
      Row() {
        Button('Change Person')
          .id('button_change_person')
          .height('5%')
          .onClick((e: ClickEvent) => {
            this.person.userName += 'A';
          })
 
        Button('Save Person')
          .id('button_save_person')
          .height('5%')
          .onClick((e: ClickEvent) => {
            PersistenceV2.save('Person');
          })
      }
 
      Row() {
        Button('Get Keys')
          .id('button_get_keys')
          .height('5%')
          .onClick((e: ClickEvent) => {
            let keys = PersistenceV2.keys();
            this.keysResult = keys.join(',');
          })
 
        Button('Remove')
          .id('button_remove')
          .height('5%')
          .onClick((e: ClickEvent) => {
            PersistenceV2.remove('Person');
          })
      }
 
      Button('Change Person2')
        .id('button_change_person2')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.person2.userName += 'B';
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}