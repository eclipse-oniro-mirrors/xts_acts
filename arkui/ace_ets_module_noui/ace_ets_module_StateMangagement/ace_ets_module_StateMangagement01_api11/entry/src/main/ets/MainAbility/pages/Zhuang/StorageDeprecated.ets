/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


AppStorage.SetOrCreate('ADKey', 'HelloArkUI')
AppStorage.SetOrCreate('ADKey1', 'HelloArkUI')
Environment.envProps([{key: 'languageCode', defaultValue: 'en'}])
Environment.EnvProps([{key: 'languageCodeA', defaultValue: 'en'}])
PersistentStorage.PersistProps([{key: 'ADPersistPropsA', defaultValue: 'HelloPersistPropsA'},
  {key: 'ADPersistPropsAa', defaultValue: 'HelloPersistPropsAa'},
  {key: 'ADPersistPropsAb', defaultValue: 'HelloPersistPropsAb'}])
PersistentStorage.persistProps([{key: 'ADPersistPropsB', defaultValue: 'HelloPersistPropsB'},
  {key: 'ADPersistPropsBa', defaultValue: 'HelloPersistPropsBa'},
  {key: 'ADPersistPropsBb', defaultValue: 'HelloPersistPropsBb'}])
PersistentStorage.PersistProp('ADPersistentStorageA', 'HelloPersistPropA')
PersistentStorage.persistProp('ADPersistentStorageB', 'HelloPersistPropB')

@Entry
@Component
struct StorageDeprecated {
  private deprecatedKey: SubscribedAbstractProperty<string> = AppStorage.Prop('ADKey')
  private environmentKey: SubscribedAbstractProperty<string> = AppStorage.Prop('languageCode')
  @State private isDelete: boolean = false
  @State private isDelKey: boolean = false
  @StorageLink('ADPersistPropsA') aPerA: string = ''
  @StorageLink('ADPersistPropsAb') aPerAb: string = ''
  @StorageLink('ADPersistentStorageA') aPerC: string = ''

  build() {
    Column() {
      if (AppStorage.Has('ADKey')) {
        Text(this.deprecatedKey.get().toString()).height('5%')
          .id('tvDeprecatedGet')
        Button('DeleteAppStorageCreate').height('5%')
          .id('btnDelASKey')
          .onClick(() => {
            this.isDelete = AppStorage.Delete('ADKey1')
            this.isDelKey = AppStorage.Delete('ADKey')
          })
      }
      if (AppStorage.Has('ADKey1')) {
        Text(this.isDelete.toString()).height('5%')
          .id('tvDeprecatedDel')
      }
      if (AppStorage.Has('ADKey')) {
        Text(this.isDelKey.toString()).height('5%')
          .id('tvDeprecatedDel1')
      }
      if (this.environmentKey.get() === 'zh') {
        Text('你好Environment').height('5%')
      } else {
        Text('HelloEnvironment').height('5%')
      }
      Text(this.aPerA).height('5%')
        .id('tvADPersistPropsA')
      Text(this.aPerAb).height('5%')
        .id('tvADPersistPropsAb')
      Text(this.aPerC).height('5%')
        .id('tvADPersistentStorageA')
      Button('DeletePersistentStorageKey').height('5%')
        .id('btnDelPSKey')
        .onClick(() => {
          PersistentStorage.DeleteProp('ADPersistPropsA')
          PersistentStorage.DeleteProp('ADPersistPropsAa')
          PersistentStorage.DeleteProp('ADPersistPropsAb')
          PersistentStorage.DeleteProp('ADPersistentStorageA')
          PersistentStorage.deleteProp('ADPersistPropsB')
          PersistentStorage.deleteProp('ADPersistPropsBa')
          PersistentStorage.deleteProp('ADPersistPropsBb')
          PersistentStorage.deleteProp('ADPersistentStorageB')
        })
    }
    .width('100%')
    .height('100%')
  }
}