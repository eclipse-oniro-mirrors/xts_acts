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

import router from '@ohos.router';
import native from 'libnativerender.so';
import {NodeContent} from '@kit.ArkUI'

@Entry
@Component
export struct CNodePage {
  @State currentStatus: string = 'init';
  @State nodeContent: NodeContent | undefined = new NodeContent();
  @State f: boolean = true;
  @State flag: boolean = false;
  @State initialize_status: number = -1;
  @State finalize_status: number = -1;
  @State removecallback_status: number = -1;
  @State user_data: string = '-';

  build() {
    Column({ space : 2 }) {
      Text(this.f ? 'isAutoInitialized = true' : 'isAutoInitialized = false')
      Row({ space : 5 }) {
        Text(this.initialize_status.toString()).id('xcomponent_initialize_status')
        Text(this.finalize_status.toString()).id('xcomponent_finalize_status')
        Text(this.removecallback_status.toString()).id('xcomponent_removecallback_status')
        Text(this.user_data.toString()).id('xcomponent_user_data')
      }

      Column() {
        if (this.flag) {
          ContentSlot(this.nodeContent)
        }
      }
      .width('80%')
      .height('40%')
      Column() {
        Row() {
          Button('创建CNODE: isAutoInitialized = true')
            .onClick(()=>{
              native.XComponentCreateNativeNode(this.nodeContent, 'auto', this.getUIContext());
              this.f = true
              this.flag = true
            })
            .id('xcomponent_create')
        }.height('10%')

        Row() {
          Button('上树')
            .onClick(()=>{
              native.XComponentAttachToMainTree()
            })
            .width('30%')
            .id('xcomponent_attach')
          Button('下树')
            .onClick(()=>{
              native.XComponentDetachFromMainTree()
            })
            .width('30%')
            .id('xcomponent_detach')
          Button('销毁')
            .onClick(()=>{
              native.XComponentDispose()
            })
            .width('30%')
            .id('xcomponent_dispose')
        }.height('10%')
        Row() {
          Button('Initialize')
            .onClick(()=>{
              this.initialize_status = native.XComponentInitialize()
            })
            .width('30%')
            .id('xcomponent_initialize')
          Button('Finalize')
            .onClick(()=>{
              this.finalize_status = native.XComponentFinalize()
            })
            .width('30%')
            .id('xcomponent_finalize')
          Button('RemoveSurfaceCallback')
            .onClick(()=>{
              this.removecallback_status = native.XComponentRemoveSurfaceCallback()
            })
            .width('30%')
            .id('xcomponent_removecallback')
        }.height('10%')
        Row() {
          Button('SetUserData')
            .onClick(() => {
              native.XComponentSetUserData()
            })
            .width('40%')
            .id('xcomponent_setuserdata')
          Button('GetUserData')
            .onClick(() => {
              this.user_data = native.XComponentGetUserData()
            })
            .width('40%')
            .id('xcomponent_getuserdata')
        }.height('10%')
      }
    }
    .width('100%')
    .height('100%')
  }
}
