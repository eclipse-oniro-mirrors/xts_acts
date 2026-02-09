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

import { OnPermissionRequestEvent, Text, PermissionRequest, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { Utils } from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'
import deviceInfo from '@ohos.deviceInfo';
import { canIUse } from '@internal.full.global'
import { BusinessError } from '@ohos.base'
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import PermissionsUtils from '../../src/test/PermissionsUtils.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { expect } from '../../../hypium/index';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

@Entry
@Component
struct WebOnPermissionRequest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State flag: boolean = false
  @State deny: boolean = false
  @State grant: boolean = false
  @State userAgentPC:string = '';
  permissionRequest: PermissionRequest | null = null
  @State denyResult: string = '';
  @State grantResult: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
  }

  onPageHide() {
    events_emitter.off(10)
  }

  build() {
    Row() {
      Column() {
        Button('Deny')
          .key('Deny')
          .focusable(true)
          .onFocus(() => {
            console.log('onFocus==>')
          })
          .onBlur(() => {
            console.log('onBlur==>')
          })
          .onClick((e: ClickEvent) => {
            console.info('PermissionRequest => deny')
            this.deny = true;
            this.grant = false;
          })

        Button('Grant')
          .key('Grant')
          .focusable(true)
          .onFocus(() => {
            console.log('onFocus==>')
          })
          .onBlur(() => {
            console.log('onBlur==>')
          })
          .onClick((e: ClickEvent) => {
            console.info('PermissionRequest => grant')
            this.grant = true;
            this.deny = false;
          })

        Web({ src: 'resource://rawfile/PermissionRequest.html', controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .onPermissionRequest((event: OnPermissionRequestEvent): void => {
            console.info('Entry onPermissionRequest')
            if (event) {
              console.info('onPermissionRequest ====>' + event.request.getOrigin())
              if (this.deny) {
                console.log('this.deny: ', this.deny)
                try {
                  event.request.deny()
                  this.denyResult = 'deny';
                  console.log('denySuccess')
                } catch (error) {
                  this.denyResult = ' ';
                  console.log('denyError')
                }
              }
              if (this.grant) {
                console.log('this.grant: ', this.grant)
                event.request.grant(event.request.getAccessibleResource());
                this.grantResult = 'grant';
                console.log('grantSuccess')
              }
            }
          })

        Text(this.denyResult).id('deny_result');
        Text(this.grantResult).id('grant_result');
      }
      .width('100%')
    }
    .height('100%')
  }
}