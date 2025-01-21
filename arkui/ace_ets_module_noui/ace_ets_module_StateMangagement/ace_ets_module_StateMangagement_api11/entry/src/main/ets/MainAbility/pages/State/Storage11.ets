/**
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
AppStorage.clear()
AppStorage.setOrCreate('PropA', 47);
AppStorage.setOrCreate('LinkA', 47);
let LocalStorage11 = new LocalStorage();
LocalStorage11['PropA'] = 48;

@Entry(LocalStorage11)
@Component
struct Storage11 {
  @StorageLink('PropA') storLink: number = 1;
  @LocalStorageLink('PropA') localStorLink: number = 1;
  @State text: string = ''


  build() {
    Column({ space: 20 }) {

      Text(this.text).key('Storage11Content')
      //link给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
      Button('Link给定的键值key存在').onClick((event: ClickEvent) => {
        this.text = AppStorage.link('PropA').get() + ''
      }).key('Storage11Button1')

      //link给定的键值key不存在，返回undefined
      Button('Link给定的键值key不存在').onClick((event: ClickEvent) => {
        this.text = AppStorage.link('PropCABC') + ''
      }).key('Storage11Button2')

      //setAndLink给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
      Button('SetAndLink key存在').onClick(() => {
        this.text = AppStorage.setAndLink('PropA',5).get() + ''
      }).key('Storage11Button3')

      //setAndLink给定的键值key不存在，初始化新的数据 5
      Button('SetAndLink key不存在').onClick(() => {
        this.text = AppStorage.setAndLink('PropD',5).get() + ''
      }).key('Storage11Button4')

      //prop给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
      Button('Prop给定的键值key存在').onClick((event: ClickEvent) => {
        this.text = AppStorage.prop('PropA').get() + ''
      }).key('Storage11Button5')

      //prop给定的键值不存在，返回undefined
      Button('Prop给定的键值key不存在').onClick((event: ClickEvent) => {
        this.text = AppStorage.prop('PropF') + ''
      }).key('Storage11Button6')

      //setAndProp给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
      Button('SetAndProp key存在').onClick(() => {
        this.text = AppStorage.SetAndProp('PropA',5).get() + ''
      }).key('Storage11Button7')

      //setAndProp给定的键值key不存在，初始化新的数据 5
      Button('setAndProp key不存在').onClick(() => {
        this.text = AppStorage.SetAndProp('PropG',5).get() + ''
      }).key('Storage11Button8')
    }
  }
}